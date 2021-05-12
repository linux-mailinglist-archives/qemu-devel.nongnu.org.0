Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B14E37D514
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 23:50:34 +0200 (CEST)
Received: from localhost ([::1]:38910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgwkT-0000DX-8y
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 17:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwh5-0000rZ-GM
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:47:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwgz-0007kI-JR
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:47:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620856017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WcxvslPiqRtDScsP2tpRXLNfLV3/rncXdVX3EotBdLs=;
 b=FUUMN+xRyI9Pa1wdte3XBAQRlEhryziic9gR4wemOwkKTvIFYu110RTyVWVrlYErvCYYuF
 zEf8gH/7+gWZc7JqDms5dg8Q5K2JqxSsCWk/TBB+fMT43uud9a6a1+EBw+S+ZAeIlOP7kT
 QFiz7Q7G7126Pb5rma+Q6RotM4GQ3Is=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-XGqIXiNRM7qLCFcdqvB75w-1; Wed, 12 May 2021 17:46:54 -0400
X-MC-Unique: XGqIXiNRM7qLCFcdqvB75w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E932107ACE3;
 Wed, 12 May 2021 21:46:53 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 796195D6AC;
 Wed, 12 May 2021 21:46:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/10] iotests: use subprocess.run where possible
Date: Wed, 12 May 2021 17:46:39 -0400
Message-Id: <20210512214642.2803189-8-jsnow@redhat.com>
In-Reply-To: <20210512214642.2803189-1-jsnow@redhat.com>
References: <20210512214642.2803189-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pylint 2.8.x adds warnings whenever we use Popen calls without using
'with', so it's desirable to convert synchronous calls to run()
invocations where applicable.

(Though, this trades one pylint warning for another due to a pylint bug,
which I've silenced with a pragma and a link to the bug.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 5af01828951..46deb7f4dd4 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -113,15 +113,16 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
     Run a tool and return both its output and its exit code
     """
     stderr = subprocess.STDOUT if connect_stderr else None
-    subp = subprocess.Popen(args,
-                            stdout=subprocess.PIPE,
-                            stderr=stderr,
-                            universal_newlines=True)
-    output = subp.communicate()[0]
-    if subp.returncode < 0:
+    res = subprocess.run(args,
+                         stdout=subprocess.PIPE,
+                         stderr=stderr,
+                         universal_newlines=True,
+                         check=False)
+    output = res.stdout
+    if res.returncode < 0:
         cmd = ' '.join(args)
-        sys.stderr.write(f'{tool} received signal {-subp.returncode}: {cmd}\n')
-    return (output, subp.returncode)
+        sys.stderr.write(f'{tool} received signal {-res.returncode}: {cmd}\n')
+    return (output, res.returncode)
 
 def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
     """
@@ -1153,6 +1154,8 @@ def _verify_virtio_scsi_pci_or_ccw() -> None:
 
 
 def supports_quorum():
+    # https://github.com/PyCQA/astroid/issues/689
+    # pylint: disable=unsupported-membership-test
     return 'quorum' in qemu_img_pipe('--help')
 
 def verify_quorum():
-- 
2.30.2


