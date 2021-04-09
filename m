Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81777359C85
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 13:00:24 +0200 (CEST)
Received: from localhost ([::1]:55824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUosB-0003MB-Ch
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 07:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lUoqM-0002nv-E2
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:58:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lUoqG-0002B2-3E
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:58:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617965901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rslm5yc8I1k4SNmho/Dv/Y0uCjwL7HICN2RClJ7Sjbc=;
 b=eXRarbT8cvJIAFChOllpzZVf3v0xCUBrIEd6E9hMtQTYUp+axTSVtNVqnh8wP9dVrWvC4a
 xIG11nBG0eOvvSxMuUaAS4X7AMzbOj8JOEwA87nSg/VzzBEpvH2boqBKxm/Xsde3gBtwFV
 FWC0JqEXfheOUuu16LbbLMPALppkwzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-XEQhgQAhPZaRXq9CIGzxDQ-1; Fri, 09 Apr 2021 06:58:20 -0400
X-MC-Unique: XEQhgQAhPZaRXq9CIGzxDQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FF56100A616
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 10:58:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-165.ams2.redhat.com
 [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D85045D9E3;
 Fri,  9 Apr 2021 10:58:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9574618000AB; Fri,  9 Apr 2021 12:58:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qemu-trace-stap: changing SYSTEMTAP_TAPSET considered
 harmful.
Date: Fri,  9 Apr 2021 12:58:10 +0200
Message-Id: <20210409105810.374976-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
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
 scripts/qemu-trace-stap | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/scripts/qemu-trace-stap b/scripts/qemu-trace-stap
index 90527eb974f4..eb6e951ff235 100755
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
@@ -101,10 +96,9 @@ def cmd_list(args):
 
         if verbose:
             print("Listing probes with name '%s'" % script)
-        proc = subprocess.Popen(["stap", "-l", script],
+        proc = subprocess.Popen(["stap", "-I", tapsets, "-l", script],
                                 stdout=subprocess.PIPE,
-                                universal_newlines=True,
-                                env=tapset_env(tapsets))
+                                universal_newlines=True)
         out, err = proc.communicate()
         if proc.returncode != 0:
             print("No probes found, are the tapsets installed in %s" % tapset_dir(args.binary))
-- 
2.30.2


