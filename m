Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F8F313C1D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:03:36 +0100 (CET)
Received: from localhost ([::1]:43644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Asp-0003TW-1E
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96jy-00036w-57
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96jl-000531-Uh
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CqAFvg14A1cTs7I1Mx+cHId3dmqwXGNwM8OI3b5gkVo=;
 b=B4TCaJpUSA60WMtJzKNnyt4UJtPZUewrv54jw7JHuB/deYcRIdnRbc6nYLmvwTJ5GQXaBk
 hWyISU8a9Dhhq/yHpn5YXmIFkdlLCHquj4+IyoZPr8efTQPCW/iY2BzjRyvI5TO/gZ2VTJ
 LTC5ePRQ2L4RNkjeRP7hjOpu9CEXCkE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-JZy2yM_CMOSurC4p0A_O5A-1; Mon, 08 Feb 2021 08:37:47 -0500
X-MC-Unique: JZy2yM_CMOSurC4p0A_O5A-1
Received: by mail-wr1-f71.google.com with SMTP id s18so13017723wrf.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CqAFvg14A1cTs7I1Mx+cHId3dmqwXGNwM8OI3b5gkVo=;
 b=IMmgeeNus43HBDQ2zHz8Fmwkfriz3FIWcEY+Pu72eHBQPYIXPvD2fFKo/cDODzri/5
 sPvyFylDfYLJ3uYyIjeTsy0mSB17/s4ek4ycADpdfVng/vBoIuhOAI8oGndEtHZyyWUB
 6wfB+0nXFcVUQT+xIkqjgBIWMUUzex8GaJHqWp2BeGSic8v2i5U4TC8qOxrO8+wbsyDq
 6KGCrEaBE8Zdrlb5CgrTqXPWqxhSr3NJJLPbGRKLsL9Xcit8up12XqxVNqqvvpSw0QQz
 1kEFX3/0Wv1hcvSVsB+w/skD9q8EU60ZlGmujRDbh2Rl9UPXVv8dOl6r/3UNQYLUkOnP
 R+dQ==
X-Gm-Message-State: AOAM532kycA9d6jq8j0538NKwt4MqqATTe8666dWZeCbKQupedcaD9MO
 ZjdrBBRuqlAYa45lIS93xPpeOlJVDwPEifhURn4bYiOYj21NYBSEbpYzNQDT8R6mWa+JUFcmh7N
 DRz4nk5HwEXoZ0JPdfbLYJoAj6naswJ+/StablBENWumpweK9CBFMZXCcBrrKUQ+9
X-Received: by 2002:a05:600c:6c5:: with SMTP id
 b5mr12397462wmn.137.1612791465463; 
 Mon, 08 Feb 2021 05:37:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGOjSLYidnrp36SYIDfZzRHPO46/H3KSAMAxs2rh84+Lr/hP4BwHp7efSOie72f7fYlYPoNg==
X-Received: by 2002:a05:600c:6c5:: with SMTP id
 b5mr12397438wmn.137.1612791465152; 
 Mon, 08 Feb 2021 05:37:45 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o124sm21625659wmb.5.2021.02.08.05.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:37:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/18] tests/acceptance: Test the mpc8544ds machine
Date: Mon,  8 Feb 2021 14:36:59 +0100
Message-Id: <20210208133711.2596075-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208133711.2596075-1-philmd@redhat.com>
References: <20210208133711.2596075-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

We can use the "Stupid creek" image to test the mpc8544ds ppc machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20210112164045.98565-3-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/machine_ppc.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/acceptance/machine_ppc.py b/tests/acceptance/machine_ppc.py
index 51bbfd411ca..71025d296c5 100644
--- a/tests/acceptance/machine_ppc.py
+++ b/tests/acceptance/machine_ppc.py
@@ -5,6 +5,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
+from avocado.utils import archive
 from avocado_qemu import Test
 from avocado_qemu import wait_for_console_pattern
 
@@ -32,3 +33,19 @@ def test_ppc64_pseries(self):
         self.vm.launch()
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         wait_for_console_pattern(self, console_pattern, self.panic_message)
+
+    def test_ppc_mpc8544ds(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:mpc8544ds
+        """
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2020/download/day17.tar.gz')
+        tar_hash = '7a5239542a7c4257aa4d3b7f6ddf08fb6775c494'
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        archive.extract(file_path, self.workdir)
+        self.vm.set_console()
+        self.vm.add_args('-kernel', self.workdir + '/creek/creek.bin')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
+                                 self.panic_message)
-- 
2.26.2


