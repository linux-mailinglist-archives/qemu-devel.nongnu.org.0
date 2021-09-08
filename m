Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4154041BF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 01:25:39 +0200 (CEST)
Received: from localhost ([::1]:33120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO6wk-0007HV-6P
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 19:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6s7-0006v6-Uq
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:20:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6s5-0002qP-6i
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:20:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631143248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AWN2pZpGs6sHyN/PrFeo6PGJIp1YJY+EJRzHbkMHcxk=;
 b=eFitySEzpqjh8S+blF/SNzqVLEpUBdOl9Tl+W/tlo6SNOaMsUbPVLtr9QFRC+SKfXNh1ce
 +4MjvYeIqHgWHSLNxR21Zvm1DaZoMu/qYaFBul8PzCVbFxxXaN3/yTADnb7KInf2kDt3Mk
 StBfjU7YSg7SugwQnNyiteCvgiUVdHI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-TUhVUoRIMD-SG85XEkZs8g-1; Wed, 08 Sep 2021 19:20:47 -0400
X-MC-Unique: TUhVUoRIMD-SG85XEkZs8g-1
Received: by mail-wm1-f71.google.com with SMTP id
 u1-20020a05600c210100b002e74fc5af71so11784wml.1
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 16:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AWN2pZpGs6sHyN/PrFeo6PGJIp1YJY+EJRzHbkMHcxk=;
 b=sWPDzq80lTlAKhV/h4WhWt03qygonwhp8BpcgXsHN/011zlMRXptUi8dt0b9Im2mK2
 4dz6qcY7limZnMGPdHbkMCCWlE5/D0jw+Jx7T3OVPkb2V5gWNc4ZNPSaX3kqM9/nncdH
 55coMaAfAtdMFXoxkyPE/Dncta43GlvbiXtL4VJ8nAOx7QEIyxcj5trLquISg9Luil+H
 5INnGh2PAIlcB9a5niII8IzY2haVhllRXeEjyS8bJWYKg1ee1xDVOBtUVikoghG4It0X
 Yh+ArHc/u++CiWYsWXg+uHecv4S5wMpEfr54Mk0d1m33YDnPMynB8KC+56TZEYvheawj
 ESfA==
X-Gm-Message-State: AOAM531obL7k6N9rFHSSAVkG1ZKMFzV/xe5spa0fsXMsUi7tpFo4jMCw
 fDEWe6Cr3z0RfGNWww7wLioC8EmJqhdB5vqZ1ewAC926M09QiIzHYFQ7QiVBkjqEd9O5EIMN9Ky
 8ScnnWDsoJp476evgfGjyj44tavfX44lAwki7PqtQsV8KxDdZneNofmetYt4ZvPPb
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr5746041wmq.181.1631143245986; 
 Wed, 08 Sep 2021 16:20:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRx5vddYT6ifvfXuEUZzDhSVwlkW5T8HDOd0oz2QEHRH1Qx3AckLgtuI1lDwOwP+2e9s6Xjw==
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr5746017wmq.181.1631143245705; 
 Wed, 08 Sep 2021 16:20:45 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id p13sm36976wro.8.2021.09.08.16.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:20:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 04/10] block/vvfat: Mark the driver as unsafe
Date: Thu,  9 Sep 2021 01:20:18 +0200
Message-Id: <20210908232024.2399215-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While being listed as 'supported' in MAINTAINERS, this driver
does not have many reviewers and contains various /* TODO */
unattended since various years. Not safe enough for production
environment, so have it taint the global security policy.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/vvfat.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/vvfat.c b/block/vvfat.c
index 34bf1e3a86e..993e40727d6 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3199,6 +3199,11 @@ static void vvfat_close(BlockDriverState *bs)
     }
 }
 
+static bool vvfat_taints_security_policy(BlockDriverState *bs)
+{
+    return true;
+}
+
 static const char *const vvfat_strong_runtime_opts[] = {
     "dir",
     "fat-type",
@@ -3219,6 +3224,7 @@ static BlockDriver bdrv_vvfat = {
     .bdrv_refresh_limits    = vvfat_refresh_limits,
     .bdrv_close             = vvfat_close,
     .bdrv_child_perm        = vvfat_child_perm,
+    .bdrv_taints_security_policy = vvfat_taints_security_policy,
 
     .bdrv_co_preadv         = vvfat_co_preadv,
     .bdrv_co_pwritev        = vvfat_co_pwritev,
-- 
2.31.1


