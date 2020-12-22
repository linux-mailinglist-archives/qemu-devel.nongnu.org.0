Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47952E0901
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 11:54:14 +0100 (CET)
Received: from localhost ([::1]:50910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krfIz-0000jJ-OT
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 05:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAj-0005KG-3E
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAg-0007Ff-2M
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608633937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Nz1+JD7BD6a78+WonLxY3zj+pyJHJlnXl7eXAUo2+E=;
 b=RF32p9dJ+CmVLTIMbqNtWBZmVKYlfsno502r+jNDXyjVGyCufWOqNwXKUTW0HSqvmdNRMJ
 MF3iIkBHFMihls7rQzwi6Z+S7yuXGA0Dlk8Qf4gdatp89yLZwqPKhdlLvqp20zLcvm2Pq8
 fDZ7kgyRt/h023Ct8Eb9yH8uOXfO8oc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-4YGcC7IgPouECMKlyUvURA-1; Tue, 22 Dec 2020 05:45:32 -0500
X-MC-Unique: 4YGcC7IgPouECMKlyUvURA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C121192CC67;
 Tue, 22 Dec 2020 10:45:28 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-192.ams2.redhat.com
 [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B21F7A319;
 Tue, 22 Dec 2020 10:45:26 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 12/14] s390x/pci: fix pcistb length
Date: Tue, 22 Dec 2020 11:45:01 +0100
Message-Id: <20201222104503.224510-13-cohuck@redhat.com>
In-Reply-To: <20201222104503.224510-1-cohuck@redhat.com>
References: <20201222104503.224510-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matthew Rosato <mjrosato@linux.ibm.com>

In pcistb_service_call, we are grabbing 8 bits from a guest register to
indicate the length of the store operation -- but per the architecture
the length is actually defined by 13 bits of the guest register.

Fixes: 863f6f52b7 ("s390: implement pci instructions")
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
Message-Id: <1608243397-29428-2-git-send-email-mjrosato@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/s390-pci-inst.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index d9e1e29f1e29..e23029399886 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -755,7 +755,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
     int i;
     uint32_t fh;
     uint8_t pcias;
-    uint8_t len;
+    uint16_t len;
     uint8_t buffer[128];
 
     if (env->psw.mask & PSW_MASK_PSTATE) {
@@ -765,7 +765,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
 
     fh = env->regs[r1] >> 32;
     pcias = (env->regs[r1] >> 16) & 0xf;
-    len = env->regs[r1] & 0xff;
+    len = env->regs[r1] & 0x1fff;
     offset = env->regs[r3];
 
     if (!(fh & FH_MASK_ENABLE)) {
-- 
2.26.2


