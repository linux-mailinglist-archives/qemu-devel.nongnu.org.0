Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038173FDEC7
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:36:57 +0200 (CEST)
Received: from localhost ([::1]:37910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSIK-0000ul-1c
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRzA-0004SQ-7D
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRz7-0003ZY-Ud
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5PmbfJAkkFd/cgbNK2VepFueoG9SKGX3CAA9C+LMYNA=;
 b=gvndENIJHRSFWBib99n4/t4x6jTg42vC8+4G4wfeYBDaYMRjqxQ4BZaRfwcjnRHcG0cPzP
 aSJryNBXVbRSM0ybcqGqPMI6MyBaTpNQpsUQVmzN539dC7dTd2Zvz/OawFRynpflxQ40GU
 XPM/ztdYgpYL4nd4Z13V6Ow8b9QxVP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-fqMvawGIPO2lr_oFvLDy5w-1; Wed, 01 Sep 2021 11:17:04 -0400
X-MC-Unique: fqMvawGIPO2lr_oFvLDy5w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF4AA520E;
 Wed,  1 Sep 2021 15:17:01 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C7A66A05B;
 Wed,  1 Sep 2021 15:17:01 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 19/56] iotests: use with-statement for open() calls
Date: Wed,  1 Sep 2021 17:15:42 +0200
Message-Id: <20210901151619.689075-20-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Silences a new pylint warning. The dangers of *not* doing this are
somewhat unclear; I believe the file object gets garbage collected
eventually, but possibly the way in which it happens is
non-deterministic. Maybe this is a valid warning, but if there are
consequences of not doing it, I am not aware of them at present.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210720173336.1876937-2-jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 2cf5ff965b..2ad7a15c8b 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1120,7 +1120,8 @@ def notrun(reason):
     # Each test in qemu-iotests has a number ("seq")
     seq = os.path.basename(sys.argv[0])
 
-    open('%s/%s.notrun' % (output_dir, seq), 'w').write(reason + '\n')
+    with open('%s/%s.notrun' % (output_dir, seq), 'w') as outfile:
+        outfile.write(reason + '\n')
     logger.warning("%s not run: %s", seq, reason)
     sys.exit(0)
 
@@ -1133,8 +1134,8 @@ def case_notrun(reason):
     # Each test in qemu-iotests has a number ("seq")
     seq = os.path.basename(sys.argv[0])
 
-    open('%s/%s.casenotrun' % (output_dir, seq), 'a').write(
-        '    [case not run] ' + reason + '\n')
+    with open('%s/%s.casenotrun' % (output_dir, seq), 'a') as outfile:
+        outfile.write('    [case not run] ' + reason + '\n')
 
 def _verify_image_format(supported_fmts: Sequence[str] = (),
                          unsupported_fmts: Sequence[str] = ()) -> None:
-- 
2.31.1


