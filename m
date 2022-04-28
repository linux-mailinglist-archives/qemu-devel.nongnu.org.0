Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C696A5127F6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 02:17:16 +0200 (CEST)
Received: from localhost ([::1]:53708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njrqN-00030E-P0
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 20:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1njroj-00029B-OE
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 20:15:34 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1njroe-0000mG-JK
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 20:15:30 -0400
Received: by mail-pg1-x534.google.com with SMTP id z21so2670054pgj.1
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 17:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5k+5iVwhWKZFB2CkTNwEaEB+W5leYsyoVLVhgSdZwms=;
 b=0xGCyu6itwb5qVQCcyFhG2CgUv3yYex4HBUboMcglCKQNL++tWhWzLy+fqzx3b5Dek
 q+ZAUfmqlC3WMnsFmd8jRFbxowpIBk8qbu835jrzOhQFjaMDNdOYncJJO5yPasGn4QnH
 /5X4eLYTVjZa9fttULkVVEMvu4WfxlBLZHNY+2pc4L4nFtigNY34FINoWBMswtW0Omnp
 Dh0WhIu6rU6JblEMasc6jv87PRmgxASHKgDhtOtaUqtnmNlkqkahiobWmpHxrg6qD4/5
 ABkbNZaj1udfJpsZDvJ9ouIpvpvRKZBmVIr1dCyi146ip8o+gki80+MRR4Vwj3EA3dzg
 E8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5k+5iVwhWKZFB2CkTNwEaEB+W5leYsyoVLVhgSdZwms=;
 b=p9zAnSXYCZ245IM+kfnXzZhDlW50TiGnEsnWGMi4MMVK/3uqamcNYK2kwxN8esSf8C
 o6mFID9NalEGoZ1T2ZehpmjhTOoXUWHLXHejQJiHydtYf1NVBI4sKYyDHUplcrhu32E8
 PcB2LyhNoYCMnCmBq6N78sLZH+6lIHenenlN3HyEce+dwIvzYsmRjqGh58O9R43NxuEa
 d3xS/46d+U+cdBdllaN73h4P/TKBZRg7XvBa3BcSv6Xxuyn6oqlkEF8s/2VuPZCCOSWu
 T0yufPChY8QMDQDjXBzczW4m52zKpSt2DsDeFkpCz0UT2MBy1l0O2WFJKrlAXRj23A2o
 Qr6Q==
X-Gm-Message-State: AOAM532hVT4QTz4ZmjzoWIdlwEfCY0JkEZdegsCwY9wbnYijxYxmQEzO
 DIKOXBGqy7dz36pvYlFkulZkzQ==
X-Google-Smtp-Source: ABdhPJw9pgWStqHIH83XwPoXjzCOSPh4r9oVGvAs8q9yg+b8s9U4xqwSf08ZV4bDY3J+uMmLwLJe8Q==
X-Received: by 2002:a05:6a00:10d0:b0:4f7:5af4:47b6 with SMTP id
 d16-20020a056a0010d000b004f75af447b6mr32107689pfu.6.1651104926225; 
 Wed, 27 Apr 2022 17:15:26 -0700 (PDT)
Received: from FVFDK26JP3YV.usts.net ([139.177.225.230])
 by smtp.gmail.com with ESMTPSA id
 c136-20020a63358e000000b003c14af5063bsm472721pga.83.2022.04.27.17.15.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Apr 2022 17:15:25 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: marcandre.lureau@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH] error-report: fix crash when compute iso8061 time
Date: Thu, 28 Apr 2022 08:14:50 +0800
Message-Id: <20220428001450.13997-1-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Lei He <helei.sig11@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

g_get_real_time() returns the number of MICROSECONDS since
January 1, 1970 UTC, but g_date_time_new_from_unix_utc() expects
a timestamp in SECONDS.

Directly call g_data_time_new_from_unix_utc(g_get_real_time()) causes
overflow and a NULL pointer is returned, then qemu crashes.

Use g_date_time_new_now_utc() instead, and add a check for NULL result.

Signed-off-by: Lei He <helei.sig11@bytedance.com>
---
 util/error-report.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/util/error-report.c b/util/error-report.c
index dbadaf206d..d3c150661d 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -173,10 +173,13 @@ static char *
 real_time_iso8601(void)
 {
 #if GLIB_CHECK_VERSION(2,62,0)
-    g_autoptr(GDateTime) dt = g_date_time_new_from_unix_utc(g_get_real_time());
+    g_autoptr(GDateTime) dt = g_date_time_new_now_utc();
     /* ignore deprecation warning, since GLIB_VERSION_MAX_ALLOWED is 2.56 */
 #pragma GCC diagnostic push
 #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
+    if (!dt) {
+        return NULL;
+    }
     return g_date_time_format_iso8601(dt);
 #pragma GCC diagnostic pop
 #else
@@ -199,8 +202,10 @@ static void vreport(report_type type, const char *fmt, va_list ap)
 
     if (message_with_timestamp && !monitor_cur()) {
         timestr = real_time_iso8601();
-        error_printf("%s ", timestr);
-        g_free(timestr);
+        if (timestr) {
+            error_printf("%s ", timestr);
+            g_free(timestr);
+        }
     }
 
     /* Only prepend guest name if -msg guest-name and -name guest=... are set */
-- 
2.11.0


