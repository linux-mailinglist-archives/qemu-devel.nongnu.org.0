Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB6E2F1188
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 12:32:50 +0100 (CET)
Received: from localhost ([::1]:44574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyvRJ-0002Jd-Pv
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 06:32:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kyvPO-0000ts-QK
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:30:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kyvPK-0006C3-4g
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:30:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610364644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=RadEWp2tgvOsq3z8poaAdp82sJpHsXnHF3C3wmp+MFw=;
 b=g6MTknWxBhb6PNCqLERV0BlWcD0m7Oia930U1ptiLA+ddjz5mVtcHPPy2Uhgzc3Kl8nVLw
 GA6ZYj/HmRZr7af03/qBxMPpZzHVV95RSxAUovNn62sUfRGXbBUzgcRApi5CxGkqz7/yqZ
 eQ4Vy4647V0V2oUOLQRKR2AEEAG2O7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-2Awd-z91N5-yEdal_62nXg-1; Mon, 11 Jan 2021 06:30:42 -0500
X-MC-Unique: 2Awd-z91N5-yEdal_62nXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8598F180A09F
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:30:41 +0000 (UTC)
Received: from workimage2020.rezanina.moe.rezanina.moe (unknown [10.40.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB5DD1972B
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:30:40 +0000 (UTC)
From: mrezanin@redhat.com
To: qemu-devel@nongnu.org
Subject: [RHEL7 qemu-kvm PATCH 2/3] s390x: Fix vm name copy length
Date: Mon, 11 Jan 2021 12:30:36 +0100
Message-Id: <e1ad733af7b23929456d05aacae693ce6462d4b3.1610364304.git.mrezanin@redhat.com>
In-Reply-To: <cover.1610364304.git.mrezanin@redhat.com>
References: <cover.1610364304.git.mrezanin@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miroslav Rezanina <mrezanin@redhat.com>

There are two cases when vm name is copied but closing \0 can be lost
in case name is too long (>=256 characters).

Updating length to copy so there is space for closing \0.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
---
 target/s390x/kvm.c         | 2 +-
 target/s390x/misc_helper.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index b8385e6b95..2313b5727e 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -1918,7 +1918,7 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
      */
     if (qemu_name) {
         strncpy((char *)sysib.ext_names[0], qemu_name,
-                sizeof(sysib.ext_names[0]));
+                sizeof(sysib.ext_names[0]) - 1);
     } else {
         strcpy((char *)sysib.ext_names[0], "KVMguest");
     }
diff --git a/target/s390x/misc_helper.c b/target/s390x/misc_helper.c
index 58dbc023eb..7c478b9e58 100644
--- a/target/s390x/misc_helper.c
+++ b/target/s390x/misc_helper.c
@@ -369,8 +369,10 @@ uint32_t HELPER(stsi)(CPUS390XState *env, uint64_t a0, uint64_t r0, uint64_t r1)
                 ebcdic_put(sysib.sysib_322.vm[0].name, qemu_name,
                            MIN(sizeof(sysib.sysib_322.vm[0].name),
                                strlen(qemu_name)));
+		memset((char *)sysib.sysib_322.ext_names[0], 0, 
+		       sizeof(sysib.sysib_322.ext_names[0]));
                 strncpy((char *)sysib.sysib_322.ext_names[0], qemu_name,
-                        sizeof(sysib.sysib_322.ext_names[0]));
+                        sizeof(sysib.sysib_322.ext_names[0]) - 1);
             } else {
                 ebcdic_put(sysib.sysib_322.vm[0].name, "TCGguest", 8);
                 strcpy((char *)sysib.sysib_322.ext_names[0], "TCGguest");
-- 
2.18.4


