Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF063F31CD
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 18:58:12 +0200 (CEST)
Received: from localhost ([::1]:55304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH7qN-0003uv-UL
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 12:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH7p9-000387-7D
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:56:55 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH7p7-000658-Qq
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:56:54 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso9552411wmb.2
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 09:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k4AC4Vt9oQOmy/po9eQS7Sswa1i/5OmXFCiyRgmnd9Y=;
 b=jpvfhL3L9ZTvqG4kB1u4qSrxirCxf7DhAe15TNyOEwTQHptPv0H4mKS+Y645c6YrPr
 02C95omLbdhXxR0oF81obV7NrU28mb1lHdPUvkOKrVCnGD/4X3pjI3G5V7y2RRAptVts
 VMRC5wW6qxqkJXVK4ezqjdGGcYJkm7/jPGlbwtEwzvVhZv4UFP5CpZ6hJaj4CFNaI0Xa
 GcitnXs0c0CrJPd+0c0BLy/CnUpV8eknEr0EaQsF32rwojjGcpEj9FlzoG643SQalYOd
 7eqFqulaziOzW2a/7tK4RpwCVYwvPW91dg3WXq48zOqq3+JH5q2OKXr20cMCa2ld6Qi3
 P+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k4AC4Vt9oQOmy/po9eQS7Sswa1i/5OmXFCiyRgmnd9Y=;
 b=jXknwG/A9bgy1W26NxZK8aIUv7yDfo4euCUeujw5gmqNLs8w1xBn65aWe+xINh7zgN
 TMrY0It+UTPkkhaaQG0dXJpcL2Xlq6yDKoikBlriRgUV9mV4+1qCRy1W7cNU/h25eNAr
 qgxKnAa/RlnPhgNYJ4aTU5TDUGrEGAbyI9PnBAMk2CZg/ogP2I79Gulu4fs7/rhN9Ip8
 s/nphUXSprxwHOZunl/Jh/Whf3lF+0ptZ5sIMlglPYWAcZqv3lwqztomuZuFfyRiUpI6
 qmDosC1wBOgkMc+cCHPqbKxqxlVTY8OiWFkf9ZEyxjGTPhlB6vO1o9A1BBKBMpl1CfAg
 ItIQ==
X-Gm-Message-State: AOAM53363RdPjADSqRz0+1LRLtdLQE3FfggMFbYnMC8xELNWpdli0uht
 dSaxRmP9VeMc4MhhzVxbAb9lMMWRARsZlg==
X-Google-Smtp-Source: ABdhPJxf38Rb/uIWZdNJK5giYy5+7tQf9bMFw2TEnM/MRDlS4t/IC3b7YiO0Dpf3ip2DlAiiNOuBMw==
X-Received: by 2002:a1c:a90d:: with SMTP id s13mr4966656wme.132.1629478612412; 
 Fri, 20 Aug 2021 09:56:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l7sm5651713wmj.9.2021.08.20.09.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 09:56:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Fix memory leak in sev_read_file_base64()
Date: Fri, 20 Aug 2021 17:56:50 +0100
Message-Id: <20210820165650.2839-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In sev_read_file_base64() we call g_file_get_contents(), which
allocates memory for the file contents.  We then base64-decode the
contents (which allocates another buffer for the decoded data), but
forgot to free the memory for the original file data.

Use g_autofree to ensure that the file data is freed.

Fixes: Coverity CID 1459997
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Tested with 'make/make check' only...

 target/i386/sev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 83df8c09f6a..1e7833da1ab 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -565,7 +565,7 @@ static int
 sev_read_file_base64(const char *filename, guchar **data, gsize *len)
 {
     gsize sz;
-    gchar *base64;
+    g_autofree gchar *base64 = NULL;
     GError *error = NULL;
 
     if (!g_file_get_contents(filename, &base64, &sz, &error)) {
-- 
2.20.1


