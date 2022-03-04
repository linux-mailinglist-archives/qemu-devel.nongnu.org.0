Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EA74CD651
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:27:35 +0100 (CET)
Received: from localhost ([::1]:60760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8u5-0000YN-42
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:27:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8BP-0003jw-Lx
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:41:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8BM-00018r-7J
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:41:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5b8reuTHyuhMIH4vmrxET5yF+Z8FE8Jp8knp1f17Abw=;
 b=E0GSCZRyPCSFNII7awrOtj/wAwfcVCF7C+wO8fqXPwBErXtQWP9xfs7xtLLI3fdUaQ938R
 DVxdciZNlZaJ3MPqelOkQlJUUTjg5nf6hOynjad0/aEfD+YHjl9XaZEmjynEOi3RPe5eM3
 Y6xCtML6qRTKesJP5AbUbR6lzqtBCyk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-FYBwalFnPQ2DluIUzRvz6g-1; Fri, 04 Mar 2022 08:41:18 -0500
X-MC-Unique: FYBwalFnPQ2DluIUzRvz6g-1
Received: by mail-wm1-f72.google.com with SMTP id
 f24-20020a1c6a18000000b00388874b17a8so1034893wmc.3
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:41:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5b8reuTHyuhMIH4vmrxET5yF+Z8FE8Jp8knp1f17Abw=;
 b=1GoU5DwDm7FrD5zkeO7Pb0s2UhFNNjbDxL13Nc9MD0t+AxobHeEEA0q9jbo7rJnqQx
 CIO4g/qNaJH19Pvu2FExYdmhG0pg5ESC3xTwE4nxSdZc86i3eWWAj6sf4OWovgGz90QG
 AFXoFuqLxdB6llQcNheyEXV0sqN8DDj4AhzkFvh4IwRwSDYfUZpmIptr+lc9oSn/jZcL
 ZUm1RmCdwNq7xcI79JnMrBiZIwCH26QvHt6IghBohR1R6gg2wNUDQWZdQwKm7KnAx7n+
 5E8wFb5Wi81gnalB8zJc9U6UB1jDsMgH2H6D6f6zMyrcNQSKzkcc/7H7D4pNpyHhA4U/
 bQOg==
X-Gm-Message-State: AOAM531bgnOd2Jew8Tbh3PBtZ16bIYJ8kAydb10LYhMl2VgEg5eOWUR6
 upbBGbPqqai/NBW8DtBs53tLH1u+b4YEYopvDkRZ3sMR9nwUMsgRak7OwJ+DMTCYreO8mL89zOQ
 Y/5Ha0FCkYCSfO3SJNAHp9CK8KyoZV5PERZLMQ/MonbO+5yDZyViBRPKI8WnY
X-Received: by 2002:a5d:6481:0:b0:1f0:46c3:e6f with SMTP id
 o1-20020a5d6481000000b001f046c30e6fmr8270180wri.692.1646401276539; 
 Fri, 04 Mar 2022 05:41:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8XMvLd/36w2Vh04XqP4XSvPBzInan/xFjLPWCX6b5anm6lrvB5ix88Letq4JXX3Lg3FMg2g==
X-Received: by 2002:a5d:6481:0:b0:1f0:46c3:e6f with SMTP id
 o1-20020a5d6481000000b001f046c30e6fmr8270166wri.692.1646401276310; 
 Fri, 04 Mar 2022 05:41:16 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c4f0f00b0037d62a899b1sm4974710wmq.6.2022.03.04.05.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:41:13 -0800 (PST)
Date: Fri, 4 Mar 2022 08:41:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/45] pci-bridge/xio3130_upstream: Fix error handling
Message-ID: <20220304133556.233983-33-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Goto label is incorrect so msi cleanup would not occur if there is
an error in the ssvid initialization.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220218102303.7061-1-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-bridge/xio3130_upstream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/xio3130_upstream.c
index 5cd3af4fbc..5ff46ef050 100644
--- a/hw/pci-bridge/xio3130_upstream.c
+++ b/hw/pci-bridge/xio3130_upstream.c
@@ -75,7 +75,7 @@ static void xio3130_upstream_realize(PCIDevice *d, Error **errp)
                                XIO3130_SSVID_SVID, XIO3130_SSVID_SSID,
                                errp);
     if (rc < 0) {
-        goto err_bridge;
+        goto err_msi;
     }
 
     rc = pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_UPSTREAM,
-- 
MST


