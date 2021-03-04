Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0284932D6AB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:30:55 +0100 (CET)
Received: from localhost ([::1]:59126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpwE-0008SI-15
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:30:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHprm-0004Kc-2G
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:26:18 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHprk-0007n4-I0
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:26:17 -0500
Received: by mail-wr1-x430.google.com with SMTP id h98so28056421wrh.11
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 07:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5hURQl7mQu94lVdUQLSZ+hN5/5GBtgCRjunr2qL9FhQ=;
 b=Ty6PBKJ5TaJRlnQuF0995gTDUXErWv9neJVnixMaekw8AZOrwM9F1IxmUN0IxYF2dT
 1wkkGHPxx1OAJ+dWWIej6P6jdaurQEnGLNIyg0ge0He/V8SM0xgGixv9+3xpAOLjW62P
 WEA+/jvW6YdqUZb9rm5RTU0h/s7PQbXFtB7FrMEBk7P5LUB1/n3ugD8sax2Pft2+GusK
 AN3LJyNfPJQk6sn3y/dcBywhj8JomtqZaqbhhgHQuy0zhh0hkGCxckAom7bZrQFabAwA
 X1Q6AhWadvV8giDLDXXsQB2LyKR1mNofC1LDYU8Uo/U25yGAQP5VYSKOLIcjfatkyMj1
 11UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5hURQl7mQu94lVdUQLSZ+hN5/5GBtgCRjunr2qL9FhQ=;
 b=HbhR5irsWkzOMYvU1wBx6zbq2qGs8pkQOFgFh4bVj+z+OsCxZ8j5SK+JFJbTJ9bIVp
 JXn5uFRKSL6DhUANHTDB2UjMvV8KjM3J7E/1DieBAD4QlAN/PqliUEQ3JnH6+2cEokKh
 XVQtMluxsPfOypAubsGFDMcwK+k6NZIKhkx2UciZpmNjzsLcBBivD3mhm5Ozdib24PT7
 nn3xvpvwYtbypqW9wkZzTQguV7qiVvEkEBiVkiG5+m2FAXd0tQvlj/R6DZQt9DAfF17f
 0HS23Ic9QhNaSwO14CyMEuxjdLArgUErm/WdPbSeuQNR7H+E2uXHSIaZ4qnjL8UtmUlt
 IhIQ==
X-Gm-Message-State: AOAM530QSqwyd45uE++D2bNUQkh+w6Bxo1SXbSfKQpV3sqp4crs+boM+
 7y5wk2trs+TT02bFNgko0McQBkMpyRk=
X-Google-Smtp-Source: ABdhPJxuot6aFSYV4/0e8xpvNAuSCxx49myz9nzpvSPRAgv3FeCSGw+pf1n7dOJo7u5BThDCuhGUIQ==
X-Received: by 2002:adf:e7cf:: with SMTP id e15mr4685569wrn.346.1614871574637; 
 Thu, 04 Mar 2021 07:26:14 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h20sm10406447wmb.1.2021.03.04.07.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 07:26:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 1/3] user-mode: Use QEMU_ALIGNED() on TaskState structure
Date: Thu,  4 Mar 2021 16:26:05 +0100
Message-Id: <20210304152607.1817648-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210304152607.1817648-1-f4bug@amsat.org>
References: <20210304152607.1817648-1-f4bug@amsat.org>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The rest of the codebase uses the QEMU_ALIGNED() introduced in
commit 911a4d2215b ("compiler.h: add QEMU_ALIGNED() to enforce
struct alignment"). Use it for the TaskState structure too.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 bsd-user/qemu.h   | 2 +-
 linux-user/qemu.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index d2bcaab7413..1ec14010216 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -96,7 +96,7 @@ typedef struct TaskState {
     int signal_pending; /* non zero if a signal may be pending */
 
     uint8_t stack[];
-} __attribute__((aligned(16))) TaskState;
+} QEMU_ALIGNED(16) TaskState;
 
 void init_task_state(TaskState *ts);
 extern const char *qemu_uname_release;
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 52c981710b4..d7815bfb845 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -157,7 +157,7 @@ typedef struct TaskState {
 
     /* This thread's sigaltstack, if it has one */
     struct target_sigaltstack sigaltstack_used;
-} __attribute__((aligned(16))) TaskState;
+} QEMU_ALIGNED(16) TaskState;
 
 extern char *exec_path;
 void init_task_state(TaskState *ts);
-- 
2.26.2


