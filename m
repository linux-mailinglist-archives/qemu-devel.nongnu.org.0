Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10024E1D13
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:19:42 +0100 (CET)
Received: from localhost ([::1]:38250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzDR-0000KG-OY
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:19:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5v-0008US-FI
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:57 -0400
Received: from [2607:f8b0:4864:20::529] (port=33513
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5s-0003Sg-H5
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:54 -0400
Received: by mail-pg1-x529.google.com with SMTP id 6so8741718pgg.0
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zBy/sQij0prDNPCZW6KqDJ1PqyHxGR1GI9KNvJm6bVE=;
 b=D2ElIB7Bosv8Yx3dNUnf2GOvHXX3BI07A6j3MD3Hyk7jCFXvoO1l2oMbpzKQ/hEtGf
 uSz39pffNmCr6IRMzHjQ7GuBNIgTiUuIYpWpLcO1GN9tyC9nE3S5s8xz8316ltRb9dN6
 vfeyaveGPS5vT0o/vI5d/Ep1tJkuJsvvFJy6sFAUtPOojIIzr6knoLQVTCE6lSTzqipt
 FJZl7mMGwNfVlKbBYKCr5SpMkhH96WwAB+uNyOe2dvaZIr/5KvnPCqeI24FkSDmYu+C9
 eWm9EBBSonZWIINQeb7TNOVc8N6B+Wvdn/w3JsdoIXRIF2e2evZ3BlpxePjhlc51rMUh
 ez7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBy/sQij0prDNPCZW6KqDJ1PqyHxGR1GI9KNvJm6bVE=;
 b=EKYQz+WmzS3IMf3celEmZRFMo9sa0T2vJDe5IpwUsSCMeT0rx50D1Cpd3iPhBrpZqS
 uiDkfjexCDHpwiamdrJXCADO7HP43cO5zM3lwqOfLdhSQybeGuHMXJVWHrTRLE1Z9Wjm
 3+9YpsqVIEVNnmQ1dV8lMlqxrttmSTihJvWkw8gksRA5ny5br5ilT3ytiJlg/3uZgJCg
 VQzkCfr+IiY/PpDwWhTp5UPDlKGGe7SlF5gbVFMUSqPuYAlGFPuUY1JYvqTW1BCcjDhh
 Dl5bc5DD53Kmt8RFBDqaTMyC5+0T+GdEzZhgbxWH+S1zo1M99paF5Tz5xv1t2ghIo6DM
 L2jA==
X-Gm-Message-State: AOAM532vHRba8p2O1h2ZlqdTo3zH53Nt/cjldRw4sHeNxNNhHDD7OcWJ
 1kOPcEdz7YSDjzuraxcfEyZm7DdBW/Wgiw==
X-Google-Smtp-Source: ABdhPJyX5j9Xix4I+WqDlGq5trXeCUzfTVF1Me9FvMwopSPTQtztnk6StUi5pYTZnkDytve6Igbtbg==
X-Received: by 2002:a05:6a00:ad2:b0:4f1:2734:a3d9 with SMTP id
 c18-20020a056a000ad200b004f12734a3d9mr20343057pfl.61.1647796311278; 
 Sun, 20 Mar 2022 10:11:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 16/36] util/log: Remove qemu_log_flush
Date: Sun, 20 Mar 2022 10:11:15 -0700
Message-Id: <20220320171135.2704502-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

All uses flush output immediately before or after qemu_log_unlock.
Instead of a separate call, move the flush into qemu_log_unlock.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log.h        |  2 --
 accel/tcg/translate-all.c |  1 -
 cpu.c                     |  1 -
 hw/net/can/can_sja1000.c  |  1 -
 hw/xen/xen_pvdev.c        |  1 -
 net/can/can_socketcan.c   |  1 -
 tcg/tcg.c                 |  1 -
 util/log.c                | 14 +-------------
 8 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 6e45b31253..10578ba21c 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -121,8 +121,6 @@ int qemu_str_to_log_mask(const char *str);
  */
 void qemu_print_log_usage(FILE *f);
 
-/* fflush() the log file */
-void qemu_log_flush(void);
 /* Close the log file */
 void qemu_log_close(void);
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4af7455522..837f50f5b9 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1595,7 +1595,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
                 }
             }
             fprintf(logfile, "\n");
-            qemu_log_flush();
             qemu_log_unlock(logfile);
         }
     }
diff --git a/cpu.c b/cpu.c
index 159d0b0d1d..054f21b307 100644
--- a/cpu.c
+++ b/cpu.c
@@ -405,7 +405,6 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
         vfprintf(logfile, fmt, ap2);
         fprintf(logfile, "\n");
         cpu_dump_state(cpu, logfile, CPU_DUMP_FPU | CPU_DUMP_CCOP);
-        qemu_log_flush();
         qemu_log_unlock(logfile);
         qemu_log_close();
     }
diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
index 919e93664d..3d144508a2 100644
--- a/hw/net/can/can_sja1000.c
+++ b/hw/net/can/can_sja1000.c
@@ -260,7 +260,6 @@ static void can_display_msg(const char *prefix, const qemu_can_frame *msg)
             fprintf(logfile, " %02X", msg->data[i]);
         }
         fprintf(logfile, "\n");
-        qemu_log_flush();
         qemu_log_unlock(logfile);
     }
 }
diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index 355bbda60d..9095080b0d 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -230,7 +230,6 @@ void xen_pv_printf(struct XenLegacyDevice *xendev, int msg_level,
         xen_pv_output_msg(xendev, stderr, fmt, args);
         va_end(args);
     }
-    qemu_log_flush();
 }
 
 void xen_pv_evtchn_event(void *opaque)
diff --git a/net/can/can_socketcan.c b/net/can/can_socketcan.c
index ae19d35001..47743e5fd9 100644
--- a/net/can/can_socketcan.c
+++ b/net/can/can_socketcan.c
@@ -88,7 +88,6 @@ static void can_host_socketcan_display_msg(struct qemu_can_frame *msg)
             fprintf(logfile, " %02X", msg->data[i]);
         }
         fprintf(logfile, "\n");
-        qemu_log_flush();
         qemu_log_unlock(logfile);
     }
 }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 1e27367af6..e5d45eca9f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -783,7 +783,6 @@ void tcg_prologue_init(TCGContext *s)
                 disas(logfile, s->code_gen_ptr, prologue_size);
             }
             fprintf(logfile, "\n");
-            qemu_log_flush();
             qemu_log_unlock(logfile);
         }
     }
diff --git a/util/log.c b/util/log.c
index 3ec6e90575..73597c40c0 100644
--- a/util/log.c
+++ b/util/log.c
@@ -54,6 +54,7 @@ FILE *qemu_log_lock(void)
 void qemu_log_unlock(FILE *fd)
 {
     if (fd) {
+        fflush(fd);
         qemu_funlockfile(fd);
         rcu_read_unlock();
     }
@@ -277,19 +278,6 @@ out:
     g_strfreev(ranges);
 }
 
-/* fflush() the log file */
-void qemu_log_flush(void)
-{
-    QemuLogFile *logfile;
-
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
-    if (logfile) {
-        fflush(logfile->fd);
-    }
-    rcu_read_unlock();
-}
-
 /* Close the log file */
 void qemu_log_close(void)
 {
-- 
2.25.1


