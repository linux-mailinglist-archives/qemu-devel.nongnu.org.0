Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D9E625D9F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 15:57:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVRd-00076T-HF; Fri, 11 Nov 2022 09:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRY-00073V-89
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:45 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRU-0007xm-Ra
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:43 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso3285106wmp.5
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 06:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WRTLAcdznhrZedskLf6RFnKz3rdvDI3Rrzd5Vwnc2gw=;
 b=Sh+y+Lb4IUJ8Fl45EFZQNU27hNoNU14n3vGgT+9YA1zz9paCMu7U8Q328Qxef61Wne
 BC8Flz2WtUfuniXiVvosYsAHoisSVBa88e1noBrKEGl/EzVwQrVY2zOmHQAlxOzWO2Ox
 WcNu5GMm3crIJJjQtFejExJBAd4oxiafEIvF5fUQ81uNXByuoXh6NfAY/hp+NjL7kikb
 QpLOsto4U6KDHY2b1JwcZcsHnyPB1ip71v0COt/lhjuCDJMZUtfhMKJ6cwvHQsV/J+nF
 A6ORYyCEcWfQvDjSW5dMva8RRsTkWvM7fuElJrLSX3LZufQvQbiLL4BCL/rtfMc3LTYL
 crMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WRTLAcdznhrZedskLf6RFnKz3rdvDI3Rrzd5Vwnc2gw=;
 b=JEzuj3IBXlmKtRF3cFpFRYIHHGpTB0/BbhqTlg6o4Y4LXwu0pZoqWHMtcwAbgLqHrP
 arYT/bUyJ9PZb6LgTOX7DEtoN5i43IEUyUV54cve/4L/lBp34m5Mydo3dl4tW6Qi0HS9
 /v0IGGaKBxLJksoGLdEWCplnCFGTawDEa7Y3uont2KKYULcbu0vG7tl3s28aiTqr08xW
 g71ej3taKSPJ0oYrVyEbUf1SYFdCwgp7C9j95gaU1MIxzpK5fbcl/IJh5w9V2S7ej3/o
 s4C43F2XRdViO+MySFUP7qN4PYOEV/Io5NMNNtJMJQBppsTYe3ajEhj4Mq+ouNVDj/YO
 iAdw==
X-Gm-Message-State: ANoB5pmnPFTTzxFZGXwiRlAgKO82Yh4AriDr89JMLGRAq6n76GNSmq2o
 SuqS+b84vGaecEJoia6ygfKlTw==
X-Google-Smtp-Source: AA0mqf6Z0nAh5HsTF4YT/H6c2lNHrZC90sf9jdSv0uZtxAgjDH5Q88L/zZgiv/XFYhVPVWTN3QEEVg==
X-Received: by 2002:a05:600c:19c7:b0:3cf:7066:cf53 with SMTP id
 u7-20020a05600c19c700b003cf7066cf53mr1492095wmq.135.1668178539520; 
 Fri, 11 Nov 2022 06:55:39 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c16d600b003cf4eac8e80sm3614909wmn.23.2022.11.11.06.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 06:55:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EDCE81FFC2;
 Fri, 11 Nov 2022 14:55:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 10/12] tests/avocado: Raise timeout for
 boot_linux.py:BootLinuxPPC64.test_pseries_tcg
Date: Fri, 11 Nov 2022 14:55:27 +0000
Message-Id: <20221111145529.4020801-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111145529.4020801-1-alex.bennee@linaro.org>
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

On my machine, a debug build of QEMU takes about 260 seconds to
complete this test, so with the current timeout value of 180 seconds
it always times out.  Double the timeout value to 360 so the test
definitely has enough time to complete.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221110142901.3832318-1-peter.maydell@linaro.org>
---
 tests/avocado/boot_linux.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index 571d33882a..2be4be395d 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -116,7 +116,7 @@ class BootLinuxPPC64(LinuxTest):
     :avocado: tags=arch:ppc64
     """
 
-    timeout = 180
+    timeout = 360
 
     def test_pseries_tcg(self):
         """
-- 
2.34.1


