Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3264ABC63
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 12:47:12 +0100 (CET)
Received: from localhost ([::1]:40796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH2UB-0001Pp-Eo
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 06:47:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nH2Kq-0004F8-8v
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:37:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nH2Kj-0002Tc-HD
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644233841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yyWmdgqsb0KrZJP/X2y11ATPaOdmexRMM60gQxoEHBw=;
 b=IJxORt1kP/bPtkUXUuqIpcac83zZmLaOuCs8gTtUiB3UDzNO37T4+R5qRqQvVfmHCBQ+Y/
 fW6d1RvIjZL3nUjudxAILnPMt+fCnfNwpyeK0uwUfyC8TchN59mHp873UO2KmHjRaGSciJ
 We1wBkZiFzgTFOsq5khT5Z1BEO8WZ5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-HBe5uRMQNB-bhtPsoF2bTw-1; Mon, 07 Feb 2022 06:37:20 -0500
X-MC-Unique: HBe5uRMQNB-bhtPsoF2bTw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8199A100C665;
 Mon,  7 Feb 2022 11:37:19 +0000 (UTC)
Received: from localhost (unknown [10.39.192.174])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D72D2AAA3;
 Mon,  7 Feb 2022 11:37:18 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] block/vvfat: Fix memleaks in vvfat_close()
Date: Mon,  7 Feb 2022 12:37:16 +0100
Message-Id: <20220207113716.31400-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qcow_filename and used_clusters are allocated in enable_write_target(),
but freed only in the error path of vvfat_open().  Free them in
vvfat_close(), too.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/vvfat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/vvfat.c b/block/vvfat.c
index b2b58d93b8..811ba76e30 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3213,6 +3213,8 @@ static void vvfat_close(BlockDriverState *bs)
     array_free(&(s->directory));
     array_free(&(s->mapping));
     g_free(s->cluster_buffer);
+    g_free(s->qcow_filename);
+    g_free(s->used_clusters);
 
     if (s->qcow) {
         migrate_del_blocker(s->migration_blocker);
-- 
2.34.1


