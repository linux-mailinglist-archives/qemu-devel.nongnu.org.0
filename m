Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7522ACA67
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 02:25:46 +0100 (CET)
Received: from localhost ([::1]:55206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcIPp-0005RV-I2
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 20:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krish.sadhukhan@oracle.com>)
 id 1kcINr-0004Dh-40
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:23:43 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:54888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krish.sadhukhan@oracle.com>)
 id 1kcINo-0008IL-Iu
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:23:42 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AA1KJBQ138980;
 Tue, 10 Nov 2020 01:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=7jWTuy5VpAOM0jKE7IT8mw3sTOAf1bhssNjqiwLU/AA=;
 b=jIU/RKC2OmVdL2RpUFNM4N1UADA1DL4TMqXyaleDdbQca9QfaF96n5GpwVeg8sxKsP87
 jCUa/8ZoPke0m7Hk8vnvt/iDjvQ84SFysCuQbTlQN/n7XfO6eZJ3QYnm/KAJ6XzTBzmT
 rWMCN3xsboTfo7X5BH0P4tHjzCFRyJ/1AckABxdG6n/8bamSRc1bfXKyuT8WjdGLDqXb
 9w/R7kK84pYyh8Kp7YOjA1/q9XJo2wkis8XGph2mMlwBiTRRNeNOh429PsVaGE5iVlzn
 IfUTyNKPGsL3Qn14jO/36x8dMFaRDL4SeQ0lVcNZ8dva9uEtbh/lvkDPtUan82+401nn sQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 34nh3asa77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 01:23:35 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AA1LAOj027622;
 Tue, 10 Nov 2020 01:23:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 34p55ms995-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Nov 2020 01:23:35 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AA1NXhc014154;
 Tue, 10 Nov 2020 01:23:33 GMT
Received: from nsvm-sadhukhan-1.osdevelopmeniad.oraclevcn.com
 (/100.100.230.216) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 09 Nov 2020 17:23:33 -0800
From: Krish Sadhukhan <krish.sadhukhan@oracle.com>
To: kvm@vger.kernel.org
Subject: [PATCH 5/5 v4] KVM: nVMX: Fill in conforming vmx_nested_ops via macro
Date: Tue, 10 Nov 2020 01:23:12 +0000
Message-Id: <20201110012312.20820-6-krish.sadhukhan@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20201110012312.20820-1-krish.sadhukhan@oracle.com>
References: <20201110012312.20820-1-krish.sadhukhan@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9800
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011100008
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9800
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=3
 mlxlogscore=999 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
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

The names of some of the vmx_nested_ops functions do not have a corresponding
'nested_vmx_' prefix. Generate the names using a macro so that the names are
conformant. Fixing the naming will help in better readability and
maintenance of the code.

Suggested-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Krish Sadhukhan <krish.sadhukhan@oracle.com>
---
 arch/x86/kvm/vmx/evmcs.c  |  6 +++---
 arch/x86/kvm/vmx/evmcs.h  |  4 ++--
 arch/x86/kvm/vmx/nested.c | 35 +++++++++++++++++++++--------------
 3 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/arch/x86/kvm/vmx/evmcs.c b/arch/x86/kvm/vmx/evmcs.c
index f3199bb02f22..e54b366ea114 100644
--- a/arch/x86/kvm/vmx/evmcs.c
+++ b/arch/x86/kvm/vmx/evmcs.c
@@ -324,7 +324,7 @@ bool nested_enlightened_vmentry(struct kvm_vcpu *vcpu, u64 *evmcs_gpa)
 	return true;
 }
 
