Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D0164E93E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 11:16:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p67kW-0000Ev-2J; Fri, 16 Dec 2022 05:15:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p67kL-0000E3-1D
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:15:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p67kI-0003jD-FP
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:15:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671185710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UUQU3z+7mm9jDbX62tkp0yPYmJk5AZgplqBgQFHgKds=;
 b=gxO1ZcLH7Zb94PpsiBwWgCdkeaZpulrF5qUf9XclTIaVQlfMqf2gclULuEtWmTjLxDOCFn
 Pe+2o2ZDs4saCXz8XhGLwFri2gMUd7cd6XiRW4GlkXamrzECtbD/rKnxuWoZNHl4vQdP0K
 6E7a+Qp+n3cbNY6rQ4qF8Isx13NZqHE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-671-oW2r7pgKP0qChQPPeqUafA-1; Fri, 16 Dec 2022 05:15:08 -0500
X-MC-Unique: oW2r7pgKP0qChQPPeqUafA-1
Received: by mail-ej1-f72.google.com with SMTP id
 xc12-20020a170907074c00b007416699ea14so1493500ejb.19
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 02:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UUQU3z+7mm9jDbX62tkp0yPYmJk5AZgplqBgQFHgKds=;
 b=QtAN0gGKyZm8wMRAiTW9jbVJAHwH53LhwumGoe+rcECav7Cra1LSMqL05tcGZDmUAk
 Ufrm3ldojWpI+Q5/mPIIfi0aajEtdAFZXtEufs3aDLWMQw0DLXj2RUYG2WYkETb0GfzH
 KtmKCmnYuwKEFCn5PU6zAzW3fsp5BHSA0HwuriqriMr0XPaQYuX+jsZwB1EMHggXmaF0
 h2Eev6FfAq+lwasixxPzFW2j2yo0Y7/7+hMqHUNlbZj9Frqh8u+qVmNGn8/e40N5PIwe
 0wIIJ+lfn3XAGANlyB7lnhlqAD2f1gUNwVGDBGutjhRruYE1EVf+iH9IS2kxnJaDWCsH
 nUKQ==
X-Gm-Message-State: ANoB5pkbhBduLF67WrNxHa4N9/IxgURp1UV9Zuw/ONPQXwKUz9fABWX+
 1yKgbVfRceTAKPfcKrS7S3tGEWim92Agqs3gB52CNJZt7JKxIHHSnxPACavwnhzX5FRib4OOKVq
 s6wIYzZAQEuxPfgIl9qFsdKjs8UnCt6Shg0zzEKwuIGO/6JelWy7Co5QVXUptppTFguo=
X-Received: by 2002:a17:906:714b:b0:7c1:6986:2b7c with SMTP id
 z11-20020a170906714b00b007c169862b7cmr19965983ejj.8.1671185706493; 
 Fri, 16 Dec 2022 02:15:06 -0800 (PST)
X-Google-Smtp-Source: AA0mqf77nCaUPMesBdmX6U+/00qlCv3VF4ILkJUjpuE+F4K0GUORbEETCQb3LiosIhA/XYi5Y6mkEw==
X-Received: by 2002:a17:906:714b:b0:7c1:6986:2b7c with SMTP id
 z11-20020a170906714b00b007c169862b7cmr19965963ejj.8.1671185706069; 
 Fri, 16 Dec 2022 02:15:06 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:cdd2:bd6:b053:4614])
 by smtp.gmail.com with ESMTPSA id
 q26-20020a170906b29a00b007af0f0d2249sm689908ejz.52.2022.12.16.02.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 02:15:05 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@gmail.com,
	qemu-stable@nongnu.org
Subject: [PATCH] meson: accept relative symlinks in "meson introspect
 --installed" data
Date: Fri, 16 Dec 2022 11:15:03 +0100
Message-Id: <20221216101503.524181-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When installing shared libraries, as is the case for libvfio-user.so,
Meson will include relative symbolic links in the output of
"meson introspect --installed":

  {
    "libvfio-user.so": "/usr/local/lib64/libvfio-user.so",
    ...
  }

In the case of scripts/symlink-install-tree.py, this will
be a symbolic link to a symbolic link but, in any case, there is
no issue in creating it.

Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/symlink-install-tree.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/symlink-install-tree.py b/scripts/symlink-install-tree.py
index a5bf0b0d6d7c..67cb86dd523a 100644
--- a/scripts/symlink-install-tree.py
+++ b/scripts/symlink-install-tree.py
@@ -17,7 +17,6 @@ def destdir_join(d1: str, d2: str) -> str:
 out = subprocess.run([*introspect.split(' '), '--installed'],
                      stdout=subprocess.PIPE, check=True).stdout
 for source, dest in json.loads(out).items():
-    assert os.path.isabs(source)
     bundle_dest = destdir_join('qemu-bundle', dest)
     path = os.path.dirname(bundle_dest)
     try:
-- 
2.38.1


