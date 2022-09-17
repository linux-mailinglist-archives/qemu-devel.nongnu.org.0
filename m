Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFA15BBA79
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 22:56:25 +0200 (CEST)
Received: from localhost ([::1]:59470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZerQ-0005Ya-49
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 16:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZeq8-00046k-Ta
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 16:55:04 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZeq7-00011M-C1
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 16:55:04 -0400
Received: by mail-ej1-x632.google.com with SMTP id l14so56530972eja.7
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 13:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=A7KuXsBWHS14s3uK3ec+DPAA5QXdMBqNKEdfQuKPomI=;
 b=HEddFn5k/J/S+ixLr/rmKcRnD7mDRGOgSj7toNT8nYpFYrXMp9jeJdB+5XtRO8Q+xd
 k5N86+H112te4yICsR0iVgkQdzYy5NO6Paa0ep+ZF3wn6cgC50DEhGJK8l9HrG1K1X30
 SvioQstJXkQ6PxJIXn92GWJ3N9qvnpWGcgWLHYmhcnmYlz+Nw8WxaUqP1Vr8x2B/Vg0Q
 sTpj88BVcAOpo13mlfXaSgDGhRPd42bDrJTikbEtjgtq2y8MDSHbrVt8q0R2oojHkMGk
 ma+CCNAlFiGSz0Zq+Lzxq0dtOhs+u43AI69bufCX4re7DySiqaMtTZJGUiduB/6gbeal
 Y+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=A7KuXsBWHS14s3uK3ec+DPAA5QXdMBqNKEdfQuKPomI=;
 b=dL9whktz5gQkSfe0o4U0cKn7s7JS43IbunFAtFh0SLlLvYz2hh8T7iSL/j42bq5t7U
 pXvsukq6cWQSddXyyKL1jTHGtFyL9y1R+nQ/udzP4MHhRgwCpCqoiCGWTssH/QDt3UC2
 IPiPNalvzUiES0WE8ynG9umj9Ybxlh9Ea6BX/TJFCWt3JvRjOxYJDzqWVV7ls8Kk3w5v
 1jUi+c0LNK3lVSzwrIVEB3JmIU738YqI6Wm4p3DEmtUgbTdesZFcxw4Ax5JfNAKDVPMl
 xSn4+QlsMi4TkTtQjc/2LYPwQxASgt6Z/a4W7Fa8y+cSIB8KNlS0eS0W/9qIgpHq7wdX
 G0uQ==
X-Gm-Message-State: ACrzQf3+E9l1eifaebA3v8Yes3gNKe4NREbCX6g+hpyoO2BkiPUDskLy
 lpLYZox9tLYC2h+zLKilLnv3dw==
X-Google-Smtp-Source: AMsMyM5yI4CZ2J6NXfMdjuCdSOm/EFzeDj03K9V3zTVvmT60jssdRTsNiuJAro3lSfwPEAhi4QBHvA==
X-Received: by 2002:a17:907:783:b0:76e:f290:8b5 with SMTP id
 xd3-20020a170907078300b0076ef29008b5mr8002250ejb.395.1663448101572; 
 Sat, 17 Sep 2022 13:55:01 -0700 (PDT)
Received: from [192.168.1.176] ([81.0.216.218])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a17090606cf00b00780a26edfcesm3072101ejb.60.2022.09.17.13.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 13:55:01 -0700 (PDT)
Message-ID: <ab521627-1d25-98d8-55d2-be7e03a813a6@linaro.org>
Date: Sat, 17 Sep 2022 22:54:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Remove unused MAX_IDE_BUS define
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: deller@gmx.de, chenhuacai@kernel.org, f4bug@amsat.org,
 jiaxun.yang@flygoat.com, aurelien@aurel32.net, hpoussin@reactos.org,
 mark.cave-ayland@ilande.co.uk
References: <20220917115136.A32EF746E06@zero.eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220917115136.A32EF746E06@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.529,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/17/22 13:51, BALATON Zoltan wrote:
> Several machines have an unused MAX_IDE_BUS define. Remove it from
> these machines that don't need it.
> 
> Signed-off-by: BALATON Zoltan<balaton@eik.bme.hu>
> ---
>   hw/alpha/dp264.c    | 2 --
>   hw/hppa/machine.c   | 2 --
>   hw/mips/fuloong2e.c | 1 -
>   hw/mips/malta.c     | 2 --
>   hw/ppc/prep.c       | 2 --
>   hw/sparc64/sun4u.c  | 1 -
>   6 files changed, 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

