Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5066C427A06
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 14:16:58 +0200 (CEST)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZBHd-0007o6-B1
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 08:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZBBk-00088I-0A
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 08:10:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZBBi-0007Cf-8o
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 08:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633781449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MW6cCujDtG/w5q52vzs2If7HJOGXs5Vt1MAUMQQsSuY=;
 b=V5iuIseB3UctoqUb50gkxYrLwFKmEgpt4/cvp7MLTe/otL7rSsvW+t6IqomIbj9XXaTU/+
 Vdb0HbBlSBvicHfUNpjZMZE3LaGJUNBMquAOYTuYi0zUWDJLGeLd/8o8Fnka0aHHjUjPfF
 WFxnp0mUKqUH/v7wUEwO13sS6NP3LbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-jBzY55W0MEePG3slsFL9aw-1; Sat, 09 Oct 2021 08:10:46 -0400
X-MC-Unique: jBzY55W0MEePG3slsFL9aw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 044438145E6;
 Sat,  9 Oct 2021 12:10:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9235E57CAB;
 Sat,  9 Oct 2021 12:10:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 521591138529; Sat,  9 Oct 2021 14:09:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 5/5] block: Deprecate transaction type drive-backup
Date: Sat,  9 Oct 2021 14:09:44 +0200
Message-Id: <20211009120944.2858887-6-armbru@redhat.com>
In-Reply-To: <20211009120944.2858887-1-armbru@redhat.com>
References: <20211009120944.2858887-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
 qapi/transaction.json | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/qapi/transaction.json b/qapi/transaction.json
index d175b5f863..0564a893b3 100644
--- a/qapi/transaction.json
+++ b/qapi/transaction.json
@@ -54,6 +54,9 @@
 # @blockdev-snapshot-sync: since 1.1
 # @drive-backup: Since 1.6
 #
+# Features:
+# @deprecated: Member @drive-backup is deprecated.  Use FIXME instead.
+#
 # Since: 1.1
 ##
 { 'enum': 'TransactionActionKind',
@@ -62,7 +65,7 @@
             'block-dirty-bitmap-disable', 'block-dirty-bitmap-merge',
             'blockdev-backup', 'blockdev-snapshot',
             'blockdev-snapshot-internal-sync', 'blockdev-snapshot-sync',
-            'drive-backup' ] }
+            { 'name': 'drive-backup', 'features': [ 'deprecated' ] } ] }
 
 ##
 # @AbortWrapper:
-- 
2.31.1


