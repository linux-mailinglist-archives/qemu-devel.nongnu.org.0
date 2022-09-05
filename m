Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CDC5AD3E4
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 15:28:54 +0200 (CEST)
Received: from localhost ([::1]:44996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVC9k-00058a-TR
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 09:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oVBNr-0005d2-Pa
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:39:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oVBNj-00067y-8J
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662381554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i45tsI7V00zL4kxDnjzOy3ARohfOCqpKiJ2V7Iz6pSI=;
 b=MO5UCqYAs1QUk11mpVq36Ns4YzDxy2wQ1gXs2C//+6KThPvbRPYlh9hKJ/mv52G7YRuWNE
 FwBJrExR0v2EoVo/JNR/54CdFDSZo5/rqnpqFF9zwCRVraKl7QTcuFn+gQntqsCRgQLvV0
 070ZDoEQmpXcIW1848j6OsbborPWlak=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-459-tD2q_lftN26CAlTw6OX8jA-1; Mon, 05 Sep 2022 08:39:13 -0400
X-MC-Unique: tD2q_lftN26CAlTw6OX8jA-1
Received: by mail-ej1-f69.google.com with SMTP id
 hr32-20020a1709073fa000b00730a39f36ddso2261644ejc.5
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 05:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=i45tsI7V00zL4kxDnjzOy3ARohfOCqpKiJ2V7Iz6pSI=;
 b=oBZOhLyrBrBk8MpxMW6YjUmaUtYJePfOg8PDpF4rGBy2DBp4LJITa4e/Luue1otq6A
 LccGZTEsMaW44fSncrJRMWs69PJKalj+UyvBzdoP0hjDsCqZBeI4jW26TYtS0EGMwWuF
 EMUIDoTZNvu5Lk/KOLFFByaoHRLP4pho5ciJKwQ8aPJNGrsr1Ffb3ZoS3qHAo6FcalYu
 aVKhIUTxPlyeCTBMXx+2hc8kbBubmu4iTRs5gHFzHdzbAWXMlk4XNV7N9iAlB8qtRtbC
 HGYkYzGBPqYJcYKcZTikPXFGFN98/WTPytfN0VCsVEDhbTSsjalOPdcU3SaqN5gyfSqu
 CwHA==
X-Gm-Message-State: ACgBeo2k9wpbvoaEFZiFJsFwCyeQLNtLSly7w7gqUlfen9pFApCLCrHy
 CTcv+WupwrREQPxV2D6LuWcDATKaZ7ACx5Vy00mai6S04Hb3+onYZBycz9i6qN0EHwsb1Qhe9Rh
 jZuabnfwQXHH5V5YZlvOBUeu1QZn7oiDfvO69hcJfteB739fvToo/muJ0jrEC7lkhtXI=
X-Received: by 2002:a17:906:959:b0:741:6f76:546f with SMTP id
 j25-20020a170906095900b007416f76546fmr27722675ejd.32.1662381551903; 
 Mon, 05 Sep 2022 05:39:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR79mG/8OjztZNfRWB2MrEWjSTf79XjgwN04hrUuM6U4ichCp0hsQTibe08pXqle0YznDwJR9g==
X-Received: by 2002:a17:906:959:b0:741:6f76:546f with SMTP id
 j25-20020a170906095900b007416f76546fmr27722658ejd.32.1662381551620; 
 Mon, 05 Sep 2022 05:39:11 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a170906769500b0073c1e339a37sm3830183ejm.149.2022.09.05.05.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 05:39:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2] kvm: fix memory leak on failure to read stats descriptors
Date: Mon,  5 Sep 2022 14:39:10 +0200
Message-Id: <20220905123910.46703-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Reported by Coverity as CID 1490142.  Since the size is constant and the
lifetime is the same as the StatsDescriptors struct, embed the struct
directly instead of using a separate allocation.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 7c8ce18bdd..5acab1767f 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3908,7 +3908,7 @@ exit:
 typedef struct StatsDescriptors {
     const char *ident; /* cache key, currently the StatsTarget */
     struct kvm_stats_desc *kvm_stats_desc;
-    struct kvm_stats_header *kvm_stats_header;
+    struct kvm_stats_header kvm_stats_header;
     QTAILQ_ENTRY(StatsDescriptors) next;
 } StatsDescriptors;
 
@@ -3939,7 +3939,7 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
     descriptors = g_new0(StatsDescriptors, 1);
 
     /* Read stats header */
-    kvm_stats_header = g_malloc(sizeof(*kvm_stats_header));
+    kvm_stats_header = &descriptors->kvm_stats_header;
     ret = read(stats_fd, kvm_stats_header, sizeof(*kvm_stats_header));
     if (ret != sizeof(*kvm_stats_header)) {
         error_setg(errp, "KVM stats: failed to read stats header: "
@@ -3964,7 +3964,6 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
         g_free(kvm_stats_desc);
         return NULL;
     }
-    descriptors->kvm_stats_header = kvm_stats_header;
     descriptors->kvm_stats_desc = kvm_stats_desc;
     descriptors->ident = ident;
     QTAILQ_INSERT_TAIL(&stats_descriptors, descriptors, next);
@@ -3989,7 +3988,7 @@ static void query_stats(StatsResultList **result, StatsTarget target,
         return;
     }
 
-    kvm_stats_header = descriptors->kvm_stats_header;
+    kvm_stats_header = &descriptors->kvm_stats_header;
     kvm_stats_desc = descriptors->kvm_stats_desc;
     size_desc = sizeof(*kvm_stats_desc) + kvm_stats_header->name_size;
 
@@ -4054,7 +4053,7 @@ static void query_stats_schema(StatsSchemaList **result, StatsTarget target,
         return;
     }
 
-    kvm_stats_header = descriptors->kvm_stats_header;
+    kvm_stats_header = &descriptors->kvm_stats_header;
     kvm_stats_desc = descriptors->kvm_stats_desc;
     size_desc = sizeof(*kvm_stats_desc) + kvm_stats_header->name_size;
 
-- 
2.37.2


