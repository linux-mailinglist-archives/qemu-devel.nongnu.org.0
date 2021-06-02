Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A578398B19
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:53:03 +0200 (CEST)
Received: from localhost ([::1]:36026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRIs-0000Ld-IB
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCI-00016L-MB
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCF-0007E1-RA
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cX0Q8TeZnbeXMi/emkSacTTXOXKvnm1UoXk1pfoo5kw=;
 b=FJtGN3FEnGYL091W+gBCkl1QEKG78dg3cEbW69p+7netspKeSfwASg6H54BBVBhFWWUENr
 oYUxu8iN3oLoasXYBEvrpAso4QJGDFb6Zp2qzwbadCP21C3PNEJAAYqKW9xcPUZqUI5tT3
 4q90LPRoFuoGaHbgYpe+IHdCa+04HL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-4hTn4ExwMkOWpFl-pgpPHA-1; Wed, 02 Jun 2021 09:46:09 -0400
X-MC-Unique: 4hTn4ExwMkOWpFl-pgpPHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDC656D5DA;
 Wed,  2 Jun 2021 13:45:44 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDB1860BD9;
 Wed,  2 Jun 2021 13:45:43 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/20] block/file-posix: Fix problem with fallocate(PUNCH_HOLE)
 on GPFS
Date: Wed,  2 Jun 2021 15:45:17 +0200
Message-Id: <20210602134529.231756-9-kwolf@redhat.com>
In-Reply-To: <20210602134529.231756-1-kwolf@redhat.com>
References: <20210602134529.231756-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

A customer reported that running

 qemu-img convert -t none -O qcow2 -f qcow2 input.qcow2 output.qcow2

fails for them with the following error message when the images are
stored on a GPFS file system :

 qemu-img: error while writing sector 0: Invalid argument

After analyzing the strace output, it seems like the problem is in
handle_aiocb_write_zeroes(): The call to fallocate(FALLOC_FL_PUNCH_HOLE)
returns EINVAL, which can apparently happen if the file system has
a different idea of the granularity of the operation. It's arguably
a bug in GPFS, since the PUNCH_HOLE mode should not result in EINVAL
according to the man-page of fallocate(), but the file system is out
there in production and so we have to deal with it. In commit 294682cc3a
("block: workaround for unaligned byte range in fallocate()") we also
already applied the a work-around for the same problem to the earlier
fallocate(FALLOC_FL_ZERO_RANGE) call, so do it now similar with the
PUNCH_HOLE call. But instead of silently catching and returning
-ENOTSUP (which causes the caller to fall back to writing zeroes),
let's rather inform the user once about the buggy file system and
try the other fallback instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210527172020.847617-2-thuth@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/file-posix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index 10b71d9a13..6e24083f3f 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1650,6 +1650,17 @@ static int handle_aiocb_write_zeroes(void *opaque)
                 return ret;
             }
             s->has_fallocate = false;
+        } else if (ret == -EINVAL) {
+            /*
+             * Some file systems like older versions of GPFS do not like un-
+             * aligned byte ranges, and return EINVAL in such a case, though
+             * they should not do it according to the man-page of fallocate().
+             * Warn about the bad filesystem and try the final fallback instead.
+             */
+            warn_report_once("Your file system is misbehaving: "
+                             "fallocate(FALLOC_FL_PUNCH_HOLE) returned EINVAL. "
+                             "Please report this bug to your file sytem "
+                             "vendor.");
         } else if (ret != -ENOTSUP) {
             return ret;
         } else {
-- 
2.30.2


