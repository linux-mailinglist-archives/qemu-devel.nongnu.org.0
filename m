Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B725BB8D1
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 16:42:09 +0200 (CEST)
Received: from localhost ([::1]:41896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZZ1E-0006f6-Ks
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 10:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1oZYzM-00058l-2H
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 10:40:15 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:45633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1oZYzK-0003fy-HH
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 10:40:11 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 d12-20020a05600c3acc00b003b4c12e47f3so1508530wms.4
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 07:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=2jSJ4tYYJRs2UV2xyQIvgWJtNmeFsXQQFPB9vl4R0WU=;
 b=Cf92ibE7PBmne9w00VeEEcRGQeObyCvKI7t1trgaFAS22l91BHWEUsEJhMy30tUm/1
 43yYMQSk5zk5IIUnyM95UTkJnEx2IqFYHOuG5DlMaQr/W/AoQ+KIHMezlDVAWRUFUbEP
 lWQ5/baFx+2U5eZQy30FxPW86BdFnJ2XSO9rVe65Po9xLz0hpeEWEil0aBll9bLYRwJ7
 M6sOVFmofxOCE5p8KqZ9eDU2dyTPRLMsK+8BsoFkV6p2RljcrNYZSYGIZ94D1bUL2eT2
 YDXgZeW0qSO+daui1pLgQsH/ltZ8vCom5YRTDCmXtYE2qecqncv1K6DxxaXwvmz42bkR
 zS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=2jSJ4tYYJRs2UV2xyQIvgWJtNmeFsXQQFPB9vl4R0WU=;
 b=pyHAC6cC5fGIQDR6k9M9ujupSHXr7H/bXLJRvo12CUsw6Q7TGjLhPcx/nIE/33bBok
 Obr1Y/kvvGLnk9lkwGp2c3yNSC+ljITMtHCuKmt92gSkzrK+wwljSTFF2MVmuRLH+P5I
 eHI2VTwneNdDS7mIsUnfcyro8xbwyY83ukGJ/DqGryx1SfKoJGxadJJxbNH0tb2G3rEs
 1Aj5XfzxurCl99lghXbpJQTCCwwXlYsf5PgZBSV0ZgU/wm2YiLRplaNFoovhJieJ8Nrn
 PT7cUYUeWUQ8a06csOwMdokXoROszaf0SrRrA8OhMuwlGPjJ4Zw4DFlrxuK9IHfMqTHI
 WsRg==
X-Gm-Message-State: ACgBeo3MP6QRDwfFTrCg67k03GOQR+E6iGFy/7PMBqQ/0Yl87rzhqlJP
 MvEwMo0FPlqZWi7EPulD69U=
X-Google-Smtp-Source: AA6agR5yvWQm4V10BaZ2oZdkO5/4rt1zchqdAFl91kP/yNpmH+LYLeHrVTmtojJ29SAyeG2QBcu5Ug==
X-Received: by 2002:a05:600c:42c9:b0:3b4:b0c0:d614 with SMTP id
 j9-20020a05600c42c900b003b4b0c0d614mr8553962wme.90.1663425608684; 
 Sat, 17 Sep 2022 07:40:08 -0700 (PDT)
Received: from [192.168.33.3] ([147.235.207.82])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a05600c0a1400b003b4727d199asm6339350wmp.15.2022.09.17.07.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 07:40:08 -0700 (PDT)
Message-ID: <e81d29db-a8b1-0835-9f52-53e1519d5b1f@gmail.com>
Date: Sat, 17 Sep 2022 17:40:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] hw/display: load the correct ROM file for isa-vga
 device
Content-Language: en-US
To: kraxel@redhat.com
Cc: qemu-devel@nongnu.org
References: <20220917143229.115580-1-liavalb@gmail.com>
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <20220917143229.115580-1-liavalb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=liavalb@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-3.529, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 9/17/22 17:32, Liav Albani wrote:

> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index 388e0db6e4..6af94a4a0a 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -29,7 +29,7 @@ blobs = [
>     'bios-microvm.bin',
>     'qboot.rom',
>     'sgabios.bin',
> -  'vgabios.bin',
> +  'vgabios-isavga.bin',
>     'vgabios-cirrus.bin',
Well, it seems like this one doesn't want to be compiled now, so I'll 
need to dive deeper to figure out how to ensure it always produces the 
requested file.
>     'vgabios-stdvga.bin',
>     'vgabios-vmware.bin',

