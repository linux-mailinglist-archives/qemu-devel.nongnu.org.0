Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403ED587A3D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:00:32 +0200 (CEST)
Received: from localhost ([::1]:43100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIohT-00052E-BY
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXn-0001NQ-5z
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:31 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXl-0002Vi-PX
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:30 -0400
Received: by mail-wr1-x430.google.com with SMTP id l4so17171923wrm.13
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/benznZbSAEh098FVIlTeLDV1NXC1VfOpbQMrJp8HAc=;
 b=Yt+1chp0XIOPAk+JtsMy9tLIa5hu8uoCQ1FQebLybHpzlm44j5Rw0kFJAisQQK32pd
 WaROW8As560ogPJDGe4HjkW/ZvejiKaBlbzbBRgoqcqsYaliPgRfgvXoWvUU/G07i3Bi
 15uGtu+pa7twv/q7mfd4lcwq6WHPjryAH9ot8DJLVv5Hrep2XoHqPOX3cW4kogDwZPok
 i4/Az73tZLKwbPmhjXbQuSDI6Gv6f4KR92kGt5SIKZZfHHrB6EARG4aEAPtvxwmOMHqK
 moJhOPBqZsN6bdwE3DkTpGr7g36kL0jfBtgAy/cHoDU5xq+FMnPdkHJ51VUplSYmfbGI
 fM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/benznZbSAEh098FVIlTeLDV1NXC1VfOpbQMrJp8HAc=;
 b=iYrkRaaPPcSXGEu5SmCP3dqDpmyYj30UKbDWCd7DzmQQ541bzB6B2UCX838/jXAVJ5
 Ovj6w5WiF7gWq1NncKHLEspY5mdOWd5I3cPwe3R2HR4duZThhoVBhh7TuXI8HgaPKVDo
 K6wZYZHAjrF2CHf/zfAdhYEhQAUv+6pW7RW+P1fYjJySJwmodEgS+72VB//C2mkUivp7
 UDEMW+exR88APWZALVI04UU3jmQwx9NfpoyltDhq7JAeOo70Wt366Yw4Wf87Cwzgs7Fi
 VwE1CBrFn1EPCO9AjYwHlzspvkcyrcToWZKA/8s8EGvveiSCHj8dy5OzUcPQC+mCu7YJ
 Pveg==
X-Gm-Message-State: ACgBeo0BEd3T7jMuKcs3dhqDCQtQ6E5lFsLPQwZyTK1MxPMVJMKPXMvA
 EzbiFrhsQFu9lZ24YJdGOmaBog==
X-Google-Smtp-Source: AA6agR6XofuJQmEesDvEVyJcxIDJpZbTb5iK7gK25auhOqaE35FNTYALOiTOMyJNiJ/KFW2ZR7uuig==
X-Received: by 2002:a05:6000:1acb:b0:21d:ad71:3585 with SMTP id
 i11-20020a0560001acb00b0021dad713585mr11930484wry.156.1659433828497; 
 Tue, 02 Aug 2022 02:50:28 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ay28-20020a05600c1e1c00b003a3200bc788sm22879367wmb.33.2022.08.02.02.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 02:50:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 441641FFCA;
 Tue,  2 Aug 2022 10:50:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 18/22] tests/qtest: plain g_assert for
 VHOST_USER_F_PROTOCOL_FEATURES
Date: Tue,  2 Aug 2022 10:50:06 +0100
Message-Id: <20220802095010.3330793-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
index f2c19839e0..4af031c971 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -983,8 +983,7 @@ static void test_multiqueue(void *obj, void *arg, QGuestAllocator *alloc)
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


