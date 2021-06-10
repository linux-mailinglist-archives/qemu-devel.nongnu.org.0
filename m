Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA2A3A24C6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:51:36 +0200 (CEST)
Received: from localhost ([::1]:39716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrEXP-0007Ad-OY
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESP-0007fr-SP
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESN-0005Iv-Cg
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623307582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nY3qEuS9AxbSdkAg7h/9CaXvosetNidvdNCAZ2K6Tak=;
 b=BAhDs69XHDWlbBKcPRG8IZgvtgUHGEis6PjTHoWm2vghQ5V9QvV+ja3rPr5VZpk4vmMViK
 6keHGQ8OugDGlvOw6RBtm6+ZoEDZ0JGCcmPqOyaLjkd4/0YlTOQhh87K2e5QqHHaYgmcF1
 WtS5e2bwViDDNA9z+2Uh5kIrDxXqTno=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-S74Z4pHhPZ25Xgl_lJr5oA-1; Thu, 10 Jun 2021 02:46:21 -0400
X-MC-Unique: S74Z4pHhPZ25Xgl_lJr5oA-1
Received: by mail-wr1-f69.google.com with SMTP id
 m27-20020a056000025bb0290114d19822edso409590wrz.21
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 23:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nY3qEuS9AxbSdkAg7h/9CaXvosetNidvdNCAZ2K6Tak=;
 b=BNaZypW5+Um2WU35ZJ+262NYrqiZFEgquwm1HFCrbLWLY36QGKcFzJH+wHlUAQhRKi
 UpOYyoaKHf1NY4fkpQotQ1JaBHwP2Qt808cJicGbZ/Tx/9jXnKd3f0M+kj455PYLxBzS
 qpClgU5arzbqeD8b8Bp+rwLU7RJzhkiYBIcNj4/lVb9bJTdcGJi6lXrLEZRabiHRosr0
 8ubqb110MIBb6koHmVFB0NkTXjjUaym6hQZOQxWloSf3kLStDy9SZ4/Ys2KqCfx8bGlU
 JjcZCXc+d0/KOYlcJTWe2IVzsNEkkijeu8RLJOj+MnyoiDHiwdJSt2wzHoqFF7z2exy+
 dT2w==
X-Gm-Message-State: AOAM531+hRKiG4aYhgnIkXV6/nP0Xyy+DpOwyVFWRhE75ZPgFnHbig4H
 l0+q1YnaoV/drEhBIJmYE4u6i+/UCBx/l8fiFla/gqoIo8m8mf6NHbFtcmHgGqb4BOgmJ3KgJTx
 1Mf2e6wRJuiY7jDGJ9HLKeV+u/Epuxa64UWurR/hY+z5ZincyD0+VbOkKqvArJYUJ
X-Received: by 2002:a5d:68ca:: with SMTP id p10mr3508512wrw.65.1623307580350; 
 Wed, 09 Jun 2021 23:46:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrv9krf1natY0ufeAb5MkcR/iVnZ1zGJbOfoN3joO/iW/L3yCablR2KaZkqOiAWFO9zxPG4A==
X-Received: by 2002:a5d:68ca:: with SMTP id p10mr3508489wrw.65.1623307580167; 
 Wed, 09 Jun 2021 23:46:20 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id u16sm2413575wru.56.2021.06.09.23.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 23:46:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] target/i386/sev_i386.h: Remove unused headers
Date: Thu, 10 Jun 2021 08:45:50 +0200
Message-Id: <20210610064556.1421620-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610064556.1421620-1-philmd@redhat.com>
References: <20210610064556.1421620-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Declarations don't require these headers, remove them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev_i386.h | 4 ----
 target/i386/sev-stub.c | 1 +
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index ae6d8404787..f4223f1febf 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -14,11 +14,7 @@
 #ifndef QEMU_SEV_I386_H
 #define QEMU_SEV_I386_H
 
-#include "qom/object.h"
-#include "qapi/error.h"
-#include "sysemu/kvm.h"
 #include "sysemu/sev.h"
-#include "qemu/error-report.h"
 #include "qapi/qapi-types-misc-target.h"
 
 #define SEV_POLICY_NODBG        0x1
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index 0227cb51778..d91c2ece784 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "sev_i386.h"
 
 SevInfo *sev_get_info(void)
-- 
2.31.1


