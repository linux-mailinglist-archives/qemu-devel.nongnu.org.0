Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909B66B8FA8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 11:21:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc1mk-0008Df-VM; Tue, 14 Mar 2023 06:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc1mj-0008Cy-B0
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 06:21:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc1mg-0005XJ-NA
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 06:21:36 -0400
Received: by mail-wm1-x336.google.com with SMTP id j3so9868456wms.2
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 03:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678789292;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D2k4n721sTHh4MVEmsnF9m20QGHqMqtblaWfyT3DVg0=;
 b=x0X06yWWHiVDc1/3ZshjoWRNjGQWT0JUe2pkW6AOGy0U1sX2OwLCgP6Mw66j3yodxf
 spUekOQumlBxU+XlShI3SDrXhpHWjHTu+cAOj3Fysv9ibHUDyBwkSjZOoFLc1dPnA1b/
 +v3iB2xJ3oJZgjddDMHvOG0r1pT/6kyiY+L0MStshPHghOAkK6KsTj+X8XomzJW/OV1d
 0vOVHcCJEOvRG6ql/AbrKVWX7H/Q0fK3l5vvmBIlF17th9g4/K7bMCNxDcn6gkmHHhe5
 be8Va+6AGd2Il/zScPG1RhnnW6Fb0nsCsOGBc/Zx7qUoxzUdf1+xmWIHb4BkqfMjZM9R
 2CWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678789292;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D2k4n721sTHh4MVEmsnF9m20QGHqMqtblaWfyT3DVg0=;
 b=7AggKYxGNmOamBx0400OEzIZIeZuarEt3Y5NM3/cjGvy1D93AeIURG8tE932lDtSXH
 maSr/qBpyObL/lNtciQao04YPp4LAiZsyVOwHYzOTkMwpTPiZHGddrrQc673vitw7u8w
 BRBtm0WswsHgDqmjX2FoUx2wdCOP8r7kfA+YBIUdC5Zc6kR+RRtBn8lTbDrPb3G8qKWO
 RhBIL0m7+UVmK0S1SvEzRKnpKDehrbdM1aIRFHICIHrOZ5vs569XX4iKl695TgS0DYyi
 MTsqMqRrdui30cV6Qe3Oy9BKtgw/MXpDwbBj3qC8d8wgiKnbXCpTugNm+hQXowgvkhAY
 2Afg==
X-Gm-Message-State: AO0yUKWqGO0ubym36xJnJpl+C83no/cE4ftAhFFTqsyzmravu9IlEOVa
 x5K1fYR6cDbqyFtMhhYdz4dvNw==
X-Google-Smtp-Source: AK7set8cKGHlWctW/kYAnvIvBC8wPDZGPMsmYBHFNLJ2Od6lZHoHsmV6tlhnr8sOPrdqf+xbsxp2mw==
X-Received: by 2002:a05:600c:548a:b0:3df:e21f:d705 with SMTP id
 iv10-20020a05600c548a00b003dfe21fd705mr13647567wmb.28.1678789292634; 
 Tue, 14 Mar 2023 03:21:32 -0700 (PDT)
Received: from [192.168.1.115] (233.red-88-29-167.dynamicip.rima-tde.net.
 [88.29.167.233]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c2cc600b003df5be8987esm2405223wmc.20.2023.03.14.03.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 03:21:32 -0700 (PDT)
Message-ID: <c8b5b1ad-62b2-7271-0852-6ca1ca4d93da@linaro.org>
Date: Tue, 14 Mar 2023 11:21:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/2] tests/qtest/cxl-test: whitespace, line ending
 cleanup
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>,
 Mike Maslenkin <mike.maslenkin@gmail.com>, Dave Jiang <dave.jiang@intel.com>
References: <20230227163157.6621-1-Jonathan.Cameron@huawei.com>
 <20230227163157.6621-2-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227163157.6621-2-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/2/23 17:31, Jonathan Cameron wrote:
> From: Gregory Price <gourry.memverge@gmail.com>
> 
> Defines are starting to exceed line length limits, align them for
> cleanliness before making modifications.
> 
> Signed-off-by: Gregory Price <gregory.price@memverge.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>   tests/qtest/cxl-test.c | 84 +++++++++++++++++++++++-------------------
>   1 file changed, 46 insertions(+), 38 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


