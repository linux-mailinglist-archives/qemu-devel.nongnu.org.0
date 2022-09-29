Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF025EF5A7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:44:51 +0200 (CEST)
Received: from localhost ([::1]:43022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odsuI-00024k-1m
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw6-0004Nb-09
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:39 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw3-0001CG-Cb
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:37 -0400
Received: by mail-wr1-x42e.google.com with SMTP id cc5so1752117wrb.6
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=65+UILTR2n+02yVdRAJfamHM00Ug7ZaNlHVk2cPv0CI=;
 b=EUyUrP/jB1ZfwthM3GxK5bM9MVbytMEpXXAYEqJ5YnfuO+o72OL8lTaKhgA9zCubMI
 uGUwfa2RNvfnKz595AiaE4wlo+jgUNr4Fbj9byO9pFJdhKamyyknfmTEDfX1flvqOcMf
 zKqXuR6stLjHV+POPD0YhzOF3+5sKdHDZ9Dj4arJtc6Yce+tAjIzYkGu+MhkaOvPor8R
 1HckpqUpxkylkbLJxcIZQGGLAhaKazs7skHOE9rSyotUWekXoGg1wt3iOfZWgM2pec40
 oprkeq1qccKPK0UaZxeY9tFkMmRRPrqSoCDRof6VNWggfCB3SDJIijcmk7g4qzXAokb1
 aaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=65+UILTR2n+02yVdRAJfamHM00Ug7ZaNlHVk2cPv0CI=;
 b=2zwwd+jTPqsHIF1qyx3B/CQJCTimy9Dvmt4nuCB8eE/OmnkrtVJiXWI4LSZ5e2AEKr
 ZxbdQwz/GYAalNbClmLE5OgVd1RgfAZvUWDsPYT/KZTiSaSS+qDMrKDAxbnuMcVfQHK+
 iXxNTrRX2sGVmDbqmktulhSa+iUbK+O3urfPikbv8QHx2imFZH8QQryMCupeWvJBmmpM
 j8CczEYPZ0hkUfV/FVAiCA5PEd7Yk8bK6OoXzyo1YToR69W7gAfixZw+Av0T/qyhns/Y
 7yqZGlTXHqiifRiDJDYBabpO7grljvWEByVd8pQ+mnNXthz1iHeOCOgAt+MJiWD6CQ9T
 MNBA==
X-Gm-Message-State: ACrzQf002rNDgQRNZ6fUqp/RrzIz3QH7B8SHHHZY6k+Oz8M1xsVFOLqy
 tvXseof9J/azrNzzkZr3LhLcoA==
X-Google-Smtp-Source: AMsMyM5RWpOlLyjQzb0KfxL3xDBKWR4OPHNt/PCujEJM60s3AsNtpgJi6dnHqnVCAQqM0eZOnOkQ3w==
X-Received: by 2002:adf:f78e:0:b0:22c:db44:31c9 with SMTP id
 q14-20020adff78e000000b0022cdb4431c9mr888309wrp.609.1664451754069; 
 Thu, 29 Sep 2022 04:42:34 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a056000180d00b0022ae4f8395dsm6506206wrh.96.2022.09.29.04.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 817F01FFBB;
 Thu, 29 Sep 2022 12:42:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 03/51] scripts/ci/setup: spice-server only on x86 aarch64
Date: Thu, 29 Sep 2022 12:41:43 +0100
Message-Id: <20220929114231.583801-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Changed build-environment.yml to only install spice-server on x86_64 and
aarch64 as this package is only available on those architectures.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220922135516.33627-4-lucas.araujo@eldorado.org.br>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/setup/build-environment.yml | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 49292715d3..b04c2b7cee 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -160,7 +160,6 @@
           - python36
           - rdma-core-devel
           - spice-glib-devel
-          - spice-server
           - systemtap-sdt-devel
           - tar
           - zlib-devel
@@ -168,3 +167,14 @@
       when:
         - ansible_facts['distribution_file_variety'] == 'RedHat'
         - ansible_facts['distribution_version'] == '8'
+
+    - name: Install packages only available on x86 and aarch64
+      dnf:
+        # Spice server not available in ppc64le
+        name:
+          - spice-server
+        state: present
+      when:
+        - ansible_facts['distribution_file_variety'] == 'RedHat'
+        - ansible_facts['distribution_version'] == '8'
+        - ansible_facts['architecture'] == 'aarch64' or ansible_facts['architecture'] == 'x86_64'
-- 
2.34.1


