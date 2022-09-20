Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CA65BEF4E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:42:52 +0200 (CEST)
Received: from localhost ([::1]:36278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oal11-0000dW-3W
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqh-0000az-Iw
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:16:00 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqg-0000iG-2d
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:15:55 -0400
Received: by mail-ej1-x629.google.com with SMTP id hy2so4106425ejc.8
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HAk1owhoyeWDT/goQ0xeRgqf6zzLI7dtllkknf7bW9w=;
 b=utiXQbCDdOUx1JV+d5f6iI+TPoyPZpLeoJPXEzb7TJKZjKwOBktd7PLWiawkKJGOrv
 MEakAuxGsVT2bPKhORNbdZ1sJSNi00ciZY+bJ2Fe6cqfC8oSZIQpJrVhWzWU8cm+OH8R
 GHTRd7QOXBnlvM7JqGzv6QFGq4lQQSybBiQRp/2y/Kmy6xMOOL2jbiQ77SK5lkfhal7n
 hsC6fx9Yso7SXFIsrS/OKwLDbpi3/9D4VdsxyQPvn0JunNM6eV7qMqi7gd4u26rzNK5/
 DmZIetHpk8Iw8gn230XYDYMFEyxlXhwWkNFwDnFd1mPH8l1nQDbQyXCdqextCDktc0Uu
 /a3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HAk1owhoyeWDT/goQ0xeRgqf6zzLI7dtllkknf7bW9w=;
 b=djGlufrvJ4j9EBCtVdYYxc3v3x2xuDpBNXzGvj8xxm9vHTGRM8vCJtdVayHB22fbVr
 0Vm3MOdc4m/EWnk/7sgtjmUGxmRK8WYSWjN7VgXCBiLGIBSpOBGBGcdbzULqByWgAmEM
 I/Ug3eV1GX25EVP1+aSIQ8kZOws5yCpkFAlSOI8otcdV03ROE6XTsLM8UHnhcuUqAByl
 15rZFJIG+R2lBAS0pfDf7y2VRu0ecGmXZb+wsmMeYBwd5WYag7p0WaJr6tGJBuWwIjwC
 J942yyhNVqRZqD5KhCjjN0kfWplQDKk4RODr9qk7h8+D4RrKibxqmK2NMAwSONfAsm4Z
 tvdg==
X-Gm-Message-State: ACrzQf3kHJXoAUP/XL1IQcr5dSte7o13OIXk9HVhJuGAaPyRFrBQ+r6t
 4bduqUYAM6tW0XM1KcrPlRMXcA==
X-Google-Smtp-Source: AMsMyM5z21Qrzgk9oi3biHGZOXqk986mR2HR51EDUr5RTct5BSCJbrqL8zS8BkE+uVEYEBpL9msf5Q==
X-Received: by 2002:a17:907:6d28:b0:781:c4a3:4a08 with SMTP id
 sa40-20020a1709076d2800b00781c4a34a08mr3211271ejc.280.1663694152184; 
 Tue, 20 Sep 2022 10:15:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a170906293200b007341663d7ddsm163806ejd.96.2022.09.20.10.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:15:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F5071FFBF;
 Tue, 20 Sep 2022 18:15:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 07/30] tests/avocado: reduce the default timeout to 120s
Date: Tue, 20 Sep 2022 18:15:10 +0100
Message-Id: <20220920171533.1098094-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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

We should be aiming to keep our tests under 2 minutes so lets reduce
the default timeout to that. Tests that we know take longer should
explicitly set a longer timeout.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220914155950.804707-8-alex.bennee@linaro.org>

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 5f1d3e551c..910f3ba1ea 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -229,7 +229,7 @@ def exec_command_and_wait_for_pattern(test, command,
 class QemuBaseTest(avocado.Test):
 
     # default timeout for all tests, can be overridden
-    timeout = 900
+    timeout = 120
 
     def _get_unique_tag_val(self, tag_name):
         """
-- 
2.34.1


