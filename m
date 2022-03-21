Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510E14E31B0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 21:26:14 +0100 (CET)
Received: from localhost ([::1]:55112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWObV-0004mw-Ai
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 16:26:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOS7-00069C-W4
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:16:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOS3-0001kD-VX
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647893787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=73z9DFkLRTxcJxcdBYPJhhz/pAvzr7E3yMuXDNJjnP4=;
 b=KzBg/FVH5wbwVnVOANKOLZUuWJ0Z8rahIYRz/99VOyhMJP2/2081IMdcYCTic7hHtiarUZ
 JMwbYKAMZrS9WcC4hcwIuXFUK6wM6r2JDkp4n26Spb2XnBcBsPQxjh7VhLyqD8bxcn7Lar
 Vnp6TyX+NNzK/jOVGo6CyMBsukE6wa4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-YveQs6aIMtCAlJWRGSMQuQ-1; Mon, 21 Mar 2022 16:16:23 -0400
X-MC-Unique: YveQs6aIMtCAlJWRGSMQuQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09E10380406C;
 Mon, 21 Mar 2022 20:16:23 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5867454D60;
 Mon, 21 Mar 2022 20:16:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/18] iotests/remove-bitmap-from-backing: use
 qemu_img_info()
Date: Mon, 21 Mar 2022 16:16:09 -0400
Message-Id: <20220321201618.903471-10-jsnow@redhat.com>
In-Reply-To: <20220321201618.903471-1-jsnow@redhat.com>
References: <20220321201618.903471-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This removes two more usages of qemu_img_pipe() and replaces them with
calls to qemu_img(), which provides better diagnostic information on
failure.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
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


