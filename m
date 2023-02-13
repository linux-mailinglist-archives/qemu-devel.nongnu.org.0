Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BFD694DA7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:05:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcE9-0003dj-RA; Mon, 13 Feb 2023 12:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcDZ-0002r8-9Z
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:02:22 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcDW-0007Wz-IO
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:02:17 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so8600289wmp.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mzRrE5rjXmOyZOi/ZezrjP3KF0ocZr49iG/FcJhUhr8=;
 b=ff77CIRvBqg0FshGIstdyA9ZCiDc0JAEZXrHVLFnhwTGr+T/EdKTV0cbrFkZ6gJ51z
 4iHELRUbGsKzrNckIbac22iCQGelrT1USO6owJ78ClDXKUPMg8fFuNNzWyKBIjCaX3/4
 l4QcF44a7WXpsOko0JU3Nn5ffTD7VHyYnmeJJ5oPfaNVrxHcWP+bn5jWVw6mtUy00Q5V
 Gwhfzy6iiZrjTM7WUghZseaDUVALkeTMdsLxbtyg4rUBWH9QkQoHMSed9V3wim93v50C
 TqYITizvDNCusyl0Avb5zR8BI9qpxlncmVrTdbPfSYUsxmlJo7DUgXUc2RvB/VoqBB90
 7Hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mzRrE5rjXmOyZOi/ZezrjP3KF0ocZr49iG/FcJhUhr8=;
 b=spRkA5N5V8gWQx6R2U7vaf3bbphkeBTUcvL8uF7q9XcV0GDyvYo3l4P+rZ6G+erhrA
 1Z171fLwyfW1XAZ4XjyebWj73v2DhFm/u7KLZtl/utDgOo6mCtAeH8OPCDc0tjvHoSC7
 9riZGXKaalyeDeMh4sgbHpzavHUBsaqRPftVWvxMh2BPzYc4MG4SMwB/9nf1UGT2I7a9
 cDDrhfyFTk7BOPdDLWHhVeDsQZhhbjzsq1KCmBNOi6h2QJTCwRP9LFMtwvrNsGleEwRd
 bRtSafo1h8Ye/EaroBx6qIuxb56Yz0z8+gjRIsGs+hernHDlyCFr5LUafp2wL4WJ8K9c
 bTrg==
X-Gm-Message-State: AO0yUKVQJtrmUR6H+AULb4MH+lbJXsi+wiI2NV4JSBxypDC3EApy1Wes
 ecB666VuCPYIU2bFu37jOrfYiQ==
X-Google-Smtp-Source: AK7set+S49/ewjjHEQNfmGcUdo3/bm3tdDD82VrztEKuMwJ6r5GBZ2EMLz4TyH1xjiW0/9uHVPp+xg==
X-Received: by 2002:a05:600c:44ca:b0:3d9:69fd:7707 with SMTP id
 f10-20020a05600c44ca00b003d969fd7707mr4800553wmo.2.1676307720161; 
 Mon, 13 Feb 2023 09:02:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bg1-20020a05600c3c8100b003e118684d56sm15599282wmb.45.2023.02.13.09.01.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 09:01:59 -0800 (PST)
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
Subject: [PATCH v3 2/6] hw/vfio/ccw: Simplify using DEVICE() macro
Date: Mon, 13 Feb 2023 18:01:41 +0100
Message-Id: <20230213170145.45666-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213170145.45666-1-philmd@linaro.org>
References: <20230213170145.45666-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

QOM parenthood relationship is:

  VFIOCCWDevice -> S390CCWDevice -> CcwDevice -> DeviceState

We can directly use the QOM DEVICE() macro to get the parent object.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/vfio/ccw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 0354737666..503de94ce1 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -618,7 +618,7 @@ static void vfio_ccw_get_device(VFIOGroup *group, VFIOCCWDevice *vcdev,
     vcdev->vdev.ops = &vfio_ccw_ops;
     vcdev->vdev.type = VFIO_DEVICE_TYPE_CCW;
     vcdev->vdev.name = name;
-    vcdev->vdev.dev = &vcdev->cdev.parent_obj.parent_obj;
+    vcdev->vdev.dev = DEVICE(vcdev);
 
     return;
 
-- 
2.38.1


