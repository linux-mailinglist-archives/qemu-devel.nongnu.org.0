Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B96351E3EF
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 06:21:13 +0200 (CEST)
Received: from localhost ([::1]:43900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnBwN-0001q5-KZ
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 00:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1nnBuV-00019d-Bt
 for qemu-devel@nongnu.org; Sat, 07 May 2022 00:19:15 -0400
Received: from mail-pl1-f180.google.com ([209.85.214.180]:39733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1nnBuT-0007Hf-J2
 for qemu-devel@nongnu.org; Sat, 07 May 2022 00:19:14 -0400
Received: by mail-pl1-f180.google.com with SMTP id x18so9213494plg.6
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 21:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2/xTeW5SHQqZq35IQKropiKdemKIbt4uB7e4L2uxmUg=;
 b=0u9crS1Mk1sjFeb46/6RO242xKISlm7X+ehwczC2gbOwdEGyJ/kGwRLdhAqZiPc/W+
 xG5VdjYfagVrehLSsJxt/kRPbauGGgPVtMuhlPpKq7EcrSQEGdDT9Izo2jDwOuZmo/Ey
 zRNzeT7GrKvaulgXFEmm7bRdYTiYlMKHvf2f7GJM8ftB/z55IEyJseUMCnYjkM8Bcjk8
 HI/cnXU6swi11hssR0aLO3J/DAA85ucTknQmnCW9ARBdADO6BCjxMIxgckGkZ3G/y7Au
 8+hnG3bTHlHlcZlRVTBRCMckpSsRmYX1t12omKEygSBejENTfWn+yovu5DUi56SRHvIV
 D5dg==
X-Gm-Message-State: AOAM53274xpPkyKoJnk04/K5O73Gc0N50koLwOAsqZHAgs5htWMb8DHC
 NfxquUqk10yH3UEbyJZjhReOGTxJwWI=
X-Google-Smtp-Source: ABdhPJw3RMDb1+fBFmO0X1UbcOZY1tFriPpMIth2ksrCRqfXvGms6wWlxEnY/CdIEt5mJpvRFZST7Q==
X-Received: by 2002:a17:902:f605:b0:14d:bd53:e2cd with SMTP id
 n5-20020a170902f60500b0014dbd53e2cdmr6961366plg.164.1651897132689; 
 Fri, 06 May 2022 21:18:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:642:4c09:4a59:dcf4:b57f:c7f0:1f0a])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a63584d000000b003c14af50606sm4007166pgm.30.2022.05.06.21.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 21:18:52 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Cc: Joelle van Dyne <j@getutm.app>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] usbredir: avoid queuing hello packet on snapshot restore
Date: Fri,  6 May 2022 21:18:50 -0700
Message-Id: <20220507041850.98716-1-j@getutm.app>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.180; envelope-from=osy86dev@gmail.com;
 helo=mail-pl1-f180.google.com
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
index 3bc4dee7fe..f8bec9b292 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -1280,7 +1280,8 @@ static void usbredir_create_parser(USBRedirDevice *dev)
     }
 #endif
 
-    if (runstate_check(RUN_STATE_INMIGRATE)) {
+    if (runstate_check(RUN_STATE_INMIGRATE) ||
+        runstate_check(RUN_STATE_PRELAUNCH)) {
         flags |= usbredirparser_fl_no_hello;
     }
     usbredirparser_init(dev->parser, VERSION, caps, USB_REDIR_CAPS_SIZE,
-- 
2.28.0


