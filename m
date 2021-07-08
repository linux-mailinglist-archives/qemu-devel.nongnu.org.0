Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA773C1A00
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:42:31 +0200 (CEST)
Received: from localhost ([::1]:55956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Zuo-00067O-8b
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWi-0002rw-EQ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:36 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:42936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWf-0007Zp-Vv
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:36 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j16-20020a05600c1c10b0290204b096b0caso4723568wms.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mr82V3RANAgu55hmStjZWk0TQih73s6qJMB8WUffM3M=;
 b=s86eB1bFEpGTxc5M/zeZ7jtC5TfAENxK+etuD0OqFKXM/mCGr41X9b8I3V5cMKIww4
 AfLFRgLpQ5JTY1gXSaUfS7cHFVaP1un5YCTR21IJU5m8zuGblQ4EBQYVh+8KjeRhmZai
 KVjfjfR6D9+Qkp4jC85z8eb6WXsHw5jA3FC94MTAceVzys5uKRx/JQd++KXbIv6WCh42
 XMoUzyUI308blDneiF8ELFxwWRZ+HlBaA0JXyjVpG6Zm+5oq8aQEIQCFAIsco39MDaqL
 jgysNxhVIf1cFAYGZd5cT3zefmhNv3wMSpoDkDBsSWUqs0xPRh4H3bbBxjizBl8yKYCm
 GilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mr82V3RANAgu55hmStjZWk0TQih73s6qJMB8WUffM3M=;
 b=ge+c9vXNHORaO+XyOS0e2XXepXCWKuksABRiIo0+DP73mKsM4s0cPN5zrufHGpAJmw
 0eJPa07HquubZc811SCZp7iVi9q2EYcBI5J+GkwXrXl3zWL0Gcq64I1kVeIzgLBz2fAc
 ZFCiu/EWC0Cbvv2c2b4ALEXCksRCBb28lkjbFwoEtvX6T0Y4HntKix+7wdutxo35A09E
 Cr2wgNYqCawAquY1waJ+OzepcVymEU7vFpYTpgPE1CaGgbWhP4VHO1aNTD4GpM4Qi/zg
 RbNSBlgn8FXOJUEXmzJjVFQppx5RNihujPxKj9X9OqDqzp7kFpgh/kcfxXr9gS1qVtPV
 GqTg==
X-Gm-Message-State: AOAM5334tb10b472s9hzFY9i+J9w2yYkvUedqCgs+GhMmz8/Mlm4uen4
 napyeabwB2zI5aAGYOVZWFLr6A==
X-Google-Smtp-Source: ABdhPJx0PN+VBzbnNFQID+qXlvT/0GkEJdaJf+lvp3ViTNygHw7XrENFt91yKTdK+cKp5o7Jd8oLVg==
X-Received: by 2002:a7b:c182:: with SMTP id y2mr6996058wmi.155.1625771851838; 
 Thu, 08 Jul 2021 12:17:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j4sm3175449wra.1.2021.07.08.12.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:17:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2161B1FFB4;
 Thu,  8 Jul 2021 20:09:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/39] configure: don't allow plugins to be enabled for a
 non-TCG build
Date: Thu,  8 Jul 2021 20:09:31 +0100
Message-Id: <20210708190941.16980-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - error out after all options have been processed
---
 configure | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/configure b/configure
index 650d9c0735..7f906be68d 100755
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
@@ -1563,6 +1564,11 @@ for opt do
   esac
 done
 
+# test for any invalid configuration combinations
+if test "$plugins" = "yes" -a "$tcg" = "disabled"; then
+    error_exit "Can't enable plugins on non-TCG builds"
+fi
+
 case $git_submodules_action in
     update|validate)
         if test ! -e "$source_path/.git"; then
-- 
2.20.1


