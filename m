Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913163276BB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 05:45:08 +0100 (CET)
Received: from localhost ([::1]:50694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGaQd-0007Rl-JN
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 23:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaPR-0006ta-EM
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 23:43:53 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:51412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaPP-0007vM-PL
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 23:43:53 -0500
Received: by mail-pj1-x1031.google.com with SMTP id jx13so6765707pjb.1
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 20:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8/9RCakIbl+yNJ21DTvlwy+kfMNkfUTsGCrPAc3Ix0k=;
 b=sRgKsf+iKSfmotgWHNl1PpLUxS/0SFseB1GQ6dtRLXMYvkWl/15e2Z7Fe6f4hwj9fD
 YKQR6JekFZ5pbM2wdGvLDQ/NPuawspB9NqMwGgOq/6ITV4wCuJNv9ctvrhK81C1sHvk9
 cpjQvUY2Pb4++OpulBAP74E8wno8M6+g9rUBkSAmtSvdRpnq7dhMGvZfmFd9y4JUkz+T
 0ISC6tKQWWh177OomOsUxgPK2XsXT7vbhutm9zyFYPwhGlV+ojivI+jijz1Qg1S2Dhhi
 +vK5BUd3uVQU4yHm3zyXTjkmwrBQLF2L5k1/meBckhIAQsbXyMGrMow36a2caitnRVo2
 1+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8/9RCakIbl+yNJ21DTvlwy+kfMNkfUTsGCrPAc3Ix0k=;
 b=QWfL7fhCoi7vZljoaXWiHpEdsHiQWaijCngpGUhir7cKh9BEpPd23TEnubE1cQhxfY
 mI7oVK6QX/SgFDqVDvU5lg5oCZFgOemvRfjwG7MRFuOrJyJRMTmMiUWOdZEwVUZPUFfq
 wV+PnA453gubFHmzRrAvfR7F/lsgw+eHer8zYJs++cXldsvIRuuAxZUx7PEZyx/jTEk0
 zpo74CqKD9MFH6CFUaWATOCF+y+eDWhgZIC4+dC2GmFnwEqV7FyXhKEWn11TfHOlugBE
 o3XZa62l0Hn8NsdMw5wnMGJ2mEv94ctlIIcynF141uJyVfaB20YwX0X+Gw8qzNr+bASv
 IDlg==
X-Gm-Message-State: AOAM531mPmKVb1HR41/UjD6BJE3lfVRRVcqhxDFnbOD+1kjgjnWKKn8v
 EIa9wy+Ktry3MLC/FoEtj6SnxNlk0FXxEQ==
X-Google-Smtp-Source: ABdhPJyiVXBZGgWdsq4nU13reD0zEKxZfrpvnbMvw1UGqbwXKzJJrOalde/4U0x6Vj/jnaJXhcIfdQ==
X-Received: by 2002:a17:90a:c086:: with SMTP id
 o6mr14705953pjs.128.1614573830243; 
 Sun, 28 Feb 2021 20:43:50 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id ca1sm6265775pjb.55.2021.02.28.20.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 20:43:49 -0800 (PST)
Subject: Re: [PATCH v2 17/24] hw/arm/mps2-tz: Set MachineClass default_ram
 info from RAMInfo data
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ca6b3f6-d1db-a86e-60dd-3761f4fde530@linaro.org>
Date: Sun, 28 Feb 2021 20:43:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> Instead of hardcoding the MachineClass default_ram_size and
> default_ram_id fields, set them on class creation by finding the
> entry in the RAMInfo array which is marked as being the QEMU system
> RAM.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 24 ++++++++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

