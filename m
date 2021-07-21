Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A193D0C93
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:53:35 +0200 (CEST)
Received: from localhost ([::1]:42448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69r4-0003qY-Vv
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m69an-0003rT-W1
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:36:46 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m69am-00054X-7u
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:36:45 -0400
Received: by mail-wm1-x331.google.com with SMTP id w13so1028306wmc.3
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ho3fTO1JjMDm854ZT9EUi8yQ+mLF/cdErEoN0KdWlk=;
 b=p3xNUTZIPMcScSaRiUAYA+HRD3mHMUY7gKElJkl7hrm7dkg80JjjwKFfsn9wgv2mNO
 aWiQg07N+4t5ZWtlbWIL662Y67DYyde++eEZUSRpt+0Wj8ifVBDrDy5r9R42Z8puFeQl
 4hQdcVu4R7dvnoGdj0YbGMNjj7bqZZHOXjZzUr2dM71QRYHhzfz1tShIBE2cmxRVo4Hd
 cPaZLxc+N0VLxveNHc8Rh00Zem03BLUO4ErhiB6VZwd4ooPdDpscBVC3LQFG/rTm9Osm
 h2cfp6/rnjZgIFy3Fho8tFXCwV7lY8L0LxBFuDX+L0GVFVEroLeQYkB4n9qF6Mu1Yrto
 HeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ho3fTO1JjMDm854ZT9EUi8yQ+mLF/cdErEoN0KdWlk=;
 b=l7Tp9nnI7k+NknZZcbqsbObqbW7WJuexhS1nK2Cxb7+kUs8BvqT5MlZnjWKbSISvjO
 09bU2c8Ek7p1V31HxM0DGT2aH0IcTxCLQ/nzXjsqxXboHbSTAMG66JqwHXYbstyWXn0Q
 RnCW0YkeExHBRrJdpUkiwn73LRgexMGosBKosFSx8wIWJPehQg/O0vAIsSu5bsa5Iqsq
 rsRgnURCTUCzOALF65ERjbztyZKUg3C1WaFE+T4F/pWYpKTYYYrJzhhlT0nKMnTleVG+
 ER80eTINVfH9UxsPYh168ysYjCdDpyMS8qmBd7MNDK9gPQlGlLAyU3SfhsIti1GK2FGT
 KaKg==
X-Gm-Message-State: AOAM533CPeoZOpd8oilgeVKBRN7qdnLXslCKGgycNdhMbXMf3RLblfkY
 ZOILNFwUi5mARpeSPb++IX0QeaXG1ow=
X-Google-Smtp-Source: ABdhPJxUTIG+qpr4g8enkN1OLN3ByWkBhuepaQdhLFt1l4Pgmcs7S1TqbM6CXvKaXgiYlPuVg3ui6g==
X-Received: by 2002:a05:600c:204c:: with SMTP id
 p12mr3288520wmg.167.1626863802454; 
 Wed, 21 Jul 2021 03:36:42 -0700 (PDT)
Received: from localhost.localdomain ([102.47.167.62])
 by smtp.gmail.com with ESMTPSA id s24sm28854019wra.33.2021.07.21.03.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 03:36:42 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: plugins/cache: multicore cache modelling and minor tweaks
Date: Wed, 21 Jul 2021 12:36:06 +0200
Message-Id: <20210721103612.48844-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This series introduce some minor improvements/bug fixes in the cache
plugins and multicore cache modelling.

Multi-core cache modelling is handled such that for full-system
emulation, a private L1 cache is maintained to each core available to
the system. For multi-threaded userspace emulation, a static number of
cores is maintained for the overall system, and every memory access go
through one of these, even if the number of fired threads is more than
that number.

Also, raising the levels of warnings induced some warnings, this is
fixed in it's own patch.

Patches that still need review (other patches are already queued):
    1. plugins/cache: Supported multicore cache modelling
    2. docs/devel/tcg-plugins: added cores arg to cache plugin

v1 -> v2:
    1. Dropped the patch with mitigating the use-after-free bug since
    it's not needed anymore (fixed by Alex Bennée here)
    2. Summed cache performance data as a post-processing step.
    3. Refactored appending core data to it's own function

Mahmoud Mandour (5):
  plugins/cache: Fixed a bug with destroying FIFO metadata
  plugins/cache: limited the scope of a mutex lock
  plugins/cache: Supported multicore cache modelling
  docs/devel/tcg-plugins: added cores arg to cache plugin
  plugins/cache: Fixed "function decl. is not a prototype" warnings

 contrib/plugins/cache.c    | 165 ++++++++++++++++++++++++++++---------
 docs/devel/tcg-plugins.rst |  13 +--
 2 files changed, 132 insertions(+), 46 deletions(-)

-- 
2.25.1


