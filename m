Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7FD2D1CC8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 23:08:40 +0100 (CET)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmOgN-00018B-Bf
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 17:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmOe4-0008RT-74
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:06:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmOdx-0000WQ-Lr
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:06:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607378764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tHExCo8FT4JkEs/tYUyNAleIQMJJzZEYO1q/uyt75X0=;
 b=HvkS2M7wHXRqdfzvPPG4UsjJWr52+Sr3Q4xuF8bq9o2VBmSMJbHQk/ofYonwkadH+2mTCK
 vMQEX7sVWUhXSrwqGzkjpdzpwRHrBfQwRvMUTDvJG/pfByyxgqzpsc8ivftV43O75HaQEb
 s4m8LGX+MyOP8A58AbejOvo6Nxljsro=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-YLdakG9OPjGZ5kDCoXGSFQ-1; Mon, 07 Dec 2020 17:06:02 -0500
X-MC-Unique: YLdakG9OPjGZ5kDCoXGSFQ-1
Received: by mail-ed1-f69.google.com with SMTP id h5so6517866edq.3
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 14:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tHExCo8FT4JkEs/tYUyNAleIQMJJzZEYO1q/uyt75X0=;
 b=ImQWW+7lKRM9x7Bde6fXcCUZRz3LXrlzUNeg7d4NhjBcSsgLPDCctdwanetJI/o9i1
 SoPBclcRiSdtP1hMURIQ9dMF2t02KAOPwk7o5q3ElSj0j9c1J9ReyTHIyp3hdeQn5JUq
 lHB0kYE9une9THnIztgAQ22MZZMVb5JyCY+kFxQifEJUFCDUd6mdYXCC5Cuzvi2u+Jia
 f5ZwmmNCPyZjE5A4xQmclXH/jUE9J9/WXnCad87X3vTVojtWEOQqJE2qJxxdKqMZxjD7
 qTjQ/5XtNT6Uusj5cCI3Na/+OFlgHS2FYmAke7nPnRZ8flLAqqbb1uoHUkkpJhAeKKkJ
 BIEQ==
X-Gm-Message-State: AOAM533NDDbP61JTsb4zlqiRW9V/9A1DG6nvouCSITi8YJ+Oc50lsIP1
 ZqrueVWQ5HmDyV4WR9HUI4NsWs11P/RWkIl4+v6iJbpb2FwtspB8/lxQk5JCoaOIu9n9EFe7Z9I
 4g2EHSV/g0Vb1QHu/WmFF8oZzi/waVm121Xe9rbb9exVdE/AVGux0I7TtoZ2ZLzPA
X-Received: by 2002:a17:906:f0d0:: with SMTP id
 dk16mr7423414ejb.144.1607378761099; 
 Mon, 07 Dec 2020 14:06:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+4wrGLEGfXv/a7NrYDYnliwRmzqYZhFMwZ1f8tjblX8aaEwyJI4WYYzse7VmbUChFcpIG7g==
X-Received: by 2002:a17:906:f0d0:: with SMTP id
 dk16mr7423393ejb.144.1607378760875; 
 Mon, 07 Dec 2020 14:06:00 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id d1sm13525470eje.82.2020.12.07.14.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 14:06:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/core: Restrict 'fw-path-provider.c' to system mode
 emulation
Date: Mon,  7 Dec 2020 23:05:58 +0100
Message-Id: <20201207220558.4017223-1-philmd@redhat.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

fw-path-provider.c is only consumed by qdev-fw.c, which itself
is in softmmu_ss[], so we can restrict fw-path-provider.c to
softmmu too.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/core/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/meson.build b/hw/core/meson.build
index 4a744f3b5e7..032576f5717 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -1,7 +1,6 @@
 # core qdev-related obj files, also used by *-user and unit tests
 hwcore_files = files(
   'bus.c',
-  'fw-path-provider.c',
   'hotplug.c',
   'qdev-properties.c',
   'qdev.c',
@@ -25,6 +24,7 @@
 common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
 
 softmmu_ss.add(files(
+  'fw-path-provider.c',
   'loader.c',
   'machine-hmp-cmds.c',
   'machine.c',
-- 
2.26.2


