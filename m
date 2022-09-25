Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1FD5E9329
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:40:06 +0200 (CEST)
Received: from localhost ([::1]:43980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQvV-0000vR-2K
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsX-0003pt-O2
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:33:05 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsW-0006Vn-8Q
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:57 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so4371303pjl.0
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=zI8S+RBT1OKVz18s8MzM0BknkzeLLfGnw9ZmAFPh81s=;
 b=XinJF7eikkeRLkkgoN1DbgEItZCiLlysGWElcYqEZ+nDWvssF5YNSBr7cZgJuBLvsz
 n5gb4BgPrMLK9hI5FccuGHC30isNv9jphDbHdOTmQ6YoTR0Vj9bwkeotGbCb2UCEFFnf
 Umd5avZc2fzFw0WArqL1Azev0VsVy22fG7tArqL57p/2e0DPIi+ZCqjYUOClA2XiJKXA
 QbwFPH0JMRKxoTfPyaii6/NilcSUWOaNnp4/gFfebTM4RBRQeNvtsO4+pRpIi/irgXVv
 DEfiGevhKLfS6lsSkqVevf+Fcx0nszr6EkPpJyjejSzTFr3crrEdwAFiy6WsVJcjuWKi
 Pezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zI8S+RBT1OKVz18s8MzM0BknkzeLLfGnw9ZmAFPh81s=;
 b=kO6eiRUXpZQu2EBJDw8pTnc+O9WAVWWnzaeQYfud7HH9C0shLdfAuVQB5TwOb4eTq8
 DgmwQFkYnB/do6BhxeszMxyVGhx+quw05qTeS6F+sRcmKWdBVpa0CWcQMyxHyJ9G4rSQ
 dlnyXjhxoLrtmbJpcitNcmJbflajrW9LMT+gi9QIM4n2bbbikQKRQsWMJj3O7s4S5nug
 PGNbjuA6izhvp7RkSN7H3nw3JErKWHuXzbJhsC3011+XlqcvXhE1jnAloXHXlH3FceEC
 CE6cpG9ZmPfBcI3CyaNTG6e3VtpEVX25L+6GfZ45tJzzTEuJTD+reyEeLxNGlRJsOeyQ
 SN0g==
X-Gm-Message-State: ACrzQf1iRIn1kF4lgtXhX8vP2tt2PiygfaUB/WVdwLDAjsnZy0NFOWCG
 lC7C6YjsnZiJY3soJ+kSzde6HrOXnxE=
X-Google-Smtp-Source: AMsMyM4ifsv+4XUtmrnBkP6Z/G1PFcRRA26xEkXPE5UUdcKpRE4mPUCBCkOAekvew5//BccjV1CoKw==
X-Received: by 2002:a17:902:b710:b0:178:3128:b593 with SMTP id
 d16-20020a170902b71000b001783128b593mr17029118pls.50.1664105574646; 
 Sun, 25 Sep 2022 04:32:54 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:54 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 52/54] .gitlab-ci.d/windows.yml: Display meson test logs
Date: Sun, 25 Sep 2022 19:30:30 +0800
Message-Id: <20220925113032.1949844-53-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

When CI fails we don't know what causes the failure. Displaying the
meson test logs can be helpful.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v2)

Changes in v2:
- new patch: Display meson test logs in the Windows CI

 .gitlab-ci.d/windows.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 9ef4667317..29a3ba04a4 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -61,7 +61,7 @@ msys2-64bit:
   - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
       --enable-capstone'
   - .\msys64\usr\bin\bash -lc 'make'
-  - .\msys64\usr\bin\bash -lc 'make check'
+  - .\msys64\usr\bin\bash -lc 'make check || { cat build/meson-logs/testlog.txt; exit 1; } ;'
 
 msys2-32bit:
   extends: .shared_msys2_builder
@@ -94,4 +94,4 @@ msys2-32bit:
   - cd output
   - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu"
   - ..\msys64\usr\bin\bash -lc 'make'
-  - ..\msys64\usr\bin\bash -lc 'make check'
+  - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'
-- 
2.34.1


