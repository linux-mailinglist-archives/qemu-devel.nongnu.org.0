Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32519693EAD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:07:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRStP-0000nc-Of; Mon, 13 Feb 2023 02:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRStN-0000mQ-Bt
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:04:49 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRStL-0000le-QV
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:04:49 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so8224235wmb.2
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jz/OlZ7doHa0+NAa3PesX+R44gnSBsZj1QZteHGnoxI=;
 b=PaneiVAgygXpNEZZOPRCvF44cqCZnBm4lAjQlFA7KxLHym9zhssUcmma3K9w6WgrkF
 5b7iQIfY1i2jULxJXuP/JqffoyftFHNt7145tv8p0DH7nvfhTmb+fl3tFCuRRsWbXSf8
 A5MzBFSj5NUV1wt+TGbdN5382meYuQy91QwJpvnVs4Yd1w+tfsjrBwDqPSd+wNh7fmOy
 r/KQ7uufc/2hne4vq1EB6F8/efc9Gx2Yhr29uQh9q4zjAMJlzdmzM8MRmUtK1BlPLx1q
 dFqY3UyhSX6sBaJd75E9mBvMEikHjzBADG+LNSiNCsVcQ1Prqe1ZUBtTnMnc69kuiaLS
 1prA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jz/OlZ7doHa0+NAa3PesX+R44gnSBsZj1QZteHGnoxI=;
 b=RZWRVS2Ot8mjCNqr8cDZfZeswVh80hXfUokp4wfCygY1/WgHJxzEcAx5G4+m1lECmm
 z3OI9KBZ8hF8PxHZgaeBwJcqx41+kHcXXiZi0pSVxEPtiQvZPJbNL6LERncvYuAWG8OI
 xBNiHOxtJFBWVh6sODT7XHJl/scEyolj1AIu39BY8Bh/iNyoob7fi7TRQplVR9+ImPnz
 NRSfVME8dEWHRtwI+pzNGJl0TfRxr1YW1ck1AUcIyAi0al6Ed7cKFxgCm1xBcahE+5WQ
 BON0cLxXGDpBq2qaZo8tVk7wiLbpUfk20ITUh9nVN5uWSaQnIM62zAZAVPKHCMe6T7B6
 snrg==
X-Gm-Message-State: AO0yUKX9vTZ8ucgon4ivFh6Mhf0IJ9nKYqWpnBuooxMvTsJNC0YZjyLW
 lyFzgCwQRDWudO69UtRPg35wFiV8vpEPOakQ
X-Google-Smtp-Source: AK7set9NOkotw/QoFo5sY7z8laTN8K8WO97o270ohMOMUr5vwGeFZWSa8vzODEYq6aLIscjOcyKEmw==
X-Received: by 2002:a05:600c:16c4:b0:3df:f71b:3f68 with SMTP id
 l4-20020a05600c16c400b003dff71b3f68mr17867842wmn.39.1676271886311; 
 Sun, 12 Feb 2023 23:04:46 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a05600c35ce00b003dc4ecfc4d7sm13827394wmq.29.2023.02.12.23.04.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:04:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Gonglei Arei <arei.gonglei@huawei.com>, Li Qiang <liq3ea@163.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Hu Tao <hutao@cn.fujitsu.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 4/9] hw/net: Replace dev->parent_bus by
 qdev_get_parent_bus(dev)
Date: Mon, 13 Feb 2023 08:04:18 +0100
Message-Id: <20230213070423.76428-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070423.76428-1-philmd@linaro.org>
References: <20230213070423.76428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DeviceState::parent_bus is an internal field and should be
accessed by the qdev_get_parent_bus() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/virtio-net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 3ae909041a..8bc160ab59 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3423,7 +3423,7 @@ static bool failover_replug_primary(VirtIONet *n, DeviceState *dev,
     if (!pdev->partially_hotplugged) {
         return true;
     }
-    primary_bus = dev->parent_bus;
+    primary_bus = qdev_get_parent_bus(dev);
     if (!primary_bus) {
         error_setg(errp, "virtio_net: couldn't find primary bus");
         return false;
-- 
2.38.1


