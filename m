Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8CE585797
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 02:43:19 +0200 (CEST)
Received: from localhost ([::1]:52396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHaZa-0007kU-9j
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 20:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHaWj-0003Se-Vs
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 20:40:22 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:44745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHaWi-0003bb-Bl
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 20:40:21 -0400
Received: by mail-pl1-x62f.google.com with SMTP id p1so5904090plr.11
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 17:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0+w5cTNrM2/AhvA4iz3G6/OVHQQ//f7o/jF67tUtniY=;
 b=krBzCH5nhlrJlsSuWkZ2FJheq9oxvZfU/Eq58eT906P9pEpNYlTjYH2FonBjIDuUue
 qnXDet8NIoA00oYabNfAZqT3MwcMpTMl1bayTL78AmV6Vyjl83bwWHDmEdokrPHn0N12
 IuGI47a6ZCnXjRHZx21LKQ4io2+JlsWdqWXSdKpnjC8R9IuZiF1+omgXUQ9fFk3X1wOx
 eZKlMIAncr709okejv2Xxe7Q5Xl40aBRMPf2IOmQC3SimPFU6fP/iT94boWvyYm0a+UG
 cz7IBnqxDRkyPRoBz8XorWrOAcOTA++RzxH5zAcdjvAaqnMaVuqUQSlNE+5b+6xsuq8r
 POfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0+w5cTNrM2/AhvA4iz3G6/OVHQQ//f7o/jF67tUtniY=;
 b=jSxBF917ay1sEOqZ0j+0ZOimOE5cG3DNgENvsZyLGYkbf1Tn6ZLh2SfsL0aL46kfUf
 ihExMDHdQHX0w9ywEfNOEOLKKbbnovK8TsnjNL6hWri8burGI9dk/PcJveU8LHc9hFdg
 Tor0gvVar6tDkWMMbjIKcn+KlEQ7wDzea3hRkTULpG4WJj6RNN0hXR3m5kl2B2dxK4P1
 ebEUFSPg+y45t8XFZGH2iMxhY3U6KSMM/Gu9hIwepXDM+S3nK7TuyhyRZ0nuX+2ZhVkQ
 cBApJAmnZjHMTIx5KG+ZO8pwgLDL8vB+YKMRcX+fMvluikEKSz+Cvak3qYdkZB8AHtDD
 +eTA==
X-Gm-Message-State: ACgBeo1ME4BTsO9tKvGQoCtZarRm4kPCulPvGiDphR38Xywz3IMu0gu0
 UqS4do0zHiyul/fVCJirIst5Am6IPOMdhg==
X-Google-Smtp-Source: AA6agR4mfpEwpnNef2i4R0UVmgWGbH0kWUCbvDM0bE+8nvI1xyp8wu2tIYtee+28VJ8WJpfNWZGAYQ==
X-Received: by 2002:a17:90a:2b89:b0:1f2:5860:f9aa with SMTP id
 u9-20020a17090a2b8900b001f25860f9aamr7580749pjd.40.1659141616830; 
 Fri, 29 Jul 2022 17:40:16 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:a427:660:88d4:8559?
 ([2602:ae:1549:801:a427:660:88d4:8559])
 by smtp.gmail.com with ESMTPSA id
 ij14-20020a170902ab4e00b0016cf714d024sm4203470plb.236.2022.07.29.17.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 17:40:16 -0700 (PDT)
Message-ID: <e0e616b6-e8f3-a7d1-305d-4d419073e001@linaro.org>
Date: Fri, 29 Jul 2022 17:40:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 0/2] Change 'loongson3.XXX' file name and 'LS7A_XXX'
 macro name
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220729073018.27037-1-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220729073018.27037-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

On 7/29/22 00:30, Xiaojuan Yang wrote:
> This series change 'loongson3.XXX' file name and 'LS7A_XXX' macro name.
> 
> Changes for v1:
> 1. Rename 'loongson3.c' to 'virt.c' and change the meson.build file.
> 2. Rename 'loongson3.rst' to 'virt.rst'.
> 3. Change macro name 'LS7A_XXX' to 'VIRT_XXX'.
> 
> Xiaojuan Yang (2):
>    hw/loongarch: Rename file 'loongson3.XXX' to 'virt.XXX'
>    hw/loongarch: Change macro name 'LS7A_XXX' to 'VIRT_XXX'

Queued, thanks.

r~

