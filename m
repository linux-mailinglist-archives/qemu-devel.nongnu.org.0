Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6369828E42F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 18:17:30 +0200 (CEST)
Received: from localhost ([::1]:41934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSjSz-0000JC-ET
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 12:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSjBO-0004jp-0L
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 11:59:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSjBM-0000z4-Dt
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 11:59:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602691155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QyCXoVZFq8inv3p7sgwPGouRR8crt3jaKhnpEZxJyes=;
 b=YhMzEXOMcnTON3CWth/lsU8MDORmHceNklEIGFmmRV17mM4oBqKEBySmKFy6o8xh4oYIKr
 sWH7T67NjciDu5RalrKguyuxzPVlHEvCOjhhD7l4tbeMV2yerZMQVFgwSIkefW1BuJyIR7
 R/vsUtvTyIK4uvaaeDHnKa3HCciY8Zc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-Tw4F_z6dM0S3SYh0EMaTmA-1; Wed, 14 Oct 2020 11:59:14 -0400
X-MC-Unique: Tw4F_z6dM0S3SYh0EMaTmA-1
Received: by mail-wm1-f72.google.com with SMTP id r19so29865wmh.9
 for <qemu-devel@nongnu.org>; Wed, 14 Oct 2020 08:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QyCXoVZFq8inv3p7sgwPGouRR8crt3jaKhnpEZxJyes=;
 b=DoT4JGcEQN9EAD923MbujwTmWvbFRu2I2O5UjWRBDjbRWkkYCT+EhNu0TGbIDR/kBB
 RjNN8FIimtDAAPBy8q43uIloa+PnU0rPxCC0WQP1NYsmcY+MvLpi63gMoS9W7ZQd5qH6
 oOK7hrZSxWDqZCUK6J/WqDkmeyvk4VRjPCkJQSkfU7LkGMUos+Kn4P8yOzbZ0+8DCbih
 qy9+cdRmQ9Cx8B/NTOHsvb4btwC4AnwyCy9Z1Yp5cV6oWpc434CO/yfyNrjdTSkESRhh
 LfQ38+ZVSEqxQ4cJif98beMtc3tB2nRe4pO2LyNqcJEwozl0/egN66P9Iw7Itvhq0N80
 Y00A==
X-Gm-Message-State: AOAM532qDHbBjgk9FVJI2w8S/zyf3mno1GoLkmVPoIZxG/Z+P8H9WUMb
 jeF/3uo5k9j00DhNQ286BEecv+n1o9RZrU0BseqDQaZME6Zyk4TWiZwwMYly+UDGDjKBGTxILaP
 /Sz3jxDZqO1E654A=
X-Received: by 2002:a5d:558e:: with SMTP id i14mr6742853wrv.40.1602691152731; 
 Wed, 14 Oct 2020 08:59:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvgeZSzRI+G99Y25lH/EWje7a/1IUyrssbWQ/uBHCdOCDXF42aJI52Cwfl/+kF6VcXix3tAA==
X-Received: by 2002:a5d:558e:: with SMTP id i14mr6742838wrv.40.1602691152595; 
 Wed, 14 Oct 2020 08:59:12 -0700 (PDT)
Received: from x1w.redhat.com (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id g139sm158863wme.2.2020.10.14.08.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 08:59:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/15] block/nvme: Simplify device reset
Date: Wed, 14 Oct 2020 17:58:07 +0200
Message-Id: <20201014155810.102841-13-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014155810.102841-1-philmd@redhat.com>
References: <20201014155810.102841-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 01:12:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid multiple endianess conversion by using device endianess.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/nvme.c b/block/nvme.c
index fad727416ee..299fc82f40f 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -747,7 +747,7 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
     timeout_ms = MIN(500 * NVME_CAP_TO(cap), 30000);
 
     /* Reset device to get a clean state. */
-    regs->cc = cpu_to_le32(le32_to_cpu(regs->cc) & 0xFE);
+    regs->cc &= const_le32(0xFE);
     /* Wait for CSTS.RDY = 0. */
     deadline = qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + timeout_ms * SCALE_MS;
     while (NVME_CSTS_RDY(le32_to_cpu(regs->csts))) {
-- 
2.26.2


