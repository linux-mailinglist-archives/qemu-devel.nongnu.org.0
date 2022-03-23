Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA644E51B7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:59:47 +0100 (CET)
Received: from localhost ([::1]:35634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzeU-0003bW-BX
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:59:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWzSr-0002Rp-KI; Wed, 23 Mar 2022 07:47:45 -0400
Received: from [2607:f8b0:4864:20::736] (port=39903
 helo=mail-qk1-x736.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWzSo-00029Y-6d; Wed, 23 Mar 2022 07:47:45 -0400
Received: by mail-qk1-x736.google.com with SMTP id w141so536340qkb.6;
 Wed, 23 Mar 2022 04:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5PIC61N2M3lzbcTlPTCWJ9gSsRzjOqLZ2B8i5p3FTdA=;
 b=ld8Kqgyb9fP9lYKeEzOcpCz6JPqPGkuRFtY6aMEYTJaqwlIJrsat4GNZ8eI1LJIjyp
 Bh7KMOhAhcm4+a6FODv0A18zCEhm1WS+oNN6/i5hofrCzSxP/bpY8pk8X9Q+znhNP7ft
 rTjv953e+H+z4hHgYgcVpx8/48gFibXxffUA5CpBM6JM0R9CySFsEkehJMwD7q6hAMl+
 DyBB1T007QGpoaLAkDHdr3KaUPtVhK7UTm84Gd7fZWbTrJUpNECP3LT12v/a+D1D1yZW
 ydzly09TGNcn2fOHjN5qC7zDfvHokR7QgP3QtacBA60OyhTcXYVbOHGivpQ7YGZkXC3X
 EG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5PIC61N2M3lzbcTlPTCWJ9gSsRzjOqLZ2B8i5p3FTdA=;
 b=L5jaVaQF+YHd0rBfoCZNkBHzhDi9rsskJ1T4gX6DxXmLHKYXYxwBHMvyjE2kpDf6qL
 KdCjyW7/5HUpZctDpF7El3DK9hdJ2dRtI1Ti4I4WfvN9v1R6NX+ptSgAM2IKTjOBlKC4
 dKI9Q8R6wQEV8r0/uiGjikdD/ExWs5yww0ZHZdwJYW5Eht6So1vP9Mnw9KNtn8sG/ovV
 5GmUhsLXfN96MZe3RCqD1NPJwI6qSl+TvPAKgebcW1aTQ+v/nOJTSKWikscKkhhOxZw8
 2zcI82kaAfGFLbDDPSrPKU5cDvlfm8Wk0I4phO9pfYHvVyhKi/KlJnwto8gvw6DEWbAa
 KpnQ==
X-Gm-Message-State: AOAM532wUgrr7RXdGJMCTi2EOPe+mzdMNddOm60C6OqWB6i0oKh5NpXK
 m6w0KcNpBQ7ontUaxgqZr7ZsgDwaiS4=
X-Google-Smtp-Source: ABdhPJzxcIjt/M1JG87s/r+DerbPKXui01CJkFf9xhHtm7LB9aT+v3qt3sinQbMZLlUF2uOijF07Kg==
X-Received: by 2002:a37:6402:0:b0:67b:1eee:b390 with SMTP id
 y2-20020a376402000000b0067b1eeeb390mr18304724qkb.750.1648036053269; 
 Wed, 23 Mar 2022 04:47:33 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 h22-20020a05620a245600b0067d6dae634csm11429910qkn.9.2022.03.23.04.47.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 04:47:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 1/2] block: Fix misleading hexadecimal format
Date: Wed, 23 Mar 2022 12:47:17 +0100
Message-Id: <20220323114718.58714-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323114718.58714-1-philippe.mathieu.daude@gmail.com>
References: <20220323114718.58714-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::736
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

"0x%u" format is very misleading, replace by "0x%x".

Found running:

  $ git grep -E '0x%[0-9]*([lL]*|" ?PRI)[dDuU]' block/

Inspired-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 block/parallels-ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/parallels-ext.c b/block/parallels-ext.c
index cb22a427d7..5122f67ac2 100644
--- a/block/parallels-ext.c
+++ b/block/parallels-ext.c
@@ -261,7 +261,7 @@ static int parallels_parse_format_extension(BlockDriverState *bs,
             break;
 
         default:
-            error_setg(errp, "Unknown feature: 0x%" PRIu64, fh.magic);
+            error_setg(errp, "Unknown feature: 0x%" PRIx64, fh.magic);
             goto fail;
         }
 
-- 
2.35.1


