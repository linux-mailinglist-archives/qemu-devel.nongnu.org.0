Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4B8506459
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:22:42 +0200 (CEST)
Received: from localhost ([::1]:41086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghG4-00035W-DC
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggls-00019J-VN
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:29 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglr-0004Pd-0H
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:28 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x18so13071015wrc.0
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wKAqJ3g+AyG1lYS8lbxSbCBSzbr7Sx+wsfehcGPklv8=;
 b=Il4FXmGi/tvgRUVljDn8+MaJmqC01hxUTyss7ebuNOHkK7TD/W8RgdW1bZke+1X2Xw
 NJlzmKNs/WKbt3A5GDjM0Ye9fV6gduguOhUdIvbRy3tTyYVqMElU3+BkhubhPRNjRDhC
 zuS2yZCRN+RwoWbFZyw1Fdi0wR2TM7uuYw/lZ79eWUmyL/vV0mSSoUKHNXQSe843do5z
 hx7cm3Af1y0FnJe7Fp/vRLADRgY9COyneHU/YCciUlJMXZxTHE+OtjzSPDo4SATcBLrG
 UMy38hdsXSBrqv7xZa5EhaO4sI2nnTGTwlpzfNdHNclXTMqfBc1TKNOR63IkcNWsu4cv
 nauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wKAqJ3g+AyG1lYS8lbxSbCBSzbr7Sx+wsfehcGPklv8=;
 b=XBHl5kXfoQ4VGwVaoFiRH/rxX5W9zaqAUpBq/dbuwyLYbfdSNNDeZTUmOh880f/BFU
 qgGqb4+iPIxXoGLa5O1oM7k7KZKPTRzKZwjaidjsLGEAh/5rGsDIEOiXTVM079ChxcbS
 goPpCT7Vtox0oc6XAjlUGXETSkJjaoKEqYu+QKaDZWPQgu1qCAKCvWtrklh781N4N2o3
 b30cEwT7RxZxV2KNFZZfHHL6RJzvG35A+4Q0j5WOTfWgnAcWoo4jd1C9MKeF1VLZOJCw
 m5vTZRcoTkJStYUnhErEFjC2TlIB6r/1/DC3CQnXfwM36sAtLSqxE2nxdSEUgTdAytYB
 M0bg==
X-Gm-Message-State: AOAM531eFu+TNpJQXY6tYx+tDag/0AvXLZ/85lal5IKxRMvMw2/WNq9l
 J0i5QqtNaYgOuzW2lW6RCHVthXNoZ+vTsA==
X-Google-Smtp-Source: ABdhPJwg/bAAVbAISt4Qg18Edot/k0NGw9sqqlm1NaOd1/lbSlTOLq8Qy5fVTxL7bccTeaYCWdqAOA==
X-Received: by 2002:a05:6000:2cb:b0:20a:88c4:ec9f with SMTP id
 o11-20020a05600002cb00b0020a88c4ec9fmr9490743wry.43.1650347484430; 
 Mon, 18 Apr 2022 22:51:24 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/53] qga: replace deprecated g_get_current_time()
Date: Tue, 19 Apr 2022 07:50:33 +0200
Message-Id: <20220419055109.142788-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

According to GLib API:
g_get_current_time has been deprecated since version 2.62 and should not
be used in newly-written code. GTimeVal is not year-2038-safe. Use
g_get_real_time() instead.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-13-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/qga/main.c b/qga/main.c
index b9dd19918e..1deb0ee2fb 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -314,7 +314,6 @@ static void ga_log(const gchar *domain, GLogLevelFlags level,
                    const gchar *msg, gpointer opaque)
 {
     GAState *s = opaque;
-    GTimeVal time;
     const char *level_str = ga_log_level_str(level);
 
     if (!ga_logging_enabled(s)) {
@@ -329,9 +328,11 @@ static void ga_log(const gchar *domain, GLogLevelFlags level,
 #else
     if (level & s->log_level) {
 #endif
-        g_get_current_time(&time);
+        gint64 t = g_get_real_time();
         fprintf(s->log_file,
-                "%lu.%lu: %s: %s\n", time.tv_sec, time.tv_usec, level_str, msg);
+                "%" G_GINT64_FORMAT ".%" G_GINT64_FORMAT
+                ": %s: %s\n", t / G_USEC_PER_SEC, t % G_USEC_PER_SEC,
+                level_str, msg);
         fflush(s->log_file);
     }
 }
-- 
2.35.1



