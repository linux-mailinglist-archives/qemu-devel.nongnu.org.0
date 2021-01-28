Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1D530715E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:26:35 +0100 (CET)
Received: from localhost ([::1]:33226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52dO-0007Lq-7Y
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52ab-0005dO-KQ
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:42 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52aW-0005aq-Cw
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:39 -0500
Received: by mail-pg1-x535.google.com with SMTP id z21so3807488pgj.4
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cbkcW2ok2YQLEbATCJLPGmECgb56rWFy9WhXjrO1Dbs=;
 b=rql8I8zW25BM87SY/ab5xZJsNDdxGGePSD1pICV86KKuh3Y4tXWlUA3sfixTF3q3ye
 qoWEG/f4nNHy+sChXu8T5x764PBS6liGiGEkCP1VE/WZDrBFpO0U0vYwvKJZwtqOwQFQ
 pX+B/GugvldMr6Uxqr+GW2oToJ2JRq2gmwX69CGybLCqWBRNNtvkHBw18h9zcOR3x+eF
 51t3xPYU8mQkMMu204/1vY04noCFYBYCOjMMkv07076lrI/juYTVGWplKeTP4xPxAxK8
 GFrD20LCCNwcxS1Zyb+253VSHS4Uo2NQwx76Ko9eG5mfPJBXLW6RN457Meos5VkaxPhz
 Jw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cbkcW2ok2YQLEbATCJLPGmECgb56rWFy9WhXjrO1Dbs=;
 b=tSq6GO1E2XOzu/vIUGrafHKcgQrrDidUoixgjymSK3woZO4QB5jRIYXq6rTM5qnMJR
 s1dGmRYKONp0mqscPb2ATw2kYCjDo8KBs9vi2BCBnQ1/KOu0dKU3l5S/Nxu9Mi/IFLD7
 +4NL3Dy1Zb8JFGRWKikuRWuFZ/yal2E+U/X7/VOp0xcmULzQ29XgPHsk5zLq7uLnk2ph
 5cD6ZwEUV9hJDGtGC6vxWtmM4HG/8Mutwe12lbFAJq05Rku3uX19hpNWHoCH13SlT+QQ
 Vemmbg/m1DD5akxRU1u4GQBU2hRwRkUXHpGkdrt+yRtwRiVoCChn6Qhh1vWxG/fg2fEQ
 NkTw==
X-Gm-Message-State: AOAM533NkrW8QDRUAfLlQrZeVkb65ZJA+sZstljAnMVavf/PckQW3XuA
 4l+k3ATH53wPjtXWdcjchhw9DiyYSi2g8UhJ
X-Google-Smtp-Source: ABdhPJzAdAbRxLeBbIzP4usMxj5cAdRW6HFvr1VmeBJhwQfMyTF1nsCegMLqOYflejZNWrtCAV51Dw==
X-Received: by 2002:a65:488d:: with SMTP id n13mr14860919pgs.315.1611822214671; 
 Thu, 28 Jan 2021 00:23:34 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:23:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/23] TCI fixes and cleanups
Date: Wed, 27 Jan 2021 22:23:08 -1000
Message-Id: <20210128082331.196801-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first patch I believe is queued by Paolo, but is not yet
upstream; copied here for convenience.  Then, fill in all of
the TODO blanks in TCI.

The tci_write_reg* functions are redundant with tcg_write_reg.
Just pass in the properly truncated result to begin.  In the
cases of the loads, we've automatically done that with the
type of the indirection.  For all of the other arithmetic,
we don't actually have to do anything -- the value is either
right, or the high bits are undefined.  And in fact will
currently be ignored by the extension on read.


r~


Richard Henderson (21):
  configure: Fix --enable-tcg-interpreter
  tcg: Manage splitwx in tc_ptr_to_region_tree by hand
  exec: Make tci_tb_ptr thread-local
  tcg/tci: Inline tci_write_reg32s into the only caller
  tcg/tci: Inline tci_write_reg8 into its callers
  tcg/tci: Inline tci_write_reg16 into the only caller
  tcg/tci: Inline tci_write_reg32 into all callers
  tcg/tci: Inline tci_write_reg64 into 64-bit callers
  tcg/tci: Merge INDEX_op_ld8u_{i32,i64}
  tcg/tci: Merge INDEX_op_ld8s_{i32,i64}
  tcg/tci: Merge INDEX_op_ld16u_{i32,i64}
  tcg/tci: Merge INDEX_op_ld16s_{i32,i64}
  tcg/tci: Merge INDEX_op_{ld_i32,ld32u_i64}
  tcg/tci: Merge INDEX_op_st8_{i32,i64}
  tcg/tci: Merge INDEX_op_st16_{i32,i64}
  tcg/tci: Move stack bounds check to compile-time
  tcg/tci: Merge INDEX_op_{st_i32,st32_i64}
  tcg/tci: Use g_assert_not_reached
  tcg/tci: Remove dead code for TCG_TARGET_HAS_div2_*
  tcg/tci: Implement 64-bit division
  tcg/tci: Remove TODO as unused

Stefan Weil (2):
  tcg/tci: Implement INDEX_op_ld16s_i32
  tcg/tci: Implement INDEX_op_ld8s_i64

 configure                |   5 +-
 include/exec/exec-all.h  |   2 +-
 tcg/tci/tcg-target.h     |   4 +-
 tcg/tcg-common.c         |   2 +-
 tcg/tcg.c                |  23 +++-
 tcg/tci.c                | 283 +++++++++++++++------------------------
 tcg/tci/tcg-target.c.inc |  41 +++---
 7 files changed, 154 insertions(+), 206 deletions(-)

-- 
2.25.1


