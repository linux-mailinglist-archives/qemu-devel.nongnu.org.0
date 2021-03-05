Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1048B32EEE9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:34:21 +0100 (CET)
Received: from localhost ([::1]:60056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICT6-00068F-48
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:34:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lICEs-0001Ha-NS
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:19:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lICEq-0003r9-TE
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:19:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614957576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jhlX3r98D/CKlTP0w34nlkTSjsO3bUJiOTT6Sz9KeP4=;
 b=WkA894EoLkmLXebAzIzJ9S27vQLmovEcsvhjhQO6K3KUc8+0bdWdg1HnLUtQC+6navdwVJ
 3O/6vzGVwJo2u7IPetENRYer9F4qyAOCyey8f2YYOPDaaLfLG0h81pflooClhaB0MzFQLd
 /5In/t1VrumCm+pRoL+SVKyMUv+NODI=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-eBEADCvtOU-E6BYwL-zffw-1; Fri, 05 Mar 2021 10:19:34 -0500
X-MC-Unique: eBEADCvtOU-E6BYwL-zffw-1
Received: by mail-oo1-f72.google.com with SMTP id t23so1342690oou.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:19:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jhlX3r98D/CKlTP0w34nlkTSjsO3bUJiOTT6Sz9KeP4=;
 b=lXvTtY1LJ2KSM11vGGs1X7YbYHWP8ptzojWJiCQBD9lSr2ZUvfDrjQhO5svn1ej3wi
 lVrT8uO4cBAN1uP8+q8g7/KsYfJClVOYFgR0mPSC/6H5FNE0hmwHct++5DLnYaj2DxHY
 8P/dAvPErr0ULkknO9V75Le//k0NXMzn/oZUcrh6v0RrRFzRlBSr4qMtM6bpvymQrC2q
 HlWxfrasVTxoPdHdjv9Bc2j2QW2NH+fKAt5MFCy3mgyMN+vZSDfZ60j40cyA8UmCm+Mb
 NJosgzWJTx+aNW1wDS8xGyVsm1EbjFV9lWd1pdPzmQ6wiqRPyQv3p/BHardMmRIn52hZ
 wr0Q==
X-Gm-Message-State: AOAM531B1s09Axz5eeNHhTgpzYcYa87DS/Ezj1HXJjmHvtZBacEv2n5w
 WDZrkzTVVONWuc1bBGg+rPcWS2LadIqYb3U2PNQFQji0DmqgDQgea3bgf2D4JPNKdWL/NSxEKBe
 7lkQLX6PfZMQ8SsA=
X-Received: by 2002:a9d:825:: with SMTP id 34mr8755895oty.280.1614957573974;
 Fri, 05 Mar 2021 07:19:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRKBY2M2Jurn3RGot2RAW07QYEDOHDRh9vVHWgrdPfQ90PA6Prpqkd/izaFZgvogJeIWsKGQ==
X-Received: by 2002:a9d:825:: with SMTP id 34mr8755881oty.280.1614957573816;
 Fri, 05 Mar 2021 07:19:33 -0800 (PST)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id y34sm651085ota.12.2021.03.05.07.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:19:33 -0800 (PST)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/2] blockdev: Clarify error messages pertaining to
 'node-name'
Date: Fri,  5 Mar 2021 09:19:29 -0600
Message-Id: <20210305151929.1947331-3-ckuehl@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210305151929.1947331-1-ckuehl@redhat.com>
References: <20210305151929.1947331-1-ckuehl@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
---
 blockdev.c             | 13 +++++++------
 tests/qemu-iotests/245 |  6 +++---
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index cd438e60e3..7c7ab2b386 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1515,13 +1515,13 @@ static void external_snapshot_prepare(BlkActionState *common,
             s->has_snapshot_node_name ? s->snapshot_node_name : NULL;
 
         if (node_name && !snapshot_node_name) {
-            error_setg(errp, "New overlay node name missing");
+            error_setg(errp, "New overlay node-name missing");
             goto out;
         }
 
         if (snapshot_node_name &&
             bdrv_lookup_bs(snapshot_node_name, snapshot_node_name, NULL)) {
-            error_setg(errp, "New overlay node name already in use");
+            error_setg(errp, "New overlay node-name already in use");
             goto out;
         }
 
@@ -3598,13 +3598,14 @@ void qmp_x_blockdev_reopen(BlockdevOptions *options, Error **errp)
 
     /* Check for the selected node name */
     if (!options->has_node_name) {
-        error_setg(errp, "Node name not specified");
+        error_setg(errp, "node-name not specified");
         goto fail;
     }
 
     bs = bdrv_find_node(options->node_name);
     if (!bs) {
-        error_setg(errp, "Cannot find node named '%s'", options->node_name);
+        error_setg(errp, "Failed to find node with node-name='%s'",
+                   options->node_name);
         goto fail;
     }
 
@@ -3635,7 +3636,7 @@ void qmp_blockdev_del(const char *node_name, Error **errp)
 
     bs = bdrv_find_node(node_name);
     if (!bs) {
-        error_setg(errp, "Cannot find node %s", node_name);
+        error_setg(errp, "Failed to find node with node-name='%s'", node_name);
         return;
     }
     if (bdrv_has_blk(bs)) {
@@ -3758,7 +3759,7 @@ void qmp_x_blockdev_set_iothread(const char *node_name, StrOrNull *iothread,
 
     bs = bdrv_find_node(node_name);
     if (!bs) {
-        error_setg(errp, "Cannot find node %s", node_name);
+        error_setg(errp, "Failed to find node with node-name='%s'", node_name);
         return;
     }
 
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index f8eba7719a..a2a0482469 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -140,8 +140,8 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, {'file': 'hd0-file'})
 
         # We cannot change any of these
-        self.reopen(opts, {'node-name': 'not-found'}, "Cannot find node named 'not-found'")
-        self.reopen(opts, {'node-name': ''}, "Cannot find node named ''")
+        self.reopen(opts, {'node-name': 'not-found'}, "Failed to find node with node-name='not-found'")
+        self.reopen(opts, {'node-name': ''}, "Failed to find node with node-name=''")
         self.reopen(opts, {'node-name': None}, "Invalid parameter type for 'node-name', expected: string")
         self.reopen(opts, {'driver': 'raw'}, "Cannot change the option 'driver'")
         self.reopen(opts, {'driver': ''}, "Invalid parameter ''")
@@ -158,7 +158,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # node-name is optional in BlockdevOptions, but x-blockdev-reopen needs it
         del opts['node-name']
-        self.reopen(opts, {}, "Node name not specified")
+        self.reopen(opts, {}, "node-name not specified")
 
         # Check that nothing has changed
         self.check_node_graph(original_graph)
-- 
2.29.2


