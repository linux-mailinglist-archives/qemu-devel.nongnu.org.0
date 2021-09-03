Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1B94004B9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:16:17 +0200 (CEST)
Received: from localhost ([::1]:49062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDjc-0006T8-G1
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHn-0001Pz-Vy
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHk-0002Pr-VR
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YK/6tC4z9KDPJlWm5GSX2+ZhH64J9HoZElqQqFMEcSI=;
 b=QPHWWv01eUprPDVa+QNEL01vLyT6kBHCfobGSx7VokIujoL7PaqYPJOGiOMIA5TMRK9UeC
 SYL/iKuStg2uK3r+JDM6j76SPeUpOnw3j+SH2OLtjRD5KYqK+6Xw4rwaqk0FWUU/98TpOu
 sMpOpVlsD7kizLg8LXmCOkY/fmBIZWk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-5cqkPzvGMCGMBdwjr2UuiQ-1; Fri, 03 Sep 2021 13:47:27 -0400
X-MC-Unique: 5cqkPzvGMCGMBdwjr2UuiQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 p10-20020a5d68ca000000b001552bf8b9daso1809890wrw.22
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YK/6tC4z9KDPJlWm5GSX2+ZhH64J9HoZElqQqFMEcSI=;
 b=K5OLP0M09msXfqouU9rQ2nyP2FDjFzDBXn1MWcI7JIE9dL+KlBHkSZNRPUPSCxe4Yt
 cqbyolpEBKCzCK8n459A8xEXOi1Xwi8rsjeGCtQKe/W+wlJ1FtDrdnFheooICYLqLKN/
 bLWc0ZIsRSWBGv4uvFRJewGUJcUrluijrO27i0RFuPiUWIIV+mKmwGknkmQOq3SHbn2H
 EzB2yrVAusXumTRG+JmaoV4NyolXuSBFE6n4eXjtIDT/AKnO9JH9wmwzicK4E/r8m5v1
 q5HYGbRVbk6knPzoN9cVqpurifBkyqdFPXcvZ5viDeT1OwiXdDQgyh47kw21ziNVUqqV
 WA8A==
X-Gm-Message-State: AOAM531biROeu5S0Qb1sAgo/EERyvPiCKgDIRXPB7RGYjMQ8vow4u3EB
 xGMOtyEM1+Xw3x+Xc5d+8wvwFVDWxOEadPge7Wh9fqneltZvOfDBJNkR2I+k0or/virCaiKP5vP
 IXN+/+Tnr44SvY7PZnavAsEcpAkkqvjdwy+DkgrXl1EzBIThIyw3CRQ5wGTVch08l
X-Received: by 2002:a5d:504f:: with SMTP id h15mr276252wrt.69.1630691245963;
 Fri, 03 Sep 2021 10:47:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXfGOTKjppiBCawGGdQaZ88W6PQt2FRP6ODEJORPoMNo4hmgz2Z0r5JxVkEK3PuVgwPOQpMw==
X-Received: by 2002:a5d:504f:: with SMTP id h15mr276215wrt.69.1630691245679;
 Fri, 03 Sep 2021 10:47:25 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id l2sm129077wmi.1.2021.09.03.10.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:47:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/28] target/arm: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:07 +0200
Message-Id: <20210903174510.751630-26-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a7ae78146d4..96ff81fe68e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6242,8 +6242,8 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
 
         /* Create alias before redirection so we dup the right data. */
         if (a->new_key) {
-            ARMCPRegInfo *new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
-            uint32_t *new_key = g_memdup(&a->new_key, sizeof(uint32_t));
+            ARMCPRegInfo *new_reg = g_memdup2(src_reg, sizeof(ARMCPRegInfo));
+            uint32_t *new_key = g_memdup2(&a->new_key, sizeof(uint32_t));
             bool ok;
 
             new_reg->name = a->new_name;
@@ -8818,7 +8818,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      * add a single reginfo struct to the hash table.
      */
     uint32_t *key = g_new(uint32_t, 1);
-    ARMCPRegInfo *r2 = g_memdup(r, sizeof(ARMCPRegInfo));
+    ARMCPRegInfo *r2 = g_memdup2(r, sizeof(ARMCPRegInfo));
     int is64 = (r->type & ARM_CP_64BIT) ? 1 : 0;
     int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
 
-- 
2.31.1


