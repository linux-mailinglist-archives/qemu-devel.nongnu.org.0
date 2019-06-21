Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAAA4E7E7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 14:19:18 +0200 (CEST)
Received: from localhost ([::1]:60686 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heIVh-0006UI-8X
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 08:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49159)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1heHki-0000nm-MY
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1heHkf-0005x4-FP
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:44 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45652)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1heHke-0005qQ-Fm
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:41 -0400
Received: by mail-wr1-x431.google.com with SMTP id f9so6190291wre.12
 for <qemu-devel@nongnu.org>; Fri, 21 Jun 2019 04:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HWP1ufHEPv6v1c0xa0Nf5LyDIweD+0VGMlRLkFfhXBk=;
 b=jwmQLb558yMNTSCC1JxVy+VjofeQO+iOJq5GQgPpnQr90Znn39sthCoNfFRINNEpw5
 +3lPwf2k+PMhjz0ZUxBcKp4+S+10Hj3jtmuTRFyXD/bwMXzPgKV94n7DzL7EXM6tU3VF
 B41Q4eBR1uEI8Z8YaRL29m0SbfPexjDBbpd4jOffU/h0T5QGYhZyM0uUlp7Nvx8zxMg0
 iWwtMzdO1CIYFU95O11iKFQn1wlZgH5nrR0YKByXmRudIQHgGCDz1yh4lOTaBEPBen1w
 1rI7FcHUhWIr/oWKIaLY5h7DhK0vdIqJAETuB5gD2GsnEeN6+BSvtXwEmKyvyuk53eXL
 uQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=HWP1ufHEPv6v1c0xa0Nf5LyDIweD+0VGMlRLkFfhXBk=;
 b=DPJOXtzFD0g4OTrhjnE4v67QM8drW7mzjICbp/4T7jtCXpkc8j3bT2yaphRjHoSYYb
 VccCL41JfJhcrTMrGPJ+AysX3zMX0B6+xrs2YrOW+KokEMBAqIcjpisTm+IWTp7IIX74
 0didQH/VOyF4CiYfJ+RqUt/cvKEbmn/SHPtufDtw/LqVKA7FIUjKr89/tWATlpCtTO9L
 7c3C/ywlTcE8uy8aZ3/+Fpunzg4z8qqcZ8qeyMv/zmDNkS44UZ0OG3w1yfN4eFX1Np43
 eQefyDZGf83QjGe9xL764wzjcUHhWcDOLg/qV4lcfUsMpP99oGgkRNIUOAcSfEjaf5BT
 2SxQ==
X-Gm-Message-State: APjAAAUc26vtLfLzmsOwf0ZvgyyZ8zRf/HnjXfKrdOo8Hl/1S8wYmvLP
 C76TT/wleyXqDx3enVlWoDnDqfdI
X-Google-Smtp-Source: APXvYqyoKuwyjDWAb/MmD5o+F6LNuQfOm/l0GkSmXK1SqUlrbWo5TurVvtN2jguyXEju8yf13/lhyg==
X-Received: by 2002:adf:c541:: with SMTP id s1mr81085189wrf.44.1561116637325; 
 Fri, 21 Jun 2019 04:30:37 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id r3sm2712851wrr.61.2019.06.21.04.30.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 04:30:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 13:30:10 +0200
Message-Id: <1561116620-22245-16-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561116620-22245-1-git-send-email-pbonzini@redhat.com>
References: <1561116620-22245-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::431
Subject: [Qemu-devel] [PULL 15/25] target/i386: kvm: Use symbolic constant
 for #DB/#BP exception constants
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
Cc: Liran Alon <liran.alon@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liran Alon <liran.alon@oracle.com>

Reviewed-by: Nikita Leshenko <nikita.leshchenko@oracle.com>
Reviewed-by: Krish Sadhukhan <krish.sadhukhan@oracle.com>
Signed-off-by: Liran Alon <liran.alon@oracle.com>
Message-Id: <20190619162140.133674-4-liran.alon@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 26d8c61..c763643 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -3345,9 +3345,9 @@ static int kvm_guest_debug_workarounds(X86CPU *cpu)
     unsigned long reinject_trap = 0;
 
     if (!kvm_has_vcpu_events()) {
-        if (env->exception_injected == 1) {
+        if (env->exception_injected == EXCP01_DB) {
             reinject_trap = KVM_GUESTDBG_INJECT_DB;
-        } else if (env->exception_injected == 3) {
+        } else if (env->exception_injected == EXCP03_INT3) {
             reinject_trap = KVM_GUESTDBG_INJECT_BP;
         }
         env->exception_injected = -1;
@@ -3859,8 +3859,8 @@ static int kvm_handle_debug(X86CPU *cpu,
     int ret = 0;
     int n;
 
-    if (arch_info->exception == 1) {
-        if (arch_info->dr6 & (1 << 14)) {
+    if (arch_info->exception == EXCP01_DB) {
+        if (arch_info->dr6 & DR6_BS) {
             if (cs->singlestep_enabled) {
                 ret = EXCP_DEBUG;
             }
-- 
1.8.3.1



