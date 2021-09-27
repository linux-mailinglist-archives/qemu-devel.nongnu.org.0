Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7FD41A198
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 23:58:17 +0200 (CEST)
Received: from localhost ([::1]:58826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUydc-0005Zx-Ai
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 17:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybO-0002W5-Ek
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:55:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybL-0002i3-Sp
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:55:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632779755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i7dmGNPUnoMVpFUrIEkhEnvvqaBiBXE6XZxgi4AXxyI=;
 b=CzJ6zcwL/sreVXEqDYIFqDRKpVLQRT5JObC4TbdI6y17Dx/0IDj4rXdtwFCxto7uD/EZDk
 rg9zxtQE1wATbd9dS8vCpdL7Y3PjbEq826S2lameckiP4LIQO4lQAbVHD23mLx5BU33dZP
 54iATNWQL0eJ19V2dUZqwadIMCSHa14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-JlbCgeWQPJGZ4p3iTY0uHQ-1; Mon, 27 Sep 2021 17:55:53 -0400
X-MC-Unique: JlbCgeWQPJGZ4p3iTY0uHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 341C45074E;
 Mon, 27 Sep 2021 21:55:52 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 308D118A6A;
 Mon, 27 Sep 2021 21:55:51 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/20] qemu-nbd: Change default cache mode to writeback
Date: Mon, 27 Sep 2021 16:55:26 -0500
Message-Id: <20210927215545.3930309-2-eblake@redhat.com>
In-Reply-To: <20210927215545.3930309-1-eblake@redhat.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Nir Soffer <nsoffer@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-stable@nongnu.org, Nir Soffer <nirsof@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nir Soffer <nirsof@gmail.com>

Both qemu and qemu-img use writeback cache mode by default, which is
already documented in qemu(1). qemu-nbd uses writethrough cache mode by
default, and the default cache mode is not documented.

According to the qemu-nbd(8):

   --cache=CACHE
          The  cache  mode  to be used with the file.  See the
          documentation of the emulator's -drive cache=... option for
          allowed values.

qemu(1) says:

    The default mode is cache=writeback.

So users have no reason to assume that qemu-nbd is using writethough
cache mode. The only hint is the painfully slow writing when using the
defaults.

Looking in git history, it seems that qemu used writethrough in the past
to support broken guests that did not flush data properly, or could not
flush due to limitations in qemu. But qemu-nbd clients can use
NBD_CMD_FLUSH to flush data, so using writethrough does not help anyone.

Change the default cache mode to writback, and document the default and
available values properly in the online help and manual.

With this change converting image via qemu-nbd is 3.5 times faster.

    $ qemu-img create dst.img 50g
    $ qemu-nbd -t -f raw -k /tmp/nbd.sock dst.img

Before this change:

    $ hyperfine -r3 "./qemu-img convert -p -f raw -O raw -T none -W fedora34.img nbd+unix:///?socket=/tmp/nbd.sock"
    Benchmark #1: ./qemu-img convert -p -f raw -O raw -T none -W fedora34.img nbd+unix:///?socket=/tmp/nbd.sock
      Time (mean ± σ):     83.639 s ±  5.970 s    [User: 2.733 s, System: 6.112 s]
      Range (min … max):   76.749 s … 87.245 s    3 runs

After this change:

    $ hyperfine -r3 "./qemu-img convert -p -f raw -O raw -T none -W fedora34.img nbd+unix:///?socket=/tmp/nbd.sock"
    Benchmark #1: ./qemu-img convert -p -f raw -O raw -T none -W fedora34.img nbd+unix:///?socket=/tmp/nbd.sock
      Time (mean ± σ):     23.522 s ±  0.433 s    [User: 2.083 s, System: 5.475 s]
      Range (min … max):   23.234 s … 24.019 s    3 runs

Users can avoid the issue by using --cache=writeback[1] but the defaults
should give good performance for the common use case.

[1] https://bugzilla.redhat.com/1990656

Signed-off-by: Nir Soffer <nsoffer@redhat.com>
Message-Id: <20210813205519.50518-1-nsoffer@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
CC: qemu-stable@nongnu.org
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/tools/qemu-nbd.rst | 6 ++++--
 qemu-nbd.c              | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
index e39a9f4b1a67..56e54cd44114 100644
--- a/docs/tools/qemu-nbd.rst
+++ b/docs/tools/qemu-nbd.rst
@@ -99,8 +99,10 @@ driver options if ``--image-opts`` is specified.

 .. option:: --cache=CACHE

-  The cache mode to be used with the file.  See the documentation of
-  the emulator's ``-drive cache=...`` option for allowed values.
+  The cache mode to be used with the file. Valid values are:
+  ``none``, ``writeback`` (the default), ``writethrough``,
+  ``directsync`` and ``unsafe``. See the documentation of
+  the emulator's ``-drive cache=...`` option for more info.

 .. option:: -n, --nocache

diff --git a/qemu-nbd.c b/qemu-nbd.c
index 65ebec598f88..9d895ba24b1e 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -135,7 +135,9 @@ static void usage(const char *name)
 "                            'snapshot.id=[ID],snapshot.name=[NAME]', or\n"
 "                            '[ID_OR_NAME]'\n"
 "  -n, --nocache             disable host cache\n"
-"      --cache=MODE          set cache mode (none, writeback, ...)\n"
+"      --cache=MODE          set cache mode used to access the disk image, the\n"
+"                            valid options are: 'none', 'writeback' (default),\n"
+"                            'writethrough', 'directsync' and 'unsafe'\n"
 "      --aio=MODE            set AIO mode (native, io_uring or threads)\n"
 "      --discard=MODE        set discard mode (ignore, unmap)\n"
 "      --detect-zeroes=MODE  set detect-zeroes mode (off, on, unmap)\n"
@@ -552,7 +554,7 @@ int main(int argc, char **argv)
     bool alloc_depth = false;
     const char *tlscredsid = NULL;
     bool imageOpts = false;
-    bool writethrough = true;
+    bool writethrough = false; /* Client will flush as needed. */
     bool fork_process = false;
     bool list = false;
     int old_stderr = -1;
-- 
2.31.1


