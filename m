Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FA61FB51E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 16:56:24 +0200 (CEST)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlD0h-0005Dc-2V
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 10:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCR7-0004VW-HZ; Tue, 16 Jun 2020 10:19:37 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCR6-00072c-0z; Tue, 16 Jun 2020 10:19:37 -0400
Received: by mail-ot1-x341.google.com with SMTP id 97so16065397otg.3;
 Tue, 16 Jun 2020 07:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DY0aK3a0zzQFlyBspZJZerQeFJhCLgUi3QlXt9plQig=;
 b=KVNvsW7Nik16xiQC+aVzXxCYDyZvEo/itv2N2dmfOzRmzaKcSgai9fAJ2qR/r7J7fI
 BRE8dsytgwvXGGGybL4szY4884avOPdFSZbjJbdUisZGYhr7fW7yS3iz1gMEFSgC56AZ
 7OoTpbdtao0z3WMfeHUsxhfCXpui7Auc5f+QQYx7/vOKbcAbDoZKT+8Bgv6PmI7alD5I
 nNyktUJjsXCo+fCf1V3Zzj0cddZ9YfY6r4QIGyMSXjXpv9kMsrGAx2LDdVSAo01uNa5M
 WMqQMryYBjiY4JJc/mVTFA2cVfXZmpo5zo5fxv0m8+gnPoqLCH/lFOBSijnDGKyYFfh6
 G8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=DY0aK3a0zzQFlyBspZJZerQeFJhCLgUi3QlXt9plQig=;
 b=jyG6n0Xoi+1zHa6CgrflBQ+SBJeYsXxips6u0h6D66hRhdH+24ve0fcHCs12tofDxS
 pew0xRQ3Xiq92DZ4/mY7NYOqgtbSrtPTVj+QktwRReQH2e3L4YyPtXl7r9TjhjghiWWt
 S+rMmHzKRVFf0vYqHs3Ctqe8SUGjNub74P8aUTTPHpHGaThkxd+2E225yQENBYoCckg2
 6LT8pyRsXogbDirLo7J0kxmh7Jh5CS0Dhg0NwoxHkfolxKZ0cnqfkdy6NR3rc1U3tZxs
 fzd9U6DIAPDGBOVhlH7sewYpH6c/R5DJV4xdfxP/ThimVFP32BbiiPH13TwhVBFa84XT
 GLzA==
X-Gm-Message-State: AOAM530wbNucBSmBpxpCCJ6qorHlmuJ+1H3I/z3b107t10Nl4gHyJxr8
 DRbgQK7D7qXEkP2dRIq/Dj0cfTbo6Rk=
X-Google-Smtp-Source: ABdhPJyKixcTi8UahooYXpRbzcHVsWHLZJKfOObb3tfoKRva1JJt/ovNvudTwaXRE7k2NVF3E+515Q==
X-Received: by 2002:a9d:6c03:: with SMTP id f3mr2516702otq.291.1592317174242; 
 Tue, 16 Jun 2020 07:19:34 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id y16sm4136217oot.11.2020.06.16.07.19.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:19:33 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 71/78] qemu-nbd: Close inherited stderr
Date: Tue, 16 Jun 2020 09:15:40 -0500
Message-Id: <20200616141547.24664-72-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=flukshun@gmail.com; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-stable@nongnu.org, Raphael Pour <raphael.pour@hetzner.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Raphael Pour <raphael.pour@hetzner.com>

Close inherited stderr of the parent if fork_process is false.
Otherwise no one will close it. (introduced by e6df58a5)

This only affected 'qemu-nbd -c /dev/nbd0'.

Signed-off-by: Raphael Pour <raphael.pour@hetzner.com>
Message-Id: <d8ddc993-9816-836e-a3de-c6edab9d9c49@hetzner.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: Enhance commit message]
Signed-off-by: Eric Blake <eblake@redhat.com>
(cherry picked from commit 0eaf453ebf6788885fbb5d40426b154ef8805407)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 qemu-nbd.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index 108a51f7eb..38031310af 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -1022,7 +1022,11 @@ int main(int argc, char **argv)
         } else if (pid == 0) {
             close(stderr_fd[0]);
 
-            old_stderr = dup(STDERR_FILENO);
+            /* Remember parent's stderr if we will be restoring it. */
+            if (fork_process) {
+                old_stderr = dup(STDERR_FILENO);
+            }
+
             ret = qemu_daemon(1, 0);
 
             /* Temporarily redirect stderr to the parent's pipe...  */
-- 
2.17.1


