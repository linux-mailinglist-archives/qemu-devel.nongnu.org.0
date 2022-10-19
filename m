Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4969604FCE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 20:40:26 +0200 (CEST)
Received: from localhost ([::1]:38616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olDzN-000662-Vt
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 14:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olDxt-0004gY-8G
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 14:38:53 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olDxr-0000i8-Im
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 14:38:53 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u10so30576376wrq.2
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 11:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HhtKHrwe8bfrPHZsmspzGeyOQdxHSYHZqbTkDpCte/4=;
 b=kZS/F65n9RqCSUYAzlxNNFB4LQFhiBFj0QiZhUQ81I18EMBN9NMZ7KSl0oQyKG9zWm
 VFP6Opj7pCxKBInJrv0QcQXraqiSc2EZhTxIhvp7y3qZ2MkNbUSozuTcA/Tp4IRH173F
 mD6lKelqypwL09K2lSiS0TCbjr903iGHOyyx8xJZ8itNabyjSZlp3lmFootu8xc6kg3A
 E+HqhpT0T3gEoK24PmrXHRCuz3yJSZ5D1TR5TZxUBGX337iGNhxqekwz/pZ+DH54KwvT
 tH0rwLVVSPYDg6w3bF05f6B+X7A1fdc0JyxIjJ/azwTLG0j46y9L5II6plM084M99QdZ
 k2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HhtKHrwe8bfrPHZsmspzGeyOQdxHSYHZqbTkDpCte/4=;
 b=wGSnqWZ9uYs6jLFsBg13/kfyFwOZS/wuxf+TaWw83VLbhu06QCEYNASUpP43si2SM/
 4U69ewJ2cTBE+NVw5/siYhzFygzAwAAfYphIjmx0TvhclPG2hE3u2bXJo5G/3YpTQl8G
 xUdFpqP9d/aN+5cBOFOoYgNWzmy38CVO+/m1x/4J6m9M36MMgvDAiFZJUD6klxyxSKPh
 uMZfqFKZWlFihYMqy+UYvGtUBi/ZGz8pWdgZk1gxPXnL3X5Q8qJD5OrXtTpGjivvtGHE
 e3N/UUdoQ9jIuyZZw1tIE+ACuKv4xkj3ttUkfVzbOSt8kPgptp0/wQWnyc97Ia9tpfMd
 U4ew==
X-Gm-Message-State: ACrzQf103KgWxJyMG3/IfmxtGdgsiI4V173r2ub6HHbOEJeQPebjhTL/
 wXwi5i3bcBR9dkKyaWD0n0/AEQ==
X-Google-Smtp-Source: AMsMyM63Rbe4zWH6gVFV4KsYAGuiI1pEZus64ifBmIv78P8BHyvCiUZ98ra197QsU1nd/1j5fJtWOg==
X-Received: by 2002:a5d:50cf:0:b0:22d:f2f:dee9 with SMTP id
 f15-20020a5d50cf000000b0022d0f2fdee9mr5805680wrt.529.1666204729825; 
 Wed, 19 Oct 2022 11:38:49 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m8-20020adfe0c8000000b0022efc4322a9sm14330900wri.10.2022.10.19.11.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 11:38:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3B6CB1FFB7;
 Wed, 19 Oct 2022 19:38:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] tests/avocado: set -machine none for userfwd and vnc tests
Date: Wed, 19 Oct 2022 19:38:45 +0100
Message-Id: <20221019183845.1269404-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


