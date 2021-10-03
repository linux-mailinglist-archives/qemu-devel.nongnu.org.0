Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C06B4200B2
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 10:14:32 +0200 (CEST)
Received: from localhost ([::1]:37922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwdj-000296-Dy
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 04:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9R-00041y-9z; Sun, 03 Oct 2021 03:43:13 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:37833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9P-0000yK-PP; Sun, 03 Oct 2021 03:43:12 -0400
Received: by mail-ed1-x532.google.com with SMTP id ba1so51824131edb.4;
 Sun, 03 Oct 2021 00:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BgpdyLnyiPwHCME2fmRt2m1yxap5kM3KZz3BIBf/qMo=;
 b=ocxpYwH1lxNTij3aQwGMpgMXBMS+Y6N0bbdd6GJ4Ot5HM/Gjg6+NDU7TtQynLCKjCo
 uO8pQNjNNX0mNCBrzLpxGDrJywpUKAB3TTrjDWVz+2cSwNG8kOiOc+btkEJfCj2PKkaI
 MlrjWreKRRa8WT0GGWKdiApS1K+rkTbgCR10cH7yl/VvLZLFSd1yVY1MUCRuYBDGL/Bx
 DdRy1vxxdwVqPq/EI+8WAwblHVOSZ7+Zmx+Mp+id/t1I+OuWe/49Hhb8dcKKJs1JLRhg
 D/enadQPREa66FUmRBjlHeR58er4tqdjnd3081QxM92D9YL1p7zAX50iwe8M+JYms7OT
 ajHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BgpdyLnyiPwHCME2fmRt2m1yxap5kM3KZz3BIBf/qMo=;
 b=Q9LifEGajoE73de+GqNL7spLHJy7W4zwXgT/6abzgAJwdtbsNXvB5oJIdylI83wQDo
 WPrJo0CWzJwrxDQgosQjnkhKEoUEoxCasIw66hEJqPFOg6Q6r1efACQClpEIn1PGL2YS
 nkjZ7L3W/WHZ8jiYcURpSQlQ0etVgtwOxdrZcUCwaLuPvHQcJ0wPmyqYyoMzZgRTZeul
 XL3zgyWoB1wAtWo170jKSi0E5YjrqJKy0crolmx2zftwZkRTzzF8cfzcoXT+QXZnmnr1
 VVqGsPA38ItFezKpHMhSstu8tM5OgsOtE1krwdjg9O9Nj4gxHhhMvIvXihY9UBoNCxR8
 tAyg==
X-Gm-Message-State: AOAM530pCFbHx4F/YRUS+syLqDWBnRJUqI1r+rmFkGKKbvj930jiaX55
 j7I0NfPQPIT1XLC5CbbXeeSv9r8vGVs=
X-Google-Smtp-Source: ABdhPJxl8QQGHSGdtFiUUmQkNb8bCwfAUCeZBxt9kRoObQHKMFHR2l6Im6KuhYtlTHdW377xuFIMGA==
X-Received: by 2002:a17:906:ce2c:: with SMTP id
 sd12mr8961198ejb.488.1633246989920; 
 Sun, 03 Oct 2021 00:43:09 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/30] virtio-mem-pci: Fix memory leak when creating
 MEMORY_DEVICE_SIZE_CHANGE event
Date: Sun,  3 Oct 2021 09:42:44 +0200
Message-Id: <20211003074250.60869-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-stable@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Apparently, we don't have to duplicate the string.

Fixes: 722a3c783ef4 ("virtio-pci: Send qapi events when the virtio-mem size changes")
Cc: qemu-stable@nongnu.org
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210929162445.64060-2-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/virtio/virtio-mem-pci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/virtio/virtio-mem-pci.c b/hw/virtio/virtio-mem-pci.c
index fa5395cd88..7e384b7397 100644
--- a/hw/virtio/virtio-mem-pci.c
+++ b/hw/virtio/virtio-mem-pci.c
@@ -88,13 +88,8 @@ static void virtio_mem_pci_size_change_notify(Notifier *notifier, void *data)
                                          size_change_notifier);
     DeviceState *dev = DEVICE(pci_mem);
     const uint64_t * const size_p = data;
-    const char *id = NULL;
 
-    if (dev->id) {
-        id = g_strdup(dev->id);
-    }
-
-    qapi_event_send_memory_device_size_change(!!id, id, *size_p);
+    qapi_event_send_memory_device_size_change(!!dev->id, dev->id, *size_p);
 }
 
 static void virtio_mem_pci_class_init(ObjectClass *klass, void *data)
-- 
2.31.1



