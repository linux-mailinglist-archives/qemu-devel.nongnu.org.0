Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F543598C0B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 20:53:20 +0200 (CEST)
Received: from localhost ([::1]:48196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOkdr-0007hn-Bv
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 14:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yokada.996@gmail.com>)
 id 1oOkXQ-0002DO-Ri
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 14:46:40 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yokada.996@gmail.com>)
 id 1oOkXO-00078A-Iu
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 14:46:40 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 24so1950931pgr.7
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 11:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=34YSupzvFPGf54q4I719p5ZvNSdYXQRbFLGKQamgoTQ=;
 b=pa9XOzatRzKWuheXDs22T3192JnXjcENdherXX87rgYqIUc+q3zmSW0wf2n40ifpxP
 Kfd5PC4OmcdpnOgwixESMkchmgONHpGlvJ+PVdXZyv/JRyhltKZYVqa5ULKt11y1WCu2
 duXiLQTEZcfu24zFU8hiCO+MrOgCFNKA2ju5scdmcakY+nK/o0Q9rj5hYfrO5CZCqsfc
 AE6tLhsDVjcP5ftTHjqbDcGDi/qtEzu6459LFQKAmdhIVoZMMZo/p+XUJhRlq4Zm8bFR
 fljomqu9UTDcuHJsLLHINDTP5ykXIDrqa/SrBD364+DsTaWV1T1233mKf8qq3EdwVZ+D
 JSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=34YSupzvFPGf54q4I719p5ZvNSdYXQRbFLGKQamgoTQ=;
 b=ew+h29ongHUQFYhDcZNkptIbk95kndp//MGIu5wuexV+vFByYfgCgEW9Zr2125X3E7
 VUwtwcUD+G36sl6ehnhbAL5g6hlWBE2sVsMMZvJr7ijwTeAXGyr8LSaCl2yAda48lw0t
 NGnFfmfnRetWO8HjCtBlUnd9aQu814PK/1kj2ECpwjyP0PUdBG/JUWCNk4o8bdEqjO9Y
 oMJy+EmpgDAoxbBQ58vbVwEyj3fbXNjhU+LYrHZlJaLROM8RIQElHbZobX40gJm2qdqE
 GXHO9cXgmMkEgxRQj6NHCvHq7Z3GRRc9+mJCA9zCu9aKmXhVGlpijlZJBHx00CogNs9f
 ETJw==
X-Gm-Message-State: ACgBeo1cRcnrkwrdCO80RO4HW/KTCLM1M9xvb37KRx/HSiLsXUbij6QQ
 YhSGOUbSDC7W5MKiWVXUcZV4UwM/dX8=
X-Google-Smtp-Source: AA6agR5XcmVsjVszz4PPrRO+oFy9sZOed4efbHEK1DHRHeW3/pUsOha9os/Jdu5Z/30fArZYLUm9Sg==
X-Received: by 2002:a63:2a90:0:b0:41d:95d7:9851 with SMTP id
 q138-20020a632a90000000b0041d95d79851mr3277084pgq.564.1660848396986; 
 Thu, 18 Aug 2022 11:46:36 -0700 (PDT)
Received: from pq7-0.2a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206]) by smtp.gmail.com with ESMTPSA id
 n5-20020a170903110500b00170d34cf7f3sm1702870plh.257.2022.08.18.11.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 11:46:36 -0700 (PDT)
From: Yusuke Okada <yokada.996@gmail.com>
To: qemu-devel@nongnu.org
Cc: Yusuke Okada <okada.yusuke@jp.fujitsu.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 virtio-fs@redhat.com (open list:virtiofs)
Subject: [PATCH] virtiofsd: use g_date_time_get_microsecond to get subsecond
Date: Thu, 18 Aug 2022 14:46:19 -0400
Message-Id: <20220818184618.2205172-1-yokada.996@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=yokada.996@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Yusuke Okada <okada.yusuke@jp.fujitsu.com>

The "%f" specifier in g_date_time_format() is only available in glib
2.65.2 or later. If combined with older glib, the function returns null
and the timestamp displayed as "(null)".

For backward compatibility, g_date_time_get_microsecond should be used
to retrieve subsecond.

In this patch the g_date_time_format() leaves subsecond field as "%06d"
and let next snprintf to format with g_date_time_get_microsecond.

Signed-off-by: Yusuke Okada <okada.yusuke@jp.fujitsu.com>
---
 tools/virtiofsd/passthrough_ll.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 371a7bead6..20f0f41f99 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -4185,6 +4185,7 @@ static void setup_nofile_rlimit(unsigned long rlimit_nofile)
 static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
 {
     g_autofree char *localfmt = NULL;
+    char buf[64];
 
     if (current_log_level < level) {
         return;
@@ -4197,9 +4198,11 @@ static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
                                        fmt);
         } else {
             g_autoptr(GDateTime) now = g_date_time_new_now_utc();
-            g_autofree char *nowstr = g_date_time_format(now, "%Y-%m-%d %H:%M:%S.%f%z");
+            g_autofree char *nowstr = g_date_time_format(now,
+                                       "%Y-%m-%d %H:%M:%S.%%06d%z");
+            snprintf(buf, 64, nowstr, g_date_time_get_microsecond(now));
             localfmt = g_strdup_printf("[%s] [ID: %08ld] %s",
-                                       nowstr, syscall(__NR_gettid), fmt);
+                                       buf, syscall(__NR_gettid), fmt);
         }
         fmt = localfmt;
     }
-- 
2.31.1


