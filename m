Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E915840A2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:10:02 +0200 (CEST)
Received: from localhost ([::1]:43502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4DA-0000sU-Qy
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oH3zC-00040t-N0
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:55:35 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oH3yw-0000OI-B6
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:55:34 -0400
Received: by mail-wr1-x435.google.com with SMTP id k8so106449wrd.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qn9sIffAzV9IF+yjjzIzifr78tit+1ZOBIt0UyqO2Rk=;
 b=sgPyErciTNQttlWPS4JPv27YVf7tmojFhsZR9M/WZngizsHWCfovQpwMgyaCu3WxyN
 +ZWRwuKuS4XX1chuuVcV6JTIEVeywSGfzz0iMHQ7+hBO0Uz10nO0wZxtdfuriBZeI3su
 +WuGzOonIXeVtU4Y1YQmHHXd6NwFNlE0NZs4HBGRSVbCdBSKjKPsYQqHfTYae42/tMcN
 RRMYRD1sNkK77Vmg5WXBTcOWeT+O9blgS8mWNLbpOqbL94u+RaJiqAK1NBDLduRTjOSI
 bW+S01sSi2lvy/XJudEcIXf20iGdBa/He+6CG6I2scyT48KHrG1+RD3jZrt8lgUPARd6
 mz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qn9sIffAzV9IF+yjjzIzifr78tit+1ZOBIt0UyqO2Rk=;
 b=0hGtfqPMELLiBe8nt6XgaDKdXKDoyVmDtlQG0/y0yR+i1dG9D9ERTvRQa13TL8tQfR
 QZ0R/JrrirLF5It5u8Lay3zCHIcay5rRM0fhU5c2iSasbNMyxFsYPitpex4SpHzNFsqU
 3D3YR4oCMA8bAjfMUS02R/iNyd8Bj+t2baf6zTjoSqOgtvTrmgZxtDd8oJ/ll1geq+EC
 otsk06DdPxnaUK1Q5gfhgiKRjzFkDGphL+sHH/g6AC8Rf3tOjveixp7LsHh+cvzAYpX+
 Emuc7AlnIVEAvRO0+MNLZXuqoq4eLu+OxPm5VOmXdhY7QaY45T7427EJrqKJBGM6vwVH
 lQpQ==
X-Gm-Message-State: AJIora++aRlZ7oK1Pw8NM4Ry4bCLL+eYKAZaANbpnzPqZ2XkCS/GOBeD
 U9uSY360pC8bhXgmUvoh2zGlxNi+LMuB7w==
X-Google-Smtp-Source: AGRyM1sRG6pgvhAHMH0Ny6QKbtFjgT401bL/pV0TdYiDaIfPFDWAPHUnsQZOlG93RyfFVb6YtminMA==
X-Received: by 2002:a5d:6642:0:b0:21e:f918:b093 with SMTP id
 f2-20020a5d6642000000b0021ef918b093mr2098786wrw.173.1659016509030; 
 Thu, 28 Jul 2022 06:55:09 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c1d1500b003a326b84340sm6114560wms.44.2022.07.28.06.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 06:55:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DB9871FFBB;
 Thu, 28 Jul 2022 14:55:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 3/4] hw/virtio: handle un-configured shutdown in virtio-pci
Date: Thu, 28 Jul 2022 14:55:02 +0100
Message-Id: <20220728135503.1060062-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220728135503.1060062-1-alex.bennee@linaro.org>
References: <20220728135503.1060062-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The assert() protecting against leakage is a little aggressive and
causes needless crashes if a device is shutdown without having been
configured. In this case no descriptors are lost because none have
been assigned.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220726192150.2435175-9-alex.bennee@linaro.org>
---
 hw/virtio/virtio-pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 45327f0b31..5ce61f9b45 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -996,9 +996,14 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
 
     nvqs = MIN(nvqs, VIRTIO_QUEUE_MAX);
 
-    /* When deassigning, pass a consistent nvqs value
-     * to avoid leaking notifiers.
+    /*
+     * When deassigning, pass a consistent nvqs value to avoid leaking
+     * notifiers. But first check we've actually been configured, exit
+     * early if we haven't.
      */
+    if (!assign && !proxy->nvqs_with_notifiers) {
+        return 0;
+    }
     assert(assign || nvqs == proxy->nvqs_with_notifiers);
 
     proxy->nvqs_with_notifiers = nvqs;
-- 
2.30.2


