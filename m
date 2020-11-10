Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9612ACA7C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 02:30:04 +0100 (CET)
Received: from localhost ([::1]:36840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcITz-0001M3-Ci
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 20:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krish.sadhukhan@oracle.com>)
 id 1kcIPl-0006Eh-4z
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:25:41 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:46696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krish.sadhukhan@oracle.com>)
 id 1kcIPh-0000DB-R0
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:25:40 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AA1Je91134833;
 Tue, 10 Nov 2020 01:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=ghWVoGK8naQWB7dE1ynRCZEevTGtWfajEGjW8yACRqI=;
 b=hV/jaQKhvf+rWzbLbTJOGo45f2I+N/Dp3JsWZRduH3w2A/wpuh+iwHvzAUX2bWI2LDoi
 +EI+6C4899mUPOT2V6z48NZRt26/zqdtGiIpKeHzUDLTgeV19SXjpeeI6COxRhxBg+2M
 tlGZXtY9f3rpNOm1SvHc3yHudIqmBaLY5shmmQ5uK/XFRQg1rZi8FSMHPD9Aaluzd+Pn
 Pdt2IOTn+lrWvOApwj4JxZimHobedNhvpTGve7r2p41GjcFUl/oATckxwwsizvTxmXlG
 9+KbuIVXmsYHoDQKb9Q+NxFUhBqBT9Yb4exGB5+R/NcM/65/GsNDb7vOF/E1iKkBKbIo 9w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 34p72ef9nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 01:25:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AA1K7q9024215;
 Tue, 10 Nov 2020 01:23:34 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 34p5gw4a0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Nov 2020 01:23:33 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AA1NWWC014970;
 Tue, 10 Nov 2020 01:23:32 GMT
Received: from nsvm-sadhukhan-1.osdevelopmeniad.oraclevcn.com
 (/100.100.230.216) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 09 Nov 2020 17:23:32 -0800
From: Krish Sadhukhan <krish.sadhukhan@oracle.com>
To: kvm@vger.kernel.org
Subject: [PATCH 3/5 v4] KVM: nSVM: Fill in conforming svm_nested_ops via macro
Date: Tue, 10 Nov 2020 01:23:10 +0000
Message-Id: <20201110012312.20820-4-krish.sadhukhan@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20201110012312.20820-1-krish.sadhukhan@oracle.com>
References: <20201110012312.20820-1-krish.sadhukhan@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9800
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011100008
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9800
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=1 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011100008
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=krish.sadhukhan@oracle.com; helo=userp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 20:23:38
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

The names of the nested_svm_ops functions do not have a corresponding
'nested_svm_' prefix. Generate the names using a macro so that the names are
conformant. Fixing the naming will help in better readability and
maintenance of the code.

Suggested-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Krish Sadhukhan <krish.sadhukhan@oracle.com>
---
 arch/x86/kvm/svm/nested.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 200674190449..4cdeacaf768f 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -196,7 +196,7 @@ static bool nested_svm_vmrun_msrpm(struct vcpu_svm *svm)
 	return true;
 }
 
-static bool svm_get_nested_state_pages(struct kvm_vcpu *vcpu)
+static bool nested_svm_get_pages(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
 	if (!nested_svm_vmrun_msrpm(svm)) {
@@ -834,7 +834,7 @@ static int nested_svm_intercept(struct vcpu_svm *svm)
 		/*
 		 * Host-intercepted exceptions have been checked already in
 		 * nested_svm_exit_special.  There is nothing to do here,
-		 * the vmexit is injected by svm_check_nested_events.
+		 * the vmexit is injected by nested_svm_check_events.
 		 */
 		vmexit = NESTED_EXIT_DONE;
 		break;
@@ -965,7 +965,7 @@ static void nested_svm_init(struct vcpu_svm *svm)
 }
 
 
-static int svm_check_nested_events(struct kvm_vcpu *vcpu)
+static int nested_svm_check_events(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
 	bool block_nested_events =
@@ -1049,7 +1049,7 @@ int nested_svm_exit_special(struct vcpu_svm *svm)
 	return NESTED_EXIT_CONTINUE;
 }
 
-static int svm_get_nested_state(struct kvm_vcpu *vcpu,
+static int nested_svm_get_state(struct kvm_vcpu *vcpu,
 				struct kvm_nested_state __user *user_kvm_nested_state,
 				u32 user_data_size)
 {
@@ -1106,7 +1106,7 @@ static int svm_get_nested_state(struct kvm_vcpu *vcpu,
 	return kvm_state.size;
 }
 
-static int svm_set_nested_state(struct kvm_vcpu *vcpu,
+static int nested_svm_set_state(struct kvm_vcpu *vcpu,
 				struct kvm_nested_state __user *user_kvm_nested_state,
 				struct kvm_nested_state *kvm_state)
 {
@@ -1209,9 +1209,11 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 	return ret;
 }
 
+#define KVM_X86_NESTED_OP_NAME(name) .name = nested_svm_##name
+
 struct kvm_x86_nested_ops svm_nested_ops = {
-	.check_events = svm_check_nested_events,
-	.get_pages = svm_get_nested_state_pages,
-	.get_state = svm_get_nested_state,
-	.set_state = svm_set_nested_state,
+	KVM_X86_NESTED_OP_NAME(check_events),
+	KVM_X86_NESTED_OP_NAME(get_pages),
+	KVM_X86_NESTED_OP_NAME(get_state),
+	KVM_X86_NESTED_OP_NAME(set_state),
 };
-- 
2.18.4


