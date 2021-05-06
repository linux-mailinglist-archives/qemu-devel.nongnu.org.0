Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65485375505
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:44:42 +0200 (CEST)
Received: from localhost ([::1]:41162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeIz-0007DE-Fh
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeCq-00077S-BZ
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeCo-0007lV-Lo
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620308297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtnD1U4zAjjBX9oA9uBgg0xbiA9djz1nnWZVPwnN9No=;
 b=FCTTW9r298Zd1wevlxcFi5fozFOlgBMux3+1mbxM4ET4OCScukRNbCGgqckgNef+/QR+KQ
 +/kAwXSy/8DTtxM7bXyq+jpkPZUr2hMx6hSCNfk6O7OM4abQp4YmcFJKG1m67k6B4g1h8o
 Z9FcquKUJ1/Imw3ZmCyEREgoI16xsZQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-I03JzSPXOSWNC_1D7-p9nQ-1; Thu, 06 May 2021 09:38:16 -0400
X-MC-Unique: I03JzSPXOSWNC_1D7-p9nQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so2191627wre.22
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 06:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtnD1U4zAjjBX9oA9uBgg0xbiA9djz1nnWZVPwnN9No=;
 b=MnKAbSBbvnr9O6OWh/CFSMRzU8v4+ZpAutXtDag8YeD5llN6PZIBfAGpVbYoBetbGp
 2Fw765+77UBMKmksd3bSxDkJsXNK7G9bMff57cEIOTY1Q6MeX0ctWCG3Al27y26SLou+
 lBeRz8hr8dOmmnB0IZJRrWrw09nvhl9mYGFYkj4Xv6DUMcz0sxc8+o8JA+RsxHgCYu+L
 dttEn/ZZ/AObO0kO8dubfGisaEqEmZFOXZSIG0bk55DVE+z128xQ3XihACF1F0ry801A
 HExQpz7eNDd7+OpOZGPVq10g6hyJ71TCenmcWcs7q07hVjwo/eMFhNjMNVIHlITd2is4
 B2tQ==
X-Gm-Message-State: AOAM532curZWvfdpvlnZA+50QS2UfcTECdlyaVfDxf+syJZPeHu8T/hA
 14rj34lHbFNfPlihhwBx57LdoVIH9M2ez3jKkz1MicATy8+J75EegyRmifCstMfTU/5wioTKqtf
 vGotuPMBNIbpnaBlW/1XH01zdUNb1zy6TUUcjIu6BcXbyMmk/g5h3UsjcV7bMO1Np
X-Received: by 2002:a1c:c28a:: with SMTP id
 s132mr15033753wmf.145.1620308295127; 
 Thu, 06 May 2021 06:38:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9zr0u80TiOLaMnzP6Zw8/LeB0azlBgPsu0O1udkYDmO7GAIcBjFqIX7hcrVdU+Gtn8cUBtA==
X-Received: by 2002:a1c:c28a:: with SMTP id
 s132mr15033720wmf.145.1620308294899; 
 Thu, 06 May 2021 06:38:14 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id o15sm4312755wru.42.2021.05.06.06.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 06:38:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/9] backends/tpm: Replace g_alloca() by g_malloc()
Date: Thu,  6 May 2021 15:37:52 +0200
Message-Id: <20210506133758.1749233-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210506133758.1749233-1-philmd@redhat.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kvm@vger.kernel.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Replace a g_alloca() call by a g_malloc() one, moving the
allocation before the MUTEX guarded block.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 backends/tpm/tpm_emulator.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index e5f1063ab6c..d37a6d563a3 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -124,10 +124,9 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
     CharBackend *dev = &tpm->ctrl_chr;
     uint32_t cmd_no = cpu_to_be32(cmd);
     ssize_t n = sizeof(uint32_t) + msg_len_in;
-    uint8_t *buf = NULL;
+    g_autofree uint8_t *buf = g_malloc(n);
 
     WITH_QEMU_LOCK_GUARD(&tpm->mutex) {
-        buf = g_alloca(n);
         memcpy(buf, &cmd_no, sizeof(cmd_no));
         memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
 
-- 
2.26.3


