Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E479626A58C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 14:49:59 +0200 (CEST)
Received: from localhost ([::1]:32770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIAPH-0002a1-0M
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 08:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kI9rT-0001ax-DO; Tue, 15 Sep 2020 08:15:03 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:52975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kI9rQ-0008Jf-Vs; Tue, 15 Sep 2020 08:15:03 -0400
Received: by mail-pj1-x1044.google.com with SMTP id o16so1678473pjr.2;
 Tue, 15 Sep 2020 05:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eTowCOmFGkug/aztHy6I04JZoGONhdCbvgRzQeqIV9w=;
 b=ORmkE7SrCuBO9Q89TIq+fj8LqIPGV4DJeFGxt1mcn8bhDlBzzDXZavsNkFhajh88nq
 nNoZz9H//Ka6v6LLKYghz6rL7577lbUOmIuijE78YKv4RB7hkFulF3SY9GMx20hRjOp/
 caruDFKKbYGVfC6amTu/MUtIrylj38REwYYBehxCdGUnA/gATnAZN2gVEFMGfNtu1jYr
 f45JBNMZ343uehdIBk9GoX/ADSnN2ElLyDnLZZ3iYaYB6nGW0xq9lGnVZXmidOQp3qpH
 9EbTXH3069fvrbfalKNVLjjBVLwu+qx5fkji4xx95hPBZ9c+Y8iax8sOzxLoaxgRVDTf
 DLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eTowCOmFGkug/aztHy6I04JZoGONhdCbvgRzQeqIV9w=;
 b=PAQY7MlsW4FMWkFb7LhX7DoFtvDMd/D3Mpzb/Lq053rzU9ggIXrFVmDsk0dGQ13PRs
 /Z4/vDcFy/zrmz9h+by8c/vLygsoFWKr9kaCJ9vviNOZabEf21tLA7qMwQX8D6XpK/Rl
 MxZyiZ2A/VqIDTtKYGiCcZv1rNbIDgyfXf7Q6mrkhEauKmrPlpFPUHTP8zsXdAIEtF6E
 Oji8B3mFTz9Cg7s7FZAc6NpLWlu8bIZLoFWFaYYtDEwY0JsplubfRd3ubQ+XH1AWjUZc
 HCE+zogs7+0XNtYfHu0+xUX7YxCJVkdJ9q2lNKKJ/RWN3bbbYYOv75Z3ynj4d2vwiAvP
 mP5w==
X-Gm-Message-State: AOAM5300BpHP9YcjSJe5r8TpUDEUCkHZwrcJOlydpWb7CTjuRFfJyyQT
 MCHHttqbZWvaGe5iiaDXKxpWQCyQwHpnTGQpksY=
X-Google-Smtp-Source: ABdhPJzylrtBYOP6HBMQovno7GbcyIMj8u67KpmTHdz5HJEDbnl+iAVX+tB8EtT8Rt6xFD01j9pTjQ==
X-Received: by 2002:a17:902:cf8f:b029:d0:90a3:24e9 with SMTP id
 l15-20020a170902cf8fb02900d090a324e9mr18444947ply.8.1600172098889; 
 Tue, 15 Sep 2020 05:14:58 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 k28sm13683061pfh.196.2020.09.15.05.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 05:14:58 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 18/26] tests: fixes aio-win32 about aio_remove_fd_handler,
 get it consistence with aio-posix.c
Date: Tue, 15 Sep 2020 20:13:10 +0800
Message-Id: <20200915121318.247-19-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200915121318.247-1-luoyonggang@gmail.com>
References: <20200915121318.247-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
 Peter Lieven <pl@kamp.de>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a fixes for
(C:\work\xemu\qemu\build\tests\test-aio-multithread.exe:19100): GLib-CRITICAL **: 23:03:24.965: g_source_remove_poll: assertion '!SOURCE_DESTROYED (source)' failed
ERROR test-aio-multithread - Bail out! GLib-FATAL-CRITICAL: g_source_remove_poll: assertion '!SOURCE_DESTROYED (source)' failed

(C:\work\xemu\qemu\build\tests\test-bdrv-drain.exe:21036): GLib-CRITICAL **: 23:03:29.861: g_source_remove_poll: assertion '!SOURCE_DESTROYED (source)' failed
ERROR test-bdrv-drain - Bail out! GLib-FATAL-CRITICAL: g_source_remove_poll: assertion '!SOURCE_DESTROYED (source)' failed

And the idea comes from https://patchwork.kernel.org/patch/9975239/

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 util/aio-win32.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/util/aio-win32.c b/util/aio-win32.c
index 953c56ab48..9899546a8a 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -37,6 +37,15 @@ struct AioHandler {
 
 static void aio_remove_fd_handler(AioContext *ctx, AioHandler *node)
 {
+    /* If the GSource is in the process of being destroyed then
+     * g_source_remove_poll() causes an assertion failure.  Skip
+     * removal in that case, because glib cleans up its state during
+     * destruction anyway.
+     */
+    if (!g_source_is_destroyed(&ctx->source)) {
+        g_source_remove_poll(&ctx->source, &node->pfd);
+    }
+
     /* If aio_poll is in progress, just mark the node as deleted */
     if (qemu_lockcnt_count(&ctx->list_lock)) {
         node->deleted = 1;
@@ -139,8 +148,6 @@ void aio_set_event_notifier(AioContext *ctx,
     /* Are we deleting the fd handler? */
     if (!io_notify) {
         if (node) {
-            g_source_remove_poll(&ctx->source, &node->pfd);
-
             aio_remove_fd_handler(ctx, node);
         }
     } else {
-- 
2.28.0.windows.1


