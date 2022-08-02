Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D40587AC3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:32:04 +0200 (CEST)
Received: from localhost ([::1]:33980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIpBy-0002vU-Lh
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIohM-00052h-1u
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:00:24 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIohH-0006OB-SU
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:00:23 -0400
Received: by mail-wr1-x42f.google.com with SMTP id m13so13247403wrq.6
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=PYaGkXjsZkoph9fA5YpZi9kVlMvB2mVtLyywEwpEssY=;
 b=pTb7MGDE78geiqxMCcCLvrZUJjBLV36BfFpG/6xA/WeXQ1W2hajMye79v9eEaM5CH1
 ZOx0K0lVcLrPZUIFx7EW2HZaYmwilk/fID+lKhPJDxBtyIASVCVmvOs39k3/hcNoUKln
 nknd3k5+17SCURssRhrVBK/HQZkI9DENz3RPsz+f9fK3ZoljhomtoSkMxyrwQFukqfrj
 VEqU8y8BQp+3+ouX+lbhy6Mlrqy1BJphNRsikJc6D8yuU/NKIFOPrUO4RjFzT+g3XP8r
 8WoSAM1i/FvnJGp8a6RN5mS4XBkskFUCLEl+FGSwOy4nyPImgSEqxenK+IQc45YefGKH
 ZS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=PYaGkXjsZkoph9fA5YpZi9kVlMvB2mVtLyywEwpEssY=;
 b=dIBorwa55AvuouDXh5htUPbXZ1PJZPklNUhuyGEh2D4wOx6pbQl0UutMXYpjWbAQLm
 IaOWRWjGHrByGipST7MP4076KHXXpw2X6rZxnBp29zv0o61iAwfecbfdKRGG3T8qizRq
 eezETt3Gr2dRa0TGZOxHfNhiSrvgM/00j2lBJ5fqVQwjbBpyFk2urEVVSONgU2YQZbuw
 /Wlmztwl/h47udhb4/dCzmb9yLDZPpcvm9aA+aALjiAzQOg0N1vOTmD833tlsOgNEn6I
 pXSDgALyQcPAeu4Y5+h5r0Hh+P8y7TnfkTSaV77ZJcGRWXA5dcHLdWC+zivln13ymYce
 5Olg==
X-Gm-Message-State: ACgBeo2RVmiFQNamAOLyJexe6FxBHoyJkO2bXcDOYAqt/Mzwrc2hZYRR
 khTaW3yh0DFTAMcGYHXcYaCvag==
X-Google-Smtp-Source: AA6agR7K1x0lUNHzTO2Mgnuj5Hve5ZdEdE86SkQ0MPsbIuk83T9ayUeNgI4rHewCRW9o4mBEHJyrqg==
X-Received: by 2002:a5d:64ce:0:b0:220:6e13:c95 with SMTP id
 f14-20020a5d64ce000000b002206e130c95mr2027448wri.322.1659434418477; 
 Tue, 02 Aug 2022 03:00:18 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i5-20020adff305000000b002206203ed3dsm6834910wro.29.2022.08.02.03.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 03:00:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 59C041FFCB;
 Tue,  2 Aug 2022 10:50:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v4 19/22] tests/qtest: add assert to catch bad features
Date: Tue,  2 Aug 2022 10:50:07 +0100
Message-Id: <20220802095010.3330793-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

No device driver (which is what the qvirtio_ access functions
represent) should be setting UNUSED(30) in the feature space. Although
existing libqos users mask it out lets ensure nothing sneaks through.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/libqos/virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/libqos/virtio.c b/tests/qtest/libqos/virtio.c
index 09ec09b655..03056e5187 100644
--- a/tests/qtest/libqos/virtio.c
+++ b/tests/qtest/libqos/virtio.c
@@ -101,6 +101,8 @@ uint64_t qvirtio_get_features(QVirtioDevice *d)
 
 void qvirtio_set_features(QVirtioDevice *d, uint64_t features)
 {
+    g_assert(!(features & QVIRTIO_F_BAD_FEATURE));
+
     d->features = features;
     d->bus->set_features(d, features);
 
-- 
2.30.2


