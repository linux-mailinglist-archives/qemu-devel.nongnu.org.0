Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB576EA726
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:37:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn9P-0008TO-TJ; Fri, 21 Apr 2023 05:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9H-0008G3-1w
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9F-000347-In
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ifgJJqm+ixiCLlygxPOWvcvQIIN1wnaUxQPNxTfWYyY=;
 b=VLIbo+qUhPalfHUblcgURK82tYKNndnq58A8zmEeeDx3QqI2QeLJoYBT9RBoR5VCWVXUdy
 O7Wq+/D1YOyhwMKNncKSUtcn8cjQgaAWc90eVrNm5GJ4heGlxozepQgcSiHGKyxFA8crKa
 3vBrn1g3la43eREH4zwWq4kwZKCUa1I=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-RBF5-8qTPLqJXKdx0gBNsA-1; Fri, 21 Apr 2023 05:33:43 -0400
X-MC-Unique: RBF5-8qTPLqJXKdx0gBNsA-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5084807fb63so1369858a12.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069621; x=1684661621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ifgJJqm+ixiCLlygxPOWvcvQIIN1wnaUxQPNxTfWYyY=;
 b=QVpSr4ppOb775ZnyqYsKyRpdXyFIQRXTVj3tBFopUBrWZNxb7ae8LYRCqekcE1qu/9
 /VKUZ9N7JYq+brGXkdf9CLLyuAnldf6xqByG+g3I5DmASMvsG+tT+RjP/fmSpL4sE6f5
 dIhqHrGbI+ruRmpvqk5Znk6l5uGMCufEEeInB98xdJsLPutZPPNesgweiuLiqUCuSv4d
 JMx7JAEYYmcN4voAW43cVVk6R+0NAnLD65QRpSF+cixcPW7REEH+n+D6vKWk47R3YkcB
 0M1NPxTJVawhZ+NCYx7HQSxmQVb/1nddZKPINJBwiG3H6sl1FvemtxtkNn1Prj93qAzU
 jibw==
X-Gm-Message-State: AAQBX9dSDMJvA3rTIy3bbJs3voi/Hq67S882xk+LyD7yPt5dJK6zFQph
 UXj4l6keoYynOGz24CU+wgK69cuXv/aoTKPy3ERtfeurBkL/FKpsbLz4yidVWTV6FoPeRZ8tJMU
 UTlq1L6jrJPhQfZqkIDdgTUewi4VBZET516aFjegN4kW4z/82WD5d6Ko1fJiMHeD2n2Gw8w7g6J
 iNcQ==
X-Received: by 2002:a05:6402:31f3:b0:4fb:aa0a:5b72 with SMTP id
 dy19-20020a05640231f300b004fbaa0a5b72mr4463828edb.5.1682069621561; 
 Fri, 21 Apr 2023 02:33:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350ag4E5heZRwrCaqyegRBtXevEwfkLQG/FAt/0SbboijEpgBebXe2TIXrT2szZ+KW8X0EOsNUA==
X-Received: by 2002:a05:6402:31f3:b0:4fb:aa0a:5b72 with SMTP id
 dy19-20020a05640231f300b004fbaa0a5b72mr4463811edb.5.1682069621185; 
 Fri, 21 Apr 2023 02:33:41 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 o10-20020aa7c50a000000b0050504648fc4sm1652219edq.80.2023.04.21.02.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 17/25] block-backend: remove qatomic_mb_read()
Date: Fri, 21 Apr 2023 11:33:08 +0200
Message-Id: <20230421093316.17941-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-backend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 55efc735b442..5566ea059d55 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1845,7 +1845,7 @@ void blk_drain(BlockBackend *blk)
 
     /* We may have -ENOMEDIUM completions in flight */
     AIO_WAIT_WHILE(blk_get_aio_context(blk),
-                   qatomic_mb_read(&blk->in_flight) > 0);
+                   qatomic_read(&blk->in_flight) > 0);
 
     if (bs) {
         bdrv_drained_end(bs);
@@ -1867,7 +1867,7 @@ void blk_drain_all(void)
         aio_context_acquire(ctx);
 
         /* We may have -ENOMEDIUM completions in flight */
-        AIO_WAIT_WHILE(ctx, qatomic_mb_read(&blk->in_flight) > 0);
+        AIO_WAIT_WHILE(ctx, qatomic_read(&blk->in_flight) > 0);
 
         aio_context_release(ctx);
     }
-- 
2.40.0


