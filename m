Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5A730F939
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:12:52 +0100 (CET)
Received: from localhost ([::1]:60140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7iBX-0006gE-N9
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hhM-0002u6-7L
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:41:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hhJ-0005OM-C1
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612456896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2/g6xzZ/kCZp2f4ptDqdlxGVJM9ZkpZgAyouxgPX+5A=;
 b=LiVxvRe6JoMJXObGLqH1BtEGv9AjkTJNsgLmZEd5Mx7naVklMx+3w5iToQhhwr2xnv18d3
 ioGV1Xa4gAYW0cE1TWxMAykH2rcAFzbdMBb3T7TA2gwzQfQA8idYGkYLr1Zhn2cmVHTVz7
 Avbgk5VqP+TVtcR00BQBzN021wVsrHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-uy2_nTcvM3CrHW6Rnilchg-1; Thu, 04 Feb 2021 11:41:32 -0500
X-MC-Unique: uy2_nTcvM3CrHW6Rnilchg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75295C7400;
 Thu,  4 Feb 2021 16:41:31 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-21.ams2.redhat.com
 [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF33F19708;
 Thu,  4 Feb 2021 16:41:26 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com
Subject: [PULL 15/27] migration: Display the migration blockers
Date: Thu,  4 Feb 2021 16:39:47 +0000
Message-Id: <20210204163959.377618-16-dgilbert@redhat.com>
In-Reply-To: <20210204163959.377618-1-dgilbert@redhat.com>
References: <20210204163959.377618-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Message-Id: <20210202135522.127380-3-dgilbert@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 monitor/hmp-cmds.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 509d6b01ee..992ecf6f04 100644
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


