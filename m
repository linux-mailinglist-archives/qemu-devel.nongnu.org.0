Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409362B2AAB
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 02:52:37 +0100 (CET)
Received: from localhost ([::1]:55558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdkjz-00088R-Rt
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 20:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krish.sadhukhan@oracle.com>)
 id 1kdkhn-0006nm-6y
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 20:50:19 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:47690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krish.sadhukhan@oracle.com>)
 id 1kdkhj-0002Zd-3K
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 20:50:18 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AE1nnO1026863;
 Sat, 14 Nov 2020 01:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=6u7M5Az8dVGEjYUn2FVN9lV7QwjZnn7Aiuirfc+skio=;
 b=KP9Dvbd2TAZl79xjJ1bmQRhsMXdQnF4/10ccE6UDTvyBANXdtPIx3lD4SvSh+mMExbIs
 PqoJAR7ZRfo/v6IZcLNjLqXkrb6ouTgxOulTstUFQTz9XQkyZx6JEN/hqDHeQ+nNyHGx
 ls+WGHAW+0BAMTDWM2vUEn9V21KrrvrOtej9uaYDmqcRLUzSIdaE+RCB8Ws7BrKLhegH
 13UyuGJFSdcgVFW8ID14APeWRn+l3NfgqKXdZUmqice/FzwpY79FRpgVofWGOehSpeMj
 Z4HRix+Zw/Gm1A1r+i8XhdlL9EXz18HqmTrfwzZp1q6rTWu51O5CBT9bkd/Pm+9C+fSU JA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 34p72f31cp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 14 Nov 2020 01:50:07 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AE1kK0l142852;
 Sat, 14 Nov 2020 01:50:06 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 34t4bsbp88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 14 Nov 2020 01:50:06 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AE1o4tJ022709;
 Sat, 14 Nov 2020 01:50:04 GMT
Received: from nsvm-sadhukhan.osdevelopmeniad.oraclevcn.com (/100.100.230.216)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 13 Nov 2020 17:50:03 -0800
From: Krish Sadhukhan <krish.sadhukhan@oracle.com>
To: kvm@vger.kernel.org
Subject: [PATCH 0/5 v5] KVM: x86: Fill in conforming {vmx|svm}_x86_ops and
 {vmx|svm}_nested_ops via macros
Date: Sat, 14 Nov 2020 01:49:50 +0000
Message-Id: <20201114014955.19749-1-krish.sadhukhan@oracle.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9804
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 adultscore=0
 mlxlogscore=766 spamscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011140009
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9804
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=780 mlxscore=0
 malwarescore=0 suspectscore=1 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011140009
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=krish.sadhukhan@oracle.com; helo=userp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 20:50:10
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

v4 -> v5:
	1. The op 'prepare_guest_switch' has been renamed to
	   'prepare_switch_to_guest'.
	2. The following functions were missing the 'static' keyword (reported
	   by kernel test robot <lkp@intel.com>):
		
		svm_get_cs_db_l_bits
		svm_tlb_flush_all
		svm_tlb_flush_current
		svm_tlb_flush_guest


[PATCH 1/5 v5] KVM: x86: Change names of some of the kvm_x86_ops
[PATCH 2/5 v5] KVM: SVM: Fill in conforming svm_x86_ops via macro
[PATCH 3/5 v5] KVM: nSVM: Fill in conforming svm_nested_ops via macro
[PATCH 4/5 v5] KVM: VMX: Fill in conforming vmx_x86_ops via macro
[PATCH 5/5 v5] KVM: nVMX: Fill in conforming vmx_nested_ops via macro

 arch/arm64/include/asm/kvm_host.h   |   2 +-
 arch/mips/include/asm/kvm_host.h    |   2 +-
 arch/powerpc/include/asm/kvm_host.h |   2 +-
 arch/s390/kvm/kvm-s390.c            |   2 +-
 arch/x86/include/asm/kvm_host.h     |  18 +--
 arch/x86/kvm/lapic.c                |   2 +-
 arch/x86/kvm/pmu.h                  |   4 +-
 arch/x86/kvm/svm/avic.c             |  11 +-
 arch/x86/kvm/svm/nested.c           |  20 +--
 arch/x86/kvm/svm/pmu.c              |   2 +-
 arch/x86/kvm/svm/sev.c              |   4 +-
 arch/x86/kvm/svm/svm.c              | 298 ++++++++++++++++++++----------------
 arch/x86/kvm/svm/svm.h              |  15 +-
 arch/x86/kvm/vmx/evmcs.c            |   6 +-
 arch/x86/kvm/vmx/evmcs.h            |   4 +-
 arch/x86/kvm/vmx/nested.c           |  37 +++--
 arch/x86/kvm/vmx/pmu_intel.c        |   2 +-
 arch/x86/kvm/vmx/posted_intr.c      |   6 +-
 arch/x86/kvm/vmx/posted_intr.h      |   4 +-
 arch/x86/kvm/vmx/vmx.c              | 260 +++++++++++++++----------------
 arch/x86/kvm/vmx/vmx.h              |   2 +-
 arch/x86/kvm/x86.c                  |  43 ++----
 include/linux/kvm_host.h            |   2 +-
 include/uapi/linux/kvm.h            |   6 +-
 tools/include/uapi/linux/kvm.h      |   6 +-
 virt/kvm/kvm_main.c                 |   4 +-
 26 files changed, 405 insertions(+), 359 deletions(-)

Krish Sadhukhan (5):
      KVM: x86: Change names of some of the kvm_x86_ops functions to make them m
ore semantical and readable
      KVM: SVM: Fill in conforming svm_x86_ops via macro
      KVM: nSVM: Fill in conforming svm_nested_ops via macro
      KVM: VMX: Fill in conforming vmx_x86_ops via macro
      KVM: nVMX: Fill in conforming vmx_nested_ops via macro


