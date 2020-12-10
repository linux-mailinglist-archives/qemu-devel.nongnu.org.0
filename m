Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5F12D6459
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 19:03:46 +0100 (CET)
Received: from localhost ([::1]:48216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knQI4-0002J7-N5
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 13:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knQDt-0000v8-0E
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:59:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knQDq-00009x-Os
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607623161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/Ud3KxDqUBdjOZUtEIZXpH5CF1Q02Z/msk2wmjc+8dE=;
 b=XZp4qBLuUvnOLRvaT9KHl8k4tsxgPcUVflavjjiPZBuOR4g+V+RAy01EHyUF5XH13VS9XL
 DPASpibXKxZr95S9F8Cc0SATUss6hMiAEheI5CdRi20kfmZyLwGvunzjI3JzCakYWH6lcs
 AX6eseYnEaIPez+zonAYyFTtuU0vsOM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-E9VGky7GOAyyXLBngR9RGA-1; Thu, 10 Dec 2020 12:59:19 -0500
X-MC-Unique: E9VGky7GOAyyXLBngR9RGA-1
Received: by mail-wm1-f69.google.com with SMTP id s130so1450731wme.0
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Ud3KxDqUBdjOZUtEIZXpH5CF1Q02Z/msk2wmjc+8dE=;
 b=MfNDJyCSMk7RzFOQhdoZgaGNMxvLds3L/rKZB8K0x4y4fdJfI0VxHYLkEh+JB0fvqn
 uSS8EmbXuXzDBrkJR42c6aC9PPX2wN2PlQeZJyrj8Kkr9xRqJaqX1AwAJANoqs2eTpnD
 d+kdnjQ4abnoZnGWPFNXx7PQFAcK3ZM3vlFBm+/2ZJFh/ENyBlefIdK2fx3zdvbSxlLA
 o7P/KFmH3gQN8KXWVL/tX+0wzXt4so3K0uczY4AIkLM4UdzEbRryaIFWhjz3MLXwAq9k
 suoMscmf5VeK8RkCh3b7Kaw5KqnEI+5Y1xNvCrL/hvAr4hWhdF6gUGotVdr9j2iqHKNO
 zGtg==
X-Gm-Message-State: AOAM531yoHSa8oJ2CESJGy6WWPwVeUHqbbqaeBdy1IbtCUkVzDynEpNd
 3av0lUiDt+ZardGYGl44Dnp40V/lrTB59FEoJ0QS0JLEJQfqYjto0Q3vU/l0Hwtq0bJ0XmpS57s
 BY0nrhsELSFHF4swVVbLryLizutKmfrm8lmaB7ndNuu3a5aIYEKqgZJPBNkQZnSkf
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr9265022wmi.75.1607623158525;
 Thu, 10 Dec 2020 09:59:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEQiDzySAPyn/08D+Jwn9LrpXnRXpJUua0gftvYcLqvx4RatZX0RndEb4S2ie3TXWMMIZUgQ==
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr9264989wmi.75.1607623158220;
 Thu, 10 Dec 2020 09:59:18 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id o74sm13298630wme.36.2020.12.10.09.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 09:59:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] virtio: Only display errors if GUEST_ERROR is enabled
Date: Thu, 10 Dec 2020 18:59:16 +0100
Message-Id: <20201210175916.187273-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not display virtio guest errors until the user request it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/virtio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index eff35fab7ce..bde0d31c5d9 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3622,9 +3622,11 @@ void GCC_FMT_ATTR(2, 3) virtio_error(VirtIODevice *vdev, const char *fmt, ...)
 {
     va_list ap;
 
-    va_start(ap, fmt);
-    error_vreport(fmt, ap);
-    va_end(ap);
+    if (qemu_loglevel_mask(LOG_GUEST_ERROR)) {
+        va_start(ap, fmt);
+        error_vreport(fmt, ap);
+        va_end(ap);
+    }
 
     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
         vdev->status = vdev->status | VIRTIO_CONFIG_S_NEEDS_RESET;
-- 
2.26.2


