Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C2F3A851F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:51:42 +0200 (CEST)
Received: from localhost ([::1]:54242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBLp-0006Oz-Ed
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEx-0005pi-Sz
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:36 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEb-0000vo-HR
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:35 -0400
Received: by mail-wr1-x430.google.com with SMTP id r9so18878380wrz.10
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cipqIlsmLSO9u7dovDg0ywdZ2LzSLNBpLmnZFygx3Mg=;
 b=Odoo+RKdpvPGv1g6puYC3vqZB0y7yToaNrcK+Bzq2iUKOMrd9qHUGi9qP/eS2o6cvu
 v3GnkIYo7NmcxjdnbtF4WUeGHT/0AlAnTmsahAWHRzUrVe7ct+fNTN5qxm5HHowCUAWD
 dw9/XyPRVLTFU7XQJyb1DriEm8LcEC0Z/6DlgWilpiYvsDnU3IISYjCkC43tEJxD2SR5
 Aq8SRwMmRzZ0k58zk4mBgivO/2pXS0qr6BbtdgSWQC9r1NFYdbGcriALk+RgEnELhMOD
 gakz0NRHldKYxaFo+GWkriwuRAvaIJJJd0XQHP+WH1wq7c5UsLwVSzW0ra9FRtQ1vQsG
 fTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cipqIlsmLSO9u7dovDg0ywdZ2LzSLNBpLmnZFygx3Mg=;
 b=mofYYM+hKlngmMCGL0dN0y+2luJR26inTYcLJvtsBb2GbncH/uEYEb+MDkVwv2UBFF
 7N4gGSDQ6SgStKPZ/QJGQhPDeZxkYJtHlLQTzPiuoQmrrLdhtmq1/bgtzegh7VfOMEDU
 J86jvpGMC+fBdyKSTZZFY2HMBI9l8UFQ+xF4lWv2rl7bGMJn4Qqvp3Eh6aMc9AYsm/XU
 oC4RtbQvzUFBRJCKeqjYLz3jqDbrIF9Orx5vO9Ts1H44OZ9omxO35YW+v6YL+532fb1H
 i25/Ny/YIWXMA6Nq3DyB3GDWJFmOexbzfscc4SbuFJ2iPDoGq9UAhban3sEs8aK3hWe+
 /D+Q==
X-Gm-Message-State: AOAM531HE50JkrMl8xqcu9o1S9ZayPRY1ogX42ZhpiiarAg/oHlYzHpn
 suORfRYZFRGxmrwB6sq8C6Vu90WKWxnSbQ==
X-Google-Smtp-Source: ABdhPJwffP+GRLAdKaCM1lXZ3t7Pp2UtsKH8fSrhdHJTPtMJERm6+XQldzrA8nqs95mwLp/P/6cJqA==
X-Received: by 2002:adf:b34a:: with SMTP id k10mr26182416wrd.333.1623771852287; 
 Tue, 15 Jun 2021 08:44:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/28] hw: virt: consider hw_compat_6_0
Date: Tue, 15 Jun 2021 16:43:42 +0100
Message-Id: <20210615154405.21399-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Heinrich Schuchardt <xypron.glpk@gmx.de>

virt-6.0 must consider hw_compat_6_0.

Fixes: da7e13c00b59 ("hw: add compat machines for 6.1")
Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-id: 20210610183500.54207-1-xypron.glpk@gmx.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 840758666d4..8bc3b408fe7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2764,6 +2764,8 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
 
 static void virt_machine_6_0_options(MachineClass *mc)
 {
+    virt_machine_6_1_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
 }
 DEFINE_VIRT_MACHINE(6, 0)
 
-- 
2.20.1


