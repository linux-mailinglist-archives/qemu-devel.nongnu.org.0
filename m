Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D2851A5E3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 18:46:55 +0200 (CEST)
Received: from localhost ([::1]:35912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmI9O-00058e-Ik
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 12:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmI6J-0002HM-JW
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:43:43 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:42908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmI6H-00084y-Iw
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:43:43 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 s12-20020a0568301e0c00b00605f30530c2so1242414otr.9
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 09:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=b8/z/UNoCjW+f2r62xvILnC/qG/7BuoMbKwBiSuBFLA=;
 b=VoRT25p1rkAi6zqBf4EbHCdEezCtnEwplyeaV3tCysExUunL3aFidLGCjIBD++5VZ5
 jxbhUJO1EkVCNdvnebm5Y4BLnlPwhs6B9q0DdYCERjhHzGxTdbdOiSAjPWk2Z+F+uV2p
 djMxlkSorBK16jvdgOXs7J8f0VM2viA9EGSAuPrNOxdKuhehanuGrfAOhlJZZd9kcRRU
 zMtTVu54rOlxYrV2XCrTEG10DDCU0jl73ChUVo3dSgdLzFK+QmyrnphLByCQT/pKFbAv
 rRtf+trhhXvvFxh7FNIwWeq5feQsAW6Au4ZX/VDy8dtHPR46UNYK8L/IN1Yt701zaBfJ
 ZImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b8/z/UNoCjW+f2r62xvILnC/qG/7BuoMbKwBiSuBFLA=;
 b=hL3ZcsPtXu/cIlPRkr1DDdSO+4WoFBStbZvDa0S0vHRG+uJWU6+r09xoEFHGdZqa0W
 9Cgm6aQ7z+LGvHNNId43vlsZEpISCc5NtMofLznYpCVnHmZYS4iO1L6DUZt1hZroTUJg
 X90zJ4xpIc20x4+skpHwYd7Qu0hHImH81Q37JXwrcn5TJNceQC33zuwmWdEITKOwczNV
 4GzgwARwYuTOQfY19u7CLwh8vwCL0tSpgZ9VPOOqauvwDChGehPm3s+dWrzc5hjoLq68
 LVCbb93R0yvdbA0MJXFuAsxLqzzLZFfB81jiS1sSeXHm/NV8Id24XkHYEAOUT+wgDXPS
 hbjA==
X-Gm-Message-State: AOAM531hQ8mC1GMvR7sZBUMlV29oI2J5A/STG2gMpD5zrDTrMQ2LlrSj
 4trIVTIXd22XSAqGYWuEuxW6lQ==
X-Google-Smtp-Source: ABdhPJwxJSskfnpIYdqoBh651qovnfsyHGhws+Kr8XMH3WoNz3xSr0tDOvjiA/KGI6yC04eYuB0MIg==
X-Received: by 2002:a9d:2928:0:b0:605:f305:b80c with SMTP id
 d37-20020a9d2928000000b00605f305b80cmr7432729otb.290.1651682620462; 
 Wed, 04 May 2022 09:43:40 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1?
 ([2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1])
 by smtp.gmail.com with ESMTPSA id
 8-20020a056870124800b000e686d13888sm8566984oao.34.2022.05.04.09.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:43:39 -0700 (PDT)
Message-ID: <6b268a0b-90fb-85c7-f9fc-b68958ad6cb5@linaro.org>
Date: Wed, 4 May 2022 10:41:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 12/50] hppa: use new CONFIG_HPPA_B160L option instead
 of CONFIG_DINO to build hppa machine
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-13-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-13-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 5/4/22 02:25, Mark Cave-Ayland wrote:
> DINO refers to the GSC-PCI bridge device which will soon be handled separately,
> however the QEMU HPPA machine is actually based upon the HPPA B160L as indicated
> by the Linux kernel dmesg output when booted in qemu-system-hppa and the QEMU
> MAINTAINERS file.
> 
> Update the machine configuration to use CONFIG_HPPA_B160L instead of CONFIG_DINO
> and also update the machine description accordingly.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   configs/devices/hppa-softmmu/default.mak | 2 +-
>   hw/hppa/Kconfig                          | 2 +-
>   hw/hppa/machine.c                        | 2 +-
>   hw/hppa/meson.build                      | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

