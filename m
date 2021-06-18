Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C603AD34E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 22:01:49 +0200 (CEST)
Received: from localhost ([::1]:50462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKgW-00065g-7u
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 16:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1luKXs-0008HU-9h
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:52:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1luKXp-0006ri-Mt
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624045968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UgnhNLRla1fbf6uIxEwSl+pw9ZKjw537w0nBer4HyNk=;
 b=MTWTAFCqby/4G5+LN14qFLaRAZBSD6sgfmkvqUSBDhLIW6Qes7PjNLRCmPSoBFyaQixJGi
 /iESFGzgo9Dd9WJGmcQUDc2vfdRf/mvmposo18nMaYr1mt9F5KvbhpQwIhNKvTUwv87qm0
 XPd/aT1y18LMkGSiysN1XEvo6AJ9w78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-JYmmaoDONtaqz7jPTYfu_w-1; Fri, 18 Jun 2021 15:52:45 -0400
X-MC-Unique: JYmmaoDONtaqz7jPTYfu_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E63FF804140;
 Fri, 18 Jun 2021 19:52:44 +0000 (UTC)
Received: from localhost (unknown [10.22.9.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01F712C00F;
 Fri, 18 Jun 2021 19:52:41 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 4/7] docs: Add SEV-ES documentation to amd-memory-encryption.txt
Date: Fri, 18 Jun 2021 15:52:34 -0400
Message-Id: <20210618195237.442548-5-ehabkost@redhat.com>
In-Reply-To: <20210618195237.442548-1-ehabkost@redhat.com>
References: <20210618195237.442548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tom Lendacky <thomas.lendacky@amd.com>

Update the amd-memory-encryption.txt file with information about SEV-ES,
including how to launch an SEV-ES guest and some of the differences
between SEV and SEV-ES guests in regards to launching and measuring the
guest.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Acked-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Message-Id: <fa1825a5eb0290eac4712cde75ba4c6829946eac.1619208498.git.thomas.lendacky@amd.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/amd-memory-encryption.txt | 54 +++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 7 deletions(-)

diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
index ed85159ea7d..ffca382b5f5 100644
--- a/docs/amd-memory-encryption.txt
+++ b/docs/amd-memory-encryption.txt
@@ -15,6 +15,13 @@ includes commands for launching, snapshotting, migrating and debugging the
 encrypted guest. These SEV commands can be issued via KVM_MEMORY_ENCRYPT_OP
 ioctls.
 
+Secure Encrypted Virtualization - Encrypted State (SEV-ES) builds on the SEV
+support to additionally protect the guest register state. In order to allow a
+hypervisor to perform functions on behalf of a guest, there is architectural
+support for notifying a guest's operating system when certain types of VMEXITs
+are about to occur. This allows the guest to selectively share information with
+the hypervisor to satisfy the requested function.
+
 Launching
 ---------
 Boot images (such as bios) must be encrypted before a guest can be booted. The
@@ -24,6 +31,9 @@ together generate a fresh memory encryption key for the VM, encrypt the boot
 images and provide a measurement than can be used as an attestation of a
 successful launch.
 
+For a SEV-ES guest, the LAUNCH_UPDATE_VMSA command is also used to encrypt the
+guest register state, or VM save area (VMSA), for all of the guest vCPUs.
+
 LAUNCH_START is called first to create a cryptographic launch context within
 the firmware. To create this context, guest owner must provide a guest policy,
 its public Diffie-Hellman key (PDH) and session parameters. These inputs
@@ -40,6 +50,12 @@ The guest policy can be provided via the 'policy' property (see below)
 # ${QEMU} \
    sev-guest,id=sev0,policy=0x1...\
 
+Setting the "SEV-ES required" policy bit (bit 2) will launch the guest as a
+SEV-ES guest (see below)
+
+# ${QEMU} \
+   sev-guest,id=sev0,policy=0x5...\
+
 The guest owner provided DH certificate and session parameters will be used to
 establish a cryptographic session with the guest owner to negotiate keys used
 for the attestation.
@@ -55,13 +71,19 @@ created via the LAUNCH_START command. If required, this command can be called
 multiple times to encrypt different memory regions. The command also calculates
 the measurement of the memory contents as it encrypts.
 
-LAUNCH_MEASURE can be used to retrieve the measurement of encrypted memory.
-This measurement is a signature of the memory contents that can be sent to the
-guest owner as an attestation that the memory was encrypted correctly by the
-firmware. The guest owner may wait to provide the guest confidential information
-until it can verify the attestation measurement. Since the guest owner knows the
-initial contents of the guest at boot, the attestation measurement can be
-verified by comparing it to what the guest owner expects.
+LAUNCH_UPDATE_VMSA encrypts all the vCPU VMSAs for a SEV-ES guest using the
+cryptographic context created via the LAUNCH_START command. The command also
+calculates the measurement of the VMSAs as it encrypts them.
+
+LAUNCH_MEASURE can be used to retrieve the measurement of encrypted memory and,
+for a SEV-ES guest, encrypted VMSAs. This measurement is a signature of the
+memory contents and, for a SEV-ES guest, the VMSA contents, that can be sent
+to the guest owner as an attestation that the memory and VMSAs were encrypted
+correctly by the firmware. The guest owner may wait to provide the guest
+confidential information until it can verify the attestation measurement.
+Since the guest owner knows the initial contents of the guest at boot, the
+attestation measurement can be verified by comparing it to what the guest owner
+expects.
 
 LAUNCH_FINISH finalizes the guest launch and destroys the cryptographic
 context.
@@ -75,6 +97,22 @@ To launch a SEV guest
     -machine ...,confidential-guest-support=sev0 \
     -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1
 
+To launch a SEV-ES guest
+
+# ${QEMU} \
+    -machine ...,confidential-guest-support=sev0 \
+    -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x5
+
+An SEV-ES guest has some restrictions as compared to a SEV guest. Because the
+guest register state is encrypted and cannot be updated by the VMM/hypervisor,
+a SEV-ES guest:
+ - Does not support SMM - SMM support requires updating the guest register
+   state.
+ - Does not support reboot - a system reset requires updating the guest register
+   state.
+ - Requires in-kernel irqchip - the burden is placed on the hypervisor to
+   manage booting APs.
+
 Debugging
 -----------
 Since the memory contents of a SEV guest are encrypted, hypervisor access to
@@ -101,8 +139,10 @@ Secure Encrypted Virtualization Key Management:
 
 KVM Forum slides:
 http://www.linux-kvm.org/images/7/74/02x08A-Thomas_Lendacky-AMDs_Virtualizatoin_Memory_Encryption_Technology.pdf
+https://www.linux-kvm.org/images/9/94/Extending-Secure-Encrypted-Virtualization-with-SEV-ES-Thomas-Lendacky-AMD.pdf
 
 AMD64 Architecture Programmer's Manual:
    http://support.amd.com/TechDocs/24593.pdf
    SME is section 7.10
    SEV is section 15.34
+   SEV-ES is section 15.35
-- 
2.31.1


