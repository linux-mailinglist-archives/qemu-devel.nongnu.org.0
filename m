Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980E5443E99
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:50:40 +0100 (CET)
Received: from localhost ([::1]:34388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miByh-0007wa-MD
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBvD-0000fs-IS
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:47:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBuO-0003KY-QN
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:47:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635929171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXMAM6I60VvVCZ9lewhAVLrOV0nNhGUlSeWi+acDDgk=;
 b=VB/RmqbBqsDpl5IglwnejBeX1i/Ce7BuhBkOEzq1V3lfw2XffbR1rVM/BsGxPRXiCrxGno
 ZZOvFbngzqIxHBwFL6Jr0fhrd2cZBj7orrd5iP+RYyxj0sduHJ29p53QgAFzw/IRO91f82
 iWBcxMZv1YinMFpCYuOvOeoX+CdK3kc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-iChbU_idMiyqWh35hTFSAQ-1; Wed, 03 Nov 2021 04:46:10 -0400
X-MC-Unique: iChbU_idMiyqWh35hTFSAQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so2414040wmc.7
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 01:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hXMAM6I60VvVCZ9lewhAVLrOV0nNhGUlSeWi+acDDgk=;
 b=dor4YVpfVoI/RXGIhTI6Q0nTZFT8EYsBzZoz/GDRi9dFHXLF8Qd8E7yFwjjUUM7G74
 MCRF1+O5gJd6serdOgkZvQA50mzgzxrLeoFdPOkFSJvefHQe2DHMC18b4LvY8XAYrcvg
 5uSGOVrMcuL3MQNwOlmqRwJJzIagcZYkyGSFZ2Pzf10nuPkDwRU9tyYhqZNWT4d1eWis
 jJwMMCEIUX0QQgEC5rh/SkvpebT6mmq9f8/sN5dKPlmsLmw/ZwUFlQzI3R76NhHgaO2Q
 i8XMaa0WHX0yyl0Qj+Ez2s/tKaxBSJrXjzCSAM8rvGw8M+Rg2t4B4wRVWU+InykdQvbU
 6xOw==
X-Gm-Message-State: AOAM530ghvNGkBkHhOPte9h/TuxHjogkmRBfhVEGBteAr3IEZN8wYiyy
 WM4Z+DTedmnoCfp6V6ZFL2E+OyB1XHULi5YYTwgVemBsFS15eGc6dddXSNnRBC242jnt3jO/dLK
 1T3na6LiZo381Zab0GL9T11tT+PEXPCXiGNppKGHzAa8xjgfERUuhBz/uN3B8HF+Zvh4=
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr15277282wri.258.1635929169484; 
 Wed, 03 Nov 2021 01:46:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqN6VmNHZYWJSeqzQACLGaHyFOjxfIxGSPpU2GV40uUxHkevYd7WItlvyqIL3eGGHnAn9DeQ==
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr15277250wri.258.1635929169256; 
 Wed, 03 Nov 2021 01:46:09 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id h17sm4634001wmb.44.2021.11.03.01.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:46:08 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/11] migration: initialise compression_counters for a new
 migration
Date: Wed,  3 Nov 2021 09:45:56 +0100
Message-Id: <20211103084605.20027-3-quintela@redhat.com>
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, yuxiating <yuxiating@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: yuxiating <yuxiating@huawei.com>

If the compression migration fails or is canceled, the query for the value of
compression_counters during the next compression migration is wrong.

Signed-off-by: yuxiating <yuxiating@huawei.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index ec3d87f0a9..edc0dac80a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2271,10 +2271,11 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
 
     migrate_init(s);
     /*
-     * set ram_counters memory to zero for a
+     * set ram_counters compression_counters memory to zero for a
      * new migration
      */
     memset(&ram_counters, 0, sizeof(ram_counters));
+    memset(&compression_counters, 0, sizeof(compression_counters));
 
     return true;
 }
-- 
2.33.1


