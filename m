Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274623AD71
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 05:11:58 +0200 (CEST)
Received: from localhost ([::1]:40156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haAiz-0006O5-Cw
	for lists+qemu-devel@lfdr.de; Sun, 09 Jun 2019 23:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39021)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1haAgu-0004aG-R4
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 23:09:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1haAgt-0005sd-VE
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 23:09:48 -0400
Received: from mga02.intel.com ([134.134.136.20]:49683)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1haAgt-0005rt-O3
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 23:09:47 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jun 2019 20:09:45 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga006.fm.intel.com with ESMTP; 09 Jun 2019 20:09:44 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 10 Jun 2019 11:08:51 +0800
Message-Id: <20190610030852.16039-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190610030852.16039-1-richardw.yang@linux.intel.com>
References: <20190610030852.16039-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-devel] [PATCH 1/2] cutils: remove one unnecessary pointer
 operation
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

Since we will not operate on the next address pointed by out, it is not
necessary to do addition on it.

After removing the operation, the function size reduced 16/18 bytes.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 util/cutils.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/util/cutils.c b/util/cutils.c
index 9aacc422ca..1933a68da5 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -754,11 +754,11 @@ int uleb128_encode_small(uint8_t *out, uint32_t n)
 {
     g_assert(n <= 0x3fff);
     if (n < 0x80) {
-        *out++ = n;
+        *out = n;
         return 1;
     } else {
         *out++ = (n & 0x7f) | 0x80;
-        *out++ = n >> 7;
+        *out = n >> 7;
         return 2;
     }
 }
@@ -766,7 +766,7 @@ int uleb128_encode_small(uint8_t *out, uint32_t n)
 int uleb128_decode_small(const uint8_t *in, uint32_t *n)
 {
     if (!(*in & 0x80)) {
-        *n = *in++;
+        *n = *in;
         return 1;
     } else {
         *n = *in++ & 0x7f;
@@ -774,7 +774,7 @@ int uleb128_decode_small(const uint8_t *in, uint32_t *n)
         if (*in & 0x80) {
             return -1;
         }
-        *n |= *in++ << 7;
+        *n |= *in << 7;
         return 2;
     }
 }
-- 
2.19.1


