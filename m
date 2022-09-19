Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7AA5BD52C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 21:25:11 +0200 (CEST)
Received: from localhost ([::1]:60692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaMOE-0002Wl-21
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 15:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaMMP-0000qk-Cx
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 15:23:17 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaMMN-0004Tg-Kr
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 15:23:17 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 s90-20020a17090a2f6300b00203a685a1aaso222266pjd.1
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 12:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date;
 bh=4zo/XncxFLJ4jIo+fUsz0yM3ZAnSCZCgw6Pftf1MFHA=;
 b=XCJQsbt/rp6egJ9cTn8P433LGDXV9rpdy0KTYp5VrGzsMY8SVDTHUGnGP+0An8Vubm
 7mEsPuTZYITeEo30Ah3fhH1DZEnBZLimWy1yDLV2gW2EuzzbkwjROWMUwVxvBnDSpl2V
 sA9TnPnmdzEXoB0tvkSL6AVi5G2RAOwqVloiSm6SN9mr5UAkI+GvzkPBzsPM3uv1ylOM
 p5QvyqxlEQU2g94UdMeUtkEbGZTsH9NiTQ6xEOn5g0JdQIaZ0DGt2/X9uVpk51djJn1B
 +t1baFld8OFAtE40SkNT1i2SISCNO0oTp6eFdA+cfTTWqlg4SD9T6kvh/wQgsuo/norR
 IXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
 bh=4zo/XncxFLJ4jIo+fUsz0yM3ZAnSCZCgw6Pftf1MFHA=;
 b=1L9rmew5Z7Q173HGjcmhbEO4CSPK+nFhlUusHIWbCOswbFrBepSxFpJ/6ebFePXvy3
 aEPBCh9CuntAi3GTNZYjdPsH2T4x3I4jtP/mLO72IrJ6dYeXpr94GkaExKzsLxUcues1
 hfvaP2NQVb5Ex75MyYbde3zVOwNypCccoaQu2xvWEjb8FfB98bAsXWjKwY/+WEBoiufa
 qU0HQIPN5OWPYZYo+ZjaY+WczCZKkm7L/S0PWi9M2xusZNCd13Ppo1FPeXUnU220/Q4P
 2hQ6ZREwXAwcL8vpH6BTyJzuZS6b3kJML3vHCN3BDReG9wDHPyZUMppMc3TB++RSsZXn
 cEwQ==
X-Gm-Message-State: ACrzQf3LmonN6jAxSAo0SedbrTEn7x8ztyeaMjKTdFdyMVkVv5fUDWuG
 27WWfs4vr36T1jIH51ryq8r490agkPI=
X-Google-Smtp-Source: AMsMyM7bA79wHT+JVQEMxYu3eBX3dtjSoZWbpj3pGTqYNmfbMWiQwVgLFsKaLFk6FANYUgyI3srSSg==
X-Received: by 2002:a17:90b:394d:b0:203:d5a:d9c9 with SMTP id
 oe13-20020a17090b394d00b002030d5ad9c9mr21967908pjb.49.1663615394095; 
 Mon, 19 Sep 2022 12:23:14 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a17090a071000b00200b2894648sm7004448pjl.52.2022.09.19.12.23.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Sep 2022 12:23:13 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Xie Yongji <xieyongji@bytedance.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [RFC PATCH] libvduse: Do not truncate terminating NUL character with
 strncpy()
Date: Mon, 19 Sep 2022 21:23:06 +0200
Message-Id: <20220919192306.52729-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

GCC 8 added a -Wstringop-truncation warning:

  The -Wstringop-truncation warning added in GCC 8.0 via r254630 for
  bug 81117 is specifically intended to highlight likely unintended
  uses of the strncpy function that truncate the terminating NUL
  character from the source string.

Here the next line indeed unconditionally zeroes the last byte, so
we can call strncpy() on the buffer size less the last byte. This
fixes when using gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0:

  [42/666] Compiling C object subprojects/libvduse/libvduse.a.p/libvduse.c.o
  FAILED: subprojects/libvduse/libvduse.a.p/libvduse.c.o
  cc -m64 -mcx16 -Isubprojects/libvduse/libvduse.a.p -Isubprojects/libvduse -I../../subprojects/libvduse [...] -o subprojects/libvduse/libvduse.a.p/libvduse.c.o -c ../../subprojects/libvduse/libvduse.c
  In file included from /usr/include/string.h:495,
                   from ../../subprojects/libvduse/libvduse.c:24:
  In function ‘strncpy’,
      inlined from ‘vduse_dev_create’ at ../../subprojects/libvduse/libvduse.c:1312:5:
  /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: ‘__builtin_strncpy’ specified bound 256 equals destination size [-Werror=stringop-truncation]
    106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors
  ninja: build stopped: cannot make progress due to previous errors.

Fixes: d9cf16c0be ("libvduse: Replace strcpy() with strncpy()")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Xie Yongji <xieyongji@bytedance.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>

RFC: Any better idea? We can't use strpadcpy() because libvduse
doesn't depend on QEMU.
---
 subprojects/libvduse/libvduse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index 1a5981445c..e460780ce3 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -1309,7 +1309,7 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
         goto err_dev;
     }
 
-    strncpy(dev_config->name, name, VDUSE_NAME_MAX);
+    strncpy(dev_config->name, name, VDUSE_NAME_MAX - 1);
     dev_config->name[VDUSE_NAME_MAX - 1] = '\0';
     dev_config->device_id = device_id;
     dev_config->vendor_id = vendor_id;
-- 
2.37.3


