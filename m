Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFF1582A2E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 18:02:02 +0200 (CEST)
Received: from localhost ([::1]:59498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGjU0-0007w9-Jy
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 12:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGjPC-00025Y-7C
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:57:02 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGjPA-0001sU-JB
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:57:01 -0400
Received: by mail-wr1-x436.google.com with SMTP id v13so17284291wru.12
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 08:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9mEcK4sO4rPCFZLLkHp1PXNwdldjaLtha6aYBrlBQcI=;
 b=f2h6jFQKRucQhcBji1PCOcCqWcHeYIW1dgWiY9O6sUkdqjZ6tRKf2yPGearSXbewwD
 JnkmHJMizh2OT47mRwa7k7AGEGRNFnWw11qZylSYPIAedg8CFCAjQqDro9kQeeVQCSRk
 Ie42fcCDpk4J8rKEJ1FrzuIqBtmeIOmYCX46Ky3zkRuadmOjuIgzzBdSFce8iIM/y/5b
 TKZpKBujdZiPKTKayo0MIFfsQAj0G8VSwYIjmTTeLtedOxlubXQU7IY3UBKrBOV4XQqu
 dnWKTRxcj7O/URqpbTNAz/5Zv28vhYs9j9u7SAZxG+Z4QNft25aLUoXqdv0vA25xcjfU
 WKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9mEcK4sO4rPCFZLLkHp1PXNwdldjaLtha6aYBrlBQcI=;
 b=QdY9GySnF33+9RtUo+WvJgiqtB7RatSrVPQav6ztrqVlkUd66kqivPPZRJID2sgf7e
 F4MxA28qP/Vxg39ApkPYW3VhwZANgFo1kB5Bsz/7BENncGfPqOlP3zFblMJVxn0ZFGL8
 p9aJPtuezFgDEqtF8gFdGRpVeJxsDPQ7DkXr//hLddJ1VFrck2g3qJNbmVRtoTXF8kcA
 v10j9egpumAX//Arthrx/N1XVAzhDD2S1ALfPFyTPJ/JHQ7EzMpXZl60qUZZChQ2Z9sP
 TLDofLq6e94+0k5Z+PlAXxS/dCX+SHuwPw1FJ+zdH47ehWqYlGbL8TKOYh+wRFYR1z3R
 iT6Q==
X-Gm-Message-State: AJIora96n+SRmb+rZJVkNSVkUs/Jxac1u4NCiG3KsKxZS5vOdwmJxtGc
 qINqV09HI/+NX4M377e7qydfsw==
X-Google-Smtp-Source: AGRyM1uUTzhkjPQTH3ZtlyBd3Pohty5Tc3ELa8Zil2rKT7vid0Oc7myqlDq+acShgVV77umGdeK+PQ==
X-Received: by 2002:adf:f646:0:b0:21d:7000:95b1 with SMTP id
 x6-20020adff646000000b0021d700095b1mr14574245wrp.486.1658937418222; 
 Wed, 27 Jul 2022 08:56:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o17-20020adfead1000000b0021e4536a948sm17704256wrn.79.2022.07.27.08.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 08:56:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 766191FFB8;
 Wed, 27 Jul 2022 16:56:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core)
Subject: [PATCH v1 1/5] block/vhost-user-blk-server: don't expose
 VHOST_USER_F_PROTOCOL_FEATURES
Date: Wed, 27 Jul 2022 16:56:49 +0100
Message-Id: <20220727155653.3974426-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220727155653.3974426-1-alex.bennee@linaro.org>
References: <20220727155653.3974426-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Message-Id: <20220726192150.2435175-6-alex.bennee@linaro.org>
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


