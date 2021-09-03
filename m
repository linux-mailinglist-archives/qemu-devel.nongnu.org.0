Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B17400468
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:57:13 +0200 (CEST)
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDRA-00021S-PZ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDG4-0007Os-MO
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:45:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDG2-0000ot-9x
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rgz4N5sK9eNw2u+qkgd75rHPsNPlAqGemaTOb2TEMto=;
 b=cJERTV2/4zRXVgv4Ix3Aw16xrEdZe0LYqEmbtHtLqnZ9RzRzA0h0WQLlLZ+clEQrTMQa4c
 VW0mi83qV8rq5evqvio+HyDy7LgKTSZPGG4jT68VqlOyJ0gDrag3MERQj66oDaMA8TX5OY
 7iYAaGqBtOMeVJrMUCAk11jn2xPcr9E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-CuOQ5eB-MTmrTO2f-kkhqg-1; Fri, 03 Sep 2021 13:45:40 -0400
X-MC-Unique: CuOQ5eB-MTmrTO2f-kkhqg-1
Received: by mail-wr1-f71.google.com with SMTP id
 q14-20020a5d574e000000b00157b0978ddeso1818735wrw.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rgz4N5sK9eNw2u+qkgd75rHPsNPlAqGemaTOb2TEMto=;
 b=sfnK7mKDy+bA7tQ+cMDqnM8tSOINGCzNgTN9U6PPWxb8rwPE76wzth8Qu3qOhx7o/q
 umUUEOv3SbAvRAnohCQCGwMP71kdBYYHSLCtOb6GxB2lRyuo7SLYIj+V9pN1QASOT+Y7
 og6Bib7DDQWE2UdWBdJvTUiBnP1sia2d7puJcA5aYp5ruMB+m3dvlQvBxUaQ6tUC80KC
 4Vdgtei4Y2WKiRd7O0XIDTXpOnnd+cGqsZFZKoKq+2LxPupkJWpk8Nby0dodszsyuTTU
 R5SODN6LdYk3k9nr7IsNhQvjkXLgXP0MNQJPzExkSFYqDoQ7fLkYfmPOY+6p7bjCFXBu
 9O9w==
X-Gm-Message-State: AOAM532TBs0LrtXVyzu73nZ3ngnnwF0DHCaQ4eUedTHax/m8DYRNwmwc
 fXgSAb165MKIbLG+i4ApcnrIGe6YkE0geCh5psuGnmnrKzKeABMPRstAQ44dY/KTizJTFO32Dso
 NJmlX8KWJdnDpBDEwTyKmZfgBRkumhDwgHc6r/Asf+tBtP38KFeGg/3RNYU7bEoCo
X-Received: by 2002:adf:8b03:: with SMTP id n3mr230487wra.439.1630691139081;
 Fri, 03 Sep 2021 10:45:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxUQTFn0pSH3mqIPJn6NS/lwalYBnLzKRBcQ/Zv+2L76UepAxA9zqa3bf6N2J0MuiLIjUr4A==
X-Received: by 2002:adf:8b03:: with SMTP id n3mr230452wra.439.1630691138896;
 Fri, 03 Sep 2021 10:45:38 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id d24sm23436wmb.35.2021.09.03.10.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:45:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/28] block/qcow2-bitmap: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:47 +0200
Message-Id: <20210903174510.751630-6-philmd@redhat.com>
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
 block/qcow2-bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 8fb47315515..218a0dc712a 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1599,7 +1599,7 @@ bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
                            name);
                 goto fail;
             }
-            tb = g_memdup(&bm->table, sizeof(bm->table));
+            tb = g_memdup2(&bm->table, sizeof(bm->table));
             bm->table.offset = 0;
             bm->table.size = 0;
             QSIMPLEQ_INSERT_TAIL(&drop_tables, tb, entry);
-- 
2.31.1


