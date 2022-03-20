Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BD24E1D32
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:37:21 +0100 (CET)
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzUW-0003ye-Ta
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:37:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5x-0008W2-CO
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:58 -0400
Received: from [2607:f8b0:4864:20::52b] (port=45993
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5v-0003St-3j
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:56 -0400
Received: by mail-pg1-x52b.google.com with SMTP id o13so8738104pgc.12
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WUo/UXugquCgKpGx2VP7SOTX0x7aIWwccomkB6QAm9Q=;
 b=lR7xrozeJMnsVVDvJU+Wu9VdwiRnknyIPcGLcXTET0IivLgLR8vHlWLYb6Y+PXr9sl
 3bObCfPTT/XUKq5qcBwE7QpjaXjlN7IUxQQeXtIBm9m3vIomdaAXdgw706pEfmpj/jmQ
 1Gc620efJ7g6GT/GoicY40S1zaWPKPRLLSTVhct6e/3DEymC1DnM86UMHwceDjJCdi8L
 xzVyWqbq7nvPnNdoalTgmXr+Zh2ddG6Q8RN/75WDQG9Gx21laCrf0FZKlpF0i8h71nn/
 ijjih8ypzFTDftXRO7H7bg4kglVU6UMnPc+rmtp9YIFEE+EFA+c52FNZUEBoQONMmXZf
 z6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WUo/UXugquCgKpGx2VP7SOTX0x7aIWwccomkB6QAm9Q=;
 b=RnmxuyQdVjSLCab/3OvckPWWU0orz47702uZIzuWLrkDiqajCtwhJEo8eIW6eoPWRG
 D6KDAvHUDVICn3hRSAhiAm48sqx1bOuBNuEs41uZUuV5tx5p8jD+8N25nofqC5Br7MYq
 UrBb+Mo5/AP9oG7mUn6/sK4dzJADH254cCeDbxxGpUSToUULEjAtdpJz61GCSadtN7JY
 BPZvkdp5psUuEwwpRw1FfR7t7L4QxkBnH+vCBBnQrssVOrCDM+tluqPK+ijd5AJlC24D
 5GdHzBpgG7cdANUEZgYNE1YbyzD2nKjuDIuHsRwfaEYMFvWmrGGLqPLks7y+Q5CFGHLL
 ao9g==
X-Gm-Message-State: AOAM531A0BxUk5dbPtg0ex9fUSQ8HFyQGgdJKOY779LZ2B13l7vnlAuV
 zbCzKBzrKW/cW66Rbe1JrzfvFsi6cZNQ4Q==
X-Google-Smtp-Source: ABdhPJxwXzrQALyQGXz0JNwzwcQaGf1TiGSKRegPZgd+J1ylAh7rstCCNrE5wfIeaabDdSmEdODM7Q==
X-Received: by 2002:a65:6942:0:b0:378:9365:5963 with SMTP id
 w2-20020a656942000000b0037893655963mr15235347pgq.142.1647796312098; 
 Sun, 20 Mar 2022 10:11:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 17/36] util/log: Drop call to setvbuf
Date: Sun, 20 Mar 2022 10:11:16 -0700
Message-Id: <20220320171135.2704502-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Now that the log buffer is flushed after every qemu_log_unlock,
which includes every call to qemu_log, we do not need to force
line buffering (or unbuffering for windows).  Block buffer the
entire loggable unit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/util/log.c b/util/log.c
index 73597c40c0..be20ae6c1c 100644
--- a/util/log.c
+++ b/util/log.c
@@ -145,12 +145,6 @@ void qemu_set_log(int log_flags, Error **errp)
             logfile->fd = stderr;
         }
 
-#if defined(_WIN32)
-        /* Win32 doesn't support line-buffering, so use unbuffered output. */
-        setvbuf(logfile->fd, NULL, _IONBF, 0);
-#else
-        setvbuf(logfile->fd, NULL, _IOLBF, 0);
-#endif
         log_append = 1;
         qatomic_rcu_set(&qemu_logfile, logfile);
     }
-- 
2.25.1


