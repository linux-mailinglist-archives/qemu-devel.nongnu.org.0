Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF17468E163
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 20:44:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPTs1-0001U7-0s; Tue, 07 Feb 2023 14:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPTry-0001TM-PW
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:43:10 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPTrx-0002Eh-Bf
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:43:10 -0500
Received: by mail-pj1-x1036.google.com with SMTP id o13so16102920pjg.2
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 11:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PBl23SJtD0He1rajRLfKvwJP8z0dTyipsxVSTlScZSU=;
 b=C243ZE5ajpmUgSaIb/+JpznWQm9JlXkoLvfgfSCWKSYoV8w9shpsRTenvSlGtji0iG
 4ii4x2lF5T05kNYBWbioz6CyYx0nXzsA3u96paZjI2hXUmqPuZiTBLEV0LaDW1XFvP6g
 WjFRlz+lX297t0mJdZJ0ZYCuB/lG/geRDNUqyaVzxCvP9utIkagZjXwEGi2qrvxWyzGJ
 2HddIY8xMHo5KcrwW8GioL3yKGUqcpV/K1GqCKjUMRpeZR47uymSl6pvZQOt6K6PQwR+
 ziAR8IX6NIWZeEGhjYXEg1dXli6m+SH/VnOphNW5FZOmOEk7nzAX6VGxsOaouZCM0wsL
 BfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PBl23SJtD0He1rajRLfKvwJP8z0dTyipsxVSTlScZSU=;
 b=t1gniCZbAEM47Tq+XB9SK+UVhcO1fPk+LYBrPx4u5Z6gW3at3ngm7jcQuUYO+TqEAi
 luUXlalbcm0F5qwe39VjsUnTmSiHO4d6Qb3M/zJtGQelK9IkS2XKq25CxzAwPEuEAXbj
 hyTSKqB8SHEtmOUk4xfwLnxt7kL3m52MU8utETerizOArM+i4g94GwbwknbZw+kxQwg4
 wLO6LEnRGn897nMAAVybBNsNmpa0fDBKh2yvldziN1EDNp0hWwGG5Go8zKyRcI9JGCEk
 eyNy9sGR4T8eGrecd2Sa7Dba4+4cGCYLOFisV+6pnnWnIcYuB15mTI3xzfxmVrsasgDR
 ZOJg==
X-Gm-Message-State: AO0yUKWhIZL4+wxAW+d7B1+8QwmYurZSdxt3GRxXeQz4qAdtzfKvYkKc
 9phWQvVN+gZ86B7Tv8KqoMgS9Q==
X-Google-Smtp-Source: AK7set+hN9wPxewFSl42jLV2KKwHW5mOxLtCuCTIcxBqzFy3hL9cf9oYtrh91jI/qb41WSW1dYGiaA==
X-Received: by 2002:a17:903:1389:b0:199:3d76:bc22 with SMTP id
 jx9-20020a170903138900b001993d76bc22mr644826plb.26.1675798987404; 
 Tue, 07 Feb 2023 11:43:07 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 20-20020a170902ee5400b0019900a6de6dsm5957710plo.88.2023.02.07.11.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 11:43:06 -0800 (PST)
Message-ID: <206df5ca-15e5-32e3-086a-40d333410d39@linaro.org>
Date: Tue, 7 Feb 2023 09:43:02 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 05/22] target/arm: SCR_EL3.NS may be RES1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com,
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-6-richard.henderson@linaro.org>
 <CAFEAcA-Ehp0NFqM3m8m_G1E22THR0ojTmRrnoJ7dB9vUsRvx2A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-Ehp0NFqM3m8m_G1E22THR0ojTmRrnoJ7dB9vUsRvx2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 2/7/23 04:39, Peter Maydell wrote:
> On Tue, 24 Jan 2023 at 00:05, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> With RME, SEL2 must also be present to support secure state.
>> The NS bit is RES1 if SEL2 is not present.
> 
> I couldn't find the bit of the spec that says this --
> could you give me a page reference?

DDI0615D.a RME Supplement, R_GSWWH.
and the bit about secure state is I_DJJQJ.


r~


