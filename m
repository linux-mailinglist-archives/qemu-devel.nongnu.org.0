Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B2C61008B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:43:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7mF-0002My-Ak; Thu, 27 Oct 2022 14:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kE-0001KE-5a
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:47 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kA-0003KD-R1
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:44 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a14so3689049wru.5
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x2Q9F5jfw1PO13TKDdtZUG9sxZWS2VGpFFbrnf7gsiA=;
 b=QdBFAJhjRMSlKkrXHuSmdkm4yrDq80ocAvb4BDmQzBYrKC9/iS5zO5oJw83k90x+SS
 AC0eLLVKfbTmM4/73E8RBiObaq7WFh+kFQP5p8Rw78ss4KIpH0hFQ7pCTFyhj2bNyGAe
 9/d0emDt3hyeCsGomMboFqEKAfa8kF8UW2VDqpjOakVtQ/slKc4IHEFzGhuv+AZfXkfT
 uWfPF1C3Zx0/KBC1lY9K+pZbA51ERMgEIVfSNsa74z7ZPaFsDLtFrUo1O00uAlF7Jzkl
 MkQD+GUlwyTnF1KL2T9R2v7b5BWpJA1YDklVgBEu8/t+CoyPLUaOTjqPGcfsPlaWoYaX
 eWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x2Q9F5jfw1PO13TKDdtZUG9sxZWS2VGpFFbrnf7gsiA=;
 b=J8dW6odU/JT7+P+ff2Cxx7Wz5MDMXjhq345Vcu3k2xfZoQ+nas55L8YzyuBsHU8WxH
 T9Cs+4uxrsfnW7YgGrbjgbQu/hpZgd1PjSSnUTx+dd8vj0UCKUPxPxg0jpzl6kMhYnIk
 yeuwfYjHd/+t1+UopHstEgkcDxIdtTnc113dHf3jLPYap6ceoYovZJwqQzKcDZoG/2QD
 w5CMtifkLAcfoZqgdcXfuEZO+ZuHMHUr/w6TfgDqmbr9waprzDi/1+MFb/cDDcdnrTFE
 xs8ESXt+JaYGNAMq2Xey43TFMrvz8mcp9cU25ydol+znGnjdrcNOl6cWb5/lTMssqhWU
 MSBg==
X-Gm-Message-State: ACrzQf3Ewjk6jEvO5psBHWpOoy+Jdg0u5M/QAJUtbBd0kElRhBX0ToNR
 CX1KD1gJr72FapMS9jw3uNWejA==
X-Google-Smtp-Source: AMsMyM4itgxhd9XN4fRxleqhc5AwoNr/4B8JSuwXgl/uaPuEGMmATZ+UNoY4/rVzffafrLlV2SUAHw==
X-Received: by 2002:a5d:5f03:0:b0:22f:8ad4:bd46 with SMTP id
 cl3-20020a5d5f03000000b0022f8ad4bd46mr31843262wrb.120.1666895799949; 
 Thu, 27 Oct 2022 11:36:39 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a5d63cc000000b00228daaa84aesm1737045wrw.25.2022.10.27.11.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:36:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B85331FFBC;
 Thu, 27 Oct 2022 19:36:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 04/30] configure: don't enable cross compilers unless in
 target_list
Date: Thu, 27 Oct 2022 19:36:10 +0100
Message-Id: <20221027183637.2772968-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This avoids the unfortunate effect of always builds the pc-bios blobs
for targets the user isn't interested in.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/configure b/configure
index 81561be7c1..dd6f58dcde 100755
--- a/configure
+++ b/configure
@@ -1877,6 +1877,15 @@ probe_target_compiler() {
   container_cross_ranlib=
   container_cross_strip=
 
+  # We shall skip configuring the target compiler if the user didn't
+  # bother enabling an appropriate guest. This avoids building
+  # extraneous firmware images and tests.
+  if test "${target_list#*$1}" != "$1"; then
+      break;
+  else
+      return 1
+  fi
+
   target_arch=${1%%-*}
   case $target_arch in
     aarch64) container_hosts="x86_64 aarch64" ;;
-- 
2.34.1


