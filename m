Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC3F664810
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:04:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIbI-0003go-05; Tue, 10 Jan 2023 12:39:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb9-0003Zj-KJ
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:43 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb4-0001Cn-B1
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:43 -0500
Received: by mail-wm1-x334.google.com with SMTP id o15so9366428wmr.4
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ycgI82N5PiT9dD2l3RH+0isxFtJNAT6vrCry8xsNvlY=;
 b=Me7VTXhUqyjA3vz7jjuLGZQGRlNGlVASOmSYtRh3NVlIzXgXWIe572f2gsg/Ey6I/5
 1rOOPiTOC+cwDdraS8cqVmfNU6m+kLHaS7uovsTZ0gfzK/ScGulzlMk3s5cbYcRLFA3C
 LrpUKUSfsBNczhH9OrvTxAYykWxpcX8WgHA4k724A9nv9Ur/CfeXfILWSYUO9v1VmXur
 YptsnJjuozPEXXPuMcRZJg+6kKd5paLb4V7xfBL3eugya7lSH+Nbww6mQwVXbsBEfIjz
 jpF00pWhjLK6W4cn6YWWHe+Rtj8aQn7yrKV1eCBJdW6xK2Ue63jZDO1hO0udsnEaCc+D
 lGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ycgI82N5PiT9dD2l3RH+0isxFtJNAT6vrCry8xsNvlY=;
 b=RjT8w8BhEEO/1dkkUGinfYxSC1fRZm8ADvcUDl0IBsias2WiiNZh6rFa3zK7neaDHf
 PIde7ESbI2oQwM67R/qCEet6UuS+Po26I9+acz3q2umDBlFGYMFL5AJ3WRe3Wiquogj/
 wTcTqi/uvPwRkdDt2yrzPQLN5TCiRpGs4zPeFU8QwvggdM70o8aWh5S2Am6BWSn48SF2
 JvAxS9M+5yVfVqDMtOPBDXpdw+WJg9ZjzLofpKEt4Axib4h8v3EGa7Gozjq251xPOwdF
 yLgrFc9lFjaex9XudjOIDUXImcsIY60irVteFc+X/GdW4QNeOvnFShPo/v0/Qd8mW7ik
 RwJA==
X-Gm-Message-State: AFqh2kq9XENvmRKJsd3kGEsNrf5Go3nhj2ikLqkzw2wbN1HMMg+NHfMu
 8cS1CXyVb/5+/syRZNhq7DVEbA==
X-Google-Smtp-Source: AMrXdXujOnGWUyRe/m5MFUeGHZV+ZrNN9srkoIn7CvsaMNfTVCBvN6L+5mOpuEx3SMTzcZ5qPaEWGw==
X-Received: by 2002:a05:600c:4f8a:b0:3d9:f559:1f7e with SMTP id
 n10-20020a05600c4f8a00b003d9f5591f7emr4810385wmq.20.1673372377613; 
 Tue, 10 Jan 2023 09:39:37 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r126-20020a1c2b84000000b003d35c845cbbsm19782463wmr.21.2023.01.10.09.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7728F1FFCA;
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
Subject: [PATCH 20/26] thread: de-const qemu_spin_destroy
Date: Tue, 10 Jan 2023 17:39:16 +0000
Message-Id: <20230110173922.265055-21-alex.bennee@linaro.org>
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

Signed-off-by: Emilio Cota <cota@braap.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230109224954.161672-4-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/thread.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index 7c6703bce3..7841084199 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -237,11 +237,10 @@ static inline void qemu_spin_init(QemuSpin *spin)
 #endif
 }
 
-/* const parameter because the only purpose here is the TSAN annotation */
-static inline void qemu_spin_destroy(const QemuSpin *spin)
+static inline void qemu_spin_destroy(QemuSpin *spin)
 {
 #ifdef CONFIG_TSAN
-    __tsan_mutex_destroy((void *)spin, __tsan_mutex_not_static);
+    __tsan_mutex_destroy(spin, __tsan_mutex_not_static);
 #endif
 }
 
-- 
2.34.1


