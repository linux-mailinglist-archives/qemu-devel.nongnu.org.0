Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF745065EE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:32:53 +0200 (CEST)
Received: from localhost ([::1]:34146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngiM0-0007rd-7T
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmH-0001FT-Go
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:59 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmF-0004Wd-7J
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:53 -0400
Received: by mail-wr1-x435.google.com with SMTP id i20so20892202wrb.13
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8NtQvGNLH0RJY6f1LX0AvyNBK6+G9tQlWq49FJBFkgQ=;
 b=Xd/dEqlDSat/wlf2f/E9HkvczgfFiXvVRF8cdJEdACaYpob+ZMZjKo2cIspDNdrPwW
 ro4ETOuhzq4xOjGd3mwt6EIeOUfehQtJ52d6nyeUDct0saCz7AR8EhRAANN5njmPB60C
 mqNQ8HIqpve12l4aPm46plDHp2zWOFEdOSbqq3XKoAvF8yYU12kLHHoX8JE9PGGzTdGL
 6pXD02i94zUSb3UEL4tABVf8FpHiLOiC0yuBl1s+ePJHyN28J9m1edejqabnXuDqL1X0
 SckZkCq5ghydHTfZnXvrGf3poFRbcn2V0uwiLKb4vpXEcVhy7uZx4KAL99Rstl1Mm6ZD
 /L7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8NtQvGNLH0RJY6f1LX0AvyNBK6+G9tQlWq49FJBFkgQ=;
 b=wIiPYNfMWsyaYfcCtnc6g6mXZrM8DFP1qEhhONreVhWwuLvSK6d5tGLYcmuC0U+wYE
 aKdXH7RsL4BUZT6UiZ4wHak+cQU+yOhrXHHk0BnOBJ3vMxzMa5YrT81EV5vLFmtwSIXx
 LV0x7u4pv6vtbqXmCUNlgDnLahiPLyLcETylEsx+KtsPqEbgV5M4FZDeyqA3r60OiD9t
 paMAuM6Az9i182gYQvZ1BnV8Xd+OliE4gy1lBjXBvLeIkaz6wtFGlouQ0Js4tWt+lIwK
 FPFeZd+2nIWNHMy04GNOrLKweOf7RD6NUvDHKjyqatF7QRgBS5XiZp6ys4vc7i6QycYt
 0CsA==
X-Gm-Message-State: AOAM533R3Cq8GGonyXad61BxSQTGqT3LGNLMkcJqjQW9hdI0Bch+KFxT
 +WK0Nm8vG8mM+bTS+/d0T/KkQWOGyC0ypg==
X-Google-Smtp-Source: ABdhPJx+pjX3Lc5yv4pW/fHnAci8J+wiRTOCNPIYq6rV2OeU/x9fjjO9zT5eaQpl1ca/qWkl4NKapw==
X-Received: by 2002:a05:6000:1883:b0:205:c0cb:33c6 with SMTP id
 a3-20020a056000188300b00205c0cb33c6mr10808834wri.39.1650347509987; 
 Mon, 18 Apr 2022 22:51:49 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 43/53] thread-posix: optimize qemu_sem_timedwait with zero
 timeout
Date: Tue, 19 Apr 2022 07:50:59 +0200
Message-Id: <20220419055109.142788-44-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

In this case there is no need to call pthread_cond_timedwait; the
function is just a trywait and waiting on the condition variable would
always time out.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-thread-posix.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index 8505d8c60f..ac1d56e673 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -284,8 +284,12 @@ int qemu_sem_timedwait(QemuSemaphore *sem, int ms)
     compute_abs_deadline(&ts, ms);
     qemu_mutex_lock(&sem->mutex);
     while (sem->count == 0) {
-        rc = qemu_cond_timedwait_ts(&sem->cond, &sem->mutex, &ts,
-                                    __FILE__, __LINE__);
+        if (ms == 0) {
+            rc = false;
+        } else {
+            rc = qemu_cond_timedwait_ts(&sem->cond, &sem->mutex, &ts,
+                                        __FILE__, __LINE__);
+        }
         if (!rc) { /* timeout */
             break;
         }
-- 
2.35.1



