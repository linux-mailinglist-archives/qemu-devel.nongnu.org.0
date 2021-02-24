Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADCD324328
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:28:08 +0100 (CET)
Received: from localhost ([::1]:57670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lExxG-0004uf-PY
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:28:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lExmQ-0004Ie-6w
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:17:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lExmL-0004He-Ne
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:16:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614187007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HMSf7VHZzN3ORhRRQHVi3oJyjkiz8LlOOO8DQlsKxl4=;
 b=KbiS1PFKePN0sxjxAGSiEsI3JQ/jUVmZjQQGkOKELXo1l5SHJk2Osi/2apPYU9qn2qhBZ1
 ak13gc6gLovAeKcW9vfW2orc0HkTkX476GFa3CAqQeKC44ZY4w8JpEngBzFFcMbgAtFUD4
 vciYXheEiQSLjf7kk3bYrp3vTYS0WyA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-hvcCwq_DPXG4q5TFCGqrhg-1; Wed, 24 Feb 2021 12:16:46 -0500
X-MC-Unique: hvcCwq_DPXG4q5TFCGqrhg-1
Received: by mail-wm1-f69.google.com with SMTP id u15so840315wmj.2
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 09:16:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HMSf7VHZzN3ORhRRQHVi3oJyjkiz8LlOOO8DQlsKxl4=;
 b=FbEzhIFYwTK4tJZMTwfl0mMBhWsX77djsjxXcczCMlP/h7j7TWLb8Q6JbkfL+CwrXF
 jgBeA0ne3km6hmJc+CgXZFybV/hzYxANEUMpMs7gYHOWW51NJw63re+JXN3yDNbTrMC8
 F9Ac7EcwJxsP8vvtnG8nUc1AwFoKqP+2EDnlbbv7JgraC1+6tWDl5DKUScT0tSGfDAFA
 8jTiqRlgldsqmHTLHoQ8AJFPOB/2XzXBZZ6peZp6BxdK/QVq3kTANKu7nqfWxjUB2Ttt
 6rZqAl47LBBy+4c1QYtcm5YISBeEXhNsJuhC1tt37E8lR/lpo9yss8gB6LN4T5VcdSgI
 COeA==
X-Gm-Message-State: AOAM533d3S2w0qyPjyn2zXitNRZtCS3FDNfOkewBYDg4UryBdUZSKZd+
 w4YG8HawitvvhnoBa6L6HiM8su5hkFsKE5AWFpui5vojOFMSvznIlTjJURM8jMphUkCdeM4Ofhb
 ZX0HEIPuuGl9Es/ZIjEGoIHIdnRAy1lsi0maeMwPGu4/goOqlXFtiiYm6esH2z4bU
X-Received: by 2002:a7b:c417:: with SMTP id k23mr4728192wmi.132.1614187004642; 
 Wed, 24 Feb 2021 09:16:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyS2ICE/w7+ZEat06UHPH/k/rw3E8Hy4qlOg6FuVRMEKO3NGt5743Umk90OpAZSLKRxzeFdLA==
X-Received: by 2002:a7b:c417:: with SMTP id k23mr4728178wmi.132.1614187004454; 
 Wed, 24 Feb 2021 09:16:44 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o13sm5627209wro.15.2021.02.24.09.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 09:16:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qapi: Remove QMP events and commands from user-mode builds
Date: Wed, 24 Feb 2021 18:16:42 +0100
Message-Id: <20210224171642.3242293-1-philmd@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We removed the QMP loop in user-mode builds in commit 1935e0e4e09
("qapi/meson: Remove QMP from user-mode emulation"), now commands
and events code is unreachable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/meson.build | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/qapi/meson.build b/qapi/meson.build
index 0652569bc43..fcb15a78f15 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -102,11 +102,15 @@
     'qapi-types-@0@.h'.format(module),
     'qapi-visit-@0@.c'.format(module),
     'qapi-visit-@0@.h'.format(module),
-    'qapi-events-@0@.c'.format(module),
-    'qapi-events-@0@.h'.format(module),
-    'qapi-commands-@0@.c'.format(module),
-    'qapi-commands-@0@.h'.format(module),
   ]
+  if have_system or have_tools
+    qapi_module_outputs += [
+      'qapi-events-@0@.c'.format(module),
+      'qapi-events-@0@.h'.format(module),
+      'qapi-commands-@0@.c'.format(module),
+      'qapi-commands-@0@.h'.format(module),
+    ]
+  endif
   if module.endswith('-target')
     qapi_specific_outputs += qapi_module_outputs
   else
-- 
2.26.2


