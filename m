Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E192D49CB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:09:36 +0100 (CET)
Received: from localhost ([::1]:58630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4qF-0004P6-OZ
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3ux-0004Hj-Ka
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3uu-0000Da-Uq
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHE/uRm8PGtDDHGDXS1NURqOE/Q/b84pUZq/OaljFlE=;
 b=YNDhXy8GwOzfOkA9/GifAub4qNug6PG9QqV4XH9aOlSaULCwX8Q6vPSLYvTSTR/8fc1VPa
 wqcTyNu98c6fn1WJUcM/cj/zkhkI1emndLMtSVlif74srx8wguIkcBsV4Cg3udSak4TKhm
 tmqq0MkMoOEzTqM5IinmB2rTOfHgY3U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-wFQuvWj4MfmONicQHjgWPA-1; Wed, 09 Dec 2020 13:10:18 -0500
X-MC-Unique: wFQuvWj4MfmONicQHjgWPA-1
Received: by mail-wm1-f69.google.com with SMTP id f187so874696wme.3
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:10:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sHE/uRm8PGtDDHGDXS1NURqOE/Q/b84pUZq/OaljFlE=;
 b=b5OPoi+MYAqRHXFn6D7efWbyV6QYYd0HQI1cqS9SdH4lCmorj4GBgIwUgEUrcLzkxC
 ZR+qKrv+4mUCkY54kEtllK/FY9tP6mtF3qJF1cbViSf1gRCljFIILm9f0jzZ8dibpYTn
 tBYGIEH3NywZob7lLeP7Uktj1Gi6PK+ue8qFAdhrl0kcdeoW2bbVX6ZqPdW4qsEMAiWb
 82HGbBEY036u4zbEpuax/SpjbU1CY0mUSkwd9XLdv1v6Lb4Xdz7VOOuss3SM6OJpNeog
 dYScPnVxCGX83wUtEYB4WfCIGbj+fxdnmXf8c5KM7LnHkEcauEdWY/CR5XVP9UWuq+/V
 4Tow==
X-Gm-Message-State: AOAM532IrLshe77RjULU1FC0WVnDW8ebH/C9+qGx9Ipr3yKyTRg6etrM
 f/K4pHJNsbdR3GqdhRmZA5tnYQS9iUYZt8pmOUXoF+uLdmB4VXa++TaQ+BSfE6F4AMPLJo6n9mD
 +YrjLt5TCMVNRDP563nLpv3LoD8MtPhhQBNcwHutiVJSwh40ScNppeB2Zb6Qx
X-Received: by 2002:adf:f143:: with SMTP id y3mr4075870wro.138.1607537416528; 
 Wed, 09 Dec 2020 10:10:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkF+Ks/q0BeYsmKhg6tRWXbUbZBcwW4AgZAZRPrMuv83Ej0LIPX2kz+oGrPt0klt6NLOWQng==
X-Received: by 2002:adf:f143:: with SMTP id y3mr4075845wro.138.1607537416372; 
 Wed, 09 Dec 2020 10:10:16 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id y7sm4773705wmb.37.2020.12.09.10.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:10:15 -0800 (PST)
Date: Wed, 9 Dec 2020 13:10:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 47/65] libvhost-user: drop qemu/osdep.h dependency
Message-ID: <20201209180546.721296-48-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <coiby.xu@gmail.com>,
 Johannes Berg <johannes.berg@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201125100640.366523-5-marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/libvhost-user/libvhost-user-glib.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user-glib.c b/contrib/libvhost-user/libvhost-user-glib.c
index 0df2ec9271..efc9d814e3 100644
--- a/contrib/libvhost-user/libvhost-user-glib.c
+++ b/contrib/libvhost-user/libvhost-user-glib.c
@@ -12,10 +12,16 @@
  * later.  See the COPYING file in the top-level directory.
  */
 
-#include "qemu/osdep.h"
-
 #include "libvhost-user-glib.h"
 
+#ifndef container_of
+#define container_of(ptr, type, member)              \
+    __extension__({                                  \
+        void *__mptr = (void *)(ptr);                \
+        ((type *)(__mptr - offsetof(type, member))); \
+    })
+#endif
+
 /* glib event loop integration for libvhost-user and misc callbacks */
 
 G_STATIC_ASSERT((int)G_IO_IN == (int)VU_WATCH_IN);
-- 
MST


