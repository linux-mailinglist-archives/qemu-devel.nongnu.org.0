Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E989443E8B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:48:04 +0100 (CET)
Received: from localhost ([::1]:52906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miBwB-0001Sz-68
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBuf-0008F1-4l
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:46:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBuY-0003UF-2s
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:46:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635929180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AF92BaXYMeJIpGOLIdcfVi696Z627qsFx2fUZChIz50=;
 b=EDFCt/DRsqbVFvStGyXES2GoLGSXM2EbD78WFoAZTWwY8a8zEKO33wNyrKKWdXhd6HoXj7
 v3fjz1LpuXzMpp/rSks9T9y3gZKsV87fesSDgTc5Fe5VUiP7kmzL494u8aJrnno6pTxLzV
 CCcgSPpYpOuMZK67ZvD2bxOcxpUgRj4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-Y6ap3ULCMs25oB1YGc1-8g-1; Wed, 03 Nov 2021 04:46:19 -0400
X-MC-Unique: Y6ap3ULCMs25oB1YGc1-8g-1
Received: by mail-wm1-f72.google.com with SMTP id
 v5-20020a1cac05000000b0032ccf04ba2cso2425270wme.2
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 01:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AF92BaXYMeJIpGOLIdcfVi696Z627qsFx2fUZChIz50=;
 b=XZN83Ou3fQA4sT/FGOnUXJwAOrUd1iKgbAFWGqorkVqf30WN98QPpTBVwZFr0DBAI7
 zM66QTVm6fqLC1fSSntQgsjkN9YwuQ+gADqo0erhMyaRM0AOh8IHUt3+emk6fk3S8wia
 41T8aZItvvtcmaC36ieMFjRPsqO12w8aYPF+IJJYWbsL9lZ04vB6ykjGWRkd6IB3o2ei
 DYoPA+zYTgdtyj1ELGRX5tZHEUy7zRrYCBiLK+3pD5Kh0INRSR533w5drlQpu1MHqDU+
 pCDz2MZ5UYPXbfsk/rO2oFGydJexHJ+2bIMU+pgo4MOfiGpZp2W0wIajBbE3Tg2JNWmY
 6HfQ==
X-Gm-Message-State: AOAM532ohsMc4OxEvZgUTKuX8If28SDbA3UuNx/D6/NNvKOPa0t2P6BQ
 btprfzfete1zX7zc6HtsIVBEZp3EFMoShdJNSPE7aQ6J7Bkg3iTE7N6kbD7a7ZS5L3cpTejFFlk
 SFRW3JQHGiLmrKv8fF33Vpmg9ZkPp/OCrRsV+lWUCnA9tRDj1NVI+OMxGU+pWAACaw5s=
X-Received: by 2002:a05:6000:10cb:: with SMTP id
 b11mr42298057wrx.71.1635929178200; 
 Wed, 03 Nov 2021 01:46:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRDZ2jkzUZrwSUla6hKEHlGAt2TnUFR7aLtKQa/KDhrpudEGBYLYp1mzO20f/ePIeK8XNDmw==
X-Received: by 2002:a05:6000:10cb:: with SMTP id
 b11mr42298035wrx.71.1635929178039; 
 Wed, 03 Nov 2021 01:46:18 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id l11sm1285771wrp.61.2021.11.03.01.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:46:17 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/11] Removed the qemu_fclose() in colo_process_incoming_thread
Date: Wed,  3 Nov 2021 09:46:02 +0100
Message-Id: <20211103084605.20027-9-quintela@redhat.com>
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

After the live migration, the related fd will be cleanup in
migration_incoming_state_destroy(). So, the qemu_close()
in colo_process_incoming_thread is not necessary.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/colo.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index 907241ab5c..71fc82a040 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -919,11 +919,6 @@ out:
     /* Hope this not to be too long to loop here */
     qemu_sem_wait(&mis->colo_incoming_sem);
     qemu_sem_destroy(&mis->colo_incoming_sem);
-    /* Must be called after failover BH is completed */
-    if (mis->to_src_file) {
-        qemu_fclose(mis->to_src_file);
-        mis->to_src_file = NULL;
-    }
 
     rcu_unregister_thread();
     return NULL;
-- 
2.33.1


