Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E537D11AD67
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 15:26:54 +0100 (CET)
Received: from localhost ([::1]:43188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if2x3-00082k-F9
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 09:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34250)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1if2u0-0005S9-EF
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 09:23:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1if2tz-0003KG-Ah
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 09:23:44 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46835)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1if2tx-0003HB-UH; Wed, 11 Dec 2019 09:23:42 -0500
Received: by mail-wr1-x442.google.com with SMTP id z7so24127990wrl.13;
 Wed, 11 Dec 2019 06:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G3GeihMZT3FWsjutpTGVLlWKTkWWsva27E3p012qRdM=;
 b=jYmZJdGApqvWqno72RJiaFqaTJfxdcrNalfWXkHTsRTNBl2/yWVIUZcQodnIBAEgGG
 zGXkQD4ljkgQHMEkiwXnWl9nhnbVkh78A5wtqJzrjzCNlBbK64/RA2rZLulR3Mj2FpNr
 LX25NYFtTJFAjRiFsgvN+PuAdyTbuB3xl1wHKPBbENklL6REVYm8HfMeGbjV4LojWjrF
 zEePCxWJV0ZqhLPXWcCn/isXCIhSQfqw3RRwCTuLqz9xdxLUdxPtKf1w+BMQ8pSKb06f
 xEy2Fqkp4yT9Wz6J98WgAhW3pxaFDho8i+imHc7te7npPGV5Y4wnYaUiYa8ZqXd3sJf7
 gJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=G3GeihMZT3FWsjutpTGVLlWKTkWWsva27E3p012qRdM=;
 b=riicZ6GX5Hvkb+OLPMXl5j25MHIXPen1lpRO70h0r4bKOosXK5D+Chym+3jpKAo4Df
 MG8MUXXaRF1Ff4uXqLL7RaLg07hCAVsnT1C1S1UobbAthGAVsGNEtwbc9yjvuJR2r8Jb
 kIo3AGemT5elVf4/mEv3nhw2gyWC1XLFe2ZXpqrE7zdVy47DsRccsSZYoOUnfS+MvC8d
 id2X0xxUyJ3D7F/bYQWhGdDbU5e7HZmHSxZOjncjNLNSPVla3ylXkvkXWB/ocOeynkV0
 QbqrlkkPpcRH6hb8KiIRLAX8AAhdFmYWt+9aHELZe5YUGJnid0GTtF0KNKVOn3f6be2Q
 U0Hw==
X-Gm-Message-State: APjAAAXNjtMVWCZ1HKoPLPkNGaYCiw6H0cwClU826wPfM06M8wQhxQyF
 UkNLEhwL+tKWeIP7OqQb7Gnat+Jj
X-Google-Smtp-Source: APXvYqwu53PGob/6lanO0f+642FFrZJLIaP28NsWQttXCl0moOqq3op+GU1gt9i4S5t96fxJ0nXwkw==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr42915wrw.31.1576074220323;
 Wed, 11 Dec 2019 06:23:40 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id g23sm2503783wmk.14.2019.12.11.06.23.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Dec 2019 06:23:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vhost-user-scsi: fix printf format warning
Date: Wed, 11 Dec 2019 15:23:30 +0100
Message-Id: <1576074210-52834-9-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fixes:
../contrib/vhost-user-scsi/vhost-user-scsi.c:118:57: error: format specifies
      type 'unsigned char' but the argument has type 'int' [-Werror,-Wformat]
    g_warning("Unable to determine cdb len (0x%02hhX)", cdb[0] >> 5);

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 contrib/vhost-user-scsi/vhost-user-scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
index 0fc14d7..7a1db16 100644
--- a/contrib/vhost-user-scsi/vhost-user-scsi.c
+++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
@@ -115,7 +115,7 @@ static int get_cdb_len(uint8_t *cdb)
     case 4: return 16;
     case 5: return 12;
     }
-    g_warning("Unable to determine cdb len (0x%02hhX)", cdb[0] >> 5);
+    g_warning("Unable to determine cdb len (0x%02hhX)", (uint8_t)(cdb[0] >> 5));
     return -1;
 }
 
-- 
1.8.3.1


