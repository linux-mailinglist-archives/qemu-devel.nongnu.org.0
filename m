Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A69A4B8F4E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:40:03 +0100 (CET)
Received: from localhost ([::1]:33770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOHZ-0000oP-M0
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:40:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKOEP-0006cX-LN
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:36:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKOEM-0007lQ-3B
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:36:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645033001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MaJrs/ZheBAa9RrtTzRrPMkAxwpo5GQ5cHjMnqAbx28=;
 b=GO/1Te9BMcc8eE74IWa5oa0Co5PvA4xlNrJF8431ZcCwn2Fvtl5SGqcMRqvC4g3veSzuWB
 hzIvXXw3N4J6c9hwwnNrydSls+5TyI70TAfoCQ6sSg3C5ecsEMYUKtufSFLGecC2Sql1qT
 OBqO/WJd2f0bDqA06Fpm2TDMahF7648=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-LDD_nqqaNxi2MNGC3vAvug-1; Wed, 16 Feb 2022 12:36:37 -0500
X-MC-Unique: LDD_nqqaNxi2MNGC3vAvug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1F921853028;
 Wed, 16 Feb 2022 17:36:36 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C2DB75740;
 Wed, 16 Feb 2022 17:36:35 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, groug@kaod.org,
 sebastian.hasler@stuvus.uni-stuttgart.de
Subject: [PULL 02/12] virtiofsd: Fix breakage due to fuse_init_in size change
Date: Wed, 16 Feb 2022 17:36:15 +0000
Message-Id: <20220216173625.128109-3-dgilbert@redhat.com>
In-Reply-To: <20220216173625.128109-1-dgilbert@redhat.com>
References: <20220216173625.128109-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: virtio-fs@redhat.com, stefanha@redhat.com, slp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

Kernel version 5.17 has increased the size of "struct fuse_init_in" struct.
Previously this struct was 16 bytes and now it has been extended to
64 bytes in size.

Once qemu headers are updated to latest, it will expect to receive 64 byte
size struct (for protocol version major 7 and minor > 6). But if guest is
booting older kernel (older than 5.17), then it still sends older
fuse_init_in of size 16 bytes. And do_init() fails. It is expecting
64 byte struct. And this results in mount of virtiofs failing.

Fix this by parsing 16 bytes only for now. Separate patches will be
posted which will parse rest of the bytes and enable new functionality.
Right now we don't support any of the new functionality, so we don't
lose anything by not parsing bytes beyond 16.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <20220208204813.682906-2-vgoyal@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index e4679c73ab..ce29a70253 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1880,6 +1880,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
                     struct fuse_mbuf_iter *iter)
 {
     size_t compat_size = offsetof(struct fuse_init_in, max_readahead);
+    size_t compat2_size = offsetof(struct fuse_init_in, flags) + sizeof(uint32_t);
     struct fuse_init_in *arg;
     struct fuse_init_out outarg;
     struct fuse_session *se = req->se;
@@ -1897,7 +1898,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
 
     /* ...and now consume the new fields. */
     if (arg->major == 7 && arg->minor >= 6) {
-        if (!fuse_mbuf_iter_advance(iter, sizeof(*arg) - compat_size)) {
+        if (!fuse_mbuf_iter_advance(iter, compat2_size - compat_size)) {
             fuse_reply_err(req, EINVAL);
             return;
         }
-- 
2.35.1


