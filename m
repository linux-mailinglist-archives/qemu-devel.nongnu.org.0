Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA02598B13
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 20:27:26 +0200 (CEST)
Received: from localhost ([::1]:38432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOkEn-000207-6Q
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 14:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yokada.996@gmail.com>)
 id 1oOjfV-0000Y6-Oe
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 13:50:59 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:34531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yokada.996@gmail.com>)
 id 1oOjfT-0002Pr-KU
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 13:50:56 -0400
Received: by mail-qv1-xf29.google.com with SMTP id b2so1726195qvp.1
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 10:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ctjmxHdPwX5iUNLoJVLQAANZs3CSbjHElVZ5F8RwdPg=;
 b=gBx5y3d6QEb8vY141d3Id67dhp4Qvuc4Rqobm9DLjzA35wcCMGtxfg72+mCXizsTWc
 nf6ZJC7WVr1rr+M6ZSYMT8iii2g63U5KmM8bHSC7bMe3f1uumplfRSIU6nITlSlH7jy2
 Z7zK/ZMBetsETx8G65XWlzCFkviRjwhNKVgyEstCRNYAQ4eqb5qWM3XLqZfjnf4CY6Hu
 cl6EaLi8gHq+Gv9GoXRWyaBO2xefFUByVq0qMvMbKsHVOuI8OnUqAXS0uYCMtJXlcvVM
 MoLwWeVhYNm6XjlcrByyavEDcD2fp2JV3XzFn2F1SgHEdSQMzHn2DcWH+0Ra2dT2hXMs
 zYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ctjmxHdPwX5iUNLoJVLQAANZs3CSbjHElVZ5F8RwdPg=;
 b=HMDWH8SUVwyOE42lgNe409RTPhH89vx/SQpV1icjmP2NOT4WItVOYVRZdbQxrhBtPH
 8nDzBvg8aZ/1ohAFMfFudHvc6OPbaaKo6T1HZqH+V60Pjswk9US8dS/1U3BobDX3pRno
 1paadUwLCy4lRHvmoi45MmDQ7+fbtoml2albMGEKc+t11CZGkLrdOjZDEmm03I4fttA/
 SMcelFVjhxZw8ZPYCo3tQMEAnPP0b1/dvMdZbvZ7qpxjW+PmxdXzZW4qbuTPzOdeno+y
 5TfDNS7AnMSUtFEcRXbfS3tDPfqeCk+IPRKI2IQmQHvAHiCufT6KPEatAbYzygdScBPv
 4KjA==
X-Gm-Message-State: ACgBeo1Lvidfa/sejjO5R2cF0KzGJLXrKhdmOSMA4AZVGohXiPdTJm7M
 c/mbNt/zlBuA2Wnx+dZm9moSVtqIodo=
X-Google-Smtp-Source: AA6agR4nxMRRqUAx3E/+YPFhG6QAa0qb7tza2qbd6SgPoM37XJxfwj8JyqqWMTteTM8HuqQdEDspIQ==
X-Received: by 2002:a05:6214:411e:b0:476:858d:b2c3 with SMTP id
 kc30-20020a056214411e00b00476858db2c3mr3739778qvb.22.1660845053304; 
 Thu, 18 Aug 2022 10:50:53 -0700 (PDT)
Received: from pq7-0.2a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206]) by smtp.gmail.com with ESMTPSA id
 l8-20020a05620a28c800b006b928ba8989sm2016550qkp.23.2022.08.18.10.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 10:50:52 -0700 (PDT)
From: Yusuke Okada <yokada.996@gmail.com>
X-Google-Original-From: Yusuke Okada <okada.yusuke@jp.fujitsu.com>
To: qemu-devel@nongnu.org
Cc: Yusuke Okada <okada.yusuke@jp.fujitsu.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 virtio-fs@redhat.com (open list:virtiofs)
Subject: [PATCH] virtiofsd: use g_date_time_get_microsecond to get subsecond
Date: Thu, 18 Aug 2022 13:46:51 -0400
Message-Id: <20220818174650.31360-1-okada.yusuke@jp.fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=yokada.996@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 18 Aug 2022 14:25:18 -0400
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


