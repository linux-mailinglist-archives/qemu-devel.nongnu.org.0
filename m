Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553544BD01E
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 18:10:20 +0100 (CET)
Received: from localhost ([::1]:40792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLpj1-0000Ot-E4
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 12:10:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQo-0007zs-77
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:30 -0500
Received: from [2607:f8b0:4864:20::f2e] (port=36695
 helo=mail-qv1-xf2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQm-0000Ef-9D
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:29 -0500
Received: by mail-qv1-xf2e.google.com with SMTP id o5so26105801qvm.3
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 08:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sYK+uU7D+zXBtVgQvVfFVkY65lZgfTz3L/tbii2QHnA=;
 b=bt5fpsuLHvPkEmV74+n1rnjIdWcC42s/jHXEZmBcoxa5/R/AhyAHVFhH7VcDbeHM9j
 Lii81GwY36yOG7Hv+ZSr+P+4rqRQeEM0Hh75C5F6abBeqK7C1EuUEbXl6as1zUcDqgMG
 EbZFUZSquIQtEsI850d9cHr/JhnNqsj8d+xLbij7lAPPo72ebf3RC3BDZYwKDZZQ02RO
 RvB6G4t6fHoOl6zwd5IpK2GOhEZIySnD9aFsv8Va+rjeTbrWzzUylUvLLKM4rsyNMHEg
 2635OQqqpMDUl5QJypqYuoqh1pd1sXlS+P17PDDML+IbNu0fXQi5D22Sn6zwvo/H5Vzl
 hsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sYK+uU7D+zXBtVgQvVfFVkY65lZgfTz3L/tbii2QHnA=;
 b=i5Hu9XLSvBVec8aTO+h/9JhkKEteRLoA0RwAQ7FdnJCos+yNlbHh3I8QPUkXDGaOvJ
 HmF96uaVIsgAKSMVLJAajos09AcCf+XpCP4RCG2NYgN9qTX5SG3E96Lxno/J2lZ0Ja42
 rBVVQHSzLJhXGLCuz0+ZDTcaWJpGJ7SvXp+ddnUY6symEvmRWUnAWHF+N78l5XBPQJ4g
 NiJWms7gO4PXqfCTDUFANh3ApQ0J0iWz6VzpVnJD0e4VGqk3N+forZMbMhMkZEB3Hym1
 paML9cu4fw8g2eWDy0jSKkU2ly1kjHMrfnwnjPOZNZPHL4T+UNrbAWyWkvTXeUCzBsTp
 C/tw==
X-Gm-Message-State: AOAM532ETkurp37LEQ3czehF2IgW1wjw5B1d233S7g16QXTMchUSorgr
 dkXZOmII7h6p3vFU+E6OOwTv71OYXEDtTg==
X-Google-Smtp-Source: ABdhPJwyidtnmyicUvdtFm0OI1KIp9QJtMlshF0exy+LboWTc4SE9do0SddFjgXd2irWcECYeiZwhg==
X-Received: by 2002:a05:6214:1bc5:b0:42c:4d35:37e2 with SMTP id
 m5-20020a0562141bc500b0042c4d3537e2mr12700138qvc.90.1645375887043; 
 Sun, 20 Feb 2022 08:51:27 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id n16sm3190995qkn.115.2022.02.20.08.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 08:51:25 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 10/11] 9p: darwin: Adjust assumption on virtio-9p-test
Date: Sun, 20 Feb 2022 11:50:55 -0500
Message-Id: <20220220165056.72289-11-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220165056.72289-1-wwcohen@gmail.com>
References: <20220220165056.72289-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf2e.google.com
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


