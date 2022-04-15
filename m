Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049E2502B0F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:38:06 +0200 (CEST)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfM9F-0000ye-4P
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsS-0007Iu-Kr; Fri, 15 Apr 2022 09:20:45 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsP-0008To-BI; Fri, 15 Apr 2022 09:20:44 -0400
Received: by mail-ed1-x535.google.com with SMTP id b15so9908393edn.4;
 Fri, 15 Apr 2022 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v1wXjy3dOvISKhKrLTVr4XDRoBc4ykMCUe9x4ZrVMjo=;
 b=VRqt2mBqqSCI++Sv9wSC9LjYb4cUzCvPamdy7ADbVLY2S099LMSy8s4G7JW/yjRdyY
 sxcKJPpjQKwPgIWkT78izK3os5zss2hKWhH4fS7CV712gFqqXkhAHJYb1kegCJvq0G/N
 Lg868L2jhPz7s13khUfVSrUacwSu/2qVBmqpG+w8NBbcc/cn2vnLtc6C/hofbIDTXk9x
 Z+jt+Dxhf61ZQhJ6/2mXsJCuTkq+1nDT/IALDaUjrKfosvyvXWo4/8hgNA1TGpA6+MPL
 pMPC+EGNuRHRVg49xKxKGQ/Bl79lTNqs2hDEIlD/S1tDw2kjx34akJpZR9W2sJOmCMjN
 urDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=v1wXjy3dOvISKhKrLTVr4XDRoBc4ykMCUe9x4ZrVMjo=;
 b=y/L++x/7nKzI2K/xvUx0qFi6kydGup2PynOz7z6LcL6vgAxt+Tfu9Hl/ULPMKy7eAK
 wi74If7a+HHIEnDagLsE+WgBoFKyUOkmNBiPiVa/C1ehyPIf7Xwv2hGg+OKYLRte2DmJ
 OO2NgEU4vpba3J6j0gm7ib3QAbOyMfrrYplR3x8ErH4yhw74cma6tequf6KGJzWW7Fh8
 tuQ2+thLJ/8wDZEtVoBaUKfa7wFFjcCcfn4AIKPFtoL6RtnSXCA9YShDMy8OshwZzg/+
 PV8SUowIg5puKTHU3KxinKXIxS+lcGPbn7WcLXGY79qrimcgciBg6C9E/4H8y81/1cVj
 1RBQ==
X-Gm-Message-State: AOAM532xXmfmt64vTpnH1ZVRIhVBGz+r1KbqAD9GAtT/Rj6vAQf5OFGw
 K1xbnraB4mUhlqMal/ifQRjH6mC6TeYLUg==
X-Google-Smtp-Source: ABdhPJzv+p339WCtdSxVk6vHTCJuUdOxCUCDFSnbD6sAjVZJQ1f0qJrsrNyB6BYA1KI8tuubsTpeXg==
X-Received: by 2002:a05:6402:50d0:b0:419:7df9:55c8 with SMTP id
 h16-20020a05640250d000b004197df955c8mr8083309edb.79.1650028839704; 
 Fri, 15 Apr 2022 06:20:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:20:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/26] throttle: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:53 +0200
Message-Id: <20220415131900.793161-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: malureau@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/throttle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/throttle.c b/block/throttle.c
index 6e8d52fa24..ddd450593a 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -162,7 +162,7 @@ static int coroutine_fn throttle_co_pwritev_compressed(BlockDriverState *bs,
                                BDRV_REQ_WRITE_COMPRESSED);
 }
 
-static int throttle_co_flush(BlockDriverState *bs)
+static int coroutine_fn throttle_co_flush(BlockDriverState *bs)
 {
     return bdrv_co_flush(bs->file->bs);
 }
-- 
2.35.1



