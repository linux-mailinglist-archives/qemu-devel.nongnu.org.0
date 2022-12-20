Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF45F65224D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:18:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dN5-0005VT-71; Tue, 20 Dec 2022 09:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1p7dN2-0005Ux-C9; Tue, 20 Dec 2022 09:13:28 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1p7dMz-0004YT-SB; Tue, 20 Dec 2022 09:13:28 -0500
Received: from kwepemm600007.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Nbz6P59MKzmWYH;
 Tue, 20 Dec 2022 22:12:13 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 20 Dec 2022 22:13:20 +0800
Subject: Re: [PATCH] hvf: arm: Add support for GICv3
To: Alexander Graf <agraf@csgraf.de>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 <qemu-arm@nongnu.org>
References: <20221219220808.26392-1-agraf@csgraf.de>
 <d848e536-94ba-7f2e-ad40-026449fa63fd@huawei.com>
 <ceeb8fef-f0dc-eac9-8b0e-e28735bfdaf2@csgraf.de>
Message-ID: <e92d6301-de3b-5784-8c17-9c4194357c78@huawei.com>
Date: Tue, 20 Dec 2022 22:13:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <ceeb8fef-f0dc-eac9-8b0e-e28735bfdaf2@csgraf.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=yuzenghui@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2022/12/20 15:37, Alexander Graf wrote:
> Hi Zenghui,
> 
> On 20.12.22 08:14, Zenghui Yu wrote:
>> On 2022/12/20 6:08, Alexander Graf wrote:
>>> We currently only support GICv2 emulation.
>>
>> Before looking into it, I think it's worth finalizing the GIC version in
>> the hvf case - only v2 is allowed and fail early if user selects the
>> unsupported versions. Currently finalize_gic_version() does not deal
>> with hvf at all.
> 
> 
> Currently finalize_gic_version() treats HVF the same as TCG, which is 
> incorrect. However, with this patch applied, they happen to match.
> 
> I don't think it's worth changing the finalize_gic_version() 
> implementation to reflect the gicv2 only state for HVF. Instead, let's 
> rather get GICv3 support in and then add explicit handling for HVF on top.

I'm fine with it. I was just a bit confused when the guest got stuck
with a (blindly selected) gic-version but *no* error_report like "Hey,
please do not try GIC version other than v2" was printed. Apparently I'm
not familiar with how things work on my M1. ;-)

I'll have a try with this patch. Thanks.

