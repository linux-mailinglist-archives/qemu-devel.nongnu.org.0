Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9EB46FD0A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:52:37 +0100 (CET)
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbds-0003Zo-Hs
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:52:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvann-0005ua-Eb
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:58:47 -0500
Received: from [2607:f8b0:4864:20::631] (port=46690
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanj-0006r5-Va
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:58:47 -0500
Received: by mail-pl1-x631.google.com with SMTP id p18so5721112plf.13
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bMxtMs8KLHg1VrhV6E9tcps8BmAmJv9k6CQYse6I7KA=;
 b=cQp8KCv6lt9kw8ZmSJiW1u8wFS/U3yHMQdPm1RXpWWdZAvY9jESFAx8MafJcSVsZy9
 wtMN4VrcBhyR91bIeX3nsk2ZnyFgCXY5E/Gc66agp+fCfQBzC+JpX/OyYlFzBHIjSki4
 DJseYx//lt1A1z00FbehxjBC6PXJzInyHMgXJyhufRuEKC+EizCVZK12ut+JuN0e2/ri
 GEQ59CRtuz5iruGb8u7YHtI/kW8DMjs4m2b1VeQe6JzozIfThB8DNL6DA90isV1w1E6X
 RWe4yt5WYA4NX5T/0gi/g6esWel59IYO5MCT/R/H30jFzlPWs66c/qlNknhIufhCat+b
 DoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bMxtMs8KLHg1VrhV6E9tcps8BmAmJv9k6CQYse6I7KA=;
 b=SAi0IzK0KDnC9XMjM19PO7vVsxoEh+oPZrYaNUlkottk9cwgyX2ZxbB8oA/uQsyXqO
 ZS0hz7LhGYBVJznXlp1DAjN8muHmbqnFI8P2H/jIOfkgzSjWIenz1mt8To0OUDg7FYOy
 FSgMwHxlH1x1STshBr6WcDXcRGd9j+8RbjvyDQX860A5nNEkgPT0sESh1rwhS0uXSYkF
 3BPG1AZNpth1kPVJ9VGUVoWsoXiTDeaUq4noDGlmZBX2P4sL5LaM/Dbs6DFejFEaQcQB
 8wbhQeGi4HeNmmM6CdkzGK5m5i1+BHIpjIkPnN5pemqrftoZ96DFKN6lE00ft5FwAI31
 JVQQ==
X-Gm-Message-State: AOAM532O6USfTgCUV6fMwwTSKN30qa+WvEUetsAZ805QFVKMN4DnO2sG
 NGbnSzZHI4NHag9l3yjfZIlZXsvGyWVDhv1Z
X-Google-Smtp-Source: ABdhPJwY3x+cN0Dzq8bb/NFYg4Cw8kcMbZNv5yjio1RjZBAqOGUIzORuSA3oKrHjcKQZxjQ1NYgqmg==
X-Received: by 2002:a17:90a:9291:: with SMTP id
 n17mr22184406pjo.219.1639123122662; 
 Thu, 09 Dec 2021 23:58:42 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:42 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 27/77] target/riscv: rvv-1.0: floating-point square-root
 instruction
Date: Fri, 10 Dec 2021 15:56:13 +0800
Message-Id: <20211210075704.23951-28-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7d8441d1f2..92a0e6fe51 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -563,7 +563,7 @@ vfwmsac_vv      111110 . ..... ..... 001 ..... 1010111 @r_vm
 vfwmsac_vf      111110 . ..... ..... 101 ..... 1010111 @r_vm
 vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
-vfsqrt_v        100011 . ..... 00000 001 ..... 1010111 @r2_vm
+vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
 vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
-- 
2.31.1


