Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D45F2DE98A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 20:03:19 +0100 (CET)
Received: from localhost ([::1]:34496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqL25-0005nQ-WF
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 14:03:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1kqKzQ-0004Um-9j
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:00:32 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:47052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1kqKzO-0005S3-2N
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:00:32 -0500
Received: by mail-ej1-x635.google.com with SMTP id j22so4663144eja.13
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 11:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Dp+DGJoUTZT1Otle01mbGCkN4+mjZzFhJlKQCx5wqac=;
 b=uR/6cb1QkHsBZp+8HS5VKuy4D7qLJcHurWtFQ6BZ0IWJhtgXRfSu7W7ciYRbFMhlsB
 ff3yIDj9jtX5LjarUjbDZaEExm3trrFK2vQtMBAKc/V139MgJKimvzfzLHJqK8eT/Ell
 yTtX3BhIOeK1P7zRVNQRARKt91+wN5D7DJx1U29HxRi6JZ/GO4QkEoBHwqKf+NZBEK1Z
 0lk25g2V+eIjhKmxQ8+UImo3RaeY0rrvnFw+2fC3woJvPQFGji25Fu62qjrwWbCXvpHP
 Bk/w+dhH5XGgGiTRi1EbB1UdqalfaNepivf7UEYQ28TQuNB9cAnhTqzbGUUMQSLXdd/W
 nQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Dp+DGJoUTZT1Otle01mbGCkN4+mjZzFhJlKQCx5wqac=;
 b=cZcI47uOpJs663C1M2ppQyXmWLpegBR9q3yKOfYwptQ4+L4O8kJDkSxITsFHR+6ZhY
 /6nk9eJ2qPpZNkmsp68uxV9VRGyV/7tdUfEIgOSpGeiOb7u4a5HCMdc1lJ1uVELvUpET
 ++Y44QIq/95inDv7Gn/SaPJuj3/aMM0IHoMhnVtUuHkGh/O16DZH5YO1sKx1aaGIohyz
 bXlMSkpPlWCBVpOeFqGG3v7Wrw7QTpgIIsV9RQ8kbX+VuN1Ib0gf/QcFW/GgvKOY87Gy
 FacGIHVBK7q3MGkq+CGGBpJZrdbCIrHA0yEJ4V4nbqudkQWFE3TYFeDZ6dXVq6qwfbZd
 UqHA==
X-Gm-Message-State: AOAM533UhC33+SOm9VqNjwXL4fkFeqPGIlDwmgOyIoamjmQoFJQojFPP
 EFrnxSfW45XxtCSpIGb6HveBD9wnj9g=
X-Google-Smtp-Source: ABdhPJx7DLuAmESw7Mpi4uY3nZoZxbapTx1F2y1tERiB6RmFWARL9cogAI6BaF7+BsC6XShhYxtAOQ==
X-Received: by 2002:a17:906:7104:: with SMTP id
 x4mr5498271ejj.141.1608318028420; 
 Fri, 18 Dec 2020 11:00:28 -0800 (PST)
Received: from localhost.localdomain ([77.137.149.240])
 by smtp.gmail.com with ESMTPSA id o13sm25094633edr.94.2020.12.18.11.00.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 18 Dec 2020 11:00:27 -0800 (PST)
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [Qemu-devel] [PULL 1/1] contrib/rdmacm-mux: Fix error condition in
 hash_tbl_search_fd_by_ifid()
Date: Fri, 18 Dec 2020 21:00:22 +0200
Message-Id: <20201218190022.31214-2-marcel.apfelbaum@gmail.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20201218190022.31214-1-marcel.apfelbaum@gmail.com>
References: <20201218190022.31214-1-marcel.apfelbaum@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: alex.chen@huawei.com, yuval.shaia.ml@gmail.com, euler.robot@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: AlexChen <alex.chen@huawei.com>

When fd is not found according to ifid, the _hash_tbl_search_fd_by_ifid()
returns 0 and assigns the result to *fd, so We have to check that *fd is 0,
not that fd is 0.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: AlexChen <alex.chen@huawei.com>
Message-Id: <5F9AC6FF.4000301@huawei.com>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
---
 contrib/rdmacm-mux/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/rdmacm-mux/main.c b/contrib/rdmacm-mux/main.c
index bd82abbad3..771ca01e03 100644
--- a/contrib/rdmacm-mux/main.c
+++ b/contrib/rdmacm-mux/main.c
@@ -186,7 +186,7 @@ static int hash_tbl_search_fd_by_ifid(int *fd, __be64 *gid_ifid)
     *fd = _hash_tbl_search_fd_by_ifid(gid_ifid);
     pthread_rwlock_unlock(&server.lock);
 
-    if (!fd) {
+    if (!*fd) {
         syslog(LOG_WARNING, "Can't find matching for ifid 0x%llx\n", *gid_ifid);
         return -ENOENT;
     }
-- 
2.17.2


