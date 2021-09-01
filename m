Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DAE3FDFD3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:25:57 +0200 (CEST)
Received: from localhost ([::1]:49532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLT3k-0002ke-BR
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLSy0-0002VW-Oq
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:20:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLSxz-0003rJ-2g
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630513198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kk7AoJgI8qARtyKWpkBg86PldAYgZZy6ZQx9AZo/Lg8=;
 b=hv2oCGEQlD6ZyWXNg0bQplsZ2qlw5Pudm8w9rOWBqSlUr+18HL5P0knQGiH+IDiH+sc7Dx
 Dp+wXVXOxAKHPe/bdRt5TpsbSBbaN27AVdxhxywXY1C/++9LgEn7D5okWm8r7pRpB4V/sl
 Oyo2RoHazY9ZQ3Dd6+GZFjY2OIkhidg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-Hd8ZrFhmPauieLtUqaPgkw-1; Wed, 01 Sep 2021 12:19:57 -0400
X-MC-Unique: Hd8ZrFhmPauieLtUqaPgkw-1
Received: by mail-wr1-f70.google.com with SMTP id
 t15-20020a5d42cf000000b001565f9c9ee8so87844wrr.2
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 09:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kk7AoJgI8qARtyKWpkBg86PldAYgZZy6ZQx9AZo/Lg8=;
 b=FCrDhVQhwX9ZON30wEckqfdsTcTYrLzF+/U7tEe5g8svVkbq90750mwvyyroUXp5LZ
 c1ILKTbDvqgBCnyVja0pZg5zIps9y4YGFBz8XYKN5D76aboCX5d1k6c5OD2YWQxlX+qY
 gBnCLnY86KWK1eYIFbQOZoC+Lap46VUjMX7FV/L6RsmUUDLFEhibxMjTL9qIt02LZYu2
 mn5JzAhQpDrqOaDEgZhLkMyKL97WJ6Szl6hkTJhAoYmHMItT+u7fTkm8qb5fR9qHAg7K
 EJ+OUE1McYZvd4m3xM0cu3a65nQ3nnkIYypufWTvRr8c9x98E+jmeYZqOsL4jmhPv3OH
 L6zw==
X-Gm-Message-State: AOAM531CLki8hejiWjh4++lmfdXWKaBeOgcn1GW0xB2sznqPBo64cjx+
 jq28HcC439GugnYAk/RoITCeHwNZsGv+EkwxAFvL7/niPjNsI/XcVG41gQKhHHyEYL7UUOGZjHH
 Tm1iDB4jim6wtcDfRvXuNtzwicY+2YnMUd2qeubmua9HqIP9w3vRmQlBWZ4sTQgao
X-Received: by 2002:adf:a2c4:: with SMTP id t4mr208616wra.258.1630513194436;
 Wed, 01 Sep 2021 09:19:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXtjZrT9i4QhHU7/wjj9AHlEXNgoQApqEN/duEol5J/c/TZeHwzBqCWcrDF/6SnClSX0v8Ew==
X-Received: by 2002:adf:a2c4:: with SMTP id t4mr208587wra.258.1630513194282;
 Wed, 01 Sep 2021 09:19:54 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f17sm25160170wrt.63.2021.09.01.09.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 09:19:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] memory: Extract mtree_info_as() from mtree_info()
Date: Wed,  1 Sep 2021 18:19:42 +0200
Message-Id: <20210901161943.4174212-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901161943.4174212-1-philmd@redhat.com>
References: <20210901161943.4174212-1-philmd@redhat.com>
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
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While mtree_info() handles both ASes and flatviews cases,
the two cases share basically no code. Split mtree_info_as()
out of mtree_info() to simplify.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/memory.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 3eb6f52de67..5be7d5e7412 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3284,18 +3284,12 @@ static void mtree_info_flatview(bool dispatch_tree, bool owner)
     g_hash_table_unref(views);
 }
 
-void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
+static void mtree_info_as(bool dispatch_tree, bool owner, bool disabled)
 {
     MemoryRegionListHead ml_head;
     MemoryRegionList *ml, *ml2;
     AddressSpace *as;
 
-    if (flatview) {
-        mtree_info_flatview(dispatch_tree, owner);
-
-        return;
-    }
-
     QTAILQ_INIT(&ml_head);
 
     QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
@@ -3316,6 +3310,15 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
     }
 }
 
+void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
+{
+    if (flatview) {
+        mtree_info_flatview(dispatch_tree, owner);
+    } else {
+        mtree_info_as(dispatch_tree, owner, disabled);
+    }
+}
+
 void memory_region_init_ram(MemoryRegion *mr,
                             Object *owner,
                             const char *name,
-- 
2.31.1


