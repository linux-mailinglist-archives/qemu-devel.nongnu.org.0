Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766604B121A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 16:54:09 +0100 (CET)
Received: from localhost ([::1]:37168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIBlo-0004tm-JW
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 10:54:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9XD-0003Cd-Bl
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:57 -0500
Received: from [2607:f8b0:4864:20::f30] (port=35534
 helo=mail-qv1-xf30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9X7-0004YB-R2
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:51 -0500
Received: by mail-qv1-xf30.google.com with SMTP id d7so4936714qvk.2
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 05:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VI0Ghpcxq8/Yi1AQXKCEmSeO6fHHyV1SL/EjKkI3wfk=;
 b=WkQJLMrfayBlDBgEQv9EtI5AMt6wmWOrziKIbRBgW81j/6HZ+9tiBf0uakwU87QG17
 fYttMjTkLcTut5+oa32MVY4w31JEXzQ8b4qsGoZGe/em+Vp+nRP3F5VwbLO19nePElem
 FvD/XOU3vlO0uJEe3d3YtyGOBLKxvGEOeypGs/pdbQPpQVtRnsSFpGBDmDGX2S7ltZ4c
 fAIsoDfzPsuQJidKVzujJu7FjZOSpGjlwPxC1v8qyZbpdR3AgGMqrGWnDX+DWCexkmlW
 C+QXAhWkX0QbzacNpTKBN9kcHAKwYxe/qvCUg9XctAP5Z/3n4HaltMnt5nxvHWHYjq16
 0/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VI0Ghpcxq8/Yi1AQXKCEmSeO6fHHyV1SL/EjKkI3wfk=;
 b=vAuXKq5nLQSs2KFjnAZcsa+9KTbspkLhzekeeruhMXzq4oTN/6Xc61q0BRcZla7iXN
 JkXBWa+goqkL9Fy8nQaNfM1zxQ06VfMwrpf8SAm9eLYuXMXI68VnhYx3E0bRfa2IdQOF
 fx5Iya3diZRBeFlZjbEZcfP1mnYkCsu3jpF66e7hCfgQVdvOGSiOinomMAQQN3YvRpVd
 mNnr84kt/KMwaJg/wxoC/3N4pNDfYKpejLXCotY0DTVzPExsDMJ2BJSWfuThxhVeWujy
 Vqs5+ZAzXoUI0RoghCSGrPulihlNlpBal6VimYzs9SjlMWU4iNuDQ4BCNrjgdD+0rH0c
 S1pA==
X-Gm-Message-State: AOAM533ZwapcMgdf17e6+1Dn8o/K5NLPSiNPQpImH6VAjxMepwyGo8tl
 oQhnu73kPP/uK+kAerLdU/RrqB/BpJ03hA==
X-Google-Smtp-Source: ABdhPJx/QAke/7HE2yxp/CxG+Ix/3EmJ0fkMFD5dmRdwSoQPk9GjRvksl3pU7IjzOwVqp4es9rIEig==
X-Received: by 2002:a05:6214:1c8f:: with SMTP id
 ib15mr5149303qvb.2.1644499822922; 
 Thu, 10 Feb 2022 05:30:22 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id t1sm11289616qtc.48.2022.02.10.05.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 05:30:22 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/11] 9p: darwin: Adjust assumption on virtio-9p-test
Date: Thu, 10 Feb 2022 08:29:45 -0500
Message-Id: <20220210132946.2303-11-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210132946.2303-1-wwcohen@gmail.com>
References: <20220210132946.2303-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Will Cohen <wwcohen@gmail.com>,
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


