Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB57A3902BD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:48:49 +0200 (CEST)
Received: from localhost ([::1]:60302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXQO-0004H0-VW
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llXMm-0008Es-HF
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:45:04 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llXMk-0005md-NS
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:45:04 -0400
Received: by mail-wr1-x42e.google.com with SMTP id n4so6390448wrw.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GO67IXGpoeLhsE9v+Swk468FtjwgUs+tH+D+I37vel4=;
 b=oBAWbXA2q2Ttgd5InGcf9KqcYuprREY2cGqgfCP9i8Ja7qatqrdQ4djPu+Ke2m84dA
 4uSlbYQqwFntKd6GLRPRntI9fuPdql7FPGGC3X2pX3h+dUck5ZeCNB2IoiAkHl0hf9mK
 FABx3WeZushYombsudcRjmBmguw/fLCs1OAWdkILoWnshwN9+jM5ZUnY5x1nUehvuymT
 lwPAGzaIN0/T3ncqrhVItjoabucDYi+ma04JadTSUDYnxg93QEJWe9bsdogmQtakqCXD
 lW89buXPM/0kVxxbZajZz2qikSpLVLIL+ZxHDwHikDCKfils1l+XYY6xeIitKkYIrGJo
 ryHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GO67IXGpoeLhsE9v+Swk468FtjwgUs+tH+D+I37vel4=;
 b=em8m4707xxvtIWe/pgrS5Rmt9gD3mT+IGTAl/zynih9IXX4ZVB2iKS5WxED6Y1CXay
 +xoEXVuCwAmJPnwhI8HJlvgyyUDh717tdAPRe6Grf3QLe1Y358D9Z5Q8ZYHXJPSFeLum
 vilV/fXG1YstAQCPEBMY2tHOSaCEMyfmwy7yOnP7bJ4ojJaxEvxP/Krtd/UJ2R71j4Jh
 9kY+M4rSkQm93dEfNCiaotgaTZ0qApQglMGlIo3sFi4dVJWEve8aUJ0DPpq3pKSWfZe6
 p54FkA52+xFbABWE1HPe5icNDlfPX0lIijpEY3KwYoNCS3cfNf4snhgTASm4TUPgc4RI
 grlA==
X-Gm-Message-State: AOAM533ADQ0Yv3Otgq3CdRIxFvnBKK52ipjrrZKUb/b0LXvKpogrAgzE
 xwYuxZzKYEBHNVX4EXd5Jl5xzGTh41voVXNH
X-Google-Smtp-Source: ABdhPJwtOur6WpgQhJGceIMKRiS/ZJynhMSxun/vrj8fPP/+0hENZOy5mjsDNWTMedVMkKYBtFLtYQ==
X-Received: by 2002:adf:e991:: with SMTP id h17mr27239503wrm.265.1621950300956; 
 Tue, 25 May 2021 06:45:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t7sm15794460wrs.87.2021.05.25.06.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:45:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] tests/qtest/bios-tables-test: Check for dup2() failure
Date: Tue, 25 May 2021 14:44:53 +0100
Message-Id: <20210525134458.6675-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525134458.6675-1-peter.maydell@linaro.org>
References: <20210525134458.6675-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity notes that we don't check for dup2() failing.  Add some
assertions so that if it does ever happen we get some indication.
(This is similar to how we handle other "don't expect this syscall to
fail" checks in this test code.)

Fixes: Coverity CID 1432346
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/bios-tables-test.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 156d4174aa3..51d3a4e2390 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -489,10 +489,14 @@ static void test_acpi_asl(test_data *data)
                                                  exp_sdt->asl_file, sdt->asl_file);
                     int out = dup(STDOUT_FILENO);
                     int ret G_GNUC_UNUSED;
+                    int dupret;
 
-                    dup2(STDERR_FILENO, STDOUT_FILENO);
+                    g_assert(out >= 0);
+                    dupret = dup2(STDERR_FILENO, STDOUT_FILENO);
+                    g_assert(dupret >= 0);
                     ret = system(diff) ;
-                    dup2(out, STDOUT_FILENO);
+                    dupret = dup2(out, STDOUT_FILENO);
+                    g_assert(dupret >= 0);
                     close(out);
                     g_free(diff);
                 }
-- 
2.20.1


