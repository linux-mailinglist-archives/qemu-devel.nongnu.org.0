Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C80505F38
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 23:18:45 +0200 (CEST)
Received: from localhost ([::1]:53712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngYlg-0004BE-DT
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 17:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ngYiV-0001Ih-B4
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 17:15:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ngYiS-0004mf-1U
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 17:15:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650316511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1QofZTZLBHzfvThnjFdCarzLGZLl1kCKdHKnqi/tm5M=;
 b=UecMwJk0oeZcksuatZrMoQN2yGCsFdFnMbMKV9teKrjJtaLtYIv1dCc8GADxorT0SNMklf
 X/8xOvX3mRJ4bz+SlWJdbOboAcPDowu5Jp9FCeQbUtPIY4THRNzdD3IO7IL9oMdbZGA8wg
 mZ9MTZm94aklD+v3TisiPACl4lVMYqE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-UPkUkOtgPq6bKV1TiMwkhg-1; Mon, 18 Apr 2022 17:15:10 -0400
X-MC-Unique: UPkUkOtgPq6bKV1TiMwkhg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 962D385A5BE;
 Mon, 18 Apr 2022 21:15:10 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2043E215CDCA;
 Mon, 18 Apr 2022 21:15:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/12] iotests/163: Fix broken qemu-io invocation
Date: Mon, 18 Apr 2022 17:14:54 -0400
Message-Id: <20220418211504.943969-3-jsnow@redhat.com>
In-Reply-To: <20220418211504.943969-1-jsnow@redhat.com>
References: <20220418211504.943969-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
index e4cd4b230f3..c94ad16f4a7 100755
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


