Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DC3640C91
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 18:49:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1A8q-0003mj-Gz; Fri, 02 Dec 2022 12:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p1A8o-0003m8-PJ
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 12:48:02 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p1A8n-0008Pd-6G
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 12:48:02 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 125-20020a1c0283000000b003d076ee89d6so4341303wmc.0
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 09:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SkBmPVLH8/v3w2c5VJC/hDYmbnqEXSmH+JQNBkm0fAA=;
 b=R4iSCKdg7KRQUrs29DOzjDsbQhpU8dR80GozuCJJfnffHqMujtCcA+dZwYU1aJWZOd
 C1TfR0vaiRVAa7ZhjZ4OfqBjLFNafELD1AYli4rJP7BBghc+5Yj3AIPd9u82OjuoMDC2
 K8f/3oTYBmDQpn5kWI4I4Oht1Ahx95B4ENRTL0N8Q7adZ+0kmyoA3Al4T2TY/uAfgctq
 1h/WxkjTqgtcSvoD0V5kk6FNq9DZExkuv3F6uq3zSy8YGz/tq7Ezsz3wI0xXdpsXRelG
 FkVxWmzCeTZIYeq4knXc+ixmeOThj5cm1rc5sLaZ8C19zsPxoRvnitzJ85jc6SsRhvYH
 LDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SkBmPVLH8/v3w2c5VJC/hDYmbnqEXSmH+JQNBkm0fAA=;
 b=7Ap4AW2cB95nFGRbxhuDoYumfHVJn8gRnh6cTMvD4yfBCwpRf19GyqABjWjD+16HcN
 jcDYXTyGJbl8QZysapEaJbY1M2wFKMd7uRLPGROMchJLxdFXmWU4lz4KcdKfnYolNbnf
 tjOmop+EIJx32LCF3OUV1NXBUTH+I4W7CCAl5sjM3NozKnYl2w6KykWPRJ2t6YPHU+km
 S59NJawFjx5AwU8iQ54+bOSZb9zlGcGXqwqMWCkqa5XsTQLlLQLpz57w0D5JAqYrJr6c
 AXyJiaD6yFc1WYuEWtfnq8p3Ca6uW5KgGx59Rj9ECNfsnhfhxEz31NlYK0GTQ0tseJho
 H5TA==
X-Gm-Message-State: ANoB5pnmLSzSQnVaPrym0RsYu3bSbSnWCd0QqpSlohZx+VZvhj27ydHi
 XQzu9cG7AAtOcSIeYACTrmbMNw==
X-Google-Smtp-Source: AA0mqf7bkFqASgFUZ7KNN83ZRVVlp/RmDpwfw5toCnF7sMKuvK1UXJfZlNRG/m9Ud7JFd4adSDXD9w==
X-Received: by 2002:a05:600c:4148:b0:3cf:5657:3791 with SMTP id
 h8-20020a05600c414800b003cf56573791mr42034099wmm.34.1670003274643; 
 Fri, 02 Dec 2022 09:47:54 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y3-20020adff143000000b0022eafed36ebsm7717814wro.73.2022.12.02.09.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 09:47:54 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 829BB1FFB7;
 Fri,  2 Dec 2022 17:47:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [RFC PATCH for 8.0] configure: repeat ourselves for the benefit of CI
Date: Fri,  2 Dec 2022 17:47:46 +0000
Message-Id: <20221202174746.1218017-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

Our CI system echos the lines it executes but not the expansions. For
the sake of a line of extra verbosity during the configure phase lets
echo the invocation of script to stdout as well as the log.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 26c7bc5154..849ac7aed9 100755
--- a/configure
+++ b/configure
@@ -83,9 +83,10 @@ rm -f config.log
 # Print a helpful header at the top of config.log
 echo "# QEMU configure log $(date)" >> config.log
 printf "# Configured with:" >> config.log
-printf " '%s'" "$0" "$@" >> config.log
-echo >> config.log
-echo "#" >> config.log
+# repeat the invocation to log and stdout for CI
+invoke=$(printf " '%s'" "$0" "$@")
+echo "configuring with: $invoke"
+{ echo "$invoke"; echo; echo "#"; } >> config.log
 
 quote_sh() {
     printf "%s" "$1" | sed "s,','\\\\'',g; s,.*,'&',"
-- 
2.34.1


