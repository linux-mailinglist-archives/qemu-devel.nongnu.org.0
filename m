Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE3F2F047E
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 01:07:36 +0100 (CET)
Received: from localhost ([::1]:39928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyOGd-0001bq-JF
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 19:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyOFe-00019Y-7c
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 19:06:34 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyOFa-0006aP-Sz
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 19:06:32 -0500
Received: by mail-wr1-x42e.google.com with SMTP id w5so12506784wrm.11
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 16:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lNxxQIEju7S88/jGz4M13F1D9Ic1ybszCX1GRBfBO5Q=;
 b=hQKtX2pu232clz1rLL3jF3+X5VAlyIiLcYU6lkMGbv/gZoJQ+uqlW0RJvSRjn/E2oX
 3/pJijS1lZipWfsoDzfO4bqqKvdP7UI/beUdq0utzUm2R0PA80FSWNp3khsxqd6Ltdjm
 AjM3IFgjp1uZjvrw19bg6R+vymvZP1U2b9m0QvVutHee+pV3LDsDkImk52+niyhMo4r3
 IHzqIk0XoSuq5LcHh7wxEZYpk9abjk94c/+8Run1FBe8l7qbr5KC8dcXjCkEbdPF1KGJ
 j2lKN6KOTyN+JL/VseaHJEuFfHjgSvHjK0mcBxjtc9CHGjbGuKau6qtACs5Z51LAdqrf
 AOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lNxxQIEju7S88/jGz4M13F1D9Ic1ybszCX1GRBfBO5Q=;
 b=X+eyYGyFLqYRdLUmwpkrHVYgn2dNwnd741Ih1fx5uXN8X/mr2XFmFGHNreM2UuwqtL
 NVVoRUd5n9TTaKKgHCQ+dkFkqG4HTa7XE0Kcff2lZNk74BVvqBNh/sRNd0kpHGvMvxG5
 IQhDPbs8kiHuIfrCY1zd4JCXD4DUmcpOWtXaC4P50j420hmdKHx8fKD7CTf3ZOsf/C+r
 BuP3PqB69NuHMcMJXnKt/wcqOANAZmY9tS80lXMedfmi1YyZaHYyb5fx9YtS8NUOaOtt
 GMGKMZzs1bkKn/BCZTwg+Iu9zEHprJzOFkRS/yw5pY6xg92SPNTGl/ONNwlJUneV7SRn
 XR/w==
X-Gm-Message-State: AOAM532VIzqrBmUiAMg4FqLKlFzFh5X2rE9VQ+Id0wgw0rFv6oVHNNrW
 5h17zVSsP7VqHCNIh298wHY=
X-Google-Smtp-Source: ABdhPJySOsTBd4BYdP2qm148jYpUrN4QHwM0AZVZZ2oDtcGiLx01XIPtfSfjMGPIwfLUV+36Gsw15g==
X-Received: by 2002:adf:e84f:: with SMTP id d15mr10033646wrn.245.1610237188559; 
 Sat, 09 Jan 2021 16:06:28 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id y6sm17244343wmg.39.2021.01.09.16.06.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Jan 2021 16:06:27 -0800 (PST)
Subject: Re: [PATCH v2 01/13] vt82c686: Move superio memory region to
 SuperIOConfig struct
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <dc3c4e7632716ca73c10506bd02ee93b39c28705.1610223397.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c764d3ba-7376-010c-0538-edc534793cf1@amsat.org>
Date: Sun, 10 Jan 2021 01:06:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <dc3c4e7632716ca73c10506bd02ee93b39c28705.1610223397.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.255,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/21 9:16 PM, BALATON Zoltan wrote:
> The superio memory region holds the io space index/data registers used
> to access the superio config registers that are implemented in struct
> SuperIOConfig. To keep these related things together move the memory
> region to SuperIOConfig and rename it accordingly.
> Also remove the unused "data" member of SuperIOConfig which is not
> needed as we store actual data values in the regs array.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

