Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF084ACC2F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 23:43:46 +0100 (CET)
Received: from localhost ([::1]:38166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHCjZ-000731-K0
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 17:43:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHCgf-0003yt-I6
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:40:45 -0500
Received: from [2607:f8b0:4864:20::72c] (port=34476
 helo=mail-qk1-x72c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHCgd-0005jV-Ko
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:40:45 -0500
Received: by mail-qk1-x72c.google.com with SMTP id bs32so12329398qkb.1
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 14:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EuU6f2hsAisKalSy17XW/VmARf7CzBCyb+vigrLGnrQ=;
 b=mDcIkdQIPRA7YtIM/102EeTRyCxkcQmF87Jo5Y13hn3As1Pv+f7ho6MMwg/eJX22yQ
 g1iNZPEqEbXg0qhk78v64ijkJliOJ7ylvLr2rdrd6Vm4dEtbzgniiKZvMxTblDsm7v0G
 Ob5GLJHLM4yzQl2pstPkVjbITxJcbMFwJqaLGMDtIbLA6N3aJN+RbHKmtBBKmeyYCcln
 sCi536sh7MqgMw3hbMWpnQZUsV4f/AuwXiKl36ymI4+SsV8QbGBivdtqvWolskgEaTlu
 u3qMhcZN8BoURtQQ9Pc2OKG1sMI+sbG7pMyWCZtmYuzm4AFhrTsrji6+6d8Cj8iEa+2I
 zXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EuU6f2hsAisKalSy17XW/VmARf7CzBCyb+vigrLGnrQ=;
 b=K5Xie1KD9QStKZL//n81W8Ziq6bl9sJy7B4RzbntfyHZnXcfjU1ernfddOhZR2oZLK
 fJO9SLxtFWh8INDry2JiHux5CAY93Xqh3DuPoPS0P2eg/lfHvmqvyATiSKUnLJCwcTv/
 YrWiUUCcXlEslWqFsozIC0VMDB+Wp0zxBoSyFNvZBaWydFs+esNkOZgC8u0jLL0MGHFs
 Y39/TLyPBBAswEn1iGHHyQbUFxMCakg8JvnzkwFWf7FBHgMQP2XgTwVupZg8GaTHQfIY
 rpX9jAxphC1KiggXk4hI/FHwXeaoVLlcnaapEV7VqTKbFDMpto9iSyFKn12VL67ryiNC
 NxKQ==
X-Gm-Message-State: AOAM531G+ZVXHngHgQtlbNmTjgYvyJfoqw6W+Ypp1boK3UeR74OR4qZk
 85XXt7ZzLV/hoEFB+5+XWIxU5irmi/ZOyw==
X-Google-Smtp-Source: ABdhPJyBfSOjCc3SFDldBKj7WE4ozjwy5wym1ZFLg1bcXC5yKLcqP7rSHnty4hYKYxqdQENMyHKaaw==
X-Received: by 2002:a05:620a:4151:: with SMTP id
 k17mr1178093qko.630.1644273641489; 
 Mon, 07 Feb 2022 14:40:41 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j14sm6444744qko.10.2022.02.07.14.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 14:40:40 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/11] 9p: darwin: Adjust assumption on virtio-9p-test
Date: Mon,  7 Feb 2022 17:40:24 -0500
Message-Id: <20220207224024.87745-12-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220207224024.87745-1-wwcohen@gmail.com>
References: <20220207224024.87745-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x72c.google.com
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


