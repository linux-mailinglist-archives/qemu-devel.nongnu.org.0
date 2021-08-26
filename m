Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F54B3F8D1B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:34:25 +0200 (CEST)
Received: from localhost ([::1]:47344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJGi-0000UG-EB
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImw-0005yb-9C
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:38 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImu-000050-FR
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:37 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso7371039wmg.4
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vsjf44r81JJtO2ZQ/K/wAzsmQJ0pJW4BjlfezsZEjlk=;
 b=VVcMlAj3Ja4edCc2S7Blhl78LUgNcPDdtCTksMPQqzHwR7tEVrCTs3YczhnEoFDUwa
 NANSgsFcZFeov8uh/Hm+qhm3xyNVKx/Ues9CHXyNeDahfhfKnriDxgvIg2ql3m8RIOAx
 +oS3ieLeYtpyBxTgTpTUvD/anLl0f9SVfPGAlqwB8MW4LZmSJjQj4FKSMxs6XutOgvJP
 3bBqhOfWOzoZumfAeIKtHepto+vjEHMJqNeOqc4wzpi7/dmbG7XGL/VjZwbB/c1w0Usr
 4wsSknyRG+8R0frs59cZzAy+1bAX5v5i4GNJXfnykj/xOlWWctvjpY2+Z3DFwya2/WnF
 v3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vsjf44r81JJtO2ZQ/K/wAzsmQJ0pJW4BjlfezsZEjlk=;
 b=p5TYTFxLaT2PCG+G+cMJ/PiMAbzxDhtgMTg6eHO4itv1gqwdRL/YkzMunE+to8/csf
 WkojUsW+cmm7Q/ntIWXmNQ1k/5kQ2aQf2I1SYZoOBMH1s7Cz9TgplVdZYJlAEb8Mkxpz
 Vw87ui1QpthCJYrkftIDivZJQcYwwjN7j2s5LveNjpPo0/l73Q+rKLizG1FHdy5EEo0S
 S/h4CIOhWT03MnxxDemgJqeo4IxL5NN65joNGEQO2I5q/0kWD5k4abXhvn3uh6H8ZZie
 bSR1ZmvqbXQDsyPd94dDYWsu5SrzP4dvsG4DLlug08anNOK5VzHlna+P0IQPrdNkZepr
 8y9A==
X-Gm-Message-State: AOAM533RnkOfgwvsDL23rnWwUWBEdtXjiLOdXs3a1mqywSz/5kmnW5km
 ohWHUtwwwZfgok7yeibvsHb4+zmfX1kHJA==
X-Google-Smtp-Source: ABdhPJwhRPTxoqUtyhPUiGA6vLEvvH1izOMyDRvoViBMkC2cR5VYdKHlj0AbSpzz0keObZ6yFgRT7Q==
X-Received: by 2002:a1c:7506:: with SMTP id o6mr15863476wmc.112.1629997414965; 
 Thu, 26 Aug 2021 10:03:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/37] softmmu/physmem.c: Remove unneeded NULL check in
 qemu_ram_alloc_from_fd()
Date: Thu, 26 Aug 2021 18:02:54 +0100
Message-Id: <20210826170307.27733-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the alignment check added to qemu_ram_alloc_from_fd() in commit
ce317be98db0dfdfa, the condition includes a check that 'mr' is not
NULL.  This check is unnecessary because we can assume that the
caller always passes us a valid MemoryRegion, and indeed later in the
function we assume mr is not NULL when we pass it to file_ram_alloc()
as new_block->mr.  Remove it.

Fixes: Coverity 1459867
Fixes: ce317be98d ("exec: fetch the alignment of Linux devdax pmem character device nodes")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
Message-id: 20210812150624.29139-1-peter.maydell@linaro.org
---
 softmmu/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 2e18947598e..31baf3a8877 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2075,7 +2075,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
     }
 
     file_align = get_file_align(fd);
-    if (file_align > 0 && mr && file_align > mr->align) {
+    if (file_align > 0 && file_align > mr->align) {
         error_setg(errp, "backing store align 0x%" PRIx64
                    " is larger than 'align' option 0x%" PRIx64,
                    file_align, mr->align);
-- 
2.20.1


