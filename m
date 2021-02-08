Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4547031437D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:08:25 +0100 (CET)
Received: from localhost ([::1]:42224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Fdo-0006lx-38
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCV-0003OW-R5
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:55 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCU-0006CN-9Y
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:55 -0500
Received: by mail-wr1-x433.google.com with SMTP id g10so18424996wrx.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UN3/q0FStBl08Q7zutbVrS9Xuny8p3wSkBzZmAj2ntI=;
 b=ZDDQP73f/ctZLPfUYbR0v5zxB5MjodWpL1Yy5V99739zsyjpYfs0zR20C7rsvXVOkU
 48JAUFrWi1f3eCQex2FFjPb78pcbGCDO0v13pN5XVsgPE1tWxGZQHTCK4KHkzVjYYBGf
 o0yLG9wdPoHLXn38KaQCFurwVzOLL181Nhl9hQlReJVUSEFOAaE+ecRpACBTvXFpEn81
 SE6L8OjRibt1O279ZMU77aZn9Yx+0e1OCShRob3+aTBNwQPFJoKsl6/GHUu/gZJYkBB1
 8Kz55v9nBZAlyI3i1uWaOdhEGJmGTSqI3GnjSBTO+uTYyUIE8VLeUgjQTf0y7kANu9D/
 Q0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UN3/q0FStBl08Q7zutbVrS9Xuny8p3wSkBzZmAj2ntI=;
 b=Jv1PVhsFQiLnG8UEKor4tlfLjFRgpE0dkkRy3BORo64rL0H+s7Py6MWuoj5153rmZE
 AdHXvaqTplMHKbd40ZtnIFel1Zuw2YR7A02vFqvGT8tXKpaqfg2Kp1Zh/Y98NQDtHrnn
 tQu4dmpc6NPiV7rRoggq1lAPMqgShSHcD4FPB9rm3gReuSWM/xZV64s92Adyd9IuMj7z
 BwVi2MoIhXj5Wk0dgLuNb/gNKfongwf/loahRutD+z0/Pd0l39HPeXdWdMYey2D/r0jZ
 9XoHKZc+woZL1ojqSOyYbbyBsTy+ecC6KvwbYuzMCcNhNQkeUvddrslUnWPQE4ajDYoh
 tgmw==
X-Gm-Message-State: AOAM531x5zygBAQmX4q/mWji9t5W01ehCP/Pt5XDAZG23EaHO9Rjucs1
 UXhwnxQxUL9wpuTH2CGPKLi2TxtDXjcwkg==
X-Google-Smtp-Source: ABdhPJwzqdBV3upp4NL5Xo3Imc2ToUnTjKbkIdXp3nUo7bfq0rJgKi7wuGumDEXnPPYTqQoQmv1SYw==
X-Received: by 2002:a05:6000:11c5:: with SMTP id
 i5mr21467735wrx.302.1612808633017; 
 Mon, 08 Feb 2021 10:23:53 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/46] meson: Warn when TCI is selected but TCG backend is
 available
Date: Mon,  8 Feb 2021 19:23:06 +0100
Message-Id: <20210208182331.58897-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: =?UTF-8?q?Daniel=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Some new users get confused with 'TCG' and 'TCI', and enable TCI
support expecting to enable TCG.

Emit a warning when native TCG backend is available on the
host architecture, mentioning this is a suboptimal configuration.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Suggested-by: Daniel Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210125144530.2837481-5-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meson.build b/meson.build
index 3a13ba3307..4cc3ebb827 100644
--- a/meson.build
+++ b/meson.build
@@ -231,6 +231,13 @@ if not get_option('tcg').disabled()
     else
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
+  elif get_option('tcg_interpreter')
+    warning('Use of the TCG interpretor is not recommended on this host')
+    warning('architecture. There is a native TCG execution backend available')
+    warning('which provides substantially better performance and reliability.')
+    warning('It is strongly recommended to remove the --enable-tcg-interpreter')
+    warning('configuration option on this architecture to use the native')
+    warning('backend.')
   endif
   if get_option('tcg_interpreter')
     tcg_arch = 'tci'
-- 
2.29.2



