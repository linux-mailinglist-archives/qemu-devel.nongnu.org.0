Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB16E4041BE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 01:25:06 +0200 (CEST)
Received: from localhost ([::1]:60560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO6wD-0006lg-Ug
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 19:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6s2-0006gu-2g
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:20:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6s0-0002md-Bz
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631143243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AztXDO9JQH0V78yza1WhT6PPCcwDZClDQJU1AbRxT1E=;
 b=DzNscKHD3B+rraynLTiG6CcFw3GBOY0qxjYVo/6Orqx2lRKrTmHUdjS8qLxwmpQcj7StRN
 Mykf0lwDYaebs39zHs5SnQpcb9VgCmEOSsSQ8VtDZoP1M16PR3lxxWqBDQNoTCfYQwlhAW
 wdLaQ24zI0jb7CYEshHXMM+oVlnWEZo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-mGKaeruPN1SYzwcTs6Yyjw-1; Wed, 08 Sep 2021 19:20:42 -0400
X-MC-Unique: mGKaeruPN1SYzwcTs6Yyjw-1
Received: by mail-wm1-f72.google.com with SMTP id
 f17-20020a05600c155100b002f05f30ff03so43155wmg.3
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 16:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AztXDO9JQH0V78yza1WhT6PPCcwDZClDQJU1AbRxT1E=;
 b=MZYzep8O1l98mZ/F6yNVwfIIpnAU5ItQy58TJpEaqLTFZ7ew48j90v6+9UqC9gx6RU
 jgj4zqQbfCH5N8lrQM5w/knYLnaRAeyg/IP74wFvanUf4XxqlkcIqR7Q6a1A+L0NfuXe
 BNuz3OggEoj/H3RVV9Idf0e35Bb1gNBysuM11rbj5BSqBLmLLH3KfDU7B0e5nK2qr+gI
 FiYu142Q3uJq8FJxlW8ttIZogRqsWeJqtmwuvq0fsr3h/1rREOVWxKl1ajDKxu5nsQcM
 yCL8Bs8EZNS3h3vJ/pHrJVqtOXai+7aK4lYOedFeR3ygDLwSpZaUcr82ennhd5xQYNUO
 9FJA==
X-Gm-Message-State: AOAM5319uzGC9/Ms4TkJ/Y+ySNxW+j5GxZR5yssaX7zGLpj3NmF/PmoI
 gUTKYlE2D2ERSdfHfuCPoykOXGlSDpPuycaajksohCAoe7Zr0m1xJUa5Gs3rdIsJVnmOR8obfY4
 4A/GlrTcuhWFB51U0+Q5LLdUZgNFILWKumh4ZysYouDaXwOuWMU9l9tAB+WBJR1YP
X-Received: by 2002:adf:cd92:: with SMTP id q18mr84511wrj.211.1631143241104;
 Wed, 08 Sep 2021 16:20:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXGBcGkm4TBFmSADncXUcjFYrWCY3XIJ3gTrnp0jPkA2D2pCoYXECv5ulk3hjXuxgjKt0f9A==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr84482wrj.211.1631143240917;
 Wed, 08 Sep 2021 16:20:40 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id u8sm3407763wmq.45.2021.09.08.16.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:20:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 03/10] block: Use qemu_security_policy_taint() API
Date: Thu,  9 Sep 2021 01:20:17 +0200
Message-Id: <20210908232024.2399215-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the BlockDriver::bdrv_taints_security_policy() handler.
Drivers implementing it might taint the global QEMU security
policy.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/block/block_int.h | 6 +++++-
 block.c                   | 6 ++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index f1a54db0f8c..0ec0a5c06e9 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -169,7 +169,11 @@ struct BlockDriver {
     int (*bdrv_file_open)(BlockDriverState *bs, QDict *options, int flags,
                           Error **errp);
     void (*bdrv_close)(BlockDriverState *bs);
-
+    /*
+     * Return %true if the driver is withing QEMU security policy boundary,
+     * %false otherwise. See: https://www.qemu.org/contribute/security-process/
+     */
+    bool (*bdrv_taints_security_policy)(BlockDriverState *bs);
 
     int coroutine_fn (*bdrv_co_create)(BlockdevCreateOptions *opts,
                                        Error **errp);
diff --git a/block.c b/block.c
index b2b66263f9a..696ba486001 100644
--- a/block.c
+++ b/block.c
@@ -49,6 +49,7 @@
 #include "qemu/timer.h"
 #include "qemu/cutils.h"
 #include "qemu/id.h"
+#include "qemu-common.h"
 #include "block/coroutines.h"
 
 #ifdef CONFIG_BSD
@@ -1587,6 +1588,11 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
         }
     }
 
+    if (drv->bdrv_taints_security_policy) {
+        qemu_security_policy_taint(drv->bdrv_taints_security_policy(bs),
+                                   "Block protocol '%s'", drv->format_name);
+    }
+
     return 0;
 open_failed:
     bs->drv = NULL;
-- 
2.31.1


