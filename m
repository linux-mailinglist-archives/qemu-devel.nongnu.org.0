Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FF729AF54
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 15:11:01 +0100 (CET)
Received: from localhost ([::1]:52294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXPgi-0000jq-Hg
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 10:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kXPTA-0003LB-S4
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:57:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kXPT3-0004LR-JR
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603807012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SjDF8zsFaATkfEDLVjf49WgfMXHjaeRfhZvCWiwXv1Y=;
 b=YxXHZAy1iDD+ksAKCf4OLceq28nXiYKIOr5KCekldnJ4JPrehos0aBpH5uDGQVkkzJqGFM
 LCRHwwM2lwAIUR8tjV5YaN5/W6W0E8frABhFQjywZntovG1Dbx5IDoaR0KKDqBSUXhKmiY
 4BU5ZYdzy90xKNi8CqujvW3vd5dKQQc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-jPezFaNvNDWvMvBjPQGuqw-1; Tue, 27 Oct 2020 09:56:50 -0400
X-MC-Unique: jPezFaNvNDWvMvBjPQGuqw-1
Received: by mail-ej1-f69.google.com with SMTP id z25so945724ejd.2
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 06:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjDF8zsFaATkfEDLVjf49WgfMXHjaeRfhZvCWiwXv1Y=;
 b=LgM8kW/vcwG7X3xdDuZL/3XBU9Xfvf1hE4nW1Oytk0fqYg4IRALTHk6DiH5kr5fCdL
 zAvSRF02hYD1ykKf1wc3t9fe/2m7ws3o5vO4dlg3ADyFbxDFaN8Z9WP4sjU6HZk6Bito
 ggpgpCKdqhT3yJXVyUWvd75/pV01TClOheABKIjJkMxjmJzhi0FdAcAIWg6gnE+hQvab
 jnMrThjKM1TKLQhkzJqTj7nMZRR9QS/FWQoju39CHRpq+uXUZGBCHf4BzyWy2EmWLpar
 /eiK0ih5yb+PmU535mj93JEal3gBp9Nqe+iKlvJOWMhIx2czfEfD3TVPL8m4rq65MXNw
 NhCw==
X-Gm-Message-State: AOAM533ehB3oG7OGTs1Cbygv3lI4djlR/il/UXg1JuggqUwqT1HYf5co
 2nJBr2d8i4OiuqxPWYM4FjPTIgNnq000mhNHoPHdO3iKa6cw60lj2CPELGCdEGdHWsGaO1759yc
 JMnSNabmBtT26xaM=
X-Received: by 2002:a50:e61a:: with SMTP id y26mr2436500edm.71.1603807009221; 
 Tue, 27 Oct 2020 06:56:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+DR27WfkIA/GMYrmcTzta+rl+JsgFtdbD+cG83mgOnEso1y5WyQnYYkv6j5zpOEQvUrRoBQ==
X-Received: by 2002:a50:e61a:: with SMTP id y26mr2436470edm.71.1603807009043; 
 Tue, 27 Oct 2020 06:56:49 -0700 (PDT)
Received: from x1w.redhat.com (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id i14sm1028890edu.40.2020.10.27.06.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 06:56:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/25] block/nvme: Make nvme_identify() return boolean
 indicating error
Date: Tue, 27 Oct 2020 14:55:33 +0100
Message-Id: <20201027135547.374946-12-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201027135547.374946-1-philmd@redhat.com>
References: <20201027135547.374946-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just for consistency, following the example documented since
commit e3fe3988d7 ("error: Document Error API usage rules"),
return a boolean value indicating an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/block/nvme.c b/block/nvme.c
index 8b0fd59c6ea..74994c442e5 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -506,9 +506,11 @@ static int nvme_cmd_sync(BlockDriverState *bs, NVMeQueuePair *q,
     return ret;
 }
 
-static void nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
+/* Returns true on success, false on failure. */
+static bool nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
 {
     BDRVNVMeState *s = bs->opaque;
+    bool ret = false;
     union {
         NvmeIdCtrl ctrl;
         NvmeIdNs ns;
@@ -585,10 +587,13 @@ static void nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
         goto out;
     }
 
+    ret = true;
     s->blkshift = lbaf->ds;
 out:
     qemu_vfio_dma_unmap(s->vfio, id);
     qemu_vfree(id);
+
+    return ret;
 }
 
 static bool nvme_poll_queue(NVMeQueuePair *q)
-- 
2.26.2


