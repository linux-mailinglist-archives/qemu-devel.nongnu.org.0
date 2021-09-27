Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE995419ADE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:12:28 +0200 (CEST)
Received: from localhost ([::1]:41270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuB1-0006z6-Qj
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu1f-0002CH-9C
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:02:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu1b-0002k8-61
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=28MYPmvj046+z22igZ1+cW5IJfZzrl5tVnoGjfF3hyA=;
 b=OCprETj8H+uZyqooCRp+YIk2bdORN5M4xQ1+ifI4ogk26fWG/EVh0T6uNRmdrvMpvfVE/d
 9LrXqG/qRlfHetFW/lvdLTlg/el4iQKVqejyQQcow2mdTzIgpdwterKR1ZtMDLdovjItw+
 WyfRhTIkem8feffQHbFjciU1Uu2XAV8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-6PQk1SoTOe6e4Y2WEdMcXg-1; Mon, 27 Sep 2021 13:02:39 -0400
X-MC-Unique: 6PQk1SoTOe6e4Y2WEdMcXg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j142-20020a1c2394000000b0030d06638a56so207241wmj.9
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=28MYPmvj046+z22igZ1+cW5IJfZzrl5tVnoGjfF3hyA=;
 b=VWL3iI2McvW+q66+ReV+t/T1fz8HB0hhmQeVJg68U05iG/NcPeBQOg9mMfBKqh2O26
 YQ1P0/P5fGT83dVwgWSTh9JjjJbkH50dY7MieBn5J/CDNXmBlOETZzIPz2xAw/RC8goV
 AE2G7CHbbH7fgelQ04fbpyYqD5JSkKvu/dBvLVXwfpcv8SD8wAQrWJuEPtZlIrckzAQg
 ENifgMhuJZlZE28X5XgtBzcu21Beh032U1kA4vEV3mqVDu8VMlxsJaZbQFoKZILvkdHH
 gGOUwpUeq3AT7ZuBgRZ1of48j6TftBK4vAroxPPcQeIFyP2pnMfLVRNDXtWbqYChRAYH
 +ucg==
X-Gm-Message-State: AOAM533VmLyLKFkImR5qEyu2IHRyTaGooA11OD4sVyy1Y0JfTZ6PocOq
 a7d37vxbbvtZViKCXXSqJSIKP/noCO5QXDXSTgHnrUpU9KoODDtkdzv2inBvOdWtiZQnaPz2pgY
 L78W3Z/hYQvsJOfYwLsgllIRkxVx2cZIcm2vG1sfsQr9E7EGU2VaiIRaifx9BXDt7
X-Received: by 2002:adf:f84e:: with SMTP id d14mr1071492wrq.359.1632762157897; 
 Mon, 27 Sep 2021 10:02:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFjtmNPGsVo1x8qhxmCS19YLhH48y+KdIxsMXc68RBKPqmHmolyfQ9qPlb78VQFXh5OSIjdw==
X-Received: by 2002:adf:f84e:: with SMTP id d14mr1071472wrq.359.1632762157722; 
 Mon, 27 Sep 2021 10:02:37 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 8sm47002wmo.47.2021.09.27.10.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:02:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/21] tests/acceptance: add replay kernel test for openrisc
Date: Mon, 27 Sep 2021 19:02:08 +0200
Message-Id: <20210927170227.2014482-3-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
kernel on openrisc platform. The test uses kernel binaries
taken from boot_linux_console test.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <162737552350.1735673.14603125561530143423.stgit@pasha-ThinkPad-X280>
---
 tests/acceptance/replay_kernel.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 06a09d66791..1bf7e997fe3 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -317,6 +317,17 @@ def test_ppc64_e500(self):
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'uImage')
 
+    def test_or1k_sim(self):
+        """
+        :avocado: tags=arch:or1k
+        :avocado: tags=machine:or1k-sim
+        """
+        tar_hash = '20334cdaf386108c530ff0badaecc955693027dd'
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2018/download/day20.tar.xz')
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        self.do_test_advcal_2018(file_path, 'vmlinux')
+
     def test_ppc_g3beige(self):
         """
         :avocado: tags=arch:ppc
-- 
2.31.1


