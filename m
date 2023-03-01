Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2756A696A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:04:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXIM3-0004F1-B6; Wed, 01 Mar 2023 04:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXILx-0004CQ-2r
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:25 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXILv-0002nj-4O
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:24 -0500
Received: by mail-pl1-x62a.google.com with SMTP id h8so9975256plf.10
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 01:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Jom0mo8a7rLZDLeUuzG8/w1CotxFmoY2CGtNaw29Hg=;
 b=PJwSQRpsd/OBUIT0hrWNrgQiScw9HjVo1LQH9HDixsikTazEvXeBdfIx0PFOgjjV/m
 rfunMnFa26YuoxcelSGcHcxFzvWkJh+518dTuq6K/DK+Or9Brbqu4JagrPeLjTLNyZUs
 cwSZ+7Sn2h85MyIqfE91gaWOrTKOjwAG1lfosKPBBFbCbA0HJAWcYbWzoSs9gsxLhwSH
 zA/FCN43hncRvRruNnnhGtInMYBhbJRkciCA4UqpXXtEJF+T2PPDWIBstqkm/ATzdHtR
 67VeUYeFT1m6IiijBUw1nYk6xqb9VD6iPIMBZJIwJFX/2KuwFyq11Nhrn7VSjM5m8m2J
 +1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Jom0mo8a7rLZDLeUuzG8/w1CotxFmoY2CGtNaw29Hg=;
 b=ebxENwQxqstFBzfo6CvP/j64opP2u/XZWFNE04BW9z0TkdLMPD40AYI6WCrQ4Z9Dao
 plbEHk9978Im4Zjq+/bhHCUQ6i8kI4vkuTZY5pUWp4YHmT3juRZry7CsfdY+roYAhLzJ
 LkC9gJmrsDlbcaOVxTYI0z7bQQy4TiiQymo1QmWA3Npu645Q0sIJraDXInCBl/ff5xPc
 3zwHEQ4OAoFYQFqEjpIOmbhQOD3c+WRqrQeGKUDuS04ErZ0mHUOeD2OCIdmddZwOI8l/
 +L4wvJwDTct4xGVEBvo5AzPMCFMidyqXj+QMTcSixkixjKKzWBIY2qpK7mzPMr41GEDC
 R3/w==
X-Gm-Message-State: AO0yUKWILdsUfe6FH9+FIOxkN+id0wwzOH7Nqj+JCSmjLanQQfDCSeOf
 h2L+tP4QxLMBxzKF43S9/F3s/HOA48A=
X-Google-Smtp-Source: AK7set/0NbR1PANtNTYmwLXGAyqFosxffHAoz3Za84TlPKCoxXCzoxwiLI3vhLecATag6+iA/FV8Lw==
X-Received: by 2002:a17:903:187:b0:19c:b662:e216 with SMTP id
 z7-20020a170903018700b0019cb662e216mr6566066plg.69.1677661339963; 
 Wed, 01 Mar 2023 01:02:19 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 iw6-20020a170903044600b0019aa8149cb3sm7878991plb.219.2023.03.01.01.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:02:19 -0800 (PST)
From: bmeng.cn@gmail.com
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v6 5/8] hw/net: pcnet: Remove the logic of padding short
 frames in the receive path
Date: Wed,  1 Mar 2023 17:02:00 +0800
Message-Id: <20230301090203.1601925-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301090203.1601925-1-bmeng.cn@gmail.com>
References: <20230301090203.1601925-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Bin Meng <bmeng.cn@gmail.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 hw/net/pcnet.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index d456094575..02828ae716 100644
--- a/hw/net/pcnet.c
+++ b/hw/net/pcnet.c
@@ -987,7 +987,6 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
 {
     PCNetState *s = qemu_get_nic_opaque(nc);
     int is_padr = 0, is_bcast = 0, is_ladr = 0;
-    uint8_t buf1[60];
     int remaining;
     int crc_err = 0;
     size_t size = size_;
@@ -1000,14 +999,6 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
     printf("pcnet_receive size=%zu\n", size);
 #endif
 
-    /* if too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     if (CSR_PROM(s)
         || (is_padr=padr_match(s, buf, size))
         || (is_bcast=padr_bcast(s, buf, size))
-- 
2.34.1


