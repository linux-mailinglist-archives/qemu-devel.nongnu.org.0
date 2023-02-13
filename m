Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0654D694D9B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:04:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcEA-0003jp-Im; Mon, 13 Feb 2023 12:02:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcDa-0002sr-Ji
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:02:22 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcDW-0007a3-K0
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:02:18 -0500
Received: by mail-wr1-x429.google.com with SMTP id bk16so12943998wrb.11
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQaGN2ZmTjyrZEnHrp959iGgJeokZoc0TpE2rWnYg0s=;
 b=UP3p++YPab2rM2Cc+kin5Hor4zwzF3icUymHDjxTdhXtAoyjuuH+XZIPZ87rn0hhla
 OcV5N6RwViYWYNpmDFcUVabF5/HruHG0FKuIxvdBMMOA/DT1SIpDpFoI6g2vQmQI6mRt
 ZNZUetpYrGZGPFOd1c15IlBXWbbvH1B1SVL8QxqAxY7bFf/eaiKYJBQFJu4E9jLY0itz
 6OwnhRWA4wUP9akTUpJ6OQX2PGLtyrtt9/GagKzZogjptXLBCY2/7VqEo7STg8NCjfOx
 7BANwleg/1e77bmHFfTjPlL8Ob0mxHOAz+IyzlJWQJZVRsJYBDB0OpObtxgbeXwdKpGp
 6MnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mQaGN2ZmTjyrZEnHrp959iGgJeokZoc0TpE2rWnYg0s=;
 b=nTI9hvsFtjcTBLV8BNUqc7lQDW7ZQB6mUVcklDU8RL3jJ3zgMJnIo2c/UGruSqpBPk
 mrGtan1HkBEXSW8QTetUc4Lbv80HjBd6WSoJsnzm6HZRHlaMlyHRk3wOfn+CgUT8RzJ0
 37cVEo+qk6WxausbNQ9s1uqsZSce4HmB4uZVGIhRs0LW9oLNJGTa2rdvWULmphsRTL0V
 w9Z2E1Z3B0zFTtlOFQiUzp97XPn2LOTRmteab1xN6A5L5qtiAA8ChlA+1b7xeeR0leFa
 /Cu+d/1IGYPrfQko2Hw/7af8sxIxO2cLKIzuqt0sHBeYoCQjkY4WIXHbI+t9s5vdSEus
 i19A==
X-Gm-Message-State: AO0yUKW5LqqnKRGngf+4RFuobKG1JJHNw2HBnxQPO+m7UUbh9lrfoCv/
 0TRxlWXPLTdqzFvdQxaw3o1Ylg==
X-Google-Smtp-Source: AK7set/NOjFEbTQDW+gbHIABBFXhQvk4GlWxl3IZ7ATfJFzujOJHXCCNJSawnT2ojixM7dO97SbU4g==
X-Received: by 2002:a5d:5005:0:b0:2c5:584b:4f65 with SMTP id
 e5-20020a5d5005000000b002c5584b4f65mr3300155wrt.32.1676307725463; 
 Mon, 13 Feb 2023 09:02:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j37-20020a05600c1c2500b003daf6e3bc2fsm25153430wms.1.2023.02.13.09.02.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 09:02:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>, Eric Farman <farman@linux.ibm.com>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 3/6] hw/vfio/ccw: Use intermediate S390CCWDevice variable
Date: Mon, 13 Feb 2023 18:01:42 +0100
Message-Id: <20230213170145.45666-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213170145.45666-1-philmd@linaro.org>
References: <20230213170145.45666-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

'cdev' is VFIOCCWDevice's private parent object.
Access it using the S390_CCW_DEVICE() QOM macro.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/vfio/ccw.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 503de94ce1..2c20e3c202 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -588,9 +588,10 @@ static void vfio_ccw_put_device(VFIOCCWDevice *vcdev)
 static void vfio_ccw_get_device(VFIOGroup *group, VFIOCCWDevice *vcdev,
                                 Error **errp)
 {
-    char *name = g_strdup_printf("%x.%x.%04x", vcdev->cdev.hostid.cssid,
-                                 vcdev->cdev.hostid.ssid,
-                                 vcdev->cdev.hostid.devid);
+    S390CCWDevice *cdev = S390_CCW_DEVICE(vcdev);
+    char *name = g_strdup_printf("%x.%x.%04x", cdev->hostid.cssid,
+                                 cdev->hostid.ssid,
+                                 cdev->hostid.devid);
     VFIODevice *vbasedev;
 
     QLIST_FOREACH(vbasedev, &group->device_list, next) {
@@ -611,7 +612,7 @@ static void vfio_ccw_get_device(VFIOGroup *group, VFIOCCWDevice *vcdev,
      */
     vcdev->vdev.ram_block_discard_allowed = true;
 
-    if (vfio_get_device(group, vcdev->cdev.mdevid, &vcdev->vdev, errp)) {
+    if (vfio_get_device(group, cdev->mdevid, &vcdev->vdev, errp)) {
         goto out_err;
     }
 
-- 
2.38.1


