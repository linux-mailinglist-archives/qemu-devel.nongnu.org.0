Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196E83749F9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:13:59 +0200 (CEST)
Received: from localhost ([::1]:47706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leOqE-0002Ma-5m
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOnN-00089p-IJ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOnK-00042S-RZ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nfSqtx2bsWJBI4JnD1Mt3pZTQzkiHMCXAS9LcMiGD6o=;
 b=e4Vgyd2IdMFDq0UWMXWpmX05ob2NmHHPuWcHz+V5R1JKlZME/MHL5Pq1r7jguLZXk48E4F
 6h9TZJARagoT9P0NxggbJ+AiIeS3lrcr6v+ByeHV+peXorXf3ijOV1gjJS0EXBKCSGcM4b
 7zqOAeHcIORxLg7lHXovluZPxV8Jbk4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-HPWenaD1PPeKcoOr84CpNg-1; Wed, 05 May 2021 17:10:56 -0400
X-MC-Unique: HPWenaD1PPeKcoOr84CpNg-1
Received: by mail-wr1-f70.google.com with SMTP id
 l2-20020adf9f020000b029010d6bb7f1cbso1210985wrf.7
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nfSqtx2bsWJBI4JnD1Mt3pZTQzkiHMCXAS9LcMiGD6o=;
 b=Wtn+SjXLp2YbDc/oIWS+MEZEwj7jrrdG6dhkeeIAiAX08j+iZ4Apk3VR50ok7Kza+s
 7UMO0ng13MdFrnKvTeCByjJJvPHOB3nWTvTmwHsCWBicfnQuB1E0FI6rJpCtoMPnQNDY
 YwpGzu6hi1kIXN566ZyhPGNS6Fjb8fgueyJKOKoRNv5iHE4Di17EJWgJKeofdnsRHzW+
 PlqgAn6j5a1BAmbZhT6LWDzqD4gL5Hc5Fuk+dNHR+wgJ+PzFUQqU4iVYXblQqTbeD+W8
 4LVHYZyCKvAgIJ8GUQZhqBRyZ+VA8yY7LPN0Yg6+3I1ktaQtQG+P1jAv80KZSlWuer0v
 kVQA==
X-Gm-Message-State: AOAM533OLClsUc2+3NuKQ+7qosUn1R17CXWHGSw4csaYXXk3J46I8C21
 ClLxPEee7M5eToWNLpRSflFc7qdzGDxdT7qnruqMq1Pj68Q2QHbVhB8WSWsIUL+JE+THAZ87kjy
 BdlikMfT0DfM7k6w7a4Ly+00sUXjmIwpgTjpF5x0xTqN29HsEELZ5a4kqDLCi+ead
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr1005313wrt.179.1620249055108; 
 Wed, 05 May 2021 14:10:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdcO6k4STJUW002h/z1xwQnLLkjuTPTZ/XOg80aMMNDfDaqPBnBBRL5M9D/HGhVmHgmwSWKQ==
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr1005281wrt.179.1620249054847; 
 Wed, 05 May 2021 14:10:54 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id i20sm6168267wmq.29.2021.05.05.14.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:10:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/23] block/vpc: Avoid dynamic stack allocation
Date: Wed,  5 May 2021 23:10:25 +0200
Message-Id: <20210505211047.1496765-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505211047.1496765-1-philmd@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/vpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/vpc.c b/block/vpc.c
index 17a705b482a..9ed144331fd 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -509,7 +509,7 @@ static inline int64_t get_image_offset(BlockDriverState *bs, uint64_t offset,
        miss sparse read optimization, but it's not a problem in terms of
        correctness. */
     if (write && (s->last_bitmap_offset != bitmap_offset)) {
-        uint8_t bitmap[s->bitmap_size];
+        g_autofree uint8_t *bitmap = g_malloc(s->bitmap_size);
         int r;
 
         s->last_bitmap_offset = bitmap_offset;
@@ -556,7 +556,7 @@ static int64_t alloc_block(BlockDriverState *bs, int64_t offset)
     int64_t bat_offset;
     uint32_t index, bat_value;
     int ret;
-    uint8_t bitmap[s->bitmap_size];
+    g_autofree uint8_t *bitmap = g_malloc(s->bitmap_size);
 
     /* Check if sector_num is valid */
     if ((offset < 0) || (offset > bs->total_sectors * BDRV_SECTOR_SIZE)) {
-- 
2.26.3


