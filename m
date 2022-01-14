Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DDF48E37D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 06:14:17 +0100 (CET)
Received: from localhost ([::1]:58970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Eul-00005b-TC
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 00:14:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8EqJ-0005k3-8G
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 00:09:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8EqG-0001O5-Eg
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 00:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642136975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s7NMRE3w8ty9ut2y4SuafqvYGwlifTworSCgY/qoCsQ=;
 b=IsuxdxB+MnhaHw30DuTEql79MPeyM71dlIfO0DVesKuHnqkFZU58MOc8yFnuIOdanmjXW6
 5cfYbJS/JzFaJyJd053VN1HJf2Z+0YEwqQHaXtXU5PGbrnrygXu8D99SQFmDBVw6NPyyQq
 NQuH3mDG4A0wI+93p3RkOn7PiF5VaAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-OCFz64Y9N7eaRiZh2wRC5g-1; Fri, 14 Jan 2022 00:09:32 -0500
X-MC-Unique: OCFz64Y9N7eaRiZh2wRC5g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4951C81C9A6;
 Fri, 14 Jan 2022 05:09:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-172.pek2.redhat.com
 [10.72.13.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E055108A9;
 Fri, 14 Jan 2022 05:09:14 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V3 01/13] hw/net/vmxnet3: Log guest-triggerable errors using
 LOG_GUEST_ERROR
Date: Fri, 14 Jan 2022 13:08:57 +0800
Message-Id: <20220114050909.27133-2-jasowang@redhat.com>
In-Reply-To: <20220114050909.27133-1-jasowang@redhat.com>
References: <20220114050909.27133-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Dike <dike199774@qq.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Duhao <504224090@qq.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The "Interrupt Cause" register (VMXNET3_REG_ICR) is read-only.
Write accesses are ignored. Log them with as LOG_GUEST_ERROR
instead of aborting:

  [R +0.239743] writeq 0xe0002031 0x46291a5a55460800
  ERROR:hw/net/vmxnet3.c:1819:vmxnet3_io_bar1_write: code should not be reached
  Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
  (gdb) bt
  #3  0x74c397d3 in __GI_abort () at abort.c:79
  #4  0x76d3cd4c in g_assertion_message (domain=<optimized out>, file=<optimized out>, line=<optimized out>, func=<optimized out>, message=<optimized out>) at ../glib/gtestutils.c:3223
  #5  0x76d9d45f in g_assertion_message_expr
      (domain=0x0, file=0x59fc2e53 "hw/net/vmxnet3.c", line=1819, func=0x59fc11e0 <__func__.vmxnet3_io_bar1_write> "vmxnet3_io_bar1_write", expr=<optimized out>)
      at ../glib/gtestutils.c:3249
  #6  0x57e80a3a in vmxnet3_io_bar1_write (opaque=0x62814100, addr=56, val=70, size=4) at hw/net/vmxnet3.c:1819
  #7  0x58c2d894 in memory_region_write_accessor (mr=0x62816b90, addr=56, value=0x7fff9450, size=4, shift=0, mask=4294967295, attrs=...) at softmmu/memory.c:492
  #8  0x58c2d1d2 in access_with_adjusted_size (addr=56, value=0x7fff9450, size=1, access_size_min=4, access_size_max=4, access_fn=
      0x58c2d290 <memory_region_write_accessor>, mr=0x62816b90, attrs=...) at softmmu/memory.c:554
  #9  0x58c2bae7 in memory_region_dispatch_write (mr=0x62816b90, addr=56, data=70, op=MO_8, attrs=...) at softmmu/memory.c:1504
  #10 0x58bfd034 in flatview_write_continue (fv=0x606000181700, addr=0xe0002038, attrs=..., ptr=0x7fffb9e0, len=1, addr1=56, l=1, mr=0x62816b90)
      at softmmu/physmem.c:2782
  #11 0x58beba00 in flatview_write (fv=0x606000181700, addr=0xe0002031, attrs=..., buf=0x7fffb9e0, len=8) at softmmu/physmem.c:2822
  #12 0x58beb589 in address_space_write (as=0x608000015f20, addr=0xe0002031, attrs=..., buf=0x7fffb9e0, len=8) at softmmu/physmem.c:2914

Reported-by: Dike <dike199774@qq.com>
Reported-by: Duhao <504224090@qq.com>
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2032932
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/vmxnet3.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index f65af4e..0b7acf7 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -1816,7 +1816,9 @@ vmxnet3_io_bar1_write(void *opaque,
     case VMXNET3_REG_ICR:
         VMW_CBPRN("Write BAR1 [VMXNET3_REG_ICR] = %" PRIx64 ", size %d",
                   val, size);
-        g_assert_not_reached();
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: write to read-only register VMXNET3_REG_ICR\n",
+                      TYPE_VMXNET3);
         break;
 
     /* Event Cause Register */
-- 
2.7.4


