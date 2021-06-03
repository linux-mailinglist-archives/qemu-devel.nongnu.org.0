Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8B639A267
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:42:39 +0200 (CEST)
Received: from localhost ([::1]:38736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loncM-0005nx-HF
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lonXX-00032u-Rc; Thu, 03 Jun 2021 09:37:39 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:45664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lonXW-0000AP-8d; Thu, 03 Jun 2021 09:37:39 -0400
Received: by mail-ed1-x529.google.com with SMTP id dg27so7121211edb.12;
 Thu, 03 Jun 2021 06:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pHF46fO4kk0R6NoY+59bVj7PZ8zMQnZF40xB0YMAuds=;
 b=XWaOxtO39E6QdSutGjdwaVivrBBGEODURwd0NqB1hx77KBmXwcTP3+WiJL/tUbKJb9
 eBFcB2GKdxT2v4U9CfvA+IMd/7+GnT0M7uKSSpHYqySBEOMIercEPpZYjlCRnfF2xldw
 evC9Yw3PUnXkYYa6EGmUURbIE2dwjfWsi11pgTepqlymf7UxvYRE/t00t910cXzynfa4
 vQCFSTYzJ8wV5NnTHC+1BpPrZ+eIWT/8XE7gQYa20xRv/nOnlkGnHxwiAKBx+fng2IVq
 IvjgoZE1ZOdMjEv5LKvjCRFZG9zGJ5P0r/AFOgCVRRlnNPSLaq6SmplbZrhQN/52jyjI
 dKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pHF46fO4kk0R6NoY+59bVj7PZ8zMQnZF40xB0YMAuds=;
 b=PaN4mrpWuykxTJdNsESchKLMmYM0UMPhBTmOrMPr7U7fmf7eeyeHeKqY7AMqykH37V
 HlirkPYyJTiiJuYayToSJQZGCNBImAldsxTdgVYapi1BjGPMQ859ilCe/jwQNZl/+A0P
 /gERCmbrFwaaJDIL5q+UFrTRJ0/ORPy7fg5jao3PDBNzzZ4gz3WXgKoteIiclP+9tI+O
 0lH3DPRtLdoEmwwZAZQ3/aNMulZ2+lqHojwq3lfzwss+QVZCdFsbOigCcEslG6/RtL+o
 c7obj5a5apaI1j6AYhXmd9Di52z28Wzo4eq3Wp5P0sImSoHmiuPB8V6LeK8DgkmdW3dG
 sMTQ==
X-Gm-Message-State: AOAM531SwWPM5KJg7DdhQmFtTeBj38PdjCJY+gxxe61LznCuMczZB8gv
 rR4p3P03AEl2zzca+yq/KhW6V5e1IKO8gA==
X-Google-Smtp-Source: ABdhPJyMHoBWw5I7t7lCdHr5P0WGGssAc6j5CM+NtNUODUh8nJWjCNQ6i5mpI/RiEmHkDSi2U7VQ7g==
X-Received: by 2002:a05:6402:1601:: with SMTP id
 f1mr43685608edv.383.1622727456612; 
 Thu, 03 Jun 2021 06:37:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e24sm1555369ejb.52.2021.06.03.06.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 06:37:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/7] block: check for sys/disk.h
Date: Thu,  3 Jun 2021 15:37:21 +0200
Message-Id: <20210603133722.218465-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603133722.218465-1-pbonzini@redhat.com>
References: <20210603133722.218465-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joelle van Dyne <j@getutm.app>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joelle van Dyne <j@getutm.app>

Some BSD platforms do not have this header.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Joelle van Dyne <j@getutm.app>
Message-Id: <20210315180341.31638-3-j@getutm.app>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c     | 2 +-
 meson.build | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 3f456892d0..1d37f133a8 100644
--- a/block.c
+++ b/block.c
@@ -54,7 +54,7 @@
 #ifdef CONFIG_BSD
 #include <sys/ioctl.h>
 #include <sys/queue.h>
-#ifndef __DragonFly__
+#if defined(HAVE_SYS_DISK_H)
 #include <sys/disk.h>
 #endif
 #endif
diff --git a/meson.build b/meson.build
index 9387fc5799..8c44c37f9a 100644
--- a/meson.build
+++ b/meson.build
@@ -1169,6 +1169,7 @@ config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
+config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 
-- 
2.31.1



