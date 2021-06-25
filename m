Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1223B45A6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:33:23 +0200 (CEST)
Received: from localhost ([::1]:35664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmtW-00043Z-JE
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfQ-0003fL-HO
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:48 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfP-0003JK-4D
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:48 -0400
Received: by mail-ed1-x52e.google.com with SMTP id m14so13622878edp.9
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wJvWsUqGOQTva1vOWOjj4YQ10DwGdZUCbC7uWnekL7s=;
 b=eCxQlIdMRXTg4PhCey4xhR9/kK8L+UT7ueMVhmu/G6GSEczaMFZpnDEDgJ56xwwScD
 HqAIysoxO2JnyAKImUzY5Vk9HkH7i2DC79BQrFja7YMNFN6qlQtXb9JMJsIcUdwZ1mzw
 VogRZsdZV6JJorviwLOOYZ0Im+6A+lxK1azuj8naiNHA9Rm6NmMLBEFPuBiea8bZ/KZK
 55UchIIKm0JlZjt1C8tfwLFpdYBliUBbQXWV21G1ym8pXsvD909xwolGeY4VPcPouz/j
 r20l81kFk4WCrO8lhBYwVWGjZj7eTE5fHQKQJDwXw2yBcZaOPQeYqPWkbT0yNsrrqLwq
 LKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wJvWsUqGOQTva1vOWOjj4YQ10DwGdZUCbC7uWnekL7s=;
 b=Y5eIIXrDTAHpgQ4CZdu1ST0HHiuZXSvSU0yO18RdtIwCcW9LKgNh6HbrOemkHr5mFG
 Gs7YUBkea8uy0vZ5ioia9m3Tb7hxlzx5Mn6nCspCLSNbYK/ld37OTsNbtouFWFO0N/+P
 zVBJCWIrFT8HgUHgeWtwED4zYOfBHTVGOBwexi4ItQ1hfCRshhKq6tOy/VF5JEhRYjxa
 oRXEiEmb6Q7lLhiKJv3tgt8k1PnBrR00B86WMY+aZ0orrxrJj7dQsnURA1JSu79H+MXu
 0TpjdmkVihbyAxPxExZbfccoGZlIQV4vJ5EXdA7qeDTKtzBItsFX8IF7QcDNTFtxr1yI
 WeRQ==
X-Gm-Message-State: AOAM5313YoMkTHCEt+1bnGvFWMzGzGdD8MS8A8FEYAq5kCbHyzKCcM1G
 y8GyobpGhAVrSWdVCMeeYHRS4RjF/Kw=
X-Google-Smtp-Source: ABdhPJzakt1aWsMAZU9+RDJYt7Yz3WUBWfYiZlWkzDifPXDj4gueRqV+pjQFklaeVPfi/oDHMlNv9Q==
X-Received: by 2002:a50:fc90:: with SMTP id f16mr15164610edq.254.1624630725827; 
 Fri, 25 Jun 2021 07:18:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/28] file-posix: handle EINTR during ioctl
Date: Fri, 25 Jun 2021 16:18:17 +0200
Message-Id: <20210625141822.1368639-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Gordon Watson <gwatson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to other handle_aiocb_* functions, handle_aiocb_ioctl needs to cater
for the possibility that ioctl is interrupted by a signal.  Otherwise, the
I/O is incorrectly reported as a failure to the guest.

Reported-by: Gordon Watson <gwatson@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 74b8216077..a26eab0ac3 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1347,7 +1347,9 @@ static int handle_aiocb_ioctl(void *opaque)
     RawPosixAIOData *aiocb = opaque;
     int ret;
 
-    ret = ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf);
+    do {
+        ret = ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf);
+    } while (ret == -1 && errno == EINTR);
     if (ret == -1) {
         return -errno;
     }
-- 
2.31.1



