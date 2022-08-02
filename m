Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A0A587A2A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:57:28 +0200 (CEST)
Received: from localhost ([::1]:35492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIoeV-0008FL-GC
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXb-0001HK-Tv
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:22 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:34489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXZ-0002N3-Kf
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:19 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso384338wmq.1
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=5cs2obCibuFrGV6ezAp7TXix+CRt2n51MrtUoaGrvvI=;
 b=cECP5XUY2z/lkBJFqiKOWxATL/VRg51L8ABqJ08XaYSpvPMczxbN21DUMxWEXFW+GO
 xeJybOb94+Wg8LrGqQJaPmhmuJnv7/oGm1gPoBg8TWvfvS23efR0aaTBBGcz33/L1wcO
 CSWs4jWzxyth82L0oRTK6Nkl7tPK3tBhrpfn82B1j8bYy+Q0sI9q6k3nMAh5Bm/SdHpy
 1ML8J7w97qCyZE3XpeOOZkqV2lC2lHPJFfqlSySkz7b46YRAKbbFbt40Oo/ylDGXkVzo
 +NHw8OBr4mCCq8PyeZfthE71WpFQhR35MF7hevP7CfIHiqIuL61hLNGzaY+2ytpHLXt/
 aj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=5cs2obCibuFrGV6ezAp7TXix+CRt2n51MrtUoaGrvvI=;
 b=VXDWxpeaBxK5U/u1oYKU73kqy5H7MNSp5WwWP5GyryEWpoObPd930bdQsDitHnLegx
 EEUY4i5dT+JIySVcuwrikFQYi9dJYPNof1GYoRfY0YRzH//mpUNlB1e+9XYozxR54URC
 cD4tL3o2lhfNhcAbftA3bfTYSUhfPl171BcDdlJA4NXEIG8z3tfO1kN7CD+NpP6kjdl6
 ZJOktUPlHpPeNk+iegTsaLH8N06MQd3yyHkplxJ+Ww7f7y3+87Ga5sEamLSxtqVcagoj
 +ftk6tU+k0Mdl3VPYjytwN7Zeb1vrS859kbWHtMaDWweTkPOyv2fx6BipQxtLLcuAmBW
 C+hw==
X-Gm-Message-State: AJIora8UUvoy+Su6PVmkrL5slQCH8lXCxeZkluYd5Jv+WbCJzLHdcLfI
 Aar2bSTgwM6gFjSgApcnQ1rkrQ==
X-Google-Smtp-Source: AGRyM1vJO1h+8fFqfkhwSJZ/uwd86VBNJ1BKwiS84jSWbMjb0YG5hjz/I7DV5yA22Qpkj6Jo0eVWag==
X-Received: by 2002:a05:600c:154a:b0:3a3:2fae:9bae with SMTP id
 f10-20020a05600c154a00b003a32fae9baemr13955383wmg.23.1659433816391; 
 Tue, 02 Aug 2022 02:50:16 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a5d6405000000b0021f138e07acsm12063874wru.35.2022.08.02.02.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 02:50:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 045161FFBC;
 Tue,  2 Aug 2022 10:50:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH  v4 04/22] hw/virtio: fix vhost_user_read tracepoint
Date: Tue,  2 Aug 2022 10:49:52 +0100
Message-Id: <20220802095010.3330793-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

As reads happen in the callback we were never seeing them. We only
really care about the header so move the tracepoint to when the header
is complete.

Fixes: 6ca6d8ee9d (hw/virtio: add vhost_user_[read|write] trace points)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220726192150.2435175-10-alex.bennee@linaro.org>
---
 hw/virtio/vhost-user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 1936a44e82..c0b50deaf2 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -295,6 +295,8 @@ static int vhost_user_read_header(struct vhost_dev *dev, VhostUserMsg *msg)
         return -EPROTO;
     }
 
+    trace_vhost_user_read(msg->hdr.request, msg->hdr.flags);
+
     return 0;
 }
 
@@ -544,8 +546,6 @@ static int vhost_user_set_log_base(struct vhost_dev *dev, uint64_t base,
         }
     }
 
-    trace_vhost_user_read(msg.hdr.request, msg.hdr.flags);
-
     return 0;
 }
 
-- 
2.30.2


