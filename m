Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29A829B020
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 15:16:48 +0100 (CET)
Received: from localhost ([::1]:40592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXPmJ-0007pC-QW
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 10:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kXPTv-0003qy-4D
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:57:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kXPTl-0004Td-Oe
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603807057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJk75AmI6iZBxAGRnOfhQsAkiS0PriXiInR+pfpFLCQ=;
 b=J1vlpA+DLL3yErJ4c5SMBLzASdHE9wL/WCUp8BC/l46fKaVL7oFS43YKKlKQh0d4HeGNBx
 IsuamGzYM3eNunlrMeMZGQProzQ5eCdmsMt1cjs6s0UzGU2C1JDNXtPaTO1Unm3m6FTnWI
 GHLtwcmcIWTCV8u+8wZc+ExB97MUzow=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-ooxUwXx3Pa-0DkSdxLc4bw-1; Tue, 27 Oct 2020 09:57:35 -0400
X-MC-Unique: ooxUwXx3Pa-0DkSdxLc4bw-1
Received: by mail-ed1-f69.google.com with SMTP id 28so719570edv.9
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 06:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RJk75AmI6iZBxAGRnOfhQsAkiS0PriXiInR+pfpFLCQ=;
 b=s3HRIfL2QLZUxUpo0DrHFqiljotDnkdyI4gYtknJGxVtjojJxbNxPGgn/EFQi4qrY3
 C6G4fJ4zwsktR2mCQ8OfcB0or7FeiHEbNP56LYWU11F4hTUOcG0Ea+8V+PhU4R0apvSs
 p4Mf6RUaLqo7L4Keaf49UAwheXypLnK/6Y2b8WheDWehRKBzq437k3rv9w3HfxOzrDRd
 mGX7kzqlJGUFFaFKhsC6szQMc2Ws88BluDO/FyPbY2BbATsW9khjCqKFz3KuMNqgHudP
 43V+uTU0TaCts1ArOs71xcFPwIXDNV85nvTs8U0Bd7JToZM742JZZMOO+iZN0Z1XDzNe
 LYfA==
X-Gm-Message-State: AOAM530nsoV0PXjk7kkKY1n+/m83FW5eTfU0sgUOtnSEMAeLgnyFcxpg
 h/dHf4Z4irA8K7fVCLh7U7lyDQ321O1D49dHf/41AgBe+hyEySrNvSOCo04JjHUJvoqMgwJnSGb
 xD9PisyX498Ze9eY=
X-Received: by 2002:a17:906:3a1a:: with SMTP id
 z26mr2434455eje.519.1603807053077; 
 Tue, 27 Oct 2020 06:57:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCxeBepJouLr4JjCDbEz6RpAdJu0yoFSQNNFmO/lwqirty5H/MDmwxCDZyYzpFfwQLbILEhA==
X-Received: by 2002:a17:906:3a1a:: with SMTP id
 z26mr2434430eje.519.1603807052865; 
 Tue, 27 Oct 2020 06:57:32 -0700 (PDT)
Received: from x1w.redhat.com (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id e14sm1103100ejc.15.2020.10.27.06.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 06:57:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/25] block/nvme: Set request_alignment at initialization
Date: Tue, 27 Oct 2020 14:55:41 +0100
Message-Id: <20201027135547.374946-20-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201027135547.374946-1-philmd@redhat.com>
References: <20201027135547.374946-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-block@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
sets the request_alignment in nvme_refresh_limits().
For consistency, also set it during initialization.

Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/nvme.c b/block/nvme.c
index a0871fc2a81..682946ad840 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -759,6 +759,7 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
     s->page_size = MAX(4096, 1 << NVME_CAP_MPSMIN(cap));
     s->doorbell_scale = (4 << NVME_CAP_DSTRD(cap)) / sizeof(uint32_t);
     bs->bl.opt_mem_alignment = s->page_size;
+    bs->bl.request_alignment = s->page_size;
     timeout_ms = MIN(500 * NVME_CAP_TO(cap), 30000);
 
     /* Reset device to get a clean state. */
-- 
2.26.2


