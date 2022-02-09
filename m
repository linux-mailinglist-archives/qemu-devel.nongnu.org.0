Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23B24B00EF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 00:07:16 +0100 (CET)
Received: from localhost ([::1]:58280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHw3P-0007BX-Ls
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 18:07:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvx9-0004Cb-Sa
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:00:49 -0500
Received: from [2607:f8b0:4864:20::102e] (port=41651
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvx7-00031x-T3
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:00:47 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 r64-20020a17090a43c600b001b8854e682eso3830280pjg.0
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 15:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w0Zhn2tuP42TSxJAOSHDCIvihvH+W+m4usoAyV7FoUk=;
 b=O7na37r+NoWwcrm5InYjfkNO3iCeZvXxA72P8vQ59E575eIvl2w7AAi54okrhvm6yC
 hJW2hgdu5vwXAbi2h+W7jCtxF90fXShaJouVyvsKspaLoa0lBqFtF+/Z859Fqzr8QG42
 hVillinbT1NVDp3Jr26FVvV1uA2Rg3a+Cs0uppvIzHlGvksrA2sp8ngJiPr+v+VASQEI
 U2tyF+f/qCYEM5lvofLyKtlq+PHRxrpaKgzUs0e776YwcCJgVGxXzay4M/y9R37xNgL9
 GDH6bL71RyIjT+ZKEcliNFjkezTGOBDWqcnzCxHDlhnWk/g7JJYiJkI1+aM1K0yeVQmt
 +leQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w0Zhn2tuP42TSxJAOSHDCIvihvH+W+m4usoAyV7FoUk=;
 b=3gL155fMN21XvYslcjmc0LAo+c2VUUG19xOQSzTfgRFP0PhF1EK8iFrMhBw8WOsxJx
 a97vgqhCwbLfSrs0Q7oyoioJJngvd5L9Wa9e3XL2osqsSqJLZFm6wD1KtuEu0OydXtqn
 KSjif4nKYw6k3w8dNaPsQW7l33TX8iV05yU1f+eYpgXRNBm1mzAjOtbiOmkHSHTpZhR1
 Ag9vfu3JZMTHO1YzsDgRTUALuil+v7yhhM9L2lWq7je8f4ivTe+8JqiCMh5E+3euDvTV
 R254bm4dwiusk7ATpE2UK75a+XpJAjzcwTkKHl+VFDSt5IzQ76IoTyGYLnQbuGxFhVAY
 gUUA==
X-Gm-Message-State: AOAM530QFV1uX0lCR1HZMbu/8hUZVF4+3UTxIgP6hGNbSh0Havq/wp/T
 slvKFiEnGye2tiaFcBDqGwnlGr+6yTE=
X-Google-Smtp-Source: ABdhPJx2Tw/r8LvGj5jSobpQMhcfhd4D3QWD1w9Hnaj/ECqdRA8z2+ALz/4HHiOe6RJF6TuONiTbEQ==
X-Received: by 2002:a17:90a:c598:: with SMTP id
 l24mr5176132pjt.175.1644447644365; 
 Wed, 09 Feb 2022 15:00:44 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id s6sm14427554pgh.86.2022.02.09.15.00.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 15:00:44 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 1/9] accel/tcg: Add missing 'tcg/tcg.h' header
Date: Thu, 10 Feb 2022 00:00:22 +0100
Message-Id: <20220209230030.93987-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209230030.93987-1-f4bug@amsat.org>
References: <20220209230030.93987-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/tcg-accel-ops-icount.c | 1 +
 accel/tcg/tcg-accel-ops-mttcg.c  | 1 +
 accel/tcg/tcg-accel-ops-rr.c     | 1 +
 accel/tcg/tcg-accel-ops.c        | 1 +
 4 files changed, 4 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index bdaf2c943b..379a9d44f4 100644
--- a/accel/tcg/tcg-accel-ops-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
@@ -31,6 +31,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
+#include "tcg/tcg.h"
 
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-icount.h"
diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index dc421c8fd7..de7dcb02e6 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -33,6 +33,7 @@
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
 #include "hw/boards.h"
+#include "tcg/tcg.h"
 
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index a805fb6bdd..889d0882a2 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -32,6 +32,7 @@
 #include "qemu/notify.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
+#include "tcg/tcg.h"
 
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-rr.h"
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index ea7dcad674..58e4b09043 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -33,6 +33,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
+#include "tcg/tcg.h"
 
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
-- 
2.34.1


