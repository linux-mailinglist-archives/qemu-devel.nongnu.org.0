Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870CE3EA9D0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 19:54:47 +0200 (CEST)
Received: from localhost ([::1]:51528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEEuk-0000eY-J7
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 13:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mEEu0-0008QM-Dy
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 13:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mEEtz-0003ok-1H
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 13:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628790838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D/awbQJjDoUzr4gtjWoclHcQlr8v6kKHmSeXHO7I3O0=;
 b=czi9KevK4awseP6PF6rElVoXzCIRMldtOa2Uh89Vb04TQr9JTB+GvJqqaETLNH5tF8ill7
 907zKufxGO908zzZY4WGqNd5DdTudHHQsK0H3Kqpqi2XXrP6DIYi+4vxds/7QhKlrQ2cpv
 U52TTYGZ9RmKoYEPqgzgHUV042b4+6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-AjhBBsdFOEC1UlI77orhNg-1; Thu, 12 Aug 2021 13:53:57 -0400
X-MC-Unique: AjhBBsdFOEC1UlI77orhNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E633107ACF5;
 Thu, 12 Aug 2021 17:53:56 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4A741017CE6;
 Thu, 12 Aug 2021 17:53:54 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 ?] hw/core: fix error checkig in smp_parse
Date: Thu, 12 Aug 2021 18:53:53 +0100
Message-Id: <20210812175353.4128471-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HEXHASH_WORD=1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The machine_set_smp() mistakenly checks 'errp' not '*errp',
and so thinks there is an error every single time it runs.
This causes it to jump to the end of the method, skipping
the max CPUs checks. The caller meanwhile sees no error
and so carries on execution. The result of all this is:

 $ qemu-system-x86_64 -smp -1
 qemu-system-x86_64: GLib: ../glib/gmem.c:142: failed to allocate 481036337048 bytes

instead of

 $ qemu-system-x86_64 -smp -1
 qemu-system-x86_64: Invalid SMP CPUs -1. The max CPUs supported by machine 'pc-i440fx-6.1' is 255

This is a regression from

  commit fe68090e8fbd6e831aaf3fc3bb0459c5cccf14cf
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu May 13 09:03:48 2021 -0400

    machine: add smp compound property

Closes: https://gitlab.com/qemu-project/qemu/-/issues/524
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 943974d411..ab4fca6546 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -832,7 +832,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
     }
 
     mc->smp_parse(ms, config, errp);
-    if (errp) {
+    if (*errp) {
         goto out_free;
     }
 
-- 
2.31.1


