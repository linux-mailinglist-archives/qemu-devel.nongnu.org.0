Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE690294D7B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 15:26:59 +0200 (CEST)
Received: from localhost ([::1]:39976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVE8p-0007Su-15
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 09:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <4d7275b2363f122438a443ce079cbb355285e9d6@lizzy.crudebyte.com>)
 id 1kVE50-0002li-7n
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 09:23:03 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:56297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <4d7275b2363f122438a443ce079cbb355285e9d6@lizzy.crudebyte.com>)
 id 1kVE4w-0003UE-TV
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 09:23:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=jPv90ogvE1yLkYJEbd3gMSVSQi2C/uVPumjs570j7TA=; b=QIIxR
 zdFM+boVEyJSeqc1NulY3RUlGNir0cgUUgSuzXwVVPiFtRV9XgOKSm2hrxwJL/FIxM23Oa+rnE45P
 glmuhuANWGQmGVuWRiqXQmOhe2hLQqWiqVp7YpqB9jliZ4ekq7fEekrnfTa0q5/eutK5WnQoeS1pm
 LtV5F6i4QYSXI2RUfNguy2nxIkSw8iJ0I31nNQ3r/5D9m73IUiMZxj3Enog2JiotmH6F3ddOZh3zr
 pjlnBCCY29iBiuAiYvq+UNhp8U84PE3h3v4F+DspJbpfFwUty0WrbFp7a9E4G6h2ajeoQWhXc6A/D
 IS/UovEd2PZvXCql+/m7bv7Ooux1w==;
Message-Id: <4d7275b2363f122438a443ce079cbb355285e9d6.1603285620.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1603285620.git.qemu_oss@crudebyte.com>
References: <cover.1603285620.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 21 Oct 2020 14:06:53 +0200
Subject: [PATCH v2 1/8] tests/9pfs: simplify do_mkdir()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=4d7275b2363f122438a443ce079cbb355285e9d6@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 09:21:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out walking a directory path to a separate new utility function
do_walk() and use that function in do_mkdir().

The code difference saved this way is not much, but we'll use that new
do_walk() function in the upcoming patches, so it will avoid quite
some code duplication after all.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 2ea555fa04..21807037df 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -583,6 +583,23 @@ static void do_version(QVirtio9P *v9p)
     g_free(server_version);
 }
 
+/* utility function: walk to requested dir and return fid for that dir */
+static uint32_t do_walk(QVirtio9P *v9p, const char *path)
+{
+    char **wnames;
+    P9Req *req;
+    const uint32_t fid = genfid();
+
+    int nwnames = split(path, "/", &wnames);
+
+    req = v9fs_twalk(v9p, 0, fid, nwnames, wnames, 0);
+    v9fs_req_wait_for_reply(req, NULL);
+    v9fs_rwalk(req, NULL, NULL);
+
+    split_free(&wnames);
+    return fid;
+}
+
 static void fs_version(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     alloc = t_alloc;
@@ -974,23 +991,17 @@ static void fs_flush_ignored(void *obj, void *data, QGuestAllocator *t_alloc)
 
 static void do_mkdir(QVirtio9P *v9p, const char *path, const char *cname)
 {
-    char **wnames;
     char *const name = g_strdup(cname);
+    uint32_t fid;
     P9Req *req;
-    const uint32_t fid = genfid();
 
-    int nwnames = split(path, "/", &wnames);
-
-    req = v9fs_twalk(v9p, 0, fid, nwnames, wnames, 0);
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rwalk(req, NULL, NULL);
+    fid = do_walk(v9p, path);
 
     req = v9fs_tmkdir(v9p, fid, name, 0750, 0, 0);
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rmkdir(req, NULL);
 
     g_free(name);
-    split_free(&wnames);
 }
 
 static void fs_readdir_split_128(void *obj, void *data,
-- 
2.20.1


