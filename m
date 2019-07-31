Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC697C53C
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 16:44:15 +0200 (CEST)
Received: from localhost ([::1]:41474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsppu-0002UR-B6
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 10:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44753)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hspp5-0001CO-4W
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:43:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hspp4-0000vC-0p
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:43:23 -0400
Received: from mga05.intel.com ([192.55.52.43]:51110)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hspp3-0000sD-OH
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:43:21 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 07:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,330,1559545200"; d="scan'208";a="347557226"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga005.jf.intel.com with ESMTP; 31 Jul 2019 07:43:15 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 22:42:24 +0800
Message-Id: <20190731144225.3784-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731144225.3784-1-richardw.yang@linux.intel.com>
References: <20190731144225.3784-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
Subject: [Qemu-devel] [PATCH 1/2] migration/qemu-file: remove check on
 writev_buffer in qemu_put_compression_data
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
Cc: Wei Yang <richardw.yang@linux.intel.com>, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The check of writev_buffer is in qemu_fflush, which means it is not
harmful if it is NULL.

And removing it will make the code consistent since all other
add_to_iovec() is called without the check.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/qemu-file.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 0431585502..35c22605dd 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -717,9 +717,7 @@ ssize_t qemu_put_compression_data(QEMUFile *f, z_stream *stream,
     }
 
     qemu_put_be32(f, blen);
-    if (f->ops->writev_buffer) {
-        add_to_iovec(f, f->buf + f->buf_index, blen, false);
-    }
+    add_to_iovec(f, f->buf + f->buf_index, blen, false);
     f->buf_index += blen;
     if (f->buf_index == IO_BUF_SIZE) {
         qemu_fflush(f);
-- 
2.17.1


