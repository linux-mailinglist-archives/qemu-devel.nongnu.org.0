Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 476444E1D23
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:30:04 +0100 (CET)
Received: from localhost ([::1]:35638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzNT-0000hS-Bo
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:30:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5y-0008W9-GP
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:58 -0400
Received: from [2607:f8b0:4864:20::430] (port=39599
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5w-0003Tb-0w
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:57 -0400
Received: by mail-pf1-x430.google.com with SMTP id u22so2278328pfg.6
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L87S22rf4qAItkg1Hc+56nj9SIVR24PlTDFBvPEqmNI=;
 b=cAnFwt6LggNoa2zywcdOwNBqDtulXjZKfZTs9BJ8XqTB+P6kNy0OUdF6H2nXDIFWG+
 gN3+HdTslg7rpcRUypYlleh9fTu4i0uETstdD4uB7wFUKjY3iY3C9G8KFROS0zzUD6Ey
 wV9yuLpk3yYi6WcOHKzMJfrJe6Tox5dEAbbDypNXeet3ZyS37SRpYi22uCPEYdolE7Tr
 tkXe8kxbnQZ3ZBAY2n4G+am1fcJ1Aalhrw4StCARoKSdf4Oth4ElfsyXOvDghMxPxju3
 niw/EEZCpWBku6yDWNXFmGKezHF8ILFxpayZDFV732ewHKLZO+rDSl9+myXFNAA5Am18
 8Ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L87S22rf4qAItkg1Hc+56nj9SIVR24PlTDFBvPEqmNI=;
 b=ug9S6HLHLcJdikyWdG2DyKx4pCb0PHGT5a3WrDIQk1Ex3CzuVkz61/a57KxRXLRulW
 +1kdkAFQJEkbFqtn7wZ6JYOXW2BbPrd8BaP2IJyx+glbniCuHcCcQ/wrKyLnnpaNmSsx
 d4fOO/U4v4LZT/PIgXVXG+SW9sw2WWhg9zp833N9hQ7qT0GN8MbMP5hOydJp6onCqYOh
 1Dh88r1yI3gNS4/gWswYGp/dEN6Q+GSPij+YJELBx0L6Zo+qlE76JWGOUPS5VMl1C8fv
 d8/Cxk2JsbJ04gVF0CcUqo3nvRlfeQ9QGE0yE2ixeSuyQQy67w65cYzswsV5r1B5LvEx
 uUwQ==
X-Gm-Message-State: AOAM530zV0sXfZbQKeZzYHoWB7bmh14Cl4XVJYVChswSrJKhkl91nQds
 grXBa0QytjxCXv3LXA2RuE5MdXCWBZTJ7w==
X-Google-Smtp-Source: ABdhPJwO/rDvwYJlOYFDRNuPlDmkeKEbFd0y/aG//KjUwwUqNDbl2/dbZ+/3rJXTGId6toNewVFtng==
X-Received: by 2002:a05:6a00:198c:b0:4f7:7e0f:bfc2 with SMTP id
 d12-20020a056a00198c00b004f77e0fbfc2mr19519700pfl.44.1647796314800; 
 Sun, 20 Mar 2022 10:11:54 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 20/36] tests/unit: Do not reference QemuLogFile directly
Date: Sun, 20 Mar 2022 10:11:19 -0700
Message-Id: <20220320171135.2704502-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use qemu_log_lock/unlock instead of the raw rcu_read.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/unit/test-logging.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/tests/unit/test-logging.c b/tests/unit/test-logging.c
index 93c6d666e8..fc22bf40b4 100644
--- a/tests/unit/test-logging.c
+++ b/tests/unit/test-logging.c
@@ -110,12 +110,10 @@ static void test_parse_path(gconstpointer data)
 
 static void test_logfile_write(gconstpointer data)
 {
-    QemuLogFile *logfile;
-    QemuLogFile *logfile2;
+    FILE *logfile0, *logfile1;
     gchar const *dir = data;
-    g_autofree gchar *file_path = NULL;
+    g_autofree gchar *file_path0 = NULL;
     g_autofree gchar *file_path1 = NULL;
-    FILE *orig_fd;
 
     /*
      * Before starting test, set log flags, to ensure the file gets
@@ -124,29 +122,28 @@ static void test_logfile_write(gconstpointer data)
      * this is needed.
      */
     qemu_set_log(CPU_LOG_TB_OUT_ASM, &error_abort);
-    file_path = g_build_filename(dir, "qemu_test_log_write0.log", NULL);
+    file_path0 = g_build_filename(dir, "qemu_test_log_write0.log", NULL);
     file_path1 = g_build_filename(dir, "qemu_test_log_write1.log", NULL);
 
     /*
      * Test that even if an open file handle is changed,
      * our handle remains valid due to RCU.
      */
-    qemu_set_log_filename(file_path, &error_abort);
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
-    orig_fd = logfile->fd;
-    g_assert(logfile && logfile->fd);
-    fprintf(logfile->fd, "%s 1st write to file\n", __func__);
-    fflush(logfile->fd);
+    qemu_set_log_filename(file_path0, &error_abort);
+    logfile0 = qemu_log_lock();
+    g_assert(logfile0);
+    fprintf(logfile0, "%s 1st write to file\n", __func__);
+    fflush(logfile0);
 
     /* Change the logfile and ensure that the handle is still valid. */
     qemu_set_log_filename(file_path1, &error_abort);
-    logfile2 = qatomic_rcu_read(&qemu_logfile);
-    g_assert(logfile->fd == orig_fd);
-    g_assert(logfile2->fd != logfile->fd);
-    fprintf(logfile->fd, "%s 2nd write to file\n", __func__);
-    fflush(logfile->fd);
-    rcu_read_unlock();
+    logfile1 = qemu_log_lock();
+    g_assert(logfile1);
+    g_assert(logfile0 != logfile1);
+    fprintf(logfile0, "%s 2nd write to file\n", __func__);
+    fflush(logfile0);
+    qemu_log_unlock(logfile0);
+    qemu_log_unlock(logfile1);
 }
 
 static void test_logfile_lock(gconstpointer data)
-- 
2.25.1


