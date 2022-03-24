Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5724E68CB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:39:19 +0100 (CET)
Received: from localhost ([::1]:50056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXSMa-0005B4-73
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:39:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSED-0000Df-PO
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSE9-0005eo-52
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648146628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+0Wf4z6NgkP/tuo08AzKiCDhkNuL7wBjiZd0eU3Aqaw=;
 b=hyByCj8dKJ2uUgbp50Mmsuo51ZSdhzGP6itCdDWfMRCdMTdH7+QdZilN7WwGu6VGPB89zX
 7bjOeYCMjBhjDOzFjpbMacwaqCsl/at9KluS4G7aAl9/HXrveBQPRIn0oUeqokoYCiaCgL
 TKRFmGQqeI9Fo6ld/8FcXviStt3hwwA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-SHYcT1Y-O4-fnb0NFeRtsQ-1; Thu, 24 Mar 2022 14:30:25 -0400
X-MC-Unique: SHYcT1Y-O4-fnb0NFeRtsQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B38EE3801ECF;
 Thu, 24 Mar 2022 18:30:24 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38305C26EA0;
 Thu, 24 Mar 2022 18:30:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/17] iotests/163: Fix broken qemu-io invocation
Date: Thu, 24 Mar 2022 14:30:03 -0400
Message-Id: <20220324183018.2476551-3-jsnow@redhat.com>
In-Reply-To: <20220324183018.2476551-1-jsnow@redhat.com>
References: <20220324183018.2476551-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org
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
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
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


