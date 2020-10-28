Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E2B29CE78
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 08:13:02 +0100 (CET)
Received: from localhost ([::1]:50854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXfdl-0005ht-KG
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 03:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kXfcY-0004SR-N2; Wed, 28 Oct 2020 03:11:46 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:2115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kXfcV-0003Aq-Mp; Wed, 28 Oct 2020 03:11:46 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CLfrL4rvqz6wXN;
 Wed, 28 Oct 2020 15:11:30 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Wed, 28 Oct 2020 15:11:20 +0800
Message-ID: <5F991998.2020108@huawei.com>
Date: Wed, 28 Oct 2020 15:11:20 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <pbonzini@redhat.com>, <chenhc@lemote.com>, <pasic@linux.ibm.com>,
 <borntraeger@de.ibm.com>, <mtosatti@redhat.com>, <cohuck@redhat.com>
Subject: [PATCH 0/4] kvm: Add a --enable-debug-kvm option to configure
References: <5F97FD61.4060804@huawei.com>
In-Reply-To: <5F97FD61.4060804@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=alex.chen@huawei.com;
 helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 03:11:28
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: zhengchuan@huawei.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current 'DEBUG_KVM' macro is defined in many files, and turning on
the debug switch requires code modification, which is very inconvenient,
so this series add an option to configure to support the definition of
the 'DEBUG_KVM' macro.
In addition, patches 3 and 4 also make printf always compile in debug output
which will prevent bitrot of the format strings by referring to the
commit(08564ecd: s390x/kvm: make printf always compile in debug output).

alexchen (4):
  configure: Add a --enable-debug-kvm option to configure
  kvm: replace DEBUG_KVM to CONFIG_DEBUG_KVM
  kvm: make printf always compile in debug output
  i386/kvm: make printf always compile in debug output

 accel/kvm/kvm-all.c | 11 ++++-------
 configure           | 10 ++++++++++
 target/i386/kvm.c   | 11 ++++-------
 target/mips/kvm.c   |  6 ++++--
 target/s390x/kvm.c  |  6 +++---
 5 files changed, 25 insertions(+), 19 deletions(-)

-- 
2.19.1

