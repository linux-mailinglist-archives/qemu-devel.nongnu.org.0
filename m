Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037A4475BAF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:18:17 +0100 (CET)
Received: from localhost ([::1]:32868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxW2p-0006Qg-PP
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:18:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxVZ3-0002Yr-ES
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:47:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxVZ0-0006yA-Fm
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639579644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h46pkJxra3dpp9yKy0ujvp4BfAI+EdRIzO5mZ3dBy9w=;
 b=Lx1FIrxciDHf7CwD37lXq3BmcZ1jXnAHwE96T8x8FKiJec1mFHRKtp06+ENQ0xKb5v9C7F
 pAgbMYmhxNlfYqtJ0ddVuQWx/ceAOm+gHz9zFW8u7FrEWzxBgKfWnivxAjgVTU++CipLqV
 meVgalzAzzFhFp0jzHOL8OTVvlqFzqg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-dWJY5F66Pt2F7gx7PnalHQ-1; Wed, 15 Dec 2021 09:47:22 -0500
X-MC-Unique: dWJY5F66Pt2F7gx7PnalHQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n16-20020a05600c3b9000b003331973fdbbso9116932wms.0
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 06:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h46pkJxra3dpp9yKy0ujvp4BfAI+EdRIzO5mZ3dBy9w=;
 b=rv9czHe/jze2JVrMYUK1Tg9U2Mhs2M9qc1ElNbecq6Sp0vxtt1V8XbC9ix8Lj6gMVA
 Hhmk7MAyAZfu5ml6CLiBjneXcJyF4LDHAXb8jvn7S5lB8XYN82cP2QbcuFpt1BMpCI3t
 DHvgBhy54lfBuxBXQg8pTMTSdz2kyO3UMvNfHwvuppocrckVl0f1A+EPEbkfhvfTUpeR
 lMwaVdQA7QIPrVfuo0JdpzaNbNN7ck3R0ZSS63cXtScjxY4XWHI9KeYCwnXEsHzuHfVw
 9gaETR7+15H5fMU5MTF1PP6UwPgyDhpMD+2rcho9ND5isPgPOPenx8j7XdK7huCl1tsN
 qCdg==
X-Gm-Message-State: AOAM530uN76C9N0BHdt0E0GjKItVbV0e8QBY+lXAvUMxweZSRBc/nVNd
 V1AMbeZ+X5Dt9j0Gcbr2iUVfS1Cl2BkxhhTyRZZOyuaKhNv9JM6kQ83HcYNnfLYbiDJHr+bQPq6
 tsR5QwtH0HOXr17jCOtWzX+ndA0h/k6ZLzrH84dVa/PrhK3BMr1sOiSiYNaTLZWs/
X-Received: by 2002:a05:600c:34d6:: with SMTP id
 d22mr108478wmq.160.1639579640691; 
 Wed, 15 Dec 2021 06:47:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyLm09/eHbWzL0hYKYGXZjRHUvBMU3DKHB96PU6DucQIFXAhVmSSquQq30W8089K2xn7QcAg==
X-Received: by 2002:a05:600c:34d6:: with SMTP id
 d22mr108444wmq.160.1639579640326; 
 Wed, 15 Dec 2021 06:47:20 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id v8sm2145581wrc.114.2021.12.15.06.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 06:47:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/net/vmxnet3: Log guest-triggerable errors using
 LOG_GUEST_ERROR
Date: Wed, 15 Dec 2021 15:47:18 +0100
Message-Id: <20211215144718.311979-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Duhao <504224090@qq.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 hw/net/vmxnet3.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index f65af4e9ef2..0b7acf7f895 100644
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
2.33.1


