Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBF32CBA75
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:22:54 +0100 (CET)
Received: from localhost ([::1]:43556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPHh-0004KG-GH
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3t-0003o9-1H
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3k-0004ho-2X
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BoJ3XvQ0tVnF5H2CCu+E74UV9iiZdfXWn+0QvEwvKpM=;
 b=MLaY3F+vFIGNq7moYygl4eYQB4/Tze/yq9GVLXOTvncUKkRTPlciwuswPC4VF/AfVEN9Rz
 9Km/nL43wOBRNryzfszXTDz9sp8NbhmqHdQo8u+augygPc3hOg5u07hzpdrUPRMVwsXaeF
 r2ReHfAzjYKPrLda/uBrB+SYx00A1yU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-pAlgo7nYOFykKW_oI9516g-1; Wed, 02 Dec 2020 04:04:19 -0500
X-MC-Unique: pAlgo7nYOFykKW_oI9516g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5FAD101AFD0;
 Wed,  2 Dec 2020 09:03:43 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 445426085A;
 Wed,  2 Dec 2020 09:03:43 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/28] hmp: replace "O" parser with keyval
Date: Wed,  2 Dec 2020 04:02:47 -0500
Message-Id: <20201202090305.4129317-11-pbonzini@redhat.com>
In-Reply-To: <20201202090305.4129317-1-pbonzini@redhat.com>
References: <20201202090305.4129317-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org
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
index 737c647c46..b3e54de27a 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -676,7 +676,7 @@ ERST
 
     {
         .name       = "device_add",
-        .args_type  = "device:O",
+        .args_type  = "driver:O",
         .params     = "driver[,prop=value][,...]",
         .help       = "add device, like -device on the command line",
         .cmd        = hmp_device_add,
@@ -1322,7 +1322,7 @@ ERST
 
     {
         .name       = "netdev_add",
-        .args_type  = "netdev:O",
+        .args_type  = "type:O",
         .params     = "[user|tap|socket|vde|bridge|hubport|netmap|vhost-user],id=str[,prop=value][,...]",
         .help       = "add host network device",
         .cmd        = hmp_netdev_add,
@@ -1352,7 +1352,7 @@ ERST
 
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



