Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E234E6F4808
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:10:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsZ1-0002sE-So; Tue, 02 May 2023 12:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYq-0002oK-Mw
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:05 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYn-0000l1-Ib
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:04 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so39873405e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043736; x=1685635736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZP31Pk3tH34mbeH0aDrvA9wL/7YteLfz9EWB0OFwplU=;
 b=IbRs+cx3OVUZsotJShRta6LhNB4MH7w5kpDnzogltARZc+W7uSkBsdIAQybtMsOS2A
 qjHXa4L7sk21Qa+US9GCJzRvN6UMCvIlv/ZhjTIOt/j1HCDXiEFXWxWYS9CbrXQDU7yo
 1cDs7S3zlRq1K+QATbOphWIgRnCoyuzPPx3DDiuJM5dgA89QT60hChMaTdIvAmngrR0D
 mGN5TOhMGYKY5WX5Vcsjx+1pCuBcfxSmNbqrR2dloRqGbn0tNo91prfIoDzQd+bwBawL
 doEzqdpkCrUFt34tfr+aq1BJeQv4p/7PRnbBuZHX/RQUqsn9yfZdNQDvJhR+qUbnOUCU
 4rqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043736; x=1685635736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZP31Pk3tH34mbeH0aDrvA9wL/7YteLfz9EWB0OFwplU=;
 b=ZYpVLu5gyhtWqXTbvFu4sSuG69SLie83+UIy6hy8RG0oZBhbaeDbu/cqsTIZcWumUo
 7spc7NEqJJU5PyVZ4SCkAS04VknBoB0GC+VmqDjzZ47PkfTsC+ieq3JQG2JTV3XSUpFc
 Ppk/gBkEA6pVpM/S47U0B+hwh1l9J2RG5vXNB0yb3x3ZhbrphJi2cZftDXuJVl+gw4je
 9We+Uml6CTu/QvCmeDiOGIblFdUgbixgzuUzC06fo2qPE7yZGzKXU85NK7DBOhtW79Cd
 lRxhuCjD2wmrmFr8MPzAy4NBQ0SUyQOyukkh41nHNIz2cE3nL3VK79zSiuXX8iefOiFp
 EAjw==
X-Gm-Message-State: AC+VfDwGLWW4nGcD8A2ERdx2FLN+p5NOqLqseBhRROnwT1Z/Rc9irs7C
 lgj5qJoAmKbt4TaaXXS92Jn85AIVN01l5g08SVDdug==
X-Google-Smtp-Source: ACHHUZ6+5pwcEKPzcSa3g9R1AwJ5D1m5rqwvTM47eBl7peHJkCxeHfoJa5WegxBP7eumXJKm7cbWIg==
X-Received: by 2002:a5d:470c:0:b0:2e6:3804:5be with SMTP id
 y12-20020a5d470c000000b002e6380405bemr11146550wrq.59.1683043735769; 
 Tue, 02 May 2023 09:08:55 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003ede3f5c81fsm39918471wmo.41.2023.05.02.09.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:08:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
Subject: [PATCH 12/16] target/sh4: Remove TARGET_ALIGNED_ONLY
Date: Tue,  2 May 2023 17:08:42 +0100
Message-Id: <20230502160846.1289975-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502160846.1289975-1-richard.henderson@linaro.org>
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/sh4-linux-user.mak   | 1 -
 configs/targets/sh4-softmmu.mak      | 1 -
 configs/targets/sh4eb-linux-user.mak | 1 -
 configs/targets/sh4eb-softmmu.mak    | 1 -
 4 files changed, 4 deletions(-)

diff --git a/configs/targets/sh4-linux-user.mak b/configs/targets/sh4-linux-user.mak
index 0152d6621e..9908887566 100644
--- a/configs/targets/sh4-linux-user.mak
+++ b/configs/targets/sh4-linux-user.mak
@@ -1,5 +1,4 @@
 TARGET_ARCH=sh4
 TARGET_SYSTBL_ABI=common
 TARGET_SYSTBL=syscall.tbl
-TARGET_ALIGNED_ONLY=y
 TARGET_HAS_BFLT=y
diff --git a/configs/targets/sh4-softmmu.mak b/configs/targets/sh4-softmmu.mak
index 95896376c4..f9d62d91e4 100644
--- a/configs/targets/sh4-softmmu.mak
+++ b/configs/targets/sh4-softmmu.mak
@@ -1,2 +1 @@
 TARGET_ARCH=sh4
-TARGET_ALIGNED_ONLY=y
diff --git a/configs/targets/sh4eb-linux-user.mak b/configs/targets/sh4eb-linux-user.mak
index 6724165efe..9db6b3609c 100644
--- a/configs/targets/sh4eb-linux-user.mak
+++ b/configs/targets/sh4eb-linux-user.mak
@@ -1,6 +1,5 @@
 TARGET_ARCH=sh4
 TARGET_SYSTBL_ABI=common
 TARGET_SYSTBL=syscall.tbl
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
 TARGET_HAS_BFLT=y
diff --git a/configs/targets/sh4eb-softmmu.mak b/configs/targets/sh4eb-softmmu.mak
index dc8b30bf7a..226b1fc698 100644
--- a/configs/targets/sh4eb-softmmu.mak
+++ b/configs/targets/sh4eb-softmmu.mak
@@ -1,3 +1,2 @@
 TARGET_ARCH=sh4
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
-- 
2.34.1


