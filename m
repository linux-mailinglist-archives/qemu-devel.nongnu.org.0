Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC6F3D26F9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:44:30 +0200 (CEST)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6as4-0002q9-Rw
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akN-0000g8-Q7
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:28 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akK-0002mI-8u
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:26 -0400
Received: by mail-ed1-x530.google.com with SMTP id dj21so7359404edb.0
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pxsn2XHOgcR9z+0i+A4IJbWQ2gbXQ+Upy2E7J0F0AL8=;
 b=PgxeTG7wdmQ8mCcMYVGlJhoi0geWBcjhWRMF4fRf8pFG15TfEQzjka7PvD5jt3nUX1
 QdIDm+idgpZ82MnGMYoHic715QMWEgrxJo4G1pLisVl4ehFE6JKOxmb1p0D/TXo83A3G
 aKrfdZ8oCaYgw+ivDa+UZzxCnfDkyCNNEpHlVI0nV0cW2Gez8tRSnF/pipKG4TzGNR8w
 q7iCkyo5QNEtZ6Uuymsjqkwo/khGfMVlOfLQsJCq/c26ZhPbqM7Aj30TnwnrxW5KNuIN
 MpmYjl4oWVX6+wBTY8QRPA0VGjL8Q1k6vk1DU8JXuxVQYHDWr2kfhf759G7IRdVIimJc
 WWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pxsn2XHOgcR9z+0i+A4IJbWQ2gbXQ+Upy2E7J0F0AL8=;
 b=RlIDqfpcfWRTQYamMu5LR6OjsnrFRvWuiI+cKwcV/tAD/zkff+/Nujtj2zHZGEM/5l
 Z6KWBpQ/i3xwumeqpwAHzew/uqb+C0YkPlXUi7plHbi+2gA1p2g8XP03hhbNGnRaDBWe
 6R0VfuaSuj4vVBhfpl8tMXlZ3BGDJT7c4LtiW+ofnWjVUr07njHhnNQ1IVOdhh4JtVfB
 2yDkIo+uN7ItAzvg3IVRdqF/xQRr0X7DFbh4zU/Zz5AGQhe8a8cfAwAmnXeVrq5ailmk
 tEoOCbmP4wWAoMHgkAY/Fwp4wGnIRppdef3o73BDC0HtlxyR+sOj/hfXRXM9l4Kqc4Zo
 F1dQ==
X-Gm-Message-State: AOAM532INiyC+IF8TGx33dTYQc7JEJ44cGcED3ltEkty76sHsYwiTKZJ
 ROSnKyRgyZfejC2y9lFQ6d2q/PVxkK6hGQ==
X-Google-Smtp-Source: ABdhPJyoe4cA2cAZ+3fm80oHgjWr4l59KZD0+i1AhlBOYQXSX8LpGemk/mB5W6Wuu1oFNzZcHx9mLA==
X-Received: by 2002:a50:fe97:: with SMTP id d23mr231235edt.169.1626968182966; 
 Thu, 22 Jul 2021 08:36:22 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qo6sm9638628ejb.122.2021.07.22.08.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:36:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/15] configure: Allow vnc to get disabled with
 --without-default-features
Date: Thu, 22 Jul 2021 17:36:10 +0200
Message-Id: <20210722153612.955537-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722153612.955537-1-pbonzini@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

There's no reason why we should keep VNC enabled when the user
specified --without-default-features.

Reported-by: Cole Robinson <crobinso@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210713093155.677589-3-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 2 +-
 meson.build | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 19c4bc1192..468aac58e2 100755
--- a/configure
+++ b/configure
@@ -304,7 +304,7 @@ virtiofsd="auto"
 virtfs="auto"
 libudev="auto"
 mpath="auto"
-vnc="enabled"
+vnc="auto"
 sparse="auto"
 vde="$default_feature"
 vnc_sasl="auto"
diff --git a/meson.build b/meson.build
index eb85fe8e44..cb3856fc35 100644
--- a/meson.build
+++ b/meson.build
@@ -930,7 +930,7 @@ vnc = not_found
 png = not_found
 jpeg = not_found
 sasl = not_found
-if get_option('vnc').enabled()
+if not get_option('vnc').disabled()
   vnc = declare_dependency() # dummy dependency
   png = dependency('libpng', required: get_option('vnc_png'),
                    method: 'pkg-config', kwargs: static_kwargs)
-- 
2.31.1



