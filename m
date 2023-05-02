Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911CA6F49B0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 20:31:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptuls-0005lu-9B; Tue, 02 May 2023 14:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptulj-0005l4-Rw
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:30:34 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptuld-0000Yk-8c
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:30:28 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-30626f4d74aso2259905f8f.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 11:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683052222; x=1685644222;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9dvlbCKkrIBEPsZPbAYJtSZG2XyiyJxGhv/OdG1nJcw=;
 b=dsawKVE/ollC4MvL6FVD+Bki0cRCcs7jJ5HWdFASfgMd7asAFCySfihmhZOKG5Ogd5
 I+zpvELm3wgoUKhFXqiuCYKAGMdAxEAIcXC7KK1L5RR/sKnTocaVjBuUV4NREOSHM0dE
 o7uBltpMKO1VQmv/as5AabkjL1MpnIWyIxWBR5CvR2Vdf4WsLIJOn2kbqhCYP+PK3dCO
 CCn28258e1QK8WHEp1twj8teeNzoLfp9ZambicEjUHeOeRSn3lwl+kzR8qVQm2FHJMQV
 P1LII9nztbGIBRChVMMm3XYTQhEWkv0Jb/DtlzMTsr7EwCn5lBI844OP28C1fjc6MVve
 /j6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683052222; x=1685644222;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9dvlbCKkrIBEPsZPbAYJtSZG2XyiyJxGhv/OdG1nJcw=;
 b=SX5Z+JbbQt1OSxEgzljisk7nDyIUX2p5u+So68JIE3edGXq2te7XQPDIAbADXdYK9D
 zNQ707zAPxLLnxU0FVT3VnXrv5OrLT3EdT28dv0/xMSB+k2Y4lpDIEB/XarzFATUWOOB
 AgH4RRd8rCP/5GT00ubf12dC8APBe7mhTrJeSb3138HwX7EevRuNvWzNNO3W1BFGtkzQ
 l/9MsI8yLOfxsmS+eaQFYoVt7HAR0xpz1gMV1DcCmRJg19rA4EUX26IjtJdCrS5tw1yD
 9tLQ98TVBilaa0yUpD1YJf7bEU3ye2njpcYs7ej5MjgTCeNy/AwdiIXSvQOBsbMdOfl9
 C2YA==
X-Gm-Message-State: AC+VfDxn6SsMgfUbnlrYnogffTy7yAkp8u81qmXwiMMhEP+mwu8kdRKN
 LD901Mtwu9KeG1n6Yv9XQe5q/A==
X-Google-Smtp-Source: ACHHUZ61uFSbgImNyO2/0dg9gjYmzCWa67GPDiZ2hEpXaKd9/XFGB+zE40AUbYiRiOcJNhI/jj9QmQ==
X-Received: by 2002:a5d:674e:0:b0:306:37a5:447a with SMTP id
 l14-20020a5d674e000000b0030637a5447amr2534278wrw.60.1683052221915; 
 Tue, 02 May 2023 11:30:21 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:ad29:f02c:48a2:269c?
 ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a5d6291000000b002c561805a4csm31563231wru.45.2023.05.02.11.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 11:30:21 -0700 (PDT)
Message-ID: <8fa007cd-151b-4c51-0fed-eda63926943a@linaro.org>
Date: Tue, 2 May 2023 19:30:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL v2 00/34] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20230502144911.2454625-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230502144911.2454625-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/2/23 15:49, Peter Maydell wrote:
> v2 changes: dropped the patch that enables the new 'notcg' CI test:
> it doesn't pass on our aarch64 runner because the CI runner doesn't
> have access to /dev/kvm.
> 
> thanks
> -- PMM
> 
> The following changes since commit 7c18f2d663521f1b31b821a13358ce38075eaf7d:
> 
>    Merge tag 'for-upstream' ofhttps://gitlab.com/bonzini/qemu  into staging (2023-04-29 23:07:17 +0100)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git  tags/pull-target-arm-20230502-2
> 
> for you to fetch changes up to a4ae17e5ec512862bf73e40dfbb1e7db71f2c1e7:
> 
>    hw/net/allwinner-sun8i-emac: Correctly byteswap descriptor fields (2023-05-02 15:47:41 +0100)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * Support building Arm targets with CONFIG_TCG=no (ie KVM only)
>   * hw/net: npcm7xx_emc: set MAC in register space
>   * hw/arm/bcm2835_property: Implement "get command line" message
>   * Deprecate the '-singlestep' command line option in favour of
>     '-one-insn-per-tb' and '-accel one-insn-per-tb=on'
>   * Deprecate 'singlestep' member of QMP StatusInfo struct
>   * docs/about/deprecated.rst: Add "since 7.1" tag to dtb-kaslr-seed deprecation
>   * hw/net/msf2-emac: Don't modify descriptor in-place in emac_store_desc()
>   * raspi, aspeed: Write bootloader code correctly on big-endian hosts
>   * hw/intc/allwinner-a10-pic: Fix bug on big-endian hosts
>   * Fix bug in A32 ERET on big-endian hosts that caused guest crash
>   * hw/sd/allwinner-sdhost: Correctly byteswap descriptor fields
>   * hw/net/allwinner-sun8i-emac: Correctly byteswap descriptor fields

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


