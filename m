Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D063F1723
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 12:13:17 +0200 (CEST)
Received: from localhost ([::1]:46996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGf2y-0005dQ-Fk
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 06:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGf1u-0004q8-Eh
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 06:12:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGf1r-0000GO-6r
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 06:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629367925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tyd9JAQm8E0fckTM7h7htZkyAZ9J3s14u3wuOWgzL9k=;
 b=LbwY653OKvf9nbKzEzaPhzyZGkUdq7OYZeW8ePOE9Yib7072IOtmBqbdP91SkWnlMEE1AT
 r0sV5Pv30lL/hz2Ld05MzDptLslNWeLoTUc109xCVr0wAbLcA/mTwj47PoBLAFnxzJejVL
 vA4IDVVpE+SiYWzOeld5PDyCQbKEjTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-Gll2x5FBPJ61LkuB18XMdQ-1; Thu, 19 Aug 2021 06:12:03 -0400
X-MC-Unique: Gll2x5FBPJ61LkuB18XMdQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7348E8799E0;
 Thu, 19 Aug 2021 10:12:02 +0000 (UTC)
Received: from localhost (unknown [10.39.193.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 177891AC80;
 Thu, 19 Aug 2021 10:12:01 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] qemu-img: Allow target be aligned to sector size
Date: Thu, 19 Aug 2021 12:12:00 +0200
Message-Id: <20210819101200.64235-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We cannot write to images opened with O_DIRECT unless we allow them to
be resized so they are aligned to the sector size: Since 9c60a5d1978,
bdrv_node_refresh_perm() ensures that for nodes whose length is not
aligned to the request alignment and where someone has taken a WRITE
permission, the RESIZE permission is taken, too).

Let qemu-img convert pass the BDRV_O_RESIZE flag (which causes
blk_new_open() to take the RESIZE permission) when using cache=none for
the target, so that when writing to it, it can be aligned to the target
sector size.

Without this patch, an error is returned:

$ qemu-img convert -f raw -O raw -t none foo.img /mnt/tmp/foo.img
qemu-img: Could not open '/mnt/tmp/foo.img': Cannot get 'write'
permission without 'resize': Image size is not a multiple of request
alignment

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1994266
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
As I have written in the BZ linked above, I am not sure what behavior we
want.  It can be argued that the current behavior is perfectly OK
because we want the target to have the same size as the source, so if
this cannot be done, we should just print the above error (which I think
explains the problem well enough that users can figure out they need to
resize the source image).

OTOH, it is difficult for me to imagine a case where the user would
prefer the above error to just having qemu-img align the target image's
length.
---
 qemu-img.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/qemu-img.c b/qemu-img.c
index 908fd0cce5..d4b29bf73e 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2628,6 +2628,14 @@ static int img_convert(int argc, char **argv)
         goto out;
     }
 
+    if (flags & BDRV_O_NOCACHE) {
+        /*
+         * If we open the target with O_DIRECT, it may be necessary to
+         * extend its size to align to the physical sector size.
+         */
+        flags |= BDRV_O_RESIZE;
+    }
+
     if (skip_create) {
         s.target = img_open(tgt_image_opts, out_filename, out_fmt,
                             flags, writethrough, s.quiet, false);
-- 
2.31.1


