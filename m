Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CBB4AB204
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 21:23:30 +0100 (CET)
Received: from localhost ([::1]:53110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGo4H-0002MP-8N
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 15:23:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnpE-000145-1L
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:56 -0500
Received: from [2607:f8b0:4864:20::f33] (port=36493
 helo=mail-qv1-xf33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnpB-0001Rv-V9
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:55 -0500
Received: by mail-qv1-xf33.google.com with SMTP id o5so2319403qvm.3
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 12:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MGq4/Ht9AqWuy11QNx35IG6GRlK0CwA5Kr6JW4BVDuM=;
 b=pGZIvIuYnyhFp+ENY5UYk7sInlSvrNcK14XUybAmaVf7eBbLVyDAyVgkE5pGwYn4CR
 emuPmtJpM9xN6w6Zat2gZPmJ5nipq/QdGUlUJUZmQeGEGi7RmjLTeV4GrjK5Ckec+GiB
 LCUu/8laq3KWdUTz6sJ9Ip8ImJA9EX+SGjIs8R4CIgToOkJbE67mJ56kiOgmHYVgu02w
 6H/4/4nucOr7T1+rS3A62jBzRtCgqwkJuafH36vJ0GhFi9JQ680INw1gl+EUd4KqKupJ
 HMiPcNSE4wXDnD4I+AaSoKcPyeJCxisTqaxUn5CQKKc5wj7QmGKQauddB58AlHgpHnPV
 Uj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MGq4/Ht9AqWuy11QNx35IG6GRlK0CwA5Kr6JW4BVDuM=;
 b=lF2EmyWFHRsiT3YXhR7R+CVLW710fG4N1eMEFwLQbb88EOiaWCQslKyN+s2XlMp4+t
 lRkgtd9AB+97SxtS7HN1q5ry8Ke2fuxWabCUQ3y5mE+bpJK9gZJmQwj2daIHIlyFgrUH
 oEjqtovI5uhkXsj4SamNO/zw4rZHHfsClbW/IqSelfn43cqBcCh3YlJy0LJPbRk2ljLI
 d1qo4aXj6pG2QPimXIzyIkZihapi1PihNDVI5jPufeA9LiMMSQFnUmIvMiGf8y18QM60
 kyBps8wKL0VKTcePFwK/wRdGKux7wWdDfoGjBaJgvHeGwT6kvPk9oN2bspKRHCRnce0B
 p22Q==
X-Gm-Message-State: AOAM532Fb4Awmsc/b9HaGsHxW30ikf+PC1rtzbfOPWbqtcORoiO9g/lQ
 CcdS9kHdKR24bKNFOunrLcvMM+xwqV8bwA==
X-Google-Smtp-Source: ABdhPJz7nhbIwheahbjfYkjZy81AaokqHx/i2qLit0c/2dO5tOfR5+72HtliPhrQnVZIGT8n0JppUQ==
X-Received: by 2002:a05:6214:d6a:: with SMTP id
 10mr8517925qvs.59.1644178072742; 
 Sun, 06 Feb 2022 12:07:52 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j11sm4625999qtj.74.2022.02.06.12.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 12:07:52 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/11] 9p: darwin: Adjust assumption on virtio-9p-test
Date: Sun,  6 Feb 2022 15:07:19 -0500
Message-Id: <20220206200719.74464-12-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220206200719.74464-1-wwcohen@gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf33.google.com
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
2.32.0 (Apple Git-132)


