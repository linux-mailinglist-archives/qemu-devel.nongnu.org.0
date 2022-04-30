Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D598A515DCC
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:43:13 +0200 (CEST)
Received: from localhost ([::1]:49944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknNQ-0005sr-Vs
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAf-0004sm-Dx
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:02 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:40583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAd-0006I4-9c
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:01 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so12729520pjb.5
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y2rWbJS1eJALSwnl02x5AThCIttXRwsa/33AtoYRv2g=;
 b=dFCsCoqG/pMjDsLspf8/5J0Uw2z3zxHb/S0QL0zKeV67IkYT6MszvC1y36lQFr7LyT
 vKfksOqm5rBvaUnrgEwTegeqCqU1KzlYKKQv8wLz43U5MkWsjLS0EmEn5lYxXzOevQ9C
 GP4uE+UhZF/IQhMI24dtQlYR0eyLnbeGYYfRHw8I2aDDJfYb3ds8s6G2f6mteky1/ZWO
 VC0BSRdQPTfOTunevbax0+mmQByRkfoGNK8hjBOKWKQ+8jP7jnoy7b19kZtvZ/ozjMkq
 Y1PnNY8dJ7p71p8ZcGe6/sRGDpsJadiNElQHbm5ws/gyZHL1ySm8IiExHh1sv9EZCt/G
 Gu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y2rWbJS1eJALSwnl02x5AThCIttXRwsa/33AtoYRv2g=;
 b=BoTPEg8ymSgdcj8Hvz/upAS/6KPA9zILA2LzJuOwmGRNosySUM60KCSn03TrXcc520
 vw2PzVnICQ4v5L0YP2e2KXfqKMPA4sa2G0aMjpz5ymUZVIk6D6IAD9s9BiVcan3a4Hpb
 9jwgBDebGWMkIYPxeltNjWyzurUg7XvLHZrrW1O2+7FnUGzN8rXNokYUCWlwF46j/Vje
 Q2gz5kBPV4rLkKjPg+VfkVCncFAoK8H9jPsdY5quZcEmQIwWM0NDwQK3NdzFyygmvgG6
 1e2E6B5yQ6A2vJ0UPQod5lvdKRUdioMTJEYr3yeUaQ4ZoFc9b4f6U2qnlZOTQksoL+QY
 SCeg==
X-Gm-Message-State: AOAM533lQqz34NIOYqz2tf4iXkVKylKEpsCVzoU1UL8bxqf3j6Mj9Tkr
 69BpzEHOAYmi1mfrJWj/t0MsakpU6OL0mA==
X-Google-Smtp-Source: ABdhPJyzCHtimAujhiJ0FOelo92m3wkVNzU0n5JrFpzRlaYADZvsV2Iit6+JcyIwIar5OW5XUXRw5g==
X-Received: by 2002:a17:902:a710:b0:156:5650:f94a with SMTP id
 w16-20020a170902a71000b001565650f94amr3857158plq.86.1651325398141; 
 Sat, 30 Apr 2022 06:29:58 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/43] semihosting: Bound length for semihost_sys_{read, write}
Date: Sat, 30 Apr 2022 06:29:13 -0700
Message-Id: <20220430132932.324018-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes a minor bug in which a 64-bit guest on a 32-bit host could
truncate the length.  This would only ever cause a problem if
there were no bits set in the low 32, so that it truncates to 0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/guestfd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index 42efd2c558..356b87453c 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -364,6 +364,14 @@ void semihost_sys_read(CPUState *cs, gdb_syscall_complete_cb complete,
         complete(cs, -1, EBADF);
         return;
     }
+    /*
+     * Bound length for 64-bit guests on 32-bit hosts, not overlowing ssize_t.
+     * Note the Linux kernel does this with MAX_RW_COUNT, so it's not a bad
+     * idea to do this unconditionally.
+     */
+    if (len > INT32_MAX) {
+        len = INT32_MAX;
+    }
     switch (gf->type) {
     case GuestFDGDB:
         gdb_read(cs, complete, gf, buf, len);
@@ -410,6 +418,14 @@ void semihost_sys_write(CPUState *cs, gdb_syscall_complete_cb complete,
     if (!gf) {
         goto ebadf;
     }
+    /*
+     * Bound length for 64-bit guests on 32-bit hosts, not overlowing ssize_t.
+     * Note the Linux kernel does this with MAX_RW_COUNT, so it's not a bad
+     * idea to do this unconditionally.
+     */
+    if (len > INT32_MAX) {
+        len = INT32_MAX;
+    }
     switch (gf->type) {
     case GuestFDGDB:
         gdb_write(cs, complete, gf, buf, len);
-- 
2.34.1


