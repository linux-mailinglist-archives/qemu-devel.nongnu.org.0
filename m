Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448233A24CF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:54:29 +0200 (CEST)
Received: from localhost ([::1]:48392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrEaC-0004Wf-8N
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESq-0008Mr-Ne
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESn-0005bJ-ER
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623307608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bsDSEZHNo/Alerya/rQccn2RkvkTAbWl3TalIqQPVK0=;
 b=M5zbnJ/fn5kazmjISKEK3DRvPp+fCyumBYvCVKDgu/DPoOjkpZFcNoBB4vBTMhSBIwRmSv
 mHdx8BJ9otfKEBz297CwuN4dJ6NO5dSFDOz+fnDgx+cYzHUYWSgWG4xnu3cri18vxIp/k3
 8wYWSvhL6oXysfYZ3rIarP43e2mQVfg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-DxpslVfePdiKH7YcdyVVpg-1; Thu, 10 Jun 2021 02:46:48 -0400
X-MC-Unique: DxpslVfePdiKH7YcdyVVpg-1
Received: by mail-wr1-f72.google.com with SMTP id
 h10-20020a5d688a0000b0290119c2ce2499so403571wru.19
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 23:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bsDSEZHNo/Alerya/rQccn2RkvkTAbWl3TalIqQPVK0=;
 b=f2pkqQKL/KAGJXtBwg1j0Mpv7PvfPyFFsZmdiKahGP6CgtohyRigFHI5eKYgQtX1Z7
 45vHQOj80FLQ35Qp1kvcwdJ236tC/zl6guP2XpQZ8+dw8CqKwaW9CXdqBgw6iL46IkG/
 x9wW2tLmS+HeoAW61eXbodR6lsSYHAZ57foRIf3VnAJosuD57e9qI2yqIl5JGkruCGu/
 aBqZvfGRZJ9LYafZ9DPoIr7kp80JH1wKrQqervU6OD4sDoK8ETO3xaGLWXe6U2McEHKK
 ROmxFL3VdDyXeqeSb7iYayncn7UFCgmX7Yh0XULWfa3pxlOiHHmzUWMdTiHrlllMvNJZ
 KNaw==
X-Gm-Message-State: AOAM532zOjalVkV+CUAMxihmD5ZINWlBUUYLOgpwzxwm+tsqx2hHNwqg
 GHseMn/dgpPkCsJ22ItVBYgGHU9c+GpW7+YjkoSjxhgFqas1XoExLbUoO8rAm+TaerdqrnS4vE8
 B+a+nbHqVOy6cv4kEdGD5xnJElklIRubyoQDiKJ1eRRhYMzOMwbGQCXLGQau0uUfZ
X-Received: by 2002:a5d:6e0d:: with SMTP id h13mr3639759wrz.118.1623307606587; 
 Wed, 09 Jun 2021 23:46:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoMqBQzSEIDPhtn+U1WPKOViLtnTR8w/NhzGhlY/FbON1/5ZMe5byPybtrz6pp4xv4o53j3g==
X-Received: by 2002:a5d:6e0d:: with SMTP id h13mr3639737wrz.118.1623307606396; 
 Wed, 09 Jun 2021 23:46:46 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id b8sm8979812wmd.35.2021.06.09.23.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 23:46:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/11] monitor: Restrict 'info sev' to x86 targets
Date: Thu, 10 Jun 2021 08:45:56 +0200
Message-Id: <20210610064556.1421620-12-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610064556.1421620-1-philmd@redhat.com>
References: <20210610064556.1421620-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/monitor/hmp-target.h  | 1 +
 include/monitor/hmp.h         | 1 -
 target/i386/sev-sysemu-stub.c | 2 +-
 target/i386/sev.c             | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
index 60fc92722ae..20adbea5154 100644
--- a/include/monitor/hmp-target.h
+++ b/include/monitor/hmp-target.h
@@ -49,5 +49,6 @@ void hmp_info_tlb(Monitor *mon, const QDict *qdict);
 void hmp_mce(Monitor *mon, const QDict *qdict);
 void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
 void hmp_info_io_apic(Monitor *mon, const QDict *qdict);
+void hmp_info_sev(Monitor *mon, const QDict *qdict);
 
 #endif /* MONITOR_HMP_TARGET_H */
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 605d57287ae..ac03adc6f0a 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -124,7 +124,6 @@ void hmp_info_ramblock(Monitor *mon, const QDict *qdict);
 void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict);
 void hmp_info_vm_generation_id(Monitor *mon, const QDict *qdict);
 void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict);
-void hmp_info_sev(Monitor *mon, const QDict *qdict);
 void hmp_info_replay(Monitor *mon, const QDict *qdict);
 void hmp_replay_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index 7a35f0432b2..aba02f3c332 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "monitor/monitor.h"
-#include "monitor/hmp.h"
+#include "monitor/hmp-target.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/error.h"
diff --git a/target/i386/sev.c b/target/i386/sev.c
index b4d7c41d3fb..0103b28c396 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -32,7 +32,7 @@
 #include "migration/blocker.h"
 #include "qom/object.h"
 #include "monitor/monitor.h"
-#include "monitor/hmp.h"
+#include "monitor/hmp-target.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qmp/qerror.h"
 #include "exec/confidential-guest-support.h"
-- 
2.31.1


