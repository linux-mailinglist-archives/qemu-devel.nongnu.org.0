Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B586C32BC64
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 22:57:01 +0100 (CET)
Received: from localhost ([::1]:54918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZUK-00005u-M2
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 16:57:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZMT-0005fh-Tc; Wed, 03 Mar 2021 16:48:53 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZMS-0002VW-G3; Wed, 03 Mar 2021 16:48:53 -0500
Received: by mail-wr1-x430.google.com with SMTP id h98so25341516wrh.11;
 Wed, 03 Mar 2021 13:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kUl/TkScTas4U6LyrmMWcrV1B+r956Btg0Xp2UUszDg=;
 b=qInQaYFsgsE69kLZN8Q0oTBi4JLGigTuAdCDOGlOkRUemirQGKUfhX9Pj8PC4uUvOY
 t88ghIacqaz2h0fwh9VbeOOOA44AWZ8O1H6BxbhYX/Qocj/GqBvR0tugFD/qlPvaCtYs
 s3bJFoCvS4S+9FvE9WV+PBiKVXDaEfbOFTbiDKnr8d2KZEJ8ZFoN7rKEXDRWVlm1COeO
 I4K7tzXcd9paZ0L5tbFEnJ1QUlimRuBh2lQgGI//cMLR469o/3detg+i+YJPevuQA7rp
 4tj5UIKf38In16T2tGimCGGv5kdFEbIYLnGRnSaedNXc9dEifVo3xXRJ5ilbMN4+XSU7
 whOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kUl/TkScTas4U6LyrmMWcrV1B+r956Btg0Xp2UUszDg=;
 b=fxjUUjC95z2yRE8vCPmtcVHj5ayeZeNFv9FebaJT4b6+ITCeZkQvyOXoDsQEMBzt8M
 ukeTZ1K6nNbXDavzP5IFtB6Kncv5oY0ZGvnsoOGtVV3VhxGNEaNX81Mq09C46ZtVoVWF
 Dth1xsyP8yP/74Wf1qfOIx/GXyBn/3VsbUa4VCv9MfIOHWHd9x6N8D8N4ewDpnFMiX0a
 s2Qi60V0yG6bjYxA0ZQh50Fp0Azd4+1MlCD22CTK/HkpYe2gFXOSMDjzSW+UEQ4PzqLH
 IzwEAph3uMR0ZWL4DaBA58Fl8/kJPwdoNbQBndhjrddSWIme8ga+svqQO1yJP4vdAHiT
 yB8Q==
X-Gm-Message-State: AOAM531BCHQ/USFayupCFK8we+1yTqfGhAxT16/N4IrUhIhvfgYAsO2o
 0mXbeV6c4WLpFoLhrYz+xlM2jLAzvek=
X-Google-Smtp-Source: ABdhPJyY4HgQ86PsHHmKaXEniS0UUWIyAYBaegUuvR3TasK7FrH16cvXpoFJEK/WJ9eL6FDQt/11LQ==
X-Received: by 2002:a5d:698e:: with SMTP id g14mr666134wru.127.1614808130141; 
 Wed, 03 Mar 2021 13:48:50 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g63sm7463370wma.40.2021.03.03.13.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:48:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/28] gdbstub: Remove watchpoint dead code in
 gdbserver_fork()
Date: Wed,  3 Mar 2021 22:46:58 +0100
Message-Id: <20210303214708.1727801-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gdbserver_fork() is only used in user emulation where we can not
use watchpoints because we need the softmmu slow path to detect
accesses to watchpointed memory. This code doesn't do anything as
declared as stubs in "hw/core/cpu.h". Drop it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 gdbstub.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index 3ee40479b69..f3614ebcc7a 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3349,7 +3349,6 @@ void gdbserver_fork(CPUState *cpu)
     close(gdbserver_state.fd);
     gdbserver_state.fd = -1;
     cpu_breakpoint_remove_all(cpu, BP_GDB);
-    cpu_watchpoint_remove_all(cpu, BP_GDB);
 }
 #else
 static int gdb_chr_can_receive(void *opaque)
-- 
2.26.2


