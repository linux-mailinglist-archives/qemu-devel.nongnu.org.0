Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927CB581A69
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:42:34 +0200 (CEST)
Received: from localhost ([::1]:55278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQRt-0008Ul-Js
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ85-0003F9-1O
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:05 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ83-0002Jm-Jm
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:04 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso1292854wmq.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c6PIYMIE3JaTrY/DQKZRjBqoWth+KWJVDK8v0sIayL0=;
 b=Yd1RoS03X2dpWLourmcbXGS38aK3+3OavISnGFTifCiACdYTsYuAM/VnhG3XMXv1Jd
 s6kcKw9HFfzu3Xa0Z+jm9NP6xnKsteMi36yME18o6xLclNZuX+Xq7BuxATIqQUijw0Gr
 SIKuveVbEZ5EvAMUAaUoGZE/MbWIvk1dC9IMuFOO1aYsH93t/Ddt8z94WQ1VphMsnZny
 6REMkZ8dS9zopGQNP4gHydFnWtk6KVWHlMCWdFU87mp1ebMYhj1c6mWENRRjLJugRG9+
 3aVQPO+k0cX9ax7FZoIF9pVYOknXhuFlX+3rlgu6httxTv9iUHb4W85giUi/LMO4RYiB
 3xXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c6PIYMIE3JaTrY/DQKZRjBqoWth+KWJVDK8v0sIayL0=;
 b=S96P140QL/Gt4fmneV2GI5ld2MnYBeQPaG6Kzy7/DgvSqjdtcFO6la+hG6rm/O6E4M
 xKLPtsNinZ5mVraDjwZ7BM9FQpsHeCw/gCqeTWU2GZF0BGF27mK7TCwW4XKXQy4BKxUX
 tiHwcClc3QnL7+gT6b2rfAYCL+/AfHsFB8+nf9kJVBooEDAclF5JkSLQZP7Lojq5CMg9
 glrQMolchi2FrSxJsmsPnUDJcwqH+Rc6CkQG5f5DcUtrmYydgz6pY4VaKABA+KfDA7zS
 NddGp8b7K3h3B0KKfcXMNoOX/zy/ULUbmwyvqe1LLBd/v/Kk8QYd6HUbwfy7A2UgJ0Xd
 FsHA==
X-Gm-Message-State: AJIora+qYAlx7owHLuDU7YehUStjNb5HnJ3TYcr/ALMHrpnwqFiLw1kZ
 sHmfvjXsofSRkhR8V25u1UtemQ==
X-Google-Smtp-Source: AGRyM1vS/VFK0v5dRH2s16M8HUIJiaCfIU+hkNCeZ8NnLJu1K3C7s/9xytbuGo7MoaN6IP4AT0fIXw==
X-Received: by 2002:a1c:2981:0:b0:3a2:ffe9:945c with SMTP id
 p123-20020a1c2981000000b003a2ffe9945cmr478140wmp.38.1658863321016; 
 Tue, 26 Jul 2022 12:22:01 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a05600c1f0600b003a050a391e8sm19502099wmb.38.2022.07.26.12.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:21:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B8A781FFBD;
 Tue, 26 Jul 2022 20:21:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core)
Subject: [PATCH v3 05/21] block/vhost-user-blk-server: don't expose
 VHOST_USER_F_PROTOCOL_FEATURES
Date: Tue, 26 Jul 2022 20:21:34 +0100
Message-Id: <20220726192150.2435175-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

This bit is unused in actual VirtIO feature negotiation and should
only appear in the vhost-user messages between master and slave.

[AJB: experiment, this doesn't break the tests but I'm not super
confident of the range of tests]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 block/export/vhost-user-blk-server.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index 3409d9e02e..d31436006d 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -125,8 +125,7 @@ static uint64_t vu_blk_get_features(VuDev *dev)
                1ull << VIRTIO_BLK_F_MQ |
                1ull << VIRTIO_F_VERSION_1 |
                1ull << VIRTIO_RING_F_INDIRECT_DESC |
-               1ull << VIRTIO_RING_F_EVENT_IDX |
-               1ull << VHOST_USER_F_PROTOCOL_FEATURES;
+               1ull << VIRTIO_RING_F_EVENT_IDX ;
 
     if (!vexp->handler.writable) {
         features |= 1ull << VIRTIO_BLK_F_RO;
-- 
2.30.2


