Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96E2300B07
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 19:23:59 +0100 (CET)
Received: from localhost ([::1]:46760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l316E-00052Q-NN
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 13:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l311a-0007ak-H9
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:12 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l311Y-0006tg-RV
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:10 -0500
Received: by mail-wr1-x432.google.com with SMTP id 6so5973220wri.3
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 10:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f6zl2v9LPncQJucBqnlmMhx3Qi+VNlQAjrIpZhJtkg0=;
 b=YgWtAWsvMlOXXBRmv8vIr3lvZRL4nUPjpiJWS35NlRmW/vMfw9ljNADhUMcfqZ8wUZ
 T5ZlVL9VBRuj2zPCWqcr3fhmDL0/kOLp6Ns6PiIZbeZ6AFaanY0uyI7CKF/P4Kbm61VQ
 LWr8BhM1CAc+EqFASEkwdQMKPvph1WBVq2ODTT5ykLgdKEfANPdMLv/G7nIRfO6Qa2/g
 mqJm09Bpu5DtsyR9nIdfl95lxlNg+2pxnwF1eiQuh4N6UJRLFMiyMBxPCJa2XBcOn/77
 Aju+DyF9oXvcByzmA1fNFktcNxvdtfCQmOllFJ1gyZ5BWQ93dS0Eed/w1FxrhZ32OVqX
 99jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f6zl2v9LPncQJucBqnlmMhx3Qi+VNlQAjrIpZhJtkg0=;
 b=PMetDSy3d14Q3YqvK20vn8SaQJCmc/i4Ih2e8A/gsQWQZUjZDUFjSYrcGhASyRTSek
 669dFIQyInCaHbkhd6aAUdZA6AVORPwMfBiBybkgwbKAQYEuJwJ+ws1QfQ/HuFvcYyCR
 3FtIQiQhIxtvZHGtZAw1OPCAXRacPrvLufD936HHI5BqUmY1b3I3RIyX0z7WKYzHY1/s
 SEQxbXp9HDZsi1x97du8EyONpUnDrnOR62pTf4r2fA6QDjiOuv7+cOOVFVw7C1Gh9/FU
 qrY4SAnRtJM2X2vtIL+pgXWwEzs8zmF2xhpxndrDgnRBw/Sc6Z6IpSG5e2MBOn4bywJQ
 DUwg==
X-Gm-Message-State: AOAM531gX6IhnaM4oZ6Xb+XeCX4+ByuKJhgIpmXIwcYk6WRI1n12zq9g
 ae/dnCKXIsSrR6s2tld933CFJw==
X-Google-Smtp-Source: ABdhPJzdxZE0O9mvwP0UWP4yVzQMNALKekeNKuTb6dUJKThDeCdpidiNxpE6bhlvbOxSXYlGbIK39A==
X-Received: by 2002:adf:cd83:: with SMTP id q3mr1878250wrj.225.1611339547462; 
 Fri, 22 Jan 2021 10:19:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l20sm13999756wrh.82.2021.01.22.10.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 10:18:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 480A61FF93;
 Fri, 22 Jan 2021 18:18:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] configure: make version_ge more tolerant of shady
 version input
Date: Fri, 22 Jan 2021 18:18:53 +0000
Message-Id: <20210122181854.23105-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122181854.23105-1-alex.bennee@linaro.org>
References: <20210122181854.23105-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When checking GDB versions we have to tolerate all sorts of random
distro extensions to the version string. While we already attempt to
do some of that before we call version_ge is makes sense to try and
regularise the first input by stripping extraneous -'s. While we at it
convert the old-style shell quoting into a cleaner form t shut up my
editors linter lest it confuse me by underlining the whole line.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 6f6a319c2f..dd99939b34 100755
--- a/configure
+++ b/configure
@@ -198,8 +198,8 @@ has() {
 }
 
 version_ge () {
-    local_ver1=`echo $1 | tr . ' '`
-    local_ver2=`echo $2 | tr . ' '`
+    local_ver1=$(expr "$1" : '\([0-9.]*\)' | tr . ' ')
+    local_ver2=$(echo "$2" | tr . ' ')
     while true; do
         set x $local_ver1
         local_first=${2-0}
-- 
2.20.1


