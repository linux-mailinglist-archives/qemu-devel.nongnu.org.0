Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B15442AD491
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:18:46 +0100 (CET)
Received: from localhost ([::1]:43492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRfh-00081h-Oy
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZG-00075x-MW
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZC-0004by-LW
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605006720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=GA0OiwGhaepEgCMan96O1G0UDsJcJqZid2wZ0UQzYUU=;
 b=EpmWfnp4QaiOifh5nlyyUaDY2k24RSK9JPWhLy7pKV2uOtEW2gtGBIXq9IG9C16IcZwhDr
 ZTpPgyWivGdWNKDsT6FVFGgiXCTEBpxYhoXHWgzsGrUsm5qLft5fiUup2Xh+JjDTQjuuJ/
 HjjAKNDlszPtcG7cp94jIYNpAgygoCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-sl3xQDkaN3OGmDm5ddUqeQ-1; Tue, 10 Nov 2020 06:11:56 -0500
X-MC-Unique: sl3xQDkaN3OGmDm5ddUqeQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D51457204;
 Tue, 10 Nov 2020 11:11:55 +0000 (UTC)
Received: from thuth.com (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E4CB10013D9;
 Tue, 10 Nov 2020 11:11:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/19] scripts/oss-fuzz: give all fuzzers -target names
Date: Tue, 10 Nov 2020 12:11:23 +0100
Message-Id: <20201110111132.559399-11-thuth@redhat.com>
In-Reply-To: <20201110111132.559399-1-thuth@redhat.com>
References: <20201110111132.559399-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

We switched to hardlinks in
a942f64cc4 ("scripts/oss-fuzz: use hardlinks instead of copying")

The motivation was to conserve space (50 fuzzers built with ASAN, can
weigh close to 9 GB).

Unfortunately, OSS-Fuzz (partially) treated the underlying copy of the
fuzzer as a standalone fuzzer. To attempt to fix, we tried:

f8b8f37463 ("scripts/oss-fuzz: rename bin/qemu-fuzz-i386")

This was also not a complete fix, because though OSS-Fuzz
ignores the renamed fuzzer, the underlying ClusterFuzz, doesn't:
https://storage.googleapis.com/clusterfuzz-builds/qemu/targets.list.address
https://oss-fuzz-build-logs.storage.googleapis.com/log-9bfb55f9-1c20-4aa6-a49c-ede12864eeb2.txt
(clusterfuzz still lists qemu-fuzz-i386.base as a fuzzer)

This change keeps the hard-links, but makes them all point to a file
with a qemu-fuzz-i386-target-.. name. If we have targets, A, B, C, the
result will be:

qemu-fuzz-i386-target-A (base file)
qemu-fuzz-i386-target-B -> qemu-fuzz-i386-target-A
qemu-fuzz-i386-target-C -> qemu-fuzz-i386-target-A

The result should be that every file that looks like a fuzzer to
OSS-Fuzz/ClusterFuzz, can run as a fuzzer (we don't have a separate base
copy). Unfortunately, there is not simple way to test this locally.

In the future, it might be worth it to link the majority of QEMU in as a
shared-object (see https://github.com/google/oss-fuzz/issues/4575 )

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20201108171136.160607-1-alxndr@bu.edu>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/oss-fuzz/build.sh | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
index 3b1c82b63d..c1af43fded 100755
--- a/scripts/oss-fuzz/build.sh
+++ b/scripts/oss-fuzz/build.sh
@@ -62,9 +62,6 @@ fi
 
 mkdir -p "$DEST_DIR/lib/"  # Copy the shared libraries here
 
-mkdir -p "$DEST_DIR/bin/"  # Copy executables that shouldn't
-                           # be treated as fuzzers by oss-fuzz here
-
 # Build once to get the list of dynamic lib paths, and copy them over
 ../configure --disable-werror --cc="$CC" --cxx="$CXX" --enable-fuzzing \
     --prefix="$DEST_DIR" --bindir="$DEST_DIR" --datadir="$DEST_DIR/data/" \
@@ -91,20 +88,23 @@ make "-j$(nproc)" qemu-fuzz-i386 V=1
 # Copy over the datadir
 cp  -r ../pc-bios/ "$DEST_DIR/pc-bios"
 
-cp "./qemu-fuzz-i386" "$DEST_DIR/bin/qemu-fuzz-i386.base"
+targets=$(./qemu-fuzz-i386 | awk '$1 ~ /\*/  {print $2}')
+base_copy="$DEST_DIR/qemu-fuzz-i386-target-$(echo "$targets" | head -n 1)"
+
+cp "./qemu-fuzz-i386" "$base_copy"
 
 # Run the fuzzer with no arguments, to print the help-string and get the list
 # of available fuzz-targets. Copy over the qemu-fuzz-i386, naming it according
 # to each available fuzz target (See 05509c8e6d fuzz: select fuzz target using
 # executable name)
-for target in $(./qemu-fuzz-i386 | awk '$1 ~ /\*/  {print $2}');
+for target in $(echo "$targets" | tail -n +2);
 do
     # Ignore the generic-fuzz target, as it requires some environment variables
     # to be configured. We have some generic-fuzz-{pc-q35, floppy, ...} targets
     # that are thin wrappers around this target that set the required
     # environment variables according to predefined configs.
     if [ "$target" != "generic-fuzz" ]; then
-        ln  "$DEST_DIR/bin/qemu-fuzz-i386.base" \
+        ln  $base_copy \
             "$DEST_DIR/qemu-fuzz-i386-target-$target"
     fi
 done
-- 
2.18.4


