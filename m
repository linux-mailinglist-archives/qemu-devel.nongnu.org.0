Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7042216C171
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 13:54:23 +0100 (CET)
Received: from localhost ([::1]:54886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6ZjC-0000hS-Ep
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 07:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50114)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6YlN-000222-Ky
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:52:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6YlM-0001sq-Lc
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:52:33 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51094)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1j6YlM-0001o3-Es
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:52:32 -0500
Received: by mail-wm1-x342.google.com with SMTP id a5so2687321wmb.0
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 03:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EwfVwWMRQy3bKwan4racLo4YHTVH0rGul3sJeJywNRc=;
 b=fmaou4/LDMQByqwePcjtxrgZClyk9zW3ZMIgiTKA2X3MfyVkBRG30//pYcePAX05Xc
 G6cYbLPQgohWb01iuMNKapBkcaQXvC9OI8aHMbA9SPNX5pewLOr0v8YDAVXGYIbdnY9O
 hhlD/D4wFNG8ZYtRZgynY75p336C74lbwyBlA6ro33hf73NBMNzgAFR+G8DKMzRarCH0
 bMocyxqBKP4qR8qhA5ClExerv3wk7m2dFGUd6wpIQsthezJAyXAKv5Omq2/wIfdAk/jL
 qKf2fSGR77eJ1rCcm0EHalwsXHtlRPQl+cHpy+SfrzUf7W9qhNVaWUSkDyUmBgu28d+g
 ez0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EwfVwWMRQy3bKwan4racLo4YHTVH0rGul3sJeJywNRc=;
 b=sSBOJiY7pTc6c8CaODxNDe8dw/KRUdy40SsoF+8vR8CTLSxJHHdM/Rgdt4gkWMFJNW
 eG/j6cmZtXYeJUk9tmhX+6kwKJTMHUFfELOljYwmz+rjmvvVJOVdH+Ors5bK02TeQ3rv
 5CL86SfeIxoc5BX1t3E5JYWyDF9yHTTaARtQucai1vJqjyvO/07GIqFLLO8b5epvXNys
 KSm9G3FWOqE4KZi3uUSiq3R50J4Lvxw6YeIsfsacCV0hFU9QPnKZTV3fxU4wINZ3BRTm
 JtD0u5/WxGz5c5mjHMTsv9JTwOQ0uIQ7XzhzvG5luBZeJJ5+CDnzp+KdO5Dzc1lsTkvJ
 djZg==
X-Gm-Message-State: APjAAAVBlhppET2w+/6CoXZlA1oPfZfb/iWd/86Qymw+ntpWEiv3R8UT
 WVPT9p206DSCe3y0cop+LJWblYKu
X-Google-Smtp-Source: APXvYqxA0Te+YGuXBP01VemcxXF0YNnRJe+Wxtr02iS/KnV9qXz0bjotoA8cMgVTgqg2ZYPqAl7L1Q==
X-Received: by 2002:a1c:3b09:: with SMTP id i9mr4865760wma.31.1582631550788;
 Tue, 25 Feb 2020 03:52:30 -0800 (PST)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id b67sm3922326wmc.38.2020.02.25.03.52.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 03:52:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 091/136] hw/virtio: Let virtqueue_map_iovec() use a boolean
 'is_write' argument
Date: Tue, 25 Feb 2020 12:50:21 +0100
Message-Id: <1582631466-13880-91-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
References: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The 'is_write' argument is either 0 or 1.
Convert it to a boolean type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/virtio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 2c5410e..9d06dbe 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1293,7 +1293,7 @@ static void virtqueue_undo_map_desc(unsigned int out_num, unsigned int in_num,
 
 static void virtqueue_map_iovec(VirtIODevice *vdev, struct iovec *sg,
                                 hwaddr *addr, unsigned int num_sg,
-                                int is_write)
+                                bool is_write)
 {
     unsigned int i;
     hwaddr len;
@@ -1317,8 +1317,9 @@ static void virtqueue_map_iovec(VirtIODevice *vdev, struct iovec *sg,
 
 void virtqueue_map(VirtIODevice *vdev, VirtQueueElement *elem)
 {
-    virtqueue_map_iovec(vdev, elem->in_sg, elem->in_addr, elem->in_num, 1);
-    virtqueue_map_iovec(vdev, elem->out_sg, elem->out_addr, elem->out_num, 0);
+    virtqueue_map_iovec(vdev, elem->in_sg, elem->in_addr, elem->in_num, true);
+    virtqueue_map_iovec(vdev, elem->out_sg, elem->out_addr, elem->out_num,
+                                                                        false);
 }
 
 static void *virtqueue_alloc_element(size_t sz, unsigned out_num, unsigned in_num)
-- 
1.8.3.1



