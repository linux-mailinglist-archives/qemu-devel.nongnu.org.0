Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5D2633928
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:56:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQ0r-0002Qo-Nx; Tue, 22 Nov 2022 04:56:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0l-0002I0-So
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:17 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0k-0003YL-2e
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:15 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso10869029wms.4
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 01:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ryh4B4BYlEzwTvoXIsMigdAmBPwQBxFG9jZxylxtaWE=;
 b=hDBg7iMzHf5Bk+QKov4YTd4WalAnO2Fx3HrFwlryIOgVxsEsHh0AHWLf+daXEU7h5K
 5tgO1zvDciP3IuNgB1G8snYHxfmE1DhhGUsYwf+4GWErFvnj+h7A4ClUcN8raMKeG6i7
 C6u8lBA98MH/lExiIjqVsbwayAQnA4z7FF2ctVNg/tY5Ox0BJo9mWZ1rjf0A4TsYC7B3
 GcWXwE0pAV96FXNQ0ZdYH/BrOxjRzgoWUqSKdYZPkQUOUs1/AJ+3L4agayQbvoLJPc3s
 dK6XX44+FwT2tm3te0cj4oHiAPsrRx1BNbfgujgs38LHzKKY31CAEc5aI2jhCL7Xytf8
 RtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ryh4B4BYlEzwTvoXIsMigdAmBPwQBxFG9jZxylxtaWE=;
 b=SbOx8mJNle6vr8dS9eYa42mBHmcoaS+iW3OoDC9G2kh20OcKneWKEqRup484rs3sko
 rqg4sjKkDau6rcwVE46LEIo9Lc2TKHKtUPejh/eMo7WXBq1HrHJmn8DW5BNru0iG9JJL
 7ANChaoxYz189Si6B8T92tNdfHb6EHeBJPetrQ0euR4DWUJZtFj5rTr/q/EJy85UY/FG
 hRs+5IrwYDvmbzAxqvXB0Ps8DQbb0JZtb9iG+fg/+BSbsjNXmXU+emllt6zFM7gqBWVZ
 QvBIgmr1cxVEYRK5WhAeQOfW/PLn8n1d1yw79efUfJdcvjFgAO+Uvy9b1gKyiQP+inM5
 nLHg==
X-Gm-Message-State: ANoB5pkbefVNBJkOgdxj612fa7qgS87BUweDKOqg8Bz7RUt66fcbEorj
 zfxDPQO/1AsnO8CMprdm/lNteA==
X-Google-Smtp-Source: AA0mqf6szWeUCfGEo643mpNoi8yPllN+1/paApEyubNzuMY+ICPWxxPphUURe3ZLrgAFdJYwwmTjXg==
X-Received: by 2002:a05:600c:4f45:b0:3cf:9be3:8d26 with SMTP id
 m5-20020a05600c4f4500b003cf9be38d26mr7712391wmq.185.1669110971663; 
 Tue, 22 Nov 2022 01:56:11 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j15-20020adfe50f000000b002366d1cc198sm13464326wrm.41.2022.11.22.01.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 01:56:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A1DCE1FFB8;
 Tue, 22 Nov 2022 09:56:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL v2 01/11] Run docker probe only if docker or podman are
 available
Date: Tue, 22 Nov 2022 09:56:00 +0000
Message-Id: <20221122095610.3343175-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122095610.3343175-1-alex.bennee@linaro.org>
References: <20221122095610.3343175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

From: Stefan Weil <sw@weilnetz.de>

The docker probe uses "sudo -n" which can cause an e-mail with a security warning
each time when configure is run. Therefore run docker probe only if either docker
or podman are available.

That avoids the problematic "sudo -n" on build environments which have neither
docker nor podman installed.

Fixes: c4575b59155e2e00 ("configure: store container engine in config-host.mak")
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20221030083510.310584-1-sw@weilnetz.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221117172532.538149-2-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 66928692b0..26c7bc5154 100755
--- a/configure
+++ b/configure
@@ -1780,7 +1780,7 @@ fi
 # functions to probe cross compilers
 
 container="no"
-if test $use_containers = "yes"; then
+if test $use_containers = "yes" && (has "docker" || has "podman"); then
     case $($python "$source_path"/tests/docker/docker.py probe) in
         *docker) container=docker ;;
         podman) container=podman ;;
-- 
2.34.1


