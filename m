Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605691FB502
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 16:52:07 +0200 (CEST)
Received: from localhost ([::1]:48408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlCwY-0005AK-F3
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 10:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCQr-0003vG-Va; Tue, 16 Jun 2020 10:19:22 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCQq-00070V-Da; Tue, 16 Jun 2020 10:19:21 -0400
Received: by mail-ot1-x343.google.com with SMTP id t6so16023672otk.9;
 Tue, 16 Jun 2020 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rOQwJDphmhaIdRqWIt/ysSZEwiemdpwpObYdcb/nTmA=;
 b=stoZDnAFLyaVidRBFf2vh7DppTmcd++JgdNyKYUO4mPu1j4IF8owJSWXYIEHQHvvdb
 lo2jFmPP9F9VLVt+lO0+5W8zdRWFB74hiFXbzgQHPmJYG02BCzxxYjBD3B9nFL6rrrHk
 gNXNhW10ZRSGPzm0QFxFRzLIlQXqR73xqZhsP8lApUuGwFD9MjDeid5uzoseO8UztJe4
 1C93sDQG5QMPB+Ve+jj2W8ny0/gyHz1mreBJ5Z/ZF7WuA+/lebHxi7vTqLhV/jNKNmq8
 /zR6oVPewxB0V6+Dm5klaoY2RZwk2DHdCPsMyYPvRpNhA/aS+mbeUluIWDMAWkfOqA9F
 JLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=rOQwJDphmhaIdRqWIt/ysSZEwiemdpwpObYdcb/nTmA=;
 b=gVCnh06poEHutEU8H/1ytJeQ32300LsJtKwaSltNiEFeM7kyBdnOAfflWefALnWfsK
 RmJQim+8vJvAyx3J/+Eofi2cfWkgEBgymnj32X2ctaozD2USKJgOtJ6EC2t8UdbFYu9M
 2po6fngdsPVW08c8pFRoYpLX/gNC062Ox7nRmVLR8yrYTKff6gxEeYBKe5A8y2dkYvjJ
 YH2zrR1Yffu8o3cQv/KOdXZqHmKbG8nZegFTyNxhPAdyYNf6jkSnGJLYs3pjjCpha55p
 NnAZ3IUc6y0L+uNi/bBq4R0wiZTXW3kiXf9q/qumMYPFW+6XD7enf8SlkOiPBOkBfspr
 e0Iw==
X-Gm-Message-State: AOAM53047jDZPneaTxoLScTI2XQOm0tTWQAmiXAEOMYw10PWivQNDhzi
 vCctm1IbAJFafPwfDULWcYpmEdTj
X-Google-Smtp-Source: ABdhPJyjelM3INjEh+QQFzGR+0E4oJVYWFcWU40a0eR31cJi24RVIw8XthAWTcMe8jERqp5YlmOAsA==
X-Received: by 2002:a9d:554d:: with SMTP id h13mr2342117oti.201.1592317157109; 
 Tue, 16 Jun 2020 07:19:17 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id c10sm4120781ooq.30.2020.06.16.07.19.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:19:15 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 63/78] hw/i386/amd_iommu.c: Fix corruption of log events
 passed to guest
Date: Tue, 16 Jun 2020 09:15:32 -0500
Message-Id: <20200616141547.24664-64-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=flukshun@gmail.com; helo=mail-ot1-x343.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In the function amdvi_log_event(), we write an event log buffer
entry into guest ram, whose contents are passed to the function
via the "uint64_t *evt" argument. Unfortunately, a spurious
'&' in the call to dma_memory_write() meant that instead of
writing the event to the guest we would write the literal value
of the pointer, plus whatever was in the following 8 bytes
on the stack. This error was spotted by Coverity.

Fix the bug by removing the '&'.

Fixes: CID 1421945
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20200326105349.24588-1-peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 32a2d6b1f6b4405f0fc20c031e61d5d48e3d9cd1)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 hw/i386/amd_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index d55dbf07fc..ac5f2fddc5 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -181,7 +181,7 @@ static void amdvi_log_event(AMDVIState *s, uint64_t *evt)
     }
 
     if (dma_memory_write(&address_space_memory, s->evtlog + s->evtlog_tail,
-        &evt, AMDVI_EVENT_LEN)) {
+                         evt, AMDVI_EVENT_LEN)) {
         trace_amdvi_evntlog_fail(s->evtlog, s->evtlog_tail);
     }
 
-- 
2.17.1


