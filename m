Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28314B74D2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:49:21 +0100 (CET)
Received: from localhost ([::1]:46464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3pA-0006dg-Pk
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:49:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK38G-00016g-Fh
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:05:00 -0500
Received: from [2607:f8b0:4864:20::836] (port=43600
 helo=mail-qt1-x836.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK38E-0002lr-80
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:05:00 -0500
Received: by mail-qt1-x836.google.com with SMTP id x5so19492031qtw.10
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 11:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VI0Ghpcxq8/Yi1AQXKCEmSeO6fHHyV1SL/EjKkI3wfk=;
 b=KEe1T1sNJo41xxjROCr/q195Xa7JdG9+b0DBLoMxbYff8fiIj/wgIlsgN/Qd3qNFj3
 KAipRRfxH2O8MOqVAAVFjFw50nbeHNxRgL8UM1rK8Jp9NwpNYSAKIjuOtEwfMPuHtRV7
 khcAruu+mzSjC6pRVAaJXFs7kXvaUYTViYOkkAE6MoBcVIfGKR5mjwLUGZAyuZrNVLGX
 O17K1dsmpiM3cYnmGAP/VBSipg7nVlu+h3cLutVTNfiyVIQTKs2KZeUaaBWov8nzV3Hw
 bqmbs7VJtrZDQIVjPq31k6QnMSh+thS0v3NvumS1mDHddm54FKolxgzEWKB0m+JWIA9N
 Z3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VI0Ghpcxq8/Yi1AQXKCEmSeO6fHHyV1SL/EjKkI3wfk=;
 b=k0C9doQEzwFKQtFjFZPxJrAR7eoLq5JRcZeunrcqLV/ADaZQjInX8wxhqojkzGMlgV
 ahaFfhYa+aBU4ZwgZgsk71L/Ly2YIyAtMDDGcr5JEAPPfvUJMCt2l1aI8ODodEQxv1/L
 pq+4wJ23uqFfKzexOBIQ7wficaF9WsXD/4dCn4v6uNb9nj2IHO1EKRy+oeXkbkWP9nRa
 ajxaGPsHWqkDjdgrmBB1umTqu/sj2pFnrNiepI+bC0N68OtglMBCKnlxe6Gmu3qng/E1
 H/GMG+cKpkuCNKjfiRqcfFEU3Si0UdUvu1chuxEtfRpA5EYi8bdPSvfXzdwOVSAIi2sx
 xJ4A==
X-Gm-Message-State: AOAM5319AerqPIEMBGsbGzaC6Pw/lHXT62g/smT0bKFIyQWYVWkBWYq4
 a2mab4nz+PYFkrNHC3jA/UJHl3juaOrdMA==
X-Google-Smtp-Source: ABdhPJwTyPMRnraf6wUBDYirRD0fZYvVtje/+iUabvMeKaGfA6lLv6Pin5gyCvjN2ElVTxwGsoCClA==
X-Received: by 2002:a05:622a:607:: with SMTP id
 z7mr397138qta.281.1644951896842; 
 Tue, 15 Feb 2022 11:04:56 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w10sm21364527qtj.73.2022.02.15.11.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 11:04:56 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/11] 9p: darwin: Adjust assumption on virtio-9p-test
Date: Tue, 15 Feb 2022 14:04:25 -0500
Message-Id: <20220215190426.56130-11-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215190426.56130-1-wwcohen@gmail.com>
References: <20220215190426.56130-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::836
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous test depended on the assumption that P9_DOTL_AT_REMOVEDIR
and AT_REMOVEDIR have the same value.

While this is true on Linux, it is not true everywhere, and leads to an
incorrect test failure on unlink_at, noticed when adding 9p to darwin:

Received response 7 (RLERROR) instead of 77 (RUNLINKAT)
Rlerror has errno 22 (Invalid argument)
**

ERROR:../tests/qtest/virtio-9p-test.c:305:v9fs_req_recv: assertion
failed (hdr.id == id): (7 == 77) Bail out!

ERROR:../tests/qtest/virtio-9p-test.c:305:v9fs_req_recv: assertion
failed (hdr.id == id): (7 == 77)

Signed-off-by: Fabian Franz <fabianfranz.oss@gmail.com>
[Will Cohen: - Add explanation of patch and description
               of pre-patch test failure]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Acked-by: Thomas Huth <thuth@redhat.com>
[Will Cohen: - Move this patch before 9p: darwin: meson
               patch to avoid qtest breakage during
               bisecting]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 tests/qtest/virtio-9p-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 41fed41de1..6bcf89f0f8 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -1270,7 +1270,7 @@ static void fs_unlinkat_dir(void *obj, void *data, QGuestAllocator *t_alloc)
     /* ... and is actually a directory */
     g_assert((st.st_mode & S_IFMT) == S_IFDIR);
 
-    do_unlinkat(v9p, "/", "02", AT_REMOVEDIR);
+    do_unlinkat(v9p, "/", "02", P9_DOTL_AT_REMOVEDIR);
     /* directory should be gone now */
     g_assert(stat(new_dir, &st) != 0);
 
-- 
2.34.1


