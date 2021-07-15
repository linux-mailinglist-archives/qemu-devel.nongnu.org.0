Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F138F3C9AC3
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 10:41:00 +0200 (CEST)
Received: from localhost ([::1]:48212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3wvT-0005bF-Hb
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 04:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3wuF-0004up-6c
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 04:39:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3wu9-0004Rs-4x
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 04:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626338376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QREW6eJiKePs8iKSHOzPEB6ae+1SB9+ilnVl8fdO3PQ=;
 b=NCk4YoDQHeou01HMckMF01367FYMEY+PNabMlsfVAuqS3dgMBnyf0fRWFww2UJh477h3ZT
 HRIYgIHowre1oZkmGT4AdhYHc2yQijhKQGdwK+u1u1h8VGQxrF/klXOfX9KQ+1BkLbSV6f
 iKm8DwSd/nR1xWjS1D3wqhbS8Fp3SyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-_nZ0y0cqNH6RAUv-MIX4Rw-1; Thu, 15 Jul 2021 04:39:33 -0400
X-MC-Unique: _nZ0y0cqNH6RAUv-MIX4Rw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E73871084F5B;
 Thu, 15 Jul 2021 08:39:31 +0000 (UTC)
Received: from thuth.com (ovpn-113-128.ams2.redhat.com [10.36.113.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8E8D5D9DD;
 Thu, 15 Jul 2021 08:39:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-6.1] configure: Fix endianess test with LTO
Date: Thu, 15 Jul 2021 10:39:28 +0200
Message-Id: <20210715083928.933806-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a user is trying to compile QEMU with link-time optimization
enabled by running the configure script like this:

 .../configure --extra-cflags="-flto"

then the endianess test is failing since the magic values do not
show up in the intermediate object files there. If the host is
a big endian machine (like s390x), the QEMU binary is then unusable
since the corresponding variable "bigendian" is pre-initialized
with "no".

To fix this issue, we should rather create a full binary and look
for the magic strings there instead.
And we really should not continue the build if the endianess check
failed, to make it clear right from the start that something went
wrong here, thus let's also add some "exit 1" statements here
after emitting the error message.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/configure b/configure
index eee1356814..b3f37a3bf1 100755
--- a/configure
+++ b/configure
@@ -2349,24 +2349,27 @@ feature_not_found() {
 # ---
 # big/little endian test
 cat > $TMPC << EOF
+#include <stdio.h>
 short big_endian[] = { 0x4269, 0x4765, 0x4e64, 0x4961, 0x4e00, 0, };
 short little_endian[] = { 0x694c, 0x7454, 0x654c, 0x6e45, 0x6944, 0x6e41, 0, };
-extern int foo(short *, short *);
-int main(int argc, char *argv[]) {
-    return foo(big_endian, little_endian);
+int main(int argc, char *argv[])
+{
+    return printf("%s %s\n", (char *)big_endian, (char *)little_endian);
 }
 EOF
 
-if compile_object ; then
-    if strings -a $TMPO | grep -q BiGeNdIaN ; then
+if compile_prog ; then
+    if strings -a $TMPE | grep -q BiGeNdIaN ; then
         bigendian="yes"
-    elif strings -a $TMPO | grep -q LiTtLeEnDiAn ; then
+    elif strings -a $TMPE | grep -q LiTtLeEnDiAn ; then
         bigendian="no"
     else
         echo big/little test failed
+        exit 1
     fi
 else
     echo big/little test failed
+    exit 1
 fi
 
 ##########################################
-- 
2.27.0


