Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8AA3D3E38
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:09:40 +0200 (CEST)
Received: from localhost ([::1]:52436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yg7-0003bR-SY
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybB-0000D7-5C
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:34 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:46631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yb9-0005Xr-Mj
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:32 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so2009969wmb.5
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VOcghLSQdvz2t9MzW9ubFO8rhr/CI4VbHUUsFUw4kQI=;
 b=dGUJhU09LKtJcpT6Sk6m7bOmuxC90lbLQEBJ1nwSbhr0HRsxJS7GkdXX1lvZihcZm3
 S5BBszKT6rr2i/yrK8UxhUkqKuMId/2WoMLqAAGnORY31Ul4WJWMNr+f8z9c6wfLowOS
 0WnSmPvZoQmdmBKBVLXM+TOy8ytLmLwtOoYlVbiEoGK7haUzLpUAVK+cht0eZBkr0l/A
 E5sbZmFP5NoCYkYN5/Um15qXO24Vu1pkkwjxAFAms2RKRTcvCXNi+/evYZnEC5vPidFQ
 YsVFjeTEjExw7xL1ZEmQzwkE6yhnrt6TUb5qikxD4pgdN1d2oPEjxbN9Wac1VQlbLYd0
 lOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VOcghLSQdvz2t9MzW9ubFO8rhr/CI4VbHUUsFUw4kQI=;
 b=K5OH8Be/d1dL1G7eI3JUivWDw/PwvylSVcjlsLJsaS7rw12Zx2bEDXW44s3GI7A0kz
 giaHepo6Yc6SWBcJ7x96mKrT3QkOc4UKab+iYn+VuGouF5truPC6mLNOC5zXbeZ1U3U8
 //6oODc3cou2q+DEtTN0NG+2sDddexa4n+v2Xc0WGb/Gvr5l2gLKlUgqkeyhlACkbhiE
 mT7RSaowTPyb8YQ1G2fX6lttr9j9z5Zs51DObtNxzb+ampByqFjZhP4J9RGFZ0GgniTV
 ItnGRyHC57rxp7df0WTyrlXM8t5jfNqhV8+ZbBcuAPs3DAvVGRGE4mqx//gm+rCpGpSb
 CFRg==
X-Gm-Message-State: AOAM531lMtWrZaoTmQtxFkKQKVzgboc/mIHW5x9aNnY3OugAECIDCTGQ
 gk8o2/q4XkazB9y6FqY6ZFL8iQ==
X-Google-Smtp-Source: ABdhPJyBrpsov2iDlRSnODMLMr2bF6Ua+6BLpypu+U4dRlnJ/wwLzKB5eUBI+Qgo6UoXFgHbizQ+6Q==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr14728437wmi.159.1627059869832; 
 Fri, 23 Jul 2021 10:04:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w16sm19811379wru.58.2021.07.23.10.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:04:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CA61E1FF92;
 Fri, 23 Jul 2021 18:03:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 06/28] .mailmap: fix up some broken commit authors
Date: Fri, 23 Jul 2021 18:03:32 +0100
Message-Id: <20210723170354.18975-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Nick Hudson <hnick@vmware.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Marek Dolata <mkdolata@us.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: 49a6f3bffb ("target/arm: Correct the encoding of MDCCSR_EL0 and DBGDSCRint")
Fixes: 5a07192a04 ("target/i386: Fix handling of k_gs_base register in 32-bit mode in gdbstub")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Nick Hudson <hnick@vmware.com>
Cc: Marek Dolata <mkdolata@us.ibm.com>
Message-Id: <20210720232703.10650-7-alex.bennee@linaro.org>

diff --git a/.mailmap b/.mailmap
index a1bd659817..082ff893ab 100644
--- a/.mailmap
+++ b/.mailmap
@@ -27,6 +27,10 @@ Paul Brook <paul@codesourcery.com> pbrook <pbrook@c046a42c-6fe2-441c-8c8c-714662
 Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe2-441c-8c8c-71466251a162>
 malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c8c-71466251a162>
 
+# Corrupted Author fields
+Marek Dolata <mkdolata@us.ibm.com> mkdolata@us.ibm.com <mkdolata@us.ibm.com>
+Nick Hudson <hnick@vmware.com> hnick@vmware.com <hnick@vmware.com>
+
 # There is also a:
 #    (no author) <(no author)@c046a42c-6fe2-441c-8c8c-71466251a162>
 # for the cvs2svn initialization commit e63c3dc74bf.
-- 
2.20.1


