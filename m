Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6B758DC75
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 18:51:36 +0200 (CEST)
Received: from localhost ([::1]:37312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLSRx-00065O-0a
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 12:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oLSK9-0007SR-LX; Tue, 09 Aug 2022 12:43:21 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oLSK7-0006bd-Ci; Tue, 09 Aug 2022 12:43:21 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ha11so12239361pjb.2;
 Tue, 09 Aug 2022 09:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=qYrAxloXsrXBc5iTwVz/QR/2rEB8uGLW0aVimr2yXFc=;
 b=PRh9h6Vk5abZXyR6T4tf+XZ7YmiKaOesz0GR24E0YhFnunXu0kTZTgeSN6Wm1SW38d
 n5nGgL4AFbpqcDb1EoHbpMa4foevJk+k758WdPmSoInFNj1eJuRs+V089+aeApe6v+SO
 t2czGbqmCF0Zt+MPTi3Sgcpk/AJs/3t+EbkrGyH/OjZZ25Yy2mqvMdrt13d/qBkX8V3K
 WbfTALCWSnqk6OE0CZIQISp2N+G58D0Y/XN3cIaECUixx+CT6yKy4ht9TQLW1DYlnOdW
 jUlGi1fcuI8FggjD54vqdJo+5ELciDmI7GGgMDKgxuqXGkPsyasCxLMwRfHfMvEw4wsJ
 r9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qYrAxloXsrXBc5iTwVz/QR/2rEB8uGLW0aVimr2yXFc=;
 b=A9haHWw6/5LhN712SkI13xnHbPw3RMzqIeNHT29kEb6VKLHb6vKfJ5PKIpt4RpRtaQ
 TUpmh9bPx2OsouHeDMxq0kj+CWIe/8pNQ7cWz4HlNxhcvm60bFcE7Y5uehCshOD1JIIo
 09MLQlQ8z0EO5+hPQOyQyEY6SIxWZcesdtZSlfr6/8xwAuRpkN1vkEie7qpx8ie/TaTo
 I9yivkmnTabulNFiwAqqTgrBlmCWFiB309zUBl1go6ochmtpYn83n6TdK+bCWzns20EV
 j2wASLcyuxd2Ta2nIY0G+NekgAQiPQtjkUZ2X5bNZxP1gsqfQViZFcZzFnox0I96VHLz
 xrKA==
X-Gm-Message-State: ACgBeo3zVIlje/qixY+1bDm76ZGGXehdBiWM5xYNwOwE9bGEc0IUNWMR
 XnMVi9QBbzIIjGdMvwGIwInIg4+q57Y=
X-Google-Smtp-Source: AA6agR4cDFCs49SRVdFUn/nBdK3JRS/SFcp56INgn7zuIhseKIc6roj9sO8ofdLgYEk2XRqVBZTm6g==
X-Received: by 2002:a17:902:f60c:b0:16d:1af0:6656 with SMTP id
 n12-20020a170902f60c00b0016d1af06656mr23808348plg.153.1660063395755; 
 Tue, 09 Aug 2022 09:43:15 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 cp17-20020a17090afb9100b001f207d1860fsm10224143pjb.45.2022.08.09.09.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 09:43:15 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH v2 2/2] util/aio-win32: Correct the event array size in
 aio_poll()
Date: Wed, 10 Aug 2022 00:43:08 +0800
Message-Id: <20220809164308.1182645-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809164308.1182645-1-bmeng.cn@gmail.com>
References: <20220809164308.1182645-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

WaitForMultipleObjects() can only wait for MAXIMUM_WAIT_OBJECTS
object handles. Correct the event array size in aio_poll() and
add a assert() to ensure it does not cause out of bound access.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
---

Changes in v2:
- change 'count' to unsigned

 util/aio-win32.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/util/aio-win32.c b/util/aio-win32.c
index 44003d645e..80cfe012ad 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -326,9 +326,9 @@ void aio_dispatch(AioContext *ctx)
 bool aio_poll(AioContext *ctx, bool blocking)
 {
     AioHandler *node;
-    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
+    HANDLE events[MAXIMUM_WAIT_OBJECTS];
     bool progress, have_select_revents, first;
-    int count;
+    unsigned count;
     int timeout;
 
     /*
@@ -369,6 +369,7 @@ bool aio_poll(AioContext *ctx, bool blocking)
     QLIST_FOREACH_RCU(node, &ctx->aio_handlers, node) {
         if (!node->deleted && node->io_notify
             && aio_node_check(ctx, node->is_external)) {
+            assert(count < MAXIMUM_WAIT_OBJECTS);
             events[count++] = event_notifier_get_handle(node->e);
         }
     }
-- 
2.34.1


