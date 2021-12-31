Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E7E482419
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 14:05:37 +0100 (CET)
Received: from localhost ([::1]:43730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3HbD-000101-QA
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 08:05:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HLX-0006yj-OH
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:49:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HLV-0000qa-U7
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:49:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5twDjfVw/oTpCn6cBBCJzXNnnYheekXKgSPRSk/tbyo=;
 b=aTj+8vIyzbOF1LJL4oX7MK35//UXEqHtjV6FvsO6YvLMP30KiSmsX2GWlJ4jh0CWqDlQws
 sE+exd/TFOQKQM/WlZoqBRu/jzvjxxmpi+HYf9UIEGG5K7G0dOx7s0orHbCAqZWxjiRz93
 +MlxhCmSd5Bqnm3ZVGlaXWvgptRPZz0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-ZNJf99JTNpGQNdOH_XQjeA-1; Fri, 31 Dec 2021 07:49:15 -0500
X-MC-Unique: ZNJf99JTNpGQNdOH_XQjeA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v6-20020adfa1c6000000b001a26d0c3e32so7475454wrv.14
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:49:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5twDjfVw/oTpCn6cBBCJzXNnnYheekXKgSPRSk/tbyo=;
 b=VqlhR7QFW2I0+9NArnTcp22/+cnObCmPcLtT8wDPU+GrTWlOvUs1pq4vTuN34DptGJ
 sJeqdT+SSqg5aDUcz7oiybXH4JXOJqUT48vq8AaynSfk+PvVSL1JkovO6h8bDb6I4W6h
 UBV4mUtUXtqew1K3mGNow1+bsckA4uFxZEZqn3QOI3K5eiNDVHfonJQeSnWcCnkRimdM
 5ho/BKc1hviTm4OCjoTuSdrZLLUdIaN6knSVhppnGcmpHGcTQ3fUO8XJbgVrFO4Q50Wq
 /58m5MmDUsauqQdDzLVy4d9JZv3EMn4ZPgCwBbzCwexhMCbsXHNq78VUodzxNaFvnbC/
 o3TA==
X-Gm-Message-State: AOAM530UKM7Yr35GLZ00EedG+oA7Xt6TR+hfvDO+b6WeSctBblQ23gvv
 xjdqUIeHahnlmgw7ZGfFeQLCZVbhhvCZy4C6QukXWON7ykaXQuXzzs9CF5YBSPWdazYar9Z7zsD
 32hX6R2ZDKrxc8te72WWNEupC7PPzgYPSLEjWy6HGBirzXq7dJF/8Gamh089MzwH7
X-Received: by 2002:adf:f741:: with SMTP id z1mr29545973wrp.54.1640954953875; 
 Fri, 31 Dec 2021 04:49:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDBCnBviOpIeEQUNaD3s4Pg6XjeK+jAvXOg8/JmI2P1j78IsAJsY56lM/US3xdURAST+byUQ==
X-Received: by 2002:adf:f741:: with SMTP id z1mr29545957wrp.54.1640954953646; 
 Fri, 31 Dec 2021 04:49:13 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id 1sm19669463wrb.13.2021.12.31.04.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:49:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/20] MAINTAINERS: Self-recommended as reviewer of "Machine
 core"
Date: Fri, 31 Dec 2021 13:47:52 +0100
Message-Id: <20211231124754.1005747-19-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
References: <20211231124754.1005747-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

I've built interests in the generic machine subsystem and
have also been working on projects related to this part,
self-recommand myself as a reviewer so that I can help to
review some patches familiar to me, and have a chance to
learn more continuously.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211228092221.21068-8-wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 54565368054..fe5eea76f67 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1631,6 +1631,7 @@ Machine core
 M: Eduardo Habkost <eduardo@habkost.net>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
+R: Yanan Wang <wangyanan55@huawei.com>
 S: Supported
 F: cpu.c
 F: hw/core/cpu.c
-- 
2.33.1


