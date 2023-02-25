Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CB06A2ABA
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 17:33:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVxT0-0006xx-FZ; Sat, 25 Feb 2023 11:32:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pVxSt-0006wq-K0
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 11:32:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pVxSs-0007pL-3N
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 11:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677342721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3nMIHYNGqj7vLSxK7AMfLxIZi6naTf38R3aAeG349Ag=;
 b=F/TE1+492oAuu6gm/1qyQI4PDa8vle/N4DTWsOcWodY1UTq+iS9sXUQtKAQMAAPFda//tZ
 sqzyBY8FFAnk3REwWuCkEyhDi2HSPvWd3xKM13syo9SBKCKKZGLKVUJBalkZuZLkCpqBYI
 aM58425HeRCXC++NvWiUENClthcTuD8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-4QOT8huHP5urebqR2WVUMg-1; Sat, 25 Feb 2023 11:31:59 -0500
X-MC-Unique: 4QOT8huHP5urebqR2WVUMg-1
Received: by mail-qt1-f199.google.com with SMTP id
 k19-20020ac86053000000b003bd0d4e3a50so1297431qtm.9
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 08:31:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3nMIHYNGqj7vLSxK7AMfLxIZi6naTf38R3aAeG349Ag=;
 b=nB/3Is3mpmbhr5yiUGSu1SAUdNIQXl+HPlY4EsRlT3UIKxFWDu+tcJeGkKuvkdJNzH
 LxLQA+Y42Uxg/tNqZGVxq/YuCeOTQrgioTwhuSIZ1XVdEWDsernW9+D7U9xxzzFc2hay
 oQdqcyXAXB3a3q6lA6p8kwqAvg6V0nYPlrx23UdTxbx3vR+Kf7Xpspln0echsKMBVbTs
 543TWsPsrz3RCjeLyKLK7Jz7BjcRi7/McgeBoHWPPG4WzjR6MQNLkgPCFMuqsLfyXDfu
 d1dg+4IYhDxDl6MInCI/vNw8L55zQqjAXmcI2rKPm5mToXy62MCxVyoM33xyo0ltJhPo
 QjSg==
X-Gm-Message-State: AO0yUKWrssx5U71yKcx9/E/zvDHXs1L6QcdetMrR6gfX2vOlGLZVJX9N
 6rqXX8M/4tIyRHVGy+oxsaDVExLoOUc7xkbt2Be5sXak1Qkc1ArzdT28rhYuI1g4uJOuOZK+K2f
 /jVpYHWcaKKHJoZTThm1Ypr2XFo9i9QTHyGXbfrXBGanOEJS5QQ/tF9yMrebM9PgKIE+2AA==
X-Received: by 2002:ac8:4e95:0:b0:3bd:142d:64dd with SMTP id
 21-20020ac84e95000000b003bd142d64ddmr38418067qtp.3.1677342718704; 
 Sat, 25 Feb 2023 08:31:58 -0800 (PST)
X-Google-Smtp-Source: AK7set/lSZKXf7vWwi/Zzxa116T4q2pNIIs8HJZOGIQGZnmfMGocBg6pV1BIV0QE8zaptUMUqy+pbg==
X-Received: by 2002:ac8:4e95:0:b0:3bd:142d:64dd with SMTP id
 21-20020ac84e95000000b003bd142d64ddmr38418014qtp.3.1677342718305; 
 Sat, 25 Feb 2023 08:31:58 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 t8-20020ac85888000000b003bb8c60cdf1sm1558142qta.78.2023.02.25.08.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 08:31:57 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Chuang Xu <xuchuangxclwt@bytedance.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 peterx@redhat.com
Subject: [PATCH RFC 4/4] memory: Use rcu traversal in
 memory_region_to_address_space
Date: Sat, 25 Feb 2023 11:31:41 -0500
Message-Id: <20230225163141.1209368-5-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230225163141.1209368-1-peterx@redhat.com>
References: <20230225163141.1209368-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

memory_region_to_address_space() is the only function that walks the
address_spaces list using RCU read lock only.  Use the RCU walker to
reflect that.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 95cdcaeccf..0b652d9597 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -566,7 +566,7 @@ static AddressSpace *memory_region_to_address_space(MemoryRegion *mr)
     while (mr->container) {
         mr = mr->container;
     }
-    QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
+    QTAILQ_FOREACH_RCU(as, &address_spaces, address_spaces_link) {
         if (mr == as->root) {
             return as;
         }
-- 
2.39.1


