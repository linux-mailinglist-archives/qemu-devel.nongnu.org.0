Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6016E36193A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 07:25:10 +0200 (CEST)
Received: from localhost ([::1]:35696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXGyb-0005fG-GG
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 01:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lXGxI-0004ln-5u
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 01:23:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lXGxG-0006OS-ND
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 01:23:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618550626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=94YNnwlE5i083urHtdcPMa2T+xLEiXKmxewj1HY9wcs=;
 b=Y7c9GI16emTVxA0mh1VB+A2Asu3uWhOBV4QaDS386lMWTE3t7mz6tjxHir5QwKX+49Nlcj
 PTDcZrtJlA3iByhdem9UWn2KbJ1ibnty6vzy/DNxjdXaf6hNIanhV9MB8UG2EMh0r9tMJw
 xWE13M1Gk7wiM33mhPwyB/F/ymCRwNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-e7oCOSnhMQeCIR0SktIzOw-1; Fri, 16 Apr 2021 01:23:40 -0400
X-MC-Unique: e7oCOSnhMQeCIR0SktIzOw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00C9010053E7;
 Fri, 16 Apr 2021 05:23:39 +0000 (UTC)
Received: from thuth.com (ovpn-112-57.ams2.redhat.com [10.36.112.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBEC360BE5;
 Fri, 16 Apr 2021 05:23:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Subject: [PATCH] block/file-posix: Fix problem with fallocate(PUNCH_HOLE) on
 GPFS
Date: Fri, 16 Apr 2021 07:23:33 +0200
Message-Id: <20210416052333.1548853-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A customer reported that running

 qemu-img convert -t none -O qcow2 -f qcow2 input.qcow2 output.qcow2

fails for them with the following error message when the images are
stored on a GPFS file system:

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
PUNCH_HOLE call.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 block/file-posix.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index 20e14f8e96..7a40428d52 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1675,6 +1675,13 @@ static int handle_aiocb_write_zeroes(void *opaque)
             }
             s->has_fallocate = false;
         } else if (ret != -ENOTSUP) {
+            if (ret == -EINVAL) {
+                /*
+                 * File systems like GPFS do not like unaligned byte ranges,
+                 * treat it like unsupported (so caller falls back to pwrite)
+                 */
+                return -ENOTSUP;
+            }
             return ret;
         } else {
             s->has_discard = false;
-- 
2.27.0


