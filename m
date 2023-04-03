Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343306D44F9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 14:55:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjJhq-0002vu-Qg; Mon, 03 Apr 2023 08:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjJhl-0002v7-9c
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 08:54:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjJhj-00032z-N3
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 08:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680526474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HxsPSZ/TaKJw8J39GChw7x8ALqh+XUgy7V0un9pUQro=;
 b=Ywww8e0ZYom9RsgnEiOGw1ShnX9g1YMp1CwKE7LEKR2XoVDHrzwehmgXEfAzHo4J403/uW
 TGyLd8/9oL8dhxRuaLlaFIK4sWAv973yoIQzypbnsGhWWh6WG9wxpyycYSurRnQ0C0PUab
 hyg5WovN9ERXRRZLLbajAsqiyWAK7YA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-VshrGpHfPzafwuk5m_u85g-1; Mon, 03 Apr 2023 08:54:32 -0400
X-MC-Unique: VshrGpHfPzafwuk5m_u85g-1
Received: by mail-ed1-f71.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso40987003edb.4
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 05:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680526471; x=1683118471;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HxsPSZ/TaKJw8J39GChw7x8ALqh+XUgy7V0un9pUQro=;
 b=dN7SUoH3BlOsSuCG5rAXOpBME+anefb+865UcrmiWTPRtTgnUlSGHpIBhlBaNjJRV9
 da3s4vF+VBJbqgKNFEmbqwgoN/fo7KCo188EXIYaQsA8JdVwfdBmrdG01uyLXxpk3usk
 fjm6fsY61MdYhpXzWC8Iu53jQeslnrvGhFxT1RBy0mR1ZtMAtzuBaXxMiMPSIJZ1Zvk1
 rGOkP5mQLfQHirolYpXoRK+zSJ5fbHXcARUHopsnCpk1NTZeRhHupz67bTOQHfogCq+W
 rrm2oacn1l2Wx9Ad8nph6Bzz8gUI5GCf8skQRCU+cVFV++F9UQsaMMRipOa3ZDwnzkM9
 +9PQ==
X-Gm-Message-State: AAQBX9euUyuEhSBOP0/S1hKsZODZfVdx3fl2HxpSkpTp6EdkNu3briRC
 Q4x3WtrSxU/VrevgbbQtSxXXbhyKKM59UMdnTX2XH64ZcAPH7fIsU/yhWJZnJfYpLcSYz8gzVSC
 oxYAAeXt5AANUo+STJOCiY0ZrsT3hR/rtPXd8YQaNqwM1CKrxuNNSqY7g5OJx77q6sUcLseOrqY
 iimQ==
X-Received: by 2002:aa7:cd42:0:b0:4fd:247a:9873 with SMTP id
 v2-20020aa7cd42000000b004fd247a9873mr31683210edw.5.1680526471169; 
 Mon, 03 Apr 2023 05:54:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350bzZZL7GSTI5es0c3AMEjNR24iWZXZeXVFtNmbLexvu6qXw91Qzc7sLwi78tUZPFCjX1Q0u0Q==
X-Received: by 2002:aa7:cd42:0:b0:4fd:247a:9873 with SMTP id
 v2-20020aa7cd42000000b004fd247a9873mr31683195edw.5.1680526470784; 
 Mon, 03 Apr 2023 05:54:30 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a50ce02000000b004fa268da13esm4586104edi.56.2023.04.03.05.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 05:54:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2] lasi: fix RTC migration
Date: Mon,  3 Apr 2023 14:54:29 +0200
Message-Id: <20230403125429.360605-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Migrate rtc_ref (which only needs to be 32-bit because it is summed to
a 32-bit register), which requires bumping the migration version.
The HPPA machine does not have versioned machine types so it is okay
to block migration to old versions of QEMU.

While at it, drop the write-only field rtc from LasiState.

Supersedes: <20230330120319.36069-1-pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/misc/lasi.c         | 4 ++--
 include/hw/misc/lasi.h | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/misc/lasi.c b/hw/misc/lasi.c
index 23a7634a8c3a..ff9dc893ae65 100644
--- a/hw/misc/lasi.c
+++ b/hw/misc/lasi.c
@@ -194,7 +194,7 @@ static const MemoryRegionOps lasi_chip_ops = {
 
 static const VMStateDescription vmstate_lasi = {
     .name = "Lasi",
-    .version_id = 1,
+    .version_id = 2,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(irr, LasiState),
@@ -204,6 +204,7 @@ static const VMStateDescription vmstate_lasi = {
         VMSTATE_UINT32(iar, LasiState),
         VMSTATE_UINT32(errlog, LasiState),
         VMSTATE_UINT32(amr, LasiState),
+        VMSTATE_UINT32_V(rtc_ref, LasiState, 2),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -233,7 +234,6 @@ static void lasi_reset(DeviceState *dev)
     s->iar = 0xFFFB0000 + 3; /* CPU_HPA + 3 */
 
     /* Real time clock (RTC), it's only one 32-bit counter @9000 */
-    s->rtc = time(NULL);
     s->rtc_ref = 0;
 }
 
diff --git a/include/hw/misc/lasi.h b/include/hw/misc/lasi.h
index ecc7065ce858..0a8c7352be21 100644
--- a/include/hw/misc/lasi.h
+++ b/include/hw/misc/lasi.h
@@ -69,8 +69,7 @@ struct LasiState {
 
     uint32_t errlog;
     uint32_t amr;
-    uint32_t rtc;
-    time_t rtc_ref;
+    uint32_t rtc_ref;
 
     MemoryRegion this_mem;
 };
-- 
2.39.2


