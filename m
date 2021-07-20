Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98CD3CF94F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:04:45 +0200 (CEST)
Received: from localhost ([::1]:52084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oUO-0007e3-ST
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5oKS-00009j-NH
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:54:28 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5oKR-0006cF-9D
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:54:28 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so1319893wmb.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 04:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MAOffgrFNruHvWxefaPvl0YuHgUJDN/9cl+hYYVD0tE=;
 b=VYyuqvfl84bZ6AdVbjH6LinKzYqOzyMj1byVC2uSTmJ2E7PNYZN5LyYc3uTgMECY+u
 7eBMT9sS14k+tmQPaR4uao00SzgM5SndUeTsikFLEvZgQoZuTtD+2izIthDbzaxwUhIY
 zSA7xt4b66dfHOfOsKzeFi77msB8/8f2diTiX7ISoon+5kXGbDE48haBm77wYgWMRh22
 qBbT4Ss8wWiV2yaiesnDSjbwxR+uQ7et2mST/i2Ch8GvPs7t7qFWGNs7XdyWPBFzbocH
 lhHqxB+CSu2ri2qa2fDlyYWcbmUcfPyJvrJ6CtVx/fG9NkxcaeHlmGbUo4eI+Wof5hsK
 lELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MAOffgrFNruHvWxefaPvl0YuHgUJDN/9cl+hYYVD0tE=;
 b=J6DQ3N7hMYRrdlMKpR5DymxBBg9DZ3NH4aCaxWModi4STjP+Bubhk0oQdzCRuyjT7q
 m1mref5HHJMayarmjVj9I0ns+GcCdW+k0YY4/TtTckr8LzXq1zzShwNeke2wYb3rscRb
 SVCUdcYjIL1YFE4lDkUhykYN2VCYn+CsfHUOITO2OImJZUjtuDqd8BFMkb2O6hxSkoBF
 rCUZm6/PRkLVSX9+1ZPDBlFOD3uCWnqz+TsYLGr2k6C+9hLsPEJNj4ErR7l9C7FAFXnE
 wCFfGiC8gvBovujbVMAGQd5ttOvbRUlRRzk0tZ5pV6vTD3QW8Zo2bLeM1p9GQAfIpkL6
 wx2g==
X-Gm-Message-State: AOAM530UlWM3jHMukeDtAvLkzSI4MFvKepbDAEgtukTmbSjqH61GD/Fm
 28JZvvRGEsiXx99M3JR9c1c=
X-Google-Smtp-Source: ABdhPJxxhGB4aMP1FtgYTiT1f4kDlQ2dCYTd2xGCUw4LRGU4uVSYjDCiRsaygePch8QtI9P7qHCOGQ==
X-Received: by 2002:a7b:c7c5:: with SMTP id z5mr36447594wmk.71.1626782065924; 
 Tue, 20 Jul 2021 04:54:25 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id t6sm23797583wru.75.2021.07.20.04.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 04:54:25 -0700 (PDT)
Subject: Re: [PATCH for-6.1 v5 14/15] accel/tcg: Hoist tb_cflags to a local in
 translator_loop
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210720011800.483966-1-richard.henderson@linaro.org>
 <20210720011800.483966-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0c59f944-7730-c473-2ec1-1fcfc4a991ac@amsat.org>
Date: Tue, 20 Jul 2021 13:54:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720011800.483966-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org,
 mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 3:17 AM, Richard Henderson wrote:
> The access internal to tb_cflags() is atomic.
> Avoid re-reading it as such for the multiple uses.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/translator.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

