Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FB93F4ECC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:56:31 +0200 (CEST)
Received: from localhost ([::1]:39080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDFE-00030n-PR
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1W-0008NU-RI
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:42:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1S-0007Gm-Vp
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629736926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YckUsUuV9Qy+6aID6wMdVmO5kBrH6n8ni00XTKyY7A0=;
 b=Urep3svfStXLhgsarqPqOTEd0bPwhQhrJAVYe3ycEQMGIl2+G6kU6r0c1UMLFHZIgErbBQ
 HBkzrwS4Ta9CFXl9X63fIDOtlJMCkDNTx2mqUHe0JK49s4PaYAATIunr6G/ILTG4vs3gCy
 r6wXiJL3XFeUeFnBrw/pgp6upZ6Wl0k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-QFrSGp25NEyYCsYNjdAGoQ-1; Mon, 23 Aug 2021 12:42:05 -0400
X-MC-Unique: QFrSGp25NEyYCsYNjdAGoQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 h6-20020a5d4fc6000000b00157503046afso1117469wrw.3
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YckUsUuV9Qy+6aID6wMdVmO5kBrH6n8ni00XTKyY7A0=;
 b=k1jpapmOL1pHfbRrgL/tG+fEK3EgQ49yG44ZS2ay40sM5ppdq75+MDxR0SfwHGmBHF
 6xbbKxcv5zK1wnRugolAK62P3bfbq8h5J4exSWZ7lUCwlC63dxmJAwhR6AmlkVrDv1qv
 JjmSr2RKs1ypIyfQXTslzKyGNb8mUeEW5rGbxCaa8re/KDrTFNRaccoVl9JzNy4uGl7g
 l9tsEI/lRcYhWsFnMGaZwMj6GEXb1zKegaJBR9/djIxU/aqHSQDcNO7O372KC9INAoEU
 5lD72UfFGd9FKONOcdz6D/pTY4vpcIXtsi3c5AeOobN29dcSmrI72I/cwVCLE9gbPPcB
 xfNg==
X-Gm-Message-State: AOAM530FCF0IWsRLcuMCpRj74SerJ+HfpABkkEmbQXdlY5ZsLHYri/t3
 8GbuZTFj+SasdpVfOolMwLPuorzxbNVjftLaCI0uAVQB97EJ+ahwuNOE9HjrUiVhxn2otGCGmE9
 0MLRu+AQ8BcX/dqFLJumS1D8Yxpim/g0a/Q3wuJ1nDrYaLSjdY2Qgdl8njTHBF1HN
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr1483424wrp.381.1629736923804; 
 Mon, 23 Aug 2021 09:42:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoQTwJbU3js530K2WX8ZDPVo5o/3C1I6uXbf7lFVJ9dcxudLyttVejhIOrqg0wtrIEBGxe3Q==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr1483398wrp.381.1629736923601; 
 Mon, 23 Aug 2021 09:42:03 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 j17sm15371045wrt.69.2021.08.23.09.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:42:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 1/5] softmmu/physmem: Simplify flatview_write and
 address_space_access_valid
Date: Mon, 23 Aug 2021 18:41:53 +0200
Message-Id: <20210823164157.751807-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823164157.751807-1-philmd@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.743, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove unuseful local 'result' variables.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/physmem.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 2e18947598e..e534dc69918 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2810,14 +2810,11 @@ static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
     hwaddr l;
     hwaddr addr1;
     MemoryRegion *mr;
-    MemTxResult result = MEMTX_OK;
 
     l = len;
     mr = flatview_translate(fv, addr, &addr1, &l, true, attrs);
-    result = flatview_write_continue(fv, addr, attrs, buf, len,
-                                     addr1, l, mr);
-
-    return result;
+    return flatview_write_continue(fv, addr, attrs, buf, len,
+                                   addr1, l, mr);
 }
 
 /* Called within RCU critical section.  */
@@ -3114,12 +3111,10 @@ bool address_space_access_valid(AddressSpace *as, hwaddr addr,
                                 MemTxAttrs attrs)
 {
     FlatView *fv;
-    bool result;
 
     RCU_READ_LOCK_GUARD();
     fv = address_space_to_flatview(as);
-    result = flatview_access_valid(fv, addr, len, is_write, attrs);
-    return result;
+    return flatview_access_valid(fv, addr, len, is_write, attrs);
 }
 
 static hwaddr
-- 
2.31.1


