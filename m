Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5758B584E68
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 11:54:09 +0200 (CEST)
Received: from localhost ([::1]:35724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHMh5-000193-Bm
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 05:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMAA-0002aP-8N
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:20:06 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMA8-0005u5-ES
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:20:05 -0400
Received: by mail-wr1-x436.google.com with SMTP id q30so854310wra.11
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 02:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3+NpxIpzMd8EaSUovyVTudU9VX9fAuDK9cF15HnV4cM=;
 b=M4HoVgdjZjAN8oxiUVLLAXR2iWxq5I0yWDAZVH7Vtsq4FLkS9zy8o0JVtE9CWr2hiE
 EiL+vf3cq+6PdkHTsBD8yul5m3GvlB/dq/D9H95NMqyTdehAj8fHKvXc1pAZhq6izSfP
 PgCcMKA/NVVvlUgGps2t8kugeJsulaZYJXnLS8oldT3+K5UpdTKq/MuM7JAM5uz2yZY7
 5o+xnUBYpNXT1xBd8BqfvNeRgowKhyZqoruG3DqSt1B2HwRr7rnRcpFvS90LOeTLQjWC
 nm0yhiixayNuGh9XyXsBcPO8Aca90BEX1wjbm7QbjmXj+TH+l+iSb9xQjdSG9PCqY5D3
 HcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3+NpxIpzMd8EaSUovyVTudU9VX9fAuDK9cF15HnV4cM=;
 b=P8lsWBrB7as1NfBr/7Hm2zPA4QDTusehYCiCewjwS1TXXCsQHpj419bFiLU1DYI5ek
 Ka4D0VJqB5RbbapENQK0LDTdpSVotyt48UvpyVF/bJzChbk4df9zYNfsWGvQ5PkAOwoq
 jYrNOdjY+vfgMikxFnuMERVPoBpe0xVy6XDZN4PGbdo99eUfGLmRj7mptRkiDOh/Yzbq
 fu5BY2mhX5PNDLZq6kvDC5xaW7vmZ1yfyRIw6vRyMo5+5NXye6O7vXN0iVCVnlTY/Iqm
 DEBrxGxbsmU4tsQEbSwbUnpGkpi1kzhcLLFbZOfoUwBOva7XOVcPxEeRxmAycWyLMK3s
 kPTw==
X-Gm-Message-State: ACgBeo2c/bR5XB/JFecj6x14tEzbgKSGSA5HFob3lTDJYf9QjicdRXUS
 hUgE/hPOh0ZYfTxK56jXYlGYqQ==
X-Google-Smtp-Source: AA6agR7nWnUze/+WcXZF4/NseNkA18Irq4uyynz4qQqfVHeTy+KgoFPbnVy9dOyS/6YZE+LoNCFYPQ==
X-Received: by 2002:adf:f94b:0:b0:21e:46fe:bcdb with SMTP id
 q11-20020adff94b000000b0021e46febcdbmr1711588wrr.143.1659086402362; 
 Fri, 29 Jul 2022 02:20:02 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a05600c3b1700b003a30fbde91dsm8834245wms.20.2022.07.29.02.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 02:19:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D538B1FFC4;
 Fri, 29 Jul 2022 10:19:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 12/13] docs/devel: fix description of OBJECT_DECLARE_SIMPLE_TYPE
Date: Fri, 29 Jul 2022 10:19:42 +0100
Message-Id: <20220729091943.2152410-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729091943.2152410-1-alex.bennee@linaro.org>
References: <20220729091943.2152410-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Since 30b5707c26 (qom: Remove module_obj_name parameter from
OBJECT_DECLARE* macros) we don't need the additional two parameters.
Fix the documentation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220725140520.515340-13-alex.bennee@linaro.org>

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index e5fe3597cd..0cf9a714f0 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -292,8 +292,7 @@ in the header file:
 .. code-block:: c
    :caption: Declaring a simple type
 
-   OBJECT_DECLARE_SIMPLE_TYPE(MyDevice, my_device,
-                              MY_DEVICE, DEVICE)
+   OBJECT_DECLARE_SIMPLE_TYPE(MyDevice, MY_DEVICE)
 
 This is equivalent to the following:
 
-- 
2.30.2


