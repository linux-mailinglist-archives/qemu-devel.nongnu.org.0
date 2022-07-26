Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB5B581A91
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:56:11 +0200 (CEST)
Received: from localhost ([::1]:51358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQf4-000084-AJ
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ8E-0003Mj-CE
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:14 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ8C-0002OM-4e
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:13 -0400
Received: by mail-wr1-x42e.google.com with SMTP id h9so21496419wrm.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M3AwLOO4tJSX2vgFnHe89rY8t5sl7yh4FwF2sza60a4=;
 b=YFZM3SAWhCsWYiAAU+juFm/2nGYXO7JZo/FUKFvJIzyxBTSVomht3D7zRSZ0iGoitO
 d8lLhOzrd17TXUmiDmhyisnDgE5msVDiLUlJSgkozeBP3P1//WMcLSPhaKjPTuLsM3EH
 S3Pa6lC9KI8WiRkf9/AvvmueAq1K5NiczC+EuzZHiyRen3Ot5sn78elpSh+DXGG1ulBc
 Jv0DU9pRQk8Y6IiHfG7TQpWT3+vFrNM5h6q8Hmgu4pYUem4PzYo93yRBTWZ++1DK0XfH
 pzy40LBJbJTu/W2R2xV0ocw4EN3hMTH0IIBFHX5SCOMbGxDVQhDqJBYcS0iK3TplxUTW
 rapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M3AwLOO4tJSX2vgFnHe89rY8t5sl7yh4FwF2sza60a4=;
 b=vHLREeCoIHe9oXicuhFz9KymZFkZ5mpR5Q/LLq0k0Um0lVX2JYIBrYGZ1SPO1IYK7A
 95lr/T0RunR3NMhUPvMOpSXFDU/1v4ebmF1J++YdonsM0Dqk1vjcq6miMi6tL9QZhIy8
 s7+HI4FEYgGMvnDUQ5jbJiwpfrLEtIka32pPgHWlS2vOuGGj2O3hailkijSWF88i0Gj2
 aWdq1qjh3X/inM770BQHSHL+z/AlfjaDiMNZACz9PRd3tyH70Er/aAl2SlMDpDT0/WC+
 gACU7ZyX4q8idiHBzAl4oj34tobWMOanIP8H0TrSu5zljbmW1+KB3FzJdOWaAxJgsSfG
 jD5A==
X-Gm-Message-State: AJIora+ErKY/P4WZk7rApodvZFTrucT6dVpcqudjZTlmIUI0cYZrs4Dv
 8kjqdWcbR8WHhjkEyACwmtQnmQ==
X-Google-Smtp-Source: AGRyM1sHrliBoGwSEmE3n1nRrH7TXR2B6Vhuz3gRes7WKNGJiRledHtAppWL3RkBP1bqtjLh0g2cBg==
X-Received: by 2002:a05:6000:2a4:b0:21e:6e0e:df1f with SMTP id
 l4-20020a05600002a400b0021e6e0edf1fmr11614994wry.516.1658863329858; 
 Tue, 26 Jul 2022 12:22:09 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 az14-20020adfe18e000000b0021e529efa60sm9911003wrb.1.2022.07.26.12.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:21:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BF61B1FFC9;
 Tue, 26 Jul 2022 20:21:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 17/21] tests/qtest: plain g_assert for
 VHOST_USER_F_PROTOCOL_FEATURES
Date: Tue, 26 Jul 2022 20:21:46 +0100
Message-Id: <20220726192150.2435175-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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


