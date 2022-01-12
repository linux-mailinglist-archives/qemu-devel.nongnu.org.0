Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3515448C330
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:32:12 +0100 (CET)
Received: from localhost ([::1]:37184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7brP-00061i-5n
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:32:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bmy-0002cq-BC
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:36 -0500
Received: from [2607:f8b0:4864:20::92e] (port=37806
 helo=mail-ua1-x92e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bmw-0003OQ-VF
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:36 -0500
Received: by mail-ua1-x92e.google.com with SMTP id o1so4103238uap.4
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/DtasRe+o9KuWOXZ9yMCpKE6wrAsNP6UFEge6jCLJdE=;
 b=D6Y6h27HBGWN/8q3O5VU76RK50aGNjklmm7F/Wn7bEXMLHv15CNZGoYZBO5dOu6PZ9
 frYm6gpCsVKuIRJxK0v3p+QCktWFjBgxNj+qiXYBPps6cSlArYi6MW4EkXu8tMEzJPS6
 UCqRirno6LviOG3jPtd3i5OwzcioWzh2Pr9TEWCwRSxrvda8oevVjp1DfJUnwtNn5KJz
 5IZOEeIxs1VdM/XxgcWIqIAvKAWuQChgi972ZZ4mR2mKvpdA/WdrufRZUUe6XHwPFpB6
 E7pNejhdrgntFP6Jk8ikbav1rjYTdKIJ0oggx37z0ydw0SOXD298tK0YAMi2Hmou2EoR
 w6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/DtasRe+o9KuWOXZ9yMCpKE6wrAsNP6UFEge6jCLJdE=;
 b=tYfbnHbLI79IkFTXLrspwLGSV0gEcskJRMrL1CZ9ycuE6PWx/HW8xf9dVKTyEV1ZAw
 pxjMYcsaU4vpCz2nfIzFXaKraorC9UV5oBOWa1UdPwNgEDkB7mJ2jPZrDU24sR8PfZ2L
 zdVuNVGruKaIN8KInPCv+wnMmB7Iw1yBsvcv9HRO3B4lPnjnequcMyX0GzPp8SfODib4
 lVUynA/8M5obdBAYVkehrrLEF3SstRZeIGcCsQbpjz6WoPk7x5/nUCefk/e2f7MP1uQ7
 6vlnHv0yACFrKeZ7DIyRFDH/LM18ypbyxMSd96BdE2YcDkLlECVFCVDfaFW6zN53b4i/
 e2zg==
X-Gm-Message-State: AOAM5305kliuXg7iJmWqaGxBh3Z7hcZiGDwZRqqTSTqPLAh+fMldkSyv
 zPJY6gJlPj6oC3KiG/7o0Kfdfw==
X-Google-Smtp-Source: ABdhPJwEMPaHC8+Q7vQl+AZsGQoHI0auKslPKTKZvN0UNihRuUqE1Ogi02GOwAfNqEvt8T96zyyc1Q==
X-Received: by 2002:a67:d891:: with SMTP id f17mr342344vsj.59.1641986854136;
 Wed, 12 Jan 2022 03:27:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x19sm7819572vsh.6.2022.01.12.03.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C0CC11FFBE;
 Wed, 12 Jan 2022 11:27:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 06/31] tests/docker: switch fedora image to release 35
Date: Wed, 12 Jan 2022 11:26:57 +0000
Message-Id: <20220112112722.3641051-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The Fedora 33 release is shortly end of life. Switch to the newest
Fedora 35 to maximise lifespan until we need to update again.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-7-berrange@redhat.com>
Message-Id: <20220105135009.1584676-7-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index c6fd7e1113..855aefaac5 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,4 +1,4 @@
-FROM registry.fedoraproject.org/fedora:33
+FROM registry.fedoraproject.org/fedora:35
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
-- 
2.30.2


