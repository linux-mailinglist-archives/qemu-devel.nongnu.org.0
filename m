Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A3E3B1643
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 10:55:28 +0200 (CEST)
Received: from localhost ([::1]:35880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvyfP-00062F-8T
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 04:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvyd3-0003sK-PR; Wed, 23 Jun 2021 04:53:01 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvyd2-0002A3-5V; Wed, 23 Jun 2021 04:53:01 -0400
Received: by mail-wr1-x429.google.com with SMTP id a13so1682644wrf.10;
 Wed, 23 Jun 2021 01:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/WouY3gh28RdUdeE+bhrPAKghGMloUJCLffSsS+35n4=;
 b=IRd2rqA25XzrO2+Njv7ucSp0HSG3XwTEExPfocmkT7eYmkKHfQta5YRbAar0wvnQl2
 gDmf0QAS0dudOgwvG6PhCLW5PRSkgoMwXiQVTed25Gv/DzpsWrxmr2mY7USrGdHUvkjZ
 f5wnlUF9qRzlKoVueKaITYSLf0tkAkdFGR+gINmDRYJ5QiPGupS/8OavhNYRmcB4FHzH
 Hiw2TaAMTrWdkMCQ4oGUpD/RfsPIYzTc3i5h/rnCrvkM1qVVVR6W9Hh9vhZWVHd6gdjP
 zJ3zPHacABP8LbyQeoCG1DGqHX9t72Fc4rHLosCqHN13roo7YjhHNw67b5htXqbbDoUr
 UYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/WouY3gh28RdUdeE+bhrPAKghGMloUJCLffSsS+35n4=;
 b=SCV1CRf/0m7L7jwf0lvs2I0Kwp9mKrY6OBScbAp7o/k5MFO4uumqJKFVDiVUCd6ko7
 2TMngZSRsup3J3PH1kjNKxrOkCp+4Z09YVRuTgAJ8a5pP21LuucyMtkF9HDwS656SVun
 Q+vDYH0Xg4Xz23F/aqFHwN12ClEDN1c8Tw1deEl8I9ipmJTGBIYaU5cs9CPbrAV8AhqD
 aCyhWT5Pr6vcgWj5RodlSsX//2R/f9RzuEka3oE8vzege5CTfl2C/yS6qAPxkTGB1nSF
 iulr3zLO5nq4vGIDgZHwzIOYTadZQKc67PoRGz1eG6nobVgNu0TYS4ig7yzUGD85UOLa
 RM9w==
X-Gm-Message-State: AOAM5319wigXtzElEKtHpKWZSNO5SzH5Bu0eGX/eyLL2G7vYhUcRQ4q3
 TPILRsgUSg8SOjbvJEeSU+ga61WKM2UwCA==
X-Google-Smtp-Source: ABdhPJwa2EGEA41erFu7zm4MEuXrspXxfyCsGzKVztXDPFc9j1EN9nUbEvmvtqomC7pVXHeAA+DHWw==
X-Received: by 2002:adf:f743:: with SMTP id z3mr9895331wrp.329.1624438377889; 
 Wed, 23 Jun 2021 01:52:57 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e17sm2441391wre.79.2021.06.23.01.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 01:52:57 -0700 (PDT)
Subject: Re: [PATCH] sd: mmc: Fix SET_BLOCK_COUNT command argument
To: Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20210623083004.245894-1-clg@kaod.org>
 <CAEUhbmXMKphSdgE0xMJT2Tzu5okf00SJcskPfK742PwZv-X1RQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <efa3958c-8a08-76f3-a963-8424c660e4e5@amsat.org>
Date: Wed, 23 Jun 2021 10:52:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXMKphSdgE0xMJT2Tzu5okf00SJcskPfK742PwZv-X1RQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/21 10:39 AM, Bin Meng wrote:
> On Wed, Jun 23, 2021 at 4:30 PM Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The number of blocks is defined in the lower bits [15:0]
> 
> I checked the physical spec v8.00 and it says bits [31:0] for CMD23 argument.

Watch out, we only support 1-3:

enum SDPhySpecificationVersion {
    SD_PHY_SPECv1_10_VERS     = 1,
    SD_PHY_SPECv2_00_VERS     = 2,
    SD_PHY_SPECv3_01_VERS     = 3,
};

> 
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  hw/sd/sd.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
> 
> Regards,
> Bin
> 


