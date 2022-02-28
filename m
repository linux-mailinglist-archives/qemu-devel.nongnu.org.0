Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F844C7731
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:12:04 +0100 (CET)
Received: from localhost ([::1]:46050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkV9-00072d-1N
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:12:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOkSd-0004vv-0P
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:09:27 -0500
Received: from [2607:f8b0:4864:20::529] (port=39501
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOkSb-0005xN-G3
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:09:26 -0500
Received: by mail-pg1-x529.google.com with SMTP id 195so12237723pgc.6
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JX1igWOeqSJm9dC+Azizqq1/K1aDjmaX8UXrJxn6OL8=;
 b=emlsnLngKp+iC5JSB7gyQfJcEbsCNT4DBPPPimMi5C/4alkuTz5HxXu0Oi7zKqsE77
 T5PHHj+polxnO0T2ERYRAv5fBNe6q1np/kKM0mnH7RF1ijvlNMe6JPdvVCyEgLDb9qOl
 QDQn8nrn0w6Yla+/fqVUnVtjRiXv80flu0AfzEPbSwNAse4fneRcdB003DVKHEYwM1Vy
 mCV2sjNEjwVej7mPyNmWXgSSjdKHbsJJpog9u90PbV7VSilaPixQkuDlJQ9JJii2wdRt
 hjL08XzMvYPij0JLR32Vw7rwNYwyE5haJNfCc0qr10NYvvx0N25vaMr5K6zqqgg7vl0G
 ugSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JX1igWOeqSJm9dC+Azizqq1/K1aDjmaX8UXrJxn6OL8=;
 b=iN8wpKem+XmvB7zVv5DKtcplJJoNI1VOD0h7fA0haiIvBdokt/J+iLXlStT0QFR2nG
 kEqi0NGEOSKjdP2ShTqQOBCIzJ3sIY+j3WGSi7jZHWzMRbqHcZjylmrHPQqGiOkOM4DC
 0JOGrjCcGmh/WXy1MOveVSM+0ZAaic712H5Ny6i/4lqRJl9pfIPajpIuMi+BHG8E56jy
 py35RobqKNpyDlCPsUL++uq6VI4dRlMerS+JA9a7XJ05dSAwMuX8Q1BUVnKiYx+nyVO5
 RExIJURTRDuVMxkkQxFhCLX1v3EzMqYdGpaEP1bYcJ8Q6FGTrsK9K3XsSjKEUpJE05fX
 qO6g==
X-Gm-Message-State: AOAM530Dkty43q3d4AQxBboQ8vUdx1j0yJoU3RCPE9PPY9Ax+0AnqZCR
 rAFNQA6AlOgeR2Jr+55RcpZeVKnMeV1thA==
X-Google-Smtp-Source: ABdhPJz8Dkh/S3NSoS6DSvNG+Kz1T+LyxH6vQ8sbQ1tChJNvbZk9QWWmf60eAQGwk3AVnSFB5uu4eQ==
X-Received: by 2002:a05:6a00:140b:b0:4e1:2cbd:30ba with SMTP id
 l11-20020a056a00140b00b004e12cbd30bamr22929569pfu.46.1646071764054; 
 Mon, 28 Feb 2022 10:09:24 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 q24-20020aa79618000000b004e0e89985eesm13463223pfg.156.2022.02.28.10.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:09:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] accel/tcg/cpu-exec: Fix precise single-stepping after
 interrupt
Date: Mon, 28 Feb 2022 08:09:17 -1000
Message-Id: <20220228180918.38188-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228180918.38188-1-richard.henderson@linaro.org>
References: <20220228180918.38188-1-richard.henderson@linaro.org>
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
Cc: peter.maydell@linaro.org, Luc Michel <lmichel@kalray.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luc Michel <lmichel@kalray.eu>

In some cases, cpu->exit_request can be false after handling the
interrupt, leading to another TB being executed instead of returning
to the main loop.

Fix this by returning true unconditionally when in single-step mode.

Fixes: ba3c35d9c402 ("tcg/cpu-exec: precise single-stepping after an interrupt")
Signed-off-by: Luc Michel <lmichel@kalray.eu>
Message-Id: <20220214132656.11397-1-lmichel@kalray.eu>
[rth: Unlock iothread mutex; simplify indentation]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8da6a55593..c68270f794 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -799,8 +799,12 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
                  * raised when single-stepping so that GDB doesn't miss the
                  * next instruction.
                  */
-                cpu->exception_index =
-                    (cpu->singlestep_enabled ? EXCP_DEBUG : -1);
+                if (unlikely(cpu->singlestep_enabled)) {
+                    cpu->exception_index = EXCP_DEBUG;
+                    qemu_mutex_unlock_iothread();
+                    return true;
+                }
+                cpu->exception_index = -1;
                 *last_tb = NULL;
             }
             /* The target hook may have updated the 'cpu->interrupt_request';
-- 
2.25.1


