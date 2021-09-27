Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC4C419AB2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:09:58 +0200 (CEST)
Received: from localhost ([::1]:36826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUu8b-0003z6-Vh
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu1Z-0002Bi-K2
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:02:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu1V-0002fC-6l
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ch+SNQ3QN3dmBSgz+yeGRI826NTaBq1nvpxL9SnQaJM=;
 b=dz89ugWAdbtxBpR0+IbRFYxrwCRYCXtGPiTCSESzHBqFRICfj2hx1ZT2BZx0F86K9fjiPT
 BwP3hwRa2WAEymfu4Mclzxa2FRtG0nRB+cOFqb/v6iDBGL4+L7DZxLU+PuA2b016ny9ILw
 /rV37z0dwx0BtVwz87w1kXyQgoB50BQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-N3GmKZKXMpOxUvSWHw8A1g-1; Mon, 27 Sep 2021 13:02:34 -0400
X-MC-Unique: N3GmKZKXMpOxUvSWHw8A1g-1
Received: by mail-wm1-f72.google.com with SMTP id
 o28-20020a05600c511c00b0030cdce826f9so180055wms.5
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ch+SNQ3QN3dmBSgz+yeGRI826NTaBq1nvpxL9SnQaJM=;
 b=qIhtEsa7n+CvJhjJNcflkC33APTvwdiPGZUef9YmTo+0Kx8N2IHagMTmeQ73uQlKCU
 8+0ZUIxtdC1mRvfz/DOGel/dX5tkAnijCimQCKDBZ96rrY8skQY44lyKx345Lxiw8oOb
 yAT/MlZdIulUO0+3x9w3PHp9kb0YiGNfKH3pA5h2Q1kwu8ChjtxqORNLTPJihRQFVMFK
 k9dCHh5bEFy+SqBLP887+19gS0NRXweYFhYVdEQCIFEoK+cTcEXj/OrUwS2Pq5qSxXIp
 yxn1wVia3EuHrKtIJnyHm2X0PtQVY7OfKSPQj6RVKPiFSaL9/B47nHg86UVccigcAN6Q
 k6Tw==
X-Gm-Message-State: AOAM533E7puYEafWaPAoi2oQnqPgmypY2Gdspv+MVvBtyBE176MjbRjW
 QbHcko5xkWu8VGWTXP2OV7yIowNHtMD/NbDEhb5c8oBFfaB/4JuGRGBNj0JisBhPE3c+B1XiO/h
 xhV1tMW8v3IPZAChEXwi4Norm1Pws39BDqmMy/NVrH0Ux2l1WiFiI9FNn4S1ErMWm
X-Received: by 2002:a05:600c:20c:: with SMTP id 12mr137695wmi.90.1632762153449; 
 Mon, 27 Sep 2021 10:02:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuNBC5ahw/Sj3K3qnX/Y8jxwlFxs/GwkCThGqE+wNUqjjf3MUHLmPuXyM7NJ5/nVEc7tr+Gw==
X-Received: by 2002:a05:600c:20c:: with SMTP id 12mr137662wmi.90.1632762153112; 
 Mon, 27 Sep 2021 10:02:33 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id i67sm69008wmi.41.2021.09.27.10.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:02:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/21] tests/acceptance: add replay kernel test for s390x
Date: Mon, 27 Sep 2021 19:02:07 +0200
Message-Id: <20210927170227.2014482-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927170227.2014482-1-philmd@redhat.com>
References: <20210927170227.2014482-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch adds record/replay test which boots Linux
kernel on s390x platform. The test uses kernel binaries
taken from boot_linux_console test.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
[PMD: Drop default '-smp 1' as suggested by Thomas]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <162737551785.1735673.6775108576116333386.stgit@pasha-ThinkPad-X280>
---
 tests/acceptance/replay_kernel.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index bb32b312402..06a09d66791 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -207,6 +207,21 @@ def test_arm_cubieboard_initrd(self):
                           '-initrd', initrd_path,
                           '-no-reboot'))
 
+    def test_s390x_s390_ccw_virtio(self):
+        """
+        :avocado: tags=arch:s390x
+        :avocado: tags=machine:s390-ccw-virtio
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive'
+                      '/fedora-secondary/releases/29/Everything/s390x/os/images'
+                      '/kernel.img')
+        kernel_hash = 'e8e8439103ef8053418ef062644ffd46a7919313'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=sclp0'
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=9)
+
     def test_ppc64_pseries(self):
         """
         :avocado: tags=arch:ppc64
-- 
2.31.1


