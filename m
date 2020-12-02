Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849422CB7DA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:58:02 +0100 (CET)
Received: from localhost ([::1]:35786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNxZ-0002lx-I8
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:58:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNDG-0003ep-5x
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCU-0003nA-9x
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BCcz3IqagfXITHFE47MYIxcESWpWBZMhNW+sh/x6UAw=;
 b=f2j9eZH/S1sqNY/e6yelNfW/MjgYT0KMtfHYIch715GJzcC/bWW93tNzraz5IdL/ZGXl/M
 +5O+XZrIFRPerZ4TDD8xV52CCz98MAdQ1dvX6MEvtW4VfZfCtB9zniI2cpxP5wWxNwMqZ5
 Mrqp5UcJcHFeUOe2SvYQTui4O3tRcBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-Rl20F8UUP52eEwvV00qYHA-1; Wed, 02 Dec 2020 03:09:18 -0500
X-MC-Unique: Rl20F8UUP52eEwvV00qYHA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8966803650
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:17 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8616E5D9C6
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:17 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 074/113] vl: start VM via qmp_cont
Date: Wed,  2 Dec 2020 03:08:10 -0500
Message-Id: <20201202080849.4125477-75-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
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
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Complement the previous patch by starting the VM with a QMP command.
The plan is that the user will be able to do the same, invoking two
commands "finish-machine-init" and "cont" instead of
"x-exit-preconfig".

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 20dd0cd517..dc8a47efcb 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -110,6 +110,7 @@
 #include "qapi/qapi-visit-ui.h"
 #include "qapi/qapi-commands-block-core.h"
 #include "qapi/qapi-commands-migration.h"
+#include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/qmp/qerror.h"
@@ -4565,7 +4566,7 @@ void qemu_init(int argc, char **argv, char **envp)
             }
         }
     } else if (autostart) {
-        vm_start();
+        qmp_cont(NULL);
     }
 
     accel_setup_post(current_machine);
-- 
2.26.2



