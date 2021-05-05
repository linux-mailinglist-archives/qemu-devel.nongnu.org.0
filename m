Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBC8374A1F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:28:22 +0200 (CEST)
Received: from localhost ([::1]:33292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leP49-0002pf-4i
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOpA-0001v4-EM
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOp2-00056C-Dj
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FUeFPg/DBT6PTTnQUMbBIc/iv0DSckK3YeVFNuGPU00=;
 b=G7c+mrOgcT+LU+q+LPMHWaJFYJME2DzO66SaAYdDLXklBbttj+yzlwGiMdzYtxwO9DQDvM
 ShAkp4L194JJUvFkwLZiUsJzpDF+6QVF3fJYbKtBDKkG1E36OmU+YM0GB0GroKA6UJVyag
 +j5jm/0XE36EuLi6Zz71YIjkbM+P3dU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-8YA1mvV0MdisCBhqYelQ2Q-1; Wed, 05 May 2021 17:12:41 -0400
X-MC-Unique: 8YA1mvV0MdisCBhqYelQ2Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 l2-20020adf9f020000b029010d6bb7f1cbso1212683wrf.7
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FUeFPg/DBT6PTTnQUMbBIc/iv0DSckK3YeVFNuGPU00=;
 b=eY1RrWZCVZe5f+RKnibq7O6ws0gfXiOKkzYnl8kUJNc5TBB7oK/UQxM/+lHU7NR71+
 uSu1cYrg1ExZ66cGfuyAg9Z4t1JkRQqWRGTOYhwrerr+BaBoctnLZ/7iLN9gvNPf061/
 nay9b2RDmXjlp9/uxNU0K1jk94opE3djnZ7pbqY2w+QdqZZh4xvYGACh1Q0ZtoLXMtj9
 bvC8hnWkTJ/JCpr+zs0Jh54yVrBJP0PnEM/I5wZSZlWOZMprdXETQ/SEyihfAPH4gWxR
 yIeU7dnnAEMg7XEh6NuCRWdICIZLqEpFZyLqKyVEI0nzeYUweggbbdfikLjflSCY3ucs
 J11Q==
X-Gm-Message-State: AOAM531rf0h28rpJ0iE7bX6Uoyy9Xz8fbQkNmJ2feO6qtCYwKxxDBuRe
 tGc/s4hlQ7rIDv4O6D7m1SkjHt7E6pj5Oo+46MgsYl443+wMATxj5Zm86/miSYCieFoZyj0T9FK
 exMhgt/yBKyub22g2iVD4Ke263Ke3Eetv/IPt7TNEnXsRXH+57zGmDBTV1BPkwEQg
X-Received: by 2002:a05:600c:4b88:: with SMTP id
 e8mr669502wmp.74.1620249160255; 
 Wed, 05 May 2021 14:12:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyM4vkT9fyrsRuOzWqlqhNnPCxLKxFJ+/jKPVgfZG1Gaf+tSButEFgSsc6olHkT1yfZy+fPmA==
X-Received: by 2002:a05:600c:4b88:: with SMTP id
 e8mr669481wmp.74.1620249160047; 
 Wed, 05 May 2021 14:12:40 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id e18sm725918wrc.85.2021.05.05.14.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:12:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/23] tests/unit/test-vmstate: Avoid dynamic stack allocation
Date: Wed,  5 May 2021 23:10:46 +0200
Message-Id: <20210505211047.1496765-23-philmd@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-vmstate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/unit/test-vmstate.c b/tests/unit/test-vmstate.c
index a001879585e..2d7ef42d73f 100644
--- a/tests/unit/test-vmstate.c
+++ b/tests/unit/test-vmstate.c
@@ -86,17 +86,16 @@ static void save_buffer(const uint8_t *buf, size_t buf_size)
 static void compare_vmstate(const uint8_t *wire, size_t size)
 {
     QEMUFile *f = open_test_file(false);
-    uint8_t result[size];
+    g_autofree uint8_t *result = g_malloc(size);
 
     /* read back as binary */
 
-    g_assert_cmpint(qemu_get_buffer(f, result, sizeof(result)), ==,
-                    sizeof(result));
+    g_assert_cmpint(qemu_get_buffer(f, result, size), ==, size);
     g_assert(!qemu_file_get_error(f));
 
     /* Compare that what is on the file is the same that what we
        expected to be there */
-    SUCCESS(memcmp(result, wire, sizeof(result)));
+    SUCCESS(memcmp(result, wire, size));
 
     /* Must reach EOF */
     qemu_get_byte(f);
-- 
2.26.3


