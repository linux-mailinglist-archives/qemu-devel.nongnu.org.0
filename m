Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FE03F1B8A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:22:56 +0200 (CEST)
Received: from localhost ([::1]:53730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGiwZ-00053u-IJ
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiuY-0002Wq-OU
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:20:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiuX-0006K9-7W
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629382848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y5OsBr5b+5HKE5I63CA5hALHkGW01POgsrNsZU+ahb0=;
 b=e1N72JPyAKWPod20xEnwPHf/9i62Bdlzm7lVmNS+S9flwmXqh0Lgwpk08VPSBy1OK7yUju
 NOUB/ZpPIy1uSCk6UP0qLdnTwSvmzyTsyAHhIdCGPdScRk6FMDroNiS0zz2prkkzWwhxNM
 +8vQ+GdXdKhFRwBnYfbI5POSAnCg674=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-33ttK-Z1PhOGwVoWGDp0eA-1; Thu, 19 Aug 2021 10:20:47 -0400
X-MC-Unique: 33ttK-Z1PhOGwVoWGDp0eA-1
Received: by mail-wm1-f70.google.com with SMTP id
 e12-20020a05600c218cb02902e6bbacdcd1so1595719wme.4
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y5OsBr5b+5HKE5I63CA5hALHkGW01POgsrNsZU+ahb0=;
 b=GzStCRYOZ5yJrKDcqS7NrvCrLFdj1hYAErbo3a4HXtqfoz9/h6g4oYKazHxCDeuP6k
 BJhQgFVkS7LaqWmkAefFhnuqzgMWfQ9f3yrTMwHZvK519SJktHYHTppizAttpYrvQCap
 +rsVkC+UDI1UlZ9VutI7ba1bU1khZgPcEysphvdhVnyrRTbdF7JzXx59lLhA3NpDlBW2
 zSDuPqgFImOqOmWDNURsJaf7c+1m87kzbrGXWUZJL8Fqo4z8vfRHpTlTtgqib0w+1tbq
 ei4phYIS1vhslvDy4I096NN6O6FtX+hOOERy0E/vmV+8TvE3jh5jaZjDeF8HLoyD8BbG
 EIug==
X-Gm-Message-State: AOAM530i/8yQvdguOEXSBCufcCHhk2TUurU/4TpB85M8QwgQCetAg6YR
 TFkbkId6SQQO0eJ5BGW00rPof6lOsl/uAJhR1dXX0PPBgW+Ww6QLQwxigcd6L/ONgbqxad14wmS
 +8JS820EqKmuhBDeNw1KygiD7ApU7mFeyf+39jttuykxPhb91YaX8u912XDlN7FmI
X-Received: by 2002:adf:979d:: with SMTP id s29mr4193904wrb.264.1629382845868; 
 Thu, 19 Aug 2021 07:20:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOQQg7SUZDT8Ua7TTsIjbDHXvO2BvwFOOZBnS5xjMwLwvaT9myfC5ahgs+4geIDDElGxRx9w==
X-Received: by 2002:adf:979d:: with SMTP id s29mr4193876wrb.264.1629382845714; 
 Thu, 19 Aug 2021 07:20:45 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j17sm2999870wrt.69.2021.08.19.07.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 07:20:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] memory: Do not increase refcount on global system_memory
 region
Date: Thu, 19 Aug 2021 16:20:34 +0200
Message-Id: <20210819142039.2825366-2-philmd@redhat.com>
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

system_memory is statically allocated in memory_map_init()
(softmmu/physmem.c) and is never destroyed. No need to
increment its refcount.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/memory.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4df..185f978c925 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -24,7 +24,7 @@
 #include "qemu/qemu-print.h"
 #include "qom/object.h"
 #include "trace.h"
-
+#include "exec/address-spaces.h"
 #include "exec/memory-internal.h"
 #include "exec/ram_addr.h"
 #include "sysemu/kvm.h"
@@ -2923,7 +2923,9 @@ void address_space_remove_listeners(AddressSpace *as)
 
 void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
 {
-    memory_region_ref(root);
+    if (root != get_system_memory()) {
+        memory_region_ref(root);
+    }
     as->root = root;
     as->current_map = NULL;
     as->ioeventfd_nb = 0;
-- 
2.31.1


