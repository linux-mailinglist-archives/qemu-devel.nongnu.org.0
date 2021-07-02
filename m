Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0803BA39F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 19:27:01 +0200 (CEST)
Received: from localhost ([::1]:42648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzMwO-0003ZC-LF
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 13:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzMuF-0000QX-MZ; Fri, 02 Jul 2021 13:24:47 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzMuC-0005nu-G0; Fri, 02 Jul 2021 13:24:47 -0400
Received: by mail-ej1-x62f.google.com with SMTP id v20so17252515eji.10;
 Fri, 02 Jul 2021 10:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BIPpPoxVPgOmowyauI8+ZWPp0Ec6GWlOzGVsaFHknbg=;
 b=ixgVhP84/HVP7pqXFlDUesKcSyJGNJHtnCqmQHrDmyT4OUV9JOxiw1s29hDoJdzw3g
 8z0ADXKYwLDLgoICuKF/Huw1SNydksbcG7FOBfqSrnKUubRTgW5mwDPbui7ZyEUvAP8o
 O6JIhO2Ge4lCH9Yq5cQK4qt83Bp4vPlX/Xwo3WyHmYElDlT65LIPZZm2XCjd6z7g6St1
 HaHj79ONzYnKP3AcSDcvH1aOmN+ef2mzg7sulUBSb9s8RKhOd6ppmcsVdkJoHYyr/xdi
 O14xrpjkWEFwPIjVYLgj9AcQrR64Wr9WwyJS91XELdmRJunUJauIXiytC5PksDmci383
 Fwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BIPpPoxVPgOmowyauI8+ZWPp0Ec6GWlOzGVsaFHknbg=;
 b=cyPlf7cEOy5IgDPQqDuGkb+ibnAxxD9l2wJEjtpX8IQ+PLMq7pyLfpo1cqei2GtMc2
 JIrvEzUH1rWrbl5AggaM+NeooI66g7KVAYOQegBeYyNRKbtd8LSx/EAUCLQI24ripVLH
 quLrSc9241qseQqydxTkStGrm8hvwr57n5ZKqTcArqsHx7NfHyfNquxm6a8k00X1Fba3
 crSsfkDgx/Pq+qpHcD7zd63snGXrNqhXx80/O44vDN5P0QUFMVq7r+ZDuEWE1Z0B/91u
 TsLwmv8cqB9KtgOvxPvX0fEnTwZaxhLMPREW5LU36iG4RD7ZqHhecC4wwRKC90wozUVx
 2Mcw==
X-Gm-Message-State: AOAM531Nr75vYCurjImUwBo4BjwbYK7EcsB/8yEoc2tzMqwjRCXDIKDN
 xa8GqBif3YI9tUmpCTWOn8vhj5+U9UGjgQ==
X-Google-Smtp-Source: ABdhPJypXOdPMwKpkAVJ8g9ARsv3bvgDKj6efq95DVy09xNJ3VXfh/FY7M/lEm5gtZnvtIzCSycSPQ==
X-Received: by 2002:a17:906:d92:: with SMTP id
 m18mr119424eji.309.1625246682946; 
 Fri, 02 Jul 2021 10:24:42 -0700 (PDT)
Received: from kwango.redhat.com (ip-94-112-132-16.net.upcbroadband.cz.
 [94.112.132.16])
 by smtp.gmail.com with ESMTPSA id ar27sm1242229ejc.100.2021.07.02.10.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 10:24:42 -0700 (PDT)
From: Ilya Dryomov <idryomov@gmail.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 3/6] block/rbd: update s->image_size in qemu_rbd_getlength
Date: Fri,  2 Jul 2021 19:23:53 +0200
Message-Id: <20210702172356.11574-4-idryomov@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20210702172356.11574-1-idryomov@gmail.com>
References: <20210702172356.11574-1-idryomov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=idryomov@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 ct@flyingcircus.io, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Lieven <pl@kamp.de>

While at it just call rbd_get_size and avoid rbd_image_info_t.

Signed-off-by: Peter Lieven <pl@kamp.de>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
---
 block/rbd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 1ebf8f7e4875..e2028d3db5ff 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1304,15 +1304,14 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
 static int64_t qemu_rbd_getlength(BlockDriverState *bs)
 {
     BDRVRBDState *s = bs->opaque;
-    rbd_image_info_t info;
     int r;
 
-    r = rbd_stat(s->image, &info, sizeof(info));
+    r = rbd_get_size(s->image, &s->image_size);
     if (r < 0) {
         return r;
     }
 
-    return info.size;
+    return s->image_size;
 }
 
 static int coroutine_fn qemu_rbd_co_truncate(BlockDriverState *bs,
-- 
2.19.2


