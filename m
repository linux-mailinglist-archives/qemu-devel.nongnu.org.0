Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3747667F17B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 23:54:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLXbA-00040d-Dy; Fri, 27 Jan 2023 17:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLXb9-000408-4u
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:53:31 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLXb7-0002NR-MK
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:53:30 -0500
Received: by mail-pl1-x634.google.com with SMTP id g23so6401745plq.12
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 14:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=snL5jrkhJuho08mtTwgScQmb+tlWyFnw2qCO9pHM0PY=;
 b=AeQgGQr7H35oLkwGG8WP8njUUPYpTToet8gj92CXv6qH9uTeyFqBvQ4RRmAuwL+Rvn
 pm4QRLzd7uHNiRyJZrEMibfizw2Zt8044vRgtBGmbwdgiavcoc+v0+Xpu7ulVLiPw6dV
 kSZNwbLhCotsrQqUn8PftnEld00XgNABZRxqS6Ae0YKWD2ZJoX1JRv7QF/rjecV60zgF
 MJbII3TN2xFXD91rm9/QSpFOSzEVIZYD7FSzT8IleP81iyHvvnsx/NOUj/S1bZSQklEe
 4DYw2/vYDwdFXZRFl/vm1NbkbsOfuvQnnKHDukNIMNvOG/l2QMbcTE53Q/CoL1MEJhUM
 id9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=snL5jrkhJuho08mtTwgScQmb+tlWyFnw2qCO9pHM0PY=;
 b=1dTbMDALofGX4Y46LzlU/DFPU+wPfP+4TQDCSq/qeVR4SI1es+4HDGgm9L3GHCDZ7z
 ty774b9C4dRcR3UvcOljlfI3TY2s/abP8dlwMsfiel4AqUGBnSK4rpG3myKikYhbfiU1
 k/aMzeJJ+udHSrERjgJdHpmGRvpS1v5UoWWO4fXznU94ZjIB/xFXAU03dFV84UoHw9MG
 z8301LeOYs9YS8HXGVFuPLCffYuMo3Y41oSXYAWWWsJUOBT9gIR4dFOCf1CBy8buljb6
 NwHXI+IXsbBilkfutvcqmHxptpcHSC+g0sjbNO8mJ16cwJaaTsyW6soq8YzSzJddz+5r
 5L0A==
X-Gm-Message-State: AFqh2koExGAn+hgIVID0xZmETA0ZD3Nys5eya1lTYHxBKc0M8iDNLmJr
 Ci9m7JbTfmIvD7XuKoGxB0eOdY4ghwBhzS8b
X-Google-Smtp-Source: AMrXdXvpHvv4jDAJsCFD7jBksqvAheTJkAVmBzS0EKO8AmBn+PEUJKYUGWpM5NDPcQ3VoE1vlFVc9w==
X-Received: by 2002:a05:6a20:6a93:b0:b8:aa87:e322 with SMTP id
 bi19-20020a056a206a9300b000b8aa87e322mr44603418pzb.13.1674860008061; 
 Fri, 27 Jan 2023 14:53:28 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 ay2-20020a1709028b8200b0019468fe44d3sm3358421plb.25.2023.01.27.14.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 14:53:27 -0800 (PST)
Message-ID: <f5f750c2-efd1-ac51-d2cd-ffde48e96ca7@linaro.org>
Date: Fri, 27 Jan 2023 12:53:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] linux-user: Improve strace output of personality() and
 sysinfo()
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221223100107.17303-1-deller@gmx.de>
 <5780556e-ef12-408d-7f8b-9104314cf9f4@linaro.org>
 <69357647-288c-a032-27f9-2912c6483418@gmx.de>
 <5a06e9f8-f7ea-1dbf-d44b-b9d134d3c400@linaro.org>
 <f66e5330-99fe-db9f-13eb-d3501c65cf17@gmx.de>
 <16e8f5c4-45c7-de0f-f53d-2fe4549fff7e@vivier.eu> <Y9QxskymWJjrKQmT@p100>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y9QxskymWJjrKQmT@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 10:18, Helge Deller wrote:
> Make the strace look nicer for those two syscalls.
> 
> Signed-off-by: Helge Deller<deller@gmx.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

