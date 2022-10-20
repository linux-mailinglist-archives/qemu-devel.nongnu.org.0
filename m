Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03546062AB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:16:41 +0200 (CEST)
Received: from localhost ([::1]:41882 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWLf-0004EF-7i
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:16:40 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVyW-0008AA-9n
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU6A-0002ez-VU
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:44 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU64-0000nF-J6
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:30 -0400
Received: by mail-wr1-x432.google.com with SMTP id v1so4719359wrt.11
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhtKHrwe8bfrPHZsmspzGeyOQdxHSYHZqbTkDpCte/4=;
 b=DeX3LE1XlBcuDOJNgg9qdt9g7wgtszXmWKJZtAqa4sloxwDcpas/1FnwLhzCz5te0s
 cl1/Gwew8WwLne58KrLUflPZ/KxqI7bT0NNWTzhtPyGqPqbm0lpungNWYXDDaDdW0yAD
 eT9m2l9JKwET9v+KC19v+WDJY/PZ1LFqlGb59ZfoCej5Nlm5y9uYwCp9oJA+hKguuJee
 Rib+XZNrJF5IUvWaLS2Q4UpdgVBAIPwUEp6ZDHagAgFFrFvS6WfK1+dRhl2NWx5uhvSA
 CVSbCd9idHJDMAkAcJVjQRZMgs2YW/ek84o2drvV+stU6B4y3dUTbW1PZ1LE5X83AhS6
 fFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HhtKHrwe8bfrPHZsmspzGeyOQdxHSYHZqbTkDpCte/4=;
 b=1RyZt/3iHIFk3WOButuaiiSzXqQGaPbShg+qKGvMbOMPaPbp+jXaU2UZS+DXHnK1cu
 dTzz7IlElhuhOPgsntk1VJbpixZcE6Wzs/GX/vj8wT0AkD7lvWVU940+qzFCyMmT4K8h
 V3BBRsoQi00Gozk+crOo7ioZS776ZG7aaMt2F11tfBu7uQZSdF38RfISI+iTS8L3yJB6
 hg4sc9XY9X58uyu3k9GRBe+YiL2hjP00YuUlt3OtRszp5WH+7dA8HT9P3D9Pru8H7ZdG
 Fo/UEoDb00U872yYDg7M5K+xH9eWo4tRyi2ktxjIrsfJ+VPx0qoeyFfNrZDTrPeB2AaR
 //PQ==
X-Gm-Message-State: ACrzQf3q21LAlWD4W+ydFQfzocT7ebzxhWbTsQuZBKdxcB3YGJFX8iCE
 BWRGy8Z3OC0b+pBIBvK+HIbV8w==
X-Google-Smtp-Source: AMsMyM4yyk28lbvj9djMi7ivbQL/yCBMih+RGJOZjZ+WQVsYf+BhZsXl11mbHU/PCBOJcgOpIHn57w==
X-Received: by 2002:adf:fe42:0:b0:22e:48ee:aab9 with SMTP id
 m2-20020adffe42000000b0022e48eeaab9mr7917678wrs.501.1666266743284; 
 Thu, 20 Oct 2022 04:52:23 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a05600c19ce00b003c7084d072csm2802124wmq.28.2022.10.20.04.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:52:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B53951FFC9;
 Thu, 20 Oct 2022 12:52:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v3 18/26] tests/avocado: set -machine none for userfwd and vnc
 tests
Date: Thu, 20 Oct 2022 12:52:01 +0100
Message-Id: <20221020115209.1761864-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

These are exercising core QEMU features and don't actually run code.
Not specifying a machine will fail when avocado chooses the native
arch binary to run. Be explicit.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/info_usernet.py | 3 +++
 tests/avocado/vnc.py          | 1 +
 2 files changed, 4 insertions(+)

diff --git a/tests/avocado/info_usernet.py b/tests/avocado/info_usernet.py
index b862a47dba..fdc4d90c42 100644
--- a/tests/avocado/info_usernet.py
+++ b/tests/avocado/info_usernet.py
@@ -14,6 +14,9 @@
 
 
 class InfoUsernet(QemuSystemTest):
+    """
+    :avocado: tags=machine:none
+    """
 
     def test_hostfwd(self):
         self.require_netdev('user')
diff --git a/tests/avocado/vnc.py b/tests/avocado/vnc.py
index 187fd3febc..aeeefc70be 100644
--- a/tests/avocado/vnc.py
+++ b/tests/avocado/vnc.py
@@ -53,6 +53,7 @@ def find_free_ports(count: int) -> List[int]:
 class Vnc(QemuSystemTest):
     """
     :avocado: tags=vnc,quick
+    :avocado: tags=machine:none
     """
     def test_no_vnc(self):
         self.vm.add_args('-nodefaults', '-S')
-- 
2.34.1


