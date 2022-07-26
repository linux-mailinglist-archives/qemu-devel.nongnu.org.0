Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A187D581A65
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:42:16 +0200 (CEST)
Received: from localhost ([::1]:54852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQRb-0008AE-OE
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQGC-0006bt-BN
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:30:35 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQG6-0003bT-1y
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:30:24 -0400
Received: by mail-wr1-x435.google.com with SMTP id d8so21379539wrp.6
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PYaGkXjsZkoph9fA5YpZi9kVlMvB2mVtLyywEwpEssY=;
 b=ual7CBUuvRDdw1MsLKJ5y9GezAGN+AST2WPzf2yk2Np9/RY3mmGfEDID+i+ed+M2h3
 g8jLpNPySYjNuKdDSBLr3Ss9dOfDD+AoSxGU+45BFKwg3DJ0gxPAP4sSEC95FMW8nDsS
 fohp7/TfA0kv/qeuCvtzrwknoecHBdndJcwBKds/Hw0jPC0+oMA09sltLXolo31IV4Wh
 AUVXml4r7bEj2zIrM6M1FEKkO8wJeq27dJE5gjhxoK2wSZSuYEGl+cBf7Jpe5GpI8Q5w
 rqa4AcoeuTfU0dhP2WRfgzyp8PjIdSQGenvZ5epopNoyumjGkG3GUmAHEGgMUqpASi85
 pFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PYaGkXjsZkoph9fA5YpZi9kVlMvB2mVtLyywEwpEssY=;
 b=srdW51lmWNXKgsXhm648cZwVZJnV1lb52ZEr57DClHXn4vArepocgTChHs3+PHNeyE
 sCtHIfoqXkFEb0JzGb3kyqDqmTMi4vPfExCHp3mYPHSeVLc/4jlZyU1mzyYyAxx5iRTK
 t9uV18qyJImVPEd+6lSP5s2QFJNA3YvPAwwAQFA5q9u852iXjjSEYslWLLasrtFaxIAq
 IsDewfqSApgbuCMs8OP6dxDuCyvM5PxeeBYzEnxeQ8VCv0wIIKo2NNID54/2qZTNwy3m
 +7BMvbydoE67b5OpToxgznhXR7YW9738XbFGXPNoIoy0iQOqL4JpdxOWwyNLIAf/Iww8
 q8Mg==
X-Gm-Message-State: AJIora/qBKYQZAOOR9pt2SKoOM+R64+TxzAzXpSb7F3G6m0i/lT4PlUK
 0pqRpa/QQZnKazafv09wIdSudA==
X-Google-Smtp-Source: AGRyM1t72VyM1VmtJ2TdD07MYTIgBN9CRsWte1hCUx6n+AWCBgXLd2NuNZrtbD4BNAJcAHx3bDLV5g==
X-Received: by 2002:a5d:59c6:0:b0:21e:86fe:fcc6 with SMTP id
 v6-20020a5d59c6000000b0021e86fefcc6mr8196415wry.139.1658863819519; 
 Tue, 26 Jul 2022 12:30:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a1cf306000000b0039c5ab7167dsm21916848wmq.48.2022.07.26.12.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:30:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CB3A41FFCA;
 Tue, 26 Jul 2022 20:21:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v3 18/21] tests/qtest: add assert to catch bad features
Date: Tue, 26 Jul 2022 20:21:47 +0100
Message-Id: <20220726192150.2435175-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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


