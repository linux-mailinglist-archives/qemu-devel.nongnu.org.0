Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE67216075
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 22:44:09 +0200 (CEST)
Received: from localhost ([::1]:37002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsXyC-0000fC-7H
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 16:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jsXuc-0003Sk-7J
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 16:40:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45443
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jsXua-0002gB-14
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 16:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594068023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jNGMTOWCcwnlezz2bFnUdE96DO+dgt8gPAgoKcTcoIo=;
 b=KvbvpT2sJCGSQj0lMgeQdJ7w0P0cgYN/hBLLiMp1V8wlDsfd0mnr9hIp4B3MVvYwWdlBpG
 uN0l9+vuGWLQ+PEq79wJeB8KmSuMrHjkVEMNZXlX1fC+7hcPFmB336zBHj2ofhyqlCpWU1
 E60HFeCS2uBa2MybXQo+zT2D+0/ggj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-aEzSBX9XNN6HgQ1FYEMCOg-1; Mon, 06 Jul 2020 16:40:21 -0400
X-MC-Unique: aEzSBX9XNN6HgQ1FYEMCOg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72F7180B712;
 Mon,  6 Jul 2020 20:40:20 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-97.phx2.redhat.com [10.3.113.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA6A81C4;
 Mon,  6 Jul 2020 20:40:18 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/10] qcow2: Deprecate use of qemu-img amend to change
 backing file
Date: Mon,  6 Jul 2020 15:39:51 -0500
Message-Id: <20200706203954.341758-8-eblake@redhat.com>
In-Reply-To: <20200706203954.341758-1-eblake@redhat.com>
References: <20200706203954.341758-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:22:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, qemu-block@nongnu.org,
 kchamart@redhat.com, libvir-list@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The use of 'qemu-img amend' to change qcow2 backing files is not
tested very well.  In particular, our implementation has a bug where
if a new backing file is provided without a format, then the prior
format is blindly reused, even if this results in data corruption, but
this is not caught by iotests.

There are also situations where amending other options needs access to
the original backing file (for example, on a downgrade to a v2 image,
knowing whether a v3 zero cluster must be allocated or may be left
unallocated depends on knowing whether the backing file already reads
as zero), but the command line does not have a nice way to tell us
both the backing file to use for opening the image as well as the
backing file to install after the operation is complete.

Even if we do allow changing the backing file, it is redundant with
the existing ability to change backing files via 'qemu-img rebase -u'.
It is time to deprecate this support (leaving the existing behavior
intact, even if it is buggy), and at a point in the future, require
the use of only 'qemu-img rebase' for adjusting backing chain
relations, saving 'qemu-img amend' for changes unrelated to the
backing chain.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/system/deprecated.rst | 12 ++++++++++++
 docs/tools/qemu-img.rst    |  4 ++++
 block/qcow2.c              |  5 +++++
 tests/qemu-iotests/061.out |  1 +
 tests/qemu-iotests/082.out |  2 ++
 5 files changed, 24 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 6fbec34b8b37..b312ad27aa04 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -418,6 +418,18 @@ kernel in 2018, and has also been dropped from glibc.
 Related binaries
 ----------------

+qemu-img amend to adjust backing file (since 5.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''
+
+The use of ``qemu-img amend`` to modify the name or format of a qcow2
+backing image is deprecated; this functionality was never fully
+documented or tested, and interferes with other amend operations that
+need access to the original backing image (such as deciding whether a
+v3 zero cluster may be left unallocated when converting to a v2
+image).  Rather, any changes to the backing chain should be performed
+with ``qemu-img rebase -u`` either before or after the remaining
+changes being performed by amend, as appropriate.
+
 Backwards compatibility
 -----------------------

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 7f0737488ade..fa53e30697e7 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -258,6 +258,10 @@ Command description:
   Amends the image format specific *OPTIONS* for the image file
   *FILENAME*. Not all file formats support this operation.

+  The set of options that can be amended are dependent on the image
+  format, but note that amending the backing chain relationship should
+  instead be performed with ``qemu-img rebase``.
+
 .. option:: bench [-c COUNT] [-d DEPTH] [-f FMT] [--flush-interval=FLUSH_INTERVAL] [-i AIO] [-n] [--no-drain] [-o OFFSET] [--pattern=PATTERN] [-q] [-s BUFFER_SIZE] [-S STEP_SIZE] [-t CACHE] [-w] [-U] FILENAME

   Run a simple sequential I/O benchmark on the specified image. If ``-w`` is
diff --git a/block/qcow2.c b/block/qcow2.c
index 0cd2e6757e8c..99aedb8eede6 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5523,6 +5523,11 @@ static int qcow2_amend_options(BlockDriverState *bs, QemuOpts *opts,
     }

     if (backing_file || backing_format) {
+        if (g_strcmp0(backing_file, s->image_backing_file) ||
+            g_strcmp0(backing_format, s->image_backing_format)) {
+            warn_report("Deprecated use of amend to alter the backing file; "
+                        "use qemu-img rebase instead");
+        }
         ret = qcow2_change_backing_file(bs,
                     backing_file ?: s->image_backing_file,
                     backing_format ?: s->image_backing_format);
diff --git a/tests/qemu-iotests/061.out b/tests/qemu-iotests/061.out
index 2f03cf045cce..c549b139da47 100644
--- a/tests/qemu-iotests/061.out
+++ b/tests/qemu-iotests/061.out
@@ -370,6 +370,7 @@ wrote 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+qemu-img: warning: Deprecated use of amend to alter the backing file; use qemu-img rebase instead
 read 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 No errors were found on the image.
diff --git a/tests/qemu-iotests/082.out b/tests/qemu-iotests/082.out
index 529a1214e1ea..7f2b207d247b 100644
--- a/tests/qemu-iotests/082.out
+++ b/tests/qemu-iotests/082.out
@@ -839,10 +839,12 @@ Creation options for 'qcow2':
 Note that not all of these options may be amendable.

 Testing: amend -f qcow2 -o backing_file=TEST_DIR/t.qcow2,,help TEST_DIR/t.qcow2
+qemu-img: warning: Deprecated use of amend to alter the backing file; use qemu-img rebase instead

 Testing: rebase -u -b  -f qcow2 TEST_DIR/t.qcow2

 Testing: amend -f qcow2 -o backing_file=TEST_DIR/t.qcow2,,? TEST_DIR/t.qcow2
+qemu-img: warning: Deprecated use of amend to alter the backing file; use qemu-img rebase instead

 Testing: rebase -u -b  -f qcow2 TEST_DIR/t.qcow2

-- 
2.27.0


