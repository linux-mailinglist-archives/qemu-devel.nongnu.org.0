Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC68E67A0ED
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:09:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNhe-0005WQ-Pf; Tue, 24 Jan 2023 13:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhM-00058C-W6
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:12 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhH-000757-F8
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:08 -0500
Received: by mail-wr1-x436.google.com with SMTP id z5so14717978wrt.6
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nnqCICNfW2qu7mAodap8M+LsKEVzYP/RwmJ73BL6G6E=;
 b=ofwzdK1v8wfxWcAsR4s0aopyilcI6utKnU006iE48p+nqMrtyMS6MEL8mMNF8kpobH
 JiVSv/sTVTU0NYLSUvqi99SFBhydtC+Fpsu1N8TsuMKbt1xGSKW+PvD99+gouq7ptaom
 00QVefF2Ga3AiUHzJwHo1XvSR7Fo9wnWezX9Kb8HLA72ydXAwWauRsg/PoE15Mmb6zt/
 DV5YjPr+jM7auKByOt3yy9GKRYkR5gqD52fKAu5J0zzUcY0MqopCPj/SxbqB+9ybetzN
 MCNyO/vrExNZOo1bGwUKtcG6XGV3BhzZb8VR2w+MINnWxi5wUUoC16oawO2TengXiB/L
 1pjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nnqCICNfW2qu7mAodap8M+LsKEVzYP/RwmJ73BL6G6E=;
 b=4RIe57jVt7IlM5S6lqCgLndkUGEEtYL4VZFKLDcJZJSI/ao03qn2ZqXONZugvc62nd
 VsxQgKUqbyaIchori/kJp6kIQx72BKdjLsZo4aOQ4gVe5ZhJ/39DvB2O0ttG1JhNFVtO
 28PSTBsmGjQdq7Xc1ZJyCtBmrlsfafN0eZrmI3qnXOGgRHhsTERzLL1P9xaG9X/TIOvf
 SUFZ+q7dig8hccwR6f6j18LJasjWjlWmOAdRs9FBUhMWkpNDkivyTkkZ/1rwR65/FQST
 Tb63170b9wxAZIXKX5QWzeAxg5UguepTTfVhb6b5CjGvfKNbQjcNaKHSeyhd6D4spACH
 ZddQ==
X-Gm-Message-State: AFqh2koYb+1sP36gNZ/WgJNjywfzJsfYOm1rf92IOsVRl9ZL9OaPmeom
 55UGymv5EtgTU7hYZVz92rH4Ow==
X-Google-Smtp-Source: AMrXdXvYQu6sFQFHin4jkdwTMO2xV8pESXQgeDDFp14ePdwBBWerXw2NkRXVj6u8GvXa1kCQFNkBnA==
X-Received: by 2002:a05:6000:98d:b0:242:809e:1428 with SMTP id
 by13-20020a056000098d00b00242809e1428mr29624166wrb.5.1674583621599; 
 Tue, 24 Jan 2023 10:07:01 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a5d6dc6000000b002423edd7e50sm2350815wrz.32.2023.01.24.10.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:06:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 039921FFBD;
 Tue, 24 Jan 2023 18:01:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 19/35] docs: add hotlinks to about preface text
Date: Tue, 24 Jan 2023 18:01:11 +0000
Message-Id: <20230124180127.1881110-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Make it easier to navigate the documentation.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/about/index.rst  | 16 ++++++++--------
 docs/system/index.rst |  2 ++
 docs/tools/index.rst  |  2 ++
 docs/user/index.rst   |  2 ++
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/docs/about/index.rst b/docs/about/index.rst
index 5bea653c07..bae1309cc6 100644
--- a/docs/about/index.rst
+++ b/docs/about/index.rst
@@ -5,19 +5,19 @@ About QEMU
 QEMU is a generic and open source machine emulator and virtualizer.
 
 QEMU can be used in several different ways. The most common is for
-"system emulation", where it provides a virtual model of an
+:ref:`System Emulation`, where it provides a virtual model of an
 entire machine (CPU, memory and emulated devices) to run a guest OS.
-In this mode the CPU may be fully emulated, or it may work with
-a hypervisor such as KVM, Xen, Hax or Hypervisor.Framework to
-allow the guest to run directly on the host CPU.
+In this mode the CPU may be fully emulated, or it may work with a
+hypervisor such as KVM, Xen, Hax or Hypervisor.Framework to allow the
+guest to run directly on the host CPU.
 
-The second supported way to use QEMU is "user mode emulation",
+The second supported way to use QEMU is :ref:`User Mode Emulation`,
 where QEMU can launch processes compiled for one CPU on another CPU.
 In this mode the CPU is always emulated.
 
-QEMU also provides a number of standalone commandline utilities,
-such as the ``qemu-img`` disk image utility that allows you to create,
-convert and modify disk images.
+QEMU also provides a number of standalone :ref:`command line
+utilities<Tools>`, such as the ``qemu-img`` disk image utility that
+allows you to create, convert and modify disk images.
 
 .. toctree::
    :maxdepth: 2
diff --git a/docs/system/index.rst b/docs/system/index.rst
index e3695649c5..282b6ffb56 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -1,3 +1,5 @@
+.. _System Emulation:
+
 ----------------
 System Emulation
 ----------------
diff --git a/docs/tools/index.rst b/docs/tools/index.rst
index 1edd5a8054..2151adcf78 100644
--- a/docs/tools/index.rst
+++ b/docs/tools/index.rst
@@ -1,3 +1,5 @@
+.. _Tools:
+
 -----
 Tools
 -----
diff --git a/docs/user/index.rst b/docs/user/index.rst
index 2c4e29f3db..782d27cda2 100644
--- a/docs/user/index.rst
+++ b/docs/user/index.rst
@@ -1,3 +1,5 @@
+.. _User Mode Emulation:
+
 -------------------
 User Mode Emulation
 -------------------
-- 
2.34.1


