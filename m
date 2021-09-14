Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2C640AEE1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:27:37 +0200 (CEST)
Received: from localhost ([::1]:37894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8TI-000697-G8
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ8CW-0006gB-DZ
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:10:16 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:45626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ8CU-0004hU-OA
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:10:16 -0400
Received: by mail-pf1-x434.google.com with SMTP id w19so7763854pfn.12
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 06:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V0+SrI3r6YM+qmpwJFk7/gLAWsp77JE/gpGy0bXxV5I=;
 b=GQpu0+lFkFvdrg+C4G8MsxLwQ1B0qrUcx80HuKMOEnST96JZGS08QZzN9etI+NAW/B
 KKhJ0zY51AFFkxpm5dyfot/f0By1Uns6HBrMh+Xr6zBq3t2hAtZXJpbDT4G/WnM4MGHY
 W8gQjRFg0Hw4uGIYHpU1daFrV5m4hrIfT7NyEglr7uhkRplM8dxeeF8igdvCVfd7+4UU
 Kx3XLW3ldAEsydEdjgj7XT0F8bdrVMxzfaPlDWIdz3mGSenujyJzfHf3IyXMsHUDLGqF
 gCpY06oZHFYiWfEX0VHcG20EYjy9T7o0NumelqWP9pCHuWIdcfWV/V020yoVOhyVlPIe
 KUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V0+SrI3r6YM+qmpwJFk7/gLAWsp77JE/gpGy0bXxV5I=;
 b=b0BVj3zdtiXDhwD7uUzdQYJ2Wqi34rVgOxiVanSj29MLb5eJ2CvToBibg3gF6e3cNM
 VLREYCUAt7MLyV8yQTRnmJoqScVDurrsDkOsHArUZfddr8327O2QtOIllujSl1IkScdR
 W0gDNCtcnQ9frdaBw7PsPYYRitPi4covzAXx/QII1shN3GoT+qeq212RT2ZWCrRqidCH
 rhKxozi9/RXt3oyusJyYG7I4O2kO7s33CdEr6tSAYZyraR8MUEIuaPyvtzFbKpfRTxM5
 DoVkvWP/026SWHF1jbEnaJxqw4ZIMUHRx9m5sCiBBhkBFajfQZmy0anHxeJmlBlS0YGT
 x3Hw==
X-Gm-Message-State: AOAM533prisey/vE7OqnCzPdImUT2XijHgUE9Brw4enmbtS2vdQrf+q/
 t0vHrOgyHjg49vpY3tQymg1zHg==
X-Google-Smtp-Source: ABdhPJztRgZjKMA0I0DvS44rFGeycLAuw0oEEbU/NTs0o7iofjjG2QY9ZtNpclWoiEP2zftbHQ5lDQ==
X-Received: by 2002:a62:6493:0:b0:43c:e252:3dfc with SMTP id
 y141-20020a626493000000b0043ce2523dfcmr4661797pfb.60.1631625013200; 
 Tue, 14 Sep 2021 06:10:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v17sm10107223pff.6.2021.09.14.06.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 06:10:12 -0700 (PDT)
Subject: Re: [PATCH 0/3] target/arm: Set FPSCR.LTPSIZE for user-mode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210914120725.24992-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eeea6385-a43c-4e7a-9de3-dcc27c69944c@linaro.org>
Date: Tue, 14 Sep 2021 06:10:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914120725.24992-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Lyon <christophe.lyon@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 5:07 AM, Peter Maydell wrote:
> Peter Maydell (3):
>    target/arm: Don't skip M-profile reset entirely in user mode
>    target/arm: Always clear exclusive monitor on reset
>    target/arm: Consolidate ifdef blocks in reset

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

