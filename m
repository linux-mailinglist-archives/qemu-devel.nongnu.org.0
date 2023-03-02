Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C756A7CA5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:29:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHZ-00062T-8y; Thu, 02 Mar 2023 03:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHU-0005sZ-7Y
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHS-0002eF-8u
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=06NSXo2usdhJ/Sn5OakCV2a8qNU3uktnLwbikqyYFjw=;
 b=hronxsSbIKNraGWhqIdoGbOQM3MDATsSWcfUt1rY6MTWM9WKlqPGgWXG79zD6inmSkqO5G
 Q5eU4enDtnuCBkpUVpUcP/EjU2q329z5eGkFNQ3UuT+u2exbxQTldSOqMzO2GwzC+HqcxY
 hIhEjlQAe4LOzWfwWx/xtGDqAGLGJiQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-YoJve-9JOIeXgpryXXO2bA-1; Thu, 02 Mar 2023 03:27:12 -0500
X-MC-Unique: YoJve-9JOIeXgpryXXO2bA-1
Received: by mail-wr1-f72.google.com with SMTP id
 l14-20020a5d526e000000b002cd851d79b2so1840283wrc.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:27:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745631;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=06NSXo2usdhJ/Sn5OakCV2a8qNU3uktnLwbikqyYFjw=;
 b=0YpUzytSiqQ8Hh31Z0+IDGRyYHvnR5gGcrVY4pWcUsuSJ6PJlhl6O303IW3kvTN4/b
 Gtms/agBDcsVXnKidkNCiEqXhB/QcOIeVaWFRyRaoSF1TekWIkyRQ8kc3U7sCQ/h3r9C
 +B5NdCgZBl8ON5FtJJoHmnwXvrq6gOOKiyrReX1PWqdyteN0OeZAfri2H+AfPIRoaC6W
 faTGtBLyVbgfx+xLZd4gzhYvXBgFFzDGJUgoN0xmCMlCs3NEHpf9yZs7IElRQWeQLdfy
 y8aOVwBOOn+dH/fi3si4cJWvg/XqBWxO2/Fx6ryEZmbx49lpOmQ7FlkOjuKy+mK/jzm6
 fujQ==
X-Gm-Message-State: AO0yUKWdlSYYltXOAy3CQWtBZ48d8CoJs0YRiJaRV28SFyMhDFdmjW9G
 yVfz6MQg+KTznoifLDA+f5nWHmjehN1P0CK2KuNW9DAbA0gd5AThvTb/lYV8v+fciHw3g9s2a0N
 /q2XqTvCG0qR+8dcHpdqNJqadbYSpjw0qTtIqp2jRAKy5EDVwCl6QTf1Vd1coTjVF+Q==
X-Received: by 2002:a7b:c84a:0:b0:3df:eda1:439c with SMTP id
 c10-20020a7bc84a000000b003dfeda1439cmr790424wml.11.1677745631030; 
 Thu, 02 Mar 2023 00:27:11 -0800 (PST)
X-Google-Smtp-Source: AK7set8/ZUKX+l9j37aSLkPk7tpOqejREZxm3wpcYqkbYLsVwfB3ZjW4L12iAjG/sscRwV36fMDhJw==
X-Received: by 2002:a7b:c84a:0:b0:3df:eda1:439c with SMTP id
 c10-20020a7bc84a000000b003dfeda1439cmr790400wml.11.1677745630635; 
 Thu, 02 Mar 2023 00:27:10 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 h22-20020a05600c351600b003daf6e3bc2fsm5259385wmq.1.2023.03.02.00.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:27:10 -0800 (PST)
Date: Thu, 2 Mar 2023 03:27:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ira Weiny <ira.weiny@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gregory Price <gregory.price@memverge.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Fan Ni <fan.ni@samsung.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 50/53] qemu/bswap: Add const_le64()
Message-ID: <20230302082343.560446-51-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
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

Gcc requires constant versions of cpu_to_le* calls.

Add a 64 bit version.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Gregory Price <gregory.price@memverge.com>
Tested-by: Gregory Price <gregory.price@memverge.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Message-Id: <20230206172816.8201-9-Jonathan.Cameron@huawei.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/qemu/bswap.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index b1650daedf..15a78c0db5 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -125,11 +125,20 @@ CPU_CONVERT(le, 32, uint32_t)
 CPU_CONVERT(le, 64, uint64_t)
 
 /*
- * Same as cpu_to_le{16,32}, except that gcc will figure the result is
+ * Same as cpu_to_le{16,32,64}, except that gcc will figure the result is
  * a compile-time constant if you pass in a constant.  So this can be
  * used to initialize static variables.
  */
 #if HOST_BIG_ENDIAN
+# define const_le64(_x)                          \
+    ((((_x) & 0x00000000000000ffU) << 56) |      \
+     (((_x) & 0x000000000000ff00U) << 40) |      \
+     (((_x) & 0x0000000000ff0000U) << 24) |      \
+     (((_x) & 0x00000000ff000000U) <<  8) |      \
+     (((_x) & 0x000000ff00000000U) >>  8) |      \
+     (((_x) & 0x0000ff0000000000U) >> 24) |      \
+     (((_x) & 0x00ff000000000000U) >> 40) |      \
+     (((_x) & 0xff00000000000000U) >> 56))
 # define const_le32(_x)                          \
     ((((_x) & 0x000000ffU) << 24) |              \
      (((_x) & 0x0000ff00U) <<  8) |              \
@@ -139,6 +148,7 @@ CPU_CONVERT(le, 64, uint64_t)
     ((((_x) & 0x00ff) << 8) |                    \
      (((_x) & 0xff00) >> 8))
 #else
+# define const_le64(_x) (_x)
 # define const_le32(_x) (_x)
 # define const_le16(_x) (_x)
 #endif
-- 
MST


