Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B37A504D50
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 09:54:27 +0200 (CEST)
Received: from localhost ([::1]:47206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngMDJ-0005tq-O4
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 03:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ngMBl-0005CA-BY
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 03:52:49 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ngMBj-0000Jt-Mu
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 03:52:48 -0400
Received: by mail-pg1-x530.google.com with SMTP id t4so17523709pgc.1
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 00:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KqQ9F/BxoUOIOer4ASBIZkssuY8wg5EFCPZtpdDxDyE=;
 b=NkYV+SagXJHn0oWpp+Y1oP+Ea+qI1QOB1o7G+s8V8/UOgrtoV071rvjWXWGdPbmy9u
 lm+VtlwIY0fwHHv3vts+90UHQ69zeGO6bwS+Am2+c1vYTBUw427gOpQfpSsKgYmV6+An
 W+dbyK0wSPSIdCF2gSzWh5dWWxFdGvW9jTlTDJeP7ngJde9FHFAsykGqWWvHCV9/dUIS
 DHsVrA1w6qVS9jEvqX1Qj2jcd99gYf3Y16AXvNDlbTDoM2LoAcG504XAXp38T6TdXUc/
 Iq39TGqPLYfM4MolB6q7PLqQ4cnPsHsAhPHaMi1KDdw4XKFfXr9GmpbUP5dFdgPRss+v
 JMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KqQ9F/BxoUOIOer4ASBIZkssuY8wg5EFCPZtpdDxDyE=;
 b=xB4CyXfsOsEvCR1YkZTbGeQQrxgifF3+P+Z0VCtKnypAEWHaHlaKfuWvmZbb9QRJ42
 /cNhV0Z5bAuARBa3TppBkQ1eemBQ+BxwxtLAkf0dNAQbKqZAucJ8Vd4LOdMEaSqQmm/3
 fc/I1KntzxUKvhe0WLYtv1+7uSba5EpZuYHTF6ANuNgrkS3HHSy638pO+0rfBE1laIvZ
 LMaNCxfIGouWlOh0eVH1p8UTeHhuFrYa153wAE7hpaEH9nRjGUp0tBVuFCXHJddwxGhF
 ABDpi5hfyrDqywlkOIUkxAGKPkxS+xPPH5DUIRtVPZRQKhYHcDcDn26hY9SVp3YPVUKZ
 YG+Q==
X-Gm-Message-State: AOAM5335cVyDlCWfWUxKsgeTt0U+CP5uUxU5LVjrpgtLxycYxM1Wz5As
 TVgoAYbrlsnR7i+6Z9Nc34JxAaZw5QovyYxfw+Y=
X-Google-Smtp-Source: ABdhPJwTcfOpTS0B8LYJuMHvkiN1V1LOw7XKjipnOOya9IcTQHTr4oOSHMjnxwrQrCcuqy/MGItZUw==
X-Received: by 2002:a05:6a00:164c:b0:50a:472a:6b0a with SMTP id
 m12-20020a056a00164c00b0050a472a6b0amr10838573pfc.77.1650268365839; 
 Mon, 18 Apr 2022 00:52:45 -0700 (PDT)
Received: from fedora.. ([101.206.166.4]) by smtp.gmail.com with ESMTPSA id
 81-20020a621854000000b005082b6d2b19sm11125870pfy.53.2022.04.18.00.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 00:52:45 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] Use io_uring_register_ring_fd() to skip fd operations
Date: Mon, 18 Apr 2022 15:52:28 +0800
Message-Id: <20220418075228.42882-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x530.google.com
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
Cc: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Sam Li <faithilikerun@gmail.com>, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux recently added a new io_uring(7) optimization API that QEMU
doesn't take advantage of yet. The liburing library that QEMU uses
has added a corresponding new API calling io_uring_register_ring_fd().
When this API is called after creating the ring, the io_uring_submit()
library function passes a flag to the io_uring_enter(2) syscall
allowing it to skip the ring file descriptor fdget()/fdput()
operations. This saves some CPU cycles.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/io_uring.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/io_uring.c b/block/io_uring.c
index 782afdb433..2942967126 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -435,6 +435,9 @@ LuringState *luring_init(Error **errp)
     }
 
     ioq_init(&s->io_q);
+    if (io_uring_register_ring_fd(&s->ring) < 0) {
+        error_setg_errno(errp, errno, "failed to register linux
 io_uring ring file descriptor");
+    }
     return s;
 
 }
-- 
2.35.1


