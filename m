Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C78840CC5E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:11:40 +0200 (CEST)
Received: from localhost ([::1]:36154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZNj-0005Vs-LC
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6q-00071L-C0
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6n-00071E-LG
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ZNUvK+igyqmEZ+P+tnZfm/uqiSbIePHbkyWvCn0fFU=;
 b=CBQOXs3pCtRGEhhbXkhRuVHdpwAvZg0DS8c15jhlY2zZPa+wfFvpXqGgdSTIUx9/QweIZq
 ycBUP+7SGEFvkt93wC8FTCMmVcg/GL5SgpxecUkMzuYFDAlsz8GeKxwDgfO6Wi7sG3WA1D
 wj6e7AcNU0l4Zm4EpVy3T1iun4HdObo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-mHKnlEr8O2-rXWrY30nviA-1; Wed, 15 Sep 2021 13:54:06 -0400
X-MC-Unique: mHKnlEr8O2-rXWrY30nviA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C79B1084683;
 Wed, 15 Sep 2021 17:54:05 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FDC3604CC;
 Wed, 15 Sep 2021 17:54:04 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 21/32] qemu-img: Allow target be aligned to sector size
Date: Wed, 15 Sep 2021 19:53:07 +0200
Message-Id: <20210915175318.853225-22-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
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
Message-Id: <20210819101200.64235-1-hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qemu-img.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/qemu-img.c b/qemu-img.c
index d77f3e76a9..e43a71a794 100644
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


