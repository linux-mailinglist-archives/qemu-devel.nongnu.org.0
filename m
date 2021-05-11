Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6577E37AFF9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 22:12:28 +0200 (CEST)
Received: from localhost ([::1]:42136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgYjz-0000vx-GR
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 16:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@huawei.com>)
 id 1lgWXi-0001UI-Tb; Tue, 11 May 2021 13:51:38 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@huawei.com>)
 id 1lgWXY-00021U-SG; Tue, 11 May 2021 13:51:38 -0400
Received: from dggeml756-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Ffljg1wjVzWhKk;
 Wed, 12 May 2021 01:47:03 +0800 (CST)
Received: from dggpemm100008.china.huawei.com (7.185.36.125) by
 dggeml756-chm.china.huawei.com (10.1.199.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 12 May 2021 01:51:17 +0800
Received: from dggpemm500011.china.huawei.com (7.185.36.110) by
 dggpemm100008.china.huawei.com (7.185.36.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 12 May 2021 01:51:17 +0800
Received: from dggpemm500011.china.huawei.com ([7.185.36.110]) by
 dggpemm500011.china.huawei.com ([7.185.36.110]) with mapi id 15.01.2176.012;
 Wed, 12 May 2021 01:51:17 +0800
From: Andrey Shinkevich <andrey.shinkevich@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: GICv3 for MTTCG
Thread-Topic: GICv3 for MTTCG
Thread-Index: AQHXRo49QQoDTg/5kkqOfm/tGkugzg==
Date: Tue, 11 May 2021 17:51:17 +0000
Message-ID: <1f157423cc544731beb743287a4be5cb@huawei.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.227.155.55]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=andrey.shinkevich@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 11 May 2021 16:11:23 -0400
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "drjones@redhat.com" <drjones@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Chengen \(William,
 FixNet\)" <chengen@huawei.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear colleagues,=0A=
=0A=
I am looking for ways to accelerate the MTTCG for ARM guest on x86-64 host.=
=0A=
The maximum number of CPUs for MTTCG that uses GICv2 is limited by 8:=0A=
=0A=
include/hw/intc/arm_gic_common.h:#define GIC_NCPU 8=0A=
=0A=
The version 3 of the Generic Interrupt Controller (GICv3) is not=0A=
supported in QEMU for some reason unknown to me. It would allow to=0A=
increase the limit of CPUs and accelerate the MTTCG performance on a=0A=
multiple core hypervisor.=0A=
I have got an idea to implement the Interrupt Translation Service (ITS)=0A=
for using by MTTCG for ARM architecture.=0A=
=0A=
Do you find that idea useful and feasible?=0A=
If yes, how much time do you estimate for such a project to complete by=0A=
one developer?=0A=
If no, what are reasons for not implementing GICv3 for MTTCG in QEMU?=0A=
=0A=
Best regards,=0A=
Andrey Shinkevich=0A=

