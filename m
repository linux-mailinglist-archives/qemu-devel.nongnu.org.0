Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE543FFF3F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:34:01 +0200 (CEST)
Received: from localhost ([::1]:35828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7SK-0002IE-OC
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74O-0000XO-DX
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74L-0001uC-DI
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oWlYVXKgef7rt8tFGoGOU02/9c4fFsb6XOBLj2EPez0=;
 b=S9iy7IFmkrDOr2aQH+yXD8EUGJo7AkU78rqyKiliCq2Un5E7rxrZFd7AHhLFsIeTCT1O68
 KuCXPthuyD4p9pCcs4Kzvn+GHkeDi3T7JXwfyCwyCy7GyWPMF3w2ePnG1Ut0TgapNxsefq
 /t2QlVWxL9ygl+uDbStZGtPONw5e5EA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-Zd7oiGPlOkSJor0WpQSUSA-1; Fri, 03 Sep 2021 07:09:11 -0400
X-MC-Unique: Zd7oiGPlOkSJor0WpQSUSA-1
Received: by mail-wr1-f71.google.com with SMTP id
 p10-20020adfce0a000000b001572d05c970so1457964wrn.21
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oWlYVXKgef7rt8tFGoGOU02/9c4fFsb6XOBLj2EPez0=;
 b=oGPpvPNNRKc+ZYWxSWKGbvqPbGEDia6znUsrk+aS37qxp7BNkXUuMGLkfmm9AF8yJC
 avHJ2ALbxEkUZd1OLQMs7sd/4pt3kJP3iFX5lOXfc07uXPnYltixBsuTkeV8SpPtJvAT
 BFzX/kRWMEkXCoQzYE7I+LC2nCYC+QR13dGU9B43b2zXEK2MjUlToKvFGo+lXYu2az2B
 Ffvpj6PyVNamTC8Mg9Tch4qMlnPzFweGPDSatcAo2ngbNiBLcANiZbd7iDA6W/PVcBSk
 IY9tfUsMUiWRWPehBacG9hiTCHIqT++ShvC9OGDkfcPgRxVb9MqLM/bAHdkfnDWjoJEL
 Ctyw==
X-Gm-Message-State: AOAM533+1QEknbbiXGRNkXc/+STmI+O1PRYYm2QHcnhqP36toLpu0wtu
 2tKQMn3B3EBDGs0xmtZmJL0aQyKETkKtkWd01nbnWeOzL2R6mI3M3F1z7dAdLmrwLHlY1q6g82w
 EpUokDQgMFgfvjx+nInDsF2maTLKmBc8k5XnV0KW+MvPNWxL3X3ppaZXQ5cmGlxvH
X-Received: by 2002:adf:fb44:: with SMTP id c4mr3357071wrs.179.1630667350293; 
 Fri, 03 Sep 2021 04:09:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz04LeqfAek5qhgfGuBb6P5Xc3NkLACwF2mysEtZwYjLBQ5+2iNJmq5HKQGBR6hLi9iuqmVyA==
X-Received: by 2002:adf:fb44:: with SMTP id c4mr3356996wrs.179.1630667349988; 
 Fri, 03 Sep 2021 04:09:09 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 o21sm4479970wms.32.2021.09.03.04.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:09:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 22/28] linux-user: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:56 +0200
Message-Id: <20210903110702.588291-23-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
do_open_by_handle_at() doesn't check:

    size + sizeof(struct file_handle) < 4GiB
---
 linux-user/syscall.c | 2 +-
 linux-user/uaccess.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ccd3892b2df..e127927f0b9 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7665,7 +7665,7 @@ static abi_long do_open_by_handle_at(abi_long mount_fd, abi_long handle,
         return -TARGET_EFAULT;
     }
 
-    fh = g_memdup(target_fh, total_size);
+    fh = g_memdup2_qemu(target_fh, total_size);
     fh->handle_bytes = size;
     fh->handle_type = tswap32(target_fh->handle_type);
 
diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
index 6a5b029607c..80992e2e233 100644
--- a/linux-user/uaccess.c
+++ b/linux-user/uaccess.c
@@ -15,7 +15,7 @@ void *lock_user(int type, abi_ulong guest_addr, ssize_t len, bool copy)
     host_addr = g2h_untagged(guest_addr);
 #ifdef DEBUG_REMAP
     if (copy) {
-        host_addr = g_memdup(host_addr, len);
+        host_addr = g_memdup2_qemu(host_addr, len);
     } else {
         host_addr = g_malloc0(len);
     }
-- 
2.31.1


