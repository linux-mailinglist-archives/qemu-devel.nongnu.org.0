Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D43D4FE927
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 21:56:07 +0200 (CEST)
Received: from localhost ([::1]:46798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neMcQ-0004mg-C3
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 15:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMPO-0006pt-22
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:38 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMPI-0008M7-Uj
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:37 -0400
Received: by mail-wr1-x429.google.com with SMTP id e8so12810131wra.7
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 12:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SGfCTlW2iDsclwLTi5L57QKe1aCIzPtoTngcl38XRPU=;
 b=ilRXRHA1s5V7z+L9OzTGpvFNPpHsK/FZwFiHENwPwHQHODejYu9C6ZxDrXpyp/h5k5
 XpyvyDy7YOa9ZaWH74+3f2vnhWzvIcdO3SZUJsT4fyM0lpnWpmykolqUATCuumKxUZPZ
 kQFuYZlQ+vHNxaAdplr3K50Z7jkcCVKj9Gv/VLGsgV9lA/D239dtYk2z7OB6fBK4vq29
 24I8kUo/jwYQYl/YFZElgtf3snzjVrto8/HCrHx9dveDzAbHKwjF963zBbhgnjkcRknu
 oRn0hMjmXhH0FeBwJlvHLy5z0FHgVL+EIEFlobvrVZXvZxf2xfOkqkEaEbRGZdo9HF+T
 RBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SGfCTlW2iDsclwLTi5L57QKe1aCIzPtoTngcl38XRPU=;
 b=1xZzkZePI7+6KuhO0JD5J8q+XmQMwrLtXY27fyIDxEHpHU6FVM2xdPzQFZvIZ8vWci
 hHSDjueHkfoC/Go2hW1kSC+Ki52M/uWI/7ghfmP5t5/ipfCTKvVkUoy2hqnWw3wRGHi4
 oxU6JG66y9BwZ/eEzH6/MEmSiAAPrRR1yKsssUamkEnyP9no/RFYFv3KLZ0CTCF+wloi
 4N5DcocK5QVdLXnChWjnKbAPHt1hJ2Fx6Z5VcEkwMjWmFwsttjkhgS89Ll5H+2HSD2qe
 xAMD4lcM0Yizbj6frr52msqD0Oy91WMrxc4GyoxQ8UbOdM5RzHoo6+a+PBr7CfTXm5hl
 f6ew==
X-Gm-Message-State: AOAM531jF0V8BOxaxAEbnFr4uHXdQqv5BdEB8TyRxlOYHBjx7ZZ5A/ML
 3NHPytl8z4BrQKPLKTW+YRHU3gi0OEO4zQ==
X-Google-Smtp-Source: ABdhPJxdEPzjlPpA7dCOl+RsSI8Yt3MWLyF7XH3TrCQ+9ylPXfxUhnIpKiwZVBMvu6phvbh0I8RN8g==
X-Received: by 2002:adf:da50:0:b0:204:7d8:b654 with SMTP id
 r16-20020adfda50000000b0020407d8b654mr30459146wrl.607.1649792551544; 
 Tue, 12 Apr 2022 12:42:31 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600002a300b00207902922cesm14150978wry.15.2022.04.12.12.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 12:42:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 8/8] nbd: document what is protected by the CoMutexes
Date: Tue, 12 Apr 2022 21:42:04 +0200
Message-Id: <20220412194204.350889-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412194204.350889-1-pbonzini@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nbd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/block/nbd.c b/block/nbd.c
index 8954243f50..8297da7e89 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -82,12 +82,18 @@ typedef struct BDRVNBDState {
     NBDClientRequest requests[MAX_NBD_REQUESTS];
     QEMUTimer *reconnect_delay_timer;
 
+    /* Protects sending data on the socket.  */
     CoMutex send_mutex;
+
+    /*
+     * Protects receiving reply headers from the socket, as well as the
+     * fields reply, requests[].receiving and requests[].reply_possible
+     */
     CoMutex receive_mutex;
+    NBDReply reply;
 
     QEMUTimer *open_timer;
 
-    NBDReply reply;
     BlockDriverState *bs;
 
     /* Connection parameters */
-- 
2.35.1


