Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B466040E9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 12:28:42 +0200 (CEST)
Received: from localhost ([::1]:51118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol6JS-00050y-JW
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 06:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ol6Bh-0005EV-L3; Wed, 19 Oct 2022 06:20:37 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:45850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ol6Bd-0001jk-O3; Wed, 19 Oct 2022 06:20:37 -0400
Received: by mail-pf1-x436.google.com with SMTP id 67so16770376pfz.12;
 Wed, 19 Oct 2022 03:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tSFcI5M+TIgAqd7Z7uglAUolB/9gROW5YVIR0p9viyw=;
 b=NwSKciWocVnLOyVxWlmRi1Wwl02SVapb9K8UGk34K+KOrJ9VSNuLFImS+r2TJqdMV6
 OodisCB9NfOAY1Kg9BRXgu/6ulOV1cI9OFJUn3BpEwH4qfKoHNwhKFSSofexvF5/V1Fv
 SX08eauXKzryXaSDNxc8nCBZ3i+SbfLMEmdKeWlXqyezBT501D8JZUkjfZXne/+dN6uO
 N6or860I29l3df/TRckDElSAS12uBxi/Ok1aOJIaKUioF5YuhV019422yEOn4B7iN5qq
 rNT0vsRz9aiAs5zPBATJoKKuUxBF1s2dQVBfP/17EAfUTAoWuRM5LMCe4eIDVmkD6p3k
 SBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tSFcI5M+TIgAqd7Z7uglAUolB/9gROW5YVIR0p9viyw=;
 b=vutcbZ+yBDeaekokXBk9xP3/DOhgiI/MG8m98L4aH8PwIhU8C3gn6xRWJxRLlm/CFn
 Ne0zjizLC2SXzyTCXFRTcNZQMZkvACZexBNpvgmK9QMEjdUoLb1Jl3lW1lTuGw5adjcA
 JVHaCuBxre85HsTi+bdO1Ukn9S7Jg3+L2bBWK85KmeAvFVAn/17prNbLAziPw9ugWL0f
 ARVES2b6KCjpylmrQNod3dyvV9lJWNuxDMlWuPMgi5NOg3lotuc4vmRMwvXZHxqEBo9s
 2f+6keba6azkDbq8J7bCtPtxEzpSGW1HYIbRdH3t/Q0Z3PF8XrTaAWIl1WmjKt7c0KYt
 hNPA==
X-Gm-Message-State: ACrzQf2WXHcez7nWN1RjuutY65W2229fOdtojXO6qw0yUq91jYC0OrHO
 dcZNN9toN3FHij+2mKD4vOGcFGB4KVh/aw==
X-Google-Smtp-Source: AMsMyM6L6meIzxEXpf42LdYGSfaxLZ+Oqvwi/89VGX42oqnV50GJbS8aDphjaOMIqkCV1VCdRXVnFA==
X-Received: by 2002:a63:5946:0:b0:461:e1b9:c5a5 with SMTP id
 j6-20020a635946000000b00461e1b9c5a5mr6673171pgm.56.1666174831235; 
 Wed, 19 Oct 2022 03:20:31 -0700 (PDT)
Received: from ubuntu.. ([65.20.73.185]) by smtp.gmail.com with ESMTPSA id
 u18-20020a170902e5d200b0017f9db0236asm10543879plf.82.2022.10.19.03.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 03:20:30 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH v4 3/3] util/aio-win32: Correct the event array size in
 aio_poll()
Date: Wed, 19 Oct 2022 18:20:15 +0800
Message-Id: <20221019102015.2441622-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019102015.2441622-1-bmeng.cn@gmail.com>
References: <20221019102015.2441622-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

WaitForMultipleObjects() can only wait for MAXIMUM_WAIT_OBJECTS
object handles. Correct the event array size in aio_poll() and
add a assert() to ensure it does not cause out of bound access.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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


