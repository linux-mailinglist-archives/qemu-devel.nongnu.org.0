Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287912FF5EA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:33:09 +0100 (CET)
Received: from localhost ([::1]:36414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gdg-0006D7-6K
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2gau-0004j1-KH; Thu, 21 Jan 2021 15:30:18 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:42717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2gas-0008JK-S1; Thu, 21 Jan 2021 15:30:16 -0500
Received: by mail-ed1-x52f.google.com with SMTP id g24so4033643edw.9;
 Thu, 21 Jan 2021 12:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fjpwmmROr2uPaXVHrxB53gZ6I7CkzrjK2iZvLXPSC3o=;
 b=EggsfCnJ2h9eEMQJm3YaDhJGz0bVU7G9ewGGOil5MEP39+8o7FQLF4mkMDpCTofq3p
 frtF0L9ruDb8gJl3DdrAm3jrHuR31Hi1JOeKByxrcp72A0eszIgMLSy3VzKDIkZie0Zn
 zAJ/Dkc8jMMSFg+QiQWwFTBxAeQExvk2Ufp1pkXFmBlM4gIda/6f/+43wqJG1hFsdkcG
 v4F7IdSsJo5WhhipgLda+C0ti+efjorFbvxDLaEoTHG0/izAMEx8Z7Tir6fx9RZcAE2a
 HbSdxkImRbZjC11G/7/A+LxOE2qGnSu9oMAM3T5jhWvrS5+UIKnd3eOK6U9n0SXoBRv0
 slew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fjpwmmROr2uPaXVHrxB53gZ6I7CkzrjK2iZvLXPSC3o=;
 b=DCsoBvmLmQcx5xwtE22vOeniLkECimN/XL5j2AgagIsBCCmGTCNDH+8r35MFKo4KJd
 LIkcR3VARhfGlQ4+I3jwIYLfBmL2qwnbc/rgWrok5fJ/HDuf56OgdpYpYchuRpcg3Omb
 lFyFu2fiCGGVIJkDQcKRUjm9nE9MrPKqRJ+3RdLMWboCyrv0vWuISAgPxMc0Aff4BMFZ
 z0tfNqF5XPM4ckcUlw5Zk55qNtIVQQU8/yskUEd8Az3/opJ0kiee1qzXZ+F/cbMdd38p
 tUICyWUVUIQOeKFIgLPmZVxFRc7+RDU5OAYYb2VdFVGDf2uhdgpFtgvdvIfqI0C5jGdd
 kt+g==
X-Gm-Message-State: AOAM531fsnKBreBAqRR/XmmSlzTMw7GnT4PeA+9P1/ySfDgMZnFwZEgn
 UUS0lei+vd1BTRgKGFkNOWk=
X-Google-Smtp-Source: ABdhPJxXC3j4OXLkJzFXdqqfqWhdnbyBqJBips1foQKpXjmJqCDbnPzsz5/lo/LYgEGqzgep5XBfHQ==
X-Received: by 2002:a50:8757:: with SMTP id 23mr715300edv.294.1611261013355;
 Thu, 21 Jan 2021 12:30:13 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id j23sm3386245edv.45.2021.01.21.12.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 12:30:12 -0800 (PST)
Subject: Re: [PATCH 11/25] hw/arm/armsse: Wire up clocks
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-12-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9554cdbb-e00c-7470-9323-acf24d7b99b1@amsat.org>
Date: Thu, 21 Jan 2021 21:30:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 8:06 PM, Peter Maydell wrote:
> Create two input clocks on the ARMSSE devices, one for the normal
> MAINCLK, and one for the 32KHz S32KCLK, and wire these up to the
> appropriate devices.  The old property-based clock frequency setting
> will remain in place until conversion is complete.
> 
> This is a migration compatibility break for machines mps2-an505,
> mps2-an521, musca-a, musca-b1.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h |  6 ++++++
>  hw/arm/armsse.c         | 17 +++++++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

