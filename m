Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17C450E2C7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:13:40 +0200 (CEST)
Received: from localhost ([::1]:52580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizT9-00053C-Ox
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizOD-0004kl-Uh
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizOC-0001xR-Bb
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650895711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hLz0jZZ/XkntTZ1gx0s9/HbMWzVrN69jLNUlp49en1k=;
 b=A4CPxFe9r8SL0DPmNvRjWvG/TQc9ytSsarRqRxmdtZ8KU5kNTV6fpA4Ie9U4MnAW3iZp2q
 JXd5CzH8FDpeg9GFWxTvzS5awSCnBEOZGm6kTOK/wOwx04+4ADRfoTAhiV0Y9EjfLvTqDj
 J8kRyOrBeN7CYJNT+oP4BtSytJiL424=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-SCjCc7_hOE6jnbx_tWlDXQ-1; Mon, 25 Apr 2022 10:08:28 -0400
X-MC-Unique: SCjCc7_hOE6jnbx_tWlDXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FF9A1C05AF1;
 Mon, 25 Apr 2022 14:08:28 +0000 (UTC)
Received: from localhost (unknown [10.39.194.198])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFF8940CF8F5;
 Mon, 25 Apr 2022 14:08:27 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/14] iotests/163: Fix broken qemu-io invocation
Date: Mon, 25 Apr 2022 16:08:10 +0200
Message-Id: <20220425140821.957511-4-hreitz@redhat.com>
In-Reply-To: <20220425140821.957511-1-hreitz@redhat.com>
References: <20220425140821.957511-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

The 'read' commands to qemu-io were malformed, and this invocation only
worked by coincidence because the error messages were identical. Oops.

There's no point in checking the patterning of the reference image, so
just check the empty image by itself instead.

(Note: as of this commit, nothing actually enforces that this command
completes successfully, but a forthcoming commit in this series will
enforce that qemu_io() must have a zero status code.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220418211504.943969-3-jsnow@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/163 | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/163 b/tests/qemu-iotests/163
index e4cd4b230f..c94ad16f4a 100755
--- a/tests/qemu-iotests/163
+++ b/tests/qemu-iotests/163
@@ -113,10 +113,7 @@ class ShrinkBaseClass(iotests.QMPTestCase):
         qemu_img('resize',  '-f', iotests.imgfmt, '--shrink', test_img,
                  self.shrink_size)
 
-        self.assertEqual(
-            qemu_io('-c', 'read -P 0x00 %s'%self.shrink_size, test_img),
-            qemu_io('-c', 'read -P 0x00 %s'%self.shrink_size, check_img),
-            "Verifying image content")
+        qemu_io('-c', f"read -P 0x00 0 {self.shrink_size}", test_img)
 
         self.image_verify()
 
-- 
2.35.1


