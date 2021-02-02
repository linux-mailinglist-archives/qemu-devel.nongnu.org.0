Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED4030C0BD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:08:19 +0100 (CET)
Received: from localhost ([::1]:47166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wLq-000853-NP
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:08:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l6w9n-0005ae-KD
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:55:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l6w9j-0005Yv-Sx
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:55:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612274145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w5V1cOG4naTOB/COZ6/JrnO6hdM6BVewsFWA2JDFqRU=;
 b=C7FRwQsDjKhYa+qXpHjkx0cSLKX8UXEFJ5vmAimSwCyJhdzl7eVPLihvda/zxDdVp120aX
 LayQutDSgEdA23KO6Pp6ROZuHQoaoxKhCgh0DFprt3scq0o5kg7kFoJZSeRX45Mmb04nNv
 L+M7Fe+mqaWaSnynf8QbeV8XtZACVtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-C0nueydYPgqiSg4aVULOzw-1; Tue, 02 Feb 2021 08:55:43 -0500
X-MC-Unique: C0nueydYPgqiSg4aVULOzw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16BD89CC0B
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 13:55:43 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-83.ams2.redhat.com
 [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE8676EF41;
 Tue,  2 Feb 2021 13:55:41 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, peterx@redhat.com, eblake@redhat.com,
 alex.williamson@redhat.com, laine@redhat.com
Subject: [PATCH 2/2] migration: Display the migration blockers
Date: Tue,  2 Feb 2021 13:55:22 +0000
Message-Id: <20210202135522.127380-3-dgilbert@redhat.com>
In-Reply-To: <20210202135522.127380-1-dgilbert@redhat.com>
References: <20210202135522.127380-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Update 'info migrate' to display migration blocking information.
If the outbound migration is not blocked, there is no change, however
if it is blocked a message is displayed with a list of reasons why,
e.g.

qemu-system-x86_64 -nographic  -smp 4 -m 4G -M pc,usb=on \
 -chardev null,id=n -device usb-serial,chardev=n \
 -virtfs local,path=/home,mount_tag=fs,security_model=none \
 -drive if=virtio,file=myimage.qcow2

(qemu) info migrate
globals:
store-global-state: on
only-migratable: off
send-configuration: on
send-section-footer: on
decompress-error-check: on
clear-bitmap-shift: 18
Outgoing migration blocked:
  Migration is disabled when VirtFS export path '/home' is mounted in the guest using mount_tag 'fs'
  non-migratable device: 0000:00:01.2/1/usb-serial

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 monitor/hmp-cmds.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index a48bc1e904..1f744f6041 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -224,6 +224,15 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
 
     migration_global_dump(mon);
 
+    if (info->blocked) {
+        strList *reasons = info->blocked_reasons;
+        monitor_printf(mon, "Outgoing migration blocked:\n");
+        while (reasons) {
+            monitor_printf(mon, "  %s\n", reasons->value);
+            reasons = reasons->next;
+        }
+    }
+
     if (info->has_status) {
         monitor_printf(mon, "Migration status: %s",
                        MigrationStatus_str(info->status));
-- 
2.29.2


