Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1A332954A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 00:41:07 +0100 (CET)
Received: from localhost ([::1]:45736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGs9y-0005Bw-Jx
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 18:41:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lGs5I-0002a0-BZ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 18:36:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lGs5F-0007l8-UG
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 18:36:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614641772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L4hun4GD9d5F9uXCAu/RGnX28m+V5NS7jUfFTmaMEpg=;
 b=BsVTbLovk0He0GRPa3ZUCkPpisNWnWxw4+8qc73U9aHnrJbJdZtRKhaCk8n/6l/7y3Xu/a
 HGFRRbfOvrkpLiwl2X7TmAxHrJcS5haoZAtEd8hJHNeR7Pmf8j3wU1op1BPIB+53/ZIObt
 2/b9lBT5g7rJR25CBC62uJme9VW++es=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-oR0NtRtOPVaU9BFalF4oQg-1; Mon, 01 Mar 2021 18:36:11 -0500
X-MC-Unique: oR0NtRtOPVaU9BFalF4oQg-1
Received: by mail-oi1-f198.google.com with SMTP id n17so1980042oie.0
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 15:36:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L4hun4GD9d5F9uXCAu/RGnX28m+V5NS7jUfFTmaMEpg=;
 b=YY/z40jm89CpMhL8894bDXBq56pmF9JRC66pPb+3x5Kb5eebq0VII7Mab/9Mz1PiBn
 Km1KwFHRyn5UUpkm6hJnnWs8Us0WdCKdex2inr5QuNBAnVZUeENZpH9WgNhdpAQfnjmp
 BhEmeOuGjTeMOaxcqr7iHjMLW1ofI+o9DyjJDsI9Bz06ZLes5iiVdZ7vO751SDipSH7m
 6iVL/z3nk0ZIAuGyXyu+tIBzphmQvhpdDutXbWgpGQqRB57MQ+ilOdHMoi1uxHo3FXp2
 hYUL8u4TmMqQKG0MAuIupJ+gYoOraQXRUaAYf+4GJNM8v7aqivioNQsY/ads66FeT1IG
 cwSw==
X-Gm-Message-State: AOAM530PsQQgJLuLTrq7PwXg+ica3MPfjlekEd+KNkwHfjV2AqvGFliA
 mSBUbqJDvSNQQgY/t11yhcZa/zp9ZqMelRQlXLxk623UtA/5hLQoNPgjfdQ0nKxT68A6y/MgJr/
 phLn+fPM4fWeodaw=
X-Received: by 2002:a05:6808:154:: with SMTP id
 h20mr1166251oie.45.1614641770751; 
 Mon, 01 Mar 2021 15:36:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpgGq8c9YHntvWnoWlQ2tCQ5GxHqE6inkPibnTTd8ODc+s6w0GoW6NlDZbYnjoZilgvE4ewA==
X-Received: by 2002:a05:6808:154:: with SMTP id
 h20mr1166241oie.45.1614641770630; 
 Mon, 01 Mar 2021 15:36:10 -0800 (PST)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id a12sm4087885otp.30.2021.03.01.15.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 15:36:10 -0800 (PST)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] blockdev: Clarify error messages pertaining to 'node-name'
Date: Mon,  1 Mar 2021 17:36:07 -0600
Message-Id: <20210301233607.748412-3-ckuehl@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301233607.748412-1-ckuehl@redhat.com>
References: <20210301233607.748412-1-ckuehl@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
---
 blockdev.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

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
 
-- 
2.29.2


