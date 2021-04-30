Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2794736FFF2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:50:34 +0200 (CEST)
Received: from localhost ([::1]:45078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXHd-0002yy-4M
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcWn2-0007Oi-By
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:18:56 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:41967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcWmu-0008J0-Ej
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:18:49 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso2146021pjn.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=f5vkA8wLGmivGkl92zdZgcM7uzbvY7bbTBQyEwqpBQM=;
 b=Ww1ZVHj7KE5P0UeXJxnJxnVMQy6B3jNdTo5zG/ILFJe21hlHvFAThTpoqNuaTNc6A6
 7DyMVmenWg1qyzRbaZmf7gKX4UjOX9aVDp5bVF9K+n4LICnwfOHkv4V/LvmA1YDFTN9E
 AZ3SZPVQd4QSaNh9bnCUuDh4XzsmY6U8jzFtHZZJD2Ter4+iVC54F12s+5OFyAIlmeYh
 MF/HqjIVNDzNPVASwFfGLJr2deCb+beXksYIH9hGdyOsPJX2UEMg7Fez3uPhVf99NBBv
 EJ/+4QPSpuw1iSOCzRHDjYAn7X7NGINkpWl0rhHGYQ8gH9AN009vmvOanpJ7HZWSiNMN
 57Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f5vkA8wLGmivGkl92zdZgcM7uzbvY7bbTBQyEwqpBQM=;
 b=IskU1JwGGN7nPQ95V12Li9cfHY94vfHc+1d0txVXDuyITTUx6acgGaL8ZOmX101YFl
 R6jxS1u4VDnd+IvcwMaXGiHoAHCPL0+bhvUsz62PabcFCuBCdS1QKZaRa24iSPyrQPPQ
 pHDvHyFWYt8KkR/u6HwUd/B/iVDGhCBS8IUSqhs16BWNn7oz6qAf21cuQzdukTk87atu
 3jeLSfyKsRkz/Tlk6Mrqk2hDLpOzBdW7Wj02zPFQGk9UGAlHpNY9miDbQo+unJ1XKfA1
 6vZWitUbz5AMGgMippw8qoZnFU72Yks0++IMINENxXoxH80QrMYBntkxQQ+3qd8Pt38s
 vV4Q==
X-Gm-Message-State: AOAM5314xByR3tI+VYkyGpVIsMe4wP6PKn9iqeJ518c2zaGbSjSe1+1Z
 UKs6iXjscm6Z3tHJWiqDp/2HmQ3kEzhLqQ==
X-Google-Smtp-Source: ABdhPJwEN71JD5wRe87H5u8TEeiudf8+frdZfFAazD8mpmThRTNLCpZRqFSuThUV8O7Y+8FzrgMZZg==
X-Received: by 2002:a17:90a:2844:: with SMTP id
 p4mr3411012pjf.89.1619803126602; 
 Fri, 30 Apr 2021 10:18:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id s13sm2711394pfd.79.2021.04.30.10.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 10:18:46 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Make WFI a NOP for userspace emulators
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210430162212.825-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c9ee41c0-deb1-28ac-3551-e9e03acfb476@linaro.org>
Date: Fri, 30 Apr 2021 10:18:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430162212.825-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 9:22 AM, Peter Maydell wrote:
> The WFI insn is not system-mode only, though it doesn't usually make
> a huge amount of sense for userspace code to execute it.  Currently
> if you try it in qemu-arm then the helper function will raise an
> EXCP_HLT exception, which is not covered by the switch in cpu_loop()
> and results in an abort:
> 
> qemu: unhandled CPU exception 0x10001 - aborting
> R00=00000001 R01=408003e4 R02=408003ec R03=000102ec
> R04=00010a28 R05=00010158 R06=00087460 R07=00010158
> R08=00000000 R09=00000000 R10=00085b7c R11=408002a4
> R12=408002b8 R13=408002a0 R14=0001057c R15=000102f8
> PSR=60000010 -ZC- A usr32
> qemu:handle_cpu_signal received signal outside vCPU context @ pc=0x7fcbfa4f0a12
> 
> Make the WFI helper function return immediately in the usermode
> emulator. This turns WFI into a NOP, which is OK because:
>   * architecturally "WFI is a NOP" is a permitted implementation
>   * aarch64 Linux kernels use the SCTLR_EL1.nTWI bit to trap
>     userspace WFI and NOP it (though aarch32 kernels currently
>     just let WFI do whatever it would do)
> 
> We could in theory make the translate.c code special case user-mode
> emulation and NOP the insn entirely rather than making the helper
> do nothing, but because no real world code will be trying to
> execute WFI we don't care about efficiency and the helper provides
> a single place where we can make the change rather than having
> to touch multiple places in translate.c and translate-a64.c.
> 
> Fixes:https://bugs.launchpad.net/qemu/+bug/1926759
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/op_helper.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

You could also ifdef this out in translate, in tb_stop for  DISAS_WFI. But 
either way,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

