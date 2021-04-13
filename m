Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0AA35E48D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 19:05:44 +0200 (CEST)
Received: from localhost ([::1]:58772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWMTv-0001Tr-Qj
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 13:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMQ3-0007Jp-6U; Tue, 13 Apr 2021 13:01:43 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMQ1-0006r9-P5; Tue, 13 Apr 2021 13:01:42 -0400
Received: by mail-wr1-x42e.google.com with SMTP id s7so17049424wru.6;
 Tue, 13 Apr 2021 10:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1X5XjOMRQtIAYRhbGdGWwYFc8Tzv+3JDwJddZF6ch3Y=;
 b=c2rew7GsWMH71IEEG0DJXYWM4x383jWauQCQPZv8kgaysA1Tye7dv1Snzo7bpUc8kW
 N8CxjtfWvwHLPIRn/M1vVkQ1yLL2y7Pob3aGp/aWaQblZKiY6yTIXlfT2c3v3uynOmep
 1gp+TorvYxqi4WylYtViRN24hdx2wXs+sZS0NDlWV3JOBVmkGL14s27MGhIjl8p5hggm
 Msbgf6iR1mV6MvZsW2cAaW6dhs/Nmq/kX24gMOYRPv66Xx/cr6N2JAzG6W/29eIjPij/
 KmcT2SOG7gWlRc7dGUV+XRCv2kJW5NBQFUiXhXkVEfGS0BFBNRtUZnzrEnNz7l6ZGpkZ
 1Z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1X5XjOMRQtIAYRhbGdGWwYFc8Tzv+3JDwJddZF6ch3Y=;
 b=haSlGRF82MmvCaEl58I3KxdaEuyzJLcaZvCesf9gKS9YHc47sAlCaY3/pPBkcxJdFl
 eFfvNmc75lwgCPzstsYpmDuWBaK2n2V9OSsf62EO2cGiEkVw624TSQFF9MUSVssINvPW
 GLEy/2Av2YJnyvkKV/ZjEXOQ/PNKbCnR0kyde8EGbAy3Z3jSMY9Uzp+S6UKarQM24erW
 qsp5OGx/DElfyjHfp8cyXZLbkZjKz9JQSq3ZuGaTCXeFrEso5a0rSNMzuKmmXelAubvo
 kGxgXd11biCv/NWQx59hADSIpzBOfvZP2vbP1ineAyYybIkJb58x+7fkAKIKUXOPouUg
 z51Q==
X-Gm-Message-State: AOAM530XbFs1p5opJfCXoWdE+7jB+e0s+QpQO2cOOgMkG8WxjHPVzf1C
 1/IFnimjO5E9QnuCiKhFrwVnQubCoOA=
X-Google-Smtp-Source: ABdhPJz4uwPSx1nVZ4w8Sj1p0SWP4XXozWiNdI6YKgBi1a3TMT8c9wSRXNSoFWg+4xCIeXdTCycVRw==
X-Received: by 2002:a05:6000:12c5:: with SMTP id
 l5mr27021562wrx.84.1618333299900; 
 Tue, 13 Apr 2021 10:01:39 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x14sm20321920wrw.13.2021.04.13.10.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 10:01:39 -0700 (PDT)
Subject: Re: [PATCH 07/13] target/arm: Make functions used by translate-vfp
 global
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <16651ccc-4adf-d891-f459-6ac2d01d4a18@amsat.org>
Date: Tue, 13 Apr 2021 19:01:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 6:07 PM, Peter Maydell wrote:
> Make the remaining functions which are needed by translate-vfp.c.inc
> global.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-a32.h | 32 ++++++++++++++++++++++++++++++++
>  target/arm/translate.c     | 37 ++++++-------------------------------
>  2 files changed, 38 insertions(+), 31 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

