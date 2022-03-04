Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE584CDB23
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:42:03 +0100 (CET)
Received: from localhost ([::1]:47010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBwI-000669-Nr
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:42:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQBEJ-0004AD-IG
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:56:35 -0500
Received: from [2a00:1450:4864:20::42c] (port=34586
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQBEH-0005y3-9S
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:56:35 -0500
Received: by mail-wr1-x42c.google.com with SMTP id j26so3219802wrb.1
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 08:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lW1wVbIgsonE1ioHNdUsJhPCSbGOTohXZ3VIQkAuHIM=;
 b=ALe1vIe2FO/zXsADzWlLcdY/wtiLdSVpOecrq8OmGic1weMeF7lEnUuyyNeucsVKvM
 MtfRAlTYrrdqxKKINXH30Bt++4Avr4DW0BcsSgzcljYWizON6c0zCNTGOtKn3pq9l1VM
 GhfC2memoEfS3Eahm0XOBEXWv5LnCkmd3V5GWgfGSlreV2WbpLTRqmxDCnCiURnbFL6y
 nd55g87adjsaeMEZxipwP4ifoG8yBtIPSkYOfWimZRVbsRoDJgqCQYl6OWcyFQPvnzwv
 UKZm7y4VqZG1etRyUYMhp89p2MEpIMSFE3VGJ/SD0R31fkRXUj9KDmzLki7Bj33Q0m6l
 z10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lW1wVbIgsonE1ioHNdUsJhPCSbGOTohXZ3VIQkAuHIM=;
 b=ukPACd4Oa36L00M2mniQrKi0eqf2JiUTqKMsLwwM0Gh99yzNaKQ1Pqu8ixRLzko7Ln
 ikGRAuLwdvHMkcF+8pW85EWtcJ9ZRix8SEwnrdoRgUMLRLSjVZ10+5bLLQeZXHoN4ml7
 JDjF6g1WpPzTqnxVdto9u7ntr0MUfRG8BObnFt5A5q0w+/xsI9wR5gZP43p7y8JfE5Dx
 n1vhvryqQkDdPGXp9TlLZAy3BaJ7jd3OkNhVz6TUeNiADmVXPR4zEMSdo58YPauGTqHz
 gnfyK/HUTdXJNF1BPmSgSAsXY1r66g2DPvvUCQf0pc6l+4/dyndRt+S8wnbMH72xjNBn
 0AFA==
X-Gm-Message-State: AOAM533CpJa5oBOeydO1ch5nKUkdxH7bWjWWg5O8VtxvyUqCPWrQEYsr
 Xe/ZmnqV2OyhtrADJom+8rYDtw==
X-Google-Smtp-Source: ABdhPJw6eID/4vLkq1bZJ6Iq+Hc7qV64cGNXqIUN2R38QfqprKW2caR+9t6sAgmk2LWeJK+QO333Gg==
X-Received: by 2002:adf:aac6:0:b0:1f0:6848:54a3 with SMTP id
 i6-20020adfaac6000000b001f0684854a3mr3831986wrc.611.1646412990318; 
 Fri, 04 Mar 2022 08:56:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a5d498d000000b001f0587248c4sm4595427wrq.3.2022.03.04.08.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 08:56:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Fix handling of LPAE block descriptors
Date: Fri,  4 Mar 2022 16:56:28 +0000
Message-Id: <20220304165628.2345765-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LPAE descriptors come in three forms:

 * table descriptors, giving the address of the next level page table
 * page descriptors, which occur only at level 3 and describe the
   mapping of one page (which might be 4K, 16K or 64K)
 * block descriptors, which occur at higher page table levels, and
   describe the mapping of huge pages

QEMU's page-table-walk code treats block and page entries
identically, simply ORing in a number of bits from the input virtual
address that depends on the level of the page table that we stopped
at; we depend on the previous masking of descaddr with descaddrmask
to have already cleared out the low bits of the descriptor word.

This is not quite right: the address field in a block descriptor is
smaller, and so there are bits which are valid address bits in a page
descriptor or a table descriptor but which are not supposed to be
part of the address in a block descriptor, and descaddrmask does not
clear them.  We previously mostly got away with this because those
descriptor bits are RES0; however with FEAT_BBM (part of Armv8.4)
block descriptor bit 16 is defined to be the nT bit.  No emulated
QEMU CPU has FEAT_BBM yet, but if the host CPU has it then we might
see it when using KVM or hvf.

Explicitly zero out all the descaddr bits we're about to OR vaddr
bits into.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/790
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 088956eecf0..b5c8caafe84 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11706,11 +11706,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
             indexmask = indexmask_grainsize;
             continue;
         }
-        /* Block entry at level 1 or 2, or page entry at level 3.
+        /*
+         * Block entry at level 1 or 2, or page entry at level 3.
          * These are basically the same thing, although the number
-         * of bits we pull in from the vaddr varies.
+         * of bits we pull in from the vaddr varies. Note that although
+         * descaddrmask masks enough of the low bits of the descriptor
+         * to give a correct page or table address, the address field
+         * in a block descriptor is smaller; so we need to explicitly
+         * clear the lower bits here before ORing in the low vaddr bits.
          */
         page_size = (1ULL << ((stride * (4 - level)) + 3));
+        descaddr &= ~(page_size - 1);
         descaddr |= (address & (page_size - 1));
         /* Extract attributes from the descriptor */
         attrs = extract64(descriptor, 2, 10)
-- 
2.25.1


