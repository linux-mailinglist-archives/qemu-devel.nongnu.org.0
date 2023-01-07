Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E54660F3B
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 14:42:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE9RX-0005FA-3t; Sat, 07 Jan 2023 08:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pE9RU-0005EV-VB
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 08:41:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pE9RT-0002sY-2G
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 08:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673098857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lsotlKgI1bmgTWTvhY3ujDrNOOpUg7MBN58SNrn1JEU=;
 b=QVqxJQVzP0PK0DXPadvzsNA5DSRH1RTNq8DZx8s3X96EVvnrjs+mzea7gKD09yKHutMSsW
 j3GKsNMocGi2npishy3skwfzzdLv75NTABsu9gDu3kv/hi/myVOjPmK++8SlfZmHS4c6mG
 RR6YzX5yZL2aA+XwX8icJDyWIJInSrY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670--sNQNxa1NQO1afn2xLeY5g-1; Sat, 07 Jan 2023 08:40:53 -0500
X-MC-Unique: -sNQNxa1NQO1afn2xLeY5g-1
Received: by mail-wm1-f69.google.com with SMTP id
 fm17-20020a05600c0c1100b003d96f0a7f2eso4270725wmb.6
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 05:40:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lsotlKgI1bmgTWTvhY3ujDrNOOpUg7MBN58SNrn1JEU=;
 b=ciHEaUrK/nl2EjKrOkmkSdFP2+cQu+P8UP3JO1IxHmsEaQhCCrEk55/ipeDunc69D3
 kHWmJNqBb3U3cdMlxlAznjn97x4x8f4aQVYRcu6sN75erW8iM0nv6uOETUMGuO+ZrrzE
 nAWsZ5J9JUQwvGFdh4tfRAabK9e11JfEsbQ1AEWi8OsxLxkvA+FP7XIzFw0Z3vJT791H
 X6thi1T1chDV6Tw7mQOuIieZQ1G0jxxCx0/KdgC+DD1/hkq/VQAnbdWZ85InMoKT/9Zl
 XXNHB7Fxvtlhs3uc51N6SwfaOoMnxse3np5m1kzFXhFFJmx/BuxS83/h9Cl7V4Oon8IS
 0SPg==
X-Gm-Message-State: AFqh2krwrukjSq5QBS+lT8efi+L+5QrnK2yAyTqV8QcJwmR0/GIsbRNH
 AiklxlXdtohUW7cgfMX8xo2qYICQRLAFPdjf9RLJC9znc/rWdzBSCnKivDyQCsRcihripPsjLJ5
 hE/enobcGThXwKN2yEzMbJsPdI6MfWMUZXY6nVSmCvdVt4aBo1QREsD51CLYH0my1m+I=
X-Received: by 2002:a1c:4c12:0:b0:3c6:e63e:89a6 with SMTP id
 z18-20020a1c4c12000000b003c6e63e89a6mr41934859wmf.2.1673098852297; 
 Sat, 07 Jan 2023 05:40:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXugqhok9N4tHJbw0pEcZz7iBR+kdFNXQjCoo5lx61UcWJ3GrNaKzY3GLa1Jd2jxG9IyxOlK3A==
X-Received: by 2002:a1c:4c12:0:b0:3c6:e63e:89a6 with SMTP id
 z18-20020a1c4c12000000b003c6e63e89a6mr41934848wmf.2.1673098851927; 
 Sat, 07 Jan 2023 05:40:51 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05600c1c0100b003cfaae07f68sm10839439wms.17.2023.01.07.05.40.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 05:40:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: fix error code for exceptions caused by IDT
 accesses
Date: Sat,  7 Jan 2023 14:40:44 +0100
Message-Id: <20230107134048.110885-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Exceptions caused by IDT accesses have the interrupt number in bits 3:10 of
the error code.  When in long mode an IDT descriptor is 16 bytes in size,
and due to a copy-and-paste mistake the multiplication by 8 (shift by 3)
was changed to a multiplication by 16 even in the computation of the
error code.  Fix this.

Reported-by: Michael Petch <https://gitlab.com/mpetch>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1382#note_1220619456
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/seg_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 539189b4d184..03b58e94a2d4 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -882,7 +882,7 @@ static void do_interrupt64(CPUX86State *env, int intno, int is_int,
 
     dt = &env->idt;
     if (intno * 16 + 15 > dt->limit) {
-        raise_exception_err(env, EXCP0D_GPF, intno * 16 + 2);
+        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
     }
     ptr = dt->base + intno * 16;
     e1 = cpu_ldl_kernel(env, ptr);
@@ -895,18 +895,18 @@ static void do_interrupt64(CPUX86State *env, int intno, int is_int,
     case 15: /* 386 trap gate */
         break;
     default:
-        raise_exception_err(env, EXCP0D_GPF, intno * 16 + 2);
+        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
         break;
     }
     dpl = (e2 >> DESC_DPL_SHIFT) & 3;
     cpl = env->hflags & HF_CPL_MASK;
     /* check privilege if software int */
     if (is_int && dpl < cpl) {
-        raise_exception_err(env, EXCP0D_GPF, intno * 16 + 2);
+        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
     }
     /* check valid bit */
     if (!(e2 & DESC_P_MASK)) {
-        raise_exception_err(env, EXCP0B_NOSEG, intno * 16 + 2);
+        raise_exception_err(env, EXCP0B_NOSEG, intno * 8 + 2);
     }
     selector = e1 >> 16;
     offset = ((target_ulong)e3 << 32) | (e2 & 0xffff0000) | (e1 & 0x0000ffff);
-- 
2.38.1


