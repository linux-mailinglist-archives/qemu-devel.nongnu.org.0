Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F5713421E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 13:47:17 +0100 (CET)
Received: from localhost ([::1]:42978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipAjz-0005dj-SJ
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 07:47:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ipAWk-0004KN-8F
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:33:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ipAWj-0004Zt-71
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:33:34 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45732)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ipAWj-0004Z9-14
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:33:33 -0500
Received: by mail-wr1-x429.google.com with SMTP id j42so3125898wrj.12
 for <qemu-devel@nongnu.org>; Wed, 08 Jan 2020 04:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mI1xmok6rfPrAyTZSFPcrVMlse43VRmH+csJauDDLHs=;
 b=Sfy3xcbvOcQXU/z5zF64yZ2b4rRks64IvhiYuQsKIzJCofOXbOHVWQd110QY9pjr5o
 2eA66BnciB90udT0GriFGbvXYcv42oe2s4IhKJf2zJznTpuV+8Dv9mKcEc2fZaFMKLbU
 jRgcrI8xKh1y1k5U4kKEJ8C8HlQBKjajMjxTfAKFmbvkN7IgnWakxa8rVXO0a6FPAHD0
 AclydlJkWKdnuncov5LRf0Zz79sF5UFfgmlT7+qjFDpNfPHo3vFeUos9tvPvFclK/iiy
 m4NS/lSeqgSzUCwRxoD7LIxFtiCWlz77XF6/TOpF6bVQWsvcCxzlwGJ+6/FeKuxNoyW1
 EaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mI1xmok6rfPrAyTZSFPcrVMlse43VRmH+csJauDDLHs=;
 b=R/ZhI7leCb4qFAzhn//mo3cFEIXiWxB0ZQo4h6iF3BJ6ET064r0dqwfYTfx/XAfxu1
 A7NE1AI4xgVXFEazItq2DnRmghtfC4l3YRjSW1s+EOu0Qth0TxFmw2LHGo3imXd8DnNe
 YgQ9scKzafsnb7Ih/AIiFs6nOLrn5wZgP5sDupaJP5LBzg4t5+ouIWUhYDRaupQCSFwI
 m+MhF1/j37VGIOkLOGNLZMZP5//IBh/jdO5tNamZH9RuHHqtQV3is6LzBGd1w9BxMhOw
 /UtNjjPMA/feZWZeCgfiqZm6sNuk01jizZlLQxx1kxYLcBa26W2dO46PPbegBbQ3Ztld
 jJIA==
X-Gm-Message-State: APjAAAUSocNoRbvxmBWHdHVOKOjyWDukdB/YKXAWwgU/QKGd6zJ7BcOf
 XH0oN4hybyKeVKhXMKwSWkzKJyV3
X-Google-Smtp-Source: APXvYqwxUp7lFrRTHyNNXZwZY/J/1Pnih+U9pY1B29r48Ud8KhkN/CV1C5CWDZHLbDqRyxnGT9rHnA==
X-Received: by 2002:a5d:51cc:: with SMTP id n12mr4444686wrv.177.1578486811883; 
 Wed, 08 Jan 2020 04:33:31 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id o4sm4037750wrw.97.2020.01.08.04.33.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jan 2020 04:33:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/38] vhost-user-blk: Explicit we ignore few QEMUChrEvent in
 IOEventHandler
Date: Wed,  8 Jan 2020 13:32:49 +0100
Message-Id: <1578486775-52247-33-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578486775-52247-1-git-send-email-pbonzini@redhat.com>
References: <1578486775-52247-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::429
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

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit all the events ignored by this frontend, to silent the
following GCC warning:

    CC      s390x-softmmu/hw/block/vhost-user-blk.o
  hw/block/vhost-user-blk.c: In function ‘vhost_user_blk_event’:
  hw/block/vhost-user-blk.c:370:5: error: enumeration value ‘CHR_EVENT_BREAK’ not handled in switch [-Werror=switch]
    370 |     switch (event) {
        |     ^~~~~~
  hw/block/vhost-user-blk.c:370:5: error: enumeration value ‘CHR_EVENT_MUX_IN’ not handled in switch [-Werror=switch]
  hw/block/vhost-user-blk.c:370:5: error: enumeration value ‘CHR_EVENT_MUX_OUT’ not handled in switch [-Werror=switch]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20191218172009.8868-10-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/block/vhost-user-blk.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 63da9bb..ccaf2ad 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -383,6 +383,11 @@ static void vhost_user_blk_event(void *opaque, int event)
             s->watch = 0;
         }
         break;
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
     }
 }
 
-- 
1.8.3.1



