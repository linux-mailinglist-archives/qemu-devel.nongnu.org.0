Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FB74A2C80
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 08:32:24 +0100 (CET)
Received: from localhost ([::1]:47696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDiDd-000348-S7
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 02:32:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1nDhbe-0001Uo-OB
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 01:53:09 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1nDhbQ-0002C6-OA
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 01:53:00 -0500
Received: from kwepemi100004.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Jm4cD45z0zZf06;
 Sat, 29 Jan 2022 14:46:36 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (7.193.23.208) by
 kwepemi100004.china.huawei.com (7.221.188.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 29 Jan 2022 14:50:34 +0800
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 29 Jan 2022 14:50:33 +0800
Subject: Re: [PATCH 3/4] target/arm: Fix {fp,sve}_exception_el for VHE mode
 running
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>
References: <20220127063428.30212-1-richard.henderson@linaro.org>
 <20220127063428.30212-4-richard.henderson@linaro.org>
Message-ID: <ecef405b-99b7-4ac9-9e0b-78c5b9acde09@huawei.com>
Date: Sat, 29 Jan 2022 14:50:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20220127063428.30212-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=yuzenghui@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-devel@nongnu.org>

Hi Richard,

On 2022/1/27 14:34, Richard Henderson wrote:
> +    if (el <= 2) {
> +        if (hcr_el2 & HCR_E2H) {
> +            /* Check CPTR_EL2.ZEN.  */
> +            switch (extract32(env->cp15.cptr_el[2], 16, 2)) {
> +            case 1:
> +                if (el != 0 || !(hcr_el2 & HCR_TGE)) {

It looks to me that the code will be easier to follow if we can
put '!(hcr_el2 & HCR_TGE)' before 'el != 0'.

> +                    break;
> +                }
> +                /* fall through */
> +            case 0:
> +            case 2:
> +                return 2;
> +            }

Regardless, thanks for the fix.

Reviewed-and-tested-by: Zenghui Yu <yuzenghui@huawei.com>

