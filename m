Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4AD4A6786
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:07:35 +0100 (CET)
Received: from localhost ([::1]:54870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1JF-0005VS-Oy
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:07:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExnX-0008Cw-6T
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:22:36 -0500
Received: from [2a00:1450:4864:20::62c] (port=44712
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExmZ-0000ee-3W
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:40 -0500
Received: by mail-ej1-x62c.google.com with SMTP id ka4so56674495ejc.11
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PFUAsUoSTLSeQuqg2QwwUHrYnKbfkML1QApeyrZ65Rw=;
 b=zeN6W+lp1n2niGGHs8+E8n/QaxXCaIVFJbsXpAQOIMTkGloY7Pj5t8oy3gAYvycHmZ
 L0r/AM/J3W0YoUQuyfBzfL2wap1ZW9E0wgTi+9Ho5tJgJiv2UcffrruXNvX5ywJuzWIk
 4hxgEGQi+4d+zW80tdTtc7rzn2lYJDNRS1XE+GCkmRIhVlTBZ/yrJOF1EIfWU9EGkeEg
 0RLB7vIhGy1zwjTnHhKcutdTWtDiA9N9t3qPwdr9SvykpgdFtrgdz9jm1L1RI+SLHFov
 4t8jFrlxgY807op+ZwjFuXi0jd8ZQC+nZSFW7UeR4H9clDvcK2dkch11UNmcAk5L4QH6
 Nr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PFUAsUoSTLSeQuqg2QwwUHrYnKbfkML1QApeyrZ65Rw=;
 b=DhNKZUPaF9/w7aSEMO+SCfKOeQd0X9gRCG+8oUrD6QyvdjIrovFNCcbTGcY2foLYv1
 w6QGUBnY5JU8Ld3LiBM9/KLhBcYnnkTy578mJGRQqsIPO8nie3r5IFe4ICtjITG8/yf5
 7OS8Pt8B0qFISrCWhLkF97ObnH2jcPUWfjl3Q9J63z5ibg8yRhbmMq2czURetR58ixS5
 VrQRRx0Fz5a6jFblu5XObQR6oJ0xb6NI6s0xAIda7E9ROD2yxVj1+VKcOypJsk8Oih4G
 r8QqXJopawbBmyMdojiTRF0pMGmosSgJNOeMLoAuOLNLZvZGTqSjDArbb2NQNTBvSS9S
 BXxQ==
X-Gm-Message-State: AOAM533G9Qsmv2JxA0zNzse9IQT4fYOOLcrzplNP+sHMdG/FE/3r9T4k
 Y/yi30eL45omaueqeEhN/dUUlQ==
X-Google-Smtp-Source: ABdhPJxKtNGZZqCh+8f/Sqtbv4oCvF2vVrylj+gEiT5hn5drBLAZOMome4+hZiXQPPemIV1lm8Kegg==
X-Received: by 2002:a17:907:1c8e:: with SMTP id
 nb14mr22122265ejc.323.1643739670081; 
 Tue, 01 Feb 2022 10:21:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w26sm19735870edq.81.2022.02.01.10.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:21:02 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF5D41FFC5;
 Tue,  1 Feb 2022 18:20:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/25] gitlab: fall back to commit hash in qemu-setup
 filename
Date: Tue,  1 Feb 2022 18:20:38 +0000
Message-Id: <20220201182050.15087-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: fam@euphon.net, Luke.Craig@ll.mit.edu, mahmoudabdalghany@outlook.com,
 Gerd Hoffmann <kraxel@redhat.com>, minyihh@uci.edu,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 aaron@os.amperecomputing.com, cota@braap.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org, robhenry@microsoft.com,
 pbonzini@redhat.com, ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Personal repos may not have release tags (v6.0.0, v6.1.0, etc) and this
causes cross_system_build_job to fail when pretty-printing a unique
qemu-setup-*.exe name:

  version="$(git describe --match v[0-9]*)";
             ^^^^^^^^^^ fails ^^^^^^^^^^^
  mv -v qemu-setup*.exe qemu-setup-${version}.exe;

Fall back to the short commit hash if necessary. This fixes CI failures
that Greg Kurz and I experienced in our personal repos.

Cc: Greg Kurz <groug@kaod.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220125173454.10381-1-stefanha@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/crossbuild-template.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 10d22dcf6c..29c3c2b826 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -14,7 +14,7 @@
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
     - if grep -q "EXESUF=.exe" config-host.mak;
       then make installer;
-      version="$(git describe --match v[0-9]*)";
+      version="$(git describe --match v[0-9]* 2>/dev/null || git rev-parse --short HEAD)";
       mv -v qemu-setup*.exe qemu-setup-${version}.exe;
       fi
 
-- 
2.30.2


