Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D46480566
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 01:55:35 +0100 (CET)
Received: from localhost ([::1]:56372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n20m4-0001UT-TW
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 19:55:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1n20kG-0007vH-8G
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 19:53:40 -0500
Received: from [2607:f8b0:4864:20::434] (port=44858
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1n20kE-0002qC-Fh
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 19:53:39 -0500
Received: by mail-pf1-x434.google.com with SMTP id t187so1291457pfb.11
 for <qemu-devel@nongnu.org>; Mon, 27 Dec 2021 16:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9pNhO47/chTtN7Y6oLe83YSgjAjrTEE1HfRynfLZ5OQ=;
 b=fX5mpFxkL0deruFupsUIh8bK0Ken0qBC/T1+FpnQCzKh4DhF9/USL1IRWcbo1CNxYq
 3r6lAN5amsUoAqGZgmvfhEsoTvKnP4CfBfNT2wVXluU2QuDRjDN0TpiFnevxtdcm00V7
 uYL0JxuVeUOA1BGbE1WWvOysNIzXnnBmZwg9ZTX0Gk1zCU/A56r1FuodZglko4Nq1R3f
 S2puRIzxhQ+XbeU22ibi0LTp0Y5x2r6LaUO4ShaHB0VsDhyJSpRYjCCi1bnp8SQMh3LS
 63orveZ7MWGmaIEKdX6ntACWDHy8FdhSDhelaPMMI5DckG7npUOVMFaEsAlewbsjiIwL
 C39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9pNhO47/chTtN7Y6oLe83YSgjAjrTEE1HfRynfLZ5OQ=;
 b=BqqHe9nG0qdUe67ARQh9QafoVFAsxPB9RTn1kXD9Sgu9t9BT7fJqb3UeMKmUO3vZ6d
 t5CLVWTiHUXBh4hGw3qOyF/v61uk9F2O+u3XgUQ42Gn9g58nkdJIIUc3ERftOplKyrjD
 SySf522v7irffsoeAUiPD85WE8m7sHyEhof9ce9au+z6+E63GVQN2pJgpcPzwkuKAJzG
 35dJ4QgGW5v0AEXKb/Xl6YBxZHXSYGbfkOZpvi6ROJqFq0dUJmRd/vjnssfslNJFk1Wy
 8CivkHJKf4mpdl4f3n7SCLOl2MovSTkyryvWIueDdY7KodhgBAZplA34hnRJijJD995y
 3NjQ==
X-Gm-Message-State: AOAM530qO7CgSeXDTI8KygPsiN2CnQhiMa4KBsGqE9xHpPslOt9q5nkP
 PoDzMyXCWahUZhNsjf0z/CNkHA==
X-Google-Smtp-Source: ABdhPJxhmjDpp9revYSQZ4BKXScXoIHj/8fFgB6/KmNxyEg/KcZCAtRovlKyIKA8AenAWwyxM03v+g==
X-Received: by 2002:a63:1c1d:: with SMTP id c29mr17679385pgc.89.1640652816620; 
 Mon, 27 Dec 2021 16:53:36 -0800 (PST)
Received: from localhost.localdomain (1-169-192-165.dynamic-ip.hinet.net.
 [1.169.192.165])
 by smtp.gmail.com with ESMTPSA id t27sm19266587pfg.41.2021.12.27.16.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 16:53:36 -0800 (PST)
From: Jim Shu <jim.shu@sifive.com>
To: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 frank.chang@sifive.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/2] Align SiFive PDMA behavior to real hardware
Date: Tue, 28 Dec 2021 08:52:34 +0800
Message-Id: <20211228005236.415583-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jim Shu <jim.shu@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

HiFive Unmatched PDMA supports high/low 32-bit access of 64-bit
register, but QEMU emulation support low part access now. Enhance QEMU
emulation to support high 32-bit access. 

Also, permit 4/8-byte valid access in PDMA as we have verified 32/64-bit
accesses of PDMA registers are supported.

Jim Shu (2):
  hw/dma: sifive_pdma: support high 32-bit access of 64-bit register
  hw/dma: sifive_pdma: permit 4/8-byte access size of PDMA registers

 hw/dma/sifive_pdma.c | 178 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 156 insertions(+), 22 deletions(-)

-- 
2.25.1


