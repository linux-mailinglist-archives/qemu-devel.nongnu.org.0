Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B216D00D0
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:13:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpG8-0007Xs-0I; Thu, 30 Mar 2023 06:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpG4-0007VR-86
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpG0-0000I8-1l
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:51 -0400
Received: by mail-wr1-x433.google.com with SMTP id h17so18467945wrt.8
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680171106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aAQgJCH18/CDlsc1qwu2JEm4YqYOxyDBS+oIfEkPhU4=;
 b=ijq24rLbw9KB7Ngpuo9nzmlgr9AH/Q+z70z73FtVBz3eEZWNULgLQX3F7BfS/cCMcv
 LFceQ8MWV5+ltBHlq5FpZ4hN0TBQYeArPpVRxb1KatMskcUh1EjMPDkxUpiaiJiSiLeS
 TQ0NM4D1vWhWRESMTUyf//HpY41lt4AAoAEAroyVFb5msn9pBokNptAogJHH48SxVJh/
 Jo5jyEXbH0ivTIXKItOsUo41YjdqUpkuW7S5QseJAh4QFTTuUMwULMOw7XQIMuwYM+PR
 zA6sWXJi4pGDWYtGdtuUZySCgZprTxF4HS6TdggiWsy+VpFA6+/jYPJx+HvH1u6YhAiX
 rdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680171106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aAQgJCH18/CDlsc1qwu2JEm4YqYOxyDBS+oIfEkPhU4=;
 b=zSltP/P0bsJlaMpppRB3sDZx4B8cjgs4DbOF3Yu9pp5Az1WB5gE2qVtVuLc6F4b2EP
 pu/hGwwJ9Oyp3VEWH6PH71T4XJG6IpYo1uu1bukvouFam07t2wfcMVkl/JPCmg9LIFtq
 cUYGyY6WNGEkufFu3I2Gs77sC+BSD+ViqjyqkMsA1HHnD8X3HFpIPQSMfvog/t8Q1d+G
 L7DC7dY+DEulAUQ3mrEx1KQ9xEvas5DaxuOohbaUO2QfDLSPtyGNSHH5u/DqwLg+e2+u
 2Wbn10yvtbbwzo2UBAcniGcbmcFDwtGe2UhS6cVByjBL4tlZLRcoJFthtdspgjSAlnMB
 Enqg==
X-Gm-Message-State: AAQBX9e7gkpX76ows17llkP/Tt4POjxEY6Gl2C3fON2utQwbXFCOLmpu
 fsXucVU7rS350rtTha66IPuP5Dxo8qdK8RBK0FY=
X-Google-Smtp-Source: AKy350b8oUC9tCPFcYOaJu0vRNS/X/VOtiKFgLUi3FKMTmt2a1J0VaBNs5zc3zX2Ys3O1e9Ks9ZNmw==
X-Received: by 2002:a5d:4b8b:0:b0:2d5:a170:839d with SMTP id
 b11-20020a5d4b8b000000b002d5a170839dmr16514004wrt.25.1680171106299; 
 Thu, 30 Mar 2023 03:11:46 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s11-20020adff80b000000b002d6f285c0a2sm26315520wrp.42.2023.03.30.03.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:11:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 161811FFB8;
 Thu, 30 Mar 2023 11:11:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH 10/11] gitlab: fix typo
Date: Thu, 30 Mar 2023 11:11:40 +0100
Message-Id: <20230330101141.30199-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330101141.30199-1-alex.bennee@linaro.org>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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


