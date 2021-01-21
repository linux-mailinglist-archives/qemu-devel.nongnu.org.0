Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230642FE339
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 07:54:08 +0100 (CET)
Received: from localhost ([::1]:32900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Tr4-0006ty-Nx
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 01:54:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2TqB-0006Up-1x
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 01:53:11 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2Tq9-0007a4-C7
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 01:53:10 -0500
Received: by mail-pg1-x52f.google.com with SMTP id n7so774989pgg.2
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 22:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qitMMmuwdMzh7eZB06MpPKUuxSssbCPzO7nAkzU7aAc=;
 b=KIOyEgN+I6Fj7SKv42pLpoeiMkzQSK1WKrJehpHnLTiDmDhK+iODkj+QIOxOAxHbaI
 d3dVn4GuZq/Sq1WSyafl5JlK5CBxflpfyyKA38yhFySaLwje6y8U75smyehkWEBlVk/c
 DZvDY0NMK+pM6MXE8/fFx1+73jgZ9UrkrTC9VcHT3oFhy5YCv+q0BvT8b0wTBfna5zni
 RHDLXwnmUSk8i/YlQNDrd5FgU3l6GnwES+77WBHCNsIW+Mg8LGuKS+o+TpN8bE0d9PVk
 F0JB8nbHGpBMSBBb1wiHyusbkDzQzbkOdhW8Eb+A492rb43ytU5KByTxh8ExCFsgj5VP
 SBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qitMMmuwdMzh7eZB06MpPKUuxSssbCPzO7nAkzU7aAc=;
 b=aIWGgTfaAvqQtN8kph5PbQ3GAyJF8nXcsoFoBR9h0ovn7pginyny2r+w2tbZT6CgSY
 W/HBZzw8MftGoAjxMKEoyEYRIYrq8Zgjr1daVUbEDX5EwYbI+le1Lf7hSNeaDyb0XXeD
 dO5SPlTUNdN+nLtx1Ka7lquFC8A8YHYA+B9RALFqXxpDUSo5acjpmrsAwtoqTz1vnQOb
 5si6N3s7wS2bTVpRDWgQQB4bA+qwOPn/3WIj8B03gCZBcSBIJvMXfMpjb3rLEBQRAcbl
 Wj5y4SN6kgEbWnpjo1zo0VkOMMbSS0I6Ak3CxOZU61V/45XyejuwXzWk4DfDMlQzlwba
 nvTw==
X-Gm-Message-State: AOAM531BIqYOvou6KBj8js/XJTD4sPXGU8/YwfHQUdEyW24d/tTWBA98
 QZ0AL0yzw92M2Y/lSaDJIjfGWA==
X-Google-Smtp-Source: ABdhPJxi4Og19HKL4nb3rc4x3Mi8Q6zC6wfsw3I4ogRCqgYmvy/Fth5GzhaZCb1/aWPepadzhB9QeQ==
X-Received: by 2002:a63:235b:: with SMTP id u27mr12975551pgm.129.1611211987586; 
 Wed, 20 Jan 2021 22:53:07 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id 192sm4335559pfv.209.2021.01.20.22.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 22:53:06 -0800 (PST)
Subject: Re: [RFC PATCH 5/6] accel/tcg: Restrict cpu_io_recompile() from other
 accelerators
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cbde3119-ced1-edcb-f3da-9526fba886e1@linaro.org>
Date: Wed, 20 Jan 2021 20:53:02 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210117164813.4101761-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/21 6:48 AM, Philippe Mathieu-Daudé wrote:
> As cpu_io_recompile() is only called within TCG accelerator
> in cputlb.c, declare it locally.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> RFC because not sure if other accelerator could implement this.
> ---
>  accel/tcg/internal.h    | 2 ++
>  include/exec/exec-all.h | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)

Queued to tcg-next.

r~

