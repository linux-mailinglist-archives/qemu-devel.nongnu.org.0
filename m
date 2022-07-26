Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53ED581699
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 17:41:04 +0200 (CEST)
Received: from localhost ([::1]:39094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGMg9-0003mQ-GR
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 11:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMMI-0006SY-47
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:30 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:41482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMMA-000638-MV
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:28 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 x23-20020a05600c179700b003a30e3e7989so8382367wmo.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 08:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=J0a1TUw/2CURKscI5PXWjufgRvMWjB7jxGP1SOJi5DA=;
 b=kh2gwuaq4JLh1UtwejwEMiph+xjIKqDHxFqBox++bhgmq0MSXdEB86mQVBStVxi5cP
 g4XnFQfslrbLR2Hwi8i2BXBf35NvX9LcDYCdVupzv2x1pzDb4tiagdqywQsXLBBR+I60
 FzClmtWAlUZpKXtBPtYxKsGMhgiy4IZlYZw2gysJYj7zDDvDMIqSBzm50U0UM+43mZBX
 H2Kyt5X+/DxlGnloZ0P/D06AImmdE82l0yoCNmfNRVTQyqm0GKBoK5hs3ma5EgT9jfTK
 AEjbFro9iiyxeNGUcLruWDniTlkHFESs/BMqlPXNudtfbiwXhWbv6lcPInh83fF6P3Jb
 svLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J0a1TUw/2CURKscI5PXWjufgRvMWjB7jxGP1SOJi5DA=;
 b=j/7MHnY/xK5FPFSLoEyitifBaR01xpzJnZUoevD3S/Kbc5uKvMu7bozB67EUi0/IHC
 JNmJB1vH9VQE1yWnxTvwIg4FVP0N+ofLOxNjdHURhCV9TLu0qG3QRLjuuNCNZXQ58f+i
 jDnXNheOff7Qj798VVzKyMYEFq/45ncAYhJC47HGSlQvavPm0o9PPisitykYSGhZGVHV
 sAOjHZx+gzGQC9c7DvGkVw852tIb4HycrVVvi7DgNzIN3o5hb/EYvCpGX4X2aAEmJrT8
 V/blSuPT5Dx3+jo9/sER9myQ9rClAh8NTojFB6N03Pp5YTKEXQNwfLsSQTO0dkvw/MY9
 g1zg==
X-Gm-Message-State: AJIora+/IB/HyeeFzdhMyIS58F66ERKz8QSEY3gbloVlEU/dRNg82zrI
 MENPazqegFkEWUz/rqDLLsG/y8x1SBI6Hg==
X-Google-Smtp-Source: AGRyM1vOdzWsCTcjcZkUP6JrULT2OPkYpOh7y7wQrtteIXq3fizEQZf5J+2i+U032ROz21z+as+qdg==
X-Received: by 2002:a05:600c:4e4d:b0:3a3:1fe6:6b20 with SMTP id
 e13-20020a05600c4e4d00b003a31fe66b20mr12679805wmq.197.1658848821268; 
 Tue, 26 Jul 2022 08:20:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a1c2705000000b003a1980d55c4sm21932739wmn.47.2022.07.26.08.20.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 08:20:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] configure: Don't use bash-specific string-replacement
 syntax
Date: Tue, 26 Jul 2022 16:20:09 +0100
Message-Id: <20220726152012.1631158-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726152012.1631158-1-peter.maydell@linaro.org>
References: <20220726152012.1631158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01, WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

The variable string-replacement syntax ${var/old/new} is a bashism
(though it is also supported by some other shells), and for instance
does not work with the NetBSD /bin/sh, which complains:
 ../src/configure: 687: Syntax error: Bad substitution

Replace it with a more portable sed-based approach, similar to
what we already do in quote_sh().

Note that shellcheck also diagnoses this:

In ./configure line 687:
    e=${e/'\'/'\\'}
      ^-----------^ SC2039: In POSIX sh, string replacement is undefined.
           ^-- SC1003: Want to escape a single quote? echo 'This is how it'\''s done'.
                ^-- SC1003: Want to escape a single quote? echo 'This is how it'\''s done'.

In ./configure line 688:
    e=${e/\"/'\"'}
      ^----------^ SC2039: In POSIX sh, string replacement is undefined.

Fixes: 8154f5e64b0cf ("meson: Prefix each element of firmware path")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-id: 20220720152631.450903-4-peter.maydell@linaro.org
---
 configure | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index a56c3d921be..c05205b6085 100755
--- a/configure
+++ b/configure
@@ -684,9 +684,10 @@ meson_option_build_array() {
     IFS=:
   fi
   for e in $1; do
-    e=${e/'\'/'\\'}
-    e=${e/\"/'\"'}
-    printf '"""%s""",' "$e"
+    printf '"""'
+    # backslash escape any '\' and '"' characters
+    printf "%s" "$e" | sed -e 's/\([\"]\)/\\\1/g'
+    printf '""",'
   done)
   printf ']\n'
 }
-- 
2.25.1


