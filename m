Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F88049A22F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:56:07 +0100 (CET)
Received: from localhost ([::1]:34958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCB42-0001mJ-8h
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:56:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAf1-00028N-NY
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:17 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=38769
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAew-0001ZL-Jc
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:12 -0500
Received: by mail-io1-xd2f.google.com with SMTP id w7so21896846ioj.5
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HYXtjEPqD4J9+1lVRxBYunG+LQova7RJ34dMsONkl5Q=;
 b=gAZhIWEYL31J4qg2t+FIWH1x7Y8QkDrL4Ow4MAzY7CW0uRFBVNx1bpDYJPzNeobJoL
 +QXlOZIF3XA8MJ+hjTBYvWcNNqLO4a4WAWprdK1PSE3waI1gkic2tZeSazSzMU4GAkf1
 OndPzHDvXp6Z2eDFDQi5b5fE2R1xVQhpjAvTbMzu80Y8hAqZTFLrYU+o9UIC+1GA/KuJ
 5QVTWzEnelYp1xVTo7AM5MDASljtoi8pPWAc0EzPFROpCvOpdctVLbqHJoRJQmPddqkr
 bt+gx0YG+BQPHUjye3mq+eg+gABUa8Q6nZC9czBHpFaWSJGnXQLETa5EO13dqmh/q9P0
 cHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HYXtjEPqD4J9+1lVRxBYunG+LQova7RJ34dMsONkl5Q=;
 b=mkDO3OWDpqtdlJIFTHiPTrG5u1CQW3DqUt5Ub6zKjTS3Tq2uoKBOx85Pb9kcMjBrUh
 tyl32JSBUupAutFQUZ29FJ9+hPFWYgdpBFQl1r45G/KbR13s8TAVdPAz2Gi/sRsWlov6
 ENh7qk60IK/jWS2BT37k4efoYtXl3Hbt0FVodbKtrK8KuJowYP4oVW9Z9kuoz0WTn0tP
 ib3hh4gV6XfQQnbFpQ9TOsOuaCkoTURK0iplHqhw+pEkiIx0grPPpX1wgr1kMILiJlJs
 FmciuOtGLJKb+dN5STfRmZxWaBs+8TGEIjFiOcTL20keYlJWZvEKfqtIZoiaDzETj2Lf
 YTlg==
X-Gm-Message-State: AOAM530dPHNRzTdmtpcVT0a6Hvyda2qpEeTpKOU8Y7t6+lTi6Q4H1x7m
 186Y8/VGCZvGfT0Y1GRMUk/uij1z81y/mQ==
X-Google-Smtp-Source: ABdhPJyIbRSXoJp79ulEbGcpbrZl4D12P/zpRoy8YcqMXPwOvWFQNjDKWAP+aXSIQGXVU+v+l38i/g==
X-Received: by 2002:a05:6638:29b:: with SMTP id
 c27mr309835jaq.149.1643074209367; 
 Mon, 24 Jan 2022 17:30:09 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:08 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/40] bsd-user/signal.c: implement abstract target / host
 signal translation
Date: Mon, 24 Jan 2022 18:29:23 -0700
Message-Id: <20220125012947.14974-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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

Implement host_to_target_signal and target_to_host_signal.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 bsd-user/signal-common.h |  2 ++
 bsd-user/signal.c        | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/bsd-user/signal-common.h b/bsd-user/signal-common.h
index f9a9d1e01aa..efed23d9efb 100644
--- a/bsd-user/signal-common.h
+++ b/bsd-user/signal-common.h
@@ -13,8 +13,10 @@ long do_rt_sigreturn(CPUArchState *env);
 abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
 long do_sigreturn(CPUArchState *env);
 void force_sig_fault(int sig, int code, abi_ulong addr);
+int host_to_target_signal(int sig);
 void process_pending_signals(CPUArchState *env);
 void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
 void signal_init(void);
+int target_to_host_signal(int sig);
 
 #endif
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 844dfa19095..1313baec96a 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -2,6 +2,7 @@
  *  Emulation of BSD signals
  *
  *  Copyright (c) 2003 - 2008 Fabrice Bellard
+ *  Copyright (c) 2013 Stacey Son
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
@@ -27,6 +28,21 @@
  * fork.
  */
 
+/*
+ * The BSD ABIs use the same singal numbers across all the CPU architectures, so
+ * (unlike Linux) these functions are just the identity mapping. This might not
+ * be true for XyzBSD running on AbcBSD, which doesn't currently work.
+ */
+int host_to_target_signal(int sig)
+{
+    return sig;
+}
+
+int target_to_host_signal(int sig)
+{
+    return sig;
+}
+
 /*
  * Queue a signal so that it will be send to the virtual CPU as soon as
  * possible.
-- 
2.33.1


