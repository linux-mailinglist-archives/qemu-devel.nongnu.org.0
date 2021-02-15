Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0E031BA51
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:28:17 +0100 (CET)
Received: from localhost ([::1]:41644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdvE-0005mB-7O
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjt-0005Qy-LE
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:33 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjs-0005UE-0m
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:33 -0500
Received: by mail-ed1-x530.google.com with SMTP id g3so5480742edb.11
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7kVoRfQIcHYNLGdfwdkxHQvayLS/DSZelR8+WiwgdAI=;
 b=uaAFJz1vG5dtvxt83Rngvtd5nqUNqpfUIxxPnCVPJQM4Kinvy5ayE+xBVcJVpFjvFO
 eQAN2n4DV1bfxd8N5aHBGTipLsVAI3BI9fgf1AR6mxq52dreipVbg5lwS7C+Mt9Y0yBB
 ykSTnqHK/HrZTERm0lOoU7AE1ULd0QFlGpvrfo5W58RcqranW+qsWvpkOR9eLcRAXJtE
 TRu+wwyBMza8qNoAo1dyBnl3HdRqilk+yVcFLhMhIdcovvPuTCwCyoc5sGZeP5CGlLlI
 ct5nfvPEOpXslUwhgl1OPYv1OJe25OmgU+hhI45YLlFVXOVBdjW1ZlXjqTDBP+JF2Jco
 9oAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7kVoRfQIcHYNLGdfwdkxHQvayLS/DSZelR8+WiwgdAI=;
 b=E1ZINK0W7XYnvXHJC+8QNOAtmfW4X/UcvA+vvrXyjjbiRwB41gETmJYKyKjSTcq0Gw
 OxTfNfAMAPlNApltHwl40W7hjrFWJZa36eOCkogJyQshMHJp/HPqxyQmYQs+nblUXfPO
 0GwoxsQU3BKML7vvEwS5hbDXsdGGS5cdoeV7DdOoimGKMrmpuldJA29tHO0/VucL+nyY
 GwYwwsyG7BZSxy2eZKBToJjQOlnTH5GORLUAPho+sSF5QP5z8/oWgRKQ2CWcHzQGatxM
 4ln7dlW6JjFgZnWECZf4eZiNIMn3chWCS4s6OdlyU+k73Rv6/T2qiqq2YB4pwwIOoell
 jV8g==
X-Gm-Message-State: AOAM533jexxYSItWUOif8CdAqVhKu3fuLmcdUh8DVNWk2JaNTMwtuZAT
 swsmueQ9tAuvN2ZKn0TRN8onUx+DdOA=
X-Google-Smtp-Source: ABdhPJzDDyyKKjwL6dkajP3rlnZBW6gPPrMFpGtXE5BZ1jqagXkUuKpZpXhsu2ZHFMAps7N+FIVg0Q==
X-Received: by 2002:a50:d7c7:: with SMTP id m7mr15036718edj.260.1613394990709; 
 Mon, 15 Feb 2021 05:16:30 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/19] sev/i386: Require in-kernel irqchip support for SEV-ES
 guests
Date: Mon, 15 Feb 2021 14:16:11 +0100
Message-Id: <20210215131626.65640-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Venu Busireddy <venu.busireddy@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tom Lendacky <thomas.lendacky@amd.com>

In prep for AP booting, require the use of in-kernel irqchip support. This
lessens the Qemu support burden required to boot APs.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Venu Busireddy <venu.busireddy@oracle.com>
Message-Id: <e9aec5941e613456f0757f5a73869cdc5deea105.1611682609.git.thomas.lendacky@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/sev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index dc0e53019b..35b9259bfc 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -753,6 +753,12 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
     sev->api_minor = status.api_minor;
 
     if (sev_es_enabled()) {
+        if (!kvm_kernel_irqchip_allowed()) {
+            error_report("%s: SEV-ES guests require in-kernel irqchip support",
+                         __func__);
+            goto err;
+        }
+
         if (!(status.flags & SEV_STATUS_FLAGS_CONFIG_ES)) {
             error_report("%s: guest policy requires SEV-ES, but "
                          "host SEV-ES support unavailable",
-- 
2.29.2



