Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADC0532EA6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:09:42 +0200 (CEST)
Received: from localhost ([::1]:59226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntX6K-0003ot-A0
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWes-0004M5-OG
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:18 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWer-0005NG-3u
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:18 -0400
Received: by mail-wr1-x434.google.com with SMTP id j25so1852119wrb.6
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M3AwLOO4tJSX2vgFnHe89rY8t5sl7yh4FwF2sza60a4=;
 b=im3x5G7w4bnJoBUOvFnpZURKf6o+gjxK1ObwTA8fOKl4hI1s05cgQ35jQGBdTtQeHF
 s4Zj+u8tXyCwOP0GI66tFBD0/UWvsOfX0iLxWHSD24zj6jKLtjb0LwhePcoL+owWg2qx
 s3Gi4g1HyXkgwe8HidDEVq9pDtaAGFNjzpki2mQ4F1MLei0GtBWiYqs2ykFvq2C/pHFm
 37tBpSu57P6tmx+vMKz5/xaRn29fVCPs+5Ax//cJNMNS/O3dE7IQEOq2N538lNtjoMsQ
 C2qXh26Xg/57epFIiQeMBMZR+7tvwY713no05Uamks7pP0UNaHMr+O7p+FakOU7sXev6
 JNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M3AwLOO4tJSX2vgFnHe89rY8t5sl7yh4FwF2sza60a4=;
 b=7ocoZSKPME2yA+Pk1R46er54g459qMjY1txXGuJJcbo9CCqH935iZ03AiGBiYB1id6
 pWVmEnuoiBN6gsVChzyV+fKtibRkUkYJu/unl783j/UvbYtO2fJTF3tqFHFG+5G6dY0t
 b4agyUgA0IXkd11pc+V6Nl0Pxsq/6GdxNkJT/p2kCvPYrATOgYoTnrpx8617QkDF+da1
 Cq4vM72GucDNW7r4/QBa8M92fX9AkWvVIuwq4TE09sVg7kC9bMUfSQ7k1Y/SN4Jw2Cjj
 XMeYhU5C+5UYumZf+kagweB6FU5ylTFv7PFawUnXu+lhIqcZzFAavl7+lAezmXHQjDBv
 3PDQ==
X-Gm-Message-State: AOAM533F3roZtWXvsQlQJWvvlnD48GH437/5ObN0uZuFev0kkdZ3YjPz
 uu+ZkJjsfMmvwL7JqQkQYadXNA==
X-Google-Smtp-Source: ABdhPJwsEbxDw0L+mIWMpbN1QGEIFQCr1YrFCQZzwqtKaQXbmpRpn0rn3SDhIw1tXq4lNPsC+fDWLQ==
X-Received: by 2002:a05:6000:2a8:b0:20f:c56e:3f5e with SMTP id
 l8-20020a05600002a800b0020fc56e3f5emr14531517wry.22.1653406876331; 
 Tue, 24 May 2022 08:41:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p42-20020a05600c1daa00b003942a244f40sm2661488wms.25.2022.05.24.08.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:41:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 751451FFC4;
 Tue, 24 May 2022 16:40:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 12/15] tests/qtest: plain g_assert for
 VHOST_USER_F_PROTOCOL_FEATURES
Date: Tue, 24 May 2022 16:40:53 +0100
Message-Id: <20220524154056.2896913-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220524154056.2896913-1-alex.bennee@linaro.org>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

checkpatch.pl warns that non-plain asserts should be avoided so
convert the check to a plain g_assert.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/vhost-user-test.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index d0fa034601..db18e0b664 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -980,8 +980,7 @@ static void test_multiqueue(void *obj, void *arg, QGuestAllocator *alloc)
 static void vu_net_set_features(TestServer *s, CharBackend *chr,
         VhostUserMsg *msg)
 {
-    g_assert_cmpint(msg->payload.u64 &
-            (0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES), !=, 0ULL);
+    g_assert(msg->payload.u64 & (0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES));
     if (s->test_flags == TEST_FLAGS_DISCONNECT) {
         qemu_chr_fe_disconnect(chr);
         s->test_flags = TEST_FLAGS_BAD;
-- 
2.30.2


