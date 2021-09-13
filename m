Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D67B408AD5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:15:34 +0200 (CEST)
Received: from localhost ([::1]:35824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPks1-0004Ns-2f
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkbA-0002vA-0Y
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:09 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:54019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkb7-00062O-R3
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:07 -0400
Received: by mail-wm1-x330.google.com with SMTP id i3so6454427wmq.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=14SEeU0UMLkgFlaB4KV5IS119VHrF2FPl2DRudjmlkA=;
 b=H9gYRaBzpLNfFX7aXI6ZKYgap/UnQprXEPTrOleE+Gr/YbkRtPyE2B4wL4YsgBD+nN
 yZMdZY64nWxJVPZB0SCAOlUTH5twmTTiBED5UE5hPbENWW9DcZw36bq6wqgBpdq0jz8t
 uqKpBwdHL9RB2KOAsRr3OUvQFtcsynqaFCS381uXjrRB8hnvFdL6HDoOzgxzp3jPvW1t
 RMaD2xNA0wU4TLbDP9peu5iwOJLwHvNBrYUnqNocwRjXrH5b03BWGS/VqG/oddUGBKOi
 dDHwXNSmFLfr9AE2bz//vNo66RkAR8EPjmIloJxYyGtzS9Sbg2LpOOYUeAbLeHVyF+3F
 Soxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=14SEeU0UMLkgFlaB4KV5IS119VHrF2FPl2DRudjmlkA=;
 b=E51LkUkkJGjq9i9xBuRP3BahEu/kLjfq4UgOZJ0zjZICHfCeSYAOpho6+8xs7XZpPn
 iKJJFdd1yEF19ZnbtaPyKs3ca1U9/52vKWYSX/9mfqHGvSvgs/3pbGAd7iDX1by2AAs1
 NCF8jN5JE2hD7im5l0m0LEtz4jhgUB1spDYfoANS3dAY4I20AcvC72CrdPCTaXfDqr0Z
 W9hXpAWIY/FHEYODXv+KHUq0+NmV6Yc3AMg3Iq7uBSyj/rBbU8rEBsph2GvaWFfOW9k9
 6mYne77ShzNUstJic1c3bfLndd8OLoWjc6IPyf8SMC080G65W7TSm/fd9rXE7j8r7eUU
 juow==
X-Gm-Message-State: AOAM533gnzS4PCvJO9j+DuF7yPmY5MxTiuteMWqNPn7zoZUq5Phgylq2
 dnz0oOU8CRyFhcrPj6Phvx6yaPcQ1L8=
X-Google-Smtp-Source: ABdhPJzL4H2ED59Oy+no/zEyfvwGTPavmeNzbbM5+Ax1J8/DgQi2YKJPr5q9HGlcZ+pKukPEN3aKNg==
X-Received: by 2002:a7b:c947:: with SMTP id i7mr702373wml.179.1631534284490;
 Mon, 13 Sep 2021 04:58:04 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:58:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/21] meson.build: Do not look for VNC-related libraries if
 have_system is not set
Date: Mon, 13 Sep 2021 13:57:34 +0200
Message-Id: <20210913115742.533197-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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



