Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2491E438E4B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 06:26:31 +0200 (CEST)
Received: from localhost ([::1]:58212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1merZ8-0008Nb-8q
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 00:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1merXC-0005se-BH
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 00:24:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1merX9-0005jc-NQ
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 00:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635135865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TDuE6wB+NhgVZWT1yd+7ld8eNMlPXfVnsXRFVQ7a3Y8=;
 b=GKzttsgggVwmrqHaDQfg+wnmlq8migzKBzAejUX0TwYCdWuHJI/bwZR3l9sre+7tGKV6An
 fsIxWtrjo4/tJAzRY0MSEkwf1Yi+1FqhveC9GtEh/oVG4Htgu+T2nvJ1bhsPYTcI94KHW4
 8T3/x2ALSJl1R7NCY8xW9y74MXyC+00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-7mNAdZ-MOTC4oO_QiM-Zig-1; Mon, 25 Oct 2021 00:24:21 -0400
X-MC-Unique: 7mNAdZ-MOTC4oO_QiM-Zig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86CA11006AA3;
 Mon, 25 Oct 2021 04:24:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 534396060F;
 Mon, 25 Oct 2021 04:24:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0F36B11380CA; Mon, 25 Oct 2021 06:24:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/5] block: Deprecate transaction type drive-backup
Date: Mon, 25 Oct 2021 06:24:05 +0200
Message-Id: <20211025042405.3762351-6-armbru@redhat.com>
In-Reply-To: <20211025042405.3762351-1-armbru@redhat.com>
References: <20211025042405.3762351-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Several moons ago, Vladimir posted

    Subject: [PATCH v2 3/3] qapi: deprecate drive-backup
    Date: Wed,  5 May 2021 16:58:03 +0300
    Message-Id: <20210505135803.67896-4-vsementsov@virtuozzo.com>
    https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg01394.html

with this

    TODO: We also need to deprecate drive-backup transaction action..
    But union members in QAPI doesn't support 'deprecated' feature. I tried
    to dig a bit, but failed :/ Markus, could you please help with it? At
    least by advice?

This is one way to resolve it.  Sorry it took so long.

John explored another way, namely adding feature flags to union
branches.  Could also be useful, say to add different features to
branches in multiple unions sharing the same tag enum.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/transaction.json | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qapi/transaction.json b/qapi/transaction.json
index d175b5f863..381a2df782 100644
--- a/qapi/transaction.json
+++ b/qapi/transaction.json
@@ -54,6 +54,10 @@
 # @blockdev-snapshot-sync: since 1.1
 # @drive-backup: Since 1.6
 #
+# Features:
+# @deprecated: Member @drive-backup is deprecated.  Use member
+#              @blockdev-backup instead.
+#
 # Since: 1.1
 ##
 { 'enum': 'TransactionActionKind',
@@ -62,7 +66,7 @@
             'block-dirty-bitmap-disable', 'block-dirty-bitmap-merge',
             'blockdev-backup', 'blockdev-snapshot',
             'blockdev-snapshot-internal-sync', 'blockdev-snapshot-sync',
-            'drive-backup' ] }
+            { 'name': 'drive-backup', 'features': [ 'deprecated' ] } ] }
 
 ##
 # @AbortWrapper:
-- 
2.31.1


