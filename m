Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1155B68F43E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:20:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPo78-0003dO-RZ; Wed, 08 Feb 2023 12:20:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo6n-0003an-O8
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:19:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo6m-0000bg-28
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675876787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPg0YieviKIWcimw6lMQluCiclXWxrWfPNu19kNHRP8=;
 b=MjCCCQEieFy+VnT1klqxNL0F+fedjvAOMFOQHMxJ+cogk6fJc0XzjN5KvhdMaSrG5BKjcQ
 p7jZupXgjgiwePd+5URSNPxhtqoGwGUsIaXNGV3Q+ihVQCRzln0cTbf0ykxyfoHCWbkmQD
 ZdGLB+mzO+d7fUS79UCeChXzzGoIZ5c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-POww_ki9Oj-g_jOVj5R3NQ-1; Wed, 08 Feb 2023 12:19:42 -0500
X-MC-Unique: POww_ki9Oj-g_jOVj5R3NQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 p36-20020a056402502400b004aab6614de9so6257432eda.6
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 09:19:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SPg0YieviKIWcimw6lMQluCiclXWxrWfPNu19kNHRP8=;
 b=eY2lW1Y6OI+HpQwC8A780N790ixyhlFh0NI/+XTYBalHMRfFoH1Mfk3PoJ+dC0y2Zs
 tyTF7c5sMq90GDiS8d/Hcnqrlg4l8aDxaS/XT4uu2VnbClQuXE4RTfKg5nzxTjacWP/b
 vmyk7Cz/akCPnO56ausNvFt9Jnb1iAakTcVZdX2uz23u9gRybtrEVP9j2CZpsUVfsKrT
 UOW4jNXUnpNyhEd/p7zeosHbkXIMQQj3rUq/SfxsnslTtKA3NrThSFPvrj6ookOzh6Zc
 gytxs8AfbD4jrdoY8/oF3619JQf33iK6aPkgKp+IznjYyanbe4UmmoVHm+FOm2vDdyCX
 c2vw==
X-Gm-Message-State: AO0yUKUmYteXVzreQdOQjuWlV18++/EYM1oX7/AIRKl8EJYogpSbp4OG
 k+eqSoGDq2n4UEJUlU9QjAgzMEqI9hbkf5D7SQ/0jXDMlmrg5m1ndWo8n56YCuPMlVudamqi8bE
 bLqAl3hFXX/yxSh3X3fa1uOnUkHY/GcIaZ6LUOTP1x7eUenM8x0BHP5Gzpd6Qp/lTTX5ebPbE
X-Received: by 2002:a17:907:6e17:b0:8af:2af5:1191 with SMTP id
 sd23-20020a1709076e1700b008af2af51191mr617863ejc.18.1675876778216; 
 Wed, 08 Feb 2023 09:19:38 -0800 (PST)
X-Google-Smtp-Source: AK7set/r9MnG71111f8UeZllNRGXNnr2OJ8hwf63t+M+M07XIuX0eM3r4ackKkmLXhKbNcii3xE87Q==
X-Received: by 2002:a17:907:6e17:b0:8af:2af5:1191 with SMTP id
 sd23-20020a1709076e1700b008af2af51191mr617838ejc.18.1675876777927; 
 Wed, 08 Feb 2023 09:19:37 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 sb1-20020a170906edc100b008888f4120d4sm8431183ejb.129.2023.02.08.09.19.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 09:19:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/11] block/iscsi: fix double-free on BUSY or similar statuses
Date: Wed,  8 Feb 2023 18:19:14 +0100
Message-Id: <20230208171922.95048-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208171922.95048-1-pbonzini@redhat.com>
References: <20230208171922.95048-1-pbonzini@redhat.com>
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

Commit 8c460269aa77 ("iscsi: base all handling of check condition on
scsi_sense_to_errno", 2019-07-15) removed a "goto out" so that the
same coroutine is re-entered twice; once from iscsi_co_generic_cb,
once from the timer callback iscsi_retry_timer_expired.  This can
cause a crash.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1378
Reported-by: Grzegorz Zdanowski <https://gitlab.com/kiler129>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/iscsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/iscsi.c b/block/iscsi.c
index b3e10f40b649..3aacd0709f93 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -269,6 +269,7 @@ iscsi_co_generic_cb(struct iscsi_context *iscsi, int status,
                 timer_mod(&iTask->retry_timer,
                           qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + retry_time);
                 iTask->do_retry = 1;
+                return;
             } else if (status == SCSI_STATUS_CHECK_CONDITION) {
                 int error = iscsi_translate_sense(&task->sense);
                 if (error == EAGAIN) {
-- 
2.39.1


