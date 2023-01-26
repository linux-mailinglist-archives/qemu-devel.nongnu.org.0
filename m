Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B73B67C9D1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:25:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0LU-0002o8-Qv; Thu, 26 Jan 2023 06:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LQ-0002ar-VH
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:05 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LO-0003xG-JQ
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:04 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso892431wms.3
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GF9se++UjGrzr3Ah8eYjy9RktgyOzceFa3Namz4fGRk=;
 b=LWH67R+mfM5N4NGO8rgEssBi7GnPKw8Az5Pi1xeugpYKeByDnfm6l4QXnLhHjIShv6
 TOayhhUQM5efoTW/1T/81WdcwkaA1B/Wbcfgvv2agHLkDIFf3ALF6wPxqw/YLJ0pQgqT
 W7DNuadjoGQlUqDPDqXBU6PLp5bDQ2Js1R9nO/3ujmTN7lKXnaIO7NdhZgAoxNNIp+OF
 LDMT6MXH46RalGpoqUi5rFOUtLEYbPmpIF5DqoH2eY/x3NmJlPBmiq4Bpmv7ituoyFii
 221ZvHvrE3lSXGaplKZCmQsBE9Xy4pv8GifMpsQ5OfbzKprn5bius9M2MBU6rixb3Je9
 aZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GF9se++UjGrzr3Ah8eYjy9RktgyOzceFa3Namz4fGRk=;
 b=GB9v3kNZMjZV+6MOCs7ufyDpRvdMRS0C6GWpHAnPOO9ceDGj/sF0mHitYkO875Hy4O
 d2M+h1xas/FcpNmfpg+TIpUWxV1dUXs1xM40qzyi7UFDBFIbgKYOSlY5esNmrC64us7k
 scxKuYdAgLPj/6yPnF0mxxtavypfMEGfpDmgezLY+LlFhe4dZeXfcocSBBXzOYPLtV5c
 b/yTDyZ3XXZhuOmAvOBPMR+t8xeJModp9QOHOhrdedUoYWaSU3jNIzouJYGFlzWTQofE
 GZwGrk9sS4FTmhNdLw0dBKqLItdpZf9vJEdQgJFgwBzG7FXVAZhbQPL/7pN2wAP5+RC2
 ZK7w==
X-Gm-Message-State: AFqh2kqXurYhpWLtlFjY6f5QZ84u+yr9J2tcIbti5KTWU5BEIi0JgWUe
 AXYOi7M44e6J8axaRmZmX2J3jg==
X-Google-Smtp-Source: AMrXdXs6Y16ILBTeH8OfDnAtI+u75rZvxxRloZfFNjflqu9B1rlcB20E3LCEbeTYP/15Hz6YK2TSCQ==
X-Received: by 2002:a05:600c:354a:b0:3da:1f6a:7b36 with SMTP id
 i10-20020a05600c354a00b003da1f6a7b36mr35460025wmq.0.1674732180979; 
 Thu, 26 Jan 2023 03:23:00 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e38-20020a05600c4ba600b003db11dfc687sm1175625wmp.36.2023.01.26.03.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:22:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 79E4E1FFBD;
 Thu, 26 Jan 2023 11:22:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 15/35] tests/tcg: skip the vma-pthread test on CI
Date: Thu, 26 Jan 2023 11:22:30 +0000
Message-Id: <20230126112250.2584701-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

We are getting a lot of failures that are not related to changes so
this could be a flaky test.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230124180127.1881110-16-alex.bennee@linaro.org>

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index e7213af492..ae8b3d7268 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -42,6 +42,15 @@ munmap-pthread: LDFLAGS+=-pthread
 vma-pthread: CFLAGS+=-pthread
 vma-pthread: LDFLAGS+=-pthread
 
+# The vma-pthread seems very sensitive on gitlab and we currently
+# don't know if its exposing a real bug or the test is flaky.
+ifneq ($(GITLAB_CI),)
+run-vma-pthread: vma-pthread
+	$(call skip-test, $<, "flaky on CI?")
+run-plugin-vma-pthread-with-%: vma-pthread
+	$(call skip-test, $<, "flaky on CI?")
+endif
+
 # We define the runner for test-mmap after the individual
 # architectures have defined their supported pages sizes. If no
 # additional page sizes are defined we only run the default test.
-- 
2.34.1


