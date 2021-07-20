Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74FA3CF1C9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 04:05:16 +0200 (CEST)
Received: from localhost ([::1]:52906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5f8F-0002t1-DA
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 22:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5f7C-0002Cj-M0
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 22:04:10 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5f7B-0008GE-5n
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 22:04:10 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso1564700pjp.5
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 19:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6Ec1NjNdZiGgKpHrm/m/ag5hbT6aSQYVV+g1jqJ6H0E=;
 b=BZ4+oh8v+UVh5bLv8uCSiCBXTeJ+L0cPNzLy7jMeU8KF+AslxWe7yKdqRskrvyTg+d
 a6V5AiaVgAxkkeJWFPQpN9bSim5y/m/voi9J0DUGPhgArcj4KpZhNKQwIc/DFmne0AYX
 jA+QWPu5BDnAhMyo9NYGwZH96jJSZvkTWz/AQWAGFelrsUGGB1T1sSYo8n0Hf/GSwsCO
 eD+i6zFUfus8uoAE09x450AFzOkqvexG81bEvC1JKFZZcPncBjT2QEfwuonTTKOQi5mz
 gWCx4fohJh2m8zebkoslqq66+Va+5lBS4e4++sIFkVdcytIwh/aBYzUqs6IX7QzAU4Vn
 SAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Ec1NjNdZiGgKpHrm/m/ag5hbT6aSQYVV+g1jqJ6H0E=;
 b=EBCMg4Ssus7h4A9IU96aY5fmfE4cId7kGC15ZiBgZc+tSaQP6soGUPPvZezNoDSOYp
 gFRp3QaK/pht0xYI8yRslqjsL+QPIHOVhtsqWldaWauLUi1URR1jupQJ9UGPYd/agFqb
 f8lXDpmKYVoYZ4eAZAvB/sMzzQGRxZxa+ap+fEpTdIuznpPnd0P+CkThWcOqNn4os1EA
 tAIPBthywxLDEhl+5uC+hzx6qb+whhigGt3uSA5nDRvviOkYn/S+5hBcet19Gm75iSP0
 6s8ZujAxu8UERBS9Zpig5Z1nFx3dTVTNuNZlrxi/m6mFZAF5JB+bcwFOJdWCy/xRes5h
 xcew==
X-Gm-Message-State: AOAM530H4geJOaQgmdC8nvOGgD68RX6GaQtUL3ZSZPQYjbfq9584qKeO
 rp6hTikCWO2gxGDekKXHuzfSIQ==
X-Google-Smtp-Source: ABdhPJxw5a7J0+C5HSrUiaaXIMx12KbxnWp8Ga32fVaj0kQToQ/b2SboZmnM4PmwblHTUEKKwEkYlA==
X-Received: by 2002:a17:90a:aa8e:: with SMTP id
 l14mr27732906pjq.195.1626746647189; 
 Mon, 19 Jul 2021 19:04:07 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id c5sm21904377pfn.144.2021.07.19.19.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 19:04:06 -0700 (PDT)
Subject: Re: [PATCH for-6.1 v5 00/15] tcg: breakpoint reorg
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210720011800.483966-1-richard.henderson@linaro.org>
Message-ID: <a3133895-cdf7-529b-d199-28321ab68d79@linaro.org>
Date: Mon, 19 Jul 2021 16:04:03 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720011800.483966-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/21 3:17 PM, Richard Henderson wrote:
> Patches lacking review are all new:
>    03-target-alpha-Drop-goto_tb-path-in-gen_call_pal.patch
>    08-hw-core-Introduce-TCGCPUOps.debug_check_breakpoin.patch
>    09-target-arm-Implement-debug_check_breakpoint.patch
>    10-target-i386-Implement-debug_check_breakpoint.patch
>    11-accel-tcg-Merge-tb_find-into-its-only-caller.patch
>    12-accel-tcg-Move-breakpoint-recognition-outside-tra.patch
>    13-accel-tcg-Remove-TranslatorOps.breakpoint_check.patch
>    15-accel-tcg-Record-singlestep_enabled-in-tb-cflags.patch

... and then there's a bit of code in translate/avr that's a bit odd:

     /*
      * This is due to some strange GDB behavior
      * Let's assume main has address 0x100:
      * b main   - sets breakpoint at address 0x00000100 (code)
      * b *0x100 - sets breakpoint at address 0x00800100 (data)
      *
      * The translator driver has already taken care of the code pointer.
      */
     if (!ctx->base.singlestep_enabled &&
         cpu_breakpoint_test(cs, OFFSET_DATA + ctx->base.pc_next, BP_ANY)) {
         gen_breakpoint(ctx);
         return;
     }

I guess the thing to do is to allow the address to be frobbed in cpu_breakpoint_insert, so 
that we squash this phantom address early.


r~

