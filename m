Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1065EE601
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Nov 2019 18:32:08 +0100 (CET)
Received: from localhost ([::1]:35738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRgD2-0003SH-0s
	for lists+qemu-devel@lfdr.de; Mon, 04 Nov 2019 12:32:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33430)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <flukshun@gmail.com>) id 1iRgBV-0002Xa-0G
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 12:30:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <flukshun@gmail.com>) id 1iRgBT-0006ND-UW
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 12:30:32 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:40131)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <flukshun@gmail.com>) id 1iRgBT-0006Mf-QE
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 12:30:31 -0500
Received: by mail-ot1-x334.google.com with SMTP id m15so6345326otq.7
 for <qemu-devel@nongnu.org>; Mon, 04 Nov 2019 09:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jNT3t4quzGSS/pxjS5hCboJ6+DmPB/mrE5H6qMsJU9s=;
 b=YJtshmSoDPLi9X1toaro1EUfnMTXkRB68f+b8OJuCDTtKuLfJtG3uOZxr9LbJAOkJD
 KQZAWv6xkCjN22/Y17RJk+BGJ7lAWyjIXmkEGLtvO25OFE8PseUzsmmtx/Hca2MnBNsX
 ZWNub58uhNQf9PU/tbOnAExgHXa3lUY+Wi5/oHQSOh7LODcseQXXNfp1WwMr12k5Tm7Y
 Sikk3HwudosCcG3S8f/ftQKVmrBkmhrdctb9d0S+iyNco27TM4LfxlmW+gfwznB6ne8x
 /sReKwqRY0SzYdrenaQNCZTDfors0MjNFo/S45ImKCIQxPp/FeKo6gCjrG6HsQAImvSB
 HSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jNT3t4quzGSS/pxjS5hCboJ6+DmPB/mrE5H6qMsJU9s=;
 b=aNb1/SKzR5nXRyb2yg1LjpF74MzmhwWHB8zTD6bxASNMtQUrL8yfJAys3wkE/kOSvW
 ReftbVoIzEPn4Hv+GX02bJvF2FFmQ8JR1e1dMkaZT9zI+/PHdQInEn4W3cf29csYRA40
 gHw5NtJQkXJXT1nbN0ypX8CzgcqM8xwuLQkTK1pRzLEWirkyIyOdJcrgXgn5irGKD7VZ
 QJ5YuBHHQZQdRfbWA2rsso2xH7raPrJDyBtsm3LAaX28e5F6n4HoMyPE+Lhc52k95x+S
 yJmeQFe/adS9GLccMx34CC9/mdVGlkX+vm1FaKkIg5P1HlsuNv0f5u0DLT/7+XK7ES+/
 YnhA==
X-Gm-Message-State: APjAAAUQ1kboDHjAvvru3LhCe1x8HxGNX9w1G7jV65L+kGMbuIPVqmvP
 Y3KRaEOxcGC5C9WM+K4WRlAl0SYfRao=
X-Google-Smtp-Source: APXvYqyVyRvGNx7H+3wFwu7p7hi7Ei24yOsyxZ3sqW3wf9cHrwq/+1ovRvH0+AOMR787yCbPT29eJg==
X-Received: by 2002:a9d:5f0f:: with SMTP id f15mr18308402oti.251.1572888630362; 
 Mon, 04 Nov 2019 09:30:30 -0800 (PST)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id c83sm3895064oia.54.2019.11.04.09.30.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 Nov 2019 09:30:29 -0800 (PST)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] qga: Add "guest-get-memory-block-info" to blacklist
Date: Mon,  4 Nov 2019 11:30:17 -0600
Message-Id: <20191104173017.14324-3-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104173017.14324-1-mdroth@linux.vnet.ibm.com>
References: <20191104173017.14324-1-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::334
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
Cc: peter.maydell@linaro.org, Basil Salman <bsalman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Basil Salman <bsalman@redhat.com>

Memory block commands are only supported for linux with sysfs,
"guest-get-memory-block-info" was not in blacklist for other
cases.

Reported on:
https://bugzilla.redhat.com/show_bug.cgi?id=1751431

Signed-off-by: Basil Salman <bsalman@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 qga/commands-posix.c | 3 ++-
 qga/commands-win32.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index dfc05f5b8a..1c1a165dae 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2730,7 +2730,8 @@ GList *ga_command_blacklist_init(GList *blacklist)
             "guest-suspend-hybrid", "guest-network-get-interfaces",
             "guest-get-vcpus", "guest-set-vcpus",
             "guest-get-memory-blocks", "guest-set-memory-blocks",
-            "guest-get-memory-block-size", NULL};
+            "guest-get-memory-block-size", "guest-get-memory-block-info",
+            NULL};
         char **p = (char **)list;
 
         while (*p) {
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 64b1c754b0..55ba5b263a 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -1894,7 +1894,7 @@ GList *ga_command_blacklist_init(GList *blacklist)
         "guest-suspend-hybrid",
         "guest-set-vcpus",
         "guest-get-memory-blocks", "guest-set-memory-blocks",
-        "guest-get-memory-block-size",
+        "guest-get-memory-block-size", "guest-get-memory-block-info",
         NULL};
     char **p = (char **)list_unsupported;
 
-- 
2.17.1


