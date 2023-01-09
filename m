Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 041B1663462
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:53:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF0yo-0005oZ-R1; Mon, 09 Jan 2023 17:50:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pF0yI-0005hA-Aw
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:50:30 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pF0yH-00078A-2T
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:50:26 -0500
Received: by mail-qt1-x835.google.com with SMTP id s5so5015829qtx.6
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 14:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EEeJP6EVgMNhmVau1DTLyaJxdvdOuqLyFWLUvLLVsSo=;
 b=RQCNhG6T109zfgAhGh/3LaIjrR67KAu4iPnZ9BCNNLoiKQU6HZYual0UC9XFq02hTC
 0RrGyLso88U0tzhKw6t8jyeme/4mKNAwzJ3cC0/Pvw76GXivRjg3mpmRLQvjQqFIQzQx
 ZwRdeXHD/9efoYEpOXMdKd+aWgonoGr62yzFkPvtiKE1SL2fPfK0r/GdPKB8mb3wcgaZ
 aob1fLrYJPsgy9gmp99R28fGp4tGym0iamdLedxlum0Y+RQCNGIXo9lW/cz5gFeLdtFt
 9jebAZoKQ9y8OFNe+R7HbKoIVRSqyCpl06wGT7Je44YGbo337unoqmsNka98J0j9xRmw
 b4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EEeJP6EVgMNhmVau1DTLyaJxdvdOuqLyFWLUvLLVsSo=;
 b=G2Ex/ZSOExHbA7kAfWm3KaspSQKZai/LmHsxQwo7TTqBKAONScROsLetMNjbxnx/PW
 agGHVDO1jWxliKeE56PrsTsUgmW0ub0MnfmkkQwNmD/BnF46RD7RoR61KPStEyqdp94w
 7KczBVcwjedSFCrD3FqxWyxTnYMoYmdThKN76aISv6Qwn8WgHiMkEK+5jm3iRceF1iF3
 ltUfQuxbn0OZ9CzTdZkW/nqfPv9mqeN2cULZ9F1CnRs40UrbS+upIRALTg+Xtn3aDPXB
 p4xS87JHWt1c0/rp3YeVbn0gRktErnamdEgQw6Pvfr1TcOily2qIO1BDfeFy4kmj7WAR
 s6EA==
X-Gm-Message-State: AFqh2kreflokiXWE9DSbT2QUu+0XYWggF/SaofL4WvAd8CB65kHAB+YU
 eV5EatJcgFLnsJHme+f5PkOYwOypi6WRygq8lHk=
X-Google-Smtp-Source: AMrXdXtnx15OOI9s1zvyu6fhkzBKXiuAER8vCXfdfnIEILlJGUpUWkdN73g1Bbzqw7iqNPcQspaaTg==
X-Received: by 2002:a05:622a:5a0d:b0:3ab:cde3:3727 with SMTP id
 fy13-20020a05622a5a0d00b003abcde33727mr27390364qtb.58.1673304624051; 
 Mon, 09 Jan 2023 14:50:24 -0800 (PST)
Received: from localhost (pool-100-2-99-22.nycmny.fios.verizon.net.
 [100.2.99.22]) by smtp.gmail.com with ESMTPSA id
 cm8-20020a05622a250800b003a50ef44a77sm5190814qtb.28.2023.01.09.14.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 14:50:23 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v2 3/5] thread: de-const qemu_spin_destroy
Date: Mon,  9 Jan 2023 17:49:52 -0500
Message-Id: <20230109224954.161672-4-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109224954.161672-1-cota@braap.org>
References: <20230109224954.161672-1-cota@braap.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::835;
 envelope-from=cota@braap.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

Signed-off-by: Emilio Cota <cota@braap.org>
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


