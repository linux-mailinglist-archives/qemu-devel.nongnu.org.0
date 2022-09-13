Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F0A5B698A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 10:28:29 +0200 (CEST)
Received: from localhost ([::1]:58222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY1HQ-0001nC-F4
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 04:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY12H-0006xb-Ne
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:12:49 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:45641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY12G-00016v-0N
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:12:49 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so8943709wmb.4
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 01:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=njiK9Q0qTCDSrRMxs8pQaQFWrdNzFSz11cSl2bGgZYw=;
 b=ErEknhjQ4GpM27fKLs+ebX27XMFy/Ph1JI1i+krS4PxSOxdF1EoWMbI7WtaSobmx35
 oSS80HTL+VgzvP6S0tE6RgQm6tH4RkewT1nYZ+jVNntMcOCgNVLBnTVJ2ts1yPYQ7tAb
 VuOWL4A4PMaMzN4RVXV2GQUvHFyw7Y4jmraHdcftOYvmbxD8SC6mvrSAdwBuydEXvl24
 0wNBBwPeyhv5Rxp8swEi1y9SrEQ96i+kZQ372QgfhdApU1QnVaEe5SHtf5+n9KQzc6Jm
 vPdRJgSacevT24rBWr9kbFkTtxaHY1VdzWpR2rDjko8W/RJ9Udn2DOqH/DG9M+9eKfBZ
 J3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=njiK9Q0qTCDSrRMxs8pQaQFWrdNzFSz11cSl2bGgZYw=;
 b=x+bDMh+m+bTpTGlIXWv8I9nU7hPKMK6EI319kfPo3pN7nChDwl/qaudARkvNdTpRSv
 +U55x82Grz3igJmjkpqTNqXLroUZPDpU+PdCZXs+Cz4f4nmQU1N6T1MNVeyS7Aj382Mn
 TvdRtaI4US9BglhwnAAukUmyPELZbca4NKHr9KeQByjshN7z7ILqByOSAi4LFaNGhqMN
 yR3cbVialB6kEs4xOFJxy6PNQN0H9dvCdrEjAV/na6ypTB2CAsfoF8jRCS3+Ze+WisGA
 iUcaDVlm8s+RZqcDKt2PbG09gUp8XNWRR8HrReTK/x8R/w186cC4kx7QTSqvEqkY5izk
 Bfpg==
X-Gm-Message-State: ACgBeo1b5hTeBwirbAH5BoCW/1u+7wxzU2MUYZrUkfVSNY5GVIjLBm+/
 CWj0cSt6XD4xu26JTkG2GC2Rgg==
X-Google-Smtp-Source: AA6agR6S8cSc6ftRiKErldVoYxSMfuUu6D52yYfPxJbIzkPSrEnE9EoP8SkRkuBlU7F9YvcMgj6Klg==
X-Received: by 2002:a05:600c:2191:b0:3b4:868a:aad3 with SMTP id
 e17-20020a05600c219100b003b4868aaad3mr1455370wme.112.1663056766416; 
 Tue, 13 Sep 2022 01:12:46 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a05600c321700b003b47575d304sm11620751wmp.32.2022.09.13.01.12.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 01:12:45 -0700 (PDT)
Message-ID: <8dea16e5-a7d8-aa15-e23e-e03091db9b90@linaro.org>
Date: Tue, 13 Sep 2022 09:12:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 21/24] disas/nanomips: Replace exception handling
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
 <20220912122635.74032-22-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220912122635.74032-22-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/22 13:26, Milica Lazarevic wrote:
> Since there's no support for exception handling in C, the try-catch
> blocks have been deleted, and throw clauses are replaced. When a runtime
> error happens, we're printing out the error message. Disassembling of
> the current instruction interrupts. This behavior is achieved by adding
> sigsetjmp() to discard further disassembling after the error message
> prints and by adding the siglongjmp() function to imitate throwing an
> error. The goal was to maintain the same output as it was.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 100 ++++++++++++++++++++-------------------------
>   1 file changed, 45 insertions(+), 55 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

