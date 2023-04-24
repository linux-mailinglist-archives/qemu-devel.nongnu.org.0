Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8696EC8DE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:31:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsWY-0004IR-9i; Mon, 24 Apr 2023 05:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsVr-0003wZ-5S
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:29:37 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsVh-0006c4-0E
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:29:32 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f87c5b4635so3814086f8f.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328560; x=1684920560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZgFhfTtj2ImggRREYrxhpwQ3q5LfEc+IwV3JjKE3es=;
 b=YoHXJyTXBLh66AKNwBrJIHCyO5HhkmWA2vTLeHJFL6MeKV5saOk+RdLFuoKF2unXET
 ggWa+Mz3afLpqnsc2iK0h+EnvejTZk/99rz6SOhhzwKdyFsmwCoK0XR5lFzGDtLRZaZO
 3dO13kgjX1t4FoqY9aCNTLVhgM7PWXLoWMOwK1FK6HEpl26n4A+4Jbxez7QuCWuaREIS
 33B2kZ6Dh/DXuA/+eS1BwxN+h6qwEdEIg9QMXJbNXpA3Welut4CG/lPJ0U796c8GlkbD
 r66QpUBKCjS+I7n+SglWr336alW7Rwf3ocjxuXgWZsqFIJpDLBDdNxeRy6Zr276wZ8Sx
 T5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328560; x=1684920560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KZgFhfTtj2ImggRREYrxhpwQ3q5LfEc+IwV3JjKE3es=;
 b=JmjWB5HpiGM+yt5j3R8ybJZRR7Cg6Rja0s8+LJcLlVfS9qrGHcWKrjPJXIuaCGG6Be
 XUVTjRAr8qFwFA7I0+cc35FBYIsmj9kPXjzdwmzb7t7AZBEUney0AiHUH9RH6yc8Z4JF
 3lxuDaDCwrMnJYXK+IvY3rUCRODr57Kf500C0BzypF0SHE9GVv+Nt2FuRdTqjejZ+hZU
 5u3GjgFZ973JkWfDOag9utNLUa5IZcPm1Vcrn+nzYov6W49Oad3B2o7zVeWVOLoDZbT6
 QVnqUfCGOAAE2hkvzf56w0AVgFrDVy1kw8kYLEbI/EGcz3d0EAzrIb2M948/XP4AgX18
 eL+w==
X-Gm-Message-State: AAQBX9e4/XqXCEv7hRbOPZsc9c/gUvQfzqXUGAkAwwY4zPiKDjTxj5zI
 IWlCRSrttt4Qx6xHmeRjFbW1gQ==
X-Google-Smtp-Source: AKy350YVvKB5XqgLUMz9d84prBmRhsBqo/TpZLCZwTJ4xa1t9uqdp1lTdhzNyq9esWfwUIHBFzm2kA==
X-Received: by 2002:adf:ea46:0:b0:2e5:31a3:38d4 with SMTP id
 j6-20020adfea46000000b002e531a338d4mr9218447wrn.55.1682328560215; 
 Mon, 24 Apr 2023 02:29:20 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a5d5643000000b002e4cd2ec5c7sm10337523wrw.86.2023.04.24.02.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:29:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 543721FFC6;
 Mon, 24 Apr 2023 10:22:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 16/18] docs/devel: make a statement about includes
Date: Mon, 24 Apr 2023 10:22:47 +0100
Message-Id: <20230424092249.58552-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

While not explicitly disallowing header macro abuse (because that
would make us hypocrites) lets at least address some things to think
about.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20230420155723.1711048-8-alex.bennee@linaro.org>
---
 docs/devel/style.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 68aa776930..5bc6f2f095 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -300,6 +300,20 @@ putting those into qemu/typedefs.h instead of including the header.
 
 Cyclic inclusion is forbidden.
 
+Generative Includes
+-------------------
+
+QEMU makes fairly extensive use of the macro pre-processor to
+instantiate multiple similar functions. While such abuse of the macro
+processor isn't discouraged it can make debugging and code navigation
+harder. You should consider carefully if the same effect can be
+achieved by making it easy for the compiler to constant fold or using
+python scripting to generate grep friendly code.
+
+If you do use template header files they should be named with the
+``.c.inc`` or ``.h.inc`` suffix to make it clear they are being
+included for expansion.
+
 C types
 =======
 
-- 
2.39.2


