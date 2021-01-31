Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1DA309CA7
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 15:23:26 +0100 (CET)
Received: from localhost ([::1]:43162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6DdN-0005qy-Pe
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 09:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6DYT-0000zU-HH
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 09:18:21 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6DYS-0007cJ-4m
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 09:18:21 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m13so13750628wro.12
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 06:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=donqcXl7R+CymjCL8vc7v5IAilQU7H4mg0fNs68sCzA=;
 b=EL5L4ND35kWNG1I9b8z6kaSTxjuZlsxrL/gpCp3XKMsxXKuAviwff9mPbRwbvpb+EI
 JPGDHK3wvuulr3vBjWYj6XCKarU+KI8z9GK2YilFpVDuPGagHnSnlrAine3jtXDxdOCA
 n8YqAeS2QFNyyv2f66tg8pPROFQG19CpTi+9tVK1qGUiEfP3Xddc69G0Go0ma4jUYIiO
 N/RwCoTcHbtUQWiqTtkxUg/bcDsJiH6TcEW52YKAwbCHCLOtZIV0mt8fcASmiFdvGjWl
 QsNtU4sX5534e1nsWHqLUar5y3g2Q8g6k9AZnoG1G28tBldETFrYvvmgoAFikTCjfS7K
 FD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=donqcXl7R+CymjCL8vc7v5IAilQU7H4mg0fNs68sCzA=;
 b=DgoiGpZQOB/zvtY+5i3zaoo/xWZ+04WOLHivfp8rbd7KgPHJcQwUAht7ArJHWMKQ6x
 MpMNL0cFUraWWOq6/CccS+hfDpD5eapiOcUhIC0fPWYjoR5Jk/tnXyTml5A48ki+OBz9
 sCTVwKyizcM5ym67FEjaqyTz5HdmkRjEGKleSaAUBpnGsI7hIGDbmZSr/jc0ltqh6Phy
 YL3LSmSHr9i6xGmZpucax+0tG+bIplDmw7vdWElHp3Mb9MO4bGToclCjXfNBJpsDck89
 5Hr48yBETa15lC1Wk2jteWI07Wtiy0AD6ie8Lbt6rBeERHyYfmjyKr8BnMS9iPmMAc8E
 g5hw==
X-Gm-Message-State: AOAM530ndYauXos840HTps393eh7rsYAwaPZnYQnALK6CTY1L0Mcer18
 kfvQBP24PwiYhmofSIXTEf0=
X-Google-Smtp-Source: ABdhPJyBay95tlHd1UGHaPoVXUhxbE+HNEY0tZvPa16UvxrzZf4mNIYgk1tojlQ8w0VCrO1mzI4lnA==
X-Received: by 2002:a5d:5549:: with SMTP id g9mr14592028wrw.244.1612102698480; 
 Sun, 31 Jan 2021 06:18:18 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id r13sm19361075wmh.9.2021.01.31.06.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 06:18:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] meson: Do not build Xen x86_64-softmmu on Aarch64
Date: Sun, 31 Jan 2021 15:18:07 +0100
Message-Id: <20210131141810.293186-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131141810.293186-1-f4bug@amsat.org>
References: <20210131141810.293186-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Xen on ARM documentation only mentions the i386-softmmu
target. As the x86_64-softmmu doesn't seem used, remove it
to avoid wasting cpu cycles building it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index f00b7754fd4..97a577a7743 100644
--- a/meson.build
+++ b/meson.build
@@ -74,10 +74,10 @@
 endif
 
 accelerator_targets = { 'CONFIG_KVM': kvm_targets }
-if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
+if cpu in ['arm', 'aarch64']
   # i368 emulator provides xenpv machine type for multiple architectures
   accelerator_targets += {
-    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_XEN': ['i386-softmmu'],
   }
 endif
 if cpu in ['x86', 'x86_64']
@@ -85,6 +85,7 @@
     'CONFIG_HAX': ['i386-softmmu', 'x86_64-softmmu'],
     'CONFIG_HVF': ['x86_64-softmmu'],
     'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
   }
 endif
 
-- 
2.26.2


