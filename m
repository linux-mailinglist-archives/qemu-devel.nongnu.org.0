Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56607403827
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:45:05 +0200 (CEST)
Received: from localhost ([::1]:45922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNv4i-00079q-DZ
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuS8-0006x3-KV
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:14 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuS4-0003HD-7H
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:11 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 n14-20020a05600c3b8e00b002f8bd2f8ab6so1109505wms.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=14SEeU0UMLkgFlaB4KV5IS119VHrF2FPl2DRudjmlkA=;
 b=bNWET4vGP10rShYuq8yyJJkVEHqn2ZYQQQsNd1YZC2zFfGnkB3r1vrbrSeJMSgilOj
 mDx79nfMLMgIBAfsjts1pSPeDLWL1uDXMXEXb4GQMHjt0E0B51VOjPhaoe5pvFNvIMbI
 copyokqjJ2z5V/QwxyJbft7lgcHvvR3Vo2uMJ5ObSR+ABqSnYvJzpqhRzZRswLfAx2Aw
 kgnlj6aTx990Gbi4v6ubUHSy1mjy0dBn/EPSLigH4BEPox+B4p4fnywqkhAMBZX/bdL/
 ep/CI8gKq8Qot4C6jVlMAWcIct3UsxdCLTdDiTGVogdZZdvLAXbbiLlUaUwTR5mrFe6c
 dzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=14SEeU0UMLkgFlaB4KV5IS119VHrF2FPl2DRudjmlkA=;
 b=WCoDupFkDasj5hcfyiA8P6u3ZRQWdlK3nH7ltho2epkeeUW03N+plUpOlD7zZpS949
 9VGriz3b6mcsTUB3b6j2kgvGnUgff15ciMtYvjstX8cfKNr9Hx7LVB59PrCOjwaS8PZU
 9PrphY+44C5m6KaeP1ESKagBILP7I9KZeUTtIkdF51p9QKfdWqmTlM+kGZMMiqmi1Zmc
 s7q3BP1rbCDgKeRre/AydkzurdpcAalE/vS/9gJVc/c7YRl3JKwdl/34a5QOOsMAee3C
 F/+JFGwKILM5FoTZujVPxKhT/joTOoFK4xUDimxVjNzzL2/lUVDvlXlkrKIBdbHRepzE
 e0jQ==
X-Gm-Message-State: AOAM530jbSXDO+0uPo8wVtTEYvWMsn4XybRj/DMyPHQMUVOo+PTVPQ0h
 pejIQNhYyOz+ZvFFSJwwNmCxsrCTkfY=
X-Google-Smtp-Source: ABdhPJzRrv8IH85xL0kmyQuE/t9nFUOGpYMckjxG+e/M+uQ0e1y5oqIhxTSq5B58TviOHF7lsz51lg==
X-Received: by 2002:a05:600c:3209:: with SMTP id
 r9mr2714492wmp.106.1631095506511; 
 Wed, 08 Sep 2021 03:05:06 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:05:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 42/43] meson.build: Do not look for VNC-related libraries if
 have_system is not set
Date: Wed,  8 Sep 2021 12:04:25 +0200
Message-Id: <20210908100426.264356-43-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

When running "./configure --static --disable-system" there is currently
a warning if the static version of libpng is missing:

 WARNING: Static library 'png16' not found for dependency 'libpng', may not
 be statically linked

Since it does not make sense to look for the VNC-related libraries at all
when we're building without system emulator binaries, let's add a check
for have_system here to silence this warning.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210906153939.165567-1-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 7e58e6279b..f07236d947 100644
--- a/meson.build
+++ b/meson.build
@@ -931,7 +931,7 @@ vnc = not_found
 png = not_found
 jpeg = not_found
 sasl = not_found
-if not get_option('vnc').disabled()
+if have_system and not get_option('vnc').disabled()
   vnc = declare_dependency() # dummy dependency
   png = dependency('libpng', required: get_option('vnc_png'),
                    method: 'pkg-config', kwargs: static_kwargs)
-- 
2.31.1



