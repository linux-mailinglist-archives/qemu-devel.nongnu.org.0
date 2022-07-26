Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AED581A50
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:29:43 +0200 (CEST)
Received: from localhost ([::1]:40344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQFS-0005ey-An
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ89-0003Id-A0
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:11 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ87-0002Gz-Nn
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:08 -0400
Received: by mail-wr1-x431.google.com with SMTP id m17so21166989wrw.7
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xHvKCgTFOboJAxlx1VRnV/BrW7lfE7earyZdZjM6gSA=;
 b=Jzx3eeK3Bd+7DFk/YQqrFhuAfovlpYNiDON5TdSKn+roVK5OiJj5M63gSMs9Z7pm0e
 x6jUJ/LkB1108z55lUHM9bxBHnP/qUEDRh4c7+A4tWNYJgaGLoJM9hfskWzKwAY/x7L3
 Pdg9YIgfAkAwPeu6FN4zJYndSuG4nJqKbqYQqLu20HzU/Y7BnBKhGTmI9wwotgFf5zLW
 EXQwTkJwMYwkgOzJanDfK5CQkYV0wNPm48E2afrEXXjKH7FUvLK24IRv1qCZ+JMDw91P
 QwJL8zsQPxWpwsxn0/ntDL4XkCM/3JvkD+kEQwSJqSPpeYpTuqQpnx5YuReJNlMDh7LC
 P+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xHvKCgTFOboJAxlx1VRnV/BrW7lfE7earyZdZjM6gSA=;
 b=NVYbdjzYDedkqHGTLW5c21EEsK45bfgCz4fnNle88b5MTl0W5NwmVKQzzj/izaA9m1
 bpvA5MedXXpnEmUedc2xOBb4tYETYkP1vKsPNdg1zHlGGpQfao5ebGmaZOT7MnanZqqJ
 VACKk6nOHZN84AFh5GBfIIMPF26OYcLR4M9T6OmQzGgmuCeXG5VLGR5cZY0pfF1vkY/s
 8ThHLBR/lcUj7152CyhaABHhqAhy6OjRGgPd5MqEz8EWGx4lzFcs6EFooeBih9kMCw43
 pUi6r+inadDW+cbvxp14HRxE6neZcvDXA9No6B72V1S3zYMif7M+Iw10LAZk2MGAU33T
 yn9Q==
X-Gm-Message-State: AJIora/aynVxELDT5T6xPaTS6v6LUUkhoOd1pxVfl70e3KlncsBkfqSv
 IcSPLCdWc80venlSqbizy3FaEQ==
X-Google-Smtp-Source: AGRyM1uUcaatSO06MmunybWB6jjEFAwJxjiPYmuuRJC84yoP1y5y6nOI1Ni7Mu3oqxZElK4+lYbaiw==
X-Received: by 2002:a5d:598e:0:b0:21e:7348:69bf with SMTP id
 n14-20020a5d598e000000b0021e734869bfmr10706399wri.157.1658863327071; 
 Tue, 26 Jul 2022 12:22:07 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c17-20020adffb51000000b0021d7fa77710sm15226747wrs.92.2022.07.26.12.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:21:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 14E4D1FFC1;
 Tue, 26 Jul 2022 20:21:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 09/21] hw/virtio: fix vhost_user_read tracepoint
Date: Tue, 26 Jul 2022 20:21:38 +0100
Message-Id: <20220726192150.2435175-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
---
 hw/virtio/vhost-user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index a96a586ebf..b7c13e7e16 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -296,6 +296,8 @@ static int vhost_user_read_header(struct vhost_dev *dev, VhostUserMsg *msg)
         return -EPROTO;
     }
 
+    trace_vhost_user_read(msg->hdr.request, msg->hdr.flags);
+
     return 0;
 }
 
@@ -545,8 +547,6 @@ static int vhost_user_set_log_base(struct vhost_dev *dev, uint64_t base,
         }
     }
 
-    trace_vhost_user_read(msg.hdr.request, msg.hdr.flags);
-
     return 0;
 }
 
-- 
2.30.2


