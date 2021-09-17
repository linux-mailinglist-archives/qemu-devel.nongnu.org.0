Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C7140FDD4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:24:31 +0200 (CEST)
Received: from localhost ([::1]:52164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGf8-0003Dh-KX
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mRGUi-0007RB-MO
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:13:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mRGUf-0005w9-FT
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631895220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xk69X7f6DjNckY1dDeopzofDCSHOzFYcBgGx2d8gbws=;
 b=HnJuvvrls0z0zcrepQHtLrS21V+Ks/B6fYA47/UM9te0fzak3dQu8NsZAzQMs26rbW4Imx
 ReAN56o4ji4g1OZksu32ZficrZEQfZy5gMznWKFwrJA7iIycqGknMXh/NR8nSEWteZKXzl
 R3jMf2u/IwBToLCoWiSB0hqvVD9WeXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-y0YIDXh-Mt-v1_TWQ8FZuw-1; Fri, 17 Sep 2021 12:13:39 -0400
X-MC-Unique: y0YIDXh-Mt-v1_TWQ8FZuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4422835DE5
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 16:13:38 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1D6A60C2B;
 Fri, 17 Sep 2021 16:13:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/8] qapi: Revert an accidental change from list to view
 object
Date: Fri, 17 Sep 2021 18:13:18 +0200
Message-Id: <20210917161320.201086-7-kwolf@redhat.com>
In-Reply-To: <20210917161320.201086-1-kwolf@redhat.com>
References: <20210917161320.201086-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

A long time ago, commit 23a4b2c6f1 "qapi: Eliminate
QAPISchemaObjectType.check() variable members" replaced the manual
building of the list of members by seen.values(), where @seen is an
OrderedDict mapping names to members.  The list is then stored in
self.members.

With Python 2, this is an innocent change: seen.values() returns "a
copy of the dictionary’s list of values".

With Python 3, it returns a dictionary view object instad.  These
"provide a dynamic view on the dictionary’s entries, which means that
when the dictionary changes, the view reflects these changes."

Commit 23a4b2c6f1 predates the first mention of Python 3 in
scripts/qapi/ by years.  If we had wanted a view object then, we'd
have used seen.viewvalues().

The accidental change of self.members from list to view object keeps
@seen alive longer.  Not wanted, but harmless enough.  I believe
that's all.

However, the change is in the next commit's way, which wants to mess
with self.members.  Revert it.

All other uses of .values() in scripts/qapi/ are of the form

    for ... in dict.values():

where the change to view object is just fine.  Same for .keys() and
.items().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 scripts/qapi/schema.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 3d72c7dfc9..87f80f8de2 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -440,7 +440,7 @@ def check(self, schema):
         for m in self.local_members:
             m.check(schema)
             m.check_clash(self.info, seen)
-        members = seen.values()
+        members = list(seen.values())
 
         if self.variants:
             self.variants.check(schema, seen)
-- 
2.31.1