-uint16_t nested_get_evmcs_version(struct kvm_vcpu *vcpu)
+uint16_t nested_vmx_get_evmcs_version(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 	/*
@@ -418,7 +418,7 @@ int nested_evmcs_check_controls(struct vmcs12 *vmcs12)
 	return ret;
 }
 
-int nested_enable_evmcs(struct kvm_vcpu *vcpu,
+int nested_vmx_enable_evmcs(struct kvm_vcpu *vcpu,
 			uint16_t *vmcs_version)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
@@ -426,7 +426,7 @@ int nested_enable_evmcs(struct kvm_vcpu *vcpu,
 	vmx->nested.enlightened_vmcs_enabled = true;
 
 	if (vmcs_version)
-		*vmcs_version = nested_get_evmcs_version(vcpu);
+		*vmcs_version = nested_vmx_get_evmcs_version(vcpu);
 
 	return 0;
 }
diff --git a/arch/x86/kvm/vmx/evmcs.h b/arch/x86/kvm/vmx/evmcs.h
index bd41d9462355..150e7921b5fd 100644
--- a/arch/x86/kvm/vmx/evmcs.h
+++ b/arch/x86/kvm/vmx/evmcs.h
@@ -205,8 +205,8 @@ enum nested_evmptrld_status {
 };
 
 bool nested_enlightened_vmentry(struct kvm_vcpu *vcpu, u64 *evmcs_gpa);
-uint16_t nested_get_evmcs_version(struct kvm_vcpu *vcpu);
-int nested_enable_evmcs(struct kvm_vcpu *vcpu,
+uint16_t nested_vmx_get_evmcs_version(struct kvm_vcpu *vcpu);
+int nested_vmx_enable_evmcs(struct kvm_vcpu *vcpu,
 			uint16_t *vmcs_version);
 void nested_evmcs_filter_control_msr(u32 msr_index, u64 *pdata);
 int nested_evmcs_check_controls(struct vmcs12 *vmcs12);
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index d97fbf1a6a17..c26acf1dcce4 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -3223,7 +3223,12 @@ static bool nested_get_vmcs12_pages(struct kvm_vcpu *vcpu)
 	return true;
 }
 
-static int nested_vmx_write_pml_buffer(struct kvm_vcpu *vcpu, gpa_t gpa)
+static bool nested_vmx_get_pages(struct kvm_vcpu *vcpu)
+{
+	return nested_get_vmcs12_pages(vcpu);
+}
+
+static int nested_vmx_write_log_dirty(struct kvm_vcpu *vcpu, gpa_t gpa)
 {
 	struct vmcs12 *vmcs12;
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
@@ -3769,13 +3774,13 @@ static void nested_vmx_update_pending_dbg(struct kvm_vcpu *vcpu)
 			    vcpu->arch.exception.payload);
 }
 
-static bool nested_vmx_preemption_timer_pending(struct kvm_vcpu *vcpu)
+static bool nested_vmx_hv_timer_pending(struct kvm_vcpu *vcpu)
 {
 	return nested_cpu_has_preemption_timer(get_vmcs12(vcpu)) &&
 	       to_vmx(vcpu)->nested.preemption_timer_expired;
 }
 
-static int vmx_check_nested_events(struct kvm_vcpu *vcpu)
+static int nested_vmx_check_events(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 	unsigned long exit_qual;
@@ -3830,7 +3835,7 @@ static int vmx_check_nested_events(struct kvm_vcpu *vcpu)
 		return 0;
 	}
 
-	if (nested_vmx_preemption_timer_pending(vcpu)) {
+	if (nested_vmx_hv_timer_pending(vcpu)) {
 		if (block_nested_events)
 			return -EBUSY;
 		nested_vmx_vmexit(vcpu, EXIT_REASON_PREEMPTION_TIMER, 0, 0);
@@ -5964,7 +5969,7 @@ bool nested_vmx_reflect_vmexit(struct kvm_vcpu *vcpu)
 	return true;
 }
 
-static int vmx_get_nested_state(struct kvm_vcpu *vcpu,
+static int nested_vmx_get_state(struct kvm_vcpu *vcpu,
 				struct kvm_nested_state __user *user_kvm_nested_state,
 				u32 user_data_size)
 {
@@ -6088,7 +6093,7 @@ void vmx_leave_nested(struct kvm_vcpu *vcpu)
 	free_nested(vcpu);
 }
 
-static int vmx_set_nested_state(struct kvm_vcpu *vcpu,
+static int nested_vmx_set_state(struct kvm_vcpu *vcpu,
 				struct kvm_nested_state __user *user_kvm_nested_state,
 				struct kvm_nested_state *kvm_state)
 {
@@ -6568,13 +6573,15 @@ __init int nested_vmx_hardware_setup(int (*exit_handlers[])(struct kvm_vcpu *))
 	return 0;
 }
 
+#define KVM_X86_NESTED_OP_NAME(name) .name = nested_vmx_##name
+
 struct kvm_x86_nested_ops vmx_nested_ops = {
-	.check_events = vmx_check_nested_events,
-	.hv_timer_pending = nested_vmx_preemption_timer_pending,
-	.get_state = vmx_get_nested_state,
-	.set_state = vmx_set_nested_state,
-	.get_pages = nested_get_vmcs12_pages,
-	.write_log_dirty = nested_vmx_write_pml_buffer,
-	.enable_evmcs = nested_enable_evmcs,
-	.get_evmcs_version = nested_get_evmcs_version,
+	KVM_X86_NESTED_OP_NAME(check_events),
+	KVM_X86_NESTED_OP_NAME(hv_timer_pending),
+	KVM_X86_NESTED_OP_NAME(get_state),
+	KVM_X86_NESTED_OP_NAME(set_state),
+	KVM_X86_NESTED_OP_NAME(get_pages),
+	KVM_X86_NESTED_OP_NAME(write_log_dirty),
+	KVM_X86_NESTED_OP_NAME(enable_evmcs),
+	KVM_X86_NESTED_OP_NAME(get_evmcs_version),
 };
-- 
2.18.4


