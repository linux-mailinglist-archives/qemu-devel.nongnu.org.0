Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B60443E8E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:49:02 +0100 (CET)
Received: from localhost ([::1]:57032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miBx7-0004ET-Jh
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBvY-0001TS-Nf
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:47:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBua-0003Xz-TR
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:47:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635929183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2M+OuUyISgXvCG9YPhIzkFcGQHD6D2pRsVs+iBRO2Uo=;
 b=OeHrh+DHmg/0J5/yIgsvknz/iHB4pQQUxosUzuL6yc/Cx4KKwO0RkuHUYPR6xpJyjFPQMi
 gmWtb6BS61tzyw6IcvEqbHxAmFj2Ls7HAOHJU91cnZqkjxEXw/oGCARn2aIFwHfNf5O3do
 /j5SQw4ZZbzn3sPqRt7IyTWiMcY+C5s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-Qv0fhb6HNcqv5Bv7BDRypQ-1; Wed, 03 Nov 2021 04:46:22 -0400
X-MC-Unique: Qv0fhb6HNcqv5Bv7BDRypQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso2424197wms.4
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 01:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2M+OuUyISgXvCG9YPhIzkFcGQHD6D2pRsVs+iBRO2Uo=;
 b=M37/zZPO9LTcZ/7QeT81siDKARXWd9G1zK5v8KsxpeyvuyxBfn8LGsM5KVmwp4a0t/
 2H3jHb0r1WoZS9rhFzvJQ8yDyvHoR766FagZg1O8+B3wE0ugjKjbhArdR2oS2ltI8KYi
 nKJXwdpjayYM+jnrOrozAscT+ggs7YFJF6tzORjk1M6M08ON77iVkY/oTPaPiw9qZQdT
 tV0mJw4Vp2GyD91ahv7ALzw07cNtQzP5/9gC5iMazVCOjUjUVZq/OSHMwtwufgowLqjT
 4O55iW+Np+nJB2DAk0e4NoWbLuxKBYeUE/3nc0o2hAZz6xG0vU4GDw9cWz1lIAiOmzBH
 zb0Q==
X-Gm-Message-State: AOAM533koMXdCBo1e+QHzcAhS+/H2y6YibJtaZaSPB1cHmssPlq2VC+s
 5U6Ct8iMyKpijd/F8xujd+mMrE4dfaL3m1pOwq1YsIgz7ADyOJ8E46Vo7xoeiReiXFpj35J35cb
 lhpr6UKKH6Kn7CdtTWQUnn135CUF4DbbF3Zyem1tfmpkik5c1nN9kQaihld/a08Dp0+s=
X-Received: by 2002:adf:c40f:: with SMTP id v15mr44983282wrf.302.1635929180837; 
 Wed, 03 Nov 2021 01:46:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo1nz7S6u6i4B4iwdnk1QHIDPtk8JFON2B4NJBsVxzmrYv5Pkwn3dgMJKlcOOfMX/F3JMrqw==
X-Received: by 2002:adf:c40f:: with SMTP id v15mr44983245wrf.302.1635929180535; 
 Wed, 03 Nov 2021 01:46:20 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id z6sm1383764wmp.1.2021.11.03.01.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:46:20 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/11] colo: Don't dump colo cache if dump-guest-core=off
Date: Wed,  3 Nov 2021 09:46:04 +0100
Message-Id: <20211103084605.20027-11-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103084605.20027-1-quintela@redhat.com>
References: <20211103084605.20027-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

One might set dump-guest-core=off to make coredumps smaller and
still allow to debug many qemu bugs. Extend this option to the colo
cache.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index f5d39db4e4..847af461f2 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -56,6 +56,8 @@
 #include "multifd.h"
 #include "sysemu/runstate.h"
 
+#include "hw/boards.h" /* for machine_dump_guest_core() */
+
 #if defined(__linux__)
 #include "qemu/userfaultfd.h"
 #endif /* defined(__linux__) */
@@ -3542,6 +3544,10 @@ int colo_init_ram_cache(void)
                 }
                 return -errno;
             }
+            if (!machine_dump_guest_core(current_machine)) {
+                qemu_madvise(block->colo_cache, block->used_length,
+                             QEMU_MADV_DONTDUMP);
+            }
         }
     }
 
-- 
2.33.1


