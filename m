Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1468D4E813C
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:58:31 +0100 (CET)
Received: from localhost ([::1]:40836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6w1-0008SQ-AQ
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:58:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qx-0007Va-Lc
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:24 -0400
Received: from [2001:4860:4864:20::2a] (port=43741
 helo=mail-oa1-x2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qv-0005Vm-P4
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:23 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-de2cb87f6aso10702807fac.10
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HCB05Inte9LF7rNCvDwYZMk3/K4+jeUff4g5SjwTBWk=;
 b=h/d1M3QX7NQyvcr60/4rpCWpZhAuc4mXqkIgy9Vxh9y7UP12aBI6sx9B6Edde0gJlU
 2ABB8VVdxQD85FLUcg57poXkC8fdCIYAheQnXVzvysjJnGmFbNVJTvzoSm251HwDTolP
 uTOfIz66vjGJ7+ZJwDxVQ+Dd/K3ru18c7OG7s7SyZ6fgPRx0+JuL73UGWDtIMHVCb5cc
 WN27DI+EvLQOPBDIk1juOctUTlGreK0jYw7M7S/AjH6sQCXr0GoI/LpEd50CIVB/kag8
 GqEpIOLHVrfEl/YE6qRcdriO8Q0+zJHQWBCtqxX5wtjL4PQg9JcDpzf3cgKhEHd3UCr/
 tYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HCB05Inte9LF7rNCvDwYZMk3/K4+jeUff4g5SjwTBWk=;
 b=ptaA1IsEPyvv1DnJugR3SwFpv5L7A0bpAHhmrtAgYwOpb34+rEViA7EFy5xuTDsMl5
 GPMOfumi9PrMs62x47XBsf6TV/pSiEs3gyWXmeNim/YkH1XRK4Xx+E87Y1k9vZpiBhNU
 LbrmEyBKnGNOo2e+csJW4Jna4iShQXBW5f8gIhkplqJb0AyCZ5y8+te+oYlrFeNbqeW/
 hTmrnP2/o7EdhWdPvFVkkO95M0WXsyAwvRKTCOckEL1N3iJPigVl/y+3MyMV4vXS06CB
 SAf4MwKcK52gJ+G3Ou5jUegLNt89rUdlATzP8ajbT9NXRP4EBz7nv3o6CI0PewabF1PA
 qzuA==
X-Gm-Message-State: AOAM5303pKSu9PECDd/iz2SwdGcbXaRSRLEq1reDz4QUnWGX6y++FVfo
 YwRF+7WqXGVZrGl4NTKwxafo0HpaX6P7jES0
X-Google-Smtp-Source: ABdhPJz1PXl5eo8VdPP+GYBbAyxmQBQ8dm+PM+6+p+0Vpy3MR3Y9VBS0X8KnW62LAwWx724B4XUcNQ==
X-Received: by 2002:a05:6870:a1a0:b0:dd:e471:8baf with SMTP id
 a32-20020a056870a1a000b000dde4718bafmr11195479oaf.40.1648301180369; 
 Sat, 26 Mar 2022 06:26:20 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/39] util/log: Remove qemu_log_flush
Date: Sat, 26 Mar 2022 07:25:14 -0600
Message-Id: <20220326132534.543738-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2a
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All uses flush output immediately before or after qemu_log_unlock.
Instead of a separate call, move the flush into qemu_log_unlock.

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
index 25e987d881..124d8be1a0 100644
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


