Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E653931F892
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:47:18 +0100 (CET)
Received: from localhost ([::1]:38574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4Fh-0004WX-SL
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:47:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4DE-0002aW-8I
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:44:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4DB-0001v1-1X
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:44:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613735080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=98X4DsBNdk1BN09KWcHx0mE3/gzzTZdKxOLSGajyIeI=;
 b=NtMesX1+Zeqvpm9/jZNRgi1h4EN5bIYdcec9PvD9MpsI067OC7+Ra5jscK2053LG5ADn02
 ekJcpy94Oj5PTsbjMqUN8nO2Z96s9GddyUWYUK98lpmDGPq69H171LQ6jT+YtPC1Z8K52z
 4GSvGFKhHf+SvH375bFUqbRhSelBBow=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-MA6kdi2wM7KnFOQ_Bon7eg-1; Fri, 19 Feb 2021 06:44:39 -0500
X-MC-Unique: MA6kdi2wM7KnFOQ_Bon7eg-1
Received: by mail-wr1-f70.google.com with SMTP id p18so2362404wrt.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 03:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=98X4DsBNdk1BN09KWcHx0mE3/gzzTZdKxOLSGajyIeI=;
 b=qGmzSxwzmTHIGCDjct9DYdaMxpgPAO8yxqS64cMGpv1QzgAWJwXyBSeuSsLCHzDLdO
 o1O6tGFIdhKuzJ9OgdsVqOgzyCrkEov3iH+iInNa+MtGY1vuxqTkeUlhQXoatoUvIRLJ
 YUpuvfzqu1xo1NX7pwmcbRM70Fyn0g58oqy3I45LfIpZVIrEL9Rx6tavLKED8M0f4yBk
 be5RIXPwj6S5HsXjGTVcKnkfN+vdM2R0gS6OjYKvRnsQCxSLdfxzYhY6exGgnKt97XyA
 8AMktVtHEvkmd0RS9yInu37JS6AC1bd+4WVFdsnIpAbQl8rWG6ahuHkqdXyXpJ0gqT43
 7JVQ==
X-Gm-Message-State: AOAM532UcYAmMujIg81cB2hak5StxDMlagyjwHJdT7AND0KqrbQxVUWD
 +zGZAUeIeaQlIXZHphm0BosEks6++B5BMSX2g37fpfPxYztoqe62N3stW5vmQ84yieOGq5NGmgo
 K6jQMB+XxZHZelFdBqNA9PpJbnHVENd7t5A8WpalRIfobMs651IZj2Z66omTNeYI5
X-Received: by 2002:adf:b357:: with SMTP id k23mr8694397wrd.354.1613735077545; 
 Fri, 19 Feb 2021 03:44:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8BoyDIy3MZrDx4a9/uBNg8Gu4uQrRfjBpdhkb1HenxWvZ3lMMW1roaXGxl/Jsmb64BZpXBA==
X-Received: by 2002:adf:b357:: with SMTP id k23mr8694350wrd.354.1613735077292; 
 Fri, 19 Feb 2021 03:44:37 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w81sm11424135wmb.3.2021.02.19.03.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 03:44:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] accel/kvm: Check MachineClass kvm_type() return value
Date: Fri, 19 Feb 2021 12:44:22 +0100
Message-Id: <20210219114428.1936109-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219114428.1936109-1-philmd@redhat.com>
References: <20210219114428.1936109-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MachineClass::kvm_type() can return -1 on failure.
Document it, and add a check in kvm_init().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/boards.h | 3 ++-
 accel/kvm/kvm-all.c | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index a46dfe5d1a6..68d3d10f6b0 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -127,7 +127,8 @@ typedef struct {
  *    implement and a stub device is required.
  * @kvm_type:
  *    Return the type of KVM corresponding to the kvm-type string option or
- *    computed based on other criteria such as the host kernel capabilities.
+ *    computed based on other criteria such as the host kernel capabilities
+ *    (which can't be negative), or -1 on error.
  * @numa_mem_supported:
  *    true if '--numa node.mem' option is supported and false otherwise
  * @smp_parse:
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 84c943fcdb2..b069938d881 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2057,6 +2057,12 @@ static int kvm_init(MachineState *ms)
                                                             "kvm-type",
                                                             &error_abort);
         type = mc->kvm_type(ms, kvm_type);
+        if (type < 0) {
+            ret = -EINVAL;
+            fprintf(stderr, "Failed to detect kvm-type for machine '%s'\n",
+                    mc->name);
+            goto err;
+        }
     }
 
     do {
-- 
2.26.2


