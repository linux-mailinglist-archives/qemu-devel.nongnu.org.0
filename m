Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7457965318D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:18:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ynn-0006ai-PJ; Wed, 21 Dec 2022 08:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynh-0006R3-PE
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynf-0004Vi-Ib
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o3jX7C5Aw744uKwkAVb0g5nxr4VOJ9b/gRPk+zP0tyc=;
 b=dORafdgFzqDk9ae8R6ZHPYg/j7yaufX/+nBnHI/OXXXnaKwSSQ3hC9llQalR71IsZVp8q6
 MsDBUjzxiQOqWkannQSR3TWKYmaCNk52r2NTnD7yMfpeqMuYxH2SihU9eEZm+cY1/Xup17
 8fkYCQiuk/y8KHcs0JkLGBCPuFZecKo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-8yhJcA-ZMLaNkbM_v0nD6w-1; Wed, 21 Dec 2022 08:06:21 -0500
X-MC-Unique: 8yhJcA-ZMLaNkbM_v0nD6w-1
Received: by mail-wr1-f72.google.com with SMTP id
 m24-20020adfa3d8000000b00242168ce9d1so2884294wrb.15
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:06:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o3jX7C5Aw744uKwkAVb0g5nxr4VOJ9b/gRPk+zP0tyc=;
 b=Z2tG5xPLhBOZCHgFc+rn65qPTDQqtAvB1pp4LdbfFTP/Y/xdFL7x/KX5T1FZx6xa9N
 wwpHG/KvfdHaDGoqkT8jCG5s3k2eWgDRYJgj0pLygoFr5RmNMlCP57TJSZK1pSPwpiZn
 yh1jt3+PFyitDE/T+Y94AZd+6Sh0o7A5WIOJOVxn0xGbQqqAal+QNjHUvEj+fUyfHzWS
 dZNn2a64d7WTcKIrohyII61w/kzjseRyBKTqCFajutcYv8fO2bIbDXuwzrhb3ns4648k
 h8cpVJ+d8sJB1mtR1lg6XCcarQ8z/xTs8e+Oy1XiZPiV7A/z9KWZSvzafU4dkt1bHWL5
 dOSg==
X-Gm-Message-State: AFqh2krDjr+yXm6Mivb8+C5NsrCEDihXTvdr8aCErBk0OQHYxYHrDf+L
 oeiuramRriX3xMpz8f9DGGCQ34p5ViIP6hTyX2H6o/5J3H8B4hbhq/2sSfMrRFOa+698PRNfnqZ
 OjJROSuopNabFwjhxHZ6LtiSUQKuJSnk0/Gte7luA8NHBKg/SF1VeBf7PARml
X-Received: by 2002:adf:dd92:0:b0:242:39bc:4ac with SMTP id
 x18-20020adfdd92000000b0024239bc04acmr988247wrl.51.1671627980099; 
 Wed, 21 Dec 2022 05:06:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt7zQaGeEOZZSTq3UVWgA0fJSnFCkvHDycgzb+YXgsMUy7NBZ23lkTgr4AOSa5q6aR6kSjVNg==
X-Received: by 2002:adf:dd92:0:b0:242:39bc:4ac with SMTP id
 x18-20020adfdd92000000b0024239bc04acmr988225wrl.51.1671627979801; 
 Wed, 21 Dec 2022 05:06:19 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 u4-20020a5d4344000000b00242710c9910sm15300724wrr.8.2022.12.21.05.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:06:19 -0800 (PST)
Date: Wed, 21 Dec 2022 08:06:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ira Weiny <ira.weiny@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 33/41] hw/cxl/device: Add Flex Bus Port DVSEC
Message-ID: <20221221130339.1234592-34-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Ira Weiny <ira.weiny@intel.com>

The Flex Bus Port DVSEC was missing on type 3 devices which was blocking
RAS checks.[1]

Add the Flex Bus Port DVSEC to type 3 devices as per CXL 3.0 8.2.1.3.

[1] https://lore.kernel.org/linux-cxl/167096738875.2861540.11815053323626849940.stgit@djiang5-desk3.ch.intel.com/

Cc: Dave Jiang <dave.jiang@intel.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>
Cc: qemu-devel@nongnu.org
Cc: linux-cxl@vger.kernel.org
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
Message-Id: <20221213-ira-flexbus-port-v2-1-eaa48d0e0700@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/mem/cxl_type3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 255590201a..dae4fd89ca 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -295,6 +295,17 @@ static void build_dvsecs(CXLType3Dev *ct3d)
     cxl_component_create_dvsec(cxl_cstate, CXL2_TYPE3_DEVICE,
                                GPF_DEVICE_DVSEC_LENGTH, GPF_DEVICE_DVSEC,
                                GPF_DEVICE_DVSEC_REVID, dvsec);
+
+    dvsec = (uint8_t *)&(CXLDVSECPortFlexBus){
+        .cap                     = 0x26, /* 68B, IO, Mem, non-MLD */
+        .ctrl                    = 0x02, /* IO always enabled */
+        .status                  = 0x26, /* same as capabilities */
+        .rcvd_mod_ts_data_phase1 = 0xef, /* WTF? */
+    };
+    cxl_component_create_dvsec(cxl_cstate, CXL2_TYPE3_DEVICE,
+                               PCIE_FLEXBUS_PORT_DVSEC_LENGTH_2_0,
+                               PCIE_FLEXBUS_PORT_DVSEC,
+                               PCIE_FLEXBUS_PORT_DVSEC_REVID_2_0, dvsec);
 }
 
 static void hdm_decoder_commit(CXLType3Dev *ct3d, int which)
-- 
MST


