Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F86591810
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 03:12:31 +0200 (CEST)
Received: from localhost ([::1]:50680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMfhW-0000fY-7A
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 21:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1oMffp-00052t-NJ
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 21:10:45 -0400
Received: from mail-pg1-f170.google.com ([209.85.215.170]:42670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1oMffo-0003IA-8B
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 21:10:45 -0400
Received: by mail-pg1-f170.google.com with SMTP id 73so2095316pgb.9
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 18:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Cdlu6K9apoTCgGPgL44DuT+r/tSN/cJ3DLEo9qO0aBQ=;
 b=4wlIEYZ+Dh57lfE4Dbddf/Nz8zAVGmM9pIK64qaaiOiVLHdfK6ACj5lQoQZ41S2dAq
 r9A62C7K148MdFKL12mnCfY6ShuFBMdFnwYbMgNY5nIJiirAZ7EATdjNoRarlIhKsVqk
 VqSrdxMVitUC5kFHD3Bw/PDJ3wV84km8qDgAJN0+hEyYxdGZ1HBuxGbfgr5PRk9NkL/T
 CgI3zddZir8TMr27HwTZx5/cwprFA3VyXvqgt1Ycy4EKWXHT3HXjd0W7XrnpEqRciUVn
 c9ElFQOwbwY2//yZGjTsKSgBXygYONFknLukei2tv46l/iSJCJgpTjCRRHIKzm+Epx4Q
 d7pw==
X-Gm-Message-State: ACgBeo2NwNhI2r3U4B+eE7IRAM5dd8w3GF9J/HVQMCl/KAuA/wUnmvmJ
 ONMDyy7fA1tFMLIISvDdeLYYyJxF7LBytQ==
X-Google-Smtp-Source: AA6agR7UOJLUaGJf9jTfIjpmLurc63HyQWTI96FVtrgsXvk53RN6xB/GfFWPU4IAFG0FbRSllV771g==
X-Received: by 2002:aa7:8f0a:0:b0:52d:8135:64e0 with SMTP id
 x10-20020aa78f0a000000b0052d813564e0mr6364051pfr.0.1660353042916; 
 Fri, 12 Aug 2022 18:10:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:642:4c09:6206:ddeb:f971:2f4c:7f03])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a170902c94a00b0016dcfedfe30sm2440976pla.90.2022.08.12.18.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 18:10:42 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Cc: Joelle van Dyne <j@getutm.app>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 3/3] usbredir: avoid queuing hello packet on snapshot restore
Date: Fri, 12 Aug 2022 18:10:31 -0700
Message-Id: <20220813011031.3744-4-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20220813011031.3744-1-j@getutm.app>
References: <20220813011031.3744-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.170; envelope-from=osy86dev@gmail.com;
 helo=mail-pg1-f170.google.com
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

When launching QEMU with "-loadvm", usbredir_create_parser() should avoid
setting up the hello packet (just as with "-incoming". On the latest version
of libusbredir, usbredirparser_unserialize() will return error if the parser
is not "pristine."

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 hw/usb/redirect.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index fd7df599bc..47fac3895a 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -1280,7 +1280,8 @@ static void usbredir_create_parser(USBRedirDevice *dev)
     }
 #endif
 
-    if (runstate_check(RUN_STATE_INMIGRATE)) {
+    if (runstate_check(RUN_STATE_INMIGRATE) ||
+        runstate_check(RUN_STATE_RESTORE_VM)) {
         flags |= usbredirparser_fl_no_hello;
     }
     usbredirparser_init(dev->parser, VERSION, caps, USB_REDIR_CAPS_SIZE,
-- 
2.28.0


