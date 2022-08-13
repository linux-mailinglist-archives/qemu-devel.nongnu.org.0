Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C832E591814
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 03:13:51 +0200 (CEST)
Received: from localhost ([::1]:53048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMfio-0002Lb-Uy
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 21:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1oMffl-0004ug-Ln
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 21:10:41 -0400
Received: from mail-pj1-f47.google.com ([209.85.216.47]:35530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1oMffk-0003F7-8e
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 21:10:41 -0400
Received: by mail-pj1-f47.google.com with SMTP id
 o3-20020a17090a0a0300b001f7649cd317so9793407pjo.0
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 18:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=oXQhEqesQmOkBaOOD7EPr55TRQt7Z0UZEV6CPXFQ1eM=;
 b=aj1beelHz4S0hgPGhLm9gyx0BJAJ07lCuKkNQ6auLGVi7RaR0tmKneg/NDSIoIN5Kf
 U1cPwYY9bbYv50e+K2BWKFYxxaCg2ys4L0jiLPIGgPxBbkZviQXEKfTwO164+bPgIpG1
 0PYYxzHeBT4vCgVBkXhvLnRPkhq/Y1HG/+WywNHAgt+zOmJNsYnT8nmRvlYsjJaPVKXa
 prELSxxyz7LexD4RsLOoUspEerSsguOFzDtBAaFfpbmYIv29YHMUBvVlkZGWFU//Ko7z
 1GbzxW2WUBoJA0alcwbta5la0awaDrWYGtFCctuwfJXrOVTtlQ5f4ezs/+zuoi3KTAY3
 Nv8A==
X-Gm-Message-State: ACgBeo2lP/mRsbc38kdXnnNDPPf+01lHqGM95+om3tbYfup/CiGyLqxV
 00eMf4iwEoOqRqUUKq9BFYOMEg1KdsB65w==
X-Google-Smtp-Source: AA6agR6Qy9+jIGMfMzyI2WxtdVjIM2o9qMBDqmUnelg7TFhWSAzku1F0SRdyefRdNcZQAkS73nIVpQ==
X-Received: by 2002:a17:903:248:b0:168:ce2f:cbd2 with SMTP id
 j8-20020a170903024800b00168ce2fcbd2mr6456936plh.63.1660353038640; 
 Fri, 12 Aug 2022 18:10:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:642:4c09:6206:ddeb:f971:2f4c:7f03])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a170902c94a00b0016dcfedfe30sm2440976pla.90.2022.08.12.18.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 18:10:38 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Cc: Joelle van Dyne <j@getutm.app>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/3] Revert "usbredir: avoid queuing hello packet on snapshot
 restore"
Date: Fri, 12 Aug 2022 18:10:29 -0700
Message-Id: <20220813011031.3744-2-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20220813011031.3744-1-j@getutm.app>
References: <20220813011031.3744-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.47; envelope-from=osy86dev@gmail.com;
 helo=mail-pj1-f47.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Run state is also in RUN_STATE_PRELAUNCH while "-S" is used.

This reverts commit 12d182898a4866e4be418e2abac286b497cfa1b2.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 hw/usb/redirect.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 1bd30efc3e..fd7df599bc 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -1280,8 +1280,7 @@ static void usbredir_create_parser(USBRedirDevice *dev)
     }
 #endif
 
-    if (runstate_check(RUN_STATE_INMIGRATE) ||
-        runstate_check(RUN_STATE_PRELAUNCH)) {
+    if (runstate_check(RUN_STATE_INMIGRATE)) {
         flags |= usbredirparser_fl_no_hello;
     }
     usbredirparser_init(dev->parser, VERSION, caps, USB_REDIR_CAPS_SIZE,
-- 
2.28.0


