Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C3E5364CE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:39:00 +0200 (CEST)
Received: from localhost ([::1]:41072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuc3H-000387-Gu
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0d-0000KZ-HR
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:15 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0a-0002QL-Ud
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:15 -0400
Received: by mail-ej1-x630.google.com with SMTP id m20so9415178ejj.10
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AbgsYEbqnhfPNsCoKGMFOHJN/gJP3DtbSzUoN2q6Gbw=;
 b=qkE9hyIWSqgVJ/qss0C1ES0UvyN6q/cCYGW0+MPJmkNwf2k7iVY1Vlsj5uzSgEGudB
 1IZfOdTqXEx0Vyy8xSvIBZc7dnHCVNtif5Gh/xuDnc17PZ20fMwEOPd0zaDeZfU+jozX
 54vRyW5HT+7T+uGBrXBRE5bSEMibU344O2P7g63HsVwJAY+Sm1LE2ggtJ5GbIdKKHojn
 0Wrwc4tf8oEv4KYjU3XN1N02CIJ24ct9PGkSvlAPvv2zTd+FGHZsch1aI8KGqbyBiEfq
 yIhoUKk8tdDoMrfrhBiE72GwQG2JcRpHxudFoSV2g/1No3VvgQmnHAc/9P6xsqHi3Mej
 q5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AbgsYEbqnhfPNsCoKGMFOHJN/gJP3DtbSzUoN2q6Gbw=;
 b=R6qpYM5vrm8xypkWvGvNPu1itVHh7v0oP/Ra8FALPeKqza7V6nQCXJ9YavlMV6swtC
 Xc0kk51094hVDrpBU3wvqiSev+KBEz8Xs1Di7ZpQEwzVYXjJLxni9I/68iBvIWHwpxPt
 V4fE5z/mKMXHqm+H5inr4pi5bgG8N/guWwxIP8RC5UYu0bQbAL3Z9fibrHJx2X6Xq1d+
 aM4JFxad/jb7y4eqPQ8Zyb7ydHiAfUt5Lbwu6LBU3+HzQqpg3P0ukXFCCY5yFVPVALSk
 MKBuTKkY7DTj/tmdOeP6y6BC68JeT1MQfgGVuDvo8zZ+qmVI/FgiOBKRsLJnhvJ1IIqC
 4W9g==
X-Gm-Message-State: AOAM531OJoC/H4B28Eo7adGBLJGfxXp5A2M0UU9q/4bX6u3EY4Fwlytx
 guL8AfjPMg0vzxmy8iFlNdlE+g==
X-Google-Smtp-Source: ABdhPJwg/SFd4a3BQRagqJsxGanlcbAzD1fGJTwnnWs9YmH+owc7UFtCL3FJmMNP6fE8z1nIgFgkBw==
X-Received: by 2002:a17:906:e07:b0:6fe:8f00:cb0d with SMTP id
 l7-20020a1709060e0700b006fe8f00cb0dmr38374248eji.332.1653665771587; 
 Fri, 27 May 2022 08:36:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a17090619c400b006f3ef214e6esm1568417ejd.212.2022.05.27.08.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:36:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D22731FFBA;
 Fri, 27 May 2022 16:36:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 02/33] .gitlab-ci.d/crossbuilds: Fix the dependency of the
 cross-i386-tci job
Date: Fri, 27 May 2022 16:35:32 +0100
Message-Id: <20220527153603.887929-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Thomas Huth <thuth@redhat.com>

The cross-i386-tci job uses the fedora-i386-cross image, so we should make sure
that the corresponding job that builds it (the i386-fedora-cross-container job)
has finished before we start the TCI job.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220524092600.89997-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/crossbuilds.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 17d6cb3e45..4a5fb6ea2a 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -62,6 +62,8 @@ cross-i386-user:
 cross-i386-tci:
   extends: .cross_accel_build_job
   timeout: 60m
+  needs:
+    job: i386-fedora-cross-container
   variables:
     IMAGE: fedora-i386-cross
     ACCEL: tcg-interpreter
-- 
2.30.2


