Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841DE59F5E8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:08:58 +0200 (CEST)
Received: from localhost ([::1]:37550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmNd-0001Pm-Gi
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQm8m-00042N-I2; Wed, 24 Aug 2022 04:53:36 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQm8l-0002r4-1x; Wed, 24 Aug 2022 04:53:36 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 x14-20020a17090a8a8e00b001fb61a71d99so901761pjn.2; 
 Wed, 24 Aug 2022 01:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=QBPYSBPF6NBiYCPtnQ/kh4AlEMMWg66le7Owvecb66U=;
 b=CF40yehw2/xDHWSBy/3uPpvVn8qLYJ2tClk/XcBYV+iP+xkiyfNFYZYfh/tWoJmJDC
 4VnLnMjvbZfoF9RJo788z1gWyFe+kX3vwLBBnfeyyXAADT1FQUO3o2oCY0mB+b8gLu38
 x+nL1vr7jV62oNHjYuOEnSrvGug/leGd2eCG0VbLgDuPd76nfk+MoFFZkCRGFuXMp2Ps
 ajlJDi6CTfCONQrL2y9UYMMgSpXcmcdZmIl3Jo3rUQKFL+VqgCgw2oq9Fa//IPsDEjDQ
 uFNz9IMjhyA88QzAIUFzqAODB8A1Lts6Fl018YtXgntQfceQ5c1QyRZsESYuRT3urWK1
 gfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=QBPYSBPF6NBiYCPtnQ/kh4AlEMMWg66le7Owvecb66U=;
 b=cxoUhPuQok8z+8DvbPlAvLVEbye2rFNDapgwiQ/SkFR2oIOn1HuJWSiEyGnj1GHWDJ
 wsq2cOPrR+p2D5i6yYQFO1Zd+XFRDX0j+N1WK5aKtovj7GI8ZFp8PvRj0HxX2jjnXx6b
 Sw3KrT3J6O8jt/j2COBylqVdBrgm8xNQDWBKqZ3NdXKc0myfoJMEIopUziu3Ezg6Ykrk
 BPZD7xGmI/TaQTi8f3BDVu5JbNDCc1sz5XS/pdmBKQG1tHKS+Mc93Gzlxs+FiHyJi2Ka
 fHPli08JkKrgV7kr8D6S50A6eXVKlKD7GPwR32vT+ySnvRiKe5tbeRhk/hbISu+8Szsj
 t+AQ==
X-Gm-Message-State: ACgBeo3RsrutPdiZhrYs3Mzp0t94RaFKsX+AxoSFKGDgn8fdkKTcKfqE
 m3mV6+Vf5AjAZQ4Vbo0e0ZRZ2GzD+qk=
X-Google-Smtp-Source: AA6agR4zTeYTujkVk+CV0nte+FIFVDyGWPfVLGu1+ZAXWicHBzP+ocJKavhwJ2d4+9aqbYi0+TqEGw==
X-Received: by 2002:a17:903:110e:b0:171:3114:7112 with SMTP id
 n14-20020a170903110e00b0017131147112mr28600317plh.114.1661331212332; 
 Wed, 24 Aug 2022 01:53:32 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 qi3-20020a17090b274300b001f3162e4e55sm813800pjb.35.2022.08.24.01.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 01:53:32 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH v3 3/3] util/aio-win32: Correct the event array size in
 aio_poll()
Date: Wed, 24 Aug 2022 16:52:31 +0800
Message-Id: <20220824085231.1630804-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824085231.1630804-1-bmeng.cn@gmail.com>
References: <20220824085231.1630804-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

WaitForMultipleObjects() can only wait for MAXIMUM_WAIT_OBJECTS
object handles. Correct the event array size in aio_poll() and
add a assert() to ensure it does not cause out of bound access.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v2)

Changes in v2:
- change 'count' to unsigned

 util/aio-win32.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/util/aio-win32.c b/util/aio-win32.c
index 44003d645e..80cfe012ad 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -326,9 +326,9 @@ void aio_dispatch(AioContext *ctx)
 bool aio_poll(AioContext *ctx, bool blocking)
 {
     AioHandler *node;
-    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
+    HANDLE events[MAXIMUM_WAIT_OBJECTS];
     bool progress, have_select_revents, first;
-    int count;
+    unsigned count;
     int timeout;
 
     /*
@@ -369,6 +369,7 @@ bool aio_poll(AioContext *ctx, bool blocking)
     QLIST_FOREACH_RCU(node, &ctx->aio_handlers, node) {
         if (!node->deleted && node->io_notify
             && aio_node_check(ctx, node->is_external)) {
+            assert(count < MAXIMUM_WAIT_OBJECTS);
             events[count++] = event_notifier_get_handle(node->e);
         }
     }
-- 
2.34.1


