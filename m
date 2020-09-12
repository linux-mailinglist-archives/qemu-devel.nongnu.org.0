Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EA3267CB6
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Sep 2020 00:50:41 +0200 (CEST)
Received: from localhost ([::1]:50326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHELw-0004D8-1N
	for lists+qemu-devel@lfdr.de; Sat, 12 Sep 2020 18:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kHEHg-0004ED-6s; Sat, 12 Sep 2020 18:46:16 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:46591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kHEHe-0004Uw-GN; Sat, 12 Sep 2020 18:46:15 -0400
Received: by mail-pl1-x643.google.com with SMTP id d16so2643582pll.13;
 Sat, 12 Sep 2020 15:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eTowCOmFGkug/aztHy6I04JZoGONhdCbvgRzQeqIV9w=;
 b=WOahd/LsIS1V37NqDXOQSi6ZEe8xfUdawSmAfG1lTSfXJSJEt1EnMq0C8vvd/3cI2l
 8ItiyrdGKZOP+lfuC8JoGvjh4kgJuXjw03AOzlwTgxx40zPAZjH56ewyUiQb+I9i+/Lf
 WCnH+bs88QrjvI5lXPVbFYEVeQQb5a7QbsRHdHVMkfiP+T8McwrwNCwdjgqV1cW6WuJp
 BWxl5L7LfxiLkYCMldKM5yDmYXM4r0upzdKUewrM/fdp/FUhAMx7jBvUWrWgOuoE/8Wh
 Y09F3LvgmJNHWqBq8qj7MRQCXlxc8J8sZwZf5r1aGPKnPx0jzTMNQikIb0+gri2TDP+2
 KUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eTowCOmFGkug/aztHy6I04JZoGONhdCbvgRzQeqIV9w=;
 b=fSqDn7OcTaNios1JQ7LYzBGZf9rq204UxVJVj4yewf2puOIrnnC7mZXo+wTBTWH3Tm
 3jxr4hKh7f6r19FpakQTgndQhagXs9mlCwz1XHn98Sp7lVcxlrokL28TsOL7ym6i9RFv
 gYR/kKkXWLYnoRGzaJsww7i65Fjkf/f7VLjYq0G/h5OmLvs0IEEH7RGwUpjCbQc780iu
 5TyWXecfzYMlK4TzVkxDiRHAEZpVfNsJ+TtlO1Ra36Be0OH8Ji3s6C+Tu6bjYiQ9Ui51
 wPh+5+I4vQlRonrgsnb5K8BaNsjA9zS7qVumYv0EWzV1SPBNrMe+1acc9qGasZQDgwn4
 qD7Q==
X-Gm-Message-State: AOAM531TjSjatzx3h0VVo6iA8xK7xzBVUS018TZ+sROLTyMjA5550z94
 fQM/D0G1GxxT0JyAQjv12Dnb0FdK6PlqKZ9PiUo=
X-Google-Smtp-Source: ABdhPJxKh+kSvkkJUwX2zSNjgzSNND4GdM1g9LF6evnDYSGmP1ccPE/3byYV/gsLt6Fu+78A79IEcQ==
X-Received: by 2002:a17:902:9a8e:: with SMTP id
 w14mr7973020plp.6.1599950772381; 
 Sat, 12 Sep 2020 15:46:12 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id t10sm4639266pgp.15.2020.09.12.15.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 15:46:11 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 19/27] tests: fixes aio-win32 about aio_remove_fd_handler,
 get it consistence with aio-posix.c
Date: Sun, 13 Sep 2020 06:44:23 +0800
Message-Id: <20200912224431.1428-20-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200912224431.1428-1-luoyonggang@gmail.com>
References: <20200912224431.1428-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x643.google.com
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


