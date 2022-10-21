Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9797A6073DF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:20:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloCL-0001MJ-Dd
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:20:13 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnyd-0006sz-TP
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olnxg-0006Wr-4h
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:05:13 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olnxd-0006ug-EZ
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:05:02 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a14so973181wru.5
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 02:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y7UgkPpVzTuScWF5Q96hwc28pMPHkRMxjYk8/0j1FrI=;
 b=zT9svUu7elHRGluminfWonbfuDstvLNYfoJsMttme5Oacylsz/6UfM0cjYxOUx/9e/
 SLiZBeebNscTLi5JKp/3p7jhE0tUp1W1zyM+fWucfTdoEEjAblgKznRQgXCMonPPRo5v
 viM8XCutW8U4uEYTX9K8jjU51CNtfiBPfGuFkkI7UqvwCYljUMDn7nu/lAkzFdB/sLvh
 MAoyGIRCd15rljP/GPYy4v9JTaMZKoHZqrE6ou6IaZZ6g9UoEXrZSkgjKzI4uoU07qn3
 42LeMYVsqptXlNEJ9hpgE/s5M80vt8ZtV+9ZPctiwBhXVmDc4ZBb5HahoCnIEAV/WAcI
 jqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y7UgkPpVzTuScWF5Q96hwc28pMPHkRMxjYk8/0j1FrI=;
 b=rcplI51l0JnWqc4qEjGaa99wJ90dU/KTDm8ww07eRwzDS4yrGfuCvBlEmN9SPVWpDL
 Xq4bmn/YalI+HA12gQzlXbaeLUuR1Fhab1Bd4mAmvvm9AelwPV6p5Qbsd1JNZBR8xKrd
 bCkPjkSF33QS3hov/zbsJKpNubSTwsrq6dhAbF/b8ZTjul1cEiBFPOrz218ehFlNHAgg
 AWQf5OXYO0BnYI7K6xi/kceBeyfpugKZJ7phEDTiJdWxeiJtdaJMeNRUv82g4nncqeJD
 BGlJ7ZF4XtqolWDHbpiE/1WKxErtjj1PRhkPUCUjK6tbbwX2thGWMmG/CVS4qsyqMAiR
 9F3Q==
X-Gm-Message-State: ACrzQf2n87WuB2KLQQq/okVLDq7ruMNYAHX/1U2a/S96+mH8MBiYnBAb
 6YIAa5V+XUJ/fApE9q/jWmXvbA==
X-Google-Smtp-Source: AMsMyM5Rn0lOzOp8MPuN+SXnUVmT3b3rSGOdjesNZy5boLelVPOgo8XiBA+IH6IYNmqc6kKCFE15Zw==
X-Received: by 2002:adf:ed91:0:b0:22e:4f88:a9fc with SMTP id
 c17-20020adfed91000000b0022e4f88a9fcmr10930385wro.669.1666343097128; 
 Fri, 21 Oct 2022 02:04:57 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a5d6acc000000b0022ae0965a8asm17972793wrw.24.2022.10.21.02.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 02:04:56 -0700 (PDT)
Message-ID: <cb274017-85af-c603-778f-f2017e59e1d4@linaro.org>
Date: Fri, 21 Oct 2022 11:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: add qemu_fdt_setprop_strings
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me,
 peter.maydell@linaro.org, qemu-riscv@nongnu.org
References: <20221021055808.342055-1-qemu@ben.fluff.org>
 <20221021070047.225ngzlqqwsvgbqw@kamzik>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021070047.225ngzlqqwsvgbqw@kamzik>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 21/10/22 09:00, Andrew Jones wrote:
> On Fri, Oct 21, 2022 at 06:58:02AM +0100, Ben Dooks wrote:
>> Add a qemu_fdt_setprop_strings to set a string array into a device-tree.
>>
>> Only minor updates from v4 to fix a couple of minor patch issues.
> 
> Please see the comments I made on patch 1 of the v4 series, they should
> be addressed. Also, I'm pretty sure I gave r-b's on most, or the rest,
> of the series, but I don't see those here in v5. And, please CC previous
> reviewers when sending out new versions. Finally, why not generate this
> cover letter with git-format-patch?

Or git-publish:

https://github.com/stefanha/git-publish


