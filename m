Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1656EA735
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:38:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn9R-0008V0-Hi; Fri, 21 Apr 2023 05:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9L-0008Mm-2R
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9J-00034t-J6
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OetGYPfPxJMX1vKYs3QBB+jEsG19ZgvlvTT8oBfC3uY=;
 b=egr1+mD9lEsAAV6Buw3LJuUEilajdxpFr3wUeYe7FipYBaKYyzFhk1Gyaae8nNI1X/M1El
 LtKa7A+lHeUxvPSQr2LVs8kR0Ebq3SS3dveIDjDvMsXCVQF5Ld6Alg/hAONAdafAAX4AyS
 gsuyZFYk359vOO5J0/puroDRhOhm1sc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271--eQutY5pNIK9QeKFYH5xuw-1; Fri, 21 Apr 2023 05:33:47 -0400
X-MC-Unique: -eQutY5pNIK9QeKFYH5xuw-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5069f2ae8eeso7118264a12.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069625; x=1684661625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OetGYPfPxJMX1vKYs3QBB+jEsG19ZgvlvTT8oBfC3uY=;
 b=bDhd8CjTV7tgMUEovSloJvG/WgGGF6y31i51ySDdF+sg80CcaPn4S4iKY5Xj7rz7Yk
 zhDLNV0jk/D35fHy4G6f4+BMgx14e1gYiYqUkB9zjWGPPKM1NZpEz1F0GQHmvBQIdudW
 2mmHyAd2Y2Hf5CiNQHoEoZVcFHcIpFO4pgkHnpTLwh7sJ18qj+AuQ1hdscCRJpporWTq
 mNg2+TJJ6Sij9977TYYMTQWIjbhpEp/7mJH856W/C65vHzG/2kiT643sMwMM97Lxe7y/
 mgmyrKEckQ8bDAlQEuKVy6w9O7IXqLUVpgYyDGTzMIz95+/VCaXML2e+a4qpbHxTpcxy
 /H/w==
X-Gm-Message-State: AAQBX9dTmFmSUR5SJNntvQ3emjT0QnMDmgsy9MOxB2kyFd5AtQk7sFPz
 2k0myJn4+otY2b8Ta9MrisF/TJmssaUvS2q4XFpk8lsV58VwTAPwPsVFTlPxwevl8D/2+QcrFPX
 CuvZbu7cDu3v5RUspW9eiHd2/MlFfHPL/bDfif6JprZHR6IfC/Qyjma9bNcKJgWM8daoyDu8DYX
 1ivA==
X-Received: by 2002:a05:6402:d1:b0:506:c238:4067 with SMTP id
 i17-20020a05640200d100b00506c2384067mr4317763edu.8.1682069625659; 
 Fri, 21 Apr 2023 02:33:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350YKFZJIa7cqCtsL4+p1rnKpIAWR3fO3rNx2w+FDyLpPys2u1kJ7s2sQQYDRBKqxiKAXSKiSnQ==
X-Received: by 2002:a05:6402:d1:b0:506:c238:4067 with SMTP id
 i17-20020a05640200d100b00506c2384067mr4317751edu.8.1682069625351; 
 Fri, 21 Apr 2023 02:33:45 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 v1-20020aa7dbc1000000b005029c47f814sm1663577edt.49.2023.04.21.02.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 20/25] docs: explain effect of smp_read_barrier_depends() on
 modern architectures
Date: Fri, 21 Apr 2023 11:33:11 +0200
Message-Id: <20230421093316.17941-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index 81ec26be1771..248076375bfe 100644
--- a/docs/devel/atomics.rst
+++ b/docs/devel/atomics.rst
@@ -220,10 +220,9 @@ They come in six kinds:
   retrieves the address to which the second load will be directed),
   the processor will guarantee that the first LOAD will appear to happen
   before the second with respect to the other components of the system.
-  However, this is not always true---for example, it was not true on
-  Alpha processors.  Whenever this kind of access happens to shared
-  memory (that is not protected by a lock), a read barrier is needed,
-  and ``smp_read_barrier_depends()`` can be used instead of ``smp_rmb()``.
+  Therefore, unlike ``smp_rmb()`` or ``qatomic_load_acquire()``,
+  ``smp_read_barrier_depends()`` can be just a compiler barrier on
+  weakly-ordered architectures such as Arm or PPC[#]_.
 
   Note that the first load really has to have a _data_ dependency and not
   a control dependency.  If the address for the second load is dependent
@@ -231,6 +230,10 @@ They come in six kinds:
   than actually loading the address itself, then it's a _control_
   dependency and a full read barrier or better is required.
 
+.. [#] The DEC Alpha is an exception, because ``smp_read_barrier_depends()``
+   needs a processor barrier.  On strongly-ordered architectures such
+   as x86 or s390, ``smp_rmb()`` and ``qatomic_load_acquire()`` can
+   also be compiler barriers only.
 
 Memory barriers and ``qatomic_load_acquire``/``qatomic_store_release`` are
 mostly used when a data structure has one thread that is always a writer
-- 
2.40.0


