Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E046F2C0D2C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:24:45 +0100 (CET)
Received: from localhost ([::1]:54350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khClo-000811-TO
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:24:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcS-0003IR-VF
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:15:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcN-0007qE-Uj
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:15:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606140899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JCAUP+bdY+naX1MLWRT/UStOEqxYOBv8TaUS9sHNWfY=;
 b=aY35qkInRRbQAnTKLZmxhz/iTje88Zx9qC2br1DAKEsO3wi0QG7ck0/tjEAi1QcjZe1zSs
 UvEmV4/ZPg5eBUNvyjmqtmX+MRPQJe3GRXAsvLUw0MzY4m7r39HoXzZht0dWoIzYwwNBQl
 o+y748yRsq6PLeYrjs7zl7J+6qV1bA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-9c5ZEvNPNAOnFZ5P4VSAZw-1; Mon, 23 Nov 2020 09:14:56 -0500
X-MC-Unique: 9c5ZEvNPNAOnFZ5P4VSAZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82F825224
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 525FB5D9E3
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:55 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/36] vl: allow -incoming defer with -preconfig
Date: Mon, 23 Nov 2020 09:14:27 -0500
Message-Id: <20201123141435.2726558-29-pbonzini@redhat.com>
In-Reply-To: <20201123141435.2726558-1-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Now that there is no RUN_STATE_PRECONFIG anymore that can conflict with
RUN_STATE_INMIGRATE, we can allow -incoming defer with -preconfig.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index aa11fc4871..0ba1fcdb3d 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3200,9 +3200,8 @@ static void qemu_validate_options(void)
                      "mutually exclusive");
         exit(EXIT_FAILURE);
     }
-    if (incoming && preconfig_requested) {
-        error_report("'preconfig' and 'incoming' options are "
-                     "mutually exclusive");
+    if (incoming && preconfig_requested && strcmp(incoming, "defer") != 0) {
+        error_report("'preconfig' supports '-incoming defer' only");
         exit(EXIT_FAILURE);
     }
 
-- 
2.26.2



