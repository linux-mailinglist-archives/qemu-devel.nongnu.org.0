Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF1A3142C7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:23:27 +0100 (CET)
Received: from localhost ([::1]:55316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EwI-0003QV-RY
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:23:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCf-0003aI-42
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:05 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCd-0006GP-90
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:04 -0500
Received: by mail-wm1-x330.google.com with SMTP id t142so60677wmt.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9zWdC2+7ESQ0VUa3YczOXMruS8QmkVmg52KY1iiEtVQ=;
 b=okw/rVd6onE/CUcxPjVKfsr40f7U34xqm/3RENsmjAeMX/nn5C5aR8y1mMPEQH6Rbx
 fBajPpE+zMGXBef5fWvfILY9nkJuTOyAfc2cgnaNvuEXxCU8FhMmnNVHIL5Gm9MdCqtk
 0cIYvJC+P0Reo6pSA9SWD1x1MsxT0AxA7MDjEIrmLC0+qP3vswe7AuYWjUHTxrsp/Bn4
 jshRHDf+P5gYSt+SrdXTAcAJX1lRg/lY2R6P9ZvBwzuxJeiMZnvbOFQiGCGJA4JxxdFo
 LJoSwf3q1hsJDNolodcLJU5H/V+IjDANiDVreaALPN/ZX/B+E/aCWR7A11RZnMSqUi/G
 gOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9zWdC2+7ESQ0VUa3YczOXMruS8QmkVmg52KY1iiEtVQ=;
 b=gyEzsOrHtNZbz/y+PPtRPsV4uxatPSlZgUw4JtP95O1lJNY2KOvDhVm94DUqpbL0YC
 AYumoBlardAfTuwU2GSY5Z8MWJjoTVtmeUORaCONnPA1teksnNvzZITSXr7v07rgYXYX
 xhIIt8rieCvdRAGiH73uMFQo5dKTqKdiePJjld4gb3PZAl19pQAzSc3cuM32512UG8MM
 b4JVDU15kdESfx8RUclwY073Vky5L8m23wI+I//eYnpEBPv5poa2TkLVTrno3FO8g/wf
 ePqH4SuR+MHukK016Gt0AEj1eznVWu+kTQ5HDjtBGm1+DjgrIinrSTYcB2TEnrHpZk7P
 vYiA==
X-Gm-Message-State: AOAM53124LgB5xJmjjCFQWI+3Vz07hE+wlMOuc8oNW/H/UFrb/ZFS0AH
 0nSHZQ/4IscmpifXsH0Tp0C0y/aoSLE1Nw==
X-Google-Smtp-Source: ABdhPJz351JP21iufSwecB/TXtHKuqwfku2QbvK05XYa8qQzTWJ67+DkTVtp2futLpdFtPTv0edVUw==
X-Received: by 2002:a1c:dcd7:: with SMTP id t206mr85820wmg.108.1612808638339; 
 Mon, 08 Feb 2021 10:23:58 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/46] meson: Restrict emulation code
Date: Mon,  8 Feb 2021 19:23:12 +0100
Message-Id: <20210208182331.58897-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210122204441.2145197-9-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index d6eb880b89..e3ef660670 100644
--- a/meson.build
+++ b/meson.build
@@ -1867,16 +1867,18 @@ libqemuutil = static_library('qemuutil',
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
-decodetree = generator(find_program('scripts/decodetree.py'),
-                       output: 'decode-@BASENAME@.c.inc',
-                       arguments: ['@INPUT@', '@EXTRA_ARGS@', '-o', '@OUTPUT@'])
+if have_system or have_user
+  decodetree = generator(find_program('scripts/decodetree.py'),
+                         output: 'decode-@BASENAME@.c.inc',
+                         arguments: ['@INPUT@', '@EXTRA_ARGS@', '-o', '@OUTPUT@'])
+  subdir('libdecnumber')
+  subdir('target')
+endif
 
 subdir('audio')
 subdir('io')
 subdir('chardev')
 subdir('fsdev')
-subdir('libdecnumber')
-subdir('target')
 subdir('dump')
 
 if have_block
-- 
2.29.2



