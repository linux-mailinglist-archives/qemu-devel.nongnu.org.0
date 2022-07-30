Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E52585AF3
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 17:19:11 +0200 (CEST)
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHoFC-000186-1p
	for lists+qemu-devel@lfdr.de; Sat, 30 Jul 2022 11:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHoCu-0007k8-Ny
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 11:16:48 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:39871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHoCt-0002FA-4m
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 11:16:48 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q16so6198239pgq.6
 for <qemu-devel@nongnu.org>; Sat, 30 Jul 2022 08:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=xzdK1Pbl+qppPEvTm3RToFjECVWTMjWZM0gfv2jfDXY=;
 b=Y3q2QC7vsTB+8i8sro/ZX3MqC4o+rPHV0Lcwmn+sdNjr/CJD9TTwsK2bwqp7I92s4R
 rZcBEoRYCWHNZxVvBgPD8+/q0lSft//6l8GBdLD9t1hGaLkwYxxiP/LvRQ6B02sUzkU+
 ePTT0stiRAN3r+iBCxfwzXPXU9vMorrJDwCBc8FaGPZZkfVYgdKH17E4mwKwwFX+/1Kh
 3ptUNo1+ErJ4I1/LWUgsLaLgK5ndup+kyHmUeq2sb83Y8fmuBWujlECRcJqxPc2oj1Va
 Y197nAhuQVY1u8vgh7+3qiAYcsMexq/Gbp4Xam7oVU0auWl8bHzngEvQeAOWjZ/KdHc0
 3zmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=xzdK1Pbl+qppPEvTm3RToFjECVWTMjWZM0gfv2jfDXY=;
 b=Il8P7VN9vsPAtrvL/t1qkRIEuoISXCodsyocMxBtEWKy+tYzqqAXeW4+AGSS7BZPnC
 MtTjHudSbGBsRfW//HRpD8cZj6xEqdl0pnTaVFrriKgQL9KlU/RqItz52q8k7i7Ty0Gj
 qnCb0NIAJSLY+VPzsSdoo7O1PPgytexYcznrR4RBl71l8V2vgpNzJVKTNGmjE0zaJYnj
 UBWxYDT4+PWMTQeavU8bz9kaCm3Qju+/RXDCO2dJBSUq0OSeL1ghPQFdswM1hBCxlkWG
 cQgQaUhDbwHgqBPgb3N0YNDXSBw60N8Q5JStRKVJl5iILvnfMMhtqUOje23dycByQkUB
 BTFw==
X-Gm-Message-State: AJIora8bhYcHFN60opfCmkYt3aiwBQimqgg2mzglelbjld5RGLDb9cqb
 FidnC+tMzUcY6XO864G0z4Y1t4JABtFgZw==
X-Google-Smtp-Source: AGRyM1txh/MWXRK36ddYTuLnecNExmnF7BMR00gid0uST41yyoF3lR/HpRVyvVpzAlbkfr/hJw6qMg==
X-Received: by 2002:a05:6a00:1da9:b0:52a:c339:c520 with SMTP id
 z41-20020a056a001da900b0052ac339c520mr8269752pfw.70.1659194205198; 
 Sat, 30 Jul 2022 08:16:45 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:6049:774c:30d7:b3fd?
 ([2602:ae:1549:801:6049:774c:30d7:b3fd])
 by smtp.gmail.com with ESMTPSA id
 t21-20020aa79475000000b005289627ae6asm4939869pfq.187.2022.07.30.08.16.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Jul 2022 08:16:44 -0700 (PDT)
Message-ID: <f780b427-8597-1ea2-ad17-6fdf766ee06c@linaro.org>
Date: Sat, 30 Jul 2022 08:16:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/2] minor loongarch cleanups
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220730003755.54019-1-richard.henderson@linaro.org>
In-Reply-To: <20220730003755.54019-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

On 7/29/22 17:37, Richard Henderson wrote:
> As this is a new target this release, and these patches
> are so minor, I'm applying these as a bug fix.
> 
> r~
> 
> Xiaojuan Yang (2):
>    hw/loongarch: Rename file 'loongson3.XXX' to 'virt.XXX'
>    hw/loongarch: Change macro name 'LS7A_XXX' to 'VIRT_XXX'
> 
>   include/hw/loongarch/virt.h          |  8 ++--
>   include/hw/pci-host/ls7a.h           | 43 ++++++++++-----------
>   hw/loongarch/acpi-build.c            | 18 ++++-----
>   hw/loongarch/{loongson3.c => virt.c} | 56 ++++++++++++++--------------
>   MAINTAINERS                          |  2 +-
>   hw/loongarch/meson.build             |  2 +-
>   target/loongarch/README              |  2 +-
>   7 files changed, 64 insertions(+), 67 deletions(-)
>   rename hw/loongarch/{loongson3.c => virt.c} (93%)
> 

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



