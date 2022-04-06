Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CA14F637D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 17:34:52 +0200 (CEST)
Received: from localhost ([::1]:48090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc7gJ-0003ix-Hg
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 11:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nc7dt-0000uT-1b
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:32:21 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:43750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nc7dq-0001tm-6z
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:32:20 -0400
Received: by mail-lf1-x12e.google.com with SMTP id z12so4710617lfu.10
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 08:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YdmnKAbX7LBd9yV1jKELlDUOSLpTg0se5H4/OG6SDPM=;
 b=E3i1ouyIwUDUKjbbUql5RvLsUlTFLDEPsVo3wjmm7vmc5wKr+w+MveB7XLBphHYWP1
 1abEkURnVE02/xNGNHYbkF7QrlEHY+bizKx6vmHRnKlRU2Tf7vcjkJbdJK2MzS4Y0D1V
 tBZ+0kS4FoBZDvKbid+XXzUBAI5REXoNA+ZRp940TaXRvlRktnmg5wfL0EEQfIxCnsyL
 ub3Tb9ZFcGLu+BY3oVKWEsTUZkxXfGVKe9wvqSaQ0qVlGruGFxf0gz/buQCvregwoamT
 /+P1Ge1TedG1xfmV7DHOZF0oXkZm6sGVkAXfpzgLjkJgC6KM7M1rGdXtCmzPFwGgfqtQ
 bdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YdmnKAbX7LBd9yV1jKELlDUOSLpTg0se5H4/OG6SDPM=;
 b=LKDdtu2oPDHLUPPHQ1bVDT+jW9Cmq1A2+O8j3hmbZTZNBvi9jkQIb1NiGTjhZqa4ly
 sbXJ9Mv9BAjkASE8MWR61pNvof/3RqA8FZDv50cR9omGf/1rPmCfnMHhb6DAvia2Ag+Z
 FzQ06LV7u8WGUdBPlbdkFmLd1+FDIti0ia93LEB8uEgq0X/cYFri6IdwPDOTN5gJaAKd
 FgcjmcbRRzxt1CjQPfWpw3S7G9e3Xmi+yKTY/oR4zzSa/F2sssBN1PIHd8w+UgHqZab/
 gjuIzqjRXx3q1uJupwbY6moH84IF4HoUL2FPJP10HxV4RPDt9KAy41ECp3R7FwHtKB15
 MT/g==
X-Gm-Message-State: AOAM531tb8oAqqsrLhU/TW4i0ERj3yqZXtQ5Ay7OqcmOOEJpoOIZSMAP
 cdVCYrZufjPglZt5I8R3IN8bbQ==
X-Google-Smtp-Source: ABdhPJyw49dR7EewgmFV9iCFKzEC2emO2VgsXnwvNKf/fVnhYiJ7hh/MACkWfOJjPZuU6AXLQpzC6g==
X-Received: by 2002:a05:6512:31d2:b0:44a:9ae9:edad with SMTP id
 j18-20020a05651231d200b0044a9ae9edadmr6183424lfe.513.1649259136571; 
 Wed, 06 Apr 2022 08:32:16 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 m20-20020a056512115400b0044aa2184999sm1861378lfg.142.2022.04.06.08.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 08:32:16 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] iotests: add throttle test
Date: Wed,  6 Apr 2022 18:32:02 +0300
Message-Id: <20220406153202.332186-3-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406153202.332186-1-vsementsov@openvz.org>
References: <20220406153202.332186-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, berto@igalia.com,
 qemu-devel@nongnu.org, hreitz@redhat.com, vsementsov@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add simple test for throttle filter driver.

Without previous
"block/throttle-groups: use QEMU_CLOCK_REALTIME for qtest too"
commit the test hangs forever, because previously used VIRTUAL clock
just doesn't tick for iotests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 tests/qemu-iotests/tests/throttle     | 50 +++++++++++++++++++++++++++
 tests/qemu-iotests/tests/throttle.out |  0
 2 files changed, 50 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/throttle
 create mode 100644 tests/qemu-iotests/tests/throttle.out

diff --git a/tests/qemu-iotests/tests/throttle b/tests/qemu-iotests/tests/throttle
new file mode 100755
index 0000000000..63b802cee7
--- /dev/null
+++ b/tests/qemu-iotests/tests/throttle
@@ -0,0 +1,50 @@
+#!/usr/bin/env python3
+# group: auto
+#
+# Simple test for throttle filter driver.
+#
+# Copyright (c) 2022 Virtuozzo International GmbH
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import iotests
+
+with iotests.VM() as vm:
+    vm.launch()
+
+    result = vm.qmp('object-add', {
+        'qom-type': 'throttle-group',
+        'id': 'group0',
+        'limits': {'bps-write': 512 * 1024}
+    })
+    assert result == {'return': {}}
+
+    result = vm.qmp('blockdev-add', {
+        'node-name': 'throt',
+        'driver': 'throttle',
+        'throttle-group': 'group0',
+        'file': {
+            'driver': 'null-co',
+            'size': 1024 * 1024
+        }
+    })
+    assert result == {'return': {}}
+
+    result = vm.hmp_qemu_io('throt', 'write 0 512K')
+    assert result == {'return': ''}
+
+    # We need second write to trigger throttling
+    result = vm.hmp_qemu_io('throt', 'write 512K 512K')
+    assert result == {'return': ''}
diff --git a/tests/qemu-iotests/tests/throttle.out b/tests/qemu-iotests/tests/throttle.out
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.35.1


