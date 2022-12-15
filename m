Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5C864DC4B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:32:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nsy-0001rk-BJ; Thu, 15 Dec 2022 08:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p5nsi-0001pG-MC
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:02:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p5nsg-0000bs-0N
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:02:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671109352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/u63xcwR4pBPzuAJYrFKyPl/P6dbO0ye1WgVvdyqS0U=;
 b=g4JpIpQM5xApREzabBX34WAR6s+w5eZxZorMcX2uBeqz5GooerjbZl3whn8M+nVkD/VCAd
 5dm9XKpftRi9ZRpqDubVJwzOnEU6uWEUcR5uKQDJOKKvZKOz5Wy6FL2HLMp2o0yZC8d2Q5
 Ai9YEiS2cQWtR7RZax6rAh33RpJ0oz4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-444-ldaMSRBVMTa8W6r8nkCDSQ-1; Thu, 15 Dec 2022 08:02:30 -0500
X-MC-Unique: ldaMSRBVMTa8W6r8nkCDSQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 e19-20020adfa453000000b0024209415034so612066wra.18
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 05:02:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/u63xcwR4pBPzuAJYrFKyPl/P6dbO0ye1WgVvdyqS0U=;
 b=zP4pLsvuPC6x0lp4rPN9RE0HI6lXPR5YwDx1dI9R3bNrPjInruQYvmIzU6xtx8gf+8
 kGpj+/gaXGGQrq7W3xKHNYJAIL88204iM/WKyfr2eiI7zQGigqiG37PULOCqaYDHE/4b
 ntQX64qsqX/4pa/upVMkBIb7gP+lPsola0Qpf08fKaNNBw97lV/GZqPtyLlCn3fcGgg2
 oH38+1jPQDOlhuGc/RKAwtbBQLtT+QtUe/f5X0kK5f3pfq0AlmuOg714DPC4lppo26oc
 tFXbdm4tPsV6WyrVD1jGuAqZWYGIPmuCyDtWMBK9II01L2HY245jHjS+36re0tTZIdpu
 HaSA==
X-Gm-Message-State: ANoB5pnmdtNgiy/vgqsOKb85NhEY+21opgLlL8YOsYrYDK9j0rPJorR0
 PwsllJRzkd3i2yermsn4wVReHoNRa3GT+KKcd/YTQcigoWPVgM56uUAnd8HE6uFknvUbuDs6RYH
 ougbz/lEW8wireB00mnjztF+kPCzqFzWbSCFMbf/BlJi92ywSoIMa/WKz8rclf2ThY+Y=
X-Received: by 2002:a05:600c:4fd0:b0:3cf:d367:274d with SMTP id
 o16-20020a05600c4fd000b003cfd367274dmr21897973wmq.31.1671109349320; 
 Thu, 15 Dec 2022 05:02:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6O+nVQXY72JVRi97Dz/t/gGjoqcMztMv5gqyAxMyNiSw8i9MWKVLhsxm+CjqGBO3bTwOEpDg==
X-Received: by 2002:a05:600c:4fd0:b0:3cf:d367:274d with SMTP id
 o16-20020a05600c4fd000b003cfd367274dmr21897938wmq.31.1671109348942; 
 Thu, 15 Dec 2022 05:02:28 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 8-20020a05600c020800b003d237d60318sm6283745wmi.2.2022.12.15.05.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 05:02:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	kwolf@redhat.com
Subject: [PATCH] qemu-io: do not reinvent the blk_pwrite_zeroes wheel
Date: Thu, 15 Dec 2022 14:02:23 +0100
Message-Id: <20221215130225.476477-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

qemu-io's do_co_pwrite_zeroes is reinventing the coroutine wrapper
blk_pwrite_zeroes.  Just use the real thing directly.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-io-cmds.c | 55 +++++++++-----------------------------------------
 1 file changed, 9 insertions(+), 46 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 952dc940f1df..7a412d6512fb 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -572,54 +572,17 @@ static int do_pwrite(BlockBackend *blk, char *buf, int64_t offset,
     return 1;
 }
 
-typedef struct {
-    BlockBackend *blk;
-    int64_t offset;
-    int64_t bytes;
-    int64_t *total;
-    int flags;
-    int ret;
-    bool done;
-} CoWriteZeroes;
-
-static void coroutine_fn co_pwrite_zeroes_entry(void *opaque)
-{
-    CoWriteZeroes *data = opaque;
-
-    data->ret = blk_co_pwrite_zeroes(data->blk, data->offset, data->bytes,
-                                     data->flags);
-    data->done = true;
-    if (data->ret < 0) {
-        *data->total = data->ret;
-        return;
-    }
-
-    *data->total = data->bytes;
-}
-
-static int do_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+static int do_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                int64_t bytes, int flags, int64_t *total)
 {
-    Coroutine *co;
-    CoWriteZeroes data = {
-        .blk    = blk,
-        .offset = offset,
-        .bytes  = bytes,
-        .total  = total,
-        .flags  = flags,
-        .done   = false,
-    };
+    int ret = blk_pwrite_zeroes(blk, offset, bytes,
+                                flags | BDRV_REQ_ZERO_WRITE);
 
-    co = qemu_coroutine_create(co_pwrite_zeroes_entry, &data);
-    bdrv_coroutine_enter(blk_bs(blk), co);
-    while (!data.done) {
-        aio_poll(blk_get_aio_context(blk), true);
-    }
-    if (data.ret < 0) {
-        return data.ret;
-    } else {
-        return 1;
+    if (ret < 0) {
+        return ret;
     }
+    *total = bytes;
+    return 1;
 }
 
 static int do_write_compressed(BlockBackend *blk, char *buf, int64_t offset,
@@ -1042,7 +1005,7 @@ static void write_help(void)
 " -C, -- report statistics in a machine parsable format\n"
 " -q, -- quiet mode, do not show I/O statistics\n"
 " -u, -- with -z, allow unmapping\n"
-" -z, -- write zeroes using blk_co_pwrite_zeroes\n"
+" -z, -- write zeroes using blk_pwrite_zeroes\n"
 "\n");
 }
 
@@ -1199,7 +1162,7 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
     if (bflag) {
         ret = do_save_vmstate(blk, buf, offset, count, &total);
     } else if (zflag) {
-        ret = do_co_pwrite_zeroes(blk, offset, count, flags, &total);
+        ret = do_pwrite_zeroes(blk, offset, count, flags, &total);
     } else if (cflag) {
         ret = do_write_compressed(blk, buf, offset, count, &total);
     } else {
-- 
2.38.1


