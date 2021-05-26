Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AABE392245
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:46:15 +0200 (CEST)
Received: from localhost ([::1]:50098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1Ly-0004hj-0Q
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0wj-00040x-Ix
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:20:09 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0wh-0000Sl-PT
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:20:09 -0400
Received: by mail-wr1-x429.google.com with SMTP id n4so2558079wrw.3
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7R688np30I5+o18WAIciru1O5zsACw6s83EuiMLwj4I=;
 b=aiAd76s2gfv/wJQWAKsZcrcVEXAs6BEsxSpw7Dx7kVsOvfcd6cF5Pg91IrPd4o7g/9
 3D7o2XT0TexDlAeVulcIHZKuDjJfj4nqDM3fk12Ik+E2Yd0Slrjj7PNUioZWNYCDsYG5
 i9zmRE8j2ISuTzVCgyfBEuxo/8CCosQnh8F6ehcV1Z1mO5SShfC+9agzn8Goq9INIVzW
 C6c20iHnnJFASN9euBPwPQj1wwEPZSA8wjukjhjk63ztUr1ZCk4+gDlbjSrtuu3O5Auv
 0rD6c6bxyg/ufXusS500by5ioBe2knqRGvZ506XPaKKCN/+IzMIzuTyBRWkM6pl6utHT
 pWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7R688np30I5+o18WAIciru1O5zsACw6s83EuiMLwj4I=;
 b=glyC8ttfghlC6DzLeSaFSxp9wdoHI++dTyoKxBTP/pPTYKRg8WYA/wgFuCLnHExVBd
 d+kSTtMTcjniPYC6CFZ4iJYJokpMT2xsC5D1n7B2xESu9DhFITFFDFP+Te406EmjQXPp
 synGUWYjKrc5gmQoXyvSdraB95zEny4hiwEDg4qaQmfo9wVLfUDrmAGSh/KcFHyVryjy
 7Xpn3zbwKHIWipcZ1dkd77PQG99vL7/slqu3WfJWeKhAGobK7Y6dt06Hl93wD/a9cO8X
 aZ9fbGHhVJxc30nBOh5+bg8OrjbDxW7uP4Tu2fF3B4rlkJjUz3XViNJvZtSpLXYuq3BT
 BimA==
X-Gm-Message-State: AOAM5322pP/8GNhZLcCe1pONYOtvX0kbQGJZHAQSZrhL0sMNjiJY+qEn
 uK5HCz7NQI1/G+wSoQHgD1+PIg5cYsw8jw==
X-Google-Smtp-Source: ABdhPJyNogQlTo+siy8/6uGT2zaMm7D94ch07LCuPqIQGHc9urDRe87t0I1yAcPZQJt/ouFp6+ROCw==
X-Received: by 2002:a5d:598d:: with SMTP id n13mr27802wri.38.1622064006249;
 Wed, 26 May 2021 14:20:06 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id r17sm8420936wmh.25.2021.05.26.14.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:20:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/19] gitlab: Use $CI_DEFAULT_BRANCH instead of hardcoded
 'master'
Date: Wed, 26 May 2021 23:18:36 +0200
Message-Id: <20210526211838.421716-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Savitoj Singh <savsingh@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We want to skip the checkpatch and DCO signoff jobs when
pushing to the default branch. Currently this branch is
called 'master', but we don't need to hardcode this in
the CI configuration, because the $CI_DEFAULT_BRANCH
env variable exposes it.

References:

- https://sfconservancy.org/news/2020/jun/23/gitbranchname/
- https://about.gitlab.com/blog/2021/03/10/new-git-default-branch-name/

Suggested-by: Savitoj Singh <savsingh@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210525153826.4174157-1-philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
---
 .gitlab-ci.d/static_checks.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index f695627b7cd..9c9a771b744 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -6,7 +6,7 @@ check-patch:
   script: .gitlab-ci.d/check-patch.py
   except:
     variables:
-      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
+      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH
   variables:
     GIT_DEPTH: 1000
   allow_failure: true
@@ -19,6 +19,6 @@ check-dco:
   script: .gitlab-ci.d/check-dco.py
   except:
     variables:
-      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
+      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH
   variables:
     GIT_DEPTH: 1000
-- 
2.26.3


