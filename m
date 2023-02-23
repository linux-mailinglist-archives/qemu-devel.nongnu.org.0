Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22FF6A0D71
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:00:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDyV-0000kn-B9; Thu, 23 Feb 2023 10:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyM-00009Z-22
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:30 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyJ-0004jg-4q
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:29 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 p3-20020a05600c358300b003e206711347so8604943wmq.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yvuUayscMkC2c3KbAMvmXRQxmgZ4kcV89BQYaBiAfTM=;
 b=ML6CEDPukqzgBuNPO9yvj1A+t4TxArAHh+B/2uyQcRFPtbgmlf11C8EmSNcEJ9xOXY
 fFYfVVvnrtmda+cciKcMsjqHJ7DjxozywbA3syuWtlEq5Gz2eCZ23HR8YBvtePVgg0BJ
 b/DRY2DOl++pAKbulQvzGov4GB7hApRgQWP8t9uHrsXxfII4eGQBD7omPrGusxWRE5s9
 oxFvuIrbyOMhegRlsfll2uATtkpxaJOVuZkUSO1Jj5SC/lQtXlesmP8jgbndUNiTKm9V
 CG58fw8V5Ab13axna6qQKb2mC/CZ8ic1cI6mwoxg9H1uHe/DyKWU+fQNb2fX5cQGgCxM
 vOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yvuUayscMkC2c3KbAMvmXRQxmgZ4kcV89BQYaBiAfTM=;
 b=0AWa7uTvZ/L+wf1NULxq16PWfyTV6GtnGVDp1teA/wQ8AeyXsdaOhvibHZIXL/mfZo
 j2wts+Ez9xHRhpAGDfH/iDmlZa4lhTc1mFeyZ4xte91vLB0gzK1A/9g6ISfVgZ4W/fFc
 U86V5QgzEKG0omIyFgHguxQGNVLi9cRnYKleJ1Reg4EBBFNjQCH9tZGq0f8sjFKmzP9n
 UGC3DofK7pjdA41IvYnG/+VNIdNeJKUi381kCkpG/vSyXiXkXzcHYeiATPZ8i3RPLVdR
 YYKzj4F49j5osDZa/mjMtBl4pDc8uG30bVNjiylFnFWBHtgTQUDnMgWLjkpqUGhDPKgO
 9ObQ==
X-Gm-Message-State: AO0yUKXEuQ08BppVgfsnlDaX0l2EqGNqmw3nmgJSrqPfYHJVPPM/Rd58
 aEeEg6+bbLxw5ZsC5PtpcknNrQ==
X-Google-Smtp-Source: AK7set9HpsFjAFyCBd9gmXXyAnOWAwuqKfBd7hPvEzJwKN5GO79zdH1Vv4/wHJpXMqeyBt6a/pkRug==
X-Received: by 2002:a05:600c:5253:b0:3dd:1a8b:7374 with SMTP id
 fc19-20020a05600c525300b003dd1a8b7374mr9036073wmb.5.1677167845386; 
 Thu, 23 Feb 2023 07:57:25 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c409200b003db06224953sm12888900wmh.41.2023.02.23.07.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 07:57:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94B241FFBF;
 Thu, 23 Feb 2023 15:57:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 09/13] tests: skip the nios2 replay_kernel test
Date: Thu, 23 Feb 2023 15:57:16 +0000
Message-Id: <20230223155720.310593-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223155720.310593-1-alex.bennee@linaro.org>
References: <20230223155720.310593-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

It is buggy and keeps failing.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230221094558.2864616-11-alex.bennee@linaro.org>

diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index 00a26e4a0c..f13456e1ec 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -349,6 +349,7 @@ def test_or1k_sim(self):
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'vmlinux')
 
+    @skip("nios2 emulation is buggy under record/replay")
     def test_nios2_10m50(self):
         """
         :avocado: tags=arch:nios2
-- 
2.39.1


