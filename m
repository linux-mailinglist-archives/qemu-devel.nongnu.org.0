Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B623D387446
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 10:46:35 +0200 (CEST)
Received: from localhost ([::1]:37168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livN4-00084K-R1
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 04:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livFv-0003YB-2h; Tue, 18 May 2021 04:39:11 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livFq-00048j-DJ; Tue, 18 May 2021 04:39:07 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 f19-20020a05600c1553b02901794fafcfefso375799wmg.2; 
 Tue, 18 May 2021 01:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gy7bya1GfaCYAsMvtBUOrz63lYwfM7lAidIzQ0mKnCw=;
 b=I4pJcjvuT/OV7hdK2oFOQMztXSirzdWENCJXFeBxCr02lVULwO1RBcxJeiKlAN92vD
 yaj++b5LaW3h9j7Oul781IATP+f0nCiPP9N2nroSi9DC6DPgJMa4rBGXzjRC2A0/S2s8
 1YYGD1zGI1alVMAT5XnYH2i8aNM9n5sA/sXkmBXln7U1XZm9J010q0ESnWgSabgr4JYW
 nKmYMkiof/GKbkEA5PyopcwDSZ+OKsFiIBecbxZUrrkJD6sDkK9UBoWKo6Tgp73XPpf1
 UX0bgevpyS82aGiXP2mZGqpMbmc20XN4nMe/6fiY8OQC7lW96fbdl0wvZoXEu1nN6Qie
 u9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gy7bya1GfaCYAsMvtBUOrz63lYwfM7lAidIzQ0mKnCw=;
 b=pWAZVN5ROOWurlC0SQ5wKqeZZPBXsRhNsdifDI1QRfCfEQOln+rzU65XAnDw9Zk//W
 maXJwU34x5Fwo3aP/Od9zLBA8IyreFHxxbVibP56SeMTBO0+FPCsGRi6Q9gTl4xa7RFu
 EhB3r8xXFrzAiyDamdH7HLdxY6UaZLJ/tdXBvH0F5llFc8owCUTJG/hZLccVFHUexf7c
 YHjSP8fCezr/vt43MazLz4y5th1+yS4KE/xom0mPNb20ox3KErKmx+z9wIxps764XvIF
 sn28PTTGaGyzHnz3Jc41rpJ19NnjGlrvc5zuNBFuV3gcCDE/Uirf0xG3rqiEHLchQjnD
 sS/g==
X-Gm-Message-State: AOAM530AnBJ46hxXVuvwNXyGB9uaAREIisfvsLw0Y3Ck58ityL/rtGsS
 T+Gl+wtwlF/82zlD59jN3p4Quths4q4Caw==
X-Google-Smtp-Source: ABdhPJw5/dmzzwjhEx5xuddZFpoApB7o+dkfDrlPrmVApOLSjdLEWKCv7P5SIsr8c+/4FZBIRTJdrA==
X-Received: by 2002:a7b:c93a:: with SMTP id h26mr3616304wml.141.1621327144729; 
 Tue, 18 May 2021 01:39:04 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y6sm70959wmy.23.2021.05.18.01.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 01:39:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] block: check for sys/disk.h
Date: Tue, 18 May 2021 10:39:00 +0200
Message-Id: <20210518083901.97369-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518083901.97369-1-pbonzini@redhat.com>
References: <20210518083901.97369-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
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
index 9ad725d205..86a8c638c6 100644
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
index b3cc45c41d..5f0d4a1bc3 100644
--- a/meson.build
+++ b/meson.build
@@ -1164,6 +1164,7 @@ config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
+config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 
-- 
2.31.1



