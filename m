Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B62C433BBC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:08:57 +0200 (CEST)
Received: from localhost ([::1]:40462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrfb-0007Lb-If
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQk-0001R3-0C
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQg-00081b-OC
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634654965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7yNFTkEkdMRw1gtMrcY1seNDCUcqqL4Yv9wyvzTXCz4=;
 b=iesaBtTlyEQwvG3rb+MZp/42Kr9BorhPicbBerAD8134q+MvL0fvVqNDNo1CIe1ml/SHiJ
 ss+TmwHtOwXA5q6tu6kuhlf/BdABJNmA9HQHVqaaM6gXl/vwLVK7QrSJ64OEVMiX4ly80e
 BSmsgXeV8jS1uZFOiGPqT//vbk+oBRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-Ey0szTMePhGfxzcUQx9ZMg-1; Tue, 19 Oct 2021 10:49:24 -0400
X-MC-Unique: Ey0szTMePhGfxzcUQx9ZMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5575D81C464;
 Tue, 19 Oct 2021 14:49:23 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 551795D6D7;
 Tue, 19 Oct 2021 14:49:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/15] iotests/297: Add get_files() function
Date: Tue, 19 Oct 2021 10:49:06 -0400
Message-Id: <20211019144918.3159078-4-jsnow@redhat.com>
In-Reply-To: <20211019144918.3159078-1-jsnow@redhat.com>
References: <20211019144918.3159078-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out file discovery into its own method to begin separating out
configuration/setup and test execution.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/297 | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index b8101e6024a..15b54594c11 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -21,6 +21,7 @@ import re
 import shutil
 import subprocess
 import sys
+from typing import List
 
 import iotests
 
@@ -54,10 +55,14 @@ def is_python_file(filename):
             return False
 
 
-def run_linters():
+def get_test_files() -> List[str]:
     named_tests = [f'tests/{entry}' for entry in os.listdir('tests')]
     check_tests = set(os.listdir('.') + named_tests) - set(SKIP_FILES)
-    files = [filename for filename in check_tests if is_python_file(filename)]
+    return list(filter(is_python_file, check_tests))
+
+
+def run_linters():
+    files = get_test_files()
 
     iotests.logger.debug('Files to be checked:')
     iotests.logger.debug(', '.join(sorted(files)))
-- 
2.31.1


