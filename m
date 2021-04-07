Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5056D3577BA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 00:32:38 +0200 (CEST)
Received: from localhost ([::1]:43612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUGiz-0008SV-DI
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 18:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUGhU-0007eI-1n
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 18:31:04 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUGhR-0008Hq-R6
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 18:31:03 -0400
Received: by mail-ej1-x62a.google.com with SMTP id r9so7705741ejj.3
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 15:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7bxtMyFfM/LQ6QumWj9o+CiyZJydiKsWw4Q3+wcRlVM=;
 b=KFJrFEsNDIqKEvcH5KDfH3ZTRpirbVkM5QqTsGcvE+9B7wyu7iovwDropDf5TCvi9s
 fnGxA+743MCYOLJwM/A3PLITnminxeHeJJvUGOZNErG2VtLWwPt3l2p97wdnMn5lfp7+
 RrM2u+ARd8fD/J0g4djK3xlGNKKHm/bsQ4Upw4BwXtJbDcFqQFR13LK4aJgFMwu1t0iY
 9XSg7gW7JfJGjA7waOESKRKa7Dl4E7tI+HIViJDjliLiSGMtqVyTjTquRlYVfNmgXCH1
 5kDzFGtdBtBajmxHcs9W9elAnKTHxJfCVUmhe2gSI4OE9gB9D9o3CwPRLfMxAOdpJ/NS
 Opzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=7bxtMyFfM/LQ6QumWj9o+CiyZJydiKsWw4Q3+wcRlVM=;
 b=V4HdfIp7ku7dq0w0TnYpKSI2jTRQrFkCjMW4QLQx7O+fOGPbhw5g1S4noB3sguAUqr
 02CxKYNh6vXPEiAa4YCbZHNvBVm5tNqc4RjoIcKPj0qQzUDTBq2HdIUyB4Pg6Ga6ibC6
 HCZ1qz3YXBel5cHC2X4hwdIgJay/qIhda+RRjhU8HffOkFJ/rum/Zjv0QE3GbArCz/ps
 Edpslvk7DRqPbJL8R0C346cmBBxGyQUrA9sRtafT+0pFNPIDFYxCrgoIt1CH9t10oe++
 1Lh2hc/YLL5XARcsr7vWvC1rJhHQ7JEz7xoUkGapA256XSpnVSXyV0ivWeN0tfVXlPuE
 PLuQ==
X-Gm-Message-State: AOAM531TrPIr7wESKr2Yt1Ws8Xb2SJVgVZ3rmuglkPp86RFemformbBq
 GkHpNvnylyJ8A89VOk7chZpkwp6s476d4Q==
X-Google-Smtp-Source: ABdhPJxX2qaEP+kqNZtQhtApmSws591HSnNaskE6tPZuerTa++b0l5DLpsKWOnanjO9cB6bgm+TLLw==
X-Received: by 2002:a17:906:2759:: with SMTP id
 a25mr6599440ejd.122.1617834658462; 
 Wed, 07 Apr 2021 15:30:58 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id r17sm16841034edx.1.2021.04.07.15.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 15:30:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0?] hw/rx/rx-gdbsim: Do not accept invalid memory size
Date: Thu,  8 Apr 2021 00:30:56 +0200
Message-Id: <20210407223056.1870497-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We check the amount of RAM is enough, warn when it is
not, but if so we neglect to bail out. Fix that by
adding the missing exit() call.

Fixes: bda19d7bb56 ("hw/rx: Add RX GDB simulator")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/rx/rx-gdbsim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index b1d7c2488ff..4e4ececae4b 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -93,6 +93,7 @@ static void rx_gdbsim_init(MachineState *machine)
         char *sz = size_to_str(mc->default_ram_size);
         error_report("Invalid RAM size, should be more than %s", sz);
         g_free(sz);
+        exit(1);
     }
 
     /* Allocate memory space */
-- 
2.26.3


