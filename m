Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC16359C4B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 12:41:02 +0200 (CEST)
Received: from localhost ([::1]:40296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUoZQ-0003YL-TY
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 06:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lUoYL-00036i-DQ
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:39:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lUoYI-0007sN-IT
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:39:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617964788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3pMJ7hmjlE/xlyhraOCf3BJtgxCanyotf9XTSzKhnA0=;
 b=UB2FfvVOEsvra02qhCb+Ev1DUYJEyZaikC4fsQ0QqxhsxU5vW7yq3cB1+FtVFgESzlBeSN
 vqxesWUIysV9juu9zyC/oIOQL4BFXLQ5e0Ahf9oapkFHpgGPijyFiQcFtExbWJPRdVAV/c
 Nse4R4UXOOWupipbd0dVvk7M+h9Q500=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-i8uKhoKhNziiYVXbaZhYjw-1; Fri, 09 Apr 2021 06:39:46 -0400
X-MC-Unique: i8uKhoKhNziiYVXbaZhYjw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A434107ACC7
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 10:39:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-165.ams2.redhat.com
 [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52B3410023BE;
 Fri,  9 Apr 2021 10:39:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6E69018003A3; Fri,  9 Apr 2021 12:39:36 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-trace-stap: changing SYSTEMTAP_TAPSET considered harmful.
Date: Fri,  9 Apr 2021 12:39:36 +0200
Message-Id: <20210409103936.369354-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting SYSTEMTAP_TAPSET to some value other than
/usr/share/systemtap/tapsets results in systemtap not finding the
standard tapset library any more, which in turn breaks tracing because
pid() and other standard systemtap functions are not available any more.

So using SYSTEMTAP_TAPSET to point systemtap to the qemu probes will
only work for the prefix=/usr installs because both qemu and system
tapsets in the same directory then.  All other prefixes are broken.

Fix that by using the "-I $tapsetdir" command line switch instead.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 scripts/qemu-trace-stap | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/scripts/qemu-trace-stap b/scripts/qemu-trace-stap
index 90527eb974f4..0d0011cf396e 100755
--- a/scripts/qemu-trace-stap
+++ b/scripts/qemu-trace-stap
@@ -55,11 +55,6 @@ def tapset_dir(binary):
     return os.path.realpath(tapset)
 
 
-def tapset_env(tapset_dir):
-    tenv = copy.copy(os.environ)
-    tenv["SYSTEMTAP_TAPSET"] = tapset_dir
-    return tenv
-
 def cmd_run(args):
     prefix = probe_prefix(args.binary)
     tapsets = tapset_dir(args.binary)
@@ -81,11 +76,11 @@ def cmd_run(args):
 
     # We request an 8MB buffer, since the stap default 1MB buffer
     # can be easily overflowed by frequently firing QEMU traces
-    stapargs = ["stap", "-s", "8"]
+    stapargs = ["stap", "-s", "8", "-I", tapsets ]
     if args.pid is not None:
         stapargs.extend(["-x", args.pid])
     stapargs.extend(["-e", script])
-    subprocess.call(stapargs, env=tapset_env(tapsets))
+    subprocess.call(stapargs)
 
 
 def cmd_list(args):
-- 
2.30.2


