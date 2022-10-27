Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36936610173
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:20:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7tV-0005sC-Hp; Thu, 27 Oct 2022 14:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7sK-0005V4-ID
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:10 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7s5-0004jJ-K3
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:07 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so1867898wmb.3
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tCjfONgEu+tvaIvxZWmJK94kg2ccUmGB7XoiF2hazEQ=;
 b=kmfzOckwUEN114WLrbuw85WVaYP5/S6fzrxzTDoVltQD5TV2nz0YMmqBECRcclAw8Q
 Od2AXjloDmyMdyJCwkaofRt8zXvFPnjEVieCh25usJYd/35xp3VbILAxhIOS5QcauXyN
 XpOXuSJ3kqC3j9lOOmsk/7P9YuIq1mQB78W2s6pwJ+63l5agH3ZMWw9XgqiLpMZFLkti
 QZtj8DIYfn/MAJOAzK970gClnOO3E5F46f4i4z47+fVO79+9yHFarjumWyp3hJdMju0z
 HTVojKo0a7nKIcA9dbDyFMWOeq2mAtOCZAnxgTNAipLwVGEyRNxeQRuEal+h+arGtQGu
 CF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tCjfONgEu+tvaIvxZWmJK94kg2ccUmGB7XoiF2hazEQ=;
 b=Qm7Xi811Z/MHTbuO+HukPhuLbQRADlUiT531iyTwdUok/oVBl91vvLDFCeWw7QNPUD
 xQJ8N3rx4kYH7yvJlfC96E5OL565tSCuruqj//q/2Syq/6x4oF8frmFZyRC0gLDqA7YI
 QrOYIRF1iZnkD9cL7vPrUr9AqyEBjwcbqOjNodygS+h0Vz0euH1hlYd2NRU1Gttj/gw1
 +iiBdbdConrl1ySPR8H/ohFYrzwKVl37ijt27v9AghdXslUZVQaUvXLfEIhJb5Cr2K52
 PDxmFXWMpxavkCXHtCDReVgvTyJBV7bBbiExeltXq1+m+OFVHTfk3oxM2AUqVLpvM+QA
 0kuA==
X-Gm-Message-State: ACrzQf2xW8RSvv/kYSzObSsQx5/Ql6ZDAoZj9dWyfYnNmXsw7YGA0a+J
 JmZaGwSFN9LS14yA5vIAf9bS+g==
X-Google-Smtp-Source: AMsMyM4ISiOHubJQDZYkZUqRE+h6bNORgX/wptIv6mxebz7Iy9aQUv1e5LqVdOiW/cUSvUAtjIWvew==
X-Received: by 2002:a1c:2743:0:b0:3b3:f017:f23a with SMTP id
 n64-20020a1c2743000000b003b3f017f23amr7236377wmn.137.1666896292162; 
 Thu, 27 Oct 2022 11:44:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c3ba900b003b4a699ce8esm6424668wms.6.2022.10.27.11.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:44:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0BB6C1FFC9;
 Thu, 27 Oct 2022 19:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v4 18/30] tests/avocado: set -machine none for userfwd and vnc
 tests
Date: Thu, 27 Oct 2022 19:36:24 +0100
Message-Id: <20221027183637.2772968-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These are exercising core QEMU features and don't actually run code.
Not specifying a machine will fail when avocado chooses the native
arch binary to run. Be explicit.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


