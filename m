Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDE055BA2D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 15:56:04 +0200 (CEST)
Received: from localhost ([::1]:49290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5pDf-0000Vw-Hf
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 09:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o5pBA-0007L2-BR
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:53:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o5pB6-0005PH-Om
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656338003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xEuq8wTitDX53c+yp/GugCxUGa/u+GihGsO/+e0T7w8=;
 b=Bj+PbQG0KATrAUD5uPM/F4RPFJbVzeT+spBgO4omxFkjpHtydHc93lcEnqx3tE4UzdpPNT
 jyKaqSCnLAXO0DnKVCbKWZjOsoYFWZfvpgfdZSyDnUHaIcS5DiuZCLmUIVYjfcuzO0OaRS
 JTrTJqvV9aVrMdIWt+XDADvXHpoF+vM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-eMgUzCQrMHeDmK0y9PWSBg-1; Mon, 27 Jun 2022 09:53:21 -0400
X-MC-Unique: eMgUzCQrMHeDmK0y9PWSBg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8973389C7DB
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 13:53:21 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6585641616B;
 Mon, 27 Jun 2022 13:53:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] migration: remove unreachable code after reading data
Date: Mon, 27 Jun 2022 14:53:18 +0100
Message-Id: <20220627135318.156121-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code calls qio_channel_read() in a loop when it reports
QIO_CHANNEL_ERR_BLOCK. This code is reported when errno==EAGAIN.

As such the later block of code will always hit the 'errno != EAGAIN'
condition, making the final 'else' unreachable.

Fixes: Coverity CID 1490203
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/qemu-file.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 1e80d496b7..1615c48b7e 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -384,10 +384,8 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
         f->total_transferred += len;
     } else if (len == 0) {
         qemu_file_set_error_obj(f, -EIO, local_error);
-    } else if (len != -EAGAIN) {
-        qemu_file_set_error_obj(f, len, local_error);
     } else {
-        error_free(local_error);
+        qemu_file_set_error_obj(f, len, local_error);
     }
 
     return len;
-- 
2.36.1


