Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1227434B3CF
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 03:27:16 +0100 (CET)
Received: from localhost ([::1]:60180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPyfS-0001Xe-Mg
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 22:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lPydZ-0000cS-34; Fri, 26 Mar 2021 22:25:17 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lPydW-0002yQ-I1; Fri, 26 Mar 2021 22:25:16 -0400
Received: from dggeml406-hub.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4F6jJj67WxzWQF9;
 Sat, 27 Mar 2021 10:21:41 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggeml406-hub.china.huawei.com (10.3.17.50) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Sat, 27 Mar 2021 10:24:55 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Sat, 27 Mar 2021 10:24:55 +0800
To: Eric Auger <eric.auger@redhat.com>, Prem Mallappa
 <prem.mallappa@broadcom.com>, Peter Maydell <peter.maydell@linaro.org>,
 <linuc.decode@gmail.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: A question about the translation granule size supported by the vSMMU
Message-ID: <fa696532-5f04-aeeb-1ba3-6427675c6655@huawei.com>
Date: Sat, 27 Mar 2021 10:24:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme709-chm.china.huawei.com (10.1.199.105) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, Keqian Zhu <zhukeqian1@huawei.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

Recently, I did some tests on SMMU nested mode. Here is
a question about the translation granule size supported by
vSMMU.

There is such a code in SMMUv3_init_regs():

>    /* 4K and 64K granule support */
>     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
>     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 
> bits */
Why is the 16K granule not supported? I modified the code
to support it and did not encounter any problems in the
test. Although 4K and 64K minimal granules are "strongly
recommended", I think vSMMU should still support 16K.😉
Are there other reasons why 16K is not supported here?

When in SMMU nested mode, it may get errors if pSMMU
doesn't support 16K but vSMMU supports 16K. But we
can get some settings of pSMMU to avoid this situation.
I found some discussions between Eric and Linu about
this [1], but this idea does not seem to be implemented.

[1] https://lists.gnu.org/archive/html/qemu-arm/2017-09/msg00149.html

Best regards,
Kunkun Jiang


