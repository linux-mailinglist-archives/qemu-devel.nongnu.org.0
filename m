Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2506B501AC0
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 20:04:36 +0200 (CEST)
Received: from localhost ([::1]:49688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf3pb-0004nt-90
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 14:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3ja-0004w5-Ri
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:22 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jZ-0005vO-7V
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:22 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 i82-20020a1c3b55000000b0038ccb70e239so1833187wma.3
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wvxm2qlPk8qzLFbxsjQC/sIFBmKh+P0XO3nR8MKrs5Y=;
 b=SlSaXdEMpp7cFkSkQVwL5X3JWWtL8hlsOymvBQBB/+kicq/JVdVITBAKxjkxcwQTJw
 F8WO5EhRnOqii4zfuWNXbnmGYilbP5e3K07sg+OXNSapQ1l5MQS4eJQpGy08rupqO4x6
 2vCIrqujcGiCC+wVXWfjRIl8f9LghKD7iP6bJGyhg+MkL1zk2y+Oj07jWQXbrP2d5Dxc
 aG2NbIatTlWQOp3xrn3zLEDGk9ooenqlBIvhpgCBHuT+UAr5WBBfV35T0ElelMgtnNfR
 h7Ux4YHMEr5kHmXpQSg0f1ewlTxqZMAudqnSpSYe4XiDZrxvW8g09vVUf4DbN5jvwL72
 5LcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Wvxm2qlPk8qzLFbxsjQC/sIFBmKh+P0XO3nR8MKrs5Y=;
 b=W35eE4IHeDypdV+AFNeFOJR+u36ayWsVQ67mPF5lysAddpHMgrbJy29IryBFGkAhmS
 z0IFlokeENZrRzJocDBiN8SivjCiQEqfCQ0kCamg172X9Xub4MxfZPdecUOkn+mY/fHM
 W7NTCjD/aaDlsRRO320iQVMJKbtK/luWd9ZB5oJKhDmDRA2An0XVGLps2wbDsptPTwH5
 dnhf5Dvitm+Wjnd15Vhx4TSeDdu49Pcn4zvOkq4KoN0ThKtxd7cZ7EaRkHCcZ+1jAW+4
 ZcMFOuwtXBj1CjF/EKkqa8gdQiqfYlH7aTw3LponUTj8PQFiALRpVfH2tG7/YuvMgX1I
 QOhw==
X-Gm-Message-State: AOAM532MoB727N+i1hBxYEhwjbHdiPT5WldBz3Jdyz+HvK/gJrlKdLjc
 E/iFtYVRWyFYzOiSlEiMSDZdgV07dVpxCw==
X-Google-Smtp-Source: ABdhPJxf9YpR9+VlHWbhBhytsDULzkTwlavtY3/H1F9Y+HAiCqzYz6HTINvxImHBG4zH4lvwtERfDw==
X-Received: by 2002:a1c:3584:0:b0:38e:b8ba:181e with SMTP id
 c126-20020a1c3584000000b0038eb8ba181emr4218362wma.181.1649959099290; 
 Thu, 14 Apr 2022 10:58:19 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm2451254wri.4.2022.04.14.10.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 10:58:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-7.1 9/9] nbd: document what is protected by the
 CoMutexes
Date: Thu, 14 Apr 2022 19:57:56 +0200
Message-Id: <20220414175756.671165-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414175756.671165-1-pbonzini@redhat.com>
References: <20220414175756.671165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: v.sementsov-og@mail.ru, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nbd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/block/nbd.c b/block/nbd.c
index 31c684772e..d0d94b40bd 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -81,12 +81,18 @@ typedef struct BDRVNBDState {
     NBDClientRequest requests[MAX_NBD_REQUESTS];
     QEMUTimer *reconnect_delay_timer;
 
+    /* Protects sending data on the socket.  */
     CoMutex send_mutex;
+
+    /*
+     * Protects receiving reply headers from the socket, as well as the
+     * fields reply and requests[].receiving
+     */
     CoMutex receive_mutex;
+    NBDReply reply;
 
     QEMUTimer *open_timer;
 
-    NBDReply reply;
     BlockDriverState *bs;
 
     /* Connection parameters */
-- 
2.35.1


