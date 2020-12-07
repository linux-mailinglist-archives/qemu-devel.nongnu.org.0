Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC942D1CC9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 23:09:07 +0100 (CET)
Received: from localhost ([::1]:55232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmOgs-0001kV-LG
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 17:09:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmOf7-0000r8-Ex
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:07:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmOf5-0000t6-HO
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:07:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607378834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CEGb8dkgdsrer9l2221VVKE5XzqXxhTtFcOV5s3dobE=;
 b=DtBCxPsDhVQ3EKRbxpeOVUjq+E/828GMr+LqLk7RilQiKVFos5gnj4nlnEWYR1iF1xANRH
 UkBlM36kxu3chCUanR3ykbqE1FeJyCJYpJZHevdTHBvmM8P+9hiHG4f/9ZOnh3gwlsO+mi
 vmPFePYJfO8NFzY6XYtArRz1pr7B1T8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-hkMIdIiPPDC-9GGpYOP5iw-1; Mon, 07 Dec 2020 17:07:13 -0500
X-MC-Unique: hkMIdIiPPDC-9GGpYOP5iw-1
Received: by mail-ej1-f72.google.com with SMTP id 2so4436672ejv.4
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 14:07:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CEGb8dkgdsrer9l2221VVKE5XzqXxhTtFcOV5s3dobE=;
 b=bfsDY7xUQPOPtCBQ1ZhNrOTHaObgC+BEwBbZpHk4+5mimCMgUAD49wZabe1+Er1aj/
 P/O+lMdA88rBWJ7kyN7yUUuq6/NCxaeGJS4/nDp7YfVczPr9Nnpm5hTFB7IXJrwaNsz8
 C7D/1gvs7qobaMDGXMo0zKJZDZFpgM02SQv8OTbl8g/tGbLu7uD+PSdKPGwCDC2ikb9V
 xq8zVs0kp93PUOSEnYYbUy2YGUW1HuJ2bctRPICQwBrqF/zoByEntTWXOpLO1XmEmUkh
 Va+f12TqYaZ7dt5WoMvat1zvb8Zk81or5wQQ4d+6wiZTHYfjh5KY2560MT3SOdVwtP3o
 ppKg==
X-Gm-Message-State: AOAM530fth50SPI0Km9cbJvjV43xgvAnxdyK2lXmqH/MpZO2/R2+lPVk
 CKn98WMoAm6sylUXFSsKqlI39I2kzirOzaNtp3Ubo2z5wsP87k8POpI1LMZQL2T4iKGV0akt/yT
 FeRA7MHuS33u3T9Ff+lTdeRt0CflMWYcTv57ouwnd9VdbHiqJLA5dTuvxPdI3N55/
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr21281338eja.250.1607378831830; 
 Mon, 07 Dec 2020 14:07:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzepdFQs89CDSfxtS0x7cJmXJ5OR6CeX4aVVn5E1+QoDxqF45qkNMtaaSWjoBvWGYt/9xXlKQ==
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr21281327eja.250.1607378831652; 
 Mon, 07 Dec 2020 14:07:11 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b11sm10754799edk.15.2020.12.07.14.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 14:07:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/core: Restrict 'fw-path-provider.c' to system mode
 emulation
Date: Mon,  7 Dec 2020 23:07:09 +0100
Message-Id: <20201207220709.4017938-1-philmd@redhat.com>
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
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fw-path-provider.c is only consumed by qdev-fw.c, which itself
is in softmmu_ss[], so we can restrict fw-path-provider.c to
softmmu too.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: Fix author email.
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


