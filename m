Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282912CA249
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 13:12:43 +0100 (CET)
Received: from localhost ([::1]:55074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk4WP-0005Fr-K7
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 07:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kk4TN-0003VI-Is
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:09:33 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:32918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kk4TL-0003gq-TW
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:09:33 -0500
Received: by mail-ej1-x643.google.com with SMTP id 7so3668278ejm.0
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 04:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZRRGHwTm21EHxRnhI7WCVsxo0DkUGAEUA1Ti6UGXNPY=;
 b=jnWOxfD9ZtP+P0W5g9uezCHUh/NxcDhKAfeKLOOOQEglBS+bbNNI4oj7yIkh39vi3D
 HLacOnLbA2PBvAd4//8IOHxpse+ShQpyXgqBY0rAQBOUdJbwXk+lSv7Pzpjs9ZaF+7z4
 iducjn93f4sICr1BW5yPy2eJcrqGU8CYjFmtWFlIbkSorvl5EoDjcpHC8MtBnv/rng06
 48MiwbookgiTQJ9P/4LdkY6f3NlG5EGzAwAzxPh4fpx1HPldmjG5jceZobIdLdQtizQG
 HQXr1t22jxEMAqQ98LsgU2lTYdvk4K9S3gRXNtcQuoLi8ntJ9V1o5uQVcdddX4ZOylKh
 Wytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ZRRGHwTm21EHxRnhI7WCVsxo0DkUGAEUA1Ti6UGXNPY=;
 b=RRS6Ln0y49vA3dct8LA+1NX6Y+dT0MgPNQp35sCMEgkhEMLrNiWYgu3d/9NArCJApu
 0os41d+aa43wNjXOZ/XUYuX3TOvUa8ig7oeB6W7Brsu2GlgMZT/dOOecNZdt890VjxkB
 HgL2pjnhGozAqqGE0zO5d9nje7N1Cn4stqOwe7LlnnfRJ/1WNVFAaW0Uwg+I4B3/lqUw
 PuA3nPj5y1qRVYFLOl79V2G7B7iteVQXiNzu/S9J7WleOOOeYcKYRgqKD9ueDKJ97i8+
 GuN4NDz0QBtDHQnSblNkW7MWInIGut90nxEcVUUfSZsGbvby0TJxsmEKTV83YlMp9Qtl
 xXxQ==
X-Gm-Message-State: AOAM533IL8zccoA+heg3mSMGQniyJW3u2J/CffSryarMCzlcQ6+8lgZP
 qorPUYcQyrIsRb8omaNCVmrLN+40lm8=
X-Google-Smtp-Source: ABdhPJyK4nOrtNPv3geUVdueJYliELIDqz58OiepP2Pohw9cncYdp0KzPnLWUE52o3JGLrAKyRWyag==
X-Received: by 2002:a17:906:f1cc:: with SMTP id
 gx12mr2632423ejb.164.1606824568060; 
 Tue, 01 Dec 2020 04:09:28 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w17sm733418edu.90.2020.12.01.04.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 04:09:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] ide: atapi: assert that the buffer pointer is in range
Date: Tue,  1 Dec 2020 13:09:26 +0100
Message-Id: <20201201120926.56559-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x643.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A case was reported where s->io_buffer_index can be out of range.
The report skimped on the details but it seems to be triggered
by s->lba == -1 on the READ/READ CD paths (e.g. by sending an
ATAPI command with LBA = 0xFFFFFFFF).  For now paper over it
with assertions.  The first one ensures that there is no overflow
when incrementing s->io_buffer_index, the second checks for the
buffer overrun.

Note that the buffer overrun is only a read, so I am not sure
if the assertion failure is actually less harmful than the overrun.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ide/atapi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index 14a2b0bb2f..e79157863f 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -276,6 +276,8 @@ void ide_atapi_cmd_reply_end(IDEState *s)
         s->packet_transfer_size -= size;
         s->elementary_transfer_size -= size;
         s->io_buffer_index += size;
+        assert(size <= s->io_buffer_total_len);
+        assert(s->io_buffer_index <= s->io_buffer_total_len);
 
         /* Some adapters process PIO data right away.  In that case, we need
          * to avoid mutual recursion between ide_transfer_start
-- 
2.28.0


