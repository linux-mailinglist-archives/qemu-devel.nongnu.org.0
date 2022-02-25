Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49554C4CD4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:45:32 +0100 (CET)
Received: from localhost ([::1]:50644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeep-0004Bb-F7
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:45:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGz-00044B-JC
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:53 -0500
Received: from [2a00:1450:4864:20::534] (port=35685
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGg-0002Lj-6l
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:44 -0500
Received: by mail-ed1-x534.google.com with SMTP id bq11so8374794edb.2
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ns+fYWljoLwi6Vr9txF+6QpXpSI1wN1Odp6zKAkN3xM=;
 b=mElp9feFVLRiU8AnVqG5imkSHn/hXUNVoCNeTyBFOUP/OnAaYY8i9DLqfMvypQPnIH
 MKgoeWz3Zj2wn3GCqS2U5pi5WWb7ve4Te1XIy2SmFRNlUTplQ1MHdLC+Y6Ad+1yOpsnl
 y0TJ7my6Rmr+S9X9RRhnLvwX1JVChZj+jW0JSfre0OAn2SajtwHzIoGKIp4z72oS/2TG
 /WIzXTvX14jfxOfnxdS/G5CCkC/TsEbizepv4exNOy8wnV/YkxnxtCIKL7bu+VZyaTKh
 7//auBYyNKWeYQZJgQohzUyvJIquZ9jXid+I7LBC/fGb25sn2WE0R9B2O7H7YxLeMlYw
 dTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ns+fYWljoLwi6Vr9txF+6QpXpSI1wN1Odp6zKAkN3xM=;
 b=xGyPV45PUnS+6/TIQJ2TBMI9EuVP7PJ5ZuNnwWnbI7yIeMTiC8w3UMedrnpcF56l5I
 uDn49QP+YUg581LypzBY4VD3VfYJfyJLvOVSQsKzG1nCbqlXrpxFQGHNO0hKTs7IftI4
 NnEm24FIunHhy+EShEsfBm5B19sQZaS+ozPZmuVY6Ef7TNXYrcwuFYJVlIIdjEljyVgL
 5wzKhcNAq3sZAvrbjIFVTVyCptGoDpkyZzQlX/1KgkFIy8mfVRVeSqBiKII+qwT7N+KB
 gegfRgwjrVHPD5mM1kDCG5do1cYHUqkvEjoXgWmFWgTnQE0p+djEu2ma/YrAxXA/8dik
 QgiA==
X-Gm-Message-State: AOAM531Gwq/ufT5UmOOhf+1WgVpl3wmz966dF25JmxzXSWqkKdH4WaeL
 uYYohw+I2+Lq1M7HmSF7Sp0wew==
X-Google-Smtp-Source: ABdhPJx8FAP6F8AOH0xapCoWbOy6K5jD7XciJgJ20BJpxMUkH4IfWMS4Fet1VM0FfCcyXzGryfxqCw==
X-Received: by 2002:a05:6402:40c1:b0:412:b240:dfeb with SMTP id
 z1-20020a05640240c100b00412b240dfebmr7809739edb.239.1645809632251; 
 Fri, 25 Feb 2022 09:20:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906059100b006cee1bceddasm1202190ejn.130.2022.02.25.09.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:20:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 055B51FFC2;
 Fri, 25 Feb 2022 17:20:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 10/18] tests/tcg/ppc64: clean-up handling of byte-reverse
Date: Fri, 25 Feb 2022 17:20:13 +0000
Message-Id: <20220225172021.3493923-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, sw@weilnetz.de,
 richard.henderson@linaro.org, f4bug@amsat.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than having an else leg for the missing compiler case we can
simply just not add the test - the same way as is done for ppc64le.
Also while we are at it fix up the compiler invocation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/ppc64/Makefile.target | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 0368007028..9d6dfc1e26 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -10,19 +10,14 @@ PPC64_TESTS=bcdsub non_signalling_xscv
 endif
 $(PPC64_TESTS): CFLAGS += -mpower8-vector
 
-PPC64_TESTS += byte_reverse
 PPC64_TESTS += mtfsf
+
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
+PPC64_TESTS += byte_reverse
+endif
+byte_reverse: CFLAGS += -mcpu=power10
 run-byte_reverse: QEMU_OPTS+=-cpu POWER10
 run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
-else
-byte_reverse:
-	$(call skip-test, "BUILD of $@", "missing compiler support")
-run-byte_reverse:
-	$(call skip-test, "RUN of byte_reverse", "not built")
-run-plugin-byte_reverse-with-%:
-	$(call skip-test, "RUN of byte_reverse ($*)", "not built")
-endif
 
 PPC64_TESTS += signal_save_restore_xer
 
-- 
2.30.2


