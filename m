Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B20267C9FA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:32:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0UE-00052l-D9; Thu, 26 Jan 2023 06:32:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0U8-0004bt-C8
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:32:04 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0U4-0007nn-4U
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:32:03 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso3048301wmn.5
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y/TiS+4tqDBwIwjrw4zNyDX1puegvZLYhxI4wXR7ikA=;
 b=mIC1QYV/4deeDlFHTKHGkTHjkRS+15YrKTdotMr/AsOMqZF6nZcCzevrHO9TvMKe9q
 pRkhyvH8gK4BkJI66rSVUDS6EcZ8+j4hdMR1313m4U4f9NCSTp+sykF87hLbR/n0M3ZM
 xRUAqKBxZ0gjGGKJD0/2F/Q4tIRM1ddgdBMRQd7vmRkF3frOpQwwdiK6POAXEKgDUUoP
 jIHlXDClNXC2MGts6ZmvbyQlPzarOaaNr54Pykaz5nNafjGzB6hvJUuZM1GWde8+ebDM
 EKSPXVTTNTlJQQwpGkns8Jb733WRJNIMs0X2S+wn4nojGt0kkhZcU71fdDzr7r3Tl+VV
 dlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y/TiS+4tqDBwIwjrw4zNyDX1puegvZLYhxI4wXR7ikA=;
 b=tVJH+WtjrWRRSXnH82gl/kSAzvmddrFgE2jdTNHb7wMqqRSlYRE7nIcUvmYJZ78QGc
 MK9YTEkfe+yUWfY2G6/+V+0OjfUt14CmUAPmjErSZ/xlBwP07YqciXETRvmebWOV14nF
 nuH7Z+FgRxnMd/IeAqawqXEbmfBwhKAf5iN3x/Q1ALZQjRqwjQxzaqmyZrdkQs5teUPw
 hPbhQpbZZRjz3oMijZnQxmrARBZLyk0bpw1xukjTLU7DkaW1tF4s3uc/K08iyG4iyDVS
 RvYPlm+R17hdoFS3PHCaoympe5MKviWxqvErfDpbnM9HWK0wn+ojFgloJ8A8fRVoxzFA
 um+A==
X-Gm-Message-State: AFqh2kre8IpRt606uNFm7uKzt6uQf91zSTbkGEsJCfBizjjO8e3AQQE6
 83PWbTPDXZw4cfThCk/HcOFYc0dMvXdF2kAA
X-Google-Smtp-Source: AMrXdXsVOJFrMbDQyJUCZkY5wI8Ny+AI1+4CGcYpxsq+OYTOhK2D4PS+8zkJxE9k/dZY+Nw22+snyQ==
X-Received: by 2002:a1c:f617:0:b0:3d2:191d:2420 with SMTP id
 w23-20020a1cf617000000b003d2191d2420mr33473508wmc.7.1674732718479; 
 Thu, 26 Jan 2023 03:31:58 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a05600c2e0700b003dafa04ecc4sm1188580wmf.6.2023.01.26.03.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:31:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6F5341FFB8;
 Thu, 26 Jan 2023 11:22:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 19/35] docs: add hotlinks to about preface text
Date: Thu, 26 Jan 2023 11:22:34 +0000
Message-Id: <20230126112250.2584701-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
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

Make it easier to navigate the documentation.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230124180127.1881110-20-alex.bennee@linaro.org>

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


