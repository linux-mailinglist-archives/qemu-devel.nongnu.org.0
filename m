Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F798532E88
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:05:20 +0200 (CEST)
Received: from localhost ([::1]:50724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntX27-0006Di-Bo
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWer-0004LA-In
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:18 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWep-0005QW-QQ
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:17 -0400
Received: by mail-wr1-x434.google.com with SMTP id x12so2027892wrg.2
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hfKNVlrrL3u0vef+FWTAR3LbzLx2Gk+OTMM5YcoQN7Q=;
 b=owQHW/kRAB58wTje3tlWm07SzXA21elY3U42uFBe60oQRlewztfkpjz7YmVg6PB6zA
 /bauRLTd1k2Q3s81zHWbo2J79jhBIEHELgr97AYV+upEdGcqqOo6zuSI869Zr0hwTptX
 3wEI/aillpylk1ulvGCFYkyKpT5kpAOBf0zdDTs8YZ0bYjvWMjjT9YZKr/Hk3G4PgP1h
 xnV3hI82zbmyXPZ7eeowiriOZBuPsz3GXzkoyfo0xectFFk5UG41kyX7Zql8QB0QA3Ng
 /mMTFEnIxbwlPgECPCwtSrgSlo1GqpST+/mA8LVWTecI07AH3i3Xwqwy4ALgsndaswjs
 VYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hfKNVlrrL3u0vef+FWTAR3LbzLx2Gk+OTMM5YcoQN7Q=;
 b=zDr13bIXccctEz+kEG4COZLnyRilWcbNMbwHHSlIPj6iOtlX2YvzTmPhIlDCPbiCsD
 E+reaATfitx1pY7ptQc8o3vwh3iqY7ZFkd+UdxhwUdd4RrdzGLEJ7ZSJDnfgJJpqoahJ
 0MTzZZMBOYN61fx6n1jDl5v02B2Y4o0/NTVRChnI/t2ru4N+2WPOiYH8QFqErmrA58Ap
 clVR98F1CQRDllkMHualB9SdwlqlAYTUBirNynGWrMqdNB7bc73Cu6xLnyETrOVnI127
 4wiOyluZcLLlMQVIGedB4lfBomtowGYUQvzm9pRv6MZENi3oNG9PgrixZ/kuyLhZbDa/
 nxCg==
X-Gm-Message-State: AOAM530cptbqyTzzFK45E4HlG4wgUtRlKob3XhdnojNDMWM4DLg9AEiw
 QLqh7ta5ga4FhSMkvXO/ifI7ywRFwVX8eg==
X-Google-Smtp-Source: ABdhPJzjXNq92X7ZoG9K4IVUGuRnsD85yikWYlO7sbI9A2iItqLSXpbbwxzhmvogfd4itDRtNNbtyQ==
X-Received: by 2002:a5d:4e05:0:b0:20d:1f0:1f31 with SMTP id
 p5-20020a5d4e05000000b0020d01f01f31mr24130748wrt.492.1653406874518; 
 Tue, 24 May 2022 08:41:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a1cf316000000b00394708a3d7dsm2355759wmq.15.2022.05.24.08.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:41:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 820E91FFC5;
 Tue, 24 May 2022 16:40:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 13/15] tests/qtest: implement stub for VHOST_USER_GET_CONFIG
Date: Tue, 24 May 2022 16:40:54 +0100
Message-Id: <20220524154056.2896913-14-alex.bennee@linaro.org>
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

We don't implement the full solution because frankly none of the tests
need to at the moment. We may end up re-implementing libvhostuser in
the end.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/vhost-user-test.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index db18e0b664..d546721f5d 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -79,6 +79,8 @@ typedef enum VhostUserRequest {
     VHOST_USER_SET_PROTOCOL_FEATURES = 16,
     VHOST_USER_GET_QUEUE_NUM = 17,
     VHOST_USER_SET_VRING_ENABLE = 18,
+    VHOST_USER_GET_CONFIG = 24,
+    VHOST_USER_SET_CONFIG = 25,
     VHOST_USER_MAX
 } VhostUserRequest;
 
@@ -372,6 +374,17 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         }
         break;
 
+    case VHOST_USER_GET_CONFIG:
+        /*
+         * Treat GET_CONFIG as a NOP and just reply and let the guest
+         * consider we have updated its memory. Tests currently don't
+         * require working configs.
+         */
+        msg.flags |= VHOST_USER_REPLY_MASK;
+        p = (uint8_t *) &msg;
+        qemu_chr_fe_write_all(chr, p, VHOST_USER_HDR_SIZE + msg.size);
+        break;
+
     case VHOST_USER_SET_PROTOCOL_FEATURES:
         /*
          * We did set VHOST_USER_F_PROTOCOL_FEATURES so its valid for
-- 
2.30.2


