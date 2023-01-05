Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3974D65E82F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:49:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMMK-0003AF-60; Thu, 05 Jan 2023 04:16:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMM1-0002uQ-1L
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLy-0007Qu-K4
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G4hrXMd4rDUPal0M2TeW9Ma+sAaS0nVkSbNj4tpH6/8=;
 b=KCKCSXZEQcuBytfogY1QqM0vbeipQ0vdgdr1RX1bjjTNVCsSiH5s8cRCihsJx3UfqhT3Qi
 4VyetFgPnBvn1AHtpC4thgMBng5CeZzjOpL4DsLPEA9MO0EVUN37V/gXwrzRWgWmdahPbZ
 ND3WexFAH0vJ9fJzahlQoFoYUEaxbUE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-lncqDwu7MaSYcW5vAS6sgA-1; Thu, 05 Jan 2023 04:15:54 -0500
X-MC-Unique: lncqDwu7MaSYcW5vAS6sgA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v4-20020adfa1c4000000b002753317406aso3915825wrv.21
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:15:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G4hrXMd4rDUPal0M2TeW9Ma+sAaS0nVkSbNj4tpH6/8=;
 b=U6goBWHuSuzkxTJPB4ACpDlxn8Wa3YVHBAvGFNXydMlLaj07GhILrtDET90VbTCVYv
 O5hxVyMTTYfurRNkdby4O7SZfIVx2EjckhHgf85MeGYbUW2GwcD4PK/2j9LkoOOju3Zq
 AUMnLVev2aI4ItUfCdvx8JwJpRJ+pfdARI0318eQxeLPD6855wmI3P/p9taDfS8U8rwP
 aHfS1XjqrdjLSitu0lIhdc/9z5YWEbTeWl7ncyH7Mz3ZgNTq3tW4qrCRmTopwRwBt61Q
 lfQGfy17kpGQqU5107vTxFGgD44biDGecHCv3WfNuzD+r7sb37eJ5Go6ywDFBdsysZlG
 lbgA==
X-Gm-Message-State: AFqh2konzJUF33phxZp7uG5FlQxoqz+83Lbcw7/b7afZoMwstdZvtNIB
 +cij4QGpiLq407Eu/bkwcWX1FNyRa2c0yQU4sjr/iQw6Ogn02DdQz5xtebaJ5hBEchWgwF1jz6e
 LyJ9cJZejRjxrK/JDJlsf1HKvlD0RqRoLrA/42Tmp/ESM5n1tfId6XtQ0x7WD
X-Received: by 2002:a05:6000:16c3:b0:28f:9b3d:c294 with SMTP id
 h3-20020a05600016c300b0028f9b3dc294mr15105273wrf.46.1672910152560; 
 Thu, 05 Jan 2023 01:15:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvt0jyUvvjnQzs2pshw8SiePx3C0HCEtnzHZ6upTSE/RcZvIcv1UTkNIC6CElX31XPdR972Aw==
X-Received: by 2002:a05:6000:16c3:b0:28f:9b3d:c294 with SMTP id
 h3-20020a05600016c300b0028f9b3dc294mr15105260wrf.46.1672910152308; 
 Thu, 05 Jan 2023 01:15:52 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 r13-20020adfa14d000000b002779dab8d85sm32840182wrr.8.2023.01.05.01.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:15:51 -0800 (PST)
Date: Thu, 5 Jan 2023 04:15:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 29/51] include/hw/cxl: Include hw/cxl/*.h where needed
Message-ID: <20230105091310.263867-30-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
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

From: Markus Armbruster <armbru@redhat.com>

hw/cxl/cxl_component.h needs CDATObject from hw/cxl/cxl_cdat.h.

hw/cxl/cxl_device.h needs CXLComponentState from
hw/cxl/cxl_component.h.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20221222100330.380143-4-armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_component.h | 1 +
 include/hw/cxl/cxl_device.h    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index 34075cfb72..5dca21e95b 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -18,6 +18,7 @@
 #include "qemu/compiler.h"
 #include "qemu/range.h"
 #include "qemu/typedefs.h"
+#include "hw/cxl/cxl_cdat.h"
 #include "hw/register.h"
 #include "qapi/error.h"
 
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index fd475b947b..3f91969db0 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -10,6 +10,7 @@
 #ifndef CXL_DEVICE_H
 #define CXL_DEVICE_H
 
+#include "hw/cxl/cxl_component.h"
 #include "hw/pci/pci.h"
 #include "hw/register.h"
 
-- 
MST


