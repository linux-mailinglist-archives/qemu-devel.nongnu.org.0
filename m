Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF4D3F8DD4
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 20:29:37 +0200 (CEST)
Received: from localhost ([::1]:59638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJK88-0002Tf-11
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 14:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJmW-0003If-Kw
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:07:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJmT-0000Ou-Kq
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:07:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630001232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6hV9/zziKNEk7s6VzPpMvb9Nml78ruzqt2otDpuWxAs=;
 b=Fphm2E3hYa0fm+7iLKIYsSMfPy//etaAbmp9wg87lGE3iko+iLcg18SkKh1q+flxKJwtRj
 D2NZs8GJ+/RRfuheXq9qF+9fRgqrBkaO34seXa+N2eTAsBuuVw/v77Ud7ftYRmotEYvMq2
 lsYx+edOTKpm8mVXjFqwh2/f/FPOzzo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-jdj7beDmPqupS9yJMyZdhQ-1; Thu, 26 Aug 2021 14:07:11 -0400
X-MC-Unique: jdj7beDmPqupS9yJMyZdhQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 a201-20020a1c7fd2000000b002e748bf0544so4669456wmd.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 11:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6hV9/zziKNEk7s6VzPpMvb9Nml78ruzqt2otDpuWxAs=;
 b=sInuzdbUCKNiWWzERSq4ETwr04YRj0O6lg7DglF56jv3/C0y0tXlFYY/66EBtn5Wog
 aJ+N9KKchyezXbjRGWkt1GT9nUE0jut7p53cLHfc1FNXAHD6W2aMDudgyFj8Swm78GZc
 WFJXq9rJFzKTiAuU+DIykmZsPU7gax0glgo+OyXFh4o7DAn0XiiEH6mh4Rv6nVTCm5+C
 4P1TI3odSkSHkMVuIbwjcgjStKE2FF/1SnjmynbSG4jELZgXnWDKQk1tGaBedvItMgTc
 EuFoh0lxsmVqX4oXyqydaq2GNMEnNQAJAUCoeaBug+sCo9RUhhDCIX1WxmVdViQZAl9L
 Vu3w==
X-Gm-Message-State: AOAM533Rtge017VzI1LwfHJ1i56KQln1cRrLg+i2IrBfPvzz2zCvDLQQ
 Y22BRyMM6/37i1cR8DrdpohiVWD72k2m/uzGRvU17gwQCTDNGxuqfuAuvXKu97Tw5qgmRHTsMp/
 9BG53br7yZXqJtVn4wbpp/Gm/2lqR+mtFwTLrLzztKr5KkocBawyZC3y+rdJlRc/K
X-Received: by 2002:a05:6000:9:: with SMTP id h9mr5812798wrx.396.1630001230351; 
 Thu, 26 Aug 2021 11:07:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOOy+Rb53rsNo9rgQv6a5bBsB9kj5286pXqc1RTwbrNwYOjhYGGZJmt5qX2pV2bYyWzX5Stg==
X-Received: by 2002:a05:6000:9:: with SMTP id h9mr5812774wrx.396.1630001230156; 
 Thu, 26 Aug 2021 11:07:10 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 d4sm3934597wrz.35.2021.08.26.11.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 11:07:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/intc/arm_gicv3_dist: Rename 64-bit accessors with 'q'
 suffix
Date: Thu, 26 Aug 2021 20:07:03 +0200
Message-Id: <20210826180704.2131949-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826180704.2131949-1-philmd@redhat.com>
References: <20210826180704.2131949-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU load/store API (docs/devel/loads-stores.rst) uses the 'q'
suffix for 64-bit accesses. Rename the current 'll' suffix to
have the GIC dist accessors better match the rest of the codebase.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/intc/arm_gicv3_dist.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index b65f56f9035..7e9b393d9ab 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -763,8 +763,8 @@ static MemTxResult gicd_writel(GICv3State *s, hwaddr offset,
     }
 }
 
-static MemTxResult gicd_writell(GICv3State *s, hwaddr offset,
-                                uint64_t value, MemTxAttrs attrs)
+static MemTxResult gicd_writeq(GICv3State *s, hwaddr offset,
+                               uint64_t value, MemTxAttrs attrs)
 {
     /* Our only 64-bit registers are GICD_IROUTER<n> */
     int irq;
@@ -779,8 +779,8 @@ static MemTxResult gicd_writell(GICv3State *s, hwaddr offset,
     }
 }
 
-static MemTxResult gicd_readll(GICv3State *s, hwaddr offset,
-                               uint64_t *data, MemTxAttrs attrs)
+static MemTxResult gicd_readq(GICv3State *s, hwaddr offset,
+                              uint64_t *data, MemTxAttrs attrs)
 {
     /* Our only 64-bit registers are GICD_IROUTER<n> */
     int irq;
@@ -812,7 +812,7 @@ MemTxResult gicv3_dist_read(void *opaque, hwaddr offset, uint64_t *data,
         r = gicd_readl(s, offset, data, attrs);
         break;
     case 8:
-        r = gicd_readll(s, offset, data, attrs);
+        r = gicd_readq(s, offset, data, attrs);
         break;
     default:
         r = MEMTX_ERROR;
@@ -854,7 +854,7 @@ MemTxResult gicv3_dist_write(void *opaque, hwaddr offset, uint64_t data,
         r = gicd_writel(s, offset, data, attrs);
         break;
     case 8:
-        r = gicd_writell(s, offset, data, attrs);
+        r = gicd_writeq(s, offset, data, attrs);
         break;
     default:
         r = MEMTX_ERROR;
-- 
2.31.1


