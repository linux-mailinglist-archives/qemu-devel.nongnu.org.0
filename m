Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BF93991F9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 19:54:14 +0200 (CEST)
Received: from localhost ([::1]:57832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loV4H-0000at-UP
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 13:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loV1V-000323-5Q
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 13:51:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loV1R-0000oP-Az
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 13:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622656276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ALtnDvyrjqeVSySfzcoaY1aNEH4zZ/0PSYimaT1vDic=;
 b=TZbbSD5DjE717Ot9uZwtsICp3MrTfuZ/vT8Mgbto+uVcmsNIrhz5yzS4iRD5bUx23Lagv5
 GiDspzlR77LB/otuPg4AC4MztL4hIvR8P4gyoj51MC3HcsBrhLRN3bPWCc8e6aOE/kwu2r
 yiYq1HlbMbGYfGFUcdp85vM+tVvMBMA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-_op_UdI_MwOQ0oFqOYIxRg-1; Wed, 02 Jun 2021 13:51:13 -0400
X-MC-Unique: _op_UdI_MwOQ0oFqOYIxRg-1
Received: by mail-ed1-f72.google.com with SMTP id
 c24-20020aa7c7580000b029038fd7468047so1823188eds.20
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 10:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ALtnDvyrjqeVSySfzcoaY1aNEH4zZ/0PSYimaT1vDic=;
 b=BxDLpHYzitEdhrz4usrL4/dHl6sVVFLsQVhenckGi0JljYxD91P8fwx/r8mtjJwO2W
 myPS1g1zEESTDzUlBZNeHab5UAdJ/tbOk80z8myqlWgt13q4aeglLSA3u1whZ/VMdbFm
 o6wIly0ZfEllOlrj7Ec8rh2W/+TwyNnLR51VXlVzW5i0hOUa2dYh8iuoVZvMc6xx9D+I
 rZ+BXronNH09WHPSxaGHL6cmAdv+oKHFe1to5ujkNPuMLd3hB9DJjjcMYY2rP8+LcExw
 zOfRVRExxgv5LlglrSWZs1wdPlu3eaJeoDQg+kfIOlHd/c5D/2ujIgisd/dBiFlUKm3c
 OWuQ==
X-Gm-Message-State: AOAM530XosvyRn8HdIBP6GY+CXIZpAUn00xbdwXsxwc0fkszOdoP0F6m
 +6l9qcS9yCJfBc7rUEAzRsuAhC0Ixe5YEq+i0MAptRrxbdcHPQ/J8x6ERmfpW5Z0VJNCmEP0tat
 VciGIgQppUH2hlRtoYEHjwuYvqaG1zBiuUOV4ZFkMVoGkySk2IwgonB3oewjaW7MN
X-Received: by 2002:aa7:d801:: with SMTP id v1mr40141746edq.349.1622656271883; 
 Wed, 02 Jun 2021 10:51:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT4kqDYkTI44tnbYYc6n/89qH4cvPD/VPRhk1fzjbYg4nT0Ik6+kANgVQnPqJM4Ztarbep1w==
X-Received: by 2002:aa7:d801:: with SMTP id v1mr40141725edq.349.1622656271679; 
 Wed, 02 Jun 2021 10:51:11 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id l8sm349538eds.79.2021.06.02.10.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 10:51:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] migration/rdma: Fix cm event use after free
Date: Wed,  2 Jun 2021 19:51:03 +0200
Message-Id: <20210602175105.2522032-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210602175105.2522032-1-philmd@redhat.com>
References: <20210602175105.2522032-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhijian <lizhijian@cn.fujitsu.com>

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210602023506.3821293-1-lizhijian@cn.fujitsu.com>
[PMD: Do not add missing rdma_ack_cm_event() calls]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 migration/rdma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 1cdb4561f32..b50ebb9183a 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1539,8 +1539,10 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
 
                 if (pfds[1].revents) {
                     ret = rdma_get_cm_event(rdma->channel, &cm_event);
-                    if (!ret) {
-                        rdma_ack_cm_event(cm_event);
+                    if (ret) {
+                        error_report("failed to get cm event while wait "
+                                     "completion channel");
+                        return -EPIPE;
                     }
 
                     error_report("receive cm event while wait comp channel,"
-- 
2.26.3


