Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D660E419A9E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:09:06 +0200 (CEST)
Received: from localhost ([::1]:34678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUu7l-0002ZX-TY
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu1g-0002DB-S8
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:02:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu1d-0002me-BQ
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpAEVWKmfuJG2mreiBrMIG5NXEVdSrwx115WkbKX6dI=;
 b=Nw/09AygZ+hxNI2ctSd4H+5X4MNSrx4VdHw8qCIVJZiAHPcMg0KEJRbaaBdh6hOvpoFtvF
 0o3fyGEyxcMksgOhOhpk1z6eam7XFXqxgGhmnNkhXEcKw6sV7krOglzy6Q4cGZg/CNtLh4
 EZKCTo0A7XEpmwLYkmzNBE8Hw9HqOBU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-pFNEZLEpObuMURBo_ZtUqw-1; Mon, 27 Sep 2021 13:02:43 -0400
X-MC-Unique: pFNEZLEpObuMURBo_ZtUqw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n30-20020a05600c3b9e00b002fbbaada5d7so461081wms.7
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VpAEVWKmfuJG2mreiBrMIG5NXEVdSrwx115WkbKX6dI=;
 b=a7khrZovgmLoWDpwgw/sUDNoJzEAEBb1NV6Vh1Bd3v8uhJBQu7DzWoHn22BNn6yAB7
 f5I6+7ZrF3UzyzCPUnk5XmZyNdqFisKVvek+Gyz47gxdUjBbf/3Omz/cy8tL682+iM14
 It+iLPWko4NvSPU4AuSDT5Q7ux6QYJuuCkqdWtQKjnXlP8q+yXAhpndqqumwoqjRTiiz
 mKK6TdKeQXwGzvcwF+M+Vng0kUR8/gjSh8kA/t36gveAlB142x0+07oMbsOVaFV+z3UP
 7tgws0sXcerpj5vOO1bToa+5t7Np8hOIed5smUV9koapKeEXIt6RpAJHA1NDYR44s6X0
 souQ==
X-Gm-Message-State: AOAM532wz5E5wqkxhSrt9odw50bqTPE4zWZkO5Jo0c+C0/Ud76Hx8haj
 0nDNV88zyrCvGNIsGJgispB+PBs/Aeb7qR7UvRPrFM3lGVvaeGkrO4hkhsX6K12hl3xjLA+jM1b
 A9URceFkLPXL+mtemzDqIF0g3Vl8S9eOGkmi80xlVkZ+bF6BR60w1LsNt0uMvODB9
X-Received: by 2002:adf:f687:: with SMTP id v7mr1039032wrp.347.1632762162450; 
 Mon, 27 Sep 2021 10:02:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQTlYpyLEyVF/6uil77ldBqUslhPVfhlKj9lEmpEwVyPdc3y46fuqWqsHbKpflV3g5lDQ+sA==
X-Received: by 2002:adf:f687:: with SMTP id v7mr1039005wrp.347.1632762162215; 
 Mon, 27 Sep 2021 10:02:42 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v10sm4617188wrm.71.2021.09.27.10.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:02:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/21] tests/acceptance: add replay kernel test for nios2
Date: Mon, 27 Sep 2021 19:02:09 +0200
Message-Id: <20210927170227.2014482-4-philmd@redhat.com>
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
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch adds record/replay test which boots Linux
kernel on nios2 platform. The test uses kernel binaries
taken from boot_linux_console test.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <162737552919.1735673.12493523185952280539.stgit@pasha-ThinkPad-X280>
---
 tests/acceptance/replay_kernel.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 1bf7e997fe3..93251819927 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -328,6 +328,17 @@ def test_or1k_sim(self):
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'vmlinux')
 
+    def test_nios2_10m50(self):
+        """
+        :avocado: tags=arch:nios2
+        :avocado: tags=machine:10m50-ghrd
+        """
+        tar_hash = 'e4251141726c412ac0407c5a6bceefbbff018918'
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2018/download/day14.tar.xz')
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        self.do_test_advcal_2018(file_path, 'vmlinux.elf')
+
     def test_ppc_g3beige(self):
         """
         :avocado: tags=arch:ppc
-- 
2.31.1


