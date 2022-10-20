Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D70606153
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:17:21 +0200 (CEST)
Received: from localhost ([::1]:41318 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVPy-0003m4-79
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:17:02 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV4W-0004ij-Sd
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU64-0002dr-P9
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:30 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU5z-0000o7-Jn
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:22 -0400
Received: by mail-wr1-x434.google.com with SMTP id bv10so33914526wrb.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mFOnT1sMtXBnCTZImDBtlQzxhw9rMaTtI2H9oXB4Uf0=;
 b=FblwjFzi8QQuoCkr39VUSN3IIwX2HVQMj9vxCNWWCBW/E7KfsKZqoS1e3YYl+BZ74b
 gVM6dNpXWw+MQZzQn8/B4M+qvSdfE9dwQ88C+k+Sm9t1KeYDqnE0tvih4xX014o9iUtV
 /pbEUvR2j+2Hsz7VYZXzEOB5+BnqjmiUBxDSxXjON8WALyY0rCj6gCXc1M01FRE5ASR+
 YbT5ItMgDtnBXCIPxza1MtWR9oeRxWpNmOPxfnBp9c5e/8NhmN8kcXBLtyQj5FVzrkQM
 k9UBtft/73tMV8zjsnxKA33A9fJR44ekAlfNSbV2iShRuEsT1/EHeSb2j5XHocnrG24Q
 KiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mFOnT1sMtXBnCTZImDBtlQzxhw9rMaTtI2H9oXB4Uf0=;
 b=WuA4OpPWZBWZqmg2OPeOLi88xe10Ko0DhLA31PV+rds0XZdNvHB4CE872CPkI4uiam
 yBWm8Cg8yThHaQV7TP1LxcJBUiFXXgBb0ZuEO85n+79KEfAcbomexz8aYDMsdrqn8+r5
 4CplOh6FZ5czCMFaZqhaLzuZFrtqFi6x4+7nTD0Sng0YFdwRm6kBwNkXHigP7B3z8E+Z
 mfEiFi0AnbgqPSsDf9lT2BojZAPTkFWZxlMmG0ReVC82G24AMBQ7ztswF/QBvjle6lUE
 z98YtY5R2Sq3t/mLrrn9+H7ADKISv/3IaoNkR3m3pzkztxEYzjZOLUfz4Q9mYn65jk3K
 /xfw==
X-Gm-Message-State: ACrzQf3p5+xYitDe547iWNawn5BspDnAzWFfaPTAq7sbP5Vlk5a1mcna
 37cTgXYvICLr+D1WA1ST4E4o7w==
X-Google-Smtp-Source: AMsMyM64JVSblADUU2A6GLGvUtP4cRGT7TO8hXPHVbopRM9ifKZgkgkkHpjSEhEeGuikJfdw3f/fxg==
X-Received: by 2002:a5d:4248:0:b0:234:3216:7659 with SMTP id
 s8-20020a5d4248000000b0023432167659mr4047406wrr.488.1666266736165; 
 Thu, 20 Oct 2022 04:52:16 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b0022b315b4649sm16317229wrr.26.2022.10.20.04.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:52:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9954C1FFBE;
 Thu, 20 Oct 2022 12:52:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v3 06/26] tests/avocado: extend the timeout for x86_64 tcg
 tests
Date: Thu, 20 Oct 2022 12:51:49 +0100
Message-Id: <20221020115209.1761864-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are timeing out on gitlab.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/boot_linux.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index b7522ad3a1..571d33882a 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -19,6 +19,7 @@ class BootLinuxX8664(LinuxTest):
     """
     :avocado: tags=arch:x86_64
     """
+    timeout = 480
 
     def test_pc_i440fx_tcg(self):
         """
-- 
2.34.1


