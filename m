Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5E6620C23
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 10:25:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKpO-0007HA-Pd; Tue, 08 Nov 2022 04:23:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKpE-0007ER-Up
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:23:21 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKpB-0005pP-Cu
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:23:19 -0500
Received: by mail-wr1-x432.google.com with SMTP id j15so19957175wrq.3
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 01:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U0bUaw8dD9ywC6S/a5dl4BRNFGfCaE47JrvKC4nt86Q=;
 b=qLQHKRlZM4PYVqEZYXi0VpdmRGdlZ4kHL1DfUgmDRmPx+hs3RbDnmmDe0x0C7X6UHc
 yrX+VUC6b6++fAqWTKBJtz9GBNm0zeK20VvolZx5neAaxggotvlSDoKeuMjW3BWYY6o+
 Xq1L94ICZbTn70nhwazmNCSDbGMtswMRKHZnbDaBpA6qk3YzJn1AW0ubhANOKc4VkNSk
 lw6aDFQpezCMWwrfL/pXRTx5UuWxkUO2CiTj2uZXDhPxXk/aRS+f+OI5/hiUXE7FCRrL
 cuekS2mYSk5YcuSFfZHStgOjVvfd2J7x5xO5fvj5kWsh5CI2AhnqXLSpE+CE/QLef6dG
 Gkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U0bUaw8dD9ywC6S/a5dl4BRNFGfCaE47JrvKC4nt86Q=;
 b=7/0VWrDf+Fl/XaBxZJ90SvSqkD5kuQZwWG60qmPTKIi0JwScGv+tFLe1fzjEUrz5aq
 rOna4q2ItXisbUJoIrBKzNPAmTYcSUSIFPAf8q6IfX3ad3RsiwZ1iAoxMMSCfMJC4MD0
 HbTS/znfoiNT0dUKrzSN6iPKUnWwwcESCpyBtcDo5I0PnCYToWcuozNj+/adbSnaF/Zd
 YjuJGur9sAO9IDzRYPkmHy+OiazTMZGnkxDTYuJay9/MroHwWM0q2hiBFN3jGPc9U/Op
 QHNiIe40GzIwUlHf0QPf4/iR8qWLWHo+gQE70Slnw/ygYAgzCW6Sf2QcCvgJgiJfHkti
 /60Q==
X-Gm-Message-State: ACrzQf34pEbzD00f2lFaKQ2PU0mr8w0PTvyvRdkhprybJbbZHAM1PEfg
 v3On8GLKyWHvGZe3vMz2f4vjww==
X-Google-Smtp-Source: AMsMyM7OcRqwvZIzLqkd0e5EhuCQR+k6BqCnD3665xvxHBjClmCGx9eabB5o9OmycKZRALs0XOuR1g==
X-Received: by 2002:a5d:4644:0:b0:236:cb94:4c6c with SMTP id
 j4-20020a5d4644000000b00236cb944c6cmr29928685wrs.544.1667899394963; 
 Tue, 08 Nov 2022 01:23:14 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a5d434d000000b0023647841c5bsm9553376wrr.60.2022.11.08.01.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 01:23:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E42401FFBF;
 Tue,  8 Nov 2022 09:23:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 7/9] docs/devel: make language a little less code centric
Date: Tue,  8 Nov 2022 09:23:06 +0000
Message-Id: <20221108092308.1717426-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108092308.1717426-1-alex.bennee@linaro.org>
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

We welcome all sorts of patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221012121152.1179051-3-alex.bennee@linaro.org>
---
 docs/devel/submitting-a-patch.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index fec33ce148..9c7c4331f3 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -3,11 +3,11 @@
 Submitting a Patch
 ==================
 
-QEMU welcomes contributions of code (either fixing bugs or adding new
-functionality). However, we get a lot of patches, and so we have some
-guidelines about submitting patches. If you follow these, you'll help
-make our task of code review easier and your patch is likely to be
-committed faster.
+QEMU welcomes contributions to fix bugs, add functionality or improve
+the documentation. However, we get a lot of patches, and so we have
+some guidelines about submitting them. If you follow these, you'll
+help make our task of code review easier and your patch is likely to
+be committed faster.
 
 This page seems very long, so if you are only trying to post a quick
 one-shot fix, the bare minimum we ask is that:
-- 
2.34.1


