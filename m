Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541696647D0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:56:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIiG-00072o-3Z; Tue, 10 Jan 2023 12:47:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIiE-00072M-BP
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:47:02 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIiC-0003aU-JU
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:47:01 -0500
Received: by mail-wm1-x334.google.com with SMTP id ay40so9398088wmb.2
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nybovEkM2L6vVZDAOSUOuJJ5Ue1JCC8gNJeG8SzKrzg=;
 b=KK0BPeJPvh1EOZwTaGsf0twlZy82yJehMBXjXI5cNFQ8Ven9nlLneTLYrMoszY1oVi
 J9iNoMdZYN5Rg0pTRlLye+FYtZLVQYXvpmT5q8q9ZJGqM9hN8i7bnpFiBKtel/EhaCeE
 uE1lfynW2GfXxOSBLI6uE0kTQWDDMWby6fS8keC1wn8xeqR77w93ZNCnHcPEAoaSiBJj
 WEXZCR6InO0CzcPnbgGm3y/vlaQhadcg8Q1ZME9qh4IYjPuUp2mof2SZltVFd7VeknZ/
 fto0NhTsu4FY0Wky578yz2Q7W1WkYSo2w99MfElL7vpT/thLjXMW/cPRvOqagdxB2NCP
 Kx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nybovEkM2L6vVZDAOSUOuJJ5Ue1JCC8gNJeG8SzKrzg=;
 b=bYoDfUiz5FmECDDTR9Sh7FqzYLh3zAzkMs2NyPqcmlaYGoAdg9prQwvEPHxUAsTQUZ
 tGYlOiw/t+6BlFyIC8BK03Q2I4aP27SiWKL64inobFQfEgfMF6lcZo9gOScxPePxWP+s
 ljflWXfR41yCErKu/UdCkblju6NLMKYqp8KltPlLzdYOsX7s+a+hqJD/WVaqQkrgxQrp
 ZwfJibTwBNClnQgEd0jSAWz7F+iy4uziuPjD9oogtZU36OpDCWjv8BidTBcjn+u1rXB1
 9CbRernyLkL14Bzdwingtw6HSV6KmAahX5BYp6iChV8jkderCVjbBGX/J5PLcYGORvjD
 NDCw==
X-Gm-Message-State: AFqh2koQhzHdNlBx39ykHMctQ1oxZvNLoQB3SEcV3hUyDe+es7gQHpX7
 HDJ219i/5nE7EOtSX5ZL+Js4Fg==
X-Google-Smtp-Source: AMrXdXtx/c0rjguUo/MDznRuLoQsS1DJXp+ssFoZuuii/DpCMBz19aKgDmUJwhCr58cz2X2RRFxsdA==
X-Received: by 2002:a05:600c:2247:b0:3d3:4b1a:6ff9 with SMTP id
 a7-20020a05600c224700b003d34b1a6ff9mr50504276wmm.26.1673372819079; 
 Tue, 10 Jan 2023 09:46:59 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a1cf217000000b003d1e3b1624dsm20185141wmc.2.2023.01.10.09.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:46:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A9AAC1FFCC;
 Tue, 10 Jan 2023 17:39:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>, Emilio Cota <cota@braap.org>
Subject: [PATCH 22/26] plugins: make qemu_plugin_user_exit's locking order
 consistent with fork_start's
Date: Tue, 10 Jan 2023 17:39:18 +0000
Message-Id: <20230110173922.265055-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Emilio Cota <cota@braap.org>

To fix potential deadlocks as reported by tsan.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Emilio Cota <cota@braap.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230109224954.161672-6-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 plugins/core.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/plugins/core.c b/plugins/core.c
index ccb770a485..728bacef95 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -500,10 +500,17 @@ void qemu_plugin_user_exit(void)
     enum qemu_plugin_event ev;
     CPUState *cpu;
 
-    QEMU_LOCK_GUARD(&plugin.lock);
-
+    /*
+     * Locking order: we must acquire locks in an order that is consistent
+     * with the one in fork_start(). That is:
+     * - start_exclusive(), which acquires qemu_cpu_list_lock,
+     *   must be called before acquiring plugin.lock.
+     * - tb_flush(), which acquires mmap_lock(), must be called
+     *   while plugin.lock is not held.
+     */
     start_exclusive();
 
+    qemu_rec_mutex_lock(&plugin.lock);
     /* un-register all callbacks except the final AT_EXIT one */
     for (ev = 0; ev < QEMU_PLUGIN_EV_MAX; ev++) {
         if (ev != QEMU_PLUGIN_EV_ATEXIT) {
@@ -513,13 +520,12 @@ void qemu_plugin_user_exit(void)
             }
         }
     }
-
-    tb_flush(current_cpu);
-
     CPU_FOREACH(cpu) {
         qemu_plugin_disable_mem_helpers(cpu);
     }
+    qemu_rec_mutex_unlock(&plugin.lock);
 
+    tb_flush(current_cpu);
     end_exclusive();
 
     /* now it's safe to handle the exit case */
-- 
2.34.1


