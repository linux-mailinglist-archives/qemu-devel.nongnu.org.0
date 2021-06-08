Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B240239F7AB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:20:56 +0200 (CEST)
Received: from localhost ([::1]:60102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqbf5-0007fk-PC
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqbb2-0008CR-Aa; Tue, 08 Jun 2021 09:16:44 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:44931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqbb0-0001z7-C4; Tue, 08 Jun 2021 09:16:44 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so1836427wmq.3; 
 Tue, 08 Jun 2021 06:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z5JxGJSakRyFgaDMwSNCyo2E3Qm6rZqr75V7oP8N/jQ=;
 b=UL4W7WZlcT7T+cIOXMx3NvRNDqop0YtbSHjI80jt09VdrgyRg0fzECXQvt3IY+b/Mr
 Odqncv3051hmWSTc6dN+ZOzPXnJ0Shh/ttXt4OpN9fOp9nry1DUzJ4BUfgG6iLtJUfCg
 R9VkZQGv1xVTFOJJijEj/n5enSDK8aEDm6FK+7F5AGh7C+QDmnAJlKzqqqfwm6RaxXqM
 ffIkdaNwG11lRqhVBS7tCkWpd9+1oz+0c0DdwDV9wMVIZNhod03Bf4D1hBN2vxq5we1Q
 H6h4baMFzBv7i49adeZ06X6fca3Ak3FqqN4xuRO8lnHvJH7Q8A6NbhJoj31kHWFQzWKw
 vULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z5JxGJSakRyFgaDMwSNCyo2E3Qm6rZqr75V7oP8N/jQ=;
 b=IGflSqQgXVESq+ue54COKfhKpD6Dz6JQCG6U3+fLKRGiks4KiPCMOq0JCdl48QPnKm
 /H8MvGWch5otogbULR3iGJHPieiuLO5OCeQ+ZgvKunpX1kipicia23n8AYI5NPlUbTRr
 WnnVC00eM9+VpfgasXwFE7U+QpC+b2Nj8CxPGhkEcfyf15ZxIJPlcwyieg1MBin2q6M7
 9kuO8bNcK4f5fu41ms+EUViEVs1seRN/YerXBNZwQfRIMIU2xiPZ1pyC7FtnO0eK4zUf
 bj6PoFhckh0ABKqx59CP6U+QAVa4xgIjPBZQ15wPfU0j280yfTQVa0avi4/ZL2T6bV6o
 CmXA==
X-Gm-Message-State: AOAM533rUDdpiDRXuPoTBYbqsKaNss2FO59x6+OorUDmyarcMIXflLRE
 H8b2WVlzcfILIfW6I3HfNiskC2FpCy3OVg==
X-Google-Smtp-Source: ABdhPJymI5jJE1X7rmJXBWVM3zAsHagJRqMGSWPCaAa3J6Peg7GERkCGjy99CtvlOKOntFlrXX4WqQ==
X-Received: by 2002:a7b:c394:: with SMTP id s20mr17482703wmj.33.1623158200616; 
 Tue, 08 Jun 2021 06:16:40 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i9sm15855686wrn.54.2021.06.08.06.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 06:16:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/7] block: check for sys/disk.h
Date: Tue,  8 Jun 2021 15:16:33 +0200
Message-Id: <20210608131634.423904-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608131634.423904-1-pbonzini@redhat.com>
References: <20210608131634.423904-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 Joelle van Dyne <j@getutm.app>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
index 53150866ac..7e3902b5c8 100644
--- a/meson.build
+++ b/meson.build
@@ -1187,6 +1187,7 @@ config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
+config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 
-- 
2.31.1



