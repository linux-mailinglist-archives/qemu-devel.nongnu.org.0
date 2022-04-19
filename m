Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E9F50645B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:22:50 +0200 (CEST)
Received: from localhost ([::1]:41430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghGD-0003JK-Nl
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglt-00019M-0z
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:34 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglr-0004Pq-25
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:28 -0400
Received: by mail-wr1-x432.google.com with SMTP id p18so20086252wru.5
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZukFrAOHSquEoKlieban8PRU7JBlDTXLluy9Ey5A1Jo=;
 b=dAyWLLdnaRDSrm+QHYjmEnk2sy4wrfV50Dch3OaNryiKFTH3ievGtSpiWhu77zA4hU
 Jyhrbhfe4yGhMU58jcDd0jUhdCmvHUbos97AjSgJxCvVLu2wsFPZrDnSY0CiHrLrvVJg
 eoZ9cFH0ZRti5uBcmPsfD9qATpJJxOE+k9Kf2vhYWbU8aRN54GjHBpEXVBqXhA7bf9R5
 +Hb7iFSruGMcaJXdEPu9iTpnWUHes/6AIe+MX2LccxW9j97bdNYv3kxHPjV6CET6PJ08
 fbNYffAT8wOCKg91BiX9Xujqg00knrzippt32tfkd+ki1QUp4LZmks1q99fKVQRkw2TJ
 /BSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZukFrAOHSquEoKlieban8PRU7JBlDTXLluy9Ey5A1Jo=;
 b=pBcvkD6pgwN1KY/l72fhILCRoASlGGtzc1sbak6YMP8Uv63ZxELla0d3C2wbYNhQCG
 aGIb8a3rQtHoCeCM7f6gOLm1lMWsXo2dhNx/SiqEnb2wbalfuK1SIwrkIFeVuJrylQCV
 Y0JKsA4XeNzxQD+rWJf6w3RdX64Vw1T75EUr7GV7Ii7dbXYpup/gm+UkKl6kxMyTijVa
 6JXHiXgLuaCnMzE6dmTF/biVYtFBqJ8QXWgX64TsM0U2jaKXb2zpudUHDGCeNRUq8HoL
 D3S74grmlpK4cxKRPZfVDdtAM9u2Ym0uk14tHq2jMEtrI68MQRkfOxhjE2MhGj7B/1ye
 XyTw==
X-Gm-Message-State: AOAM533cu5IBV4TuyiurXV85CTJUMtmZQO6nGICyzS/96yUVPM61cT2n
 FsYLYUgmqJoVaH4l9u73sdr5lGjI4WOhbQ==
X-Google-Smtp-Source: ABdhPJzgOwfl/CE1Q4YyfbMGSLCd3Cb72NwdaqQP8Qh0HWWpTEx5XcyS/bWz7SciGJOGAe5L5aqTgg==
X-Received: by 2002:a05:6000:1f15:b0:207:afd5:44ab with SMTP id
 bv21-20020a0560001f1500b00207afd544abmr10449241wrb.478.1650347485106; 
 Mon, 18 Apr 2022 22:51:25 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/53] error-report: replace deprecated g_get_current_time()
 with glib >= 2.62
Date: Tue, 19 Apr 2022 07:50:34 +0200
Message-Id: <20220419055109.142788-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
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
Message-Id: <20220323155743.1585078-14-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/glib-compat.h | 10 ++++++++++
 util/qemu-error.c     | 17 ++++++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/include/glib-compat.h b/include/glib-compat.h
index 3113a7d2af..dc14d3ec0d 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -145,6 +145,16 @@ qemu_g_test_slow(void)
 #define g_test_thorough() qemu_g_test_slow()
 #define g_test_quick() (!qemu_g_test_slow())
 
+#if GLIB_CHECK_VERSION(2,62,0)
+static inline gchar *
+g_date_time_format_iso8601_compat(GDateTime *datetime)
+{
+    return g_date_time_format_iso8601(datetime);
+}
+
+#define g_date_time_format_iso8601 g_date_time_format_iso8601_compat
+#endif
+
 #pragma GCC diagnostic pop
 
 #endif
diff --git a/util/qemu-error.c b/util/qemu-error.c
index 7769aee8e7..71ce3ee700 100644
--- a/util/qemu-error.c
+++ b/util/qemu-error.c
@@ -180,6 +180,19 @@ static void print_loc(void)
     }
 }
 
+static char *
+real_time_iso8601(void)
+{
+#if GLIB_CHECK_VERSION(2, 62, 0)
+    g_autoptr(GDateTime) dt = g_date_time_new_from_unix_utc(g_get_real_time());
+    return g_date_time_format_iso8601(dt);
+#else
+    GTimeVal tv;
+    g_get_current_time(&tv);
+    return g_time_val_to_iso8601(&tv);
+#endif
+}
+
 /*
  * Print a message to current monitor if we have one, else to stderr.
  * @report_type is the type of message: error, warning or informational.
@@ -189,12 +202,10 @@ static void print_loc(void)
  */
 static void vreport(report_type type, const char *fmt, va_list ap)
 {
-    GTimeVal tv;
     gchar *timestr;
 
     if (message_with_timestamp && !monitor_cur()) {
-        g_get_current_time(&tv);
-        timestr = g_time_val_to_iso8601(&tv);
+        timestr = real_time_iso8601();
         error_printf("%s ", timestr);
         g_free(timestr);
     }
-- 
2.35.1



