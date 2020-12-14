Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC2F2D9D3D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 18:08:59 +0100 (CET)
Received: from localhost ([::1]:33400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1korLG-0004RE-Dh
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 12:08:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1korJ2-0002ZB-CX
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:06:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1korIz-0005bD-7q
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607965595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/WpOYjMEI+uu6Ezu621PcgD7x1p7LtSJUlUJzLyqhGc=;
 b=XOVULEIEztPPiWzmO3yAaQsuuahBcplObOAWvg53dr7I0atWr2bQqXjfEI7rMMP6pJYe5i
 ovS1GQjb0j7wdL8VJHrKqsjGgGkK4nzKv3prx7Kd3Q7IbAO/FqQmybg4WmWQcDdzmF3AeR
 Uqz8Lm1uQiEWlbFGdxpMCgn181CEfG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-D0CmhjvTOY6pEL_0tz-PPA-1; Mon, 14 Dec 2020 12:06:33 -0500
X-MC-Unique: D0CmhjvTOY6pEL_0tz-PPA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C6511012EA3;
 Mon, 14 Dec 2020 17:06:19 +0000 (UTC)
Received: from toolbox.redhat.com (ovpn-112-231.rdu2.redhat.com
 [10.10.112.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9AEB5D6AB;
 Mon, 14 Dec 2020 17:05:37 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] block: Avoid processing BDS twice in
 bdrv_set_aio_context_ignore()
Date: Mon, 14 Dec 2020 18:05:17 +0100
Message-Id: <20201214170519.223781-3-slp@redhat.com>
In-Reply-To: <20201214170519.223781-1-slp@redhat.com>
References: <20201214170519.223781-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While processing the parents of a BDS, one of the parents may process
the child that's doing the tail recursion, which leads to a BDS being
processed twice. This is especially problematic for the aio_notifiers,
as they might attempt to work on both the old and the new AIO
contexts.

To avoid this, add the BDS pointer to the ignore list, and check the
child BDS pointer while iterating over the children.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 block.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index f1cedac362..bc8a66ab6e 100644
--- a/block.c
+++ b/block.c
@@ -6465,12 +6465,17 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
     bdrv_drained_begin(bs);
 
     QLIST_FOREACH(child, &bs->children, next) {
-        if (g_slist_find(*ignore, child)) {
+        if (g_slist_find(*ignore, child) || g_slist_find(*ignore, child->bs)) {
             continue;
         }
         *ignore = g_slist_prepend(*ignore, child);
         bdrv_set_aio_context_ignore(child->bs, new_context, ignore);
     }
+    /*
+     * Add a reference to this BS to the ignore list, so its
+     * parents won't attempt to process it again.
+     */
+    *ignore = g_slist_prepend(*ignore, bs);
     QLIST_FOREACH(child, &bs->parents, next_parent) {
         if (g_slist_find(*ignore, child)) {
             continue;
-- 
2.26.2


