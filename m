Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCE354D044
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 19:44:53 +0200 (CEST)
Received: from localhost ([::1]:39428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1X4W-0008U3-Kt
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 13:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Wu6-0007T9-O3
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 13:34:06 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:35446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Wty-0006q0-U9
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 13:34:05 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 v17-20020a17090a899100b001ead067eaf9so2816584pjn.0
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 10:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OSXg7oPe/KQHELyRK7+vtlzBlLcuc/ord7UoCPX+kn0=;
 b=U7sG9P6iRj6juV0lA30RoY9dHE2zMfacgls5pCYPQa6IZT501hrg2TQq0/MTD35Yz0
 lHfVGJMok0xJ8OBEXMW94qTfmyXGcCCoKtj/Z5I3IRyXzFRedJoGVnHDnX+RnsDQga2r
 l6VW1sv0jpzGqkhJ1idblC9J1Ev5a84cSRBMwu2tohI0DOhSLXlMYcOYimImeDhSu3oE
 m3fM0zRvZ7+sAdbH0YU3YygO9mvWhT5fxL23So6sv8KA85MbHgElw5GhFfZH08clqrhO
 HFNo4W1Y3eM2TrykkwYZ2e7E5CZ1hKZLH3Glvi7fikJAjt4IXZa6E78vCBfiXfubQurz
 g1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OSXg7oPe/KQHELyRK7+vtlzBlLcuc/ord7UoCPX+kn0=;
 b=SWRC6emJscQsx5OpiSH/8nT6KbWT1DCkbNbaacrSyQ/OVkRL93cgtwODU8pys0Zv6C
 Pz4MWlglqmLyz2/WivW6Je5CSAS1FyK2sfX0cSom0zv4/RUz+Z9PDeuuDGLtzshIMCrm
 WuKBqge6/EZY6/svt7ZP6RVyKKnF0Spo0qHU7PNfMEa3on4jY5ebPFtDdFdPDHStLs53
 biRRW6C4M8BuijeHiRYqTvLDkQjq1qrZlAeIyc1ZAGyuZ6KKJYXauUSFeimlm4jwgqRU
 YawQdPecI+/MArGQvSR8uLYn4WuFafpx0CoeQh6cbqAIVc2/oGFsLH++9kBsOObchhtc
 sHow==
X-Gm-Message-State: AJIora97LcWWMIzeN7tEuxmiGtomP5NpoOvxowynlQqiqr7jtPh9kz1i
 8dzDjbG/mgquvq3irw9TCYE=
X-Google-Smtp-Source: AGRyM1tkW7Xa9CUlUHilDSZjSoQWrh58nr7ASVwQBJXeFUadVgRKftXJHRMd4NthIKAV77F2IWt0eA==
X-Received: by 2002:a17:90b:1d08:b0:1e4:dad9:64e5 with SMTP id
 on8-20020a17090b1d0800b001e4dad964e5mr11339843pjb.200.1655314437559; 
 Wed, 15 Jun 2022 10:33:57 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:4126:b1a8:8fce:1a8])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a633c4d000000b003fcf1279c84sm10171451pgn.33.2022.06.15.10.33.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jun 2022 10:33:56 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v7 1/6] qga: Relocate a path emitted in the help text
Date: Thu, 16 Jun 2022 02:33:40 +0900
Message-Id: <20220615173345.32456-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220615173345.32456-1-akihiko.odaki@gmail.com>
References: <20220615173345.32456-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1030.google.com
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


