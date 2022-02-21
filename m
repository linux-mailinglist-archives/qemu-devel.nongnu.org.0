Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF134BED65
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 23:49:07 +0100 (CET)
Received: from localhost ([::1]:53088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMHUR-0004pd-33
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 17:49:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGV-0000Ue-PS
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:34:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGU-0008C9-8Z
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645482881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s6OJFVxOFWitfwLFi3aEol6Hg7IpcKBFDxQTcNUfTfw=;
 b=JhiId9fa/bSQWDV9jI2jpR7rIqiO7DW6jPccFyAAMrhdtkBrQrc3cYV077V9fbAHvtMt3w
 /hLL+J4R2Lqi5mUJxkEiD5U7jAisVEMWN9U7xP/P04xJ3mN6Ddo0uXF6RhuUy1cKH7WmmE
 O79wpxD74HSkfXbOVSfL2S0EAgh0Km8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-hGM_aLvUOyiTLdSm7X938w-1; Mon, 21 Feb 2022 17:34:38 -0500
X-MC-Unique: hGM_aLvUOyiTLdSm7X938w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92060814243;
 Mon, 21 Feb 2022 22:34:37 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDD3C1038AAF;
 Mon, 21 Feb 2022 22:34:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/18] iotests: remove-bitmap-from-backing: use
 qemu_img_info()
Date: Mon, 21 Feb 2022 17:34:04 -0500
Message-Id: <20220221223413.2123003-10-jsnow@redhat.com>
In-Reply-To: <20220221223413.2123003-1-jsnow@redhat.com>
References: <20220221223413.2123003-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove two more usages of qemu_img_pipe().

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/tests/remove-bitmap-from-backing | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/tests/remove-bitmap-from-backing b/tests/qemu-iotests/tests/remove-bitmap-from-backing
index fee31413400..15be32dcb96 100755
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


