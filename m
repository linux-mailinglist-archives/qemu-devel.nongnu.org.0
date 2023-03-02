Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB9A6A7CA7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:30:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHe-0006tB-IL; Thu, 02 Mar 2023 03:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHF-0005h9-Lm
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeH7-0002bz-9C
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W05d36iyqgPX5XxXyCwMaq0MQ8DCCuia50mu0w9ZGq8=;
 b=f96dXtNpdv9ySMPYFJU89nSY9XRcXjr0nAiNLv0nB8/cfV0sD7npXTsgIv/EmI5/LqK2EM
 RwYIBkhNHqp5M4nB5tZWRZSJIMFjBpQanQ3MF6Rlnc5f8emtyqW0U4upiSByIVAcml5eqd
 gMLRmqQcnOHY3LoW0XkLgZ1mq3pfue4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-u0YNPpVMMZ6O10788MXRww-1; Thu, 02 Mar 2023 03:26:51 -0500
X-MC-Unique: u0YNPpVMMZ6O10788MXRww-1
Received: by mail-wm1-f72.google.com with SMTP id
 m28-20020a05600c3b1c00b003e7d4662b83so950935wms.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745610;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W05d36iyqgPX5XxXyCwMaq0MQ8DCCuia50mu0w9ZGq8=;
 b=nvy3ViyIaElAZF4y1bzquctT91/Zr3+Ja+Rs3TYbfNPVPn1BFzwhSaBevUSWYcCg0/
 TZBNCpspCeREZRXhpvL650AXznCpTJmvzN1FG9QoAVTI/BbyUza9OxtW1PiWhpwNBnfz
 OPLtsAZtSCt+wtMdnOqQ+QbUFYSKPY9DSg/lOQlOn4I6spDUOmFyEoRXORytmNz9B3lI
 svdDgHgsfwuI1TuKbwU8fktitR5WesvG10SX4EZ6DGshtAa+AT78detrLqjLi085HqlV
 +HZy96pFHaxm6IKDM3lp4I+6IBdaU0tHh96W0pX/HTcBAcxu9SPg7fXM+yuzStwXkpzp
 mpPw==
X-Gm-Message-State: AO0yUKX+JplmiF4FMNxOCpls2YaxAjkxjsYPKK8CT0HH9rSPX+Vf9kBC
 aZmiofSb+gGgWaxmrmLOBhccA9YJkxRmIZzprQ6Go8RtnMXY1RDvtdzf3QG16jB2SbIJLGwyjoP
 CAuArLGXtFn7qLs79/79prxFLgzMEe7s5mMzJ66wS2b3GYJI6+Q7PWBmXt5voSoKtbw==
X-Received: by 2002:adf:f847:0:b0:2c6:e7f6:49af with SMTP id
 d7-20020adff847000000b002c6e7f649afmr6508301wrq.27.1677745610040; 
 Thu, 02 Mar 2023 00:26:50 -0800 (PST)
X-Google-Smtp-Source: AK7set/QFJorrIWEopzDdS2L2WIXDcUwWJ2tAuco/rEd1u7beq8jTElK5HEh7116i5/iTIge8zHglA==
X-Received: by 2002:adf:f847:0:b0:2c6:e7f6:49af with SMTP id
 d7-20020adff847000000b002c6e7f649afmr6508286wrq.27.1677745609853; 
 Thu, 02 Mar 2023 00:26:49 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 l8-20020adff488000000b002c557f82e27sm14712293wro.99.2023.03.02.00.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:49 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gregory.price@memverge.com>, Fan Ni <fan.ni@samsung.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 44/53] hw/pci-bridge/cxl_downstream: Fix type naming mismatch
Message-ID: <20230302082343.560446-45-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Fix capitalization difference between struct name and typedef.

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Gregory Price <gregory.price@memverge.com>
Tested-by: Gregory Price <gregory.price@memverge.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20230206172816.8201-3-Jonathan.Cameron@huawei.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-bridge/cxl_downstream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-bridge/cxl_downstream.c b/hw/pci-bridge/cxl_downstream.c
index 3d4e6b59cd..54f507318f 100644
--- a/hw/pci-bridge/cxl_downstream.c
+++ b/hw/pci-bridge/cxl_downstream.c
@@ -15,7 +15,7 @@
 #include "hw/pci/pcie_port.h"
 #include "qapi/error.h"
 
-typedef struct CXLDownStreamPort {
+typedef struct CXLDownstreamPort {
     /*< private >*/
     PCIESlot parent_obj;
 
-- 
MST


