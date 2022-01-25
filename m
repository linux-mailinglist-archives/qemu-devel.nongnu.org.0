Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31D949A452
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 03:09:14 +0100 (CET)
Received: from localhost ([::1]:59942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCBGj-0001vB-Nm
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 21:09:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfH-0002Ht-9o
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:34 -0500
Received: from [2607:f8b0:4864:20::134] (port=39802
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfA-0001g7-TI
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:28 -0500
Received: by mail-il1-x134.google.com with SMTP id z7so664452ilb.6
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zdl+PF9o92N/RKpPea/Fbgqg/k7pry6t4SM3rNCIkIo=;
 b=lgpPifzNL8pdutqdXOCR8Z/gWsS8Ht7CC+pis/OCm0ft4qEONMMtmKOSCKXhFoRfKc
 VxHQfZOgpyHspR1X6DwaYFmPTIJKATGTtYTBg4ALn4WFmENXphS7og7c6VVDF71yqP1M
 zS+h3RXVlkgmFaFYG13ZXzGmjJUdxQZtbVSruZZ8NYmrDOZvfYaiQFpYZ1vrrPsyzPbl
 dz5Rmi3xYyEPzp9orrMz2yvpUMjSej75bkuk3PGqeYJGqyUGMvWuye2I3KvciPcm03zG
 bcPQ0tJS8jknvfX3LoYedstAbWCydm65PchtWfWA0CVU4Zj6S+M4ds7ifL5PB+KM/dOZ
 cj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zdl+PF9o92N/RKpPea/Fbgqg/k7pry6t4SM3rNCIkIo=;
 b=A0XcWGtrnpDQj3tLpw7PX++k+wvENPoh3g6ckFz4uXWXkjLInXGfr8g9UWqYXRWMvu
 465PM3VGBagjOEm48ZTVuJpCEodLmpSB33wrHqAAygwD2D/5jOURwirISCEB9X5i1Vdm
 6Gogdk5Uif3reIuOteo6NcRZR7yjPNML6qf6qDWIDKSaAxXpFMSi91l+MYYAxTfSANf2
 hrusmKGL1NKLWKhgx7hX8U+DQ8ibtFnzW72xW1cQaIocOAn8hueblOXwJCQ4vEeTnusy
 aP4xPQcjulI8T0KP9JWYze0uaqVZTPXLGt2nOje2OA2PCnNCt4Mg5YxO2yNv8W9MrYj2
 /FGA==
X-Gm-Message-State: AOAM533IYEQGpv3JaJBEkciXYzXnjIkduH3GZ8fASgcTQ+gfdKqBNTEp
 phQs4pebLnHtfTv7Wltr4wGjFCY4967jOA==
X-Google-Smtp-Source: ABdhPJxHa30PLjW+dCCLF5WZ7iaL3pa3hTJ4f/xAv/oy5gM+4cHBHo9mkcGbhppM6LVDUk3EJQrFAw==
X-Received: by 2002:a92:c563:: with SMTP id b3mr10811231ilj.150.1643074222374; 
 Mon, 24 Jan 2022 17:30:22 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:21 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/40] bsd-user/signal.c: Fill in queue_signal
Date: Mon, 24 Jan 2022 18:29:36 -0700
Message-Id: <20220125012947.14974-30-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fill in queue signal implementation, as well as routines allocate and
delete elements of the signal queue.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h   |  1 +
 bsd-user/signal.c | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index a7964776fdb..fe0aedcdf3f 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -85,6 +85,7 @@ typedef struct TaskState {
     struct bsd_binprm *bprm;
     struct image_info *info;
 
+    struct emulated_sigtable sync_signal;
     struct emulated_sigtable sigtab[TARGET_NSIG];
     /*
      * Nonzero if process_pending_signals() needs to do something (either
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index ccda7adbeef..34663f7a28a 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -255,7 +255,18 @@ static void QEMU_NORETURN dump_core_and_abort(int target_sig)
 void queue_signal(CPUArchState *env, int sig, int si_type,
                   target_siginfo_t *info)
 {
-    qemu_log_mask(LOG_UNIMP, "No signal queueing, dropping signal %d\n", sig);
+    CPUState *cpu = env_cpu(env);
+    TaskState *ts = cpu->opaque;
+
+    trace_user_queue_signal(env, sig);
+
+    info->si_code = deposit32(info->si_code, 24, 8, si_type);
+
+    ts->sync_signal.info = *info;
+    ts->sync_signal.pending = sig;
+    /* Signal that a new signal is pending. */
+    qatomic_set(&ts->signal_pending, 1);
+    return;
 }
 
 static int fatal_signal(int sig)
-- 
2.33.1


