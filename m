Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D281842CFD2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 03:09:58 +0200 (CEST)
Received: from localhost ([::1]:41036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mapFt-0007dN-Vn
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 21:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIk-00048k-Hc
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:47 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:41509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIe-0004aj-6Z
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:46 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id d20so2704696qvm.8
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 16:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ceqwCnBnXXlDmYrHzyn9u+EXyIv3S+MBYR3tJiDIsLk=;
 b=oFARN8k2Y9yHO3d2UhBydvf6/0tsqJ8ozWg5ulFc11rSatrF4cmY6QyPk+0iNAtQyD
 7SwXJ30mPkLhFU4zAgZLJVUtMvCtUy52KbVeE6NUj/82fyJwCCNKWalok8k/zpCSj9bV
 Paj7kFBehutJV+k4orodoEOLUDbN4EJT5ltn5BMkuVo5Tp2M9UJt1tbXFeJldFiqDUHc
 OJAYu+fIRx/TLwePjXXCpRYx6VQNZznWU0P9EQtMNwgiYbVApQAqCPUJMVEYgWe95+44
 e1RL1emPHLSEWHA6n9F8QO7XQpP/1mLiAtsg9895snbsLKwv6hJ1sgHt2nI7NKmGem0O
 9fLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ceqwCnBnXXlDmYrHzyn9u+EXyIv3S+MBYR3tJiDIsLk=;
 b=QrWq91kN4JlIhczlwrB4jQVYnFOE1Fjr7hSVRGQzOh9x6yknDkF5uDIJMLfsRzXchP
 GdzUx7KaNX2wLst83nNLgHxgkARxNmPRlKEnLuJLorCZ5rMO4+472lpMZQt5M8/wtKEg
 /FRKR7S94pzKiNMWUshF4MOf41dIOMx8y+ELZsnQqkTaJ8N864MPul/eJ59sIkn1caot
 4AotqwTohlu5bZmd0Z8VwvlHU+D/MtPgRcLyHXeE2vcdZZMFbou9ybmS/ePjV9jYSDey
 +ThyXnPMwQ7kxK8P41i/NwWx6hlAU5m6aYGTseeMIdj10Wh8b6G8thnlLbQus1NMMOcw
 IgiQ==
X-Gm-Message-State: AOAM531m9KSAvpmxfDwWo7Ou4+5zO2yguO9vqpJaDdDv7vbI0PBmOZOV
 KfTnJg0vB8atskQq+21e9MG4GdqBYuybOQ==
X-Google-Smtp-Source: ABdhPJw9bJrXC/1m8k8EzZHKYUOdtVv+BAsEi9fyrM6i/+gUfSULu5UgBV7I6QnOswzJmWhfv9chzg==
X-Received: by 2002:a05:6214:2aac:: with SMTP id
 js12mr2057069qvb.56.1634166278118; 
 Wed, 13 Oct 2021 16:04:38 -0700 (PDT)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w11sm778680qta.50.2021.10.13.16.04.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Oct 2021 16:04:37 -0700 (PDT)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] 9p: darwin: Compatibility defn for XATTR_SIZE_MAX
Date: Wed, 13 Oct 2021 19:04:00 -0400
Message-Id: <20211013230405.32170-7-wwcohen@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013230405.32170-1-wwcohen@gmail.com>
References: <20211013230405.32170-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 20:55:22 -0400
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
Cc: Keno Fischer <keno@juliacomputing.com>, Will Cohen <wwcohen@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 97dc8b246f..3fc43cb482 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -3927,6 +3927,14 @@ out_nofid:
     v9fs_string_free(&name);
 }
 
+#if defined(CONFIG_DARWIN) && !defined(XATTR_SIZE_MAX)
+/*
+ * Darwin doesn't seem to define a maximum xattr size in its user
+ * space header, but looking at the kernel source, HFS supports
+ *  up to INT32_MAX, so use that as the maximum.
+ */
+#define XATTR_SIZE_MAX INT32_MAX
+#endif
 static void coroutine_fn v9fs_xattrcreate(void *opaque)
 {
     int flags, rflags = 0;
-- 
2.33.0


