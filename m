Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D28E29E791
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 10:42:23 +0100 (CET)
Received: from localhost ([::1]:50860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY4Rp-0000ej-Vm
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 05:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kY4JH-0005md-AX
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 05:33:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kY4JF-0006OW-M4
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 05:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603964008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hraDvgDvE6lqUS9SKN8n1vi9r/o4Ua52Hm0UVRZeM1o=;
 b=iJ2dyWzFTjVEQgiS1FiRm1E2T30op/zRGDz17DjilV6r1Klbq7kQA8bPSNuXMekd782m9q
 zw9yKNlBhpikrvQZln17inMC+Iu3ccv2CxxDWPtJiylMaQWR4LcKdOy82cobvbLihLNwR5
 u8yfkeNvr1AyI716IVlwVeY9HtVKEDU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-jt87ynU6NIGYq4XtoAIVKA-1; Thu, 29 Oct 2020 05:33:27 -0400
X-MC-Unique: jt87ynU6NIGYq4XtoAIVKA-1
Received: by mail-ed1-f71.google.com with SMTP id bs10so918093edb.22
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 02:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hraDvgDvE6lqUS9SKN8n1vi9r/o4Ua52Hm0UVRZeM1o=;
 b=pqSteSoK4CTauHyRNEW4fDDDBeIZwKip89lnY68JsbaSFQTOCYdQ3Y8m5N1oPl6w5S
 U/W7xZ6m3DwKTD6XxywRztteakNjXhObotcwQL/ysRJR39RdBJx6akQIHW2RziB6+JFM
 AqpfbXGQd9OhOaZOCH/oEwATd0ZXMK1S3fJGsJ8M1OFtps1S5R7VE7V1noi6Qii70Dm2
 Wgsisd9xgBYQw5q+FhEfxC2nHwrA8RqjbZRZKdyo1nRIU/uFaKGOQePgaQOsjYUdXuqz
 r8Oyt6ivb7ruIg/dTr7PF3DDyroCKHFOMNyBbVAgF7jMkI87FnkZcKaCpIoiVZhVZjwb
 9DBQ==
X-Gm-Message-State: AOAM532PxKheueceYFm8BKcV+XfaOrj6wRRZVbjEyTTPfjLUebMrcivV
 PsuaaRPqkYc9OkTyr28Z7lBnSXvdZto62+AEZSF/hLk6aWO5pk6jUXIqnczVrUu9ffg9vLgEuYb
 7n6xc9BEEO95YpGo=
X-Received: by 2002:a17:906:68cd:: with SMTP id
 y13mr2995402ejr.230.1603964005694; 
 Thu, 29 Oct 2020 02:33:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL1Mrs2QuCn8mg3yOsAVD6nuPyNXSDBC6f2UKIVtsts6WHymgLL6DoCvIlNkMGzbLsgAAvtA==
X-Received: by 2002:a17:906:68cd:: with SMTP id
 y13mr2995386ejr.230.1603964005494; 
 Thu, 29 Oct 2020 02:33:25 -0700 (PDT)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id os11sm1126198ejb.104.2020.10.29.02.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 02:33:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v2 03/25] block/nvme: Report warning with warn_report()
Date: Thu, 29 Oct 2020 10:32:44 +0100
Message-Id: <20201029093306.1063879-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029093306.1063879-1-philmd@redhat.com>
References: <20201029093306.1063879-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 01:47:28
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Eric Auger <eric.auger@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of displaying warning on stderr, use warn_report()
which also displays it on the monitor.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 739a0a700cb..6f1d7f9b2a1 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -399,8 +399,8 @@ static bool nvme_process_completion(NVMeQueuePair *q)
         }
         cid = le16_to_cpu(c->cid);
         if (cid == 0 || cid > NVME_QUEUE_SIZE) {
-            fprintf(stderr, "Unexpected CID in completion queue: %" PRIu32 "\n",
-                    cid);
+            warn_report("NVMe: Unexpected CID in completion queue: %"PRIu32", "
+                        "queue size: %u", cid, NVME_QUEUE_SIZE);
             continue;
         }
         trace_nvme_complete_command(s, q->index, cid);
-- 
2.26.2


