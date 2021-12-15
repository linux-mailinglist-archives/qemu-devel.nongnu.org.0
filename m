Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DE9476131
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:55:38 +0100 (CET)
Received: from localhost ([::1]:47276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZRC-0007Ax-1L
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:55:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxYxD-0004kd-WD
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 13:24:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxYxB-0007Ou-Sd
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 13:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639592677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7G1VF+PYn/+nnSsAzukj8f/eEEWiK0TuuEhDYLjNh0c=;
 b=Km7DPu+wwqho6VKpaWTKoLY8CyMP8HPZQLqmJU12BQpxXvJd9DZ1nxTpsFueJLE0OxmY77
 VFMlEkV56ISdf5NSBiBzwb8t3QkHb2SrjRooxB0Ksc57BdPYDAqRpWDFaZXS1TpcDGbSgQ
 KJzjBgDauz764yZnEzvSrqThcWZBRJg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-JQWKvfrRMiaGBX2Jei4tvg-1; Wed, 15 Dec 2021 13:24:36 -0500
X-MC-Unique: JQWKvfrRMiaGBX2Jei4tvg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so9353487wms.8
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 10:24:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7G1VF+PYn/+nnSsAzukj8f/eEEWiK0TuuEhDYLjNh0c=;
 b=ubinczpF45h14vHAEQzpgSHd2CvMHRjNPR6+t1V1chR000wB1cR7OEpNvcgJ/eslzf
 FpVkCikuWu1Rp+xKjwXUeNlw+Mk18VE58tt5lNJ396LUWC7yusajKBireXOH3NAXrtMW
 Dq7oZ1qdIKFDwWK2j4D/KensOnCSwqOZ4GPA6dtd5ZsVEK4CahFdj5VVNmVpjues201B
 1DaxtdlnoAfA4i0JWDdFSlKk26Ozd3oyWSO+iM+bd7ctvoVnE2C8e1aUu59OP+QAwbE7
 ccEXvXj8m+XzTjj+D3nFLmZNrauef8Ru+P2jZ0GmDSPF8yhYTu7xHRRscSD00Qf7pq4h
 b/3w==
X-Gm-Message-State: AOAM530o+u3w+yPsSaZvtboIgR3p8BmghMT0mnNuBZeiXEjYvVBx8YB5
 u6Zop1IlJDRdvzUPIG7x2OFjcWVnUyIhm29r/vg+FkK9on3zHSXb3w1zKVrnkcb8kHsJr1yzErW
 8F7wLgd5OPhJpwU/+TpY4kRtES620O0XzlICDYAwO2Fh7SFA+rKsJkfxM013vFzot
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr5527094wrz.127.1639592675051; 
 Wed, 15 Dec 2021 10:24:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/6tQOC94ZVXRnSKKwJy/xHb6zXg14tepShevZlsuwcw/DDwFxXZmzwxaye+nN9pjDKGEubw==
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr5527064wrz.127.1639592674829; 
 Wed, 15 Dec 2021 10:24:34 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id l7sm3197050wry.86.2021.12.15.10.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 10:24:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 1/3] hw/intc/arm_gicv3: Check for !MEMTX_OK instead of
 MEMTX_ERROR
Date: Wed, 15 Dec 2021 19:24:19 +0100
Message-Id: <20211215182421.418374-2-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215182421.418374-1-philmd@redhat.com>
References: <20211215182421.418374-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quoting Peter Maydell:

 "These MEMTX_* aren't from the memory transaction
  API functions; they're just being used by gicd_readl() and
  friends as a way to indicate a success/failure so that the
  actual MemoryRegionOps read/write fns like gicv3_dist_read()
  can log a guest error."

We are going to introduce more MemTxResult bits, so it is
safer to check for !MEMTX_OK rather than MEMTX_ERROR.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/intc/arm_gicv3_redist.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index c8ff3eca085..99b11ca5eee 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -462,7 +462,7 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
         break;
     }
 
-    if (r == MEMTX_ERROR) {
+    if (r != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest read at offset " TARGET_FMT_plx
                       " size %u\n", __func__, offset, size);
@@ -521,7 +521,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
         break;
     }
 
-    if (r == MEMTX_ERROR) {
+    if (r != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write at offset " TARGET_FMT_plx
                       " size %u\n", __func__, offset, size);
-- 
2.33.1


