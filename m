Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8320561014E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:14:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7nE-0002X0-Gx; Thu, 27 Oct 2022 14:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kN-0001Qb-30
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:55 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kD-0003Kk-Ts
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:54 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 i5-20020a1c3b05000000b003cf47dcd316so4808558wma.4
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SSV2M2TaOkBz3H1pNIrEz9QmnZN3kQHHfUnFpNuFNFQ=;
 b=IytWpcs5g774MG4w1ubP9s2/GSeJUwkSVlutiuaub9cjb10gPNliADmrWvTbEF7Vd8
 sS54fIJ4iX/WzyOnObVrSGT7QaZvykkdztG0dgh/jDmtuuSl9N7B0DCANq15AfdGV11y
 s5fqyzzXsmiPkZNrZdo1G1zHIfqoNrP+zNu4OidZsQo6PN/7yMtsbVBwesqGSMZZzVwS
 ksfNos2hUlc8+seIwNpgEHqFkKvpPY4knA+GigbeaTjWD2QwoZR6Gm8i7e1UhUk38qH6
 J3LwJR24HBQnbSQl6/tynbcEhBqT7j9HQiE1lxYX5zb4hEexDPZb/vmi8dBeAg+pH079
 gQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SSV2M2TaOkBz3H1pNIrEz9QmnZN3kQHHfUnFpNuFNFQ=;
 b=VIjdLofngJ39wCOBtqjFDndwyRmgTaGrDPfmizw5id9L+Xyzs8EcavYhKzNnG7q6WC
 65rEeSc7rNFVTvzrzxSC+0XPvc2PQpERf0zOOwH22SBCvR+AVJMG2gMTv3hO9jH5uFlp
 VDxSQPP2XWThjLKAv5m3+S4Zm5yoT5PUwutfOYpIe71SJfTgSDFhgm2bwitUTFwymvon
 rxCt71HGSjd/6Ngt7tLhwxAsGN2CJjyWltsLcs9rE7b7zFdqRm4rPAI5MXy/1MzV8kqV
 g3FZ51blVyf+2OSSO0VssKw0k8FKylGeNOyhtbQLIbIVzwg/84hrEMbNYx9ldMF1k6cn
 erwQ==
X-Gm-Message-State: ACrzQf39VdVgtS5G/AOZR441/dZJWkqNqf4/VyUm7csvFAj7iAs0C2OW
 TfKJezhy5oP4jD596gvjFKEoWw==
X-Google-Smtp-Source: AMsMyM5oCPY78GnqXmkLUC91009v9Ga0KUXz6iI40lnl+bojgCWIwe8arZwfA6dVdk8sVdH73a/5BA==
X-Received: by 2002:a1c:7c15:0:b0:3cf:5c5c:ab85 with SMTP id
 x21-20020a1c7c15000000b003cf5c5cab85mr50939wmc.175.1666895802823; 
 Thu, 27 Oct 2022 11:36:42 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b003b4c979e6bcsm5916117wmq.10.2022.10.27.11.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:36:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E4F791FFBE;
 Thu, 27 Oct 2022 19:36:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v4 06/30] tests/avocado: extend the timeout for x86_64 tcg
 tests
Date: Thu, 27 Oct 2022 19:36:12 +0100
Message-Id: <20221027183637.2772968-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

These are timing out on gitlab.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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


