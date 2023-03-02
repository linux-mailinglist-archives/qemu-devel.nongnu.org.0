Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3614C6A7CDE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:36:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHf-0006xD-4b; Thu, 02 Mar 2023 03:27:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHX-00060K-9t
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHV-0002eg-Kd
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W6p53gX22LqpjFJNMKhB6/zMnZpapMbepMWoGiYnIz8=;
 b=f0jlZb2DbqWfUK52deVI1/zrsJnjGbChFwU4Nv4XbQVMDKsKGOG/gJt/YGwWwTCYfXjfiB
 7N7cHYSulCZFCA/ojaN3RmZ+GP9xlOam8BL00ml4msyYIC45/2M9AhU/0ZABq1UrQ4AhNW
 7Ow2UB+yyWyzV1T0xTWB1hdFlXcLg34=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-19RIydLQOf-oxA6G1ZDWRg-1; Thu, 02 Mar 2023 03:27:15 -0500
X-MC-Unique: 19RIydLQOf-oxA6G1ZDWRg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r7-20020a05600c35c700b003eb3f2c4fb4so744238wmq.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745634;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6p53gX22LqpjFJNMKhB6/zMnZpapMbepMWoGiYnIz8=;
 b=yi0JJLfkq8Svk/LckaL3kQjbxOEiEzT4KPWfHAIXaV5WPHmIMqNypPV7X9iE15s+NH
 jycbdjAReAbAX6i3eRo+Awy/8ESjUMa5vNSPsSm/vxdEnHeQ7eRb37BqHeN33+zBWmMd
 ikwAHoVYYfj/Z3SWmwMytLS5QwDOyXz+2NQOMn3AzfK5XchohtQ/o9RDUy06lw3/WwWy
 i2/teKAJVAsgC271NGekUWR4gi5CGwCQGfDFuk1+SEkpq8lOgIypxNkchZ33Dk0YrMgY
 ZPm+oSp5Jn9Bzoy+XOoUw4iwmnfY0wTJN7095EZaayst11/nAQUw1ZPH2u5obiQ9Qtpf
 TiXw==
X-Gm-Message-State: AO0yUKVtNvpxqaKOgvLGbDOGK2WgzygN87yBbrAE6Az51ZGSXf8EgGrt
 3RPrpq3ZBsKkG3BN3VdcdeFD7E09WDC5Iu451eaXZkaEzX3TAvROxK9g5axfrHj2cMCHzZBJQP3
 XLU8HtjSC9F1cc5zq1xbd0xHD7iei6oAlbMm/kLYzm83LO61DY0i/D8lcPDJm+WGvow==
X-Received: by 2002:a05:600c:1609:b0:3dc:555c:dd30 with SMTP id
 m9-20020a05600c160900b003dc555cdd30mr6853955wmn.27.1677745634114; 
 Thu, 02 Mar 2023 00:27:14 -0800 (PST)
X-Google-Smtp-Source: AK7set8zyDGXZ0yO/q9cNYFn6T9v7CdWE5SK3HoQpUTOcWbSWf+rzFA+bagTk1XDd+e7gj6i+EKOXg==
X-Received: by 2002:a05:600c:1609:b0:3dc:555c:dd30 with SMTP id
 m9-20020a05600c160900b003dc555cdd30mr6853937wmn.27.1677745633847; 
 Thu, 02 Mar 2023 00:27:13 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 j40-20020a05600c1c2800b003dd1bd0b915sm2331487wms.22.2023.03.02.00.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:27:13 -0800 (PST)
Date: Thu, 2 Mar 2023 03:27:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gregory.price@memverge.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Fan Ni <fan.ni@samsung.com>, Fam Zheng <fam@euphon.net>
Subject: [PULL 51/53] qemu/uuid: Add UUID static initializer
Message-ID: <20230302082343.560446-52-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

From: Ira Weiny <ira.weiny@intel.com>

UUID's are defined as network byte order fields.  No static initializer
was available for UUID's in their standard big endian format.

Define a big endian initializer for UUIDs.

Reviewed-by: Gregory Price <gregory.price@memverge.com>
Tested-by: Gregory Price <gregory.price@memverge.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20230206172816.8201-10-Jonathan.Cameron@huawei.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/qemu/uuid.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/qemu/uuid.h b/include/qemu/uuid.h
index 9925febfa5..dc40ee1fc9 100644
--- a/include/qemu/uuid.h
+++ b/include/qemu/uuid.h
@@ -61,6 +61,18 @@ typedef struct {
     (clock_seq_hi_and_reserved), (clock_seq_low), (node0), (node1), (node2),\
     (node3), (node4), (node5) }
 
+/* Normal (network byte order) UUID */
+#define UUID(time_low, time_mid, time_hi_and_version,                    \
+  clock_seq_hi_and_reserved, clock_seq_low, node0, node1, node2,         \
+  node3, node4, node5)                                                   \
+  { ((time_low) >> 24) & 0xff, ((time_low) >> 16) & 0xff,                \
+    ((time_low) >> 8) & 0xff, (time_low) & 0xff,                         \
+    ((time_mid) >> 8) & 0xff, (time_mid) & 0xff,                         \
+    ((time_hi_and_version) >> 8) & 0xff, (time_hi_and_version) & 0xff,   \
+    (clock_seq_hi_and_reserved), (clock_seq_low),                        \
+    (node0), (node1), (node2), (node3), (node4), (node5)                 \
+  }
+
 #define UUID_FMT "%02hhx%02hhx%02hhx%02hhx-" \
                  "%02hhx%02hhx-%02hhx%02hhx-" \
                  "%02hhx%02hhx-" \
-- 
MST


