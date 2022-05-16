Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAF85283C8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:02:47 +0200 (CEST)
Received: from localhost ([::1]:37216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZR0-0007B3-Oo
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7u-0000ox-T6
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7t-0005Xf-2n
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YtuLKHZQnIkaXOfZ3CPnLzT68FYvl3RPQfjN7N+G8D0=;
 b=BkPQOPMGyweoP3DBPgyaI/X5W2NuWNgddZ6vfgbQ4lsNo7tS3mFshyWyZniah7RGyfq11i
 OsOPTx/id1Ei5cUVAJ70eBA8/nZEEL7put/zU3s2BuzCAILTBlDIS+dXyRMTgSoe7Um4pn
 bZv+jjaBb8a0+xkrrOpYGfUUCDQMgiQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-vYt7-je7NMS13J1ZcQo6TA-1; Mon, 16 May 2022 06:38:55 -0400
X-MC-Unique: vYt7-je7NMS13J1ZcQo6TA-1
Received: by mail-wm1-f69.google.com with SMTP id
 r186-20020a1c44c3000000b00393f52ed5ceso10138999wma.7
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YtuLKHZQnIkaXOfZ3CPnLzT68FYvl3RPQfjN7N+G8D0=;
 b=w8LauHTILqEFpNa7SiVFBiqh7PpnQf9q02pcPqQAtPLm3j39Sb/yGqFmc8tlJ31Ld9
 nQP8Rk1EGXyBWlqEVRRi825/UXZc4zvSKnjMkMKWI6YDGylpFKpFQIkTAu6CVSuXdYJe
 xW/azcKaOPnZo0aIyU0TMuQzkEvPVFWWu6xbbyBl3fkUt9uAhx+q49d6priXWX+Zi12w
 mPF4eJvPjDw9CapyzoPJLjGaW/AbOkxNcsrrMqOHfttv3tEBRRJelGJ0FlfMoMrI+2Ds
 iVhxPqYKB5cpB7LAfh5OenYPQwyqa2Xy7ZCwrlhVCU8D8z1j6LuaO0Sx5PM/9g+ECXR0
 DsPw==
X-Gm-Message-State: AOAM533mRhL7vlr/jwY9m9QBUTvPws7oW+kuJEpCx7YV5iQANRXGl+Sy
 P6ws54AYXIuFLRZnHs55381h8NPydxwEJRz9gFcuawl49wCKLFMSwmSGH3KHWikSeuYo8dkp2jG
 RbDvB3nB4tKbAc4crHq7QWP06AFiN6p1L+ctgicCvAlGcstfvijeUDUSjdx6u
X-Received: by 2002:a7b:c086:0:b0:393:f6fa:cfc7 with SMTP id
 r6-20020a7bc086000000b00393f6facfc7mr27114542wmh.62.1652697533970; 
 Mon, 16 May 2022 03:38:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhYMaLVBS5xW4bDLp9snIpQKb4El2oEZZEA16dQfiF0IDknKojX+IvW251dpfWvCNKNKvWmQ==
X-Received: by 2002:a7b:c086:0:b0:393:f6fa:cfc7 with SMTP id
 r6-20020a7bc086000000b00393f6facfc7mr27114517wmh.62.1652697533685; 
 Mon, 16 May 2022 03:38:53 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b00397071b10dfsm2986416wms.10.2022.05.16.03.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:38:53 -0700 (PDT)
Date: Mon, 16 May 2022 06:38:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 55/91] intel-iommu: update root_scalable before switching as
 during post_load
Message-ID: <20220516095448.507876-56-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

We need check whether passthrough is enabled during
vtd_switch_address_space() by checking the context entries. This
requires the root_scalable to be set correctly otherwise we may try to
check legacy rsvd bits instead of scalable ones.

Fixing this by updating root_scalable before switching the address
spaces during post_load.

Fixes: fb43cf739e ("intel_iommu: scalable mode emulation")
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220317080522.14621-1-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/intel_iommu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 695dd51dc3..53e3f5035d 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3073,13 +3073,6 @@ static int vtd_post_load(void *opaque, int version_id)
 {
     IntelIOMMUState *iommu = opaque;
 
-    /*
-     * Memory regions are dynamically turned on/off depending on
-     * context entry configurations from the guest. After migration,
-     * we need to make sure the memory regions are still correct.
-     */
-    vtd_switch_address_space_all(iommu);
-
     /*
      * We don't need to migrate the root_scalable because we can
      * simply do the calculation after the loading is complete.  We
@@ -3089,6 +3082,13 @@ static int vtd_post_load(void *opaque, int version_id)
      */
     vtd_update_scalable_state(iommu);
 
+    /*
+     * Memory regions are dynamically turned on/off depending on
+     * context entry configurations from the guest. After migration,
+     * we need to make sure the memory regions are still correct.
+     */
+    vtd_switch_address_space_all(iommu);
+
     return 0;
 }
 
-- 
MST


