Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC34587A3C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:00:27 +0200 (CEST)
Received: from localhost ([::1]:42834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIohO-0004qx-6E
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXd-0001HS-Ex
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:23 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXb-0002Mq-TU
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:21 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m13so13216320wrq.6
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=b2j/kb8GdcOCxPJdxE8uUIOafIPdVMpQHMJ+EKtT808=;
 b=VUtWBMO0NTR4B5G8bJmReMeHCB5+5EghhApZ5v+JT53Tu9HnwJoqO/jafntZKmTsg+
 s+5MS2QaAIzqt0CVeTHxQHcatcZdbJQc8N9NEHZAUTdQfBdr0JwfuSRjbyPQxhUMVgDL
 lBy3nydnZhASOh93V4wVf68SDTQmzF8xBw2BSJT0h2jitB2nZ3JwgxeB1zXz+AoesiM/
 dfb9AHDxp9PXNUuyI67FfHQ6kFMwmTZA056DhV5bTLxYAQWJR7eEz1gdmxJD1lYvSeKn
 MVsmNdOKtI6RCMVU1GE4s+8iIng41VSxaCSq8sjoYufgD3dolynhTWmYMrNv/trTd/mc
 Fk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=b2j/kb8GdcOCxPJdxE8uUIOafIPdVMpQHMJ+EKtT808=;
 b=u4/QPj4MYSfLm+ELIpIWEK2aGm++wWHy0tVhIEzja8RSB1e/EuQTUHukmXyhrIN8DT
 pESNxTOIXDvJR6suVSzUK+ynIS0p0CE2OB1sKcfv1MjQ43+hW09tdeJtp+oNDcn+/f3P
 37w7EaQY4tPw7FOi+Rnhed4pJAPPAZkWk2WE3C2cVCY8v9aA23Cg+la+X0ns6lXmrCRQ
 xoMmXSbKFUS+YnLNFA4Ms+6IrnngqTn/9T+g22vM5euZb6hO1yxi+rmW6rU9NWi1AmsI
 ZNT/pJghF8T7n54KGHgYtIWNU1AEGlOp7IeaqGwKjAzsSt3Zi1j+Xw4PJ2eIDzU7H3IM
 zezQ==
X-Gm-Message-State: ACgBeo15Jvi6C0ovk9FCM8A1r4njOgb8XbqbFuv6xjVzm9YsZFBEeCXI
 Vjvlgo3p2mMRK6sx0hzhjteaWw==
X-Google-Smtp-Source: AA6agR6zTvoncdOSjGVCJxQdLgKH9N1yWZDX0IHiM0VaZaXzUGmnSoeeg6ODSLr1dqhMAlP/AOgrcw==
X-Received: by 2002:a05:6000:887:b0:21e:24a0:f302 with SMTP id
 ca7-20020a056000088700b0021e24a0f302mr12097520wrb.466.1659433819206; 
 Tue, 02 Aug 2022 02:50:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d42d0000000b0021f17542fe2sm10877072wrr.84.2022.08.02.02.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 02:50:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 26EFA1FFBE;
 Tue,  2 Aug 2022 10:50:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH  v4 06/22] include/hw: document vhost_dev feature life-cycle
Date: Tue,  2 Aug 2022 10:49:54 +0100
Message-Id: <20220802095010.3330793-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

Try and explicitly document the various state of feature bits as
related to the vhost_dev structure. Importantly the backend_features
can advertise things like VHOST_USER_F_PROTOCOL_FEATURES which is
never exposed to the driver and is only present in the vhost-user
feature negotiation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 include/hw/virtio/vhost.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index a346f23d13..586c5457e2 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -86,8 +86,11 @@ struct vhost_dev {
     /* if non-zero, minimum required value for max_queues */
     int num_queues;
     uint64_t features;
+    /** @acked_features: final set of negotiated features */
     uint64_t acked_features;
+    /** @backend_features: backend specific feature bits */
     uint64_t backend_features;
+    /** @protocol_features: final negotiated protocol features */
     uint64_t protocol_features;
     uint64_t max_queues;
     uint64_t backend_cap;
-- 
2.30.2


