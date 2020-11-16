Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55302B51C6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 21:01:20 +0100 (CET)
Received: from localhost ([::1]:46260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekge-0003Fl-LK
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 15:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kekdv-0001iK-Ou
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:58:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kekds-00027B-IG
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605556702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QSPnvg9euamjrYg5jqtgzZhjYxiV6NfN68S6J0bI35s=;
 b=cIYeIRg+pWnGJnZNJXnx/RWTYIAu1nCEXAY3i/IAcW4R4vUdj6Emwn+JbRuO+TJh2gw9jH
 9/W4RNt93VuWL0sZLNx4b41H67r/0nBvxW82IHFJeFQczhkJCnZH3w0dFusnGNyQbBWOUm
 qQGnJfdOL1TWpSbsuNG5x6W0DtREwMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-j6GX429pP46yJWWk-TW7Ag-1; Mon, 16 Nov 2020 14:58:18 -0500
X-MC-Unique: j6GX429pP46yJWWk-TW7Ag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 440F61007B09;
 Mon, 16 Nov 2020 19:58:17 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B70CF19930;
 Mon, 16 Nov 2020 19:58:16 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] kvm/i386: Set proper nested state format for SVM
Date: Mon, 16 Nov 2020 14:58:11 -0500
Message-Id: <20201116195815.48264-2-pbonzini@redhat.com>
In-Reply-To: <20201116195815.48264-1-pbonzini@redhat.com>
References: <20201116195815.48264-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tom Lendacky <thomas.lendacky@amd.com>

Currently, the nested state format is hardcoded to VMX. This will result
in kvm_put_nested_state() returning an error because the KVM SVM support
checks for the nested state to be KVM_STATE_NESTED_FORMAT_SVM. As a
result, kvm_arch_put_registers() errors out early.

Update the setting of the format based on the virtualization feature:
  VMX - KVM_STATE_NESTED_FORMAT_VMX
  SVM - KVM_STATE_NESTED_FORMAT_SVM

Also, fix the code formatting while at it.

Fixes: b16c0e20c7 ("KVM: add support for AMD nested live migration")
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Message-Id: <fe53d00fe0d884e812960781284cd48ae9206acc.1605546140.git.thomas.lendacky@amd.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index cf46259534..a2934dda02 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1820,12 +1820,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
             env->nested_state = g_malloc0(max_nested_state_len);
             env->nested_state->size = max_nested_state_len;
-            env->nested_state->format = KVM_STATE_NESTED_FORMAT_VMX;
 
             if (cpu_has_vmx(env)) {
-                    vmx_hdr = &env->nested_state->hdr.vmx;
-                    vmx_hdr->vmxon_pa = -1ull;
-                    vmx_hdr->vmcs12_pa = -1ull;
+                env->nested_state->format = KVM_STATE_NESTED_FORMAT_VMX;
+                vmx_hdr = &env->nested_state->hdr.vmx;
+                vmx_hdr->vmxon_pa = -1ull;
+                vmx_hdr->vmcs12_pa = -1ull;
+            } else {
+                env->nested_state->format = KVM_STATE_NESTED_FORMAT_SVM;
             }
         }
     }
-- 
2.26.2



