Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A71354CE9A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:27:39 +0200 (CEST)
Received: from localhost ([::1]:40874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Vrl-0003xQ-N4
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1VO4-00083a-60
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:56:56 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1VO1-00088P-PI
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:56:55 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 mh16-20020a17090b4ad000b001e8313301f1so3568985pjb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 08:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OSXg7oPe/KQHELyRK7+vtlzBlLcuc/ord7UoCPX+kn0=;
 b=T0yU2g1d6lFZ6Eibs2+vHhjHveAGkcILaW83XyZqOUyvbTSgKbTdprZk2SkbYZwfAK
 TxQeY1Xa4jP3JLVv9ACauH9HPVQzEjsxUr4W2LtqiQnraY6E35ydxkbeyRADRrGEiDqD
 VOT8S/PnR4XMVddNlHN+N0x05CXs5cGDKAhnzsPqT6NCHAUn3bL0uR+if4ueHBlJlPOp
 2pKb8V5817occMXZPyj2qZ7JPy7e/kFpzePrDqe4Zira3uPRbNBop2J7Dud+NnF/0le2
 GLFJXVQDsmqrGO8d4Ee/XR4gsWpuK+eCMaHVnYtm23woCsP0uLz8zMGHmuw9q9L/hJ6c
 oM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OSXg7oPe/KQHELyRK7+vtlzBlLcuc/ord7UoCPX+kn0=;
 b=QRslnEI8VBSOH4SiTKjhKPUrp2uWdYg25CEhuFpGaChWgqBW5iNtiHG0x20uf5FSzR
 P4lJ1xSubB916H0WvY9AzWm6F7lOjw6tOEjkWZuVo343WEsGtuGrxkCMdGNLPlkkt9vH
 cStMBax3PGVsNa6WgKp5s+7EHIaohRFfkeIaJyxBlfv7/nApWlxR+3rN+JDTTBsHXBFf
 RO/cDLjOK6y2ENGHxnAUnBLYn3rORgtwv9rNlZD1ez+W9CRAkI6gEGFocjbdKDGz/KyO
 yadM1tDFtKcNYSIBTlRx+garR96/5a73jzQyEEj4ZdyPlTEKirAcLjIij2suBcKe1nmE
 XSWQ==
X-Gm-Message-State: AJIora9qBk3SxTHuKDSp5HgV8Ug06lvzYCFzD89/3gm7fmKxUFFO1+ZY
 oP8O05/pxqpKFzDXnnfFbZ7nlAvibZc=
X-Google-Smtp-Source: AGRyM1t1KHtAWfmWlEn52acjc3nm9O+L057IcSWxSg0pF5mdW/wmPv5B8MiyQEf8NnUkwLYNQfKyaw==
X-Received: by 2002:a17:902:8343:b0:167:8899:2f92 with SMTP id
 z3-20020a170902834300b0016788992f92mr434086pln.117.1655308612376; 
 Wed, 15 Jun 2022 08:56:52 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:4126:b1a8:8fce:1a8])
 by smtp.gmail.com with ESMTPSA id
 a34-20020a056a001d2200b0051874318772sm9860038pfx.201.2022.06.15.08.56.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jun 2022 08:56:51 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v6 2/7] qga: Relocate a path emitted in the help text
Date: Thu, 16 Jun 2022 00:56:29 +0900
Message-Id: <20220615155634.578-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220615155634.578-1-akihiko.odaki@gmail.com>
References: <20220615155634.578-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 qga/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/main.c b/qga/main.c
index c373fec3ee6..06e507b9979 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -270,7 +270,7 @@ QEMU_HELP_BOTTOM "\n"
     , cmd, QGA_VIRTIO_PATH_DEFAULT, QGA_SERIAL_PATH_DEFAULT,
     dfl_pathnames.pidfile,
 #ifdef CONFIG_FSFREEZE
-    QGA_FSFREEZE_HOOK_DEFAULT,
+    get_relocated_path(QGA_FSFREEZE_HOOK_DEFAULT),
 #endif
     dfl_pathnames.state_dir);
 }
-- 
2.32.1 (Apple Git-133)


