Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB296BAE30
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 11:52:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcOjg-0006tq-65; Wed, 15 Mar 2023 06:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcOjd-0006rl-BQ
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 06:51:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcOjb-0000yC-VQ
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 06:51:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678877515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7YJ5CgJHMu11RD6rsTxr3Ks9e+KTCRMoe+scs1Qjt9c=;
 b=KwE6oaT1lO/tNgM+lMEv2IWDgoEADPve2Y9c4b/q3m03HVg6K2ebUmuycRPoYVFa1yc/p9
 13iu01M8ZflK1L8BUi1eXpJPNA3ECceVl8nHLNiucL0ucaXTDNeZvLAhuP93irRLHHGcc0
 0yZUkKHVlevebL/uTHfWvHOmTBRqHwA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-v2R3QmgZPK-v1fYMKSxPrQ-1; Wed, 15 Mar 2023 06:51:54 -0400
X-MC-Unique: v2R3QmgZPK-v1fYMKSxPrQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 h18-20020adfa4d2000000b002cea098a651so1932927wrb.3
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 03:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678877512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7YJ5CgJHMu11RD6rsTxr3Ks9e+KTCRMoe+scs1Qjt9c=;
 b=bIHcKxQuvcp+4s1auzNObBkW4k8tzcN08O9qekHQb0CqIzX4p9bdRqJlJeYJRGDGvC
 5akENLP92IIgHuK8nwMNDui3VL+B43TkK2M/sf3ehTnkTQEvTvSVd3OM44S8A8EEXaQ8
 85w4S3V0xKN3tJ2ACg67lp6aKnxxinwZiVI80RZ7YTEsr9WONdXqOWtc18mSKVUgW2Ih
 NWNytylxwKOQqjjGqjxsgmT6grho1xmI+SoClyNgXifivk6UgdSHPpM4dIa2cBYJdQA8
 GQgZv6OV+FIBQK4Zqot4uuqgNQ/3jZmeJJ8MH7dM6mL87T5RrYYCYCZgaUVRCyIcDaW2
 Q7Dg==
X-Gm-Message-State: AO0yUKXuF4uwrxApEiGm/2afzHmnb2dsdM/byuWjrE0qUzMo4KEAlpuN
 7JA1mamx7fKUcfW6bEmTCCLBULAxn8cR8Qao6BOq1Q3334p9+NEptHzHZkOfmIdBULXVimBafF7
 rWKyxejMMN8wUcq4WO/rL09HCDxdu77cU5F0swaofpuwO2ZsNnWxgpcl7QLij8izQEsg/ZbeATK
 A=
X-Received: by 2002:a05:600c:46d3:b0:3e2:a9e:4eaa with SMTP id
 q19-20020a05600c46d300b003e20a9e4eaamr17779852wmo.35.1678877512677; 
 Wed, 15 Mar 2023 03:51:52 -0700 (PDT)
X-Google-Smtp-Source: AK7set/jH14/cegzZFIURm95fQy8ySMKJcRB3vWHjpAGazKzLkYtd9SSj8VeQ49xMkEv3bQYnEEhlg==
X-Received: by 2002:a05:600c:46d3:b0:3e2:a9e:4eaa with SMTP id
 q19-20020a05600c46d300b003e20a9e4eaamr17779835wmo.35.1678877512303; 
 Wed, 15 Mar 2023 03:51:52 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a1c7904000000b003ed1ff06faasm1414488wme.19.2023.03.15.03.51.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 03:51:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] docs/devel: clarify further the semantics of RMW operations
Date: Wed, 15 Mar 2023 11:51:46 +0100
Message-Id: <20230315105148.611544-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315105148.611544-1-pbonzini@redhat.com>
References: <20230315105148.611544-1-pbonzini@redhat.com>
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

---
 docs/devel/atomics.rst | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/docs/devel/atomics.rst b/docs/devel/atomics.rst
index 633df65a97bc..81ec26be1771 100644
--- a/docs/devel/atomics.rst
+++ b/docs/devel/atomics.rst
@@ -469,13 +469,19 @@ and memory barriers, and the equivalents in QEMU:
   In QEMU, the second kind is named ``atomic_OP_fetch``.
 
 - different atomic read-modify-write operations in Linux imply
-  a different set of memory barriers; in QEMU, all of them enforce
-  sequential consistency.
+  a different set of memory barriers. In QEMU, all of them enforce
+  sequential consistency: there is a single order in which the
+  program sees them happen.
 
-- in QEMU, ``qatomic_read()`` and ``qatomic_set()`` do not participate in
-  the ordering enforced by read-modify-write operations.
-  This is because QEMU uses the C11 memory model.  The following example
-  is correct in Linux but not in QEMU:
+- however, according to the C11 memory model that QEMU uses, this order
+  does not propagate to other memory accesses on either side of the
+  read-modify-write operation.  As far as those are concerned, the
+  operation consist of just a load-acquire followed by a store-release.
+  Stores that precede the RMW operation, and loads that follow it, can
+  still be reordered and will happen *in the middle* of the read-modify-write
+  operation!
+
+  Therefore, the following example is correct in Linux but not in QEMU:
 
       +----------------------------------+--------------------------------+
       | Linux (correct)                  | QEMU (incorrect)               |
-- 
2.39.2


