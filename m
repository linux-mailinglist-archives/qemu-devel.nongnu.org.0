Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5B929E77A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 10:37:37 +0100 (CET)
Received: from localhost ([::1]:34006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY4NE-0002EO-91
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 05:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kY4J7-0005aq-OP
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 05:33:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kY4J5-0006LM-Vv
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 05:33:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603963999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HzihUm8NymkiDBlfQBSISyvHHXOYy17rVLFGNCZADrc=;
 b=WV601rmXcFARmZ4Tv+YoVQF5ucEskXGpxkZ2JwaovKrsyT/Y1QtlzuptmuUuOXUztclTPB
 hhfmIMzMaEN7HVa4cE63AoV6hfGlmEUjGY8bPIwGQAOs5buop9qJDJ0wwJ4oxupz1rTKWz
 HK7RoVRIdNdRN3ErTu1SHbdFP6Y1ldc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-Uq1WoRqAPwuitVOQQi9a1Q-1; Thu, 29 Oct 2020 05:33:16 -0400
X-MC-Unique: Uq1WoRqAPwuitVOQQi9a1Q-1
Received: by mail-ej1-f69.google.com with SMTP id p6so948358ejj.5
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 02:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HzihUm8NymkiDBlfQBSISyvHHXOYy17rVLFGNCZADrc=;
 b=KJa38mHEh057HAIupphERaENH4oqhpU5vpsus56hXsS65h7WmB7Cr8zfAz1dzBcDsT
 S8wIHtI2eLgUHfTx6tWdE6N9Z9b6OjsH7uCG3Toay4CmK9VfTXJlh7tXqUHr4aTXwk4e
 0LdQ67iug+S5SW5Z7xR4E+yoWsyFnLfA/8kI/cexehBniqSRdOPCpYryHWSqHRT93bPI
 I++nqzPz0KGUj4LJQgg+BmCC+M9LRSkpnu/EFPracb47busJJvzHgm73LVCOgoDV6/yS
 9AP5OBP6SBwTqfxUeu83jiUe41Rzo/qk2c+kKb4Hq5JwnMESXscww6M/bCqjlw1V1wNx
 4aPA==
X-Gm-Message-State: AOAM532K4rXlJEu7Y3hxdBGCCoFHvIXV2MwfLLQmwD5YaWiLZhKWX/FY
 sOvVFa/Ixhy/dPRsMpuBOaJYRXjgk1pPh6EUmW6aYLfgV9KMhxJBhShxMw1SfMkZ01vNGPqvyBI
 bP2sbgFHBiUevZQE=
X-Received: by 2002:aa7:c358:: with SMTP id j24mr3017548edr.265.1603963995215; 
 Thu, 29 Oct 2020 02:33:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwXX6GI99gsy25MlesbEa8ZEq08SVfPqsuh/Pi4oyFh5uEmuxTK2+US3kHFJhWYla4MKGuKg==
X-Received: by 2002:aa7:c358:: with SMTP id j24mr3017533edr.265.1603963995059; 
 Thu, 29 Oct 2020 02:33:15 -0700 (PDT)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id y1sm1158610edj.76.2020.10.29.02.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 02:33:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v2 01/25] MAINTAINERS: Cover 'block/nvme.h' file
Date: Thu, 29 Oct 2020 10:32:42 +0100
Message-Id: <20201029093306.1063879-2-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 00:47:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Eric Auger <eric.auger@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "block/nvme.h" header is shared by both the NVMe block
driver and the NVMe emulated device. Add the 'F:' entry on
both sections, so all maintainers/reviewers are notified
when it is changed.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e442b52472..1289bccc972 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1876,6 +1876,7 @@ M: Klaus Jensen <its@irrelevant.dk>
 L: qemu-block@nongnu.org
 S: Supported
 F: hw/block/nvme*
+F: include/block/nvme.h
 F: tests/qtest/nvme-test.c
 T: git git://git.infradead.org/qemu-nvme.git nvme-next
 
@@ -2959,6 +2960,7 @@ R: Fam Zheng <fam@euphon.net>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/nvme*
+F: include/block/nvme.h
 T: git https://github.com/stefanha/qemu.git block
 
 Bootdevice
-- 
2.26.2


