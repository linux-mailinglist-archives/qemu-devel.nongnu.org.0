Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6F4D4C2D
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Oct 2019 04:41:33 +0200 (CEST)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJ7LY-0005MQ-77
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 22:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54816)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iJ7KA-00045i-OG
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 22:40:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iJ7K9-0001IK-Ov
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 22:40:06 -0400
Received: from mga17.intel.com ([192.55.52.151]:11741)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iJ7K9-0001Hj-Gb
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 22:40:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 19:40:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,286,1566889200"; d="scan'208";a="395935154"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga006.fm.intel.com with ESMTP; 11 Oct 2019 19:40:03 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 1/2] migration/compress: compress QEMUFile is not writable
Date: Sat, 12 Oct 2019 10:39:31 +0800
Message-Id: <20191012023932.1863-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191012023932.1863-1-richardw.yang@linux.intel.com>
References: <20191012023932.1863-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
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
Cc: qemu-devel@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We open a file with empty_ops for compress QEMUFile, which means this is
not writable.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/qemu-file.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 26fb25ddc1..f3d99a96ec 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -744,11 +744,8 @@ static int qemu_compress_data(z_stream *stream, uint8_t *dest, size_t dest_len,
 /* Compress size bytes of data start at p and store the compressed
  * data to the buffer of f.
  *
- * When f is not writable, return -1 if f has no space to save the
- * compressed data.
- * When f is wirtable and it has no space to save the compressed data,
- * do fflush first, if f still has no space to save the compressed
- * data, return -1.
+ * Since the file is dummy file with empty_ops, return -1 if f has no space to
+ * save the compressed data.
  */
 ssize_t qemu_put_compression_data(QEMUFile *f, z_stream *stream,
                                   const uint8_t *p, size_t size)
@@ -756,14 +753,7 @@ ssize_t qemu_put_compression_data(QEMUFile *f, z_stream *stream,
     ssize_t blen = IO_BUF_SIZE - f->buf_index - sizeof(int32_t);
 
     if (blen < compressBound(size)) {
-        if (!qemu_file_is_writable(f)) {
-            return -1;
-        }
-        qemu_fflush(f);
-        blen = IO_BUF_SIZE - sizeof(int32_t);
-        if (blen < compressBound(size)) {
-            return -1;
-        }
+        return -1;
     }
 
     blen = qemu_compress_data(stream, f->buf + f->buf_index + sizeof(int32_t),
-- 
2.17.1


