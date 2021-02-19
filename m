Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2679931FE1A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:43:23 +0100 (CET)
Received: from localhost ([::1]:41532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9oH-0005Vi-Q1
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9k7-0002GD-Cw
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9k4-0005Pd-Kd
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613756339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=98X4DsBNdk1BN09KWcHx0mE3/gzzTZdKxOLSGajyIeI=;
 b=Q9/iEHjDqTF80Mo33cOYrt6p2Mpt3KYt2U3Ws869lT0OTof6ZPlwvl5CIILLX0q5dD0TsJ
 GREqXguURm4OuiYckfiL8llnByBBclUng2Ga0xYg7sctKg9dbGPCq2yoHwHUfwCC5Ta4Ih
 L4BjB9lWVIOwISa+z4fduSomV3HSW/o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-T9xLyIzUMjOy7UZ1BigUcw-1; Fri, 19 Feb 2021 12:38:58 -0500
X-MC-Unique: T9xLyIzUMjOy7UZ1BigUcw-1
Received: by mail-wm1-f72.google.com with SMTP id z67so2789285wme.3
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:38:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=98X4DsBNdk1BN09KWcHx0mE3/gzzTZdKxOLSGajyIeI=;
 b=CTv/+Mb+Tl5GLhRMkVfTPgu/hP4v7C9SboOduXu+EvLwbnV7l/eMRm8+2ldFNFu610
 PEvCEgWUUOUDCNbAnCQucdBxwfhmfQW+57kjtkBC/6LKzlWjndFyB5ME3ROJSj4TNemO
 QtgpxPmW8UdhAvy27dBIU1FORA7Mj+ut3/TM0zsTidDVPb6jSGeUzg49wSvmmVO2iM80
 4EUMDVjNIKJFAQMm6Z0764Gvn2hrV66NSy1VN4oBss7zkRalk618m5fpK9YV0S2qgx8j
 npuoo3QkYXu+NoWSO4cfy7kkSToOOrpYYIAkanuUvYzkD5M+Da+SNpQp1B267odMdBFw
 xEVA==
X-Gm-Message-State: AOAM530aMEySpM9qjJAKrPcAvnFfrORmSto2s1QT/EpZT/q0VtBknPks
 PHGdd7t71A8A9JMulP0xhK6fr7wZwdQkJwAQz/DkrROvwDcY2gMV1yGpctUFUXqeW59dpqvtkus
 0U4ZXSDzYcL3fpD02XigxhJUuwM7twegoAxGeMwAfQkVtAqyRDI+PYPjrL61vS86w
X-Received: by 2002:adf:b60f:: with SMTP id f15mr10395992wre.83.1613756336913; 
 Fri, 19 Feb 2021 09:38:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzk+AP79F8l3TWLxyR5RU8SmferiSbz3yhDIC5dQKM04uA2QaqDVPRO6H3UVoBxcUQFmDZVKw==
X-Received: by 2002:adf:b60f:: with SMTP id f15mr10395942wre.83.1613756336683; 
 Fri, 19 Feb 2021 09:38:56 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i7sm23525949wmq.2.2021.02.19.09.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:38:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/11] accel/kvm: Check MachineClass kvm_type() return value
Date: Fri, 19 Feb 2021 18:38:37 +0100
Message-Id: <20210219173847.2054123-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219173847.2054123-1-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
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
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
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


