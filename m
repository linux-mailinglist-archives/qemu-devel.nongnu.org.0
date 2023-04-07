Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 769876DADFF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 15:42:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkmKk-00073I-JZ; Fri, 07 Apr 2023 09:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkmKi-000732-IB
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 09:40:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkmKg-0006WF-Qx
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 09:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680874849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K34whxsFccY3w+HOAFXRpHnp1vpSRgJtjT258xh/XzM=;
 b=VutibfSFM32TQgPyxcLuGkyY0sDKhAIia6u+LzAfoXZwQjP0Nt9GRarW1EW6JH5R2zJn1x
 yeUbsG0HcENSVviQM6nzhnH337Drm+GhokFCd3ud0ntpFodXSMtY1pXpA4T6k4BwErUP3o
 5Jo9Il5qW4TwRJ+kE36sjxjuCneyrf0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26--_y24t8ePXGqhgvcRc43gg-1; Fri, 07 Apr 2023 09:40:48 -0400
X-MC-Unique: -_y24t8ePXGqhgvcRc43gg-1
Received: by mail-wm1-f69.google.com with SMTP id
 n19-20020a05600c3b9300b003ef63ef4519so18201713wms.3
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 06:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680874847; x=1683466847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K34whxsFccY3w+HOAFXRpHnp1vpSRgJtjT258xh/XzM=;
 b=ENHRJ//Rlur71ofAXewsLoDsLGR5S5YSAqTErMK3p1PTLLisN33tuWMpnaj8P+kXvu
 fPPgLP/9Ef+7eDA+NdFg7l+vODUfIGezL5F4oPvKnCa9EVZoWuHBbXGmJjMswVIBEd9r
 nxqQkBodD0FSMU05wpyZm8u14i9oPL4q2CuRLX34kBZOEjhiXG0MvJoerwsQUM52jeXJ
 lWa+3rj75f6nogw64PAwiUbEgrjLYo5MzTiglDADpGqV28glAs0POco35PWf1CwPPusw
 EAi+QuUzFYoD+BfeZVaJW1kPJBLMzdbS9b5txa1fhudwK+QduxjSCJ8JmFBCeluV9WPM
 HfHg==
X-Gm-Message-State: AAQBX9fjiY1NejdfOnvFa64Pn7R4u+wiau2WXvO222iHvlJdEuhWXzNy
 stZtwnm/jCkyxTXglGgWOT7RALZ9CedadgvtDiRXATaogm+Rjg/CHwlpEiKPKWJBESb/dEjavdq
 kb+Zw4pg9AEndo+0qQMz2Tzsn6NP+D20nQSHRBk4wPRScYJIYbR0kjmggO5GDKMVY2Tv0yHDhTo
 s=
X-Received: by 2002:a5d:6282:0:b0:2ce:a6f3:34ab with SMTP id
 k2-20020a5d6282000000b002cea6f334abmr1326826wru.6.1680874846938; 
 Fri, 07 Apr 2023 06:40:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350ba1kjZg9mbSVhKQ9SBEpsKMEOLYrPjNFCpNgAZhmJVzCeLDlkrF6G3IJTRbL/uiGygfS27tw==
X-Received: by 2002:a5d:6282:0:b0:2ce:a6f3:34ab with SMTP id
 k2-20020a5d6282000000b002cea6f334abmr1326813wru.6.1680874846437; 
 Fri, 07 Apr 2023 06:40:46 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a5d5052000000b002cfe0ab1246sm4589344wrt.20.2023.04.07.06.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 06:40:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH] docs: explain effect of smp_read_barrier_depends() on modern
 architectures
Date: Fri,  7 Apr 2023 15:40:44 +0200
Message-Id: <20230407134044.11638-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
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

The documentation for smp_read_barrier_depends() does not mention the architectures
for which it is an optimization, for example ARM and PPC.  As a result, it is not
clear to the reader why one would use it.  Relegate Alpha to a footnote together
with other architectures where it is equivalent to smp_rmb().

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/atomics.rst | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/docs/devel/atomics.rst b/docs/devel/atomics.rst
index 2157d3312956..8f6273c9283e 100644
--- a/docs/devel/atomics.rst
+++ b/docs/devel/atomics.rst
@@ -201,10 +201,9 @@ They come in six kinds:
   retrieves the address to which the second load will be directed),
   the processor will guarantee that the first LOAD will appear to happen
   before the second with respect to the other components of the system.
-  However, this is not always true---for example, it was not true on
-  Alpha processors.  Whenever this kind of access happens to shared
-  memory (that is not protected by a lock), a read barrier is needed,
-  and ``smp_read_barrier_depends()`` can be used instead of ``smp_rmb()``.
+  Therefore, unlike ``smp_rmb()`` or ``qatomic_load_acquire()``,
+  ``smp_read_barrier_depends()`` can be just a compiler barrier on
+  weakly-ordered architectures such as ARM or PPC[#]_.
 
   Note that the first load really has to have a _data_ dependency and not
   a control dependency.  If the address for the second load is dependent
@@ -212,6 +211,10 @@ They come in six kinds:
   than actually loading the address itself, then it's a _control_
   dependency and a full read barrier or better is required.
 
+.. [#] The DEC Alpha is an exception, because ``smp_read_barrier_depends()``
+   needs a processor barrier.  On strongly-ordered architectures such
+   as x86 or s390, ``smp_rmb()`` and ``qatomic_load_acquire()`` can
+   also be a compiler barriers.
 
 Memory barriers and ``qatomic_load_acquire``/``qatomic_store_release`` are
 mostly used when a data structure has one thread that is always a writer
-- 
2.39.2


