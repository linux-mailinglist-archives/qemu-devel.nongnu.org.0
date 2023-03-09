Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7826B1E8F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:47:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBtg-0000Ff-48; Thu, 09 Mar 2023 03:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBtc-0000ER-4C
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBtZ-00006T-U0
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678351505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXAux5UJetRfsyf7WlZWhWkdfnLmU2MPlX7G+HARLMM=;
 b=UV5BZYrjaLPKhHxP3dB1TQuk88taGuP0CmL8NVIwTD+5zMkC90FNHZx9Pddfs065QxW5Jy
 JZcYopqapqRVW+v2CCE6dHu30lx/2vxUZY0+cp9T8zgr3YjHtSGhmUrlrcTFiotHKd+ZUC
 KrUqSj8lLTQz4RSHBOSblnfCJS8tY9M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-6D90LHVDPXKP7MVhAk36xg-1; Thu, 09 Mar 2023 03:45:02 -0500
X-MC-Unique: 6D90LHVDPXKP7MVhAk36xg-1
Received: by mail-ed1-f72.google.com with SMTP id
 b1-20020aa7dc01000000b004ad062fee5eso1848947edu.17
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NXAux5UJetRfsyf7WlZWhWkdfnLmU2MPlX7G+HARLMM=;
 b=0qq05eeOWwaIrA6QAPyjFPM224nYYutiJdl+eYoP8j+gSQ2xy4NEUGYhMSUp+3lmbd
 ZHxuHpH426gmUmPw6rjF6Rp/wCdk7/XZhsHWccK+QX3GxIGvw0j1nyq3KOFu7kYfnPN/
 y9udNuMVGVGWeh8P5wfofLxqegTXnDw2UKzN6HBrxwavLubLGriR5oWOia/hOdGwh8ic
 r2mdRXUC0GexkScCKr56sx+bIk7MI9l0khr1xIwJrkql/q6fBuSXTI18C6Os/d/7N0+g
 +O6UDl9tMSflPstajFBRzgw6GbNT6QwdvegeS8U5IeBnm06cUY7GDdwEYUMLDM5f4kk7
 3P9A==
X-Gm-Message-State: AO0yUKXDGm3NYPksvbNS3QTsNZxJKW38A95FfUHaUSoA6Saev+FqZ+m9
 2kYljQNhzYr/QwsNh5vSJtihmBQBr9wVTWU5HLGSTf8P4eAA3Yh8CYMJaUQwMPmY+E5O3S6NJOw
 9garHUeslmPP7ZBN4jNFk+drNZ9msDZgEjR/nmAMq3hle9lluavvbEIjSdPwSqAspC6pYMR7Xpc
 o=
X-Received: by 2002:a17:906:550a:b0:8e6:1726:df82 with SMTP id
 r10-20020a170906550a00b008e61726df82mr17418039ejp.30.1678351501437; 
 Thu, 09 Mar 2023 00:45:01 -0800 (PST)
X-Google-Smtp-Source: AK7set+CzTLSH+/z4Ksw0pkfkURu3r5sriwaLywqTM8Md6wt/NRt1kfnzKnjz7Vcky+drQu5ogYDZQ==
X-Received: by 2002:a17:906:550a:b0:8e6:1726:df82 with SMTP id
 r10-20020a170906550a00b008e61726df82mr17418027ejp.30.1678351501162; 
 Thu, 09 Mar 2023 00:45:01 -0800 (PST)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 y26-20020a170906519a00b008e53874f8d8sm8542526ejk.180.2023.03.09.00.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:45:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 2/9] blkdebug: add missing coroutine_fn annotation
Date: Thu,  9 Mar 2023 09:44:49 +0100
Message-Id: <20230309084456.304669-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309084456.304669-1-pbonzini@redhat.com>
References: <20230309084456.304669-1-pbonzini@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/blkdebug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index 978c8cff9e33..addad914b3f7 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -583,8 +583,8 @@ out:
     return ret;
 }
 
-static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                      BlkdebugIOType iotype)
+static int coroutine_fn rule_check(BlockDriverState *bs, uint64_t offset,
+                                   uint64_t bytes, BlkdebugIOType iotype)
 {
     BDRVBlkdebugState *s = bs->opaque;
     BlkdebugRule *rule = NULL;
-- 
2.39.2


