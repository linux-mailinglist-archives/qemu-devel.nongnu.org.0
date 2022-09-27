Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4037A5EC184
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:35:17 +0200 (CEST)
Received: from localhost ([::1]:58032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8rs-00069d-97
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8QT-0002M3-1E
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:06:57 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8QR-0004nU-Jn
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:06:56 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so15216272pjq.3
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ptPSCcbuG++AcglR+Ify0H9lkcBvjcAqRFsbcccQhHg=;
 b=QJ+jF4FAvyLHHd39Ryac5KgNlIvQKd6gJdzhNVeaMfsOpGlko166lZ0yPd8A/O30uJ
 Wkd+byf+ElRKC8TEE3QewkG6w6xNuOzd9QRz+/EBHxFWVKFR7EgIfbhfgwD4lQBtM7yr
 JsJVbU+DomNCJbCQQyDXcXZM0B4F5f6PPfV+l65I1veLUoOr6TbwVWZ1W8GagjkXeuId
 VCo5B8rJjEbwgwirQs2l0rYheja9Onr8qe/a91wnVDhYgVShr/FS0dQgWMOgatQqcSQM
 AcXtnX906sKmHPwj34UxrJ/m9QvAUqedhw9oYcTfcC+e73m1siZVL1aBYchA6WbeprfM
 HvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ptPSCcbuG++AcglR+Ify0H9lkcBvjcAqRFsbcccQhHg=;
 b=SrEpxt9Sz67c1V62ABhkP+isny6ZLgOVbmFREUY3Yeh7vOFqAsPkA7WQ3GReGwKGbr
 2tArbv02tuXk39KurkvH7OlC7LfcNozSNBq7sY1sHOQ+dkTsdmslkr5tC5ZSiAliZfDx
 W7mwLqTDdVfdqUqus9lHGLhZnm2dZY5PncNcSXNN0fl9XpvJB22fdyejyKD5SC0/hhr/
 HiYQ4vu/xVqxi4jaR6V0zDjR4DgoE1J1qQ8HLqlb+yPkl2juuz5MhDygd7MBLO6IzzOp
 kFHHxXW9lINepR2/qlS2yFz8d6hxyFo+q3EKo/6BoN/Qy9GvrZNFewfbl9nkIBl+4h6Y
 AShQ==
X-Gm-Message-State: ACrzQf3nlkvPQov7lKqeJR6THhurQIlD62kS49fzyROQbtH18BOyxLOG
 lxqM5c7K5ciWvnOYxhYdS/Bif+5DCyw=
X-Google-Smtp-Source: AMsMyM418LnzV3gLYD4MgIm3jrOF9gLm9oJW7zPf4Af1i7cGr1RTmZMWxuYhD5ulQ+0e8bcTPCfNfw==
X-Received: by 2002:a17:903:110f:b0:178:a07e:e643 with SMTP id
 n15-20020a170903110f00b00178a07ee643mr25840159plh.41.1664276813278; 
 Tue, 27 Sep 2022 04:06:53 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:06:52 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v4 04/54] util/qemu-sockets: Use g_get_tmp_dir() to get the
 directory for temporary files
Date: Tue, 27 Sep 2022 19:05:42 +0800
Message-Id: <20220927110632.1973965-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Replace the existing logic to get the directory for temporary files
with g_get_tmp_dir(), which works for win32 too.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 util/qemu-sockets.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 83f4bd6fd2..0c41ca9e42 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -919,9 +919,8 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
     if (saddr->path[0] || abstract) {
         path = saddr->path;
     } else {
-        const char *tmpdir = getenv("TMPDIR");
-        tmpdir = tmpdir ? tmpdir : "/tmp";
-        path = pathbuf = g_strdup_printf("%s/qemu-socket-XXXXXX", tmpdir);
+        path = pathbuf = g_strdup_printf("%s/qemu-socket-XXXXXX",
+                                         g_get_tmp_dir());
     }
 
     pathlen = strlen(path);
-- 
2.34.1


