Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0918A6D462E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:50:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKYv-000309-0W; Mon, 03 Apr 2023 09:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYt-0002zX-Or
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:31 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYp-0004wm-AT
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:31 -0400
Received: by mail-wm1-x32c.google.com with SMTP id o32so17157827wms.1
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 06:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680529766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H2FeLZKR7rrXEZU0aPhVzNZ/e8CIWD3g/VnvrT6YWk8=;
 b=kZmtBOf2iDPBbqPfDNkM9lOnUFuhMtgPgELYV+FeVe/tevJcmAoJoNpdgj0ET4cVJn
 VHV1zWCKYwQ54Kaa4Qk/UY5c2/V28c2nip5l6WG2XVmBYXaCUJcgq2H25E5MoOxv/J9o
 gqaz602XARMBoQilmFjbdQMTpXp9Ols/uPMZwaXeWQ/YsftVBAnOCkPFJVwOEhJAGzHj
 4igZo/d/GSphULrD/hJbheAsFgf9D4zgVjv6r61QXFW0doyoAWpTelVO61it552Ydcqp
 YwZABI2ajwBiOLZhRjDPk5sQYvjnZNLMorQ7GQa/YoFiart/Ta2VcGkqcwVjjuQk0okv
 /LVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680529766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H2FeLZKR7rrXEZU0aPhVzNZ/e8CIWD3g/VnvrT6YWk8=;
 b=Z7qTyhTjGy/PtnLGOWGj0TOAhxwUZx8Q07wYLkwjiUgWuJFjmkfSoctFNb3ZueycKD
 RA9oF0+TjWJDn6eagLwLOBQYHIt3XGMfW/ny5XedGGpIOQzWE1ZSV6mn9MNGiR0f+Ng2
 YJh4dZ6hQE5JJiVL14EAvTIW5G+vs4m+I+SpNOJTBo+pUn1wmuqbgCc49dtu8mXFrGf3
 TKxCiXmCqRRc951dv49Q1A5wd+uE5cQSZVvspeqTB9KpQ0j7A/6lNNoMg5xCBLocXmuD
 EYcuhnc01uuMSp0EN9/7MjRNAHy4FH81SUjC3IinHVNqu0g+VnKcNmcTPCY8xU8UAe1V
 3k9g==
X-Gm-Message-State: AAQBX9fuA/w+tynOHvYCB//CQ/WazzZZh5//CBPsyjFEy1KQ+7at8j1C
 6xvMaB1bE6BsawP+hab8q4cNJg==
X-Google-Smtp-Source: AKy350YA40DrGkbdfx/WSsRDtrRoPhUtAlw/ACRAcCii+kLbD9pF4FXTjcactSbOaqPqWUvzTTEOXw==
X-Received: by 2002:a1c:4b04:0:b0:3ed:c84c:7efe with SMTP id
 y4-20020a1c4b04000000b003edc84c7efemr13588895wma.7.1680529766064; 
 Mon, 03 Apr 2023 06:49:26 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a7bce08000000b003ee70225ed2sm12182902wmc.15.2023.04.03.06.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 06:49:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC70C1FFC1;
 Mon,  3 Apr 2023 14:49:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v2 10/11] gitlab: fix typo
Date: Mon,  3 Apr 2023 14:49:19 +0100
Message-Id: <20230403134920.2132362-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403134920.2132362-1-alex.bennee@linaro.org>
References: <20230403134920.2132362-1-alex.bennee@linaro.org>
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
Message-Id: <20230330101141.30199-11-alex.bennee@linaro.org>
---
 .gitlab-ci.d/base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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


