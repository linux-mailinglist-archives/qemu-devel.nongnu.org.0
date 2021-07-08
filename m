Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEF13C160F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:33:23 +0200 (CEST)
Received: from localhost ([::1]:38924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1W1i-0005Be-1S
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn3-0000oV-TL
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:14 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn2-0008GT-3o
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:13 -0400
Received: by mail-ej1-x62a.google.com with SMTP id i20so10270510ejw.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LrFShy5YL4Zt4HH2dLprVR6GRKxZLbywCDTtxink+tc=;
 b=sw9q2G1Nk3VQNL0BV8UXaoq402+tSA5RXhyDl0i4XTVPzdS2teJe7qU6BkeDfGJMnl
 RbuUIZdLEaDc0Y6gMypR4kNADnDBtZDkLdAVeoEaUkxhBMfXdu7Zwo2/brzKUaPkb3+1
 Wc9LZSImGutc9B+pArGLzcrDGWftE3abCjCbmtcSu0zJmrB6MqaZh8UGSpt8V2UL+Aca
 2CTfk7cnKSjAh/qHBXcC3lGjE6eLdYtTRr+PlmlEFy+Qgp8ujoBr1jgqwQ4g/MqPC1ZU
 zE3OUsTfn7Bop4KtCqcUfeE3TIL0dll7WFiAk4YL1o6krg/PUNUrSzpBCW+oGLS3IiLA
 rNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LrFShy5YL4Zt4HH2dLprVR6GRKxZLbywCDTtxink+tc=;
 b=jEAuahQviBmUlUY+a6RLSJK1BmZnJQNAqZpfYndG/sLylEarpayO7+HnaIbP2BRuWl
 uLQDwOp+TtARPwc/8gUm3RRS/1ncieSR3/IIZm3ZH6sJYLPjWWDJLCDIYscKbk0CGX0/
 lkTJVwJ2+iL56JqjKkOlpQp971c+pt8Is3SSf9QEWx9/UfSt1Ggn5FYXpeVssQz38j4i
 aduy+IKR1U5tM0uFP2mkzgeBK+HJqzPER/E5A6/Y+W72ylIxOwm01sjdcmLnTTPVMjtE
 vrA2ccg7mfm1v8Z/7u045cp9n+eU2BNVv9SU/LKA8UTEq6kbZ+xsWfHCQpr3b0hZLwte
 rHUg==
X-Gm-Message-State: AOAM531kZ6zlZGcq4+SrDg5iISwYiELCH3NYEcP8/WM+kYYyi/Uz37V5
 K2aPxZowUcdw7JCuQJrES5ECflqMp6g=
X-Google-Smtp-Source: ABdhPJz05d7oJybw2MfFdeF3P4msRpYhORzyI0AN36gKChw4InL230oL/iYj0QK/FyuY7H/75DwuPQ==
X-Received: by 2002:a17:906:33d0:: with SMTP id
 w16mr12652052eja.376.1625757490546; 
 Thu, 08 Jul 2021 08:18:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/48] accel: autoload modules
Date: Thu,  8 Jul 2021 17:17:29 +0200
Message-Id: <20210708151748.408754-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Call module_object_class_by_name() instead of object_class_by_name()
for objects possibly implemented as module

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-26-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/accel-common.c  | 2 +-
 accel/accel-softmmu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/accel-common.c b/accel/accel-common.c
index cf07f78421..7b8ec7e0f7 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -44,7 +44,7 @@ static const TypeInfo accel_type = {
 AccelClass *accel_find(const char *opt_name)
 {
     char *class_name = g_strdup_printf(ACCEL_CLASS_NAME("%s"), opt_name);
-    AccelClass *ac = ACCEL_CLASS(object_class_by_name(class_name));
+    AccelClass *ac = ACCEL_CLASS(module_object_class_by_name(class_name));
     g_free(class_name);
     return ac;
 }
diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
index 50fa5acaa4..67276e4f52 100644
--- a/accel/accel-softmmu.c
+++ b/accel/accel-softmmu.c
@@ -72,7 +72,7 @@ void accel_init_ops_interfaces(AccelClass *ac)
     g_assert(ac_name != NULL);
 
     ops_name = g_strdup_printf("%s" ACCEL_OPS_SUFFIX, ac_name);
-    ops = ACCEL_OPS_CLASS(object_class_by_name(ops_name));
+    ops = ACCEL_OPS_CLASS(module_object_class_by_name(ops_name));
     g_free(ops_name);
 
     /*
-- 
2.31.1



