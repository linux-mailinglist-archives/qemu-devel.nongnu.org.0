Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44739334491
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:02:52 +0100 (CET)
Received: from localhost ([::1]:59578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2EV-00012D-7w
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lK1yg-0005bo-M3
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:46:30 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lK1ye-0001xp-4u
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:46:29 -0500
Received: by mail-ed1-x529.google.com with SMTP id l12so29106788edt.3
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=82tQRp1pgRyPb1mhGfxucCLdz8Vvb8qF/uMKD5OoQcw=;
 b=H7irg/N7gb1UtiHftkASaqJPqxuQj3hWa7jX3taBSXVgYH3I/p2Il7f/kDFhWT0ks0
 sqpJlkRkcTce3jwGTWRBuT8OpvfSLS1jEharARaZ7pQ3u9rVFnqZHrKxIMBgmYxuXW5C
 fykEBcP8uupuKmHqcIN5PDslUVncedBK0XR6O7koWqYWSUwCVu2Ke2IcPlTjuJo66vmP
 lTKydcUKNgcwJTQ4lUtm7m6ayVrxpfEDVefQfNIsABt6Fv2cFEjo3exiFZNmGcy+y6hm
 2M9za0otUVx0J6b8C3MdfswEyTK2oqDI7kkpzuz2bFB23PW9uaVSbEh1qvy2UPJ+Ky8c
 gp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=82tQRp1pgRyPb1mhGfxucCLdz8Vvb8qF/uMKD5OoQcw=;
 b=gcV2JerdLn5MGgXdpFAuIAnHrl3+fh2PGvfXurSTgWmAvFqCl+FxrFwtIrxp2pR5Su
 fax4ffy+TMipv2aTQ2WMxASkfMxgiAxJ1K6Qhy6MX4iDLDIqx96Yn4U5Q9X5B4neicuP
 0d/cNcQeaiduImUW4I9yAz5BRiKwG6JeFqZrenBXZXyCQsM2QYAkyH+uwMJdrfUctWf8
 n4BidPiwweNgzdat8BbWBMjKx5GPckuLoe9L4YTFW3wzw5dET5oIDkmFyiecYTM+Y69J
 lMHbq58xrEsvjKr54eHMw5XZFCLSvT3Maqot1puMfLG8i+1QW8nc13/EgxNqFz536GJV
 RZ8Q==
X-Gm-Message-State: AOAM531/wxFMUzV49G+0xDwHySVWQTBxKIdigdeX07b+SrGBiAPphBdq
 pjYaXc8f49lV3ZscYXMI2JojzGTDo28=
X-Google-Smtp-Source: ABdhPJxOHr8ABy/kJ9VCdaCHNe83guC8PrEBq/kG5VtJjNgE+2R2qh5NHmNsPwPxSSteb7qdga5zmw==
X-Received: by 2002:aa7:cd63:: with SMTP id ca3mr4345334edb.265.1615394774388; 
 Wed, 10 Mar 2021 08:46:14 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 u17sm11208191edr.0.2021.03.10.08.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:46:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: remove "make check-speed" in favor of "make bench"
Date: Wed, 10 Mar 2021 17:46:12 +0100
Message-Id: <20210310164612.285362-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, wrampazz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"make check-speed" has been broken since the removal of ninja2make
last October.  It was just a backwards-compatibility alias for
"make bench-speed", which in turn is in principle a subset of
"make bench".  Advertise the latter and drop "make check-speed"
completely since no one has noticed.

Reported-by: Thomas Huth <thuth@redhat.com>
Supersedes: <20210310094936.1318317-1-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index d34254fb29..a181310d24 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -3,13 +3,13 @@
 .PHONY: check-help
 check-help:
 	@echo "Regression testing targets:"
-	@echo
 	@echo " $(MAKE) check                Run block, qapi-schema, unit, softfloat, qtest and decodetree tests"
+	@echo " $(MAKE) bench                Run speed tests"
 	@echo
+	@echo "Individual test suites:"
 	@echo " $(MAKE) check-qtest-TARGET   Run qtest tests for given target"
 	@echo " $(MAKE) check-qtest          Run qtest tests"
 	@echo " $(MAKE) check-unit           Run qobject tests"
-	@echo " $(MAKE) check-speed          Run qobject speed tests"
 	@echo " $(MAKE) check-qapi-schema    Run QAPI schema tests"
 	@echo " $(MAKE) check-block          Run block tests"
 ifneq ($(filter $(all-check-targets), check-softfloat),)
@@ -154,8 +154,4 @@ check-clean:
 
 clean: check-clean
 
-# For backwards compatibility
-
-check-speed: bench-speed
-
 endif
-- 
2.29.2


