Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8EC3920A2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:11:14 +0200 (CEST)
Received: from localhost ([::1]:58104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyvx-00069K-RB
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mforney@mforney.org>)
 id 1llyne-0004ny-La
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:02:38 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mforney@mforney.org>)
 id 1llynb-0000P7-7N
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:02:38 -0400
Received: by mail-pl1-x629.google.com with SMTP id d20so1084509pls.13
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 12:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vv5OnGTeBMJF33/J1U18TeOHvsm5r7sKoDnGKgxlzn0=;
 b=MuCXJ17KFQz0YCQDaKJsoJvfS2VODNN4igX1CnNyon9FYUe0A4BsLDdwITjn2JIBbD
 REv5l6LwqY1u0Jax6Ibu8rDnrV4RxnasmT5qlzwOgnH+N6OsWB5E4mB+vRFLsrNT6//u
 bGx8j2dShs6G2rKubIvb9mPTwzYiRnK0osNpKhMLppQ4husQhKlNUo4aeF4iKsQ1FyqG
 Apivu6qs50Xx+Pjym6SpmXLVXEC6U+5ttAq1rp86s986f5kqNgqJ5oNLI+Jg0ti8z8+8
 N8s78NIH7RyZCHSHsMnsk6YNaJ7YVRWZBsoUzJPLSghQyGsOl2Piv400XZ1rX+b2QTsi
 5jZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vv5OnGTeBMJF33/J1U18TeOHvsm5r7sKoDnGKgxlzn0=;
 b=lu4ZY/AKX3vCKlqJqbRoZ1f/CNErQNNh8NAjQGHZj8Lk1743ks6WJ7H//Fylol4sgh
 PwcDAMewGrWNUhK8H9x5ScoZPmYrjBAhL6Bb1yhjWuj4B3FYvYm2ur5Y1vO8k7zOY4uk
 iFqp4JMa5zjaAhZvZVP0Cc7Cxkwt6HYMFX8YUrCQhb7JAo3gLN89gmxlwOk1LyfF7wEv
 qHhqSMWAJwdq9SZ4SCein5s9AJzRJ2Af4zgm3VZlA6MCskM7zI7/bdks4cdDkBQpqKvs
 xRTobkdPN4oEdY0/4+GcQwctlDHLmmdozrgNcQooM3VVxPnyAiLDruCHwT0ppevsbq6r
 SGuA==
X-Gm-Message-State: AOAM532ONeUe0VDtG76FJ1hgI2O1++FLSEnvHM2yX1oMDLJ5wARDnhxU
 iz52FPumc/ce+rry5E4vz0aisVSILIlAvl5hF4I=
X-Google-Smtp-Source: ABdhPJx9UuP8vJ2iA6rm4f6EXiNJI4zBvBb9A2lssAAJdmyxQ9NMqElqjmhjM4DWVkiUhbQ//deRaA==
X-Received: by 2002:a17:90b:4ac2:: with SMTP id
 mh2mr5276779pjb.184.1622055752187; 
 Wed, 26 May 2021 12:02:32 -0700 (PDT)
Received: from localhost ([2601:647:5180:4570:16dd:a9ff:fee7:6b79])
 by smtp.gmail.com with ESMTPSA id h36sm103469pgh.63.2021.05.26.12.02.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 26 May 2021 12:02:31 -0700 (PDT)
From: Michael Forney <mforney@mforney.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2] linux-user: Disable static assert involving __SIGRTMAX if
 it is missing
Date: Wed, 26 May 2021 12:02:03 -0700
Message-Id: <20210526190203.4255-1-mforney@mforney.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526043928.9586-1-mforney@mforney.org>
References: <20210526043928.9586-1-mforney@mforney.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=mforney@mforney.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This check is to ensure that the loop in signal_table_init() from
SIGRTMIN to SIGRTMAX falls within the bounds of host_to_target_signal_table
(_NSIG). However, it is not critical, since _NSIG is already defined
to be the one larger than the largest signal supported by the system
(as specified in the upcoming POSIX revision[0]).

musl libc does not define __SIGRTMAX, so disabling this check when
it is missing fixes one of the last remaining errors when building
qemu.

[0] https://www.austingroupbugs.net/view.php?id=741

Signed-off-by: Michael Forney <mforney@mforney.org>
---
Changes since v2:
* Guard check by #ifdef __SIGRTMAX instead of removing it.

 linux-user/signal.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 9016896dcd..0f19c59dee 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -38,7 +38,9 @@ static void host_signal_handler(int host_signum, siginfo_t *info,
  * Signal number 0 is reserved for use as kill(pid, 0), to test whether
  * a process exists without sending it a signal.
  */
+#ifdef __SIGRTMAX
 QEMU_BUILD_BUG_ON(__SIGRTMAX + 1 != _NSIG);
+#endif
 static uint8_t host_to_target_signal_table[_NSIG] = {
     [SIGHUP] = TARGET_SIGHUP,
     [SIGINT] = TARGET_SIGINT,
-- 
2.31.1


