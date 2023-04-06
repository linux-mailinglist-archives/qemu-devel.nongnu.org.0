Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843CE6D93B3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 12:09:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkMXM-0005w6-Gg; Thu, 06 Apr 2023 06:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkMXK-0005vh-68
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:08:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkMXI-0006Tc-Br
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680775687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cy9d6Q4bho3M7ZjyIEL2//50hRS6YbKgrLDG0/3R0SM=;
 b=ZuSfb5vT7Vp7rfW4JmJ0PVO/gHnRKhYz8Z7Ui9Rg/qNkuh5NmlsDMkgNvcvDnocKl9gs6D
 2wP3DWcSalG6tZvryP8atmkuxtJOwiP9Cndy3glsmisFHPw8e9LmmRNwlgCkgcWlWGXPkG
 5RMAJXVUuwNoxc0SGxQxLahCpJESb+M=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-fBNnaTIZMqix1uM6C5hIsg-1; Thu, 06 Apr 2023 06:08:04 -0400
X-MC-Unique: fBNnaTIZMqix1uM6C5hIsg-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-501db0e2307so633969a12.2
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 03:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680775683; x=1683367683;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cy9d6Q4bho3M7ZjyIEL2//50hRS6YbKgrLDG0/3R0SM=;
 b=HQFZV+XAOo0EIwqGJ4QEOGB/LdBVMw8Mue0ZpNjR7D62gh25VrwaEz1vV2jiom8k1h
 3MzBPtHk83nRhofTObrQCShS6pokO9ClNd7ZY9fRnR9aByOiD16g6/6ckwilzlzEQkmc
 CrMTQndca4WE27/GG+JXDlPSf+2evzfEuBf1O5AYT3Dqo/SQFXdD0PlUvFPwAdjZKWYS
 e0uzEdSrsfL9VrjW9/bbBE246uwtswqj77yh5efJpn4v8ZJxeMDY2Ow8xWa/DBkgvOxg
 aTW7qG85XBYWOOi58GjQ6A9kfj+bG7KgVQVztVpmxwFFdqRsu6VM/P6t0dyuoivXJOyL
 CDhw==
X-Gm-Message-State: AAQBX9eMU5hqPAYdQbVClmSQctCfCqhsSkJDgvQzl5tk6j0bl5/g/bRB
 XjaX9Cc2ntbF/iHBcncgz65HSYx6ScJrrlFfj0daVkgPc4y79sUY5U880OuJz/FCCusFLVb3mcR
 UtKxrOetDPLw3hDyi1xPSrTbHxAbRZ1nBkq8ZvK/5d3rLPVJ6OEa7RayLZDGiR6gohnFMPZmfBh
 k=
X-Received: by 2002:aa7:ccce:0:b0:502:3376:7872 with SMTP id
 y14-20020aa7ccce000000b0050233767872mr5206536edt.35.1680775682879; 
 Thu, 06 Apr 2023 03:08:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z/JM1KVyBVNjAEzwH1hjjOeJsZifBjrU8Uu3Uaenwy2Qewmkxi3LfAm/Bf5Vl7s3B2tQEcOA==
X-Received: by 2002:aa7:ccce:0:b0:502:3376:7872 with SMTP id
 y14-20020aa7ccce000000b0050233767872mr5206519edt.35.1680775682551; 
 Thu, 06 Apr 2023 03:08:02 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ek14-20020a056402370e00b005028e87068fsm530048edb.73.2023.04.06.03.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 03:08:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com
Subject: [PATCH for-8.1] block-backend: remove qatomic_mb_read()
Date: Thu,  6 Apr 2023 12:07:59 +0200
Message-Id: <20230406100759.240870-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There is already a barrier in AIO_WAIT_WHILE_INTERNAL(), thus the
qatomic_mb_read() is not adding anything.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-backend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 2ee39229e4cf..b6297aae6ad0 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1821,7 +1821,7 @@ void blk_drain(BlockBackend *blk)
 
     /* We may have -ENOMEDIUM completions in flight */
     AIO_WAIT_WHILE(blk_get_aio_context(blk),
-                   qatomic_mb_read(&blk->in_flight) > 0);
+                   qatomic_read(&blk->in_flight) > 0);
 
     if (bs) {
         bdrv_drained_end(bs);
@@ -1843,7 +1843,7 @@ void blk_drain_all(void)
         aio_context_acquire(ctx);
 
         /* We may have -ENOMEDIUM completions in flight */
-        AIO_WAIT_WHILE(ctx, qatomic_mb_read(&blk->in_flight) > 0);
+        AIO_WAIT_WHILE(ctx, qatomic_read(&blk->in_flight) > 0);
 
         aio_context_release(ctx);
     }
-- 
2.39.2


