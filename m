Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8396AFC1E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:20:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiNl-0004Mz-PP; Tue, 07 Mar 2023 20:14:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNj-0004MX-VX
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNi-00022i-Hx
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZoK2di6xsTepZuvXZJ2+V7C+E8PsZ5zr9sGf7es+2dQ=;
 b=Ijxzekw9vEh3niPI1nEAoj63xQZXslu8YXifxb8fGIsTuBXvbPt85dR0n0OvoMOXaSAKaP
 3HIsphqsDwSUoHbnfvDfx64tkEfS4XchGIWIgs7mHAAuz7HGwZekY97DRtVD0e2DlhOgKj
 f53f80RFVmmyVyjuj45i6OPdDaZQqMY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-PlHaKUOwNru7YmdVDzJEUQ-1; Tue, 07 Mar 2023 20:14:12 -0500
X-MC-Unique: PlHaKUOwNru7YmdVDzJEUQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 p36-20020a056402502400b004bb926a3d54so21295113eda.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:14:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238051;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZoK2di6xsTepZuvXZJ2+V7C+E8PsZ5zr9sGf7es+2dQ=;
 b=UDJptNkUWS4D3l7KzFBllqrQEHKQy/V5WlWHvfgCvSxkCXUN1b8V50fkm+DQPxPmA9
 Mv5a+peBHHobEN4KAbOaUIx0gb/vCL4j7FyVW7JuLuLhuKDPV4cvSZ6HgaxnocE1yQaN
 KN1199blnycmn89hszQf8To0+PsVlFi6LPC+Zbu1qohikX/TKh4dqp1I0BirWxrd9Sii
 jOVak/VkWutb6qeC2k3U9ZX4OeV7iq9qv/tgtK7RStYrSG1+5qPJ0BLnf/VbioIbFy+r
 +a+6Xb9zn/aTE51a/nHzsGNa0zFajofsGH1AAvNSdXgfQ2FI05dMRvkv8fEfJ8h8RbX9
 Mb/w==
X-Gm-Message-State: AO0yUKWKnpf9ztQHiEokeeNh7uv9+yFKuy5xGayQoPBXSTCxx/RMbkH/
 ZiIat97PpIJtSflwuztBeEwhz9C+DyHPq9Wdo2aaeXYtzjzZBintozy5u4YnDkRI6yE151gFsBf
 MqWA1+lePVYndqdjZHP4DIwBk7GdXu6UPTtz870y0x+mHs/5cfYh1OuWzd0N5ELyO93qf
X-Received: by 2002:a17:907:7ea5:b0:8a5:3d1e:6302 with SMTP id
 qb37-20020a1709077ea500b008a53d1e6302mr19472022ejc.56.1678238050763; 
 Tue, 07 Mar 2023 17:14:10 -0800 (PST)
X-Google-Smtp-Source: AK7set/UC6lEPQBYtnj9r1QJU3eawvlsCK+PEOjYiDy3e6l7w7f0Nu4GNXoys6/WCuViT7RUE+rOaA==
X-Received: by 2002:a17:907:7ea5:b0:8a5:3d1e:6302 with SMTP id
 qb37-20020a1709077ea500b008a53d1e6302mr19471998ejc.56.1678238050445; 
 Tue, 07 Mar 2023 17:14:10 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 ga1-20020a170906b84100b008b17879ec95sm6747968ejb.22.2023.03.07.17.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:14:10 -0800 (PST)
Date: Tue, 7 Mar 2023 20:14:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fan Ni <fan.ni@samsung.com>, Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 66/73] hw/cxl: Fix endian issues in CXL RAS capability
 defaults / masks
Message-ID: <cb4e642cfa1e6db59448978ba4c00c6f1c4fb8bd.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
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

As these are about to be modified, fix the endian handle for
this set of registers rather than making it worse.

Note that CXL is currently only supported in QEMU on
x86 (arm64 patches out of tree) so we aren't going to yet hit
an problems with big endian. However it is good to avoid making
things worse for that support in the future.

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20230302133709.30373-7-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
---
 hw/cxl/cxl-component-utils.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
index 3edd303a33..737b4764b9 100644
--- a/hw/cxl/cxl-component-utils.c
+++ b/hw/cxl/cxl-component-utils.c
@@ -141,17 +141,17 @@ static void ras_init_common(uint32_t *reg_state, uint32_t *write_msk)
      * Error status is RW1C but given bits are not yet set, it can
      * be handled as RO.
      */
-    reg_state[R_CXL_RAS_UNC_ERR_STATUS] = 0;
+    stl_le_p(reg_state + R_CXL_RAS_UNC_ERR_STATUS, 0);
     /* Bits 12-13 and 17-31 reserved in CXL 2.0 */
-    reg_state[R_CXL_RAS_UNC_ERR_MASK] = 0x1cfff;
-    write_msk[R_CXL_RAS_UNC_ERR_MASK] = 0x1cfff;
-    reg_state[R_CXL_RAS_UNC_ERR_SEVERITY] = 0x1cfff;
-    write_msk[R_CXL_RAS_UNC_ERR_SEVERITY] = 0x1cfff;
-    reg_state[R_CXL_RAS_COR_ERR_STATUS] = 0;
-    reg_state[R_CXL_RAS_COR_ERR_MASK] = 0x7f;
-    write_msk[R_CXL_RAS_COR_ERR_MASK] = 0x7f;
+    stl_le_p(reg_state + R_CXL_RAS_UNC_ERR_MASK, 0x1cfff);
+    stl_le_p(write_msk + R_CXL_RAS_UNC_ERR_MASK, 0x1cfff);
+    stl_le_p(reg_state + R_CXL_RAS_UNC_ERR_SEVERITY, 0x1cfff);
+    stl_le_p(write_msk + R_CXL_RAS_UNC_ERR_SEVERITY, 0x1cfff);
+    stl_le_p(reg_state + R_CXL_RAS_COR_ERR_STATUS, 0);
+    stl_le_p(reg_state + R_CXL_RAS_COR_ERR_MASK, 0x7f);
+    stl_le_p(write_msk + R_CXL_RAS_COR_ERR_MASK, 0x7f);
     /* CXL switches and devices must set */
-    reg_state[R_CXL_RAS_ERR_CAP_CTRL] = 0x00;
+    stl_le_p(reg_state + R_CXL_RAS_ERR_CAP_CTRL, 0x00);
 }
 
 static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk,
-- 
MST


