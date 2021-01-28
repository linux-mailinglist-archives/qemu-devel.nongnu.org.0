Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F15F3076B6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 14:07:40 +0100 (CET)
Received: from localhost ([::1]:57632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l571P-0001RV-7R
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 08:07:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l570T-000117-7y
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:06:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l570R-0000OG-Kf
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611839198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hSecMHZ53CtJAhaMvbaRwUuTLiEKnbpxQwnOUxylzI0=;
 b=XXttjURknF6sXPQVkF9Gf3Wo3nvNVfmo+CEztAk018NgfE9ZDBESoXK28RFhlgFTmKw7Y/
 Ya0hxMz7yn7Khe+VsqOO7vb4a3mtsz/XUKMQb8OxLN/Ag8+ivfwYEE2nYtVbz2QUoCQzRR
 QR4CJLHgzgZQHcv4p7NVmvomMRI+kOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-rKLQMXvSMRaJ8ybMGrfUbw-1; Thu, 28 Jan 2021 08:06:36 -0500
X-MC-Unique: rKLQMXvSMRaJ8ybMGrfUbw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C44691075645
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 13:06:35 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FDD91F463;
 Thu, 28 Jan 2021 13:06:29 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] migration/qemu-file: Fix maybe uninitialized on
 qemu_get_buffer_in_place()
Date: Thu, 28 Jan 2021 10:06:25 -0300
Message-Id: <20210128130625.569900-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed error when compiling migration/qemu-file.c with -Werror=maybe-uninitialized
as shown here:

../migration/qemu-file.c: In function 'qemu_get_buffer_in_place':
../migration/qemu-file.c:604:18: error: 'src' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  604 |             *buf = src;
      |             ~~~~~^~~~~
cc1: all warnings being treated as errors

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
Passed on CI: https://gitlab.com/wainersm/qemu/-/pipelines/247801576

 migration/qemu-file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index be21518c57..d6e03dbc0e 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -595,7 +595,7 @@ size_t qemu_get_buffer_in_place(QEMUFile *f, uint8_t **buf, size_t size)
 {
     if (size < IO_BUF_SIZE) {
         size_t res;
-        uint8_t *src;
+        uint8_t *src = NULL;
 
         res = qemu_peek_buffer(f, &src, size, 0);
 
-- 
2.28.0


