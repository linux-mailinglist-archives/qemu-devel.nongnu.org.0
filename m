Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527A925CF28
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 03:52:23 +0200 (CEST)
Received: from localhost ([::1]:49528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE0tp-0001MO-Sn
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 21:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1kE0sn-0000VH-O7; Thu, 03 Sep 2020 21:51:17 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:34134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1kE0sl-0000Gb-SK; Thu, 03 Sep 2020 21:51:17 -0400
Received: by mail-pj1-x1042.google.com with SMTP id n3so4494832pjq.1;
 Thu, 03 Sep 2020 18:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WrIvGIVwkUVVRo0DcZVhgzquP/38Kl7+Ui1XtFslbK4=;
 b=B+XD0Wo3lFeURHZKy5A7KehFBld8vCFwziu3+6NUkq4/7N6k6ZGMk/YR0ZzJCiWFWx
 nxCnUohRwuS4E7RR1XG+k82S0B3qrKCd3lyjrSEW8AIZF7pU1sobRqk3BpiKtfLSni40
 v2fg/suYuAIhU+F4YTIAkQo7yuqen1b0Lfe936l1C3ZoRRWUF+FKT7gK2ZAl47xWvJ6g
 CCqiO8swCs29Q2aILIcuCE6RrvBLqYxdb+wS0gFC9ywk4QD2CRN8Ig+ziqW0bBx7FrQY
 JbChCBVIQzE9EW11D6m6csV1yPNdTrmQ7wZhHY/xQgCy7OplUuR6rDJxJVslqJNJW2Ot
 8ssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WrIvGIVwkUVVRo0DcZVhgzquP/38Kl7+Ui1XtFslbK4=;
 b=EZS7s6kxTJpPt2BWDS29HvWoIeyEMixPxiZveBL2gG2XkfiJNaXXowlYSX+foZjpjF
 QNpT7jvlJ42Qbrgma+RcqAlI/i9ZSTP9atQzIF1Hk5mXG5QsOFnz793TY9YRZ36lCVi3
 9nE4PVxBxjNY//auSQZztJASRusCvUerEuVHPz7HLRPxOphpJL51FyLxkyD3WuTsKjwF
 9MPHWiWzpjPcNed+qiESHin4l69MX3nk9sn0QaMpBXJ1EWpOzzmr6DmI307gIvJngQ0A
 yEc9z3obv4VeX0OKAkoge02tYW9HolCm0kFZARMO31IUv+8UED9xz1T6UcgrKZ3ogvof
 VPaQ==
X-Gm-Message-State: AOAM533mMRwftQz4uU7MIHhLN8cqdEzyVK1QoLe1gXa9Dw6lBWQsbUFj
 LWFalX2Je3s/ohIhFcSmPAlg2cuD8A0=
X-Google-Smtp-Source: ABdhPJwilRaw8Jhsyh1ZqK33vMPA2U8giC9h/e/ywI9L/xV9hSRbQmk43dRtgBmlDHZz6ry1SNVlMA==
X-Received: by 2002:a17:90a:4709:: with SMTP id
 h9mr5700567pjg.235.1599184273688; 
 Thu, 03 Sep 2020 18:51:13 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
 by smtp.gmail.com with ESMTPSA id j11sm3935559pgh.8.2020.09.03.18.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 18:51:13 -0700 (PDT)
From: Tom Yan <tom.ty89@gmail.com>
To: qemu-block@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] file-posix: split hdev_refresh_limits from
 raw_refresh_limits
Date: Fri,  4 Sep 2020 09:51:03 +0800
Message-Id: <20200904015104.234704-1-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=tom.ty89@gmail.com; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Tom Yan <tom.ty89@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can and should get max transfer length and max segments for all host
devices / cdroms (on Linux).

Also use MIN_NON_ZERO instead when we clamp max transfer length against
max segments.

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
---
v2: fix get_max_transfer_length for non-sg devices; also add/fix
sg_get_max_segments for sg devices
v3: fix typo in get_max_transfer_length
 block/file-posix.c | 57 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 16 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 9a00d4190a..411a23cf99 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1178,7 +1178,24 @@ static int sg_get_max_transfer_length(int fd)
 #endif
 }
 
-static int sg_get_max_segments(int fd)
+static int get_max_transfer_length(int fd)
+{
+#if defined(BLKSECTGET) && defined(BLKSSZGET)
+    int sect = 0;
+    int ssz = 0;
+
+    if (ioctl(fd, BLKSECTGET, &sect) == 0 &&
+        ioctl(fd, BLKSSZGET, &ssz) == 0) {
+        return sect * ssz;
+    } else {
+        return -errno;
+    }
+#else
+    return -ENOSYS;
+#endif
+}
+
+static int get_max_segments(int fd)
 {
 #ifdef CONFIG_LINUX
     char buf[32];
@@ -1233,23 +1250,31 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
 
-    if (bs->sg) {
-        int ret = sg_get_max_transfer_length(s->fd);
+    raw_probe_alignment(bs, s->fd, errp);
+    bs->bl.min_mem_alignment = s->buf_align;
+    bs->bl.opt_mem_alignment = MAX(s->buf_align, qemu_real_host_page_size);
+}
+
+static void hdev_refresh_limits(BlockDriverState *bs, Error **errp)
+{
+    BDRVRawState *s = bs->opaque;
+
+    /* BLKSECTGET has always been implemented wrongly in the sg driver
+       and BLKSSZGET has never been supported by it*/
+    int ret = bs->sg ? sg_get_max_transfer_length(s->fd) :
+                       get_max_transfer_length(s->fd);
 
-        if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
-            bs->bl.max_transfer = pow2floor(ret);
-        }
+    if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
+        bs->bl.max_transfer = pow2floor(ret);
+    }
 
-        ret = sg_get_max_segments(s->fd);
-        if (ret > 0) {
-            bs->bl.max_transfer = MIN(bs->bl.max_transfer,
-                                      ret * qemu_real_host_page_size);
-        }
+    ret = get_max_segments(s->fd);
+    if (ret > 0) {
+        bs->bl.max_transfer = MIN_NON_ZERO(bs->bl.max_transfer,
+                                           ret * qemu_real_host_page_size);
     }
 
-    raw_probe_alignment(bs, s->fd, errp);
-    bs->bl.min_mem_alignment = s->buf_align;
-    bs->bl.opt_mem_alignment = MAX(s->buf_align, qemu_real_host_page_size);
+    raw_refresh_limits(bs, errp);
 }
 
 static int check_for_dasd(int fd)
@@ -3604,7 +3629,7 @@ static BlockDriver bdrv_host_device = {
     .bdrv_co_pdiscard       = hdev_co_pdiscard,
     .bdrv_co_copy_range_from = raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = raw_co_copy_range_to,
-    .bdrv_refresh_limits = raw_refresh_limits,
+    .bdrv_refresh_limits = hdev_refresh_limits,
     .bdrv_io_plug = raw_aio_plug,
     .bdrv_io_unplug = raw_aio_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
@@ -3728,7 +3753,7 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_preadv         = raw_co_preadv,
     .bdrv_co_pwritev        = raw_co_pwritev,
     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
-    .bdrv_refresh_limits = raw_refresh_limits,
+    .bdrv_refresh_limits = hdev_refresh_limits,
     .bdrv_io_plug = raw_aio_plug,
     .bdrv_io_unplug = raw_aio_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
-- 
2.28.0


