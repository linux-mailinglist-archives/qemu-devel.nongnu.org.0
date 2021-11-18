Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E724455CF5
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 14:47:33 +0100 (CET)
Received: from localhost ([::1]:42458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnhlE-00026r-AK
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 08:47:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnhaC-0008FH-BN
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:36:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnha9-0002mv-TU
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637242564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uIRPYc+XbbN/gDdZNFNpMojMoOex7CBq55PiFFzw3r8=;
 b=DNJAMmpzz3QyXEW2XCBB4qRsx64kbFozComG9iZ6Pxl4QBCojAMRmKNHYS48EZs7JxbGlm
 4AUNb4iBazSGTs47u89o9kjmyQocmHbdsc04tgR3mR2/TyedoZeiKpxpvaWNoVE/1boRmH
 a60mei9azKqH0rvObY0PvYTOabeQ+yw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-3KTXJAtrMM6N6AzudDP1nQ-1; Thu, 18 Nov 2021 08:36:01 -0500
X-MC-Unique: 3KTXJAtrMM6N6AzudDP1nQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E21E487D545;
 Thu, 18 Nov 2021 13:35:59 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5FE162A41;
 Thu, 18 Nov 2021 13:35:57 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/6] target/i386/sev: Add kernel hashes only if
 sev-guest.kernel-hashes=on
Date: Thu, 18 Nov 2021 13:35:28 +0000
Message-Id: <20211118133532.2029166-3-berrange@redhat.com>
In-Reply-To: <20211118133532.2029166-1-berrange@redhat.com>
References: <20211118133532.2029166-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

Commit cff03145ed3c ("sev/i386: Introduce sev_add_kernel_loader_hashes
for measured linux boot", 2021-09-30) introduced measured direct boot
with -kernel, using an OVMF-designated hashes table which QEMU fills.

However, if OVMF doesn't designate such an area, QEMU would completely
abort the VM launch.  This breaks launching with -kernel using older
OVMF images which don't publish the SEV_HASH_TABLE_RV_GUID.

Fix that so QEMU will only look for the hashes table if the sev-guest
kernel-hashes option is set to on.  Otherwise, QEMU won't look for the
designated area in OVMF and won't fill that area.

To enable addition of kernel hashes, launch the guest with:

    -object sev-guest,...,kernel-hashes=on

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
Acked-by: Brijesh Singh <brijesh.singh@amd.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/i386/sev.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index cad32812f5..e3abbeef68 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -1223,6 +1223,14 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     size_t hash_len = HASH_SIZE;
     int aligned_len;
 
+    /*
+     * Only add the kernel hashes if the sev-guest configuration explicitly
+     * stated kernel-hashes=on.
+     */
+    if (!sev_guest->kernel_hashes) {
+        return false;
+    }
+
     if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
         error_setg(errp, "SEV: kernel specified but OVMF has no hash table guid");
         return false;
-- 
2.31.1


