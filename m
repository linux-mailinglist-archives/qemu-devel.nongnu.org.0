Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828305B8C85
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:09:34 +0200 (CEST)
Received: from localhost ([::1]:45624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYUxB-0004yh-E8
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnt-0006Rr-Qy
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:57 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:41888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnq-0002mD-HK
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:57 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 az24-20020a05600c601800b003a842e4983cso11896997wmb.0
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 08:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jrKSxnfwgGSXnfdRpcO/7SXLAwMYVDBeU9cPTzC5/8c=;
 b=UeCFjwsZm/xq6hwIwH8qqrE5hVLTm1fIshz48aVreOLgdzRTv0PWCVDpcM47X+jucI
 7kqrtTswgwca/d7yMW8mWTgR58+992XEV7Crjumr3bxZLrtgfmzQk+uqK86Ib48YpydZ
 lVDnqCJDnHURr7YpsFlYeXd2h7WJkrcm33eEdeU4xMt05kEmIR0sv/+v6Wm5jzhiiSlM
 VLmy69351y7PSG0pCOw3VDKqgLE0lrLD4RRqS1647Jdf5wAyRowiKI+MdcZ1SIsdNk0N
 3lMhOMjSrzyUxAgM/YOPheb63OAVfnaHijhbt2tIlYOjHkB3gCcOC/qJdd7BHqZdzw/9
 6LPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jrKSxnfwgGSXnfdRpcO/7SXLAwMYVDBeU9cPTzC5/8c=;
 b=WYsjKR8F2BTSCBqRCI1sS2XafIzMEJHN+vKMfwmIh5/aKcpgFEzgrvf9omxYZOjXHW
 ZOTgwmL9FbZQ6FjcCR9/5b8cLJCjA5LlX4aRXf9MmfEvpPW57/b7VFW1/vdkgHAeBtLa
 /mEhqyBaNzI6hdYjQ4iKtVY08V2sA1nrXVZJTqvv1Jlypwf+xBetKSMr3M9ndq5mYH6F
 pbE2jsWT+lrLq98vA3ovT6C4alTHlvmqn8utKYQqTycHQplLu36xjsvL02jiVJOlGBV0
 nDuP1oAYc4YOkIqPVzM7kbskTa/mMOOTT8tS48hJE79dihNuxW/BnaC+DlCT0mGRoM+Z
 wqcQ==
X-Gm-Message-State: ACgBeo37nk0a4QjtNiBCnJ79Q8dRqrnkoyFFlP+69139G7Z37i/ponAk
 fSIxa883FJtdx63XR21YuEIaFg==
X-Google-Smtp-Source: AA6agR4FTiACD8D+YVwS+03T50MR37j5MdyoS8pzBu5SeGTFHBliCcOhgIgHMzm9UgJRdLhS9KCtWQ==
X-Received: by 2002:a7b:cd96:0:b0:3b4:856a:28f7 with SMTP id
 y22-20020a7bcd96000000b003b4856a28f7mr3762687wmj.117.1663171193076; 
 Wed, 14 Sep 2022 08:59:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a5d5947000000b00226dfac0149sm13880895wri.114.2022.09.14.08.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 08:59:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 820FA1FFB8;
 Wed, 14 Sep 2022 16:59:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 01/30] gitlab: reduce targets in cross_user_build_job
Date: Wed, 14 Sep 2022 16:59:21 +0100
Message-Id: <20220914155950.804707-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already limit the scope of the cross system build to reduce the
cross build times. With the recent addition of more targets we are
also running into timeout issues for some of the cross user builds.

I've selected a few of those linux-user targets which are less likely
to be in common use as distros don't have pre-built rootfs for them.
I've also added the same CROSS_SKIP_TARGETS variable as is
occasionally used to further limit cross system builds.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/crossbuild-template.yml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 28b2142ec2..5e8892fd49 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -46,5 +46,8 @@
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
-        --disable-system
+        --disable-system --target-list-exclude="aarch64_be-linux-user
+          alpha-linux-user cris-linux-user m68k-linux-user microblazeel-linux-user
+          nios2-linux-user or1k-linux-user ppc-linux-user sparc-linux-user
+          xtensa-linux-user $CROSS_SKIP_TARGETS"
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
-- 
2.34.1


