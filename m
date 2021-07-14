Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653403C8776
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:29:53 +0200 (CEST)
Received: from localhost ([::1]:59926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gpc-0006k1-Ch
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geS-0004wi-3M
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:20 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geL-0002Gb-Je
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:19 -0400
Received: by mail-wm1-x32d.google.com with SMTP id w13so1819248wmc.3
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4DWU5y/nf061VnY3HK74lTL314WIvo/gGKxXixXNuyA=;
 b=Ao7X4aFnvfpm8GaOuAn1cLdSY44kL0YNxlsojzWJVXCuUtzGHqb+YJCDDaJ7T34hUy
 ZprGaguFtT4gN1UTXHtoInnj4qlDw0pLk3LWIp2IjUgQroOQ6dF3NxxcEf+e7A5/xL8Z
 lZ+6pBzBl1jwaHDhs0wBlXriwcVDDLChMqloxUTaGJ5KY/Dr775XhgQ3c8TIhjX1YzEq
 2xr6lp//XR1EMr/2tjTaeDQxkJpWq1XAVojKXlqV1DkZHhdupAO9A0qzuf1fXDLFInqr
 FD1e/pz4AchXW21Z9fwCr9gEyyFPZC9hULbn2tV/yrQARxgd1QNhrSKMEwB205dZYYu/
 C4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4DWU5y/nf061VnY3HK74lTL314WIvo/gGKxXixXNuyA=;
 b=Q5ZI4p7VZRKY5T1IAMJk95Sd0pNjp/FcD1ZhRaMBon8YQnn4Ja6tw6oLwnWG8es3V/
 MwZLPpOxAJ1btYJQNkHQ2ySzTi6D6CoPWqhJ+ecPoxEhy8zUYX5XJxQmbrPo/pNkb9uc
 QBNFp8sOHLST8FlGZ0XvW2V4W4A8T14/YHB2kv3OwHZKNYIhoDugKzDCWXUlsVBlbvCp
 X7f0V/h7K23OexYbSe2uaOwUQBKFBOV5l66JGuZ0T65T9YS+Vd5paccSs6g5Hfm4aMBM
 7Zde1nBl7ZZ8BSU+QkRRDF9f9ShW+14U3Bs2xf+YFXjFgyaE2Qv464uYZC9nrWU0yJ5M
 llfw==
X-Gm-Message-State: AOAM5300kb0r7HGNXSxnJUbUCX711maGq+nPfyMDRh0V8mzXvK2eJSNh
 bjI9VarWo23G2kkHY/AF50Wmfw==
X-Google-Smtp-Source: ABdhPJy4JAI8y1+dc09YpYW/+dk3m+ADXchj+7oZPuw72Nm8mQmD6Veup5VSFN5Ch5eHCzQX2m/VxQ==
X-Received: by 2002:a05:600c:b42:: with SMTP id
 k2mr4864832wmr.45.1626275888711; 
 Wed, 14 Jul 2021 08:18:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g15sm2331264wmh.44.2021.07.14.08.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:18:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC6341FFA5;
 Wed, 14 Jul 2021 16:00:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 17/44] tests/docker: fix mistakes in centos package lists
Date: Wed, 14 Jul 2021 16:00:09 +0100
Message-Id: <20210714150036.21060-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

mesa-libEGL-devel is not used in QEMU at all, but mesa-libgbm-devel is.

spice-glib-devel is not use in QEMU at all, but spice-protocol is.
We also need the -devel package for spice-server, not the runtime.

There is no need to specifically refer to python36, we can just
use python3 as in other distros.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-8-berrange@redhat.com>
Message-Id: <20210709143005.1554-16-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index ee52305646..5f1c57b4ad 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -21,16 +21,16 @@ ENV PACKAGES \
     libgcrypt-devel \
     lzo-devel \
     make \
-    mesa-libEGL-devel \
+    mesa-libgbm-devel \
     nettle-devel \
     ninja-build \
     nmap-ncat \
     perl-Test-Harness \
     pixman-devel \
-    python36 \
+    python3 \
     rdma-core-devel \
-    spice-glib-devel \
-    spice-server \
+    spice-protocol \
+    spice-server-devel \
     systemtap-sdt-devel \
     tar \
     zlib-devel
-- 
2.20.1


