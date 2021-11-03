Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D98443EC8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:57:22 +0100 (CET)
Received: from localhost ([::1]:53042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miC5B-0003fZ-M7
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBwD-0003Zn-6U
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:48:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBvi-0004Bz-EC
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:48:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635929252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xyDtKIeZOhYuuJfxcpgBYSE4NgNR496g+ae1/CpdsJs=;
 b=aAwC5Tbd/hdOWlTXTSq26dK+NvwgqnTtwNVm33aAwmOREg217jjtjL22thNi8mfRTbDJHe
 0aFzimDWWZo9uC7yx8Zv6LHzXQgmxAMSBn5vhOa0YWAr2quQ3FGvSNCIY2bO7C70B7yYd6
 Fp5DaXXfwyL56OjFS37qMs/FPLpll3o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-xn4ubC9bOnuEWCWSsnJxug-1; Wed, 03 Nov 2021 04:46:13 -0400
X-MC-Unique: xn4ubC9bOnuEWCWSsnJxug-1
Received: by mail-wm1-f71.google.com with SMTP id
 v18-20020a7bcb52000000b00322fea1d5b7so735183wmj.9
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 01:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xyDtKIeZOhYuuJfxcpgBYSE4NgNR496g+ae1/CpdsJs=;
 b=D0KkXiAgBhMxevmVu2rwYbqvffdM8M1kkYKHxx0dbjNJ2XJ4f9ADZG8jsyRoZUVhmO
 egzsf3HIueWAZ5C6vv7XnuHZ/G1zfeWiEVIhNn3YFU2pRjdaQi9Nv/e81RPBpmQQiGVM
 RwsAUZakcSlOLkn20FQBZ0Ob37PvDdMLnXecHwKLlIOEWdJQcoOiQiP0kn8Jtp6BEeS9
 e7BovzOdZVciHwAz+jsg1ZNaix/igE3jQkx3psTQ3oi5HIgL38buIaDyvs/uIznWtFds
 ArhEg5jDiNl8Tpz/jEj+U5A1gJrDBsFJoUN5wmBdVutTn380FAAmu5QH8iVpWtc+0tzy
 3FwA==
X-Gm-Message-State: AOAM533Lu/kRBIm+7tgi5WeJGfomK9sYwkc5mnlt4KmiIHipsTSqI/3h
 hiemCqRcRHTXfMszhqKHK8Q/u4G0u4xyeQxkXQYct6dgFUbKpRwkKrwV7p7zX/W5/Fo1U+BGNk/
 8R4JzqMMtSjzSIbfrGUxU1Bi2E25iqDMIzGuznb5CG0Rg+akoPLiXvI0jrrdiIYdY3+8=
X-Received: by 2002:a05:600c:2dc1:: with SMTP id
 e1mr13370360wmh.170.1635929172187; 
 Wed, 03 Nov 2021 01:46:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOfZGqUfNi1mDAp3ekntvtiQhiq4S+jgjs/VvyCu6UPaVgrZGr3xrvGQCL17HM9wej+4O6QA==
X-Received: by 2002:a05:600c:2dc1:: with SMTP id
 e1mr13370331wmh.170.1635929171954; 
 Wed, 03 Nov 2021 01:46:11 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id b9sm1295200wrx.24.2021.11.03.01.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:46:11 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/11] Some minor optimizations for COLO
Date: Wed,  3 Nov 2021 09:45:58 +0100
Message-Id: <20211103084605.20027-5-quintela@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, "Rao, Lei" <lei.rao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/colo.c   | 2 +-
 net/colo-compare.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index 79fa1f6619..616dc00af7 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -152,7 +152,7 @@ static void primary_vm_do_failover(void)
      * kick COLO thread which might wait at
      * qemu_sem_wait(&s->colo_checkpoint_sem).
      */
-    colo_checkpoint_notify(migrate_get_current());
+    colo_checkpoint_notify(s);
 
     /*
      * Wake up COLO thread which may blocked in recv() or send(),
diff --git a/net/colo-compare.c b/net/colo-compare.c
index b100e7b51f..4a64a5d386 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -170,7 +170,7 @@ static bool packet_matches_str(const char *str,
         return false;
     }
 
-    return !memcmp(str, buf, strlen(str));
+    return !memcmp(str, buf, packet_len);
 }
 
 static void notify_remote_frame(CompareState *s)
-- 
2.33.1


