Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7633B1246C5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 13:26:45 +0100 (CET)
Received: from localhost ([::1]:53436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihYPc-00042A-55
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 07:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47216)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY2z-0006F5-Ut
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY2x-0000M9-Li
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:21 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:35343)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihY2v-0000K1-Qx
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:18 -0500
Received: by mail-wr1-x442.google.com with SMTP id g17so2022260wro.2
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 04:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NgSYMCj2GDzG+EWzpAKdPv4XL0MvO6XGircBD2DIF5Y=;
 b=cZJY/7unMYQxW9mRq0zUV5e7jAbV7Jy/akC+s2T+Gv1w9Iia9NaI1PjMJEq8Jmb93f
 UBpkISjnjh4ZRkcxgliUzeRWjK4FMA5vlFglOk8qqWesKzLCNrZF46l07PgvaG7sZeKu
 quI3PlXG7X0su2vW72NRENLrr7OA3tJVsRXjcVJjlV6CaaRsv3lmLKxst9bVj4DUnq0T
 jVsrtpMz6w20ddKE0elLAVc1BLmQk0yVxuEKtVkhqY7vMEkV+8Rh5KmTineNA4YA86px
 /KdmA6+8kBbGv0vvSz4W5clQJBnh0NyNEUSezgRWWiPG52d6dc5h9lUYohfcub5rOt/N
 jHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NgSYMCj2GDzG+EWzpAKdPv4XL0MvO6XGircBD2DIF5Y=;
 b=lUXaPmjxka4/Or5b7Yp+baAQe2bYqPICZAqSgdWPJJDVqzIaODyu9chjBb1V3I+hbj
 qu0wcWfBHLxiDoDv3ORiJn59npCJZIILP0p2cmbGFkp2IjUar8bRBfQ9VefOnOZk9mSd
 x93FbWzPWigIMWtz2QNCl+5PGffBvA9L3CF+SJFag1uuXpdwFCzMYk1lK7fMnnRDWaSx
 /Z9m9Ix3K11WNDHxBwMEVJIT46iKLjPWMqC9g69z+Z0/mvm2BSLvHtWq2wPmd5sgr66J
 qi54ZbcLG4ZzesBVZJ1Gt42ndGD7ZNrXGIQY/S5jAulEwo/ZX0SGLa5mnd/50VLFNzXx
 mnPg==
X-Gm-Message-State: APjAAAVRjsDq57TtwLbdif6oXeRK8o3nXMxxb860d2dDHXWFouGtnVV/
 LGQk3Lsz8Xy36Xux7TA86hWjuLTa
X-Google-Smtp-Source: APXvYqwJxZ8/AKZUnptbkHw+mmpvF0PrLWhkD5Rvzl7EgRHVQSqR7jK4IOxonpis5HrlzmnFXH8nOg==
X-Received: by 2002:a5d:4045:: with SMTP id w5mr2302015wrp.59.1576670595285;
 Wed, 18 Dec 2019 04:03:15 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm2236838wmf.46.2019.12.18.04.03.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:03:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/87] vl: warn for unavailable accelerators, clarify messages
Date: Wed, 18 Dec 2019 13:01:46 +0100
Message-Id: <1576670573-48048-21-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So far, specifying an accelerator that was not compiled in did not result
in an error; fix that.

While at it, clarify the mysterious "Back to TCG" message.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 vl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index 0f620be..c350eef 100644
--- a/vl.c
+++ b/vl.c
@@ -2723,6 +2723,8 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
     int ret;
 
     if (!ac) {
+        *p_init_failed = true;
+        error_report("invalid accelerator %s", acc);
         return 0;
     }
     ret = accel_init_machine(ac, current_machine);
@@ -2777,6 +2779,9 @@ static void configure_accelerators(const char *progname)
              */
             if (accel_find(*tmp)) {
                 qemu_opts_parse_noisily(qemu_find_opts("accel"), *tmp, true);
+            } else {
+                init_failed = true;
+                error_report("invalid accelerator %s", *tmp);
             }
         }
     } else {
@@ -2796,7 +2801,7 @@ static void configure_accelerators(const char *progname)
 
     if (init_failed) {
         AccelClass *ac = ACCEL_GET_CLASS(current_machine->accelerator);
-        error_report("Back to %s accelerator", ac->name);
+        error_report("falling back to %s", ac->name);
     }
 
     if (use_icount && !(tcg_enabled() || qtest_enabled())) {
-- 
1.8.3.1



