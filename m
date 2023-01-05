Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266A565E97D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 12:02:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDNzo-000848-Lq; Thu, 05 Jan 2023 06:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDNyz-0007qS-Ps
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:00:48 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDNyu-0006I3-NN
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:00:24 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bn26so16260846wrb.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 03:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZoFxevuB+T1pEu36eHuvTSjoXlJGyGJJdUVJhD66Pi0=;
 b=qo9mJ77mB/emd+NuWK4EZGpl8nvAC+WnJCmL3Q8ypoP8JA+0CZB/RADU8eeHGQRpxo
 0Ik7EhcwKKes0THJpMMI/ov6LSPjLRDwehcop53LmeaJmIp7lu4ktwgAF4HKiVmjS5+e
 1JhGglqsOnObQVCW8SIR6v/XsFLFwV0y3/xzPZimv/cx7jkAqLTDVeozcOC/KymYCeCS
 X1I+Q0DsmzkeUF1SjCGtES/ZbxzteFObXOvHiIHLLaBgbA2nPmOpuIHI2F8mbI4KP+0W
 +piDwB84GLxHqJ29rVzo59n8Wnbj7lZ0pF7zGjZzPQps2FJE6mEsPlTxnVP7nEeGmTdp
 roXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZoFxevuB+T1pEu36eHuvTSjoXlJGyGJJdUVJhD66Pi0=;
 b=kjYrMmER3aDaEZYS8qkPEtHIVglpk1Sb89ca71Gn5uWFXLZzL1zv8skSViSeoAL96/
 TS3phHmZZTP37kXXT1AQyDX3FowRAr2ZgCpFxgAUw56SxaJk85yvPuacj5PnCgsKfYIS
 A60Hw9BAJAUllvAsR/DwFjnoK9DBTnYfgI43/ec1o7i1mPZr2Ly19D2fLJzO69QBvUeE
 J9r+/F961R+kyRqAon+z1JSS3CmbbxK5eb4dfB94fZnCaf2pDjFZ/bd21kdGfM/LkS+g
 u6rReiYWsdmWq18ElBZFb2IlUTLUgsbz+qAMDrhA3mcASPrnPFePt7EqAfxI9oUVTNKu
 zALg==
X-Gm-Message-State: AFqh2krnWTg6x8zq3T3q+aA7cQbvLypi9eJxGHuXQLhYP3YnUSMTZ/8w
 wbHhh1fU2JO7FVchXzW8UHbfgQ==
X-Google-Smtp-Source: AMrXdXuYkqu+NqQBQOcl02y4OuVrGNF9XfmOD06fGFHCg8XepjhSF8KuZG6PrcB7qr7L5hlzXv4lUw==
X-Received: by 2002:adf:da52:0:b0:242:1bdf:a02 with SMTP id
 r18-20020adfda52000000b002421bdf0a02mr26937208wrl.37.1672916409032; 
 Thu, 05 Jan 2023 03:00:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d17-20020adffbd1000000b0029c5e06516bsm9025676wrs.14.2023.01.05.03.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 03:00:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9BADF1FFBA;
 Thu,  5 Jan 2023 11:00:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/4] Makefile: drop microbit.lds from the sources
Date: Thu,  5 Jan 2023 11:00:05 +0000
Message-Id: <20230105110007.1977399-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105110007.1977399-1-alex.bennee@linaro.org>
References: <20230105110007.1977399-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

Otherwise the compiler will complain about the lds file being included
more than once as we include all the dependencies in the compile step.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f58b79e..7b9a5f4 100644
--- a/Makefile
+++ b/Makefile
@@ -75,7 +75,7 @@ all: usertest-a32 usertest-a64 usertest-t32 \
 usertest-srcs = usertest.c semihosting.c semicall.S printf/printf.c
 
 systest-srcs = start.S string.c $(usertest-srcs)
-microbit-systest-srcs = microbit.lds start-microbit.S string.c $(usertest-srcs)
+microbit-systest-srcs = start-microbit.S string.c $(usertest-srcs)
 
 usertest-a32: $(usertest-srcs)
 	$(A32GCC) --static -o $@ $^
-- 
2.34.1


