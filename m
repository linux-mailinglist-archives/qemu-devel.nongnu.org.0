Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6EE6D66A3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:00:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pji93-0004x8-G3; Tue, 04 Apr 2023 11:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji8K-0004Hi-UU
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:40 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji8E-0005Br-Na
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:39 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso1138020wmq.2
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680620368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mPEptVG1moOKrND226B39dC48TdBlR+dJHFVa4gG/E0=;
 b=CsDrdwkb2dlug61gdJwqjCyOH+kZbNUHv+ACBFrHy1lumZq6K8JrFzp0NtyICkQSGs
 W+MA6Y6UuuxE0jGIsTid3ahEZmGdkfLK4dxUxS0p4MPOR1nVQu8fPzgkY7Xd9wm249CM
 Vn9sWstb/H50O1Nu9TzWYgr5ttzamzubMJ5fbleHBEym3w4HlrSqYjOGbrocSoM5uD5b
 TLzccJBL0V/rPVt62/WfACe3XwXCP0SLnjzbfL0fmSF6cqi0c3EkNXRD43lj3HjJue8t
 8j3wOoHQ+8nNHmrRKfAB233Y7bo4jePON10ya4LcMYMKB7NzYWeNlzJVTvatfs2YDndu
 VWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mPEptVG1moOKrND226B39dC48TdBlR+dJHFVa4gG/E0=;
 b=Vhcd0IlQaC0sXc2SHLdf6MnHvyUF3RNI0cGo085zFLyAy1bisY+qlNSvyfDI+SfYJb
 J8+dx+Ag58VmLyEFe+ct1UIUzz2vXDZp1bbZw0/EOd/CG3RLBSEUJDsAn2vQMmSCZ509
 3tzXV3zsBOER2iWzBhMXIgyREMrsYDTTOSggAkrqwHVLuLgF05wNDGEG/lrrbI2m8J2G
 DM5RZBZZsBTKOKsOaqlpmIPBUK/Em3nhTz2T4ILIJIrxHn9Ei0fVpinsuRMwGbpVGxp1
 Fq5N3FLMNxXiB0ByThxw7wbHRvJMCmT0OdD9ntmjSwUJjbFuPSD9l85YIPTznGFSCCKi
 5Uaw==
X-Gm-Message-State: AAQBX9d/mPtXn6ynrdQPuPcExHRW3OtA8kw1Ft3o5byE87mF3HTq9Ude
 uS3EJ3t9rMvDccqb8SW3NnMcmw==
X-Google-Smtp-Source: AKy350YKAul8QVEx3hOkkHeTvlR34X5X8Yw/dBXzVgkJ6NqL7ItCJBrfUKinyzWB+wKMvomsqtC5Tw==
X-Received: by 2002:a1c:f718:0:b0:3ed:4685:4618 with SMTP id
 v24-20020a1cf718000000b003ed46854618mr2418148wmh.34.1680620368308; 
 Tue, 04 Apr 2023 07:59:28 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a1c6a16000000b003ed2433aa4asm15279812wmc.41.2023.04.04.07.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:59:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EB6CE1FFB8;
 Tue,  4 Apr 2023 15:59:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 09/10] gitlab: fix typo
Date: Tue,  4 Apr 2023 15:59:24 +0100
Message-Id: <20230404145925.2638152-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404145925.2638152-1-alex.bennee@linaro.org>
References: <20230404145925.2638152-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230403134920.2132362-11-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
index 0274228de8..2fbb58d2a3 100644
--- a/.gitlab-ci.d/base.yml
+++ b/.gitlab-ci.d/base.yml
@@ -75,5 +75,5 @@
     - if: '$QEMU_CI != "2" && $CI_PROJECT_NAMESPACE != "qemu-project"'
       when: manual
 
-    # Jobs can run if any jobs they depend on were successfull
+    # Jobs can run if any jobs they depend on were successful
     - when: on_success
-- 
2.39.2


