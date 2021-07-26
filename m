Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3863D5CA8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:09:46 +0200 (CEST)
Received: from localhost ([::1]:50950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82Ej-0000VC-D6
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m82A1-0000xf-MW
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:04:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m82A0-0003V7-2w
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627311891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5skV1VcH8VE4F7YVyHyIQxPMq2PPLQR3Z673qUopZ2M=;
 b=UzIsZyDohSswqxgjB71GgX5sq+wkQnmXOZLPat7He2kzI+sFmcw57fNAY8ClzgDIX6VC3g
 8NH5/UftJEw1sBG1HuhyPvBTvTg+FmQaqw5ecHnbYoZJydkXG6sAtmFqT5Xy9SbQ/j8sMd
 oVKjCqfJKxkx5blg8LaCDdr/9d1pWDo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-tDzkC4u5O-68JwYXO-peTA-1; Mon, 26 Jul 2021 11:04:50 -0400
X-MC-Unique: tDzkC4u5O-68JwYXO-peTA-1
Received: by mail-wr1-f71.google.com with SMTP id
 d13-20020adfc3cd0000b02901531b0b7c89so4318952wrg.23
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 08:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5skV1VcH8VE4F7YVyHyIQxPMq2PPLQR3Z673qUopZ2M=;
 b=isrP4YFsvr/GyWjW6zcTWKuCBAj4AZyF5adV6BFs3KjJ/LbPmADuJnvp+TvHLeKDgq
 M61W0winPbJmRn3sWgogEhcpAZlzvFDlmOoIFi5gUmE5JJMvMYF63dMGdvRlLkJQGgAH
 gquLKni95hhVQ5mJy8kdZTie1ic8OQ90TGchkL1Di4Xm/rnWstBA5+5Xb6T4KjY4GV1T
 WB+iY0vUKJzijHLspf453mzrqH5jDynmAlyAT6K+HIaqHMIiD4sffMKYjUpRL+d8wMAE
 w1J7kc99I3H7/6EhrVS3YBsmhrKQoXHbGneHAvpadIUmh6kDKfsM3My/ZLgvEUuGzYps
 Dc5Q==
X-Gm-Message-State: AOAM531/IU2pwYqRuNzzyGj9VEcgyP2VaQuGh68yRJHglHN4pcNvQADx
 aJb3e+xhUVi2WQQOWnEyty21eGLWFCzY2UoiGxjIWUXPb4Ym0M2PpoMYvi0taMiUhMH8ifLuFu0
 +e4ZIkXc43LecNoN2m5bzcXyGRcwYoD23WJO2QfclGklqcAlqBPIBcggbwdquOCdk
X-Received: by 2002:adf:b30a:: with SMTP id j10mr2474476wrd.43.1627311888871; 
 Mon, 26 Jul 2021 08:04:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCyVd4Xu3V4StsmyhTHLNVh4wmghvK1JPqN34fMgmMCmKPt1MwkX0m+9F4LcR0rXCn8wa1Ug==
X-Received: by 2002:adf:b30a:: with SMTP id j10mr2474449wrd.43.1627311888713; 
 Mon, 26 Jul 2021 08:04:48 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id n8sm60671wrx.46.2021.07.26.08.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 08:04:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v4 4/4] gitlab-ci: Fix 'when:' condition in OpenSBI
 jobs
Date: Mon, 26 Jul 2021 17:04:29 +0200
Message-Id: <20210726150429.1216251-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726150429.1216251-1-philmd@redhat.com>
References: <20210726150429.1216251-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jobs depending on another should not use the 'when: always'
condition, because if a dependency failed we should not keep
running jobs depending on it. The correct condition is
'when: on_success'.

Fixes: c6fc0fc1a71 ("gitlab-ci.yml: Add jobs to build OpenSBI firmware binaries")
Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/opensbi.yml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index d8a0456679e..5e0a2477c5d 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -6,14 +6,14 @@
    - .gitlab-ci.d/opensbi.yml
    # or the Dockerfile is modified
    - .gitlab-ci.d/opensbi/Dockerfile
-   when: always
+   when: on_success
  - changes: # or roms/opensbi/ is modified (submodule updated)
    - roms/opensbi/*
-   when: always
+   when: on_success
  - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
-   when: always
+   when: on_success
  - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i' # or last commit description contains 'OpenSBI'
-   when: always
+   when: on_success
 
 docker-opensbi:
  extends: .opensbi_job_rules
-- 
2.31.1


