Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FF74D264C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 04:56:53 +0100 (CET)
Received: from localhost ([::1]:50510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRnRU-0005vW-U3
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 22:56:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnPC-0002Ma-JZ
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnPB-0002ts-6e
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646798068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=16wjsOJ9rjZKX7D6nsSETGvgSlpAGVSo+ZZw10K6cSE=;
 b=TUsFQORR8tbP/57pTMu2Hy9iufBZw7MMvAFk8/VhMwa/H7UmHVdBdgPK3IIpydJwoOrc3x
 OCdHU3yghGmfIFwpAVhdt54wvMIIvVPaowEKnSdMec4yK2nnKdyjx/ambIySO6MFrJqT9S
 3Q6bZV7YnQrlDDoYplFYHPrCGpFiYVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-3udddEWTPzeNt13RtR_D2w-1; Tue, 08 Mar 2022 22:54:25 -0500
X-MC-Unique: 3udddEWTPzeNt13RtR_D2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB0BDFC81;
 Wed,  9 Mar 2022 03:54:24 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F5096C180;
 Wed,  9 Mar 2022 03:54:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/14] iotests/remove-bitmap-from-backing: use qemu_img_info()
Date: Tue,  8 Mar 2022 22:53:57 -0500
Message-Id: <20220309035407.1848654-5-jsnow@redhat.com>
In-Reply-To: <20220309035407.1848654-1-jsnow@redhat.com>
References: <20220309035407.1848654-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This removes two more usages of qemu_img_pipe() and replaces them with
calls to qemu_img(), which provides better diagnostic information on
failure.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/tests/remove-bitmap-from-backing | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/tests/remove-bitmap-from-backing b/tests/qemu-iotests/tests/remove-bitmap-from-backing
index fee3141340..15be32dcb9 100755
--- a/tests/qemu-iotests/tests/remove-bitmap-from-backing
+++ b/tests/qemu-iotests/tests/remove-bitmap-from-backing
@@ -19,7 +19,7 @@
 #
 
 import iotests
-from iotests import log, qemu_img_create, qemu_img, qemu_img_pipe
+from iotests import log, qemu_img_create, qemu_img, qemu_img_info
 
 iotests.script_initialize(supported_fmts=['qcow2'],
                           unsupported_imgopts=['compat'])
@@ -33,7 +33,7 @@ qemu_img_create('-f', iotests.imgfmt, '-b', base,
 
 qemu_img('bitmap', '--add', base, 'bitmap0')
 # Just assert that our method of checking bitmaps in the image works.
-assert 'bitmaps' in qemu_img_pipe('info', base)
+assert 'bitmaps' in qemu_img_info(base)['format-specific']['data']
 
 vm = iotests.VM().add_drive(top, 'backing.node-name=base')
 vm.launch()
@@ -68,5 +68,5 @@ if result != {'return': {}}:
 
 vm.shutdown()
 
-if 'bitmaps' in qemu_img_pipe('info', base):
+if 'bitmaps' in qemu_img_info(base)['format-specific']['data']:
     log('ERROR: Bitmap is still in the base image')
-- 
2.34.1


