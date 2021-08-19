Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D343F1B8B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:23:11 +0200 (CEST)
Received: from localhost ([::1]:54844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGiwo-0005nr-SY
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiuj-0002wZ-2J
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:21:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiug-0006SO-Ea
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629382857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shIeo+L4trmRqnGxLVVjByJ3DfeCv4gt22CJ/6RIBwg=;
 b=TSx5xljV2NPcuvO8lJEYWgJdmHEUvjHN23XGTMlDeTex5oxsudZ//1TLTaIbvdCZgrQ7d0
 5IYH6z1/pn2C7TlaJ0izYAPLBIlF1EP/TxsiCGq4nB68jqKNakm0u8MlN5Z5oH/VcRhdsF
 f4iHWjfXi9cuwc3K2FvEPOPyVo3qLrs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-d13u_1d4Nsmh4O2qwOaGhw-1; Thu, 19 Aug 2021 10:20:56 -0400
X-MC-Unique: d13u_1d4Nsmh4O2qwOaGhw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j33-20020a05600c1c21b02902e6828f7a20so1593770wms.7
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=shIeo+L4trmRqnGxLVVjByJ3DfeCv4gt22CJ/6RIBwg=;
 b=TaTIL8LCyVsc7VqJfesrp17uuJOv/RmdR0rOwUVRsBISxIqR/TNNTwvLxfYOXkCAkZ
 u3T7YfclIvrr2AwJWzwCbv/smjQb2D7KyAME5pK+cGE/xlLBUUjXvvBmm+9Yz/4UnMUS
 KjcDuM+mhby+VqyiSpZ+k37DIjwODZUt6ZbvmN65zPL0+zRMPlJbtd3r6QLE2ZSB2cUM
 U5rrw3H1VB56ZJ9F5u5gFZSpaWZByRNGgkAJJelrGK8YBQrbQ1HeoPmhGkO+8nK9L3kD
 zU7hl7YaMa0Lxz25w2tTIGne7v+s2YIyKcsPM3ZM+igOvP2niyYm1O7d7x0XYfBPqyUU
 0Qsw==
X-Gm-Message-State: AOAM533CN47/clz2distnL/93Huv5s4goqmGOaDVR5amvMYgVIyGxhII
 l4otSNmgzgXJJ267uugLNF0wBj86eCXzvhLVnTv47o7rLvxly6B3B48Qt34OKVD4wSv2i1Q+yDb
 on4PEj7rt4gvgL2STHYap590H38AGrUPxsUtGsvFgwwSJOlP+H1eu5uZuBG2J0+DM
X-Received: by 2002:adf:fcc5:: with SMTP id f5mr4361110wrs.114.1629382855531; 
 Thu, 19 Aug 2021 07:20:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7zYOEIkNEOHV3YtZGTXYk83thhYe0ux9YT5xw3f3FLHXQD1bguzTgmuzMe0mBmOaptHmC3A==
X-Received: by 2002:adf:fcc5:: with SMTP id f5mr4361077wrs.114.1629382855386; 
 Thu, 19 Aug 2021 07:20:55 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g6sm2847345wmq.14.2021.08.19.07.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 07:20:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] memory: Have cpu_address_space_init() use
 address_space_create()
Date: Thu, 19 Aug 2021 16:20:36 +0200
Message-Id: <20210819142039.2825366-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819142039.2825366-1-philmd@redhat.com>
References: <20210819142039.2825366-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>, Peter Xu <peterx@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace g_new0() + address_space_init() by address_space_create().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/physmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 3c1912a1a07..cd8b670a731 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -727,12 +727,12 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
                             const char *prefix, MemoryRegion *mr)
 {
     CPUAddressSpace *newas;
-    AddressSpace *as = g_new0(AddressSpace, 1);
+    AddressSpace *as;
     char *as_name;
 
     assert(mr);
     as_name = g_strdup_printf("%s-%d", prefix, cpu->cpu_index);
-    address_space_init(as, mr, as_name);
+    as = address_space_create(mr, as_name);
     g_free(as_name);
 
     /* Target code should have set num_ases before calling us */
-- 
2.31.1


