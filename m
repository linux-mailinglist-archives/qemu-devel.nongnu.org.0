Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8CA4DE2A2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 21:39:29 +0100 (CET)
Received: from localhost ([::1]:53112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVJNg-0005Fb-TD
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 16:39:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLJ-0002G1-KX
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLG-0005VM-NQ
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647635817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LUC6Brus1rWJ6DcqNQlbZAJ0YfIyA8nO+/zf+8T9hX0=;
 b=Gs2LBP1ADpm/J+L0EKGcZWZnfFTgYAL2ScSMlgmtpuf4Q6xBdSAOSjMnyJ8a5mvy7juJU9
 kXHINg6s9vix4nCO0YvCnn94DRRY4KNLU+NRHXQs2MTcRRNJjpAo4C0hntou87VKOkbMq8
 YGuCKl4RplUallkdWXNmlonCRnOpaiM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-zalkpCQWOnmF8U72TEIXvw-1; Fri, 18 Mar 2022 16:36:56 -0400
X-MC-Unique: zalkpCQWOnmF8U72TEIXvw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 698E38047D6;
 Fri, 18 Mar 2022 20:36:56 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A1B5403373;
 Fri, 18 Mar 2022 20:36:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/15] iotests/163: Fix broken qemu-io invocation
Date: Fri, 18 Mar 2022 16:36:42 -0400
Message-Id: <20220318203655.676907-3-jsnow@redhat.com>
In-Reply-To: <20220318203655.676907-1-jsnow@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'read' commands to qemu-io were malformed, and this invocation only
worked by coincidence because the error messages were identical. Oops.

There's no point in checking the patterning of the reference image, so
just check the empty image by itself instead.

(Note: as of this commit, nothing actually enforces that this command
completes successfully, but a forthcoming commit in this series will
enforce that qemu_io() must have a zero status code.)

Signed-off-by: John Snow <jsnow@redhat.com>
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
2.34.1


