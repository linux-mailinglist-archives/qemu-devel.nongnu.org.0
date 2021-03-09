Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10253332C3B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:37:17 +0100 (CET)
Received: from localhost ([::1]:57848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfMC-0003TE-0j
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJefK-0004Fh-5s
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJef0-000118-DN
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615305157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fW6c1TB5SEpvYZ2Q5rGXnjq1LRDj6qeOKV+ewkG2dHY=;
 b=GGWDBrLlTzhYTKamVm6O0QSXjolKRAEJoHCOhuT4PqKhRGwxDr/NA7SKCvPKs+eL2tiwgL
 L1SHG4xOrxJQalo+MKSJg2o6K5enVP6a1X6xY6ObmhHP0h1bwpEyGO9KKICszYgRA8wNt6
 X1fqk4G3fQor7PSTWjQ2pHl89Zw/tPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-N7AkZzUPORKhGrVOKumVwQ-1; Tue, 09 Mar 2021 10:52:35 -0500
X-MC-Unique: N7AkZzUPORKhGrVOKumVwQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37FFF1842145;
 Tue,  9 Mar 2021 15:52:34 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD1E819C46;
 Tue,  9 Mar 2021 15:52:33 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/17] block/qcow2: refactor qcow2_update_options_prepare error
 paths
Date: Tue,  9 Mar 2021 09:52:02 -0600
Message-Id: <20210309155202.1312571-18-eblake@redhat.com>
In-Reply-To: <20210309155202.1312571-1-eblake@redhat.com>
References: <20210309155202.1312571-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, "open list:qcow2" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Keep setting ret close to setting errp and don't merge different error
paths into one. This way it's more obvious that we don't return
error without setting errp.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Message-Id: <20210202124956.63146-15-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index a1dee95dea6c..0db1227ac909 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1158,6 +1158,10 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
         }
         qdict_put_str(encryptopts, "format", "qcow");
         r->crypto_opts = block_crypto_open_opts_init(encryptopts, errp);
+        if (!r->crypto_opts) {
+            ret = -EINVAL;
+            goto fail;
+        }
         break;

     case QCOW_CRYPT_LUKS:
@@ -1170,14 +1174,15 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
         }
         qdict_put_str(encryptopts, "format", "luks");
         r->crypto_opts = block_crypto_open_opts_init(encryptopts, errp);
+        if (!r->crypto_opts) {
+            ret = -EINVAL;
+            goto fail;
+        }
         break;

     default:
         error_setg(errp, "Unsupported encryption method %d",
                    s->crypt_method_header);
-        break;
-    }
-    if (s->crypt_method_header != QCOW_CRYPT_NONE && !r->crypto_opts) {
         ret = -EINVAL;
         goto fail;
     }
-- 
2.30.1


