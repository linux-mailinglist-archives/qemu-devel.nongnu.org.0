Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E14650BEA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:42:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7F7O-0008GO-SZ; Mon, 19 Dec 2022 07:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F73-0008Bh-RE
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:25 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F72-0006V3-9r
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:21 -0500
Received: by mail-wm1-x332.google.com with SMTP id m19so6255400wms.5
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Yk+o+e57cTJv24JBfvcSDnCA7jMBLzUGDzockS9QEE=;
 b=MneuyiiiNo5ONvFtkb/U0C5D7RVBF9DFysrezQtUQ2eJMEd4snqJ4nnJuSAMcykdzz
 72BoDs6RGoAoHXL02F4Hdi/UQxcIAuJuwfGVewVrZEOg31cOMpyErZJRo89/gu+tc6sT
 KEwxqzbvLKrXRKg1F65u9ijiWy1abuVN1B/X9vU/rvdVI21XcnkjfgMTO/Ek1TPHSrAt
 p4xE3+590rC5MsVhW1F4p6vPsBG+RJgJy4U1dnpYGE7n3yd4LeYZGLSQ3qv8S4OCHtnh
 9VkqeGZOWX/BTWTv7G1a23U1nuTTTMbek5AjSP2jqL1PJgcAxh57KSeZsrQvUHRy0wOv
 LGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Yk+o+e57cTJv24JBfvcSDnCA7jMBLzUGDzockS9QEE=;
 b=SMzq0MSTjNrwS8aEJpgTNKOGkpSBfqjb1LvG5CqGuRCSFOI/KPZetDygZlMw5XZctS
 mq1wSHOkpfYelFfNEq+QL6hVQXAbwhryHAPCOKJZXGXJ9TLnrBB5AA7FdePFDahcXA/q
 TyF4cHeTTenJfIvERLGTh59WVAqcJ30V3I6Mu1dV96+rDGOerFo3aevFHSQ8s4jEFCWN
 r7O0n5o+tqM4+LYfJk22vXhGO5F80GZbC7OY2EJnZCfhgOu86KiyrQQC+apf5fllRosl
 YRujEekU/W5HguTWBkgr/+bdLRCmqhecREtoBD48Z0WCFz5BPMAMDw1+HQjN230opz3q
 dNEA==
X-Gm-Message-State: ANoB5pkvZU2DTsZ3f9nLFE/i/zZk/RNqYV5fva3Hxa3NZUkcJ3U5jhpU
 mC0BfxXxqQiHL4y2gTF1g3GqWQ==
X-Google-Smtp-Source: AA0mqf6NNbaoTOZYQaqysGZ99K7gSyjrhRxKwZ8JG5w470K3OESn9XSn1aeMo9H4GGcwsMZ27pLmEA==
X-Received: by 2002:a05:600c:5405:b0:3d0:47c:9fe7 with SMTP id
 he5-20020a05600c540500b003d0047c9fe7mr31545227wmb.40.1671452358773; 
 Mon, 19 Dec 2022 04:19:18 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05600c214200b003cfa81e2eb4sm11943869wml.38.2022.12.19.04.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 04:19:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3274A1FFBE;
 Mon, 19 Dec 2022 12:19:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: [PATCH 06/11] contrib/gitdm: add Tsukasa as an individual contributor
Date: Mon, 19 Dec 2022 12:19:09 +0000
Message-Id: <20221219121914.851488-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219121914.851488-1-alex.bennee@linaro.org>
References: <20221219121914.851488-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

I wasn't sure if you want to be added as an individual contributor or
an academic so please confirm.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 contrib/gitdm/group-map-individuals | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index 53883cc526..e2263a5ee3 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -37,3 +37,4 @@ akihiko.odaki@gmail.com
 paul@nowt.org
 git@xen0n.name
 simon@simonsafar.com
+research_trasio@irq.a4lg.com
-- 
2.34.1


