Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FB0308889
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:48:26 +0100 (CET)
Received: from localhost ([::1]:37926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SGH-00072y-Oo
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:48:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5Rna-0004qp-6r
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:46 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnY-00066c-MD
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:45 -0500
Received: by mail-ed1-x52e.google.com with SMTP id j13so10149161edp.2
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HeLrWSEt6vvAQuhrLqgMFFnKDJsj3Kb9xwacLVjZJkg=;
 b=f9hClCCjVnZsfGfJJAbqEgzJ1V+/Z8CywcK65tjg7orWb3VbRJhdv/hR0bDBpGha/i
 fazfRghu9f3Yt1Pcm1sigjMHaHkp20w9IREfat0JEgBk27xOGpFqQRSLQMEOkrJWzyBI
 bk2FMB9s8y4s6c3b9VfzW9DDrbbxWpj1dLLrs0CvzI77d6L9hMVgrFJcph0F4P67Zlc5
 c4pVFr4QOT8fH2X5HapKJxwI3WtPHDRvvT4Q2QH6Krj7B+SHK13CR0JfVBPdg8JiT2H+
 X3gQBBm3Wu1KbHwyUn/ZW7rne2HcGF96jL4+w/mEvPexZe5RdAl7ceTEe4+xAv0F8eQY
 3VlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HeLrWSEt6vvAQuhrLqgMFFnKDJsj3Kb9xwacLVjZJkg=;
 b=p+VDU5KLtC1djjEGzcEPvY82eorXAiVNL87rTSx1cB8V8QX9CXBKspuLsR9+L9KLKp
 dcCF267pdzA6Y9gFTifnbyQjgt2zwpimIq5WjQl5XqRw0qrI8DRRiYbSrI+oTlGApxaC
 Ob4T0sf/AotemG1pV01yMB+o4EuWsYX48GE+xStUHHuReKh3CoH+gn8nFxt1r+zCOYsO
 PYD0TKeWg+2Y9z1tFw4TK/I1duu87sjtthucwE9rDIvKmve8i7s1CvEa1KBUF76ES/Ms
 4NdZ7NClQhiY9za2hRUuIiwEYdIHcN0pBI+yEpyn4dhNWbwsnukEqzMO+HmDO6q5s2Rj
 qgJQ==
X-Gm-Message-State: AOAM532knJ+bwRyVT6nuN/aiInFI6sQt/jILAQyyRy5Fefas8EMIHQom
 Na8juP6PfOanwh2Q8FgCWIVM6fdA4EsbwA==
X-Google-Smtp-Source: ABdhPJxRkjYRILWNPhhquEjFS5oW2vPehAIwON7/TbVf2y7mHTJS0eamGXTzZsN2Y/X+gyHV6imOCA==
X-Received: by 2002:aa7:da98:: with SMTP id q24mr4526918eds.370.1611919120583; 
 Fri, 29 Jan 2021 03:18:40 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/36] meson: Merge trace_events_subdirs array
Date: Fri, 29 Jan 2021 12:18:06 +0100
Message-Id: <20210129111814.566629-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
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
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The trace_events_subdirs array is split in two different
locations, merge it as one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20210122204441.2145197-7-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/meson.build b/meson.build
index 0bebab037c..ec1a9ed0e8 100644
--- a/meson.build
+++ b/meson.build
@@ -1661,7 +1661,20 @@ trace_events_subdirs = [
   'accel/kvm',
   'accel/tcg',
   'crypto',
+  'hw/core',
+  'qapi',
+  'qom',
   'monitor',
+  'target/arm',
+  'target/hppa',
+  'target/i386',
+  'target/i386/kvm',
+  'target/mips',
+  'target/ppc',
+  'target/riscv',
+  'target/s390x',
+  'target/sparc',
+  'util',
 ]
 if have_user
   trace_events_subdirs += [ 'linux-user' ]
@@ -1734,21 +1747,6 @@ if have_system
     'ui',
   ]
 endif
-trace_events_subdirs += [
-  'hw/core',
-  'qapi',
-  'qom',
-  'target/arm',
-  'target/hppa',
-  'target/i386',
-  'target/i386/kvm',
-  'target/mips',
-  'target/ppc',
-  'target/riscv',
-  'target/s390x',
-  'target/sparc',
-  'util',
-]
 
 vhost_user = not_found
 if 'CONFIG_VHOST_USER' in config_host
-- 
2.29.2



