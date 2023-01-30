Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9769681B42
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:20:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMacd-0002GJ-8Y; Mon, 30 Jan 2023 15:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacU-0002Fm-AP
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacO-0006pA-92
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SU5etPY8Ng5bl2mlfl+wFqwf9p2Zpd9ct1Xf0Z7l6hg=;
 b=ErOtiTyAHcsKFypUb3/PTgUJIaxlUqFp2aVX4Q7rL4o/YzzE+ZuGByOHDBHuNjrKSu1dYW
 JdeL7ez+gmmfru8dr3mYZzOyR+d1nh7YejWEFiIv1dz7VKDNvTi7IpTmVxLRmGkvhDWaHF
 c03oYKlI3NVXOLQmjIuaeq9lqlpXW1c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-435-mhBZGUMLMWCG0XWNoE1qIw-1; Mon, 30 Jan 2023 15:19:05 -0500
X-MC-Unique: mhBZGUMLMWCG0XWNoE1qIw-1
Received: by mail-ed1-f70.google.com with SMTP id
 o21-20020aa7dd55000000b004a245f58006so2752202edw.12
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:19:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SU5etPY8Ng5bl2mlfl+wFqwf9p2Zpd9ct1Xf0Z7l6hg=;
 b=3nqUZZX5j4yskGimyiWtmKTd8aiEkLemEajk53eXgupy3QcTUMoEvZzMXXFAzbNsZW
 K1k5OVi2M8w9eqobShYQIPQ38U1L/3Vmi7tK/0+t4LiU95fEJ5cfpwgH5JkYf+NZWLjB
 9c2jMfrgJ6fjxfkevf+leCdL2G2q3i1ipr+PFKcLNepehV/F03P+nbbidjZVkX6Ed861
 MsV12Tk7Wc3n9AfRoMSMNjHvcgPdwdNyHTo43z0LkZ2dj++xTfRSxNHvwWzASGjSxBDz
 lLQlA4/5EwsuEJ+Rlx0oEBLbozEBlF4ri1jBEQspBy4FBObKYPDw5JSXCZihCeIEYtTc
 FUrg==
X-Gm-Message-State: AO0yUKW+3DzBPBFJUUVNxQ1/1A8V5LvQyOSYkjOOf0pM2RN8JK5jW3uD
 7q5cHCvzQQydBjbdBbydLD6M0DSPSK02SElh3bAetpl2FuDnSZpFRJTaDX1XI1y+658GtBHHU9k
 fmEnlVGnsFzSlh484S3+56/7Je/gz2o+t39eUQFGcE9hdRm4XH8EzZINgV7b+
X-Received: by 2002:a17:907:75ee:b0:878:683c:f0d1 with SMTP id
 jz14-20020a17090775ee00b00878683cf0d1mr14967407ejc.38.1675109944262; 
 Mon, 30 Jan 2023 12:19:04 -0800 (PST)
X-Google-Smtp-Source: AK7set+gCjFhSIK0HVwJDXRWdPdoEOZr0NZNPB6tWHAftDCdh1Bsqg9/aCjBr3IsWvWQuDNt40214g==
X-Received: by 2002:a17:907:75ee:b0:878:683c:f0d1 with SMTP id
 jz14-20020a17090775ee00b00878683cf0d1mr14967397ejc.38.1675109943956; 
 Mon, 30 Jan 2023 12:19:03 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 lf16-20020a170907175000b008787134a939sm7404950ejc.18.2023.01.30.12.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:19:03 -0800 (PST)
Date: Mon, 30 Jan 2023 15:19:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 06/56] vhost-user: Correct a reference of TARGET_AARCH64
Message-ID: <20230130201810.11518-7-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

Presumably TARGET_ARM_64 should be a mistake of TARGET_AARCH64.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20230109063130.81296-1-akihiko.odaki@daynix.com>
Fixes: 27598393a2 ("Lift max memory slots limit imposed by vhost-user")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index d9ce0501b2..6c79da953b 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -48,7 +48,7 @@
  * hardware plaform.
  */
 #if defined(TARGET_X86) || defined(TARGET_X86_64) || \
-    defined(TARGET_ARM) || defined(TARGET_ARM_64)
+    defined(TARGET_ARM) || defined(TARGET_AARCH64)
 #include "hw/acpi/acpi.h"
 #define VHOST_USER_MAX_RAM_SLOTS ACPI_MAX_RAM_SLOTS
 
-- 
MST


