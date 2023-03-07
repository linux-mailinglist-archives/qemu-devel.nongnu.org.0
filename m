Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A7A6ADDD5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:44:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVjQ-0006lt-QN; Tue, 07 Mar 2023 06:43:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVjO-0006gR-Ih
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:43:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVjN-0008Fi-5v
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678189424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CeETWxXZIcowGLZFcYg1ThDXph6+WV41nOgYMMm09S4=;
 b=W/B5bY3HFLBxlj3arHKXH2T3WJyOTfQ6HTpLpLVvyCbemIuAHEmv3a5+6kLxY2yVKZ1xPs
 b7+6SD6DvjxmXOfPDcMoSkRt0D/geIcKQ9pbBDzL9ugwe4F7ORFSsHEAPtGUSkJjJNg5RX
 mtJ+6WfnNCVcu0Pji8cC02Z5+UewIHU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-e_MIgSpmNrO040dEgrUrDA-1; Tue, 07 Mar 2023 06:43:43 -0500
X-MC-Unique: e_MIgSpmNrO040dEgrUrDA-1
Received: by mail-ed1-f72.google.com with SMTP id
 ee15-20020a056402290f00b004f059728d91so1524891edb.23
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:43:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678189422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CeETWxXZIcowGLZFcYg1ThDXph6+WV41nOgYMMm09S4=;
 b=3umRdg923yut41ZUNBMGgqbuT8DxtQELxnJ2ZHU85+a4mu6DRxQck7Kn9l6V4O+ok/
 vTaVTAJs+t/yxtsGur743BfnPL6g8zgfyBBtmzAYsyXR14sQJLi3UZ6T7tBlpfpafZRh
 6rMcQF0E75jS7NrYyh0IeFGxN4hoQSxKXd3ZgMA8u4eMoOIpxlYEVlEn6XHfqmBQqCap
 BXKmfuYSbj4S2siM/whcDKmuYg67f+RG98vXrtEWLZQh3QfdSH/mRtWgJCsmYlZfNxig
 tvzVZyUv6RX5y/OdcJy+F/Kk7qijxbqvbX+zyN5h1SQZEc0CmfEw8MZ076sNTsfbPT35
 u8LA==
X-Gm-Message-State: AO0yUKUOsYoDOXkDfhd7q0f0X7HhAeQu/ttdWmRFix7QjoNJM6bisHN8
 5ZjVVWP9Se1AfRhAK81SjbvTWBC9XHKDLSx0Y3jLCqgYJZPEL0sn0PvhbEcOWQHXFIfJqWvIrZT
 I4fQkFao4qLvuR5aiaWwR9b6dE6Dzk0UGylSZEHPrqC18kutU02TVLAJ7Qsc31Sb4Bj48Uf/4Xe
 A=
X-Received: by 2002:a17:906:154:b0:881:d1ad:1640 with SMTP id
 20-20020a170906015400b00881d1ad1640mr15063808ejh.57.1678189422317; 
 Tue, 07 Mar 2023 03:43:42 -0800 (PST)
X-Google-Smtp-Source: AK7set9RWCz9bME0ZFYKaCi3QxuWPXFtMNHlttc41b7jr75c9rfvtuwg5jdKV8V4ff0vmT/b19Cvkg==
X-Received: by 2002:a17:906:154:b0:881:d1ad:1640 with SMTP id
 20-20020a170906015400b00881d1ad1640mr15063787ejh.57.1678189422014; 
 Tue, 07 Mar 2023 03:43:42 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a1709063bc500b008c327bef167sm5952368ejf.7.2023.03.07.03.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:43:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 4/9] edu: add smp_mb__after_rmw()
Date: Tue,  7 Mar 2023 12:43:24 +0100
Message-Id: <20230307114329.158094-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307114329.158094-1-pbonzini@redhat.com>
References: <20230307114329.158094-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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


