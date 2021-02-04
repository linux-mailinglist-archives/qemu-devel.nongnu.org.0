Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC0F30F48F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:06:35 +0100 (CET)
Received: from localhost ([::1]:43068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fHG-00016F-IB
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7fCe-0003ge-DO
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:01:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7fCa-00007M-LL
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612447304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zLjgWV8Q3RCpZchbXm/5IEIRLVNhIvbQi4mRUsAJg3E=;
 b=g+HJsrrg2ulNeTeDAc1AaDnQ9oUhaqZzIH2lEpP+ZXL9CP57WOXWR6TKv1NyUa/XloqKYh
 MGSuPlo2nUiQQWGH0jDdywATuqF4lI6IX0UreZ6ZexVetbiCMC25Y7ScbohNBQvn7ji1+0
 5BU4YnwPDTJ0T2r/ltyIli5Ks26JznE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-v1UzqxL5NfGIT4GUYjIe8A-1; Thu, 04 Feb 2021 09:01:39 -0500
X-MC-Unique: v1UzqxL5NfGIT4GUYjIe8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25C40874982;
 Thu,  4 Feb 2021 14:01:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4D155C54B;
 Thu,  4 Feb 2021 14:01:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6B6EA113861E; Thu,  4 Feb 2021 15:01:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] monitor/qmp-cmds.c: Don't include ui/vnc.h
Date: Thu,  4 Feb 2021 15:01:28 +0100
Message-Id: <20210204140136.2769065-2-armbru@redhat.com>
In-Reply-To: <20210204140136.2769065-1-armbru@redhat.com>
References: <20210204140136.2769065-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The qmp-cmds.c file currently includes ui/vnc.h, which (being located
in the ui/ directory rather than include) is really supposed to be
for use only by the ui subsystem.  In fact the function prototypes we
need (vnc_display_password(), etc) are all declared in
include/ui/console.h, so we can switch to including that instead.

(ui/vnc.h includes include/ui/console.h, so this change strictly
reduces the quantity of headers qmp-cmds.c pulls in.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210104161200.15068-1-peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/qmp-cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 990936136c..c7df8c0ee2 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -23,7 +23,7 @@
 #include "qemu/uuid.h"
 #include "chardev/char.h"
 #include "ui/qemu-spice.h"
-#include "ui/vnc.h"
+#include "ui/console.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "sysemu/runstate-action.h"
-- 
2.26.2


