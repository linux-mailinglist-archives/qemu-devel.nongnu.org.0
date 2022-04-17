Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76E550493F
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:16:14 +0200 (CEST)
Received: from localhost ([::1]:32802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngANZ-0006W1-Px
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fW-0000Tz-WB
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:46 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:51010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fU-0001nq-Aq
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:42 -0400
Received: by mail-pj1-x102a.google.com with SMTP id o5so11413549pjr.0
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=InZstGK3OSOKG4KiyoWd4So9y/2uE4PZQH7gwFG8oNw=;
 b=spWiBeXBTEyENU3yk+r8I8lsjTtsOHb8HsU87ccc6OdoZ0+4KtMmaJjHZRfUZRX4Bv
 0Z06MBOcRp9KXprVa+pTkxJKzQtzsvTOPmdtyJQRJWPE3hahVIGtY5QIT6ADuRg5jYbC
 k13g2QV5K1nHhCdO7BIRHSB0OGvz6uMW/ORvZVPfc/R2toXWgxbJZxZ2YmyV5ofqbMyr
 rh5FTISt2oryBDY0G/EZAX0IRIRSEVcnr5Bnq/7KD9poG7Wj+0k2PQ48ZvmuV5lO35Bc
 ewhHKEUCmnFd+oiilVx44bUSBZ6GOQKt5UygmcRsxF5X2Mf9AivNTQzsFNWeL3jNCFGb
 Mazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=InZstGK3OSOKG4KiyoWd4So9y/2uE4PZQH7gwFG8oNw=;
 b=IzpyNsQSa6JyC+KP09V0O063XBR7U7AgslQ+dIS9j2xZEDkbxH3Pvvwy2FPlt6fBGI
 EaijmeQqFg1fLaDzkKaTRI8Mveq0gtw4a7ze1TAuZ9DVRc7tbZeHUsD5SNwFGo2HZT/6
 CEsBG4Fn7Yg11kckfKzwfsrwb+xcyzsQuVloisMWNGeTcjzb/6aN3CHn/tL43JDwI5j2
 2TN3YX1KAjHTBHD034chmp3WAvM8wa8RVua65rYHhtqr/OQLNTbqfsVH8Ot6y7Ix+UOF
 gkeXsVTXBlQrwe3EAyfjz05BJHBcgWsxHjVNnztENi9FgZlR1+XNsTdMSL+voi5+qX4y
 CoyQ==
X-Gm-Message-State: AOAM530zTYqAk/avPO7ONmHfSQrpwMskLgvqxCwg52eX8ZSCR/+wWI4Y
 t928so0uarH5rBaPpo5CNl2T6FS/W7fQKw==
X-Google-Smtp-Source: ABdhPJx9GyLFcfa+yVPHIbHdj+Rdi/lOx9pnETa9ZhUY9Ewcu80zG1n58pGqDPgUF4MP6Tr7OcHVrQ==
X-Received: by 2002:a17:90a:7147:b0:1bd:24ac:13bd with SMTP id
 g7-20020a17090a714700b001bd24ac13bdmr14728488pjs.70.1650220237959; 
 Sun, 17 Apr 2022 11:30:37 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/39] util/log: Drop call to setvbuf
Date: Sun, 17 Apr 2022 11:30:00 -0700
Message-Id: <20220417183019.755276-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the log buffer is flushed after every qemu_log_unlock,
which includes every call to qemu_log, we do not need to force
line buffering (or unbuffering for windows).  Block buffer the
entire loggable unit.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/util/log.c b/util/log.c
index cab0642a7f..caa38e707b 100644
--- a/util/log.c
+++ b/util/log.c
@@ -136,12 +136,6 @@ bool qemu_set_log(int log_flags, Error **errp)
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


