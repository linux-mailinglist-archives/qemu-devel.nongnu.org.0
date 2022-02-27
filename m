Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB314C5F8A
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:45:34 +0100 (CET)
Received: from localhost ([::1]:38512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOSIH-0006D7-IK
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:45:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS92-0006Zl-5x
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:36:00 -0500
Received: from [2607:f8b0:4864:20::832] (port=42723
 helo=mail-qt1-x832.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS90-00034G-Q2
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:35:59 -0500
Received: by mail-qt1-x832.google.com with SMTP id 11so7495971qtt.9
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sYK+uU7D+zXBtVgQvVfFVkY65lZgfTz3L/tbii2QHnA=;
 b=Ok/CfBVZbLWagnluIVfE6J9c6nO2QWI+bCl0iQA/hztHQwkueJRvgTH+Z2ztb8M7UZ
 hAs2CpE/fj3O2SsLx+GvGu86UnepFQKq1IR+UxFL8oEsaKi7GfwXLfMwZ0S4qfIATECm
 Se7pXquEO8Bz6/d7nk3daR6tl1w2C2YYLejNBQJ3v9X1f3RymE3jNLBIySa0ra5oC0kT
 fCextsIZvlJlc0upKhmAUsM0OTSglJLmb3NpMYAjumrEAVsBVZI0ZKSyEQq40HG5/YEP
 N6W3ikghZBt6WbZHMRbtGMg/eULTMyHv5ehyurZHMh/D0trgTo4yN8zo7ti5xzsFEilM
 OXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sYK+uU7D+zXBtVgQvVfFVkY65lZgfTz3L/tbii2QHnA=;
 b=ZeFWA11KeiumEYAdl1ddIzXgdrwPKBjcwIx5HXHUXdiWw7GFGm/rOF3JdpQ+261A81
 6/jF6JCeyBHIW8lzTUdvOy8A3mIIZzfP5Nc2e/Hxub14hTa9mVCdJLzzQfSe1Rt3hr43
 CUz6s7CXyQxHJocv6ISL+7vvoq9lrlcjaYjzKiS4hM4Z7dtsj1TYReFM6UL1EwwdI7iS
 nnlHAXwgMDEDiAg5E55PmddEpEpkIOZxWckJQ6f2uk1RQfr2qoaxswIjHLWl7Jo8o93o
 RpTLWYxQM8GXj3QS3iPiK+unGFqlV2Ba5mdRq8cgJud266da+aLdy3gMyR4fxSJqpLpR
 xLiw==
X-Gm-Message-State: AOAM531y6/uTx0XhVNQiqo9JOKo9hyp7ym69iUi5LTv1vc1CpBoscu0W
 bucXJr6fGzzyivcBJYNuCbp0hSfSu3Ivjw==
X-Google-Smtp-Source: ABdhPJwSpFpawEg5kBRJV85yTAZcfo/sYJDOEAK3OdkoD2bRJZd9/6mqbfiMMhJNGe/anCjFNLqqjw==
X-Received: by 2002:a05:622a:311:b0:2de:3a91:1610 with SMTP id
 q17-20020a05622a031100b002de3a911610mr14158290qtw.487.1646001357151; 
 Sun, 27 Feb 2022 14:35:57 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219]) by smtp.gmail.com with ESMTPSA id
 85-20020a370758000000b00648b7e3b8a4sm4206485qkh.111.2022.02.27.14.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 14:35:56 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 10/11] 9p: darwin: Adjust assumption on virtio-9p-test
Date: Sun, 27 Feb 2022 17:35:21 -0500
Message-Id: <20220227223522.91937-11-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227223522.91937-1-wwcohen@gmail.com>
References: <20220227223522.91937-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::832
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x832.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, hi@alyssa.is,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
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
index 502e5ad0c7..01ca076afe 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -1253,7 +1253,7 @@ static void fs_unlinkat_dir(void *obj, void *data, QGuestAllocator *t_alloc)
     /* ... and is actually a directory */
     g_assert((st.st_mode & S_IFMT) == S_IFDIR);
 
-    do_unlinkat(v9p, "/", "02", AT_REMOVEDIR);
+    do_unlinkat(v9p, "/", "02", P9_DOTL_AT_REMOVEDIR);
     /* directory should be gone now */
     g_assert(stat(new_dir, &st) != 0);
 }
-- 
2.35.1


