Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930FE3088EE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:14:04 +0100 (CET)
Received: from localhost ([::1]:40850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Sf5-0006Q8-MH
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:14:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5Rnb-0004uA-Ko
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:47 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnY-00066i-PF
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:47 -0500
Received: by mail-ej1-x62a.google.com with SMTP id rv9so12391391ejb.13
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X8GWjMLlCcKpCwU19YuwWH2vJ6BIXRt7o+YeyX8PkM0=;
 b=Wl1OmEoJk95AUBcdwCcUDU96xM41RUBqoO4ocidhZGwJxayV0DrxPjSBZHyogPRUuq
 w1gIpY3szYuRI57PWMdcOyWzbc6VKuY2HrTpqoQUGIJKoInGh8FT2bG/yy5bzaIUtTV2
 +SNyMUc5PQNS3xz+62lJyJFpbZT0FRDhWIz61dwLyoGiMiQYxSDrs8FF8Cuq4fyDRtQN
 GgskPv9HGDJc+SRRjImdt7Gg9v5DQ45sr3qczKErzgSSlZKuAZNMpd56+3Zk7rd88J+8
 aemBafkn0c+BzR74aFt/JL9cD0rs5hnmwDfHG39fUKcftFzUE9cxY/NJRO4Fm9PgPDF+
 o6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X8GWjMLlCcKpCwU19YuwWH2vJ6BIXRt7o+YeyX8PkM0=;
 b=bWdsiFmtgrkxonfTP6Q+fRcA5/m4EmEHWP4it6nenKagcnAsHOQPJVnwfjvikJO9U6
 uJGZ/wP+RavaqaNEJhOmqDbXVzHsAB+EBwRfwGFB1l/++0t3G4a8Kr4l019Z1vEoOdlX
 1PsVPR9hW51JHOopm3BiC0b/8P0lF4dMTkFymdXrjFUrlVHdKnPHaj5zMbLyUradgxru
 YahZxoSHKtZFPMI6b6DsCsJOnY7bPEJ61smfUY5LDr22vgS2f9lQEXWcenmtwscVgnk1
 XC/E1xQ+OUSM7A9qri3NJXhvu2DtKdUp/kI4JryTTle+fqHcmq2pOzSU4aAQTg2ls7CD
 v51w==
X-Gm-Message-State: AOAM532bVErkPMf9R1UjYHk6mifCy17JbkHXylvg65mk5ONgAW7NDlBS
 WSl2KK+JizglFunRY9O+VQQrstXHM+wlzA==
X-Google-Smtp-Source: ABdhPJxqo/LMmD1pL/bUwWhBR77fr8hzTcVcOVC3+lPwzMtkZqDol+HVQAyFuIot3DB4aA1ldzfMbw==
X-Received: by 2002:a17:906:fcce:: with SMTP id
 qx14mr3972828ejb.220.1611919121399; 
 Fri, 29 Jan 2021 03:18:41 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/36] meson: Restrict some trace event directories to
 user/system emulation
Date: Fri, 29 Jan 2021 12:18:07 +0100
Message-Id: <20210129111814.566629-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210122204441.2145197-8-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/meson.build b/meson.build
index ec1a9ed0e8..a9dbd2a0db 100644
--- a/meson.build
+++ b/meson.build
@@ -1658,22 +1658,10 @@ target_softmmu_arch = {}
 # TODO: add each directory to the subdirs from its own meson.build, once
 # we have those
 trace_events_subdirs = [
-  'accel/kvm',
-  'accel/tcg',
   'crypto',
-  'hw/core',
   'qapi',
   'qom',
   'monitor',
-  'target/arm',
-  'target/hppa',
-  'target/i386',
-  'target/i386/kvm',
-  'target/mips',
-  'target/ppc',
-  'target/riscv',
-  'target/s390x',
-  'target/sparc',
   'util',
 ]
 if have_user
@@ -1690,6 +1678,7 @@ if have_block
 endif
 if have_system
   trace_events_subdirs += [
+    'accel/kvm',
     'audio',
     'backends',
     'backends/tpm',
@@ -1747,6 +1736,21 @@ if have_system
     'ui',
   ]
 endif
+if have_system or have_user
+  trace_events_subdirs += [
+    'accel/tcg',
+    'hw/core',
+    'target/arm',
+    'target/hppa',
+    'target/i386',
+    'target/i386/kvm',
+    'target/mips',
+    'target/ppc',
+    'target/riscv',
+    'target/s390x',
+    'target/sparc',
+  ]
+endif
 
 vhost_user = not_found
 if 'CONFIG_VHOST_USER' in config_host
-- 
2.29.2



