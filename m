Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4F96AD1AB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:34:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZJOa-0004LS-SZ; Mon, 06 Mar 2023 17:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJOZ-0004KO-Jx
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJOY-0003Xp-F9
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678142005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CeETWxXZIcowGLZFcYg1ThDXph6+WV41nOgYMMm09S4=;
 b=bHDSMHbNtQHwBzbnORGm/E6RU6KU+4O/LO6pM2kMza/0VqhmJT1j9PypzWRswFDazf6nVq
 e23YzHTMRdFJhNZ3+3xp4aPbGREnD7gj+eqrrSU2cQ1PXGYKXaWbMZFD0vpYSs391N/Lha
 zGTudQbEQVmIdUv8xVpbNwjsY+OX4OY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-QjVaP087MeWTEOya6MFvdw-1; Mon, 06 Mar 2023 17:33:24 -0500
X-MC-Unique: QjVaP087MeWTEOya6MFvdw-1
Received: by mail-ed1-f70.google.com with SMTP id
 k12-20020a50c8cc000000b004accf30f6d3so15926067edh.14
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:33:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678142003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CeETWxXZIcowGLZFcYg1ThDXph6+WV41nOgYMMm09S4=;
 b=cOtqNdRzS66+UuJ+NOqm7v2YkY+gWRzIlcXMox7ZR+p2D3uDDxwQliWWBnyviC4noO
 vrRPIKsXoEj0ABJUbJAbueEvcGVEdlaO8k4+0viQtiOOykhrzIB51SUEbrpTUwBvWQ12
 vIO7v1eBOzfVYxtb26shzbH2JnT+yyLeEwxyb/4kh2Ps/Nmexlk4qE5dT5QD/hzUlFvd
 reUDcZUuqE01MgtTHJoolxwZeeRKcTLJ9u3nIVhvtjiAHR/VQyug3sYGSRot8wRGGUXH
 aNhxQyDigTKy2mMYnPnQOQTR3A9fHJxKhPuG+FS4UH1lw0PZ0EkmU25Vfw3skaiaN2+R
 aKiw==
X-Gm-Message-State: AO0yUKVm9RHHuS6VHV3q7bS5aUOda/iK6CLUu/1uh2t2+jqRAWMvekUk
 SqHXLk/tqXPjOfNoJBQLc4klW9VWYuPN5JRrXF9RQXRLjPJsmhF7JvkYO/UTlaOE6f0nMvNvmyN
 JO8U4hE5LUK+VC9mK9dXLgY10FpAf1ar2wwUHAVVNXjLAEqZDSF3qnBmCyF11a6bWpzg2yl/z8k
 M=
X-Received: by 2002:a17:906:d928:b0:8b1:7eaf:4708 with SMTP id
 rn8-20020a170906d92800b008b17eaf4708mr11339128ejb.65.1678142003047; 
 Mon, 06 Mar 2023 14:33:23 -0800 (PST)
X-Google-Smtp-Source: AK7set+E7uyWHbKTQwWCKcwgxT+WO4aFBFpJj0p8ZvwrODQKp74DCt0dtqMIU+dl2HdElMFTVzSEeg==
X-Received: by 2002:a17:906:d928:b0:8b1:7eaf:4708 with SMTP id
 rn8-20020a170906d92800b008b17eaf4708mr11339111ejb.65.1678142002740; 
 Mon, 06 Mar 2023 14:33:22 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 t26-20020a50d71a000000b004be774e4587sm5724898edi.80.2023.03.06.14.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:33:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com,
 richard.henderson@linaro.org
Subject: [PATCH v2 4/9] edu: add smp_mb__after_rmw()
Date: Mon,  6 Mar 2023 23:33:01 +0100
Message-Id: <20230306223306.84383-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306223306.84383-1-pbonzini@redhat.com>
References: <20230306223306.84383-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Ensure ordering between clearing the COMPUTING flag and checking
IRQFACT, and between setting the IRQFACT flag and checking
COMPUTING.  This ensures that no wakeups are lost.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/misc/edu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index e935c418d400..a1f8bc77e770 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -267,6 +267,8 @@ static void edu_mmio_write(void *opaque, hwaddr addr, uint64_t val,
     case 0x20:
         if (val & EDU_STATUS_IRQFACT) {
             qatomic_or(&edu->status, EDU_STATUS_IRQFACT);
+            /* Order check of the COMPUTING flag after setting IRQFACT.  */
+            smp_mb__after_rmw();
         } else {
             qatomic_and(&edu->status, ~EDU_STATUS_IRQFACT);
         }
@@ -349,6 +351,9 @@ static void *edu_fact_thread(void *opaque)
         qemu_mutex_unlock(&edu->thr_mutex);
         qatomic_and(&edu->status, ~EDU_STATUS_COMPUTING);
 
+        /* Clear COMPUTING flag before checking IRQFACT.  */
+        smp_mb__after_rmw();
+
         if (qatomic_read(&edu->status) & EDU_STATUS_IRQFACT) {
             qemu_mutex_lock_iothread();
             edu_raise_irq(edu, FACT_IRQ);
-- 
2.39.1


