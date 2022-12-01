Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C272C63F0EF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 13:54:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0iQ6-0004MZ-Hq; Thu, 01 Dec 2022 07:12:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iPu-0004H3-3I
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:11:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iPp-0008FM-4t
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:11:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669896704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMuPo184aR/4lwa6QLLu9EahT8n7bDM18SU1zwC9j58=;
 b=Npra/TbFvODY3kDBaUlUhSUglaiJZTx5waapIaZN+kP2+CneSqgVly2s0CGLidFt8BwqpA
 r2Px0DI8ue00CDtg6qQXHH/PiAV7vxcYLVBk4iwFWzGaGpxpEPpTBvMi+pKBxp53GAPbM1
 WGGclghvxeBF5LSyCnbdO3qb4HFEjVc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-YBJ9Ip5aP3uIdM01d5JEsQ-1; Thu, 01 Dec 2022 07:11:41 -0500
X-MC-Unique: YBJ9Ip5aP3uIdM01d5JEsQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F79329A8AA2;
 Thu,  1 Dec 2022 12:11:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAA824022C0;
 Thu,  1 Dec 2022 12:11:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 07EA721E65CF; Thu,  1 Dec 2022 13:11:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, dgilbert@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 13/13] pci: Reject pcie_aer_inject_error -c with symbolic
 error status
Date: Thu,  1 Dec 2022 13:11:33 +0100
Message-Id: <20221201121133.3813857-14-armbru@redhat.com>
In-Reply-To: <20221201121133.3813857-1-armbru@redhat.com>
References: <20221201121133.3813857-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When argument @error_status is symbolic, flag -c is ignored.  Reject
it instead.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/pci/pci-hmp-cmds.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
index 7a3175ab4b..043b0a601d 100644
--- a/hw/pci/pci-hmp-cmds.c
+++ b/hw/pci/pci-hmp-cmds.c
@@ -189,6 +189,11 @@ void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
         }
         error_status = num;
         correctable = qdict_get_try_bool(qdict, "correctable", false);
+    } else {
+        if (qdict_haskey(qdict, "correctable")) {
+            error_setg(&err, "-c is only valid with numeric error status");
+            goto out;
+        }
     }
     aer_err.status = error_status;
     aer_err.source_id = pci_requester_id(dev);
-- 
2.37.3


