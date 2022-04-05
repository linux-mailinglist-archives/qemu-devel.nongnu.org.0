Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1F04F296C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 11:24:59 +0200 (CEST)
Received: from localhost ([::1]:58856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbfQn-0000Wx-NA
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 05:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nbfMS-0006pz-GV
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:20:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nbfMN-0001s1-Hw
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:20:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649150422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MSIIupJkNjNuDdJLmggJgcRZoBsx2nog8emsWpZU8tE=;
 b=FuC80AvHICRZWhNhaeLU6fsTW4U+1GfCMHbfAWd4crWmAzsMVGeEWQslWn6+MtM5puOKII
 lnPbEI0qUWpyDQGwJhUJSIhMNRKjlUlrqvoqQmy5htXzwArwmcKy+ZSAPAXsVu01pwmsoq
 RaZWwJQ8FR5DquMqGdRU/LU0nlaWI+M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-pMfRKna5OaOgOUqnWcxDwA-1; Tue, 05 Apr 2022 05:20:19 -0400
X-MC-Unique: pMfRKna5OaOgOUqnWcxDwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2DCC3800509;
 Tue,  5 Apr 2022 09:20:18 +0000 (UTC)
Received: from avogadro.mxp.redhat.com (unknown [10.32.181.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87A0B2167D9B;
 Tue,  5 Apr 2022 09:20:14 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] docs/system/i386: Add measurement calculation details to
 amd-memory-encryption
Date: Tue,  5 Apr 2022 11:20:01 +0200
Message-Id: <20220405092001.104507-4-pbonzini@redhat.com>
In-Reply-To: <20220405092001.104507-1-pbonzini@redhat.com>
References: <20220405092001.104507-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Dov Murik <dovmurik@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

Add a section explaining how the Guest Owner should calculate the
expected guest launch measurement for SEV and SEV-ES.

Also update the name and links to the SEV API Spec document.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Suggested-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20220217110059.2320497-1-dovmurik@linux.ibm.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/i386/amd-memory-encryption.rst | 54 ++++++++++++++++++++--
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/docs/system/i386/amd-memory-encryption.rst b/docs/system/i386/amd-memory-encryption.rst
index 215946f813..dcf4add0e7 100644
--- a/docs/system/i386/amd-memory-encryption.rst
+++ b/docs/system/i386/amd-memory-encryption.rst
@@ -47,7 +47,7 @@ The guest policy is passed as plaintext. A hypervisor may choose to read it,
 but should not modify it (any modification of the policy bits will result
 in bad measurement). The guest policy is a 4-byte data structure containing
 several flags that restricts what can be done on a running SEV guest.
-See KM Spec section 3 and 6.2 for more details.
+See SEV API Spec ([SEVAPI]_) section 3 and 6.2 for more details.
 
 The guest policy can be provided via the ``policy`` property::
 
@@ -92,7 +92,7 @@ expects.
 ``LAUNCH_FINISH`` finalizes the guest launch and destroys the cryptographic
 context.
 
-See SEV KM API Spec ([SEVKM]_) 'Launching a guest' usage flow (Appendix A) for the
+See SEV API Spec ([SEVAPI]_) 'Launching a guest' usage flow (Appendix A) for the
 complete flow chart.
 
 To launch a SEV guest::
@@ -118,6 +118,49 @@ a SEV-ES guest:
  - Requires in-kernel irqchip - the burden is placed on the hypervisor to
    manage booting APs.
 
+Calculating expected guest launch measurement
+---------------------------------------------
+
+In order to verify the guest launch measurement, The Guest Owner must compute
+it in the exact same way as it is calculated by the AMD-SP.  SEV API Spec
+([SEVAPI]_) section 6.5.1 describes the AMD-SP operations:
+
+    GCTX.LD is finalized, producing the hash digest of all plaintext data
+    imported into the guest.
+
+    The launch measurement is calculated as:
+
+    HMAC(0x04 || API_MAJOR || API_MINOR || BUILD || GCTX.POLICY || GCTX.LD || MNONCE; GCTX.TIK)
+
+    where "||" represents concatenation.
+
+The values of API_MAJOR, API_MINOR, BUILD, and GCTX.POLICY can be obtained
+from the ``query-sev`` qmp command.
+
+The value of MNONCE is part of the response of ``query-sev-launch-measure``: it
+is the last 16 bytes of the base64-decoded data field (see SEV API Spec
+([SEVAPI]_) section 6.5.2 Table 52: LAUNCH_MEASURE Measurement Buffer).
+
+The value of GCTX.LD is
+``SHA256(firmware_blob || kernel_hashes_blob || vmsas_blob)``, where:
+
+* ``firmware_blob`` is the content of the entire firmware flash file (for
+  example, ``OVMF.fd``).  Note that you must build a stateless firmware file
+  which doesn't use an NVRAM store, because the NVRAM area is not measured, and
+  therefore it is not secure to use a firmware which uses state from an NVRAM
+  store.
+* if kernel is used, and ``kernel-hashes=on``, then ``kernel_hashes_blob`` is
+  the content of PaddedSevHashTable (including the zero padding), which itself
+  includes the hashes of kernel, initrd, and cmdline that are passed to the
+  guest.  The PaddedSevHashTable struct is defined in ``target/i386/sev.c``.
+* if SEV-ES is enabled (``policy & 0x4 != 0``), ``vmsas_blob`` is the
+  concatenation of all VMSAs of the guest vcpus.  Each VMSA is 4096 bytes long;
+  its content is defined inside Linux kernel code as ``struct vmcb_save_area``,
+  or in AMD APM Volume 2 ([APMVOL2]_) Table B-2: VMCB Layout, State Save Area.
+
+If kernel hashes are not used, or SEV-ES is disabled, use empty blobs for
+``kernel_hashes_blob`` and ``vmsas_blob`` as needed.
+
 Debugging
 ---------
 
@@ -142,8 +185,11 @@ References
 `AMD Memory Encryption whitepaper
 <https://developer.amd.com/wordpress/media/2013/12/AMD_Memory_Encryption_Whitepaper_v7-Public.pdf>`_
 
-.. [SEVKM] `Secure Encrypted Virtualization Key Management
-   <http://developer.amd.com/wordpress/media/2017/11/55766_SEV-KM-API_Specification.pdf>`_
+.. [SEVAPI] `Secure Encrypted Virtualization API
+   <https://www.amd.com/system/files/TechDocs/55766_SEV-KM_API_Specification.pdf>`_
+
+.. [APMVOL2] `AMD64 Architecture Programmer's Manual Volume 2: System Programming
+   <https://www.amd.com/system/files/TechDocs/24593.pdf>`_
 
 KVM Forum slides:
 
-- 
2.35.1


