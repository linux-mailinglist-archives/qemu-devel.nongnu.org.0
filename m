Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3F03BDA53
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:37:27 +0200 (CEST)
Received: from localhost ([::1]:32988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0n8Y-0004Sm-40
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mox-0002Of-E4
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:17:13 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mon-0004qv-Nw
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:17:07 -0400
Received: by mail-wm1-x329.google.com with SMTP id n33so6339185wms.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ENyXaMzzV2Ct/ffxbfGuryIh/2WlVNyrhj+GTD00beA=;
 b=KxJKHU/f7yEJwpqEW449SsFDo6m7RjtifVdsVK9VJao7cQqdlB/tDotiUqtYKrIQeR
 O2VORTWBkmeBh+RIEK7KupT06DSA4qDv2eu7ma4LizEbOIYFtZcAr2VEjOisfPQMkJWj
 040KqwNB1gLs1p2oZ9gdGx+gNa6BM8GAn5ZJ+wjBh+zF86/z6iWAERMQde/BbgWUvrRh
 nR7VO3cYIs+YqPuKZybk0YZy/x+cpCvbcHDZJ6lX4R971twfrBZvH+lithkl61rtRT2B
 9Pe2urmdDU1QWDJq968ob8Zk1L0z1EpY0YEk5TScwiJn84iq/pxtS9lCcd+YnHQT2FhS
 zriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ENyXaMzzV2Ct/ffxbfGuryIh/2WlVNyrhj+GTD00beA=;
 b=ApcehMCe+qF1Q7jhg/Hl4UPBhS+wXzhSRxFalMxx7+Lgp9WH/gBfcVU6e/Bus5w0av
 ImMqat78B6nDy+GuDxqTE6rVbsIennVSvuzyN+aqnIRg31LeI6BbgqdaLjR5bovXwYTE
 jyN5owU19DMbEZ2dgyWiUPCMIcnwqnDjkafDiSV7o1usHFhT5OhU1RwMxgRFoCuncBUT
 ZcMvNCiOmLxFhiAdc7jSR3Jzp1AJUApNepmeMU4T78CSPKEMRWkdqEAACku1MYuUmYaK
 sgjowgk77Nr/HCmZKrCIWTvPLQ8xMNO/ICDrKtzGNZjmSpMGFJ0f4b7mp5Z/AwgpTWQp
 L2Ng==
X-Gm-Message-State: AOAM531U/MjHlw6TdWxSlQJepb6ilooZCdD9fPe46Twan8xuY13vlAl6
 vvG3ODyKvAxYwZguni2to1H6kg==
X-Google-Smtp-Source: ABdhPJwl+AjrloMotHme5eJQ0EKlP58BzESkeIX3U2+S1ImHXLIE0TxqL/OPPoCuIUeXKkrZZmgIqw==
X-Received: by 2002:a1c:38c7:: with SMTP id f190mr21476013wma.30.1625584619967; 
 Tue, 06 Jul 2021 08:16:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u15sm3431687wmq.1.2021.07.06.08.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:16:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E8B161FFB4;
 Tue,  6 Jul 2021 15:58:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 29/39] configure: don't allow plugins to be enabled for a
 non-TCG build
Date: Tue,  6 Jul 2021 15:58:07 +0100
Message-Id: <20210706145817.24109-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 650d9c0735..44a487e090 100755
--- a/configure
+++ b/configure
@@ -1098,6 +1098,7 @@ for opt do
   --enable-cap-ng) cap_ng="enabled"
   ;;
   --disable-tcg) tcg="disabled"
+                 plugins="no"
   ;;
   --enable-tcg) tcg="enabled"
   ;;
@@ -1509,7 +1510,11 @@ for opt do
   ;;
   --disable-xkbcommon) xkbcommon="disabled"
   ;;
-  --enable-plugins) plugins="yes"
+  --enable-plugins) if test "$tcg" = "enabled"; then
+                        plugins="yes"
+                    else
+                        error_exit "Can't enable plugins on non-TCG builds"
+                    fi
   ;;
   --disable-plugins) plugins="no"
   ;;
-- 
2.20.1


