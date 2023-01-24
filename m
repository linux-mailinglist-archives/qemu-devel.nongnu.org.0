Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323BC67A0D5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:05:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNcR-0001eJ-Cu; Tue, 24 Jan 2023 13:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNc7-0001VB-FR
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:44 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNbx-00064X-OZ
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:43 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so13401845wml.3
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U39jLFPoVGl6SC7W57LZvwPqPrIa2zguvlEGBzL8cVM=;
 b=PkbOHkYcDPVegzNOh2HQEAwvzZv6S/GvaK0b+ihacX7i3IiY0UJAbCQPkkgnJVReUV
 gzEULKtiz2eHCML1ADz8QLXIZnbarkuhbuDlM+hjXErm5mKm2sKcUYnz47MUr3qlnUSa
 jFu68jFmF+1dWBduceaHqF14JHL8mTDUdIronwhINgd512IUQ8EeKnUi8JIECkLwZdAg
 vcXi3dUZ7XgN1bKtE3Wt7QE8pMI5QT9AcWQwqI5J6knd1cGDH7NhMJYdkuhpruBhRTWi
 MwhN+Hh5w4S9w20SpLoUA3raZspSnlNmXBFEpuF05P332bg3MNK8m6HyCY+kYtrqSDeP
 nf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U39jLFPoVGl6SC7W57LZvwPqPrIa2zguvlEGBzL8cVM=;
 b=2DUmDQVaXtdkAca7e8i3ZcjJombpU/IyyFGOa8xD9JuPenau8lWttHdVio/psaYAFY
 YQCG+2bV5qOuiqCHRBi/bU6EpiyNm6UliWimWkLVmCAu5S0jaapbGAUddOcY9iREcewo
 G1yKRyma/zvH7Pi8hLQ4Xr/nP1qyaaetvg5dIKBqnAsdvpOvgtsUXv8ItWIIk+KtiPZB
 5aTWtqN/Y+Sv876ZvfGhIrkT7K0Xa8MI9lRkRc8wmLKN/IKjE7e+avYzLW5UaOo87aCL
 K9fw5bYnjYUItxzaLxxSzYIsHn7A5G0B0QlutM+b3TLPeJnFgG84ad/boCe3lRmGgRY9
 pSGg==
X-Gm-Message-State: AFqh2kpdzIeoGKIn53bRPchMi9QQhz9WcYiWR+4A82512JcXW/I6wigH
 ctEBk6cYuHgB97UcRZPzhNzlxQ==
X-Google-Smtp-Source: AMrXdXvrJuFhk+7miDmU48CV1P8/k/Ww4Cb8jkBELAlanhuPfI0vd0Hpt9960atZi41dAKQpJnlXew==
X-Received: by 2002:a05:600c:a4e:b0:3db:14d0:65be with SMTP id
 c14-20020a05600c0a4e00b003db14d065bemr24396599wmq.34.1674583290176; 
 Tue, 24 Jan 2023 10:01:30 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c350f00b003db0b0cc2afsm15523598wmq.30.2023.01.24.10.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:01:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CA5F81FFBA;
 Tue, 24 Jan 2023 18:01:27 +0000 (GMT)
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
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 02/35] gitlab: add FF_SCRIPT_SECTIONS for timings
Date: Tue, 24 Jan 2023 18:00:54 +0000
Message-Id: <20230124180127.1881110-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/base.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
index 69b36c148a..50fb59e147 100644
--- a/.gitlab-ci.d/base.yml
+++ b/.gitlab-ci.d/base.yml
@@ -6,6 +6,11 @@
 # most restrictive to least restrictive
 #
 .base_job_template:
+  variables:
+    # Each script line from will be in a collapsible section in the job output
+    # and show the duration of each line.
+    FF_SCRIPT_SECTIONS: 1
+
   rules:
     #############################################################
     # Stage 1: exclude scenarios where we definitely don't
-- 
2.34.1


