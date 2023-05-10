Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA8E6FE12C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:08:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlPG-0006tZ-Tr; Wed, 10 May 2023 11:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPE-0006sG-Vo
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:05 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPC-0001Vt-OA
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:04 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f4ad71b00eso5036655e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683731221; x=1686323221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dnoUP83M9hLIxazc+2BcSO5MOa52SAxiWkjTznSxRf8=;
 b=RHD6IrJ6JS/PcvUo3v1FlzfNL9Zc7XblrXKj60Vj24VPAcPN5DiK1Lyp9usCi6m1bR
 d6D2GXrNPq6iHngBFPv/xHVtjFP3bj+1KI+yvmZHtC1IbAONYdNW2a8IAKkBfQ3vSMap
 XN4/PmYmPW098M5/DrLEItrYzIwwHnc+trZzB7L7u8qVQzs1cUTLmrIXJwhHY0WwwFKk
 kHXKP3rAMxY86RhXS9a1tQiKGbPreP3tGMm3VPn5scqMr0MUd37TL2jCQhJl+kh1DfN8
 brHd7GuSkNfA0E/90FgkB+oNjyTH8YOC/XviYUG81sVqjJ2JnYGaeviDHNDX97Cce4N9
 a73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683731221; x=1686323221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dnoUP83M9hLIxazc+2BcSO5MOa52SAxiWkjTznSxRf8=;
 b=VIyWC4ru2rM4CxSwhtKIbzubJmV+oEUTSmG4Fc1nRc4PJcL1qWyX+3XaMYO1Z/suzi
 Uvo1uu3ZsS6H24WjbxXbTjm1CXtjsFRrk8LxDhn0ZWYXQjaj8VcjhMLG6TWnA06GWZjk
 rAdCywU6ZNiemgptF9A6Be0q+zCw2mOLpgK9WokwjsN4PkOixJk8B7ANEcVbVvKqh8/V
 AVm3HBSV960ZB5wChcHMlTjgDpnMabDHYhYwSXhNIFJMvgAPUqDOGO+vOkaimNpaslm5
 LlirG45WUh4JRQB31WXDfBWs92+TOqdhIQnuzJqMVrkSGVWIV/IQiQ6Hb94+PQhh/1fq
 aEyQ==
X-Gm-Message-State: AC+VfDzhzIo0GnWKIhEm/TPXxHdtcBTgYCsU3vJTJHLp7QllLJzT3yR3
 kcG24ZweHFMxA99djhDgRjyRQA==
X-Google-Smtp-Source: ACHHUZ7Ai/xri89KZ6N0q5qTN+EnP1jby9pSUnnXvgoLidr1AO68E9oDBHs9CwZ0venzxS9m6l/l+w==
X-Received: by 2002:a05:600c:2216:b0:3f4:2452:966e with SMTP id
 z22-20020a05600c221600b003f42452966emr7578949wml.0.1683731220710; 
 Wed, 10 May 2023 08:07:00 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c230600b003f427db0015sm7880694wmo.38.2023.05.10.08.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:06:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EEFBC1FFBE;
 Wed, 10 May 2023 16:06:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 3/8] scripts/ci: add gitlab-runner to kvm group
Date: Wed, 10 May 2023 16:06:53 +0100
Message-Id: <20230510150658.1399087-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510150658.1399087-1-alex.bennee@linaro.org>
References: <20230510150658.1399087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

One of the main reasons to have custom runners it so we can run KVM
tests. Enable the "kvm" additional group so we can access the feature
on the kernel.

Message-Id: <20230503091244.1450613-5-alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Peter Maydell <peter.maydell@linaro.org>

diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
index 1a1b270ff2..7bdafab511 100644
--- a/scripts/ci/setup/gitlab-runner.yml
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -26,6 +26,7 @@
       user:
         user: gitlab-runner
         group: gitlab-runner
+        groups: kvm
         comment: GitLab Runner
         home: /home/gitlab-runner
         shell: /bin/bash
-- 
2.39.2


