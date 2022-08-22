Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97C059C677
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 20:36:47 +0200 (CEST)
Received: from localhost ([::1]:49282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQCI2-0004OZ-Qf
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 14:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQAin-0008Qc-V4
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 12:56:18 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQAil-00060R-Vr
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 12:56:17 -0400
Received: by mail-ej1-x630.google.com with SMTP id vw19so8797661ejb.1
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 09:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=LieCnn+iM2L6WoU2Lcvn6KPNMMaVm+8Sh/Nf1S623NE=;
 b=vlFtPd3/OiDx6JqbqbpDsQ53DMJaQvgNR3+UofvBX4g6/UKnID33U4ywXKkaxBscEq
 BLJSDpKwUhcWpkWXvzr1TpFhulFSz2SQj2vL3I52549/TGbbv2CtayvsPEMb2/SxGiOw
 NpqwfRyAUbkWrutXObgvtN0BeETWEtkKaaFxbjOdZptD7a5KHla/KdHbdrZiRPKJblwM
 iwjEO1z0p0AskqpgIbPdklsN9E1I6J07ks+soM4OaYuRbGJyTdQJKg81Sz+gKUdBMXQq
 Fgwa3Lefpuh6bEK3qGR65xT/gNWdZH8aoqQI/lUez6bsEgsuUhHLqq5y32aJ5O0t1DUa
 VEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=LieCnn+iM2L6WoU2Lcvn6KPNMMaVm+8Sh/Nf1S623NE=;
 b=6Kt6WCLRNfJ1PbSD+ZEQyoOuddo38ALlOmMTiyUqHd/NMZlWV1ZPfCMY7WauQk8IeO
 AL5lwr69axjHqQ1NCGfse22d0JaBe+Gx++3RTtIddniGGYK9jDUwFn1t/VDgkrzWgUam
 WdC322epJ//fNniL8blktLtTl3wqA8mxoylmHloDOK5lcMLS5R9lvo3JpDsT8c9y/ZOu
 PyR7OBFlIVwX0B9Ep/rZOPv3srcV693jSGSF/fRyM2/bg2V6GVjSbG6ATjzlgTcfeSsv
 2Kg8wtdIGJtjIU386UIch1wS9qV/OVLsjnxVpb3g9Bm+VM7Gg/56XdfuqffvJeuqwNua
 LeJA==
X-Gm-Message-State: ACgBeo3f4CmQyeDoBSz2VyIZ7clrNesFMI/JJgf/RS5KdQWJDDb5kbNu
 cLti8Mcmu+PudHdybxiQcnO4s7Z7s/iI4Q==
X-Google-Smtp-Source: AA6agR61pHGHkHS/iAWx0MAc8ZL1lB1iTNT5nRL0lpDtJdFcyICuuS3LfHoSsLK2x7Lt6Zy/TfW7Ig==
X-Received: by 2002:a17:907:eaa:b0:730:c780:f71e with SMTP id
 ho42-20020a1709070eaa00b00730c780f71emr12809153ejc.770.1661187374665; 
 Mon, 22 Aug 2022 09:56:14 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a170906a11500b0072af56103casm6411154ejy.220.2022.08.22.09.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 09:56:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5D5B11FFBD;
 Mon, 22 Aug 2022 17:56:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v1 5/6] tests/qtest/migration-test: Remove duplicated
 test_postcopy from the test plan
Date: Mon, 22 Aug 2022 17:56:07 +0100
Message-Id: <20220822165608.2980552-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220822165608.2980552-1-alex.bennee@linaro.org>
References: <20220822165608.2980552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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

From: Thomas Huth <thuth@redhat.com>

test_postcopy() is currently run twice - which is just a waste of resources
and time. The commit d1a27b169b2d that introduced the duplicate talked about
renaming the "postcopy/unix" test, but apparently it forgot to remove the
old entry. Let's do that now.

Fixes: d1a27b169b ("tests: Add postcopy tls migration test")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220819053802.296584-5-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/migration-test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 7be321b62d..f63edd0bc8 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2461,7 +2461,6 @@ int main(int argc, char **argv)
     module_call_init(MODULE_INIT_QOM);
 
     if (has_uffd) {
-        qtest_add_func("/migration/postcopy/unix", test_postcopy);
         qtest_add_func("/migration/postcopy/plain", test_postcopy);
         qtest_add_func("/migration/postcopy/recovery/plain",
                        test_postcopy_recovery);
-- 
2.30.2


