Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167A16A9D12
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:21:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY94c-0005ZZ-SJ; Fri, 03 Mar 2023 12:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94a-0005YT-AS
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:20:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94Y-0003TO-Sj
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677863998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=COQmYvo/zlgTTYKqBA+2dmUJpq3V6nJgMWRGO5kE4g4=;
 b=fLWRf7A76BniecqgO1YjCfCtd81TZK5kE7fJCj98DYWJ2yJB/ZKcII4T5bdEfITCb+brtV
 xkIDG+Ofq+xKsGvYw1XlhRfmAHclv1o22Lo4IAqz+Kc7Cu4WY252UvDdJ6WjbaDuwHTNhn
 L3BxBKzkm3TsSrV+qOoHBlEAJWm57rs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-kK4d6XWUN0OQXpOBp_v_uQ-1; Fri, 03 Mar 2023 12:19:57 -0500
X-MC-Unique: kK4d6XWUN0OQXpOBp_v_uQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so3130495wmj.5
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:19:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=COQmYvo/zlgTTYKqBA+2dmUJpq3V6nJgMWRGO5kE4g4=;
 b=S6fkJ1bdglY6wZ7suTPrLSqYkN3d7Hheb43g1l/d5OlPa/5/x0yzsRx0BkJZk5HGSL
 5HA+BWe0bj66TXX8ryuIWpzhYfkuxBoF29E8KvFYmKGrZPH7q0RuVc+CkY4AOLEzADss
 XRJnVaMuphkyIZX6UobiNr8sZUvVGn3D0IirQiNZr4IMkclgg9Yo7UvKAPIqX7AvHIOI
 Uiv+Bxw7/XOlkyBLPFEkIGIKpPGlNKUQgipkBnjd6UIqgDlCqLufOeyweOJsJTUsBrWg
 3PoCNnaOf9Ml1LxjRUsoprRHa+PR+qZZiffFxlvEJICbNwWlWB/1i9pY2uAjdJfER0ZZ
 LNlQ==
X-Gm-Message-State: AO0yUKUx5eVP6f60XwRaXCxKiOnl7CNtsPNJUUF6mTLE5FeOD31U4Hoz
 +u/rPSE2XKTAiGDaVXE8I068lOrbm/K7VHxGkbZ1EfPyHUgKeV+7/Cqqu/eHWbPPhUAutXiNGxd
 lLi1gDnkLcJl3j81+DSlKLn5X02hYovv7Wx2+hvfLUlAESYvhtcZvKwmIHrxfysBqRMplb5wN
X-Received: by 2002:a05:600c:1908:b0:3eb:39c3:8844 with SMTP id
 j8-20020a05600c190800b003eb39c38844mr2391012wmq.12.1677863995715; 
 Fri, 03 Mar 2023 09:19:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+xMFEP1PIncD67epVyk0KdJTpnF5ILKF1hrwbjsHaTGaFR/EO9ycnnl1cHoLteC8Grw4mSwg==
X-Received: by 2002:a05:600c:1908:b0:3eb:39c3:8844 with SMTP id
 j8-20020a05600c190800b003eb39c38844mr2390985wmq.12.1677863995362; 
 Fri, 03 Mar 2023 09:19:55 -0800 (PST)
Received: from avogadro.local (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id
 o42-20020a05600c33aa00b003e215a796fasm2807670wmp.34.2023.03.03.09.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 09:19:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
Subject: [PATCH 4/8] edu: add smp_mb__after_rmw()
Date: Fri,  3 Mar 2023 18:19:35 +0100
Message-Id: <20230303171939.237819-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303171939.237819-1-pbonzini@redhat.com>
References: <20230303171939.237819-1-pbonzini@redhat.com>
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


