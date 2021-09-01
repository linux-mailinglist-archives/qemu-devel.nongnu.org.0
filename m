Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC9E3FDDE6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:41:37 +0200 (CEST)
Received: from localhost ([::1]:40728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLRQn-00008N-0h
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLROY-0006VU-14
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 10:39:18 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLROU-0007GO-Uz
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 10:39:17 -0400
Received: by mail-wr1-x42b.google.com with SMTP id b6so4850623wrh.10
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BpiLSJbcN0PV1g3+TsZ/sqXQEQGbs34oBVTTbry1SrM=;
 b=d16qfOZ89IqUT2JiMYHDUIsM2mBzXwLhTVcHTM3JlS1OOxE5PsWb2fqHqTVX52m2iV
 HeL+s21Qd4nqsJDTdCMHTEUWpWWbDB6LbChCYm0zDXxfxKOR9PQog2rMIKy5vrZsdqCC
 pUTtb85gdhAXvGg+E8HB/1vTbIxDE65A53YdulZSWPkJbtoIO80fum83ifrRI+BO2qGO
 ZGSHGwlci/Rw5k4UnSDp77uAj4XKAP8RRAOBU4y1cMoTbN1nLnnTHBAT08BebsPWD6lk
 A/ynZo3t7XOWVIyEfbZ55cbEw95hpu3QES7AWANrDxR8D59WOVTbMNTQOeHLEh6OPwrg
 fjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BpiLSJbcN0PV1g3+TsZ/sqXQEQGbs34oBVTTbry1SrM=;
 b=aqCmTUOSbBeW+hvdjO9sPfIpGS6/ZBEG2s5WY/AbTrNJ186p60X1ha6iNVQ3IoUTL6
 OeL4pR7lRQfZWKv2pTjLPJOmJ6pyOHEY/xW7YJdGj24O7+RezuhXX65iWJtPkU9jJB3E
 qEghtwqORDjVOhVc1Y71kIfx7L5E4IC1L8/dLvdaOpaTV5rL1kIPGKhmiZN6k0TkdT1B
 9C74ppvnLAApvkKV6L2oKlyBBUEz5jLq+5jr73sxSiLWnVsoSyUcWGHnRSVBBX1+dkkd
 zQdeSpEdcj2wAAiwboiCcYLKPZ7e4Cg0noJkbuXXkeKIMVVcTdVCfF2qMnhtj0DVrmyd
 cIag==
X-Gm-Message-State: AOAM530NPO5XDOkD/nDNDw+4+rPawW2zopf3FPLcKDvNy3vMdsm9cYiD
 k+xTlAM3il8mNOwcc8bqKnvMtvVago1AEA==
X-Google-Smtp-Source: ABdhPJwG5YEXSBXbNK7x9TIbJTci05SI3WfAY3yrzC2NAuWYFmxizJJGKzGQ4e6WfV6/9ATaWqXQlQ==
X-Received: by 2002:adf:8169:: with SMTP id 96mr38559335wrm.207.1630507153502; 
 Wed, 01 Sep 2021 07:39:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r10sm16907461wrc.85.2021.09.01.07.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 07:39:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] elf2dmp: Fail cleanly if PDB file specifies zero
 block_size
Date: Wed,  1 Sep 2021 15:39:10 +0100
Message-Id: <20210901143910.17112-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901143910.17112-1-peter.maydell@linaro.org>
References: <20210901143910.17112-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity points out that if the PDB file we're trying to read
has a header specifying a block_size of zero then we will
end up trying to divide by zero in pdb_ds_read_file().
Check for this and fail cleanly instead.

Fixes: Coverity CID 1458869
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 contrib/elf2dmp/pdb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/contrib/elf2dmp/pdb.c b/contrib/elf2dmp/pdb.c
index b3a65470680..adcfa7e154c 100644
--- a/contrib/elf2dmp/pdb.c
+++ b/contrib/elf2dmp/pdb.c
@@ -215,6 +215,10 @@ out_symbols:
 
 static int pdb_reader_ds_init(struct pdb_reader *r, PDB_DS_HEADER *hdr)
 {
+    if (hdr->block_size == 0) {
+        return 1;
+    }
+
     memset(r->file_used, 0, sizeof(r->file_used));
     r->ds.header = hdr;
     r->ds.toc = pdb_ds_read(hdr, (uint32_t *)((uint8_t *)hdr +
-- 
2.20.1


