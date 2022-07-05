Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051695668D4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 13:01:51 +0200 (CEST)
Received: from localhost ([::1]:35848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8gJS-0005uO-1v
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 07:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gCo-00085d-IN
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:54:58 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:46598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gCn-0008H0-2u
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:54:58 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 t5-20020a17090a6a0500b001ef965b262eso1870271pjj.5
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 03:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iJW7dXESQY5ZGa1RIdhuZPUAVYotGYTS/e6x9HrF2e4=;
 b=Ue50t3mn7qUx66Jpw6VIXuSgFM8EnfUojFfE+GF5grf2TfDQoQKagVBSXYZSSNB4zb
 t3k7kQeEQKQsFZBqFcjRlO3UqQCyPT0cY++AdcIEs72QMUL32kN/g6LpXajgX628P5hy
 Sln4PAcjuyp1wTFXLGQcCtpBfDf1NWt6wbRMU1cpOOx77Zut5LtRyUQIIF9L6WxNLvZL
 u3rpmnzOG0nZIEKCVWGTHgglIbi0Eg8d3ujKbtrBatDW0ZV8z3yScLkImCtW12OGp7AU
 RQzqHkyunXSu6hwfRs0tFeyKV6ssn/6JC3py4+vkvOgYOOZ18/XGjyqCVI5R7eXBZxFR
 w3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iJW7dXESQY5ZGa1RIdhuZPUAVYotGYTS/e6x9HrF2e4=;
 b=WeD2dMNRPURKn8Arm5F3OjsVdxSNLXOH6lLFJ7Ci8TUA3ab4fPbEJMkA5Mep07FTha
 tOXZm+cWPJfr6OLtwEkdoXpUP4v3KPkDMsWVZvRlEQq+wyx1moKjAT6Vs7rlkNsWgzTy
 c0gxWc2aR7qdQ3M5YkNFVjWvqXy18e9F5gF0njPvTZdlt0LWkRvm8ag7NOQaIw+TgiC8
 o3QpuY0j364C4aM88FHkTuCEphznpxPTSr0xPI1Gz5dPqAePwMpV3pbMezqMdbWm59+4
 XB/MbwqMg3OsC6dWQIDpORZNJjDFd0gXZ9pD8GxcNMg1UfLVyvNXUXuTACSyo//aAb/1
 oNHA==
X-Gm-Message-State: AJIora+BhVYuVItd17VTwnccH81ep3RwO4XfsQ8UtpGdQQv7+Pb3x0Rj
 xSjGBU/UE91wuOvzWcX/3mjbDg==
X-Google-Smtp-Source: AGRyM1slzHFwsvX207mjOvfwbU0uz2cgyNA+FHM2Y029jDdEowQz2+fcHibpEOM5ysKkCVdsWfJ+Pg==
X-Received: by 2002:a17:902:cecc:b0:16a:416c:3d14 with SMTP id
 d12-20020a170902cecc00b0016a416c3d14mr39805825plg.73.1657018494768; 
 Tue, 05 Jul 2022 03:54:54 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 ik30-20020a170902ab1e00b0016bee668a5asm2070281plb.161.2022.07.05.03.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 03:54:54 -0700 (PDT)
Message-ID: <84ee2579-60ce-87b9-714d-c0f45635cd62@linaro.org>
Date: Tue, 5 Jul 2022 14:07:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] hw/rtc/ls7a_rtc: Drop unused inline functions
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: yangxiaojuan@loongson.cn, gaosong@loongson.cn,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220705082836.1141160-1-richard.henderson@linaro.org>
 <720d6853-1439-5e9e-9d78-21e62a94a4a8@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <720d6853-1439-5e9e-9d78-21e62a94a4a8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 7/5/22 14:01, Thomas Huth wrote:
> I wonder why the other Clang-based CI jobs (running on Linux) did not complain about this...?

I wondered about that too.  We must be limiting them to a set of targets.


r~

> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 


