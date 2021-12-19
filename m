Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E198447A0E1
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 15:22:44 +0100 (CET)
Received: from localhost ([::1]:49088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myx5H-0006DN-Vs
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 09:22:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx05-00067U-JV
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:21 -0500
Received: from [2a00:1450:4864:20::52e] (port=38626
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx04-0005xA-6S
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:21 -0500
Received: by mail-ed1-x52e.google.com with SMTP id bm14so14942499edb.5
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 06:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BIxwQuAPeVNqTRU5r1xi3JNwh0IzfkblBxaFtKzuKjA=;
 b=pPXuD2rf9gCJgPVaAjZg1b9CSnSC2RmCG4uYbd7AvtWP/KQTQX6Zo6kbVM4UttsyBW
 WaG3FJ3Tl+iYpY4FZ0lCv/l8HrMg2C6DWVnnEa01/NaZ7ApMrzRMLeIhrSkDl9+Wm3a2
 fiZnC2BLAXAV4NHdn2H4VuoiJkKaGAKhGchVWGbSfZMfakZcRcJtEaWnpCqWgoS5Vcnc
 Mpg40/8HcHGrf9qkSFzb52hd/0lyjskzap9j2mBuehuYQ1FgSZF4rpDRt6wh8HoGsRg9
 9WfyQS51woy3GXWMzsfj+kUrKqgWBkF8uL6MWOlApg1v2s7oEjaxtL5mtG/tVvV+ZEwl
 eWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BIxwQuAPeVNqTRU5r1xi3JNwh0IzfkblBxaFtKzuKjA=;
 b=WG4FOoql5vapSTvRoONcFQ2tkcl1KlfTEULY3Al9VwxrzG7jXjVTmEEKIjjdLrPURz
 T+nbbh54K0Y6kUFp2DgeiovT0/Bd5LmatdBNe4JIR/aU5vEGTifxGzxTm1FtV9nHV7qu
 3HqOlkhIc7gv5S+vCDzHgrb4eZ1GRaEvTNlUwujW5C1Q6MG31Z7VATdvpLLch7W7itDH
 2nNSqXvENQITtxP8NexPkqswWIWJZDVfvyHhaC5iTnmSHqUqnreQXj6LuCuH24Ds+cHI
 5Vlld/o0bLOqcKMLjRX8LBVfVDdCgIcPMwsCdw4X0lW0H+7xXjqDgN2oUTVsJAbTy80C
 gXYA==
X-Gm-Message-State: AOAM533DvUiEBQj/KcUCe3UOdI+tLE+ibpq6jj49KEVOd306Ps8y9snJ
 zU/ZlcNVTuO788KHRrHtdfkP/F3pU5s=
X-Google-Smtp-Source: ABdhPJxHIqqfgKrvzYqHvkd73quP84vKu9Ay7lXh5wmk9iWwciq/xxx2EV9/8q7WDgZ2hEhjRBeM2g==
X-Received: by 2002:a17:906:9b8e:: with SMTP id
 dd14mr9897343ejc.337.1639923438999; 
 Sun, 19 Dec 2021 06:17:18 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id hq9sm4570665ejc.119.2021.12.19.06.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 06:17:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/16] configure: unify x86_64 and x32
Date: Sun, 19 Dec 2021 15:17:00 +0100
Message-Id: <20211219141711.248066-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219141711.248066-1-pbonzini@redhat.com>
References: <20211219141711.248066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only difference between the two, as far as either configure or
Meson are concerned, is in the multilib flags passed to the compiler.

For QEMU, this fixes the handling of TYPE_OLDDEVT in
include/exec/user/thunk.h and enables testing of dirty ring buffer,
because both are using HOST_X86_64.

For tests/tcg, this means that on a hypothetical x32 host the
cross compiler will not be used to build the tests.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 6 ++----
 meson.build | 3 +--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/configure b/configure
index 85caf2e9ef..108b7621e2 100755
--- a/configure
+++ b/configure
@@ -647,6 +647,7 @@ case "$cpu" in
     cpu="i386"
     CPU_CFLAGS="-m32" ;;
   x32)
+    cpu="x86_64"
     CPU_CFLAGS="-mx32" ;;
   x86_64|amd64)
     cpu="x86_64"
@@ -3719,7 +3720,7 @@ fi
 if test "$linux" = "yes" ; then
   mkdir -p linux-headers
   case "$cpu" in
-  i386|x86_64|x32)
+  i386|x86_64)
     linux_arch=x86
     ;;
   ppc|ppc64)
@@ -3901,9 +3902,6 @@ if test "$skip_meson" = no; then
         i386)
             echo "cpu_family = 'x86'" >> $cross
             ;;
-        x86_64|x32)
-            echo "cpu_family = 'x86_64'" >> $cross
-            ;;
         *)
             echo "cpu_family = '$ARCH'" >> $cross
             ;;
diff --git a/meson.build b/meson.build
index ae67ca28ab..69cca2aa9f 100644
--- a/meson.build
+++ b/meson.build
@@ -355,7 +355,7 @@ if not get_option('tcg').disabled()
     tcg_arch = 'tci'
   elif config_host['ARCH'] == 'sparc64'
     tcg_arch = 'sparc'
-  elif config_host['ARCH'] in ['x86_64', 'x32']
+  elif config_host['ARCH'] == 'x86_64'
     tcg_arch = 'i386'
   elif config_host['ARCH'] == 'ppc64'
     tcg_arch = 'ppc'
@@ -1806,7 +1806,6 @@ disassemblers = {
   'hppa' : ['CONFIG_HPPA_DIS'],
   'i386' : ['CONFIG_I386_DIS'],
   'x86_64' : ['CONFIG_I386_DIS'],
-  'x32' : ['CONFIG_I386_DIS'],
   'm68k' : ['CONFIG_M68K_DIS'],
   'microblaze' : ['CONFIG_MICROBLAZE_DIS'],
   'mips' : ['CONFIG_MIPS_DIS'],
-- 
2.33.1



