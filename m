Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 091C43FE9BB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:08:09 +0200 (CEST)
Received: from localhost ([::1]:41994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgpU-0004Rw-3A
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgid-0000gw-Bw
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:01:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgib-0008FZ-V2
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630566061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=arguNxflA2S+jzgAEya6eTJ5GHl9dYzb/Yt+fBA14Bw=;
 b=Tv/9TN9NJGLh480VUVDtWMA2+8hGYhQXl2D38u0Ugr289XCd53FSq3R6Rdfg4vz0Y1nRSy
 q1yh9X82a09GvoN9ei9JTzXmgju+0wrVwpEWZNqnMSc5PWNfE1lCHPpFF40MfX1fvTN3qS
 wR8udDMouyLLYv33WaFuDRgP8eUu00E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-nCo348xuOx6loWDIbv-dXw-1; Thu, 02 Sep 2021 03:01:00 -0400
X-MC-Unique: nCo348xuOx6loWDIbv-dXw-1
Received: by mail-wr1-f71.google.com with SMTP id
 h1-20020adffd41000000b0015931e17ccfso209064wrs.18
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=arguNxflA2S+jzgAEya6eTJ5GHl9dYzb/Yt+fBA14Bw=;
 b=VIA24AGBMWpkI6GOUyT+lB+Tf3uN67ThkLyBzmBiaQTp7tw3SeCUUB1seIxNaVP7y1
 iGKDIVQHCHTY4FppZT5SohJci05mX7HB5QssqSGxO0xEvknwokqBu9Zq7saqRC0R24KN
 7z4KZU1LkKFmyaiJS/Ov71kk9IJnA9YeGos9uU00GqFnFEAH+aSo3rFRq7OfacniaU6Y
 V9w15KbdITr9BnsNcdbtx96F5JsIDzcaDAUOImKVQNv6ZxD+sIGCAKhJj2LbUS/NZyAv
 emUiE/h84eEOckGDHGEemtWUaA2A8XY4TD4KFnKF2mcKRYnTXTZeeiPtbQAK8y4e4f1G
 3E/A==
X-Gm-Message-State: AOAM532x9jrb9x7O/UX28nQtIbWP1GtEIuQtEkv8u1q0yi/btr7oh+XB
 fMJb7NGDk93mhhR/i9PiO1aFiW8zYLFIrhMzIG7EA5uF1stWLywW1KjDSGq/nkbyRWmSWxIKQzk
 0/t6XO0Iv0h4DeWIyOfb9GoQCsJVgSPUiYYD33CMtXospTPXgNNfWCYmDxL4yND/y
X-Received: by 2002:adf:d1a4:: with SMTP id w4mr1776968wrc.233.1630566058939; 
 Thu, 02 Sep 2021 00:00:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwce3M7LpyeIDl7aBBNIHUUHA094XTA5fvajruqoP7By1cxn/DNw3jIgN5FiCaS/c9LeIrCjg==
X-Received: by 2002:adf:d1a4:: with SMTP id w4mr1776935wrc.233.1630566058742; 
 Thu, 02 Sep 2021 00:00:58 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j20sm820512wrb.5.2021.09.02.00.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 00:00:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/11] util/vfio-helpers: Extract
 qemu_vfio_water_mark_reached()
Date: Thu,  2 Sep 2021 09:00:21 +0200
Message-Id: <20210902070025.197072-8-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902070025.197072-1-philmd@redhat.com>
References: <20210902070025.197072-1-philmd@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract qemu_vfio_water_mark_reached() for readability,
and have it provide an error hint it its Error* handle.

Suggested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 77cdec845d9..306b5a83e48 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -721,6 +721,21 @@ qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
     return -ENOMEM;
 }
 
+/**
+ * qemu_vfio_water_mark_reached:
+ *
+ * Returns %true if high watermark has been reached, %false otherwise.
+ */
+static bool qemu_vfio_water_mark_reached(QEMUVFIOState *s, size_t size,
+                                         Error **errp)
+{
+    if (s->high_water_mark - s->low_water_mark + 1 < size) {
+        error_setg(errp, "iova exhausted (water mark reached)");
+        return true;
+    }
+    return false;
+}
+
 /* Map [host, host + size) area into a contiguous IOVA address space, and store
  * the result in @iova if not NULL. The caller need to make sure the area is
  * aligned to page size, and mustn't overlap with existing mapping areas (split
@@ -742,7 +757,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
     if (mapping) {
         iova0 = mapping->iova + ((uint8_t *)host - (uint8_t *)mapping->host);
     } else {
-        if (s->high_water_mark - s->low_water_mark + 1 < size) {
+        if (qemu_vfio_water_mark_reached(s, size, errp)) {
             ret = -ENOMEM;
             goto out;
         }
-- 
2.31.1


