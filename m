Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0734F116FEF
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 16:10:03 +0100 (CET)
Received: from localhost ([::1]:41250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieKfh-0002pU-Oq
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 10:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47093)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ieKXr-0003NC-W3
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 10:01:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ieKXq-0001Gt-TS
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 10:01:55 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35402)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ieKXq-0001FU-NM
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 10:01:54 -0500
Received: by mail-wm1-x343.google.com with SMTP id c20so13811165wmb.0
 for <qemu-devel@nongnu.org>; Mon, 09 Dec 2019 07:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VmTQcO7MS7thh5/mwSJ+9wNSUM+noesb+aFJvdPNQwo=;
 b=ELjMaPHe71zJLY3COqJF5T1dfV6q1rmHsTPfUtp29uxyKF02gDegWwENtj2AOkBrdF
 Sm1a8QSpfb2vzFf1/b2+2fnI94DKn2OxHqX1S5Gw3477qQuiNR5v/sEEq2QXkxaQf4GW
 agA2KmGds4CVpr/cOcZO1V7J4MjJPiU4hdr5cXLKOhEqdc2EGZYGAzngzD/kU/1qntSN
 IYjStShb8OgTsB7N+MUo0n+pPqZmSA4tey60YwaeGXHRS4fN1zUwJkY6OqDC54/3nURh
 808AXO6yAVng657nX7gLypAuFKWhLRhgX8gYIh7kjp//mxxXSJR0K6Dc6dZ+dn6KUBU0
 XyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=VmTQcO7MS7thh5/mwSJ+9wNSUM+noesb+aFJvdPNQwo=;
 b=bK9Cn3CHENSjT5moALxnqnlD4IsSCrM99zUdYhD3RyLsvw1r5E9iyXEHJE8s8KCcSO
 0gO72WUc4rMZtb9FK2FFMU9FPgnrSpfl65GH6qOrCu5egQLdVw2vW3EsLZEie55p/SKP
 bsh7L3AXedD0GqGiQKiRZ6pNTglvw60zv7x+Qlrs+eTGsZ++RyVESrfxp7LC8NmFg3X/
 lptBBxNVrjL8af19d4r1cZtsydXVKvSsJyy7NVyL7gQ9EOEerefU88KYockmBXGfSJzW
 e7ZkUpR40vVvl+6CrfSQEaKWtaO33NjwuQGQaDQfIw1Y3vAoHlcvEf/qOCMN84Q93VTW
 WeDQ==
X-Gm-Message-State: APjAAAWYcttEDCB2ZmsjAURGP3HIAiD+trZmkzMhxYHUOPR4ooORIqQC
 A+6JVW1MnI3jhCoFgLSpJtywbkrZ
X-Google-Smtp-Source: APXvYqwQyZxaHmRHVMZG1dAAwvbd8sx0qaZu3Q6zNRGu/p7U91JcROixvpfOPSq+2gFuq4Mij1wRHA==
X-Received: by 2002:a1c:7911:: with SMTP id l17mr26235262wme.44.1575903713524; 
 Mon, 09 Dec 2019 07:01:53 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id g9sm27219371wro.67.2019.12.09.07.01.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Dec 2019 07:01:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/18] accel: compile accel/accel.c just once
Date: Mon,  9 Dec 2019 16:01:33 +0100
Message-Id: <1575903705-12925-7-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575903705-12925-1-git-send-email-pbonzini@redhat.com>
References: <1575903705-12925-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: thuth@redhat.com, elmarco@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that accel/accel.c does not use CONFIG_TCG or CONFIG_KVM anymore,
it need not be compiled once for every softmmu target.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile.objs       | 1 +
 accel/Makefile.objs | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile.objs b/Makefile.objs
index 11ba1a3..b6fcbac 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -55,6 +55,7 @@ common-obj-$(CONFIG_POSIX) += os-posix.o
 
 common-obj-$(CONFIG_LINUX) += fsdev/
 
+common-obj-y += accel/
 common-obj-y += migration/
 
 common-obj-y += audio/
diff --git a/accel/Makefile.objs b/accel/Makefile.objs
index 8b498d3..17e5ac6 100644
--- a/accel/Makefile.objs
+++ b/accel/Makefile.objs
@@ -1,4 +1,4 @@
-obj-$(CONFIG_SOFTMMU) += accel.o
+common-obj-$(CONFIG_SOFTMMU) += accel.o
 obj-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_POSIX)) += qtest.o
 obj-$(CONFIG_KVM) += kvm/
 obj-$(CONFIG_TCG) += tcg/
-- 
1.8.3.1



