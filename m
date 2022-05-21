Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AE052F6B1
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:19:21 +0200 (CEST)
Received: from localhost ([::1]:58406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCpz-0005Xn-1z
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCby-0008Br-VW
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:58 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:40469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbj-00041j-3F
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:47 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 nr2-20020a17090b240200b001df2b1bfc40so12734090pjb.5
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vqBv2QVKsobJpocmgNSatxx08hnrv6y9/ePykNgKyQg=;
 b=s/NfPqqpeOn3O/J4L51i5NZGR4f6C6PYyojESAYY9uyaQVYt109ZOk4SCfUqN/sP0R
 JIorlGPVoDG7rii9XEBdLW7mCuf2VFN2Gm65qQbJninq00BL3ih5pIgjUZdRz7OtigHq
 LoTsqfvneID9o1N8Mwj742RK1e7S725zkO5j3UWrA5op/KwYzLsAvvHiFbz38pqg1opc
 iYsC/YSypTw82OxXDbJgcf0G79eXJpgVR5HmGxNw/J5/2/6ElHimfx/XgbBQKF/XZEgt
 R7HpkvJm6FLu+Y43LASgX55BCx0ATEuPe8kYlFj7KVCkZQ3nXXVWGmo5gndDzsDuvMkY
 I5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vqBv2QVKsobJpocmgNSatxx08hnrv6y9/ePykNgKyQg=;
 b=n96m8AXts9APaG9ZKqWSBq6eox4zyn4RahHhTg56zxfEyJbus8cEjNt4LXGqn5cVfY
 upNWsRB0wqhfeStTpJp0MkP1YU+yvrQkuSgK9IjZHUgWlURUR88TSqJkbnhxhWJoMLeL
 ElNUSSapwjXbMm49NgBRnVChBQmnJsFzqp/xTCVblrnTshwtKxKufsy/vrFj4XMB2Njt
 CCN3mOXCGqpISXrpW7JXqZ/P1gvb6W/h6Jr0MvHwmHd1tixDXhuDUxpz+MYKFmOu6K81
 N+5luPXX2K9zcvWqIp3ejOKeDQhQfL7hg41LOlVnf2aa7nTNo5nLf2IyH1qyjOx52Bvm
 i/uQ==
X-Gm-Message-State: AOAM533j3aUHJg6gBGMDcibWT8Ffs1O87fqRS8gMwLxoF4uV3Zv+yEm6
 Wr8J3oEoVA8IZsP4MU7AWbOHTcJyzgq9wg==
X-Google-Smtp-Source: ABdhPJxEee9ozPoKfjl2XMmLv5Bjkyt3YVVzHITXGxnnckF2T+MYTA+9juYNRcvd/9SuK0N9I7CoGA==
X-Received: by 2002:a17:90a:b001:b0:1dd:30b9:1a45 with SMTP id
 x1-20020a17090ab00100b001dd30b91a45mr14440067pjq.132.1653091472783; 
 Fri, 20 May 2022 17:04:32 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 27/49] semihosting: Bound length for semihost_sys_{read,
 write}
Date: Fri, 20 May 2022 17:03:38 -0700
Message-Id: <20220521000400.454525-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes a minor bug in which a 64-bit guest on a 32-bit host could
truncate the length.  This would only ever cause a problem if
there were no bits set in the low 32, so that it truncates to 0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/syscalls.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index db4561b798..a5623ebf0f 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -313,6 +313,14 @@ void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
 void semihost_sys_read_gf(CPUState *cs, gdb_syscall_complete_cb complete,
                           GuestFD *gf, target_ulong buf, target_ulong len)
 {
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
@@ -343,6 +351,14 @@ void semihost_sys_read(CPUState *cs, gdb_syscall_complete_cb complete,
 void semihost_sys_write_gf(CPUState *cs, gdb_syscall_complete_cb complete,
                            GuestFD *gf, target_ulong buf, target_ulong len)
 {
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


