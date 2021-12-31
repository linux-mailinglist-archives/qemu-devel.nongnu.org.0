Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D424823D6
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 12:55:21 +0100 (CET)
Received: from localhost ([::1]:40198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3GVE-0001Li-S0
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 06:55:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPM-0002Zc-25
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPI-0000Ga-59
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640951350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mzp4W/VQyMxGd5CvQVuwL031robPDmwL00FTI5wH9/Y=;
 b=ijrxFiQCS49Tjcq8K1XAFKzaY8nTN5fLxufnFj/E04Q9WHl+b3raDOjd0UoVNaR5KwirTn
 KdplsMApr0xFis1cZv7uMRHf48TBdJIWUUHYV769Th8SN8qgzkixkzJ4IhI5FzBtnANjy+
 eNc9IVN1puPZ0ZhTU15VzksbTEWvecU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-McktxPFfM1uoBe70K34K0Q-1; Fri, 31 Dec 2021 06:49:09 -0500
X-MC-Unique: McktxPFfM1uoBe70K34K0Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 v6-20020adfa1c6000000b001a26d0c3e32so7426097wrv.14
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 03:49:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mzp4W/VQyMxGd5CvQVuwL031robPDmwL00FTI5wH9/Y=;
 b=wrxKqfNwMkwFfYAeWFND9yFuNkdFqns8Q4COz40wjf2rJKJRdagQfIysMK2OwQrreU
 3XE5g5cnaZKTr4HaBrI8Xwflp5uoY691GXvX/VT8fyZkL8BneCgu0Xu7VdoxLqohUHqq
 YsET7RAoqCZPw7tqQyWu9bp0aP1STXGVs+QsBP5sozOawbEDAWee393XUSItm20IJytY
 8tCbLSyyYfIjfJ+UHLC2rKXdDUACeiuzYBZfjjJzzqGGJcSvF3/AAGqL1rpqbrGBX5gS
 vCt5JEJ1r3vYBJjTnDcz040tEVh8neFFmtYovu1ON39c+TuF2tj+QTY+6HCz2T3ySrSC
 vJdg==
X-Gm-Message-State: AOAM533N3q5VYjY/yvNiRsy/hg33XJx2WEyQesIPom65Ta97Copw5GnZ
 6B1s1j54HrRH3ZmJbOIJF5Y7TsdzW45NchNUCk9iJzml0UFODv/T2wytyRSuInp6aP1AanTqOiB
 KJtvJiegF/wQ3F8tCT3qcSeMrSRKpY5gvUsWXkvcm/MMKgGp2iYmFgbTjUevrb4hm
X-Received: by 2002:adf:9c85:: with SMTP id d5mr28584587wre.374.1640951348053; 
 Fri, 31 Dec 2021 03:49:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOSGEuDRp2HNybF3MVJgPfgxFxNFANVmmtSwHonmlbykW9rRWMFORYSBDtBN1+3dkgCGjZ6Q==
X-Received: by 2002:adf:9c85:: with SMTP id d5mr28584572wre.374.1640951347875; 
 Fri, 31 Dec 2021 03:49:07 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id l4sm26395582wrm.62.2021.12.31.03.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 03:49:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] hw/nvram: Restrict stub to sysemu and tools
Date: Fri, 31 Dec 2021 12:48:54 +0100
Message-Id: <20211231114901.976937-2-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231114901.976937-1-philmd@redhat.com>
References: <20211231114901.976937-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

User-mode emulation doesn't need the fw_cfg stub.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/nvram/meson.build | 6 ++++--
 stubs/meson.build    | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
index 202a5466e63..f5ee9f6b88c 100644
--- a/hw/nvram/meson.build
+++ b/hw/nvram/meson.build
@@ -1,5 +1,7 @@
-# QOM interfaces must be available anytime QOM is used.
-qom_ss.add(files('fw_cfg-interface.c'))
+if have_system or have_tools
+  # QOM interfaces must be available anytime QOM is used.
+  qom_ss.add(files('fw_cfg-interface.c'))
+endif
 
 softmmu_ss.add(files('fw_cfg.c'))
 softmmu_ss.add(when: 'CONFIG_CHRP_NVRAM', if_true: files('chrp_nvram.c'))
diff --git a/stubs/meson.build b/stubs/meson.build
index 71469c1d50a..363f6fa785d 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -11,7 +11,6 @@
 stub_ss.add(files('dump.c'))
 stub_ss.add(files('error-printf.c'))
 stub_ss.add(files('fdset.c'))
-stub_ss.add(files('fw_cfg.c'))
 stub_ss.add(files('gdbstub.c'))
 stub_ss.add(files('get-vm-name.c'))
 if linux_io_uring.found()
@@ -51,6 +50,7 @@
   stub_ss.add(files('replay-tools.c'))
 endif
 if have_system
+  stub_ss.add(files('fw_cfg.c'))
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('usb-dev-stub.c'))
   stub_ss.add(files('xen-hw-stub.c'))
-- 
2.33.1


