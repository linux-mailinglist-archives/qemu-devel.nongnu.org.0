Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C660836F6BB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 09:51:45 +0200 (CEST)
Received: from localhost ([::1]:33578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcNw8-0003RB-TN
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 03:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lcNuh-0002R8-2o
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:50:15 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lcNuf-0005aI-9e
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:50:14 -0400
Received: by mail-ed1-x533.google.com with SMTP id d14so17707834edc.12
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 00:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+5TLmRR2OhlwGRMjU/FX1nwSDIuxC+KPoyDRwHsh2pI=;
 b=nyW3MrZv/WMkl9jNQTGklYnNfZmq51nMvwigim4qKgSbwCt05xnCfz1AWka2R1xyvS
 czRPqTzKTLMLoUnWwW+CsnjIWyOlDocGVwgfZDQ0BOSyOKxCHRwJAHskpfxhETmS3BOg
 IJfMxMKGUlHmBJC6gg7g1rLPY4S5IJThxm6nCxsVHWF0g3JFJCpkLxPLuza2xCmNTQv3
 OgN8HiVaZ/m2iypKhNqtTTAsaj93lBqlTz4J2rw2bea1v42+xoSxjwrc29yuVOlGZqtH
 k66AwE2/F2F+rtNI3hEa1CCuR0Wryw5AvXUCCxQPtPoT/Mm8tuUARj0QLD5h2i0pLX0U
 yH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+5TLmRR2OhlwGRMjU/FX1nwSDIuxC+KPoyDRwHsh2pI=;
 b=ldEHQ07YfKhCYYOsSvv0pR2zJvy4ffgu9xEJitjFyjPjE+fmwRnpr4Nv7WAbasZ9ll
 ui1ZriPKgPqzC3K1rNTESM76fevKLh/M41D1LV6m56v+h87V5QgK+f1EQGKeTMs4zCVA
 XdMp9mozZmhBiTRRE0qloPhSc/9qYEz7UNhH4/sLZTzhN3vrwI1KHZseb+81pQxf4OYL
 j2XjV0mpcL++el9TniOvFz6s6SJAaBcZbn6b4abe4n9g7pp9FWsuVy6TemON4jtvqOfb
 4ZP3hDcRbo+WfsOt2WhQDA1TvRpLPhJnNDaw7xdajcGQbHCMxpFqJqMjw1Jm1k2eOPYk
 WqdA==
X-Gm-Message-State: AOAM5315fKlPnUIaTsmFLJUMpICDVqGuKMowhskLqk+0+oOjYUQHYT3k
 lCO/mJIrnCu/kgmburNp3gQ7PpmSS1Q=
X-Google-Smtp-Source: ABdhPJywyfTojkCjfen2VBH1l+ftzedGd5L2O2G61PT/dQkdZxBfJtsgoHJLTT6YFAmIT8J/P/sxAA==
X-Received: by 2002:a05:6402:351:: with SMTP id
 r17mr4213098edw.186.1619769010029; 
 Fri, 30 Apr 2021 00:50:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c12sm696134edx.54.2021.04.30.00.50.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 00:50:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] oslib-win32: do not rely on macro to get redefined function
 name
Date: Fri, 30 Apr 2021 09:50:08 +0200
Message-Id: <20210430075008.138817-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Windows with glib <2.50, g_poll is redefined to use the variant
defined in util/oslib-win32.c.  Use the same name in the declaration
and definition for ease of grepping.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/oslib-win32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index f68b8012bb..13418f68c0 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -472,7 +472,7 @@ static int poll_rest(gboolean poll_msgs, HANDLE *handles, gint nhandles,
     return 0;
 }
 
-gint g_poll(GPollFD *fds, guint nfds, gint timeout)
+gint g_poll_fixed(GPollFD *fds, guint nfds, gint timeout)
 {
     HANDLE handles[MAXIMUM_WAIT_OBJECTS];
     gboolean poll_msgs = FALSE;
-- 
2.30.1


