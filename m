Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B5C4D9B09
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:23:13 +0100 (CET)
Received: from localhost ([::1]:41370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6Cm-0007Ii-AC
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:23:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU62w-0005uV-CY
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:13:02 -0400
Received: from [2a00:1450:4864:20::52f] (port=44667
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU62u-0000aG-Fm
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:13:01 -0400
Received: by mail-ed1-x52f.google.com with SMTP id w25so279186edi.11
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q6ICQahoGgWROzFtEM9kF20mPI+V4fHTOd7Dw8tvNbA=;
 b=ugVDMp6K8jWbis4g8nzq5ICH15M/aV28SCIyMZ7vfJM9zyoe7b9I236z1lydZ3TFxz
 u/ibTh/a6zCg+UReZsZPeTvg6EKLJsE9niamt56Yj5Q3NcM4yMTBPn7sMY1J0pUb5lN7
 yUGP8JTxooe6YHDuzDnVTSq73Q2H9oWfRaKnHC9Jj1Z1P/CIsoA91W4oMyw5RFYZlXIN
 fV+URM02cUPyLOXAtA/xZWADXL51jtt1i6IH/1sKpTMRlSC3Q/IERrgTGBEoxUTQAHel
 lcIALZXkM/H4cyxzP1usuCsw+TBhFPTrn+HdU7iLo/hwOdm0ZnypEb/GfognxTJ/PKkF
 ymAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q6ICQahoGgWROzFtEM9kF20mPI+V4fHTOd7Dw8tvNbA=;
 b=2skIdN0CHET5mh2YZpTydAslbg6bw8w233vxYDf6jXKxd7CSEqRhKWxOdZbxADu7+K
 gZxhUgWBt0DVjiNX47YBQswLLOd1G7P6ee1oPTr6jTtTzV/A+Q9xr8xPADN1vtyOq7c3
 ZH3Y2fM2rWuIv0bBSebfSJ6f3bzq2BRcwRBOTJxCtkfLYPc8HYA+Dz8iI58u42e7B9RD
 NDb79l9FGmtW9UV3rGBpXh6FbfLXnUVfjMl7Lhs3GCTsUn/6nT+CwFGMe2mqQhSw5qYr
 wK0HvPgG5Uqwcweaj/BQRmkIbracLUKI2nS4Izv5KUn0M3W/hJBcj8k5I+Sq4fLDe451
 4DHg==
X-Gm-Message-State: AOAM531zHTl8xFxfK+39kVCuTP+wJ6Bx3wWZ4PNvmZh8BgvNbVbDKr6G
 Jhm5IzdkKHXqLUbOqVTnyVg8WQ==
X-Google-Smtp-Source: ABdhPJx5XxiK9tf0xUrhBcB+/JqOTTi5z/F5HZJLnVQdZamwxg0vBRLX+wdHlO5ARYSdkrFHWW4xZg==
X-Received: by 2002:a50:bf0f:0:b0:410:c512:cb6f with SMTP id
 f15-20020a50bf0f000000b00410c512cb6fmr25540996edk.262.1647346379243; 
 Tue, 15 Mar 2022 05:12:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 gv9-20020a170906f10900b006d7128b2e6fsm8061677ejb.162.2022.03.15.05.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 05:12:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4A01D1FFBC;
 Tue, 15 Mar 2022 12:12:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/8] tests/tcg: drop -cpu max from s390x sha512-mvx
 invocation
Date: Tue, 15 Mar 2022 12:12:47 +0000
Message-Id: <20220315121251.2280317-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315121251.2280317-1-alex.bennee@linaro.org>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 David Hildenbrand <david@redhat.com>, sw@weilnetz.de,
 Cornelia Huck <cohuck@redhat.com>, richard.henderson@linaro.org,
 f4bug@amsat.org, "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With -cpu max we get a warning:

  qemu-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.

But dropping the -cpu max and it still runs fine.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/Makefile.target | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 257c568c58..7aa502a557 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -34,6 +34,4 @@ sha512-mvx: CFLAGS=-march=z13 -mvx -O3
 sha512-mvx: sha512.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
-run-sha512-mvx: QEMU_OPTS+=-cpu max
-
 TESTS+=sha512-mvx
-- 
2.30.2


