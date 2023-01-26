Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111A567C9E7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:30:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0Ld-0003g3-Bd; Thu, 26 Jan 2023 06:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LQ-0002Yk-Ae
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:04 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LN-0003nc-FF
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:04 -0500
Received: by mail-wr1-x434.google.com with SMTP id y1so1439925wru.2
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0aNvcxOhLZR4Of7Jpv6k8KZIyu+hQ2GNiHWU5ZTeAY4=;
 b=GN44nqVRr+cjhSKi5AUtzpH2ELhMhlSu+bGV/qipCRFaLfnqSlRc7eGRL+jyk7RX/R
 DcmSz1VVTx60ej2q5xCNKdHTnc8IK25KanooLhUkqYJKUc3oKPg3LSaK15p8LX6w4Foo
 VJ2Bvi1/Apfj1zXf3cnvkqp8PIfuSpxO9YwBZfvSIMjreB3gTWUkbJ5UJCtyKFfxlx71
 AMqONPQzLf/5k4ovl576g81nLCggtlV4lUOqHF/TXi6mzgnfoSptGbvJ/5H+0GmRQr89
 Ia+QJTBrkUtNOujie+O1+4vFGQATSl8Dnld59ODoNrone0Got4DgYE+WLhBwl94BMUQt
 8qgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0aNvcxOhLZR4Of7Jpv6k8KZIyu+hQ2GNiHWU5ZTeAY4=;
 b=sLAdn7Xv8+Eqn6MGiJA9gSSNQP+q73+9XpwuOwQmesVd75EzGoiYjEbZC/wZSqesbd
 zvOyQHU+h2qThgT7ZG7g3VdBMXjCD4K3wc3oqoDBcxnePgPaQBaKmJv4emycJSQgu7mR
 A4O4PRqntVNFn86WywrjpzRydIL9tI45C6DI9OLMX7LirJ7VmfvUkDveM2GOrsFn4Iww
 xSiIDiVuKFqwqDgAru1HlaSYu027zfTbUFZcph3UhcZhjlmO9u325LtnAOPoblAIfzhi
 FhCSq0IdIqaIQF1tdCyOzh+4DQmXOitn7O8IBdvQhYZ6SYCvP86KlPi20oLfyzwCymXh
 Y2XA==
X-Gm-Message-State: AFqh2kq8DaXSvfJwkqgC+cTFF1HHysRbZN2box9861SeTT9zlAEHpi05
 548M7CsWyl47jueQZyroztxttw==
X-Google-Smtp-Source: AMrXdXsHaK7QrMbTQvzf2by90v0IbPsQme3NGOYf2I9qUDa7e5KO6XIrMFIyad2Gq6eZWNuVklOm0g==
X-Received: by 2002:a05:6000:388:b0:2bd:d34e:534d with SMTP id
 u8-20020a056000038800b002bdd34e534dmr36226124wrf.27.1674732180630; 
 Thu, 26 Jan 2023 03:23:00 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c7-20020adfe707000000b002bfb0c5527esm1022131wrm.109.2023.01.26.03.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:22:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 458AD1FFC0;
 Thu, 26 Jan 2023 11:22:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 14/35] tests/docker: drop debian-tricore-cross's partial status
Date: Thu, 26 Jan 2023 11:22:29 +0000
Message-Id: <20230126112250.2584701-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

This image is perfectly capable of building QEMU, and indeed we do
that on gitlab. Drop the DOCKER_PARTIAL_IMAGES setting so we can also
test the gitlab build locally.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230124180127.1881110-15-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 665ddde518..bfb0dcac21 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -128,7 +128,6 @@ DOCKER_PARTIAL_IMAGES += debian-mips-cross
 DOCKER_PARTIAL_IMAGES += debian-nios2-cross
 DOCKER_PARTIAL_IMAGES += debian-riscv64-test-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
-DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
 DOCKER_PARTIAL_IMAGES += fedora-cris-cross
 
-- 
2.34.1


