Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC0B508F5C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:26:03 +0200 (CEST)
Received: from localhost ([::1]:53078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhF1e-0005Yk-Bs
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEix-0005m7-8C
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:43 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:45681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEiv-0001Fi-GC
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:42 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 n33-20020a17090a5aa400b001d28f5ee3f9so2756124pji.4
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Jc8czLJ+xJoqfVC4MJuDy4q9ofndXIDoJR07sdyF2M=;
 b=fihwW7z2nSDMPRKgTOvf5dwWFexlZUNzBbUgNu8TcBcb0+gLhgfgsd3OPlmwfcjzYA
 GhO9x+5At2FqIniwwqpPkE8J269/e0CckcVDEVE7glPT/c+/BCd2pykbwFkkqpsRNFnJ
 hix4qoItW3mzY5aR3Fo1C1VIYRLSQMEgEvu/I5XM0yOXm2Bng/FyVL7jKe8oJ/kznF7W
 scaP/LC7spPEvj3jNn54FQIuPxAAMkDHs60fH3rtxFZ7rBGO6wWOY1mdXDKJlOUzi7pg
 9F2kZzio+fyK2+p/MznAiE6OiKdBPIwGRn3f/azYKyGqGHn8/9MamrxwCofCr9DA+Mr8
 YXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Jc8czLJ+xJoqfVC4MJuDy4q9ofndXIDoJR07sdyF2M=;
 b=RPhIWXLpEw8xFu/F2wZGGkVTfRA5z6cO9yYysZ0zE4GW47DOBOWdINtGzs7Gwa7x5o
 MzTm6Wpikfl34m8k49OcADVzfndTGly3dbPWIFW1vY1j05bKTlGWoDDkfC2N+fvhfSAY
 0qMFkkjbJ4bD2I9/C6nZnu+UT31uhK2izGJT0wnVBVF4kykLa4WdwJw7vLbQig38ae1E
 fRoEdd6+DEBIeC7yq4b/aQxswdp4r1a5RzMcAiErb5LYG3ZXv+E/8dDon+yjU/PYr/2W
 tLqv9XhuxTbBTqFKUyjgdIv9DF6cBIgKHQZoXGn/+9wp465oDI/3alP0xkaqMlmBqzQi
 mFDA==
X-Gm-Message-State: AOAM530pb6yq7vmiMQxxxl+scFZZmPwAtek/QHf5WKVL464sdwjIryqM
 bH0b7eTXfkW3If4ND5mFKsslUFkYD3+dxA==
X-Google-Smtp-Source: ABdhPJzL81nvZC1ZsEp80LtyjViic2RrKdmFr1c/ih8re0tCrrx+e/SHs9B8s2T8e0KzfLBDdrzLLQ==
X-Received: by 2002:a17:902:b488:b0:156:509c:5c42 with SMTP id
 y8-20020a170902b48800b00156509c5c42mr21883393plr.2.1650478000233; 
 Wed, 20 Apr 2022 11:06:40 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/39] util/log: Remove qemu_log_flush
Date: Wed, 20 Apr 2022 11:05:58 -0700
Message-Id: <20220420180618.1183855-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All uses flush output immediately before or after qemu_log_unlock.
Instead of a separate call, move the flush into qemu_log_unlock.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-20-richard.henderson@linaro.org>
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
index 6230f3c022..291034cb09 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1594,7 +1594,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
                 }
             }
             fprintf(logfile, "\n");
-            qemu_log_flush();
             qemu_log_unlock(logfile);
         }
     }
diff --git a/cpu.c b/cpu.c
index ded4173d40..7076ec123a 100644
--- a/cpu.c
+++ b/cpu.c
@@ -405,7 +405,6 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
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
index 79a5e2816f..13c16c2bd0 100644
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
2.34.1


