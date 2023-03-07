Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0BB6ADD59
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:30:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVUy-0007Hr-Nu; Tue, 07 Mar 2023 06:28:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZVUw-0007HD-Vt
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:28:51 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZVUu-0005gK-9W
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:28:50 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so757501wms.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678188526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NpHgHHJcO9P9YY4y05zXj+B7UDNA2tYv+R1DwR2UQ0=;
 b=LDOhaUxAR+lE9e9uOQ4DrQ8xtL4H+V0Mq5qjEATE3EcyEoWE0CN7ARVyxZl5cCRhD9
 2JqXf6skriwPvRTC7w+8DCIeNgpCSeuvzrPaRYXzBiNp7lggEZQeESfX9+3SPcxDPiOF
 YIUGUTl5GmiFPKNbY00Nnr40E3A1pymHgDI89JVx6/rfoN2iZTXrXGbWhqOMvN1Yv4Pe
 w1ocXTez46XorcVExritLrskAdAv1mAAknlUS9MK/q/zh5+HICh+/ORP2eqAYjbFT0tS
 1OY5YYwYEeP5hkeETCd4WzsA0M54ZS9TnSq28txFc2Pyw55HARz59AQqMCKlMerSMULs
 UgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678188526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NpHgHHJcO9P9YY4y05zXj+B7UDNA2tYv+R1DwR2UQ0=;
 b=A0GYk1oh8GyTpI9Vb59vTO18eEpLcrnSi9JZFx+uD4fZLO6RTucsY0yPFTNJByp16p
 2o1dhUfcraAaY51VgYEyx//mbLUXBCRMACGY0kcZScjqN9pvcZXt9AR5JaOKg9FDnmR6
 bOIc4tzmHX+mjdE5ZRY0enunZsxtJeX76bhUcLXYBG1ZeX+9Fhb1sViyhfL/81qRquxl
 mbNE2gR8ISI/MC3Xj12eipIKb6TQXeqH+EdopRNnwc4dGUq0z0Gy2UAbNGnsT30VR+a/
 GtLR30uwcCM8clOexq/OD1pMEFcs15pbi9JYpMyr4Fuqmh5PTu8NCYxQA1lDfMRHU4Rd
 sqng==
X-Gm-Message-State: AO0yUKXbP9jHT+7CAtSADYbMYxDyYQJFNfVSj9p/MoHsaaJI68w/g6ou
 ZD3szTYAHIAwYLal2k9aM2XlfA==
X-Google-Smtp-Source: AK7set/j9ovj0CFUUtv3ykxWrPRvhqbtXL2N9dsysSaUAlaQ0uFTi5LvTj/bxwKZiR+m6qk7FlHIGA==
X-Received: by 2002:a05:600c:3b95:b0:3eb:2da5:e19 with SMTP id
 n21-20020a05600c3b9500b003eb2da50e19mr12222106wms.27.1678188526577; 
 Tue, 07 Mar 2023 03:28:46 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c30d300b003db06224953sm12347034wmn.41.2023.03.07.03.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:28:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B4A491FFBA;
 Tue,  7 Mar 2023 11:28:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: kvmarm@lists.cs.columbia.edu
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>,
 kvmarm@lists.linux.dev, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests PATCH v10 2/7] add .gitpublish metadata
Date: Tue,  7 Mar 2023 11:28:40 +0000
Message-Id: <20230307112845.452053-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307112845.452053-1-alex.bennee@linaro.org>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

This allows for users of git-publish to have default routing for kvm
and kvmarm patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitpublish | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 .gitpublish

diff --git a/.gitpublish b/.gitpublish
new file mode 100644
index 00000000..39130f93
--- /dev/null
+++ b/.gitpublish
@@ -0,0 +1,18 @@
+#
+# Common git-publish profiles that can be used to send patches to QEMU upstream.
+#
+# See https://github.com/stefanha/git-publish for more information
+#
+[gitpublishprofile "default"]
+base = master
+to = kvm@vger.kernel.org
+cc = qemu-devel@nongnu.org
+cccmd = scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback 2>/dev/null
+
+[gitpublishprofile "arm"]
+base = master
+to = kvmarm@lists.cs.columbia.edu
+cc = kvm@vger.kernel.org
+cc = qemu-devel@nongnu.org
+cc = qemu-arm@nongnu.org
+cccmd = scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback 2>/dev/null
-- 
2.39.2


