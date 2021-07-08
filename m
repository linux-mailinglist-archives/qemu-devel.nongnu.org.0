Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196BB3C19BE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:23:32 +0200 (CEST)
Received: from localhost ([::1]:59908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZcR-0002e0-4W
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPJ-0003SX-9h
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:09:57 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:46948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPF-0004n9-CT
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:09:57 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so4709267wms.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X6XYeRZ0RRlPFd/72iPoC9h0a9yGfi2XY4pmA13N9sM=;
 b=AukL+zxr98vjE78dHRflnNM72T2N4ziy1hDnwtQHmq4X8CJFJHZDR2E6vVIjTzx6Wn
 2ynoAEIttMwJl+NsV6zJ09I0KenrLf9iSfSWDB+s2VFKlMZS4c5cQ2/o6W/6uFF4GqqG
 1L/uTw43L1r90H6hmYEaEeU/d/+L64aCDaFzaWpZslruPAAFy42XQ2d1jmf0p74RZ5E6
 QhDiHUbmGRZG23SnKkGsqeKsgd98dsbvmq8LIaNTUN0mKjmo9IVyH2ZePe13FxVI8Nzy
 R+Qhd71UOTnAjEberw0usUP//zf3y4soMTRLixrallFPm9mSo99uA52aQYdntzaspXgT
 ax8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X6XYeRZ0RRlPFd/72iPoC9h0a9yGfi2XY4pmA13N9sM=;
 b=BMy9xbdhHD0RBT3ssYO+mrKCKKmN4esK0o/GVngqu0jGIFNwcPt1aQ+T7JSI5LlZtT
 rlMIMMIClecYxlUP08HCO5oY+hwFKiHBNovNGayIqTI+3yqeH3TSyFy/YTvyV88OlULy
 3UOo9/yjkW4p3AzjjMGb55YnpHuq619Pp780lRU+OI7b+UKhhkR1v4SwvK9SkiVIgsWT
 LSDgrQBHrQTC3p+idqgsoJ3/qG576qg2rsHKpydNxlwKxOqNRts8vjLGM7it5eABIQdR
 s7aRNH2HmiBMCAGFnl2FCBlSrG4+SFQUADmwTqBBo9StDUx4UdYCHP4Ui1DBnthCdlZv
 wpnw==
X-Gm-Message-State: AOAM530RDNw2vKvicnJ15d6Jss3ouSX9KHfqN3cQbVUkDWBohhNsum9D
 gPfnmaMOESFVrNjFG1w4QQuVGQ==
X-Google-Smtp-Source: ABdhPJy6vCjcvDQD/dCk7cGDlxHLzB97OZTRchAxrL1t1th4fUmftbPBfaZdNcUfPp4gbzr8xwOXwg==
X-Received: by 2002:a05:600c:b48:: with SMTP id
 k8mr7089444wmr.180.1625771391276; 
 Thu, 08 Jul 2021 12:09:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b12sm3026194wrx.60.2021.07.08.12.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:09:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 828741FF92;
 Thu,  8 Jul 2021 20:09:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/39] build: validate that system capstone works before
 using it
Date: Thu,  8 Jul 2021 20:09:08 +0100
Message-Id: <20210708190941.16980-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Some versions of capstone have shipped a broken pkg-config file which
puts the -I path without the trailing '/capstone' suffix. This breaks
the ability to "#include <capstone.h>". Upstream and most distros have
fixed this, but a few stragglers remain, notably FreeBSD.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210625172211.451010-2-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meson.build b/meson.build
index 7e12de01be..2748721d71 100644
--- a/meson.build
+++ b/meson.build
@@ -1641,6 +1641,19 @@ if capstone_opt in ['enabled', 'auto', 'system']
                         kwargs: static_kwargs, method: 'pkg-config',
                         required: capstone_opt == 'system' or
                                   capstone_opt == 'enabled' and not have_internal)
+
+  # Some versions of capstone have broken pkg-config file
+  # that reports a wrong -I path, causing the #include to
+  # fail later. If the system has such a broken version
+  # do not use it.
+  if capstone.found() and not cc.compiles('#include <capstone.h>',
+                                          dependencies: [capstone])
+    capstone = not_found
+    if capstone_opt == 'system'
+      error('system capstone requested, it it does not appear to work')
+    endif
+  endif
+
   if capstone.found()
     capstone_opt = 'system'
   elif have_internal
-- 
2.20.1


