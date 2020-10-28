Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BD729CE77
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 08:13:00 +0100 (CET)
Received: from localhost ([::1]:50734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXfdj-0005eM-Is
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 03:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kXfcY-0004SS-QF; Wed, 28 Oct 2020 03:11:46 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kXfcW-0003Eq-Qk; Wed, 28 Oct 2020 03:11:46 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CLfrV41sFzkbRj;
 Wed, 28 Oct 2020 15:11:38 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Wed, 28 Oct 2020 15:11:26 +0800
Message-ID: <5F99199D.2020601@huawei.com>
Date: Wed, 28 Oct 2020 15:11:25 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <pbonzini@redhat.com>, <chenhc@lemote.com>, <pasic@linux.ibm.com>,
 <borntraeger@de.ibm.com>, <mtosatti@redhat.com>, <cohuck@redhat.com>
Subject: [PATCH 1/4] configure: Add a --enable-debug-kvm option to configure
References: <5F97FD61.4060804@huawei.com> <5F991331.4020604@huawei.com>
In-Reply-To: <5F991331.4020604@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 00:18:54
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

This patch allows CONFIG_DEBUG_KVM to be defined when passing
an option to the configure script.

Signed-off-by: AlexChen <alex.chen@huawei.com>
---
 configure | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/configure b/configure
index e6754c1e87..2cdef5be4c 100755
--- a/configure
+++ b/configure
@@ -338,6 +338,7 @@ pvrdma=""
 gprof="no"
 debug_tcg="no"
 debug="no"
+debug_kvm="no"
 sanitizers="no"
 tsan="no"
 fortify_source=""
@@ -1022,11 +1023,16 @@ for opt do
   ;;
   --disable-debug-tcg) debug_tcg="no"
   ;;
+  --enable-debug-kvm) debug_kvm="yes"
+  ;;
+  --disable-debug-kvm) debug_kvm="no"
+  ;;
   --enable-debug)
       # Enable debugging options that aren't excessively noisy
       debug_tcg="yes"
       debug_mutex="yes"
       debug="yes"
+      debug_kvm="yes"
       strip_opt="no"
       fortify_source="no"
   ;;
@@ -1735,6 +1741,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   module-upgrades try to load modules from alternate paths for upgrades
   debug-tcg       TCG debugging (default is disabled)
   debug-info      debugging information
+  debug-kvm       KVM debugging support (default is disabled)
   sparse          sparse checker
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
@@ -5929,6 +5936,9 @@ fi
 if test "$debug_tcg" = "yes" ; then
   echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
 fi
+if test "$debug_kvm" = "yes" ; then
+  echo "CONFIG_DEBUG_KVM=y" >> $config_host_mak
+fi
 if test "$strip_opt" = "yes" ; then
   echo "STRIP=${strip}" >> $config_host_mak
 fi
-- 
2.19.1

