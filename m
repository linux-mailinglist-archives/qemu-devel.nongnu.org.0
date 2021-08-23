Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4283F4ECA
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:55:15 +0200 (CEST)
Received: from localhost ([::1]:34444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDEA-0008Nm-R6
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1a-0008RZ-BS
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:42:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1X-0007Ka-S7
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:42:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629736930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ahhZw7UhNiaeiQddaQJNPmtavRWVitOR1ZCYyKxXHQ=;
 b=ZUWIeaTtn8ApgMFoddsw0I5m1AE9gP1Kr4sJZzebkOc96wwexZs3HA59MPrjm1OINnC7Vj
 ZlhHDFCxVpDraZyWyB/uOd5IoHWJCruKiSVyXQRNi2K+ufLcn/OrADiR7P5cIooPGeAdPG
 nNEYbX0lCtdAgGBtqPVQ5YWrvfZUt8U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-YGrN9VRyOSKCRNy98qriIw-1; Mon, 23 Aug 2021 12:42:09 -0400
X-MC-Unique: YGrN9VRyOSKCRNy98qriIw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n20-20020a05600c4f9400b002e6dc6a99b9so195244wmq.1
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ahhZw7UhNiaeiQddaQJNPmtavRWVitOR1ZCYyKxXHQ=;
 b=E4wSGhOKbbJkD+I962x6Fw+86xZ1wVdtko+LAhUCks23EKGwtCLqWRaCHt0J2qZ8Cl
 9MGGmuljvxuMB2af42XrxYj6DfEMV8eZ6GXVYuEkgsU1aqaUOMckt2HCcs8pcJDoAEbf
 VnvESwc50mmmwE1pXXwahloqLqU/Tqg3wXzw6RH/FAIDUAmeum4R9DZ+v5M+QIGuUYoo
 d9++bhS0Wvzc6NKHJMwhOYdk6TAsNcLJdetnlSdJFMDJXIP9p8K78hX/hgdFjc0h7zq9
 HOmCJG/THHrdMsHtaPjGj7Rt0vUK9bPgOJcQeNjlaMwMljlZet5jI7vWN4ALik/84fVN
 VkhQ==
X-Gm-Message-State: AOAM530M3k2CTarTfr87Ge/h72dLuPkIjzEbvrP+Ug2tL2AoWSOvbpzr
 OF4l7gZTplUCGxf/rkesoMzpA1wBMD7nT14ASpOKLsNBAaTQO2wHHeifSSzG590V7cY0X4Ob6dv
 Uow8tJ/w4AQ2PjXYHqNJUS9dATVrhxnaYPRxpw1F2abfj6AVHFEx92FENOvNzKCZZ
X-Received: by 2002:a1c:a5c2:: with SMTP id o185mr1825630wme.34.1629736928411; 
 Mon, 23 Aug 2021 09:42:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5RC9IdJb8SJs6rfbcQqD7kcDryEb9HPPXiTquTariJ+esiuJJexDY4DS5jsKdOf/nbNpmuQ==
X-Received: by 2002:a1c:a5c2:: with SMTP id o185mr1825597wme.34.1629736928186; 
 Mon, 23 Aug 2021 09:42:08 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 p9sm10502547wmq.40.2021.08.23.09.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:42:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 2/5] hw/intc/arm_gicv3: Check for !MEMTX_OK instead of
 MEMTX_ERROR
Date: Mon, 23 Aug 2021 18:41:54 +0200
Message-Id: <20210823164157.751807-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823164157.751807-1-philmd@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.743, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to introduce more MemTxResult bits, so it is
safer to check for !MEMTX_OK rather than MEMTX_ERROR.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/intc/arm_gicv3_dist.c   | 4 ++--
 hw/intc/arm_gicv3_redist.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index b65f56f9035..e62a9cdfa8d 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -819,7 +819,7 @@ MemTxResult gicv3_dist_read(void *opaque, hwaddr offset, uint64_t *data,
         break;
     }
 
-    if (r == MEMTX_ERROR) {
+    if (r != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest read at offset " TARGET_FMT_plx
                       "size %u\n", __func__, offset, size);
@@ -861,7 +861,7 @@ MemTxResult gicv3_dist_write(void *opaque, hwaddr offset, uint64_t data,
         break;
     }
 
-    if (r == MEMTX_ERROR) {
+    if (r != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write at offset " TARGET_FMT_plx
                       "size %u\n", __func__, offset, size);
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 53da703ed84..547281a8961 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -450,7 +450,7 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
         break;
     }
 
-    if (r == MEMTX_ERROR) {
+    if (r != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest read at offset " TARGET_FMT_plx
                       " size %u\n", __func__, offset, size);
@@ -507,7 +507,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
         break;
     }
 
-    if (r == MEMTX_ERROR) {
+    if (r != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write at offset " TARGET_FMT_plx
                       " size %u\n", __func__, offset, size);
-- 
2.31.1


