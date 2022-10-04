Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E14E5F4B0F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:43:51 +0200 (CEST)
Received: from localhost ([::1]:48024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofphe-0000Qh-Al
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0f80141cde3904ed0591354059da49d1d60bcdbc@lizzy.crudebyte.com>)
 id 1ofpMq-0007hb-Er
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:22:21 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:53557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0f80141cde3904ed0591354059da49d1d60bcdbc@lizzy.crudebyte.com>)
 id 1ofpMo-0002rG-TN
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:22:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=B85oV3I79gym6QZTLeX83GlkTP+Mp33vVUVty9UPNaE=; b=dPN5Z
 CwCpkN9tGaPqe4/TokeviyHnIo/2uGRYVgnqjoL0JFmSAllwOMTus5/u0wrhfg0R5u+fn7xxakQnB
 wNjtPJ6ZYoFOSC2xpxR3U0XMZ28r1lBdTt2/hec2R0kYqEwBDH+Px/DrVq+YpWN34ndISxiGLs7YG
 9t8Z/ddj5VhxEhqmS/Rop7ebQ/jJAtmixmBrbPJlKp1XuGCKHIWalFlbbv32fvJJ3oLn/rHGvjWWA
 erar94IIRSRMUHw1DrxtbSGdO96Jh+aFGoUYL4UgmxBMN2Z/311FwYgaT1x4LTnl806NR/PYWioPy
 erwLQdhiGrKSgJRVf0ioB/3CHZvNg==;
Message-Id: <0f80141cde3904ed0591354059da49d1d60bcdbc.1664917004.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:54:30 +0200
Subject: [PATCH 20/20] tests/9p: remove unnecessary g_strdup() calls
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=0f80141cde3904ed0591354059da49d1d60bcdbc@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a leftover from before the recent function merge and
refactoring patches:

As these functions do not return control to the caller in
between, it is not necessary to duplicate strings passed to them.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p-client.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
index e017e030ec..e4a368e036 100644
--- a/tests/qtest/libqos/virtio-9p-client.c
+++ b/tests/qtest/libqos/virtio-9p-client.c
@@ -770,7 +770,6 @@ TMkdirRes v9fs_tmkdir(TMkdirOpt opt)
 {
     P9Req *req;
     uint32_t err;
-    g_autofree char *name = g_strdup(opt.name);
 
     g_assert(opt.client);
     /* expecting either hi-level atPath or low-level dfid, but not both */
@@ -788,14 +787,14 @@ TMkdirRes v9fs_tmkdir(TMkdirOpt opt)
     }
 
     uint32_t body_size = 4 + 4 + 4;
-    uint16_t string_size = v9fs_string_size(name);
+    uint16_t string_size = v9fs_string_size(opt.name);
 
     g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
     body_size += string_size;
 
     req = v9fs_req_init(opt.client, body_size, P9_TMKDIR, opt.tag);
     v9fs_uint32_write(req, opt.dfid);
-    v9fs_string_write(req, name);
+    v9fs_string_write(req, opt.name);
     v9fs_uint32_write(req, opt.mode);
     v9fs_uint32_write(req, opt.gid);
     v9fs_req_send(req);
@@ -831,7 +830,6 @@ TlcreateRes v9fs_tlcreate(TlcreateOpt opt)
 {
     P9Req *req;
     uint32_t err;
-    g_autofree char *name = g_strdup(opt.name);
 
     g_assert(opt.client);
     /* expecting either hi-level atPath or low-level fid, but not both */
@@ -849,14 +847,14 @@ TlcreateRes v9fs_tlcreate(TlcreateOpt opt)
     }
 
     uint32_t body_size = 4 + 4 + 4 + 4;
-    uint16_t string_size = v9fs_string_size(name);
+    uint16_t string_size = v9fs_string_size(opt.name);
 
     g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
     body_size += string_size;
 
     req = v9fs_req_init(opt.client, body_size, P9_TLCREATE, opt.tag);
     v9fs_uint32_write(req, opt.fid);
-    v9fs_string_write(req, name);
+    v9fs_string_write(req, opt.name);
     v9fs_uint32_write(req, opt.flags);
     v9fs_uint32_write(req, opt.mode);
     v9fs_uint32_write(req, opt.gid);
@@ -896,8 +894,6 @@ TsymlinkRes v9fs_tsymlink(TsymlinkOpt opt)
 {
     P9Req *req;
     uint32_t err;
-    g_autofree char *name = g_strdup(opt.name);
-    g_autofree char *symtgt = g_strdup(opt.symtgt);
 
     g_assert(opt.client);
     /* expecting either hi-level atPath or low-level fid, but not both */
@@ -911,15 +907,16 @@ TsymlinkRes v9fs_tsymlink(TsymlinkOpt opt)
     }
 
     uint32_t body_size = 4 + 4;
-    uint16_t string_size = v9fs_string_size(name) + v9fs_string_size(symtgt);
+    uint16_t string_size = v9fs_string_size(opt.name) +
+                           v9fs_string_size(opt.symtgt);
 
     g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
     body_size += string_size;
 
     req = v9fs_req_init(opt.client, body_size, P9_TSYMLINK, opt.tag);
     v9fs_uint32_write(req, opt.fid);
-    v9fs_string_write(req, name);
-    v9fs_string_write(req, symtgt);
+    v9fs_string_write(req, opt.name);
+    v9fs_string_write(req, opt.symtgt);
     v9fs_uint32_write(req, opt.gid);
     v9fs_req_send(req);
 
-- 
2.30.2


