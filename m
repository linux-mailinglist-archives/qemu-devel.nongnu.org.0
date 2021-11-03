Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EB4443EB0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:53:19 +0100 (CET)
Received: from localhost ([::1]:43964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miC1G-0005yh-Br
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBwG-0003nr-R0
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:48:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBvi-0004C1-HL
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635929252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=us5yL/LqGuf7LMjnpArZSR01ZcPo+BzJKGcWtuRA6yw=;
 b=gSbETT72NJwKsj4aRc+do0KZjw1ES7HsOJADcOpge9JJs6p9OvAr4g5ErUkYTja1K6QrGE
 z3b06t9yxLoAwzefzI0Odf79TDKZqt/MpOUK7+QqBmZdalrOueWeVpi/FWay1ZI//frlqk
 PnTJIbQ6rNJVFjPC5BOvXYLK/Kok3eA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-fbGy3SDlOBWxB44Ffejbwg-1; Wed, 03 Nov 2021 04:46:12 -0400
X-MC-Unique: fbGy3SDlOBWxB44Ffejbwg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so721790wmj.8
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 01:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=us5yL/LqGuf7LMjnpArZSR01ZcPo+BzJKGcWtuRA6yw=;
 b=CIIAPcL7nhucsa+pltVx3jUOigW8hSUPLbbzNsLmnZRG0s+8JgglX4Dc9/u+YGLyu/
 xCioi7MnNh78BXJ5KEOQK5vvS7olJwlQABD3mvsS87mLSs8bN1dzx0sVKoIl06lzNjJg
 9ouDOWsMbUO+AicPHFQYA6LV5zwsUCwf3EcoCBPpXfLbt80hTLnLkKEaay36v8LpNbuI
 caxDK8oagHgnYNNvuwQOUWZWDYPt/IjgtpchXYXG1J0yh0ITsdukXxC5zTmQtTJO+rt9
 2upqin8c0aOEmIoGM+jo0OnGYRRVNwS5YW2E9hZy/YU91VmVFjGjHnE4ZOI6VHYFGQM1
 JR/A==
X-Gm-Message-State: AOAM531jl/05k7svfz/T/esMJ4VhePM5hBIMaZH3/aeor/PX+fYaNA2k
 tBVo2H26wz15d8b2/+3BatmL+a4xRLtxUkGLD3ZP4xug2qwqahFPk016E0iq/LeW7KkafZ+30PI
 3gpJpEl1GbHbZEnKjyb9I14DtKGwpRe9atRlZKVAnyPd2JWdxwwFVSKQ/KrTUfQnk69Q=
X-Received: by 2002:a05:600c:4f08:: with SMTP id
 l8mr13655409wmq.47.1635929170860; 
 Wed, 03 Nov 2021 01:46:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc29D2tqKE2yjo7SvzjmkPHEZEATE8DSozj1l5K7mPBfWKD0pGNljZFqnk9uPWWuEhyP00iQ==
X-Received: by 2002:a05:600c:4f08:: with SMTP id
 l8mr13655385wmq.47.1635929170628; 
 Wed, 03 Nov 2021 01:46:10 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id h17sm4634055wmb.44.2021.11.03.01.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:46:10 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/11] migration: Zero migration compression counters
Date: Wed,  3 Nov 2021 09:45:57 +0100
Message-Id: <20211103084605.20027-4-quintela@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Zhang Chen <chen.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based on previous patch from yuxiating <yuxiating@huawei.com>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/savevm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index 7b7b64bd13..d59e976d50 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1567,6 +1567,7 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
 
     migrate_init(ms);
     memset(&ram_counters, 0, sizeof(ram_counters));
+    memset(&compression_counters, 0, sizeof(compression_counters));
     ms->to_dst_file = f;
 
     qemu_mutex_unlock_iothread();
-- 
2.33.1


