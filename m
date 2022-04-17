Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FF6504930
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:09:34 +0200 (CEST)
Received: from localhost ([::1]:42358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAH7-0002Gl-Ec
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fW-0000Tv-NI
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:46 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:39805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fT-0001ng-12
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:41 -0400
Received: by mail-pg1-x52e.google.com with SMTP id q19so15082726pgm.6
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bD6B2Uqz8Y1QjIr+zoV40vPDEL6T0U0IUefrrBJTa7s=;
 b=zNbGxwjXNp3wXqtdicyBgaJ1WfzuZalkawJzGVZAVGWCG9XoRYBJvoKaZ6K8Exyn4h
 SlE+QfrKET5LqNF6kV1/5ESbr28Yed5Jo/nN8Oadq3mnb4f539r7O5S2UYwDoT2ON0Zl
 +BOoQm9Qg34+pRJUEuVFPlV2dlaTC/lT5Nds8wLulJQvGVxrh1qlaAkA/iqTRu149N6A
 idR21/dJ+nXwCDB0rhRBLFDU5YyzFKqMXgFZIBhNYfwpou4ikBTbX99zlbyX5LMl8PYf
 DptqV0bQm41i0l1u0K4UrG/SPzzRyk3A7lS224jd6diA6VrUmzts1RCLhnr/8j219dN6
 3YHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bD6B2Uqz8Y1QjIr+zoV40vPDEL6T0U0IUefrrBJTa7s=;
 b=MR0hXLXKuP1ujGeZ2C+dCY4WclNfyzXVsQitQm6QzlDy/ySgAGfj/qQN+ou7rvoUJX
 QN24goGuOUGXDNpmgluOH2dw3dr17WWwEHq3g/Rgb/XhpeTCMd8YPFV54RyaZ+CCBEt8
 lqIr9WBJleX0XoYDVnyCn1kdGChBcqkHhDTwW2xGSXeG91KZh0ubcMnD6meVYbAwlqYx
 vfIgZoMXv8dwJKniGZgdyjv1Uwce+eq7gGKay3mqUwn6UrWxKAuUCPoi5VuqxcAZJzLj
 CVAhHnSjtdJRh9+XLKdwiGX+nX28i0xcCad5GtZ/PvlgQrMXPtAzG8pyc/wLQAi0J6k/
 hckQ==
X-Gm-Message-State: AOAM531ij3EZVcqFXAWTm01+F65aASZzSNw2TdxCEA80kzV9G+6l6W9T
 VXbPpcCa6fjHmdt2ZDptM+DoVwrZqJvfzA==
X-Google-Smtp-Source: ABdhPJwBzmTki6cMr8Jb8b8SXJi73z6TsefoYmWbbMHt9D4xrLxlD3aLcsl8i5fkSoPBkfPsV0bNTA==
X-Received: by 2002:a63:f80e:0:b0:39d:6a06:517b with SMTP id
 n14-20020a63f80e000000b0039d6a06517bmr7164470pgh.308.1650220236816; 
 Sun, 17 Apr 2022 11:30:36 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/39] util/log: Remove qemu_log_flush
Date: Sun, 17 Apr 2022 11:29:59 -0700
Message-Id: <20220417183019.755276-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All uses flush output immediately before or after qemu_log_unlock.
Instead of a separate call, move the flush into qemu_log_unlock.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 3a1f3a6020..75973111bb 100644
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
index 4812619f00..6080ea997a 100644
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
index 3340bb7538..bfa4db9cd8 100644
--- a/cpu.c
+++ b/cpu.c
@@ -406,7 +406,6 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
             vfprintf(logfile, fmt, ap2);
             fprintf(logfile, "\n");
             cpu_dump_state(cpu, logfile, CPU_DUMP_FPU | CPU_DUMP_CCOP);
-            qemu_log_flush();
             qemu_log_unlock(logfile);
         }
         qemu_log_close();
diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
index 23d634af6f..e0f76d3eb3 100644
--- a/hw/net/can/can_sja1000.c
+++ b/hw/net/can/can_sja1000.c
@@ -261,7 +261,6 @@ static void can_display_msg(const char *prefix, const qemu_can_frame *msg)
             fprintf(logfile, " %02X", msg->data[i]);
         }
         fprintf(logfile, "\n");
-        qemu_log_flush();
         qemu_log_unlock(logfile);
     }
 }
diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index 0423c61158..037152f063 100644
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
index a6388563c3..c1a1ad0563 100644
--- a/net/can/can_socketcan.c
+++ b/net/can/can_socketcan.c
@@ -89,7 +89,6 @@ static void can_host_socketcan_display_msg(struct qemu_can_frame *msg)
             fprintf(logfile, " %02X", msg->data[i]);
         }
         fprintf(logfile, "\n");
-        qemu_log_flush();
         qemu_log_unlock(logfile);
     }
 }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 70f3b52482..17e9ad2ede 100644
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
index 2bd4dfba1b..cab0642a7f 100644
--- a/util/log.c
+++ b/util/log.c
@@ -54,6 +54,7 @@ FILE *qemu_log_trylock(void)
 void qemu_log_unlock(FILE *fd)
 {
     if (fd) {
+        fflush(fd);
         qemu_funlockfile(fd);
         rcu_read_unlock();
     }
@@ -269,19 +270,6 @@ out:
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


