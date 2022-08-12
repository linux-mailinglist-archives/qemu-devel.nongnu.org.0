Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3B2590A66
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 04:49:42 +0200 (CEST)
Received: from localhost ([::1]:60858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMKk1-0007R8-67
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 22:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oMKhR-0005oJ-TL; Thu, 11 Aug 2022 22:47:02 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:6086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oMKhP-0005u5-35; Thu, 11 Aug 2022 22:47:01 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4M3nyp2sB1zXdNP;
 Fri, 12 Aug 2022 10:42:42 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (7.193.23.208) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 12 Aug 2022 10:46:49 +0800
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 12 Aug 2022 10:46:48 +0800
Subject: Re: [PATCH for-7.1] target/arm: Don't report Statistical Profiling
 Extension in ID registers
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>
References: <20220811131127.947334-1-peter.maydell@linaro.org>
Message-ID: <fa67cebd-8f47-6406-7b9e-f91369799d26@huawei.com>
Date: Fri, 12 Aug 2022 10:46:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20220811131127.947334-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=yuzenghui@huawei.com;
 helo=szxga02-in.huawei.com
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

On 2022/8/11 21:11, Peter Maydell wrote:
> The newly added neoverse-n1 CPU has ID register values which indicate
> the presence of the Statistical Profiling Extension, because the real
> hardware has this feature.  QEMU's TCG emulation does not yet
> implement SPE, though (not even as a minimal stub implementation), so
> guests will crash if they try to use it because the SPE system
> registers don't exist.
> 
> Force ID_AA64DFR0_EL1.PMSVer to 0 in CPU realize for TCG, so that
> we don't advertise to the guest a feature that doesn't exist.
> 
> (We could alternatively do this by editing the value that
> aarch64_neoverse_n1_initfn() sets for this ID register, but
> suppressing the field in realize means we won't re-introduce this bug
> when we add other CPUs that have SPE in hardware, such as the
> Neoverse-V1.)
> 
> An example of a non-booting guest is current mainline Linux (5.19),
> when booting in EL2 on the virt board (ie with -machine
> virtualization=on).
> 
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

