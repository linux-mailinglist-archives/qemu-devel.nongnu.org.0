Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9044AA184
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 22:01:54 +0100 (CET)
Received: from localhost ([::1]:60226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5iL-000051-Ix
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 16:01:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5W8-0008A2-A2
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:17 -0500
Received: from [2a00:1450:4864:20::32d] (port=35463
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5W6-00088m-69
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:16 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so1438806wml.0
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fVkkKUQPZonRdh16kBqKNrhk7t0iYwqgp7ZVrXtKCFU=;
 b=b/rEPXmIYzAmCmiIOHuIKjj5q3S8JqqmikGQtuwwOAgnljCeTkRbgpYme9Eil/6fdL
 gdjRYyx9i4YS8oEtHLtXrUpOi1OvwAyrxDtJGyL6dHUaPv5owxFtMdC4fp3yZIlTD6zw
 UZgAMqUIKRPQ6YR/9kkhDtrbuMe7Ve0COueHMDlsUf+ZCX5JU6KdzitWhkvrKuS/wfoH
 DukB5DkBk+CAxkmi4/GawgmiOidJ6amPFW5L4rkDqxNYKnj1x4QzZOTXPl6VOLq4OpQ7
 3jiHJMBcyiLqOxG1AJSWaWjyIND10yBysuBAqzc8LbPfxi8V3vvz+cbRqM1X64p1DdnV
 mnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fVkkKUQPZonRdh16kBqKNrhk7t0iYwqgp7ZVrXtKCFU=;
 b=kDjRsoKLufAB7TzNJQ2Ew/3psKKsM8EFL6rTUqsraafbMOe/pv5Lo5OXzrfpYQPdqJ
 jY2mXa5QJbXgDwoUKzxYQUtj3gofq3lT2w+6h5uR07S7yW0BH3qClDXfrMJ+izAnVxzs
 3o+dZqGXwayi/JYGBsN+M15zOUPWNR8l96dOu8JwmaOBtr8ubLLMbhV/shvWjPC3stf2
 NeOz/GHeVJj/ERZGSDHYOT+26LFQEBrZQ1pqh/OXK5XRfNx5ROjIE7hXKLzxMIPRKtFM
 zGvlDYvyIpAiFYNpxnLuHTOT82yjTObtv+6pspgcPDDXZj0zBThxVNczjvIFeepKqVp3
 T4/Q==
X-Gm-Message-State: AOAM531CQPgxNyDO6eFVYcbe+UAwTCJZFL3zy2xSoK2GjgdRYAq2LxX9
 gLkhxa4KOdkxoy5799ejgvTXSA==
X-Google-Smtp-Source: ABdhPJwhkOiXGYqA/ZubHuCN0EIwp9aAFFw4Xaf7KB9022wmXFsLjdD1MeU4dFm4Qua2eotWqD37xA==
X-Received: by 2002:a05:600c:3845:: with SMTP id
 s5mr3705893wmr.134.1644007752906; 
 Fri, 04 Feb 2022 12:49:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r2sm4234523wrz.99.2022.02.04.12.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:49:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 929A11FFC7;
 Fri,  4 Feb 2022 20:43:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 15/26] tests: Update CentOS 8 container to CentOS Stream 8
Date: Fri,  4 Feb 2022 20:43:24 +0000
Message-Id: <20220204204335.1689602-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Support for CentOS 8 has stopped at the end of 2021, so let's
switch to the Stream variant instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220201101911.97900-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/centos8.docker | 4 ++--
 tests/lcitool/refresh                   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 3abac7a8b1..3ede55d09b 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all centos-8 qemu
+#  $ lcitool dockerfile --layers all centos-stream-8 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM docker.io/library/centos:8
+FROM quay.io/centos/centos:stream8
 
 RUN dnf update -y && \
     dnf install 'dnf-command(config-manager)' -y && \
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 25301f2ef0..4ab90a310a 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -77,7 +77,7 @@ ubuntu2004_tsanhack = [
 ]
 
 try:
-   generate_dockerfile("centos8", "centos-8")
+   generate_dockerfile("centos8", "centos-stream-8")
    generate_dockerfile("fedora", "fedora-35")
    generate_dockerfile("ubuntu1804", "ubuntu-1804",
                        trailer="".join(ubuntu1804_skipssh))
-- 
2.30.2


