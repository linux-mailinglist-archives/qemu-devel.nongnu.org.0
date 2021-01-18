Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BDF2FA689
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 17:43:43 +0100 (CET)
Received: from localhost ([::1]:55352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Xd0-00030A-4o
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 11:43:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRR-0002OB-3d
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRF-0001UU-B4
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610987492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmJyIGDPdWHaMt7OEmKZFXb9XT1fbaCB/fWfKNelDxc=;
 b=f9s33qRItgmGUBy7HXjzHKWQVPy0oC+Y+CMyVsH6ZY85r6CkPf+jY07zUmVmF5cB+o0Isz
 XUWI0B8oDV6U6nbfsd9DVxASDJws5KqBfG2A0GRF/kLnfjN/M48dsgf2TSb/5p+S4iqwy2
 NWi0Q/+OA1zM7XNO8kchVsSF7uROrf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-W-OpiRmWM2iR_uyj-WYB8A-1; Mon, 18 Jan 2021 11:31:30 -0500
X-MC-Unique: W-OpiRmWM2iR_uyj-WYB8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA9458066E5
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 16:31:29 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48C3F17B0B;
 Mon, 18 Jan 2021 16:31:29 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/25] hmp: replace "O" parser with keyval
Date: Mon, 18 Jan 2021 11:30:56 -0500
Message-Id: <20210118163113.780171-9-pbonzini@redhat.com>
In-Reply-To: <20210118163113.780171-1-pbonzini@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

HMP is using QemuOpts to parse free-form commands device_add,
netdev_add and object_add.  However, none of these need QemuOpts
for validation (these three QemuOptsLists are all of the catch-all
kind), and keyval is already able to parse into QDict.  So use
keyval directly, avoiding the detour from
string to QemuOpts to QDict.

The args_type now stores the implied key.  This arguably makes more
sense than storing the QemuOptsList name; at least, it _is_ a key
that might end up in the arguments QDict.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands.hx |  6 +++---
 monitor/hmp.c   | 20 +++++++++-----------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 73e0832ea1..6ee746b53e 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -669,7 +669,7 @@ ERST
 
     {
         .name       = "device_add",
-        .args_type  = "device:O",
+        .args_type  = "driver:O",
         .params     = "driver[,prop=value][,...]",
         .help       = "add device, like -device on the command line",
         .cmd        = hmp_device_add,
@@ -1315,7 +1315,7 @@ ERST
 
     {
         .name       = "netdev_add",
-        .args_type  = "netdev:O",
+        .args_type  = "type:O",
         .params     = "[user|tap|socket|vde|bridge|hubport|netmap|vhost-user],id=str[,prop=value][,...]",
         .help       = "add host network device",
         .cmd        = hmp_netdev_add,
@@ -1343,7 +1343,7 @@ ERST
 
     {
         .name       = "object_add",
-        .args_type  = "object:O",
+        .args_type  = "qom-type:O",
         .params     = "[qom-type=]type,id=str[,prop=value][,...]",
         .help       = "create QOM object",
         .cmd        = hmp_object_add,
diff --git a/monitor/hmp.c b/monitor/hmp.c
index 6c0b33a0b1..d2cb886da5 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -744,13 +744,9 @@ static QDict *monitor_parse_arguments(Monitor *mon,
             break;
         case 'O':
             {
-                QemuOptsList *opts_list;
-                QemuOpts *opts;
+                Error *errp;
+                bool help;
 
-                opts_list = qemu_find_opts(key);
-                if (!opts_list || opts_list->desc->name) {
-                    goto bad_type;
-                }
                 while (qemu_isspace(*p)) {
                     p++;
                 }
@@ -760,12 +756,14 @@ static QDict *monitor_parse_arguments(Monitor *mon,
                 if (get_str(buf, sizeof(buf), &p) < 0) {
                     goto fail;
                 }
-                opts = qemu_opts_parse_noisily(opts_list, buf, true);
-                if (!opts) {
-                    goto fail;
+                keyval_parse_into(qdict, buf, key, &help, &errp);
+                if (help) {
+                    if (qdict_haskey(qdict, key)) {
+                        qdict_put_bool(qdict, "help", true);
+                    } else {
+                        qdict_put_str(qdict, key, "help");
+                    }
                 }
-                qemu_opts_to_qdict(opts, qdict);
-                qemu_opts_del(opts);
             }
             break;
         case '/':
-- 
2.26.2



