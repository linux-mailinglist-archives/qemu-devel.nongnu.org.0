Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FA0391EC2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:12:28 +0200 (CEST)
Received: from localhost ([::1]:50646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lly15-0007mR-Av
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxc4-0003fv-Ah
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxbx-000077-U3
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622051188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NcF5Mr1qAJ+6CbZ+RAFKhS1PkG6bIPtsRt+nuIksmuc=;
 b=Ij++fXwfGuUgbUjgGGLhMHhCKkW4k/Cvqv6uXWl5z6Is78yWhW595nJe+87DJiyD6miHC3
 SHZaroA+TNIeZPQhL5AQ8fkhvOeiof4P4y11Ye/3GLSKaPyD9B9OWizdmUc5CnOu16PPqU
 iYEUclxPyvB1jIjk2vUuWmMPaDo56To=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-F3QMMngcOjORGK4v_LMg2g-1; Wed, 26 May 2021 13:46:24 -0400
X-MC-Unique: F3QMMngcOjORGK4v_LMg2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4972501E0;
 Wed, 26 May 2021 17:46:23 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-247.ams2.redhat.com
 [10.36.114.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 528B15D9C6;
 Wed, 26 May 2021 17:46:22 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, kwolf@redhat.com, vgoyal@redhat.com,
 ma.mandourr@gmail.com, lizhijian@cn.fujitsu.com
Subject: [PULL 10/15] tools/virtiofsd/fuse_opt.c: Replaced a malloc with
 GLib's g_try_malloc
Date: Wed, 26 May 2021 18:45:35 +0100
Message-Id: <20210526174540.290588-11-dgilbert@redhat.com>
In-Reply-To: <20210526174540.290588-1-dgilbert@redhat.com>
References: <20210526174540.290588-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: peterx@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Replaced a malloc() call and its respective free() with
GLib's g_try_malloc() and g_free() calls.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Message-Id: <20210314032324.45142-8-ma.mandourr@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_opt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/fuse_opt.c b/tools/virtiofsd/fuse_opt.c
index f0ab8d22f4..9d371448e9 100644
--- a/tools/virtiofsd/fuse_opt.c
+++ b/tools/virtiofsd/fuse_opt.c
@@ -272,7 +272,7 @@ static int process_opt_sep_arg(struct fuse_opt_context *ctx,
     }
 
     param = ctx->argv[ctx->argctr];
-    newarg = malloc(sep + strlen(param) + 1);
+    newarg = g_try_malloc(sep + strlen(param) + 1);
     if (!newarg) {
         return alloc_failed();
     }
@@ -280,7 +280,7 @@ static int process_opt_sep_arg(struct fuse_opt_context *ctx,
     memcpy(newarg, arg, sep);
     strcpy(newarg + sep, param);
     res = process_opt(ctx, opt, sep, newarg, iso);
-    free(newarg);
+    g_free(newarg);
 
     return res;
 }
-- 
2.31.1


