Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85180446D1B
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 10:12:49 +0100 (CET)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjHkm-0006Gw-7N
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 05:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjHjD-0005L3-Nr
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 05:11:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjHj9-0007uR-Pn
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 05:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636189864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TLemfymmIdX9ccU0ak35RWWXY3RP5yiYEPKWiq9wRyQ=;
 b=br6AmKDHVaqHod6/GnocFfuTWBc+JK4HsGoncjSwsDZEOjGpJP5DWEm1Jd+BX3X1Fy9W1+
 7oVYX1Mq9V0aFNIlYRckC+sRCnCdo6pyO5+FfB/+L71c6bw06RCmvehIdFSBraUmNk6Nhl
 SJCYTRsgFnCv0SOrzEFo/JiIwIUpXF0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-3PvtnJfGPjy65vK14-XsKw-1; Sat, 06 Nov 2021 05:11:03 -0400
X-MC-Unique: 3PvtnJfGPjy65vK14-XsKw-1
Received: by mail-wm1-f72.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so4514684wmb.3
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 02:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TLemfymmIdX9ccU0ak35RWWXY3RP5yiYEPKWiq9wRyQ=;
 b=58W7IECxTF9qwDxS+P/bJLgczyoc4fCW3AwFL5iWrSOsNY/bQByOosTD0GV1uQ1zSY
 7UEvVTosQqt1oSAKC/RIJ+Jr+ZFJayOEsOayMVfhJzlLDbw/WbVBvtRCXe5XB3EyXZCE
 OdO7QxsF0fRQdCCIDCsqYjDohTLijGB/+VC0yLJNODnAI5qMjMXR0fa3XMdughHHGeqe
 tlccvRCwoQvu0thkyE3lEZC66CDU/9XGRnYUdyLWV2rMDrI90eyqlS0527ptcUct1Xbx
 kog9F46hRA4syWDHddg1rAQy/J4nk+Oaxs0q/QdvIKcf0iWDu3/NYnzu9fG4kqQUckO3
 m6tg==
X-Gm-Message-State: AOAM530acnUHm9IIPq4bFiEN6aDlljaHWv9nxEU0WghX3//cU4ur53nf
 lyH54LIbzEgzt8kQpxDUHcoQJxDJU0rD6NvswF4B1k3l7IaOeaawMigZmLVjGJsyYuPkJ1VJ793
 lmSBwLbFQWqiqlWbxnZ5Xx1rRtLS7q2DqhSI9AGRQ5HGvMf344lSkmCCI6ZU2hb0+
X-Received: by 2002:a05:600c:430c:: with SMTP id
 p12mr38260170wme.127.1636189861687; 
 Sat, 06 Nov 2021 02:11:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl848g2VWR+kj3bbznXfiboo4uTFD69Rh/q8E5lDgpowkxTO2MDJZSyixd3Rk96tMQwxEsFg==
X-Received: by 2002:a05:600c:430c:: with SMTP id
 p12mr38260141wme.127.1636189861446; 
 Sat, 06 Nov 2021 02:11:01 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id d24sm9408308wmb.35.2021.11.06.02.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 02:11:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/avocado: Remove p7zip binary availability check
Date: Sat,  6 Nov 2021 10:10:59 +0100
Message-Id: <20211106091059.465109-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
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
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The single use of the 7z binary has been removed in commit a30e114f3
("tests/acceptance: remove Armbian 19.11.3 test for orangepi-pc"),
we don't need to check for this binary availability anymore.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Based-on: <20211105155354.154864-1-willianr@redhat.com>
---
 tests/avocado/boot_linux_console.py | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 4ed01ed7893..9c618d4809f 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -22,13 +22,6 @@
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import process
 from avocado.utils import archive
-from avocado.utils.path import find_command, CmdNotFoundError
-
-P7ZIP_AVAILABLE = True
-try:
-    find_command('7z')
-except CmdNotFoundError:
-    P7ZIP_AVAILABLE = False
 
 """
 Round up to next power of 2
-- 
2.31.1


