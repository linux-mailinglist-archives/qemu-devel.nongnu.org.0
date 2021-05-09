Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08B7377745
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:20:36 +0200 (CEST)
Received: from localhost ([::1]:60722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflER-0003tw-Vx
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAQ-0004pI-RE
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:16:26 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAO-00059I-4D
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:16:25 -0400
Received: by mail-wr1-x42a.google.com with SMTP id m9so14007685wrx.3
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 08:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9VKuZwafanQqrtFm6FwQ+3g66XzasekXG2x74ECo+EY=;
 b=bA+aU5Zaeeole9RUyuPN3EfvwAvWznxSaPJRd6G5teM8wANhWoNDGdrntzg97ya6c3
 Z9Qw+JzSR2Lg9lA9CZAY28XKpcwriEf7o8/5jbK0wIuwqJabw0z/Rz4PZw2P5hDFeTIp
 SrZVZq/HdD12l7KyEYITdWrdVKxYkhGb3I25Pfg1vEbKVvKaHscnAYIYhygjetnZJrK4
 mfrMYPES4Oyt6M573rVaU+fR0xq7Mc2HVx/vAS2m7qezr+7mZoj9tS2p7IUBDUXMRZe0
 7TcQ1Odj0nbaEckpiem/7PuMvqVZvaIsDMZ7r6lwwrR+hiQoaZVJzsqaJehKWIdSpHN7
 Dd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=9VKuZwafanQqrtFm6FwQ+3g66XzasekXG2x74ECo+EY=;
 b=S/sow5BYCSnLIqXa3EAx2Xxdslez9bd6wa9E0YMq9UngHraKrMGmNqfkJEkFXFysVc
 wdmgjeaQSRi+zYol1Bz+4UJ71Dvo+THUh43weOJPQ1k4HA26oJKipozYmN8Cv6ZsNUD+
 ymasdccOkVikDhHep/YM3HHXI19iROgzysWNaXek9hipvcBUqRWsE4iXVdDwmDbHejNM
 eGIC3n2hXWR1oBY/uI1iton2QuEA5zeXNl3LVsD8Z4LJilY7LcnfSfzTAwJNC2iI92/Z
 7CZlJATgrAuJFO66rFmS42mb3shk+z3VE/Gb9oIchWSShOQTOdhShzNLKXlPf2pQegw8
 c3mg==
X-Gm-Message-State: AOAM531HFLjX4L9iVwRclpVoIjvwe+3tRGKJpXrnoeXzcLG023WnoMWq
 Sxv6ii8VsyvAnqcPAKT8Kgbdyw/kzCjpN6WO
X-Google-Smtp-Source: ABdhPJxLInCtACrE3aewa2ufLOPcV0AhgtS1cQKUk2boAeSQFyhRPukTmleprGgCKtdRGPz8cUsS5w==
X-Received: by 2002:a5d:4cce:: with SMTP id c14mr26396865wrt.29.1620573381078; 
 Sun, 09 May 2021 08:16:21 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id m184sm15568056wme.40.2021.05.09.08.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 08:16:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] accel/tcg: Add tlb_flush interface for a range of pages
Date: Sun,  9 May 2021 17:16:09 +0200
Message-Id: <20210509151618.2331764-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,=0D
=0D
I tried to make sense of the multiple changes in your patch=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg805595.html=0D
by splitting it in multiple trivial changes. At least this way=0D
it is easier to me to follow / review what you did.=0D
=0D
The original patch description was:=0D
=0D
  Add tlb_flush interface for a range of pages.=0D
  Call these tlb_flush_range_by_mmuidx*.=0D
  Rewrite the_flush_page_bits_by_mmuidx* to use the new=0D
  functions, passing in TARGET_PAGE_SIZE for length.=0D
=0D
If you find it useful, fill free to take / respin / reorder this=0D
series, improving descriptions.  Last patch certainly deserves a=0D
better description ;)=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Richard Henderson (9):=0D
  accel/tcg: Replace g_new() + memcpy() by g_memdup()=0D
  accel/tcg: Pass length argument to tlb_flush_range_locked()=0D
  accel/tlb: Rename TLBFlushPageBitsByMMUIdxData -> TLBFlushRangeData=0D
  accel/tcg: Add tlb_flush_range_by_mmuidx()=0D
  accel/tcg: Add tlb_flush_page_bits_by_mmuidx_all_cpus()=0D
  accel/tlb: Add tlb_flush_range_by_mmuidx_all_cpus_synced()=0D
  accel/tcg: Rename tlb_flush_page_bits -> range]_by_mmuidx_async_0=0D
  accel/tlb: Rename tlb_flush_[page_bits > range]_by_mmuidx_async_[2 >=0D
    1]=0D
  accel/tcg: Remove tlb_flush_page_bits_by_mmuidx_async_1() ???=0D
=0D
 include/exec/exec-all.h |  44 ++++++++=0D
 accel/tcg/cputlb.c      | 231 ++++++++++++++++++++--------------------=0D
 2 files changed, 158 insertions(+), 117 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

