Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5272D4C26
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:47:00 +0100 (CET)
Received: from localhost ([::1]:55128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn6MV-0004q3-Fc
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kn69k-0007ox-Lt
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:33:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kn69h-0005YT-OX
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:33:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607546023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VvG7gJle93Lo206/tkUeE91Psd4UAHN8zzJhVenzKAM=;
 b=F8mj8nmFUXMkxVTm4+qCHswdgGg4wFgxZGBqzX8+qnGDcJisDa/1YrHi2Xc8ufNM+WiZQE
 kosdafdmehn2T5nksUPFosq/B+t0FPwmiWaVASgvk8nd+bFVN0MBed09azTlR1ccxO8c8E
 valwcQQOJ9pIAbtZjLTnAQ4jkHLrXes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-wPJ2HBQpNFGyVD7k6D8wQQ-1; Wed, 09 Dec 2020 15:33:40 -0500
X-MC-Unique: wPJ2HBQpNFGyVD7k6D8wQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B0E8107ACE3;
 Wed,  9 Dec 2020 20:33:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8871919725;
 Wed,  9 Dec 2020 20:33:36 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/4] crypto: luks: use bdrv_co_delete_file_noerr
Date: Wed,  9 Dec 2020 22:33:25 +0200
Message-Id: <20201209203326.879381-4-mlevitsk@redhat.com>
In-Reply-To: <20201209203326.879381-1-mlevitsk@redhat.com>
References: <20201209203326.879381-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This refactoring is now possible thanks to this function.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/crypto.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/block/crypto.c b/block/crypto.c
index b3a5275132..1d30fde38e 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -725,19 +725,8 @@ fail:
      * If an error occurred, delete 'filename'. Even if the file existed
      * beforehand, it has been truncated and corrupted in the process.
      */
-    if (ret && bs) {
-        Error *local_delete_err = NULL;
-        int r_del = bdrv_co_delete_file(bs, &local_delete_err);
-        /*
-         * ENOTSUP will happen if the block driver doesn't support
-         * the 'bdrv_co_delete_file' interface. This is a predictable
-         * scenario and shouldn't be reported back to the user.
-         */
-        if ((r_del < 0) && (r_del != -ENOTSUP)) {
-            error_report_err(local_delete_err);
-        } else {
-            error_free(local_delete_err);
-        }
+    if (ret) {
+        bdrv_co_delete_file_noerr(bs);
     }
 
     bdrv_unref(bs);
-- 
2.26.2


