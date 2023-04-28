Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F856F19A3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 15:33:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psOAV-0007eq-Lb; Fri, 28 Apr 2023 09:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO3V-0005lT-0U; Fri, 28 Apr 2023 09:22:33 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO3O-0001PI-Vc; Fri, 28 Apr 2023 09:22:32 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4efeea05936so7428750e87.2; 
 Fri, 28 Apr 2023 06:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688145; x=1685280145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F4EY0O0oa8k88AuVKaWqWwsIqUJLbqGm0itSJu7tu5Q=;
 b=MyXCqxlfrJxE4eb0PlSgdyN7P0L5K/reca3chv+bZM9mP0jJbmnYzzcf+cQH114KVJ
 IM6uAmgSM2lmttAnv4J0rvtPqK/iUvy3P7b2M3rd9Mo39EI9rfw/XcFLDakd9wNCSqlo
 0bic6tYyckBOC1qYBQjz1CwLJt4iISgZIQjEMO4HRXCA+ZTIaw2tlGS+XYQBI7ZL7XHf
 1OPTkbS3xtMzqp/SsSq2aySUqGk7jRK0/PJKeoAv/qc7OVDztsvuAsqjsBAIlPsQodcw
 6OMY6uJssT2EaRCbDaLtAeAFjGrA9i6nlh4zMI/cfmelaMiACbYAzW/a2k18n+ecyi7X
 78pQ==
X-Gm-Message-State: AC+VfDze+fLTPKfMkOnMAbgXa1bjRwVI5PIj1Uwr+QKrNX8OHAQM/1Xb
 UOU3MfR9ORmsHwFfO738atObux2zsEm3mf35
X-Google-Smtp-Source: ACHHUZ5NY180f0Oz2ocp1WHcQdShGzBom21abVQJ/RGp3kTuFZQe2aVemLj0ES9DYZ5L4woAdy8seQ==
X-Received: by 2002:a19:ae0b:0:b0:4e9:5f90:748 with SMTP id
 f11-20020a19ae0b000000b004e95f900748mr1426131lfc.9.1682688144794; 
 Fri, 28 Apr 2023 06:22:24 -0700 (PDT)
Received: from flawful.org (c-fcf6e255.011-101-6d6c6d3.bbcust.telenor.se.
 [85.226.246.252]) by smtp.gmail.com with ESMTPSA id
 q17-20020ac25111000000b004eee27b293bsm3098977lfb.298.2023.04.28.06.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 06:22:24 -0700 (PDT)
Received: by flawful.org (Postfix, from userid 112)
 id 11DD7294; Fri, 28 Apr 2023 15:22:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688143; bh=WQPlhahImxeAS0sOG+vVOx/lailpX79NBIEsbjNCgyk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VDaLXULEJjMO5RvtkZLDylNTer3PYFwyb9q1FsLfNRm4kJQRIz7m0Pwwu+sf8QAUb
 QDLs95le3G/fH/P29BKUNPI/6MCgjzXMJ4hz0SBRIAkTe8ftxbAbhJ1s0JKfL0J9eJ
 OD4yqD5V0yPJOEIYu+6ddukTAiKoC7ghdxEiRbOY=
Received: from x1-carbon.lan (OpenWrt.lan [192.168.1.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by flawful.org (Postfix) with ESMTPSA id 3E268406;
 Fri, 28 Apr 2023 15:21:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688100; bh=WQPlhahImxeAS0sOG+vVOx/lailpX79NBIEsbjNCgyk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ACT49JV47+zq3zkYaLERrMpTvZjLS9HwdVqq0nAHWuAseBp5Ldw56cNNfvBY3Ck5h
 YpcpZyiexk/AXDy524vuykV7EobITGrldS6upI0obiwiS9azLT0xYkihAtX/P7FMBg
 QjZCWmJe6Z8AYoCZwV4kWHZuMyAyJPzF+GQw/iNs=
From: Niklas Cassel <nks@flawful.org>
To: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH 2/9] hw/ide/core: set ERR_STAT in unsupported command
 completion
Date: Fri, 28 Apr 2023 15:21:17 +0200
Message-Id: <20230428132124.670840-3-nks@flawful.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428132124.670840-1-nks@flawful.org>
References: <20230428132124.670840-1-nks@flawful.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=nks.gnu@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 28 Apr 2023 09:29:45 -0400
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

From: Niklas Cassel <niklas.cassel@wdc.com>

Currently, the first time sending an unsupported command
(e.g. READ LOG DMA EXT) will not have ERR_STAT set in the completion.
Sending the unsupported command again, will correctly have ERR_STAT set.

When ide_cmd_permitted() returns false, it calls ide_abort_command().
ide_abort_command() first calls ide_transfer_stop(), which will call
ide_transfer_halt() and ide_cmd_done(), after that ide_abort_command()
sets ERR_STAT in status.

ide_cmd_done() for AHCI will call ahci_write_fis_d2h() which writes the
current status in the FIS, and raises an IRQ. (The status here will not
have ERR_STAT set!).

Thus, we cannot call ide_transfer_stop() before setting ERR_STAT, as
ide_transfer_stop() will result in the FIS being written and an IRQ
being raised.

The reason why it works the second time, is that ERR_STAT will still
be set from the previous command, so when writing the FIS, the
completion will correctly have ERR_STAT set.

Set ERR_STAT before writing the FIS (calling cmd_done), so that we will
raise an error IRQ correctly when receiving an unsupported command.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 hw/ide/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 45d14a25e9..c144d1155d 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -531,9 +531,9 @@ BlockAIOCB *ide_issue_trim(
 
 void ide_abort_command(IDEState *s)
 {
-    ide_transfer_stop(s);
     s->status = READY_STAT | ERR_STAT;
     s->error = ABRT_ERR;
+    ide_transfer_stop(s);
 }
 
 static void ide_set_retry(IDEState *s)
-- 
2.40.0


