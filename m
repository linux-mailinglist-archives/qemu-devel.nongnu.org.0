Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9351A9522
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 09:52:31 +0200 (CEST)
Received: from localhost ([::1]:45466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOcqU-00036Z-Pl
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 03:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51231)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jOcnf-0006Oo-9p
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:49:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jOcnd-0007LQ-TX
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:49:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32509
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jOcnd-0007KP-Oc
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586936973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZTXu9VOC5cjy/LHpJSbxX3yw8P34uUaNspmSlmDPxBQ=;
 b=RGLB6+Oz6TiDzDGqR1ayYMTih0aOGI/41U6Lrn2iFIlTbIo7lDOXTMR2uhrKVBl53qke6S
 4nrF0TjZBmwd8nM934IRbzgKA/mLn2Dj+7wwpZ81VUYWOjCQbQm2R8MUZD9KmxAVOq3W44
 Aks2TG+bMJnD5z8v92tH2cSoJ1+VOhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-njc0c8RrP3GEx9EmSsVteg-1; Wed, 15 Apr 2020 03:49:31 -0400
X-MC-Unique: njc0c8RrP3GEx9EmSsVteg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B206018C35A7;
 Wed, 15 Apr 2020 07:49:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C79119C70;
 Wed, 15 Apr 2020 07:49:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CB6671132C38; Wed, 15 Apr 2020 09:49:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-5.1 9/9] qemu-img: Reject broken -o ""
Date: Wed, 15 Apr 2020 09:49:27 +0200
Message-Id: <20200415074927.19897-10-armbru@redhat.com>
In-Reply-To: <20200415074927.19897-1-armbru@redhat.com>
References: <20200415074927.19897-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-img create, convert, amend, and measure use accumulate_options()
to merge multiple -o options.  This is broken for -o "":

    $ qemu-img create -f qcow2 -o backing_file=3Da -o "" -o backing_fmt=3Dr=
aw,size=3D1M new.qcow2
    qemu-img: warning: Could not verify backing image. This may become an e=
rror in future versions.
    Could not open 'a,backing_fmt=3Draw': No such file or directory
    Formatting 'new.qcow2', fmt=3Dqcow2 size=3D1048576 backing_file=3Da,,ba=
cking_fmt=3Draw cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D1=
6
    $ qemu-img info new.qcow2
    image: new.qcow2
    file format: qcow2
    virtual size: 1 MiB (1048576 bytes)
    disk size: 196 KiB
    cluster_size: 65536
--> backing file: a,backing_fmt=3Draw
    Format specific information:
        compat: 1.1
        lazy refcounts: false
        refcount bits: 16
        corrupt: false

Merging these three -o the obvious way is wrong, because it results in
an unwanted ',' escape:

    backing_file=3Da,,backing_fmt=3Draw,size=3D1M
                  ~~

We could silently drop -o "", but Kevin asked me to reject it instead.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qemu-img.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index cc51db7ed4..a2369766f0 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -229,14 +229,16 @@ static bool qemu_img_object_print_help(const char *ty=
pe, QemuOpts *opts)
  * To make that work, @optarg must not start with ',' (or else a
  * separating ',' preceding it gets escaped), and it must not end with
  * an odd number of ',' (or else a separating ',' following it gets
- * escaped).
+ * escaped), or be empty (or else a separating ',' preceding it can
+ * escape a separating ',' following it).
+ *=20
  */
 static bool is_valid_option_list(const char *optarg)
 {
     size_t len =3D strlen(optarg);
     size_t i;
=20
-    if (optarg[0] =3D=3D ',') {
+    if (!optarg[0] || optarg[0] =3D=3D ',') {
         return false;
     }
=20
--=20
2.21.1


