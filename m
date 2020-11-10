Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163BD2ACA65
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 02:25:45 +0100 (CET)
Received: from localhost ([::1]:55192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcIPo-0005RI-39
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 20:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krish.sadhukhan@oracle.com>)
 id 1kcINs-0004Dr-JM
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:23:44 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:54868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krish.sadhukhan@oracle.com>)
 id 1kcINo-0008IA-PA
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:23:44 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AA1KDRY138928;
 Tue, 10 Nov 2020 01:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=u3ugKtb/hD7qDBm+r+haai4+xBCusqnBiUb7VIooum0=;
 b=D5Tpu6M2VphEkHQWxNQ3HNfTL8BvPmGYCy//QKq4MwiSK7NAyG7wHbPHaw+RbtZi02aW
 d2XxgkkPMDIJpdT4PBE8LtQu0pqoNtAgvvhHGIeKPUJhrz4sgQb8STJGCISGl3xNsi28
 /eehGagtlPhzOwx+PDRqmcbOaIqMNq0YSCgciBX/OuGUPMoo7ivzjTK49Gtr8gdSu9Yw
 07TaHpOcuKWD32hbQOCBFy7qgbl4TgQyuWIFM3y3f1EoiQnenXY2uhI0BOkT1GPgEHtT
 +5eLJVYKQaZ1Hk2AxZQWbBSmWtmgDOjMbUvh2fNekT93WpBaIgBZT7MAk4VIoyHG7TYL Kw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 34nh3asa70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 01:23:33 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AA1K5A8023810;
 Tue, 10 Nov 2020 01:23:32 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 34p5gw4a00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Nov 2020 01:23:32 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AA1NVpG005460;
 Tue, 10 Nov 2020 01:23:31 GMT
Received: from nsvm-sadhukhan-1.osdevelopmeniad.oraclevcn.com
 (/100.100.230.216) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 09 Nov 2020 17:23:31 -0800
From: Krish Sadhukhan <krish.sadhukhan@oracle.com>
To: kvm@vger.kernel.org
Subject: [PATCH 0/5 v4] KVM: x86: Fill in conforming {vmx|svm}_x86_ops and
 {vmx|svm}_nested_ops via macros
Date: Tue, 10 Nov 2020 01:23:07 +0000
Message-Id: <20201110012312.20820-1-krish.sadhukhan@oracle.com>
X-Mailer: git-send-email 2.18.4
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9800
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=621 mlxscore=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011100008
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9800
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=1
 mlxlogscore=635 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011100008
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=krish.sadhukhan@oracle.com; helo=aserp2130.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 20:23:36
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, vkuznets@redhat.com, qemu-devel@nongnu.org,
 sean.j.christopherson@intel.com, jmattson@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3 -> v4:
	1. v3 did not include a few x86_ops and x86_nested_ops in the macro
	   expansion process of function names. This set has covered all those
	   left-out ops.
	2. Patch# 6 from v3 has been dropped as those changes already exist in
	   QEMU source.


[PATCH 1/5 v4] KVM: x86: Change names of some of the kvm_x86_ops
[PATCH 2/5 v4] KVM: SVM: Fill in conforming svm_x86_ops via macro
[PATCH 3/5 v4] KVM: nSVM: Fill in conforming svm_nested_ops via macro
[PATCH 4/5 v4] KVM: VMX: Fill in conforming vmx_x86_ops via macro
[PATCH 5/5 v4] KVM: nVMX: Fill in conforming vmx_nested_ops via macro

 arch/arm64/include/asm/kvm_host.h   |   2 +-
 arch/mips/include/asm/kvm_host.h    |   2 +-
 arch/powerpc/include/asm/kvm_host.h |   2 +-
 arch/s390/kvm/kvm-s390.c            |   2 +-
 arch/x86/include/asm/kvm_host.h     |  16 +-
 arch/x86/kvm/lapic.c                |   2 +-
 arch/x86/kvm/pmu.h                  |   4 +-
 arch/x86/kvm/svm/avic.c             |  11 +-
 arch/x86/kvm/svm/nested.c           |  20 +--
 arch/x86/kvm/svm/pmu.c              |   2 +-
 arch/x86/kvm/svm/sev.c              |   4 +-
 arch/x86/kvm/svm/svm.c              | 296 ++++++++++++++++++++----------------
 arch/x86/kvm/svm/svm.h              |  15 +-
 arch/x86/kvm/vmx/evmcs.c            |   6 +-
 arch/x86/kvm/vmx/evmcs.h            |   4 +-
 arch/x86/kvm/vmx/nested.c           |  39 +++--
 arch/x86/kvm/vmx/pmu_intel.c        |   2 +-
 arch/x86/kvm/vmx/posted_intr.c      |   6 +-
 arch/x86/kvm/vmx/posted_intr.h      |   4 +-
 arch/x86/kvm/vmx/vmx.c              | 262 +++++++++++++++----------------
 arch/x86/kvm/vmx/vmx.h              |   4 +-
 arch/x86/kvm/x86.c                  |  41 ++---
 include/linux/kvm_host.h            |   2 +-
 include/uapi/linux/kvm.h            |   6 +-
 tools/include/uapi/linux/kvm.h      |   6 +-
 virt/kvm/kvm_main.c                 |   4 +-
 26 files changed, 405 insertions(+), 359 deletions(-)

Krish Sadhukhan (5):
      KVM: x86: Change names of some of the kvm_x86_ops functions to make them more semantical and readable
      KVM: SVM: Fill in conforming svm_x86_ops via macro
      KVM: nSVM: Fill in conforming svm_nested_ops via macro
      KVM: VMX: Fill in conforming vmx_x86_ops via macro
      KVM: nVMX: Fill in conforming vmx_nested_ops via macro


