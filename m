Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE9A362187
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 15:57:01 +0200 (CEST)
Received: from localhost ([::1]:59126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXOxw-0008Tj-2T
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 09:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXOwm-0007HI-RY
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 09:55:48 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXOwk-0004vu-To
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 09:55:48 -0400
Received: by mail-wr1-x42d.google.com with SMTP id p6so20079005wrn.9
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 06:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uFJHD3EYYufIxLu1GXNR0BHouTxGLI+iTAat3JRZVXM=;
 b=ozZilGlYCogcpFL1ZSCbvPqFhTgMbWsw6l+xh2hfMGAHg2Bbs5oh6jkAq/MogwZXjI
 YoNK/rhO9DY2LS+cGjw55YCxutSOBFmtJgExp5uEjcH1iI8I6MFYHqx+fZ5Pwr9GY6wc
 NUEJEn5bvcxViVaD7iBjlxLI4SevPLNBU04myWLQVBejoHuhTN9wZvRWvwilQ/toYQ/U
 V5IYgyhXMSkID9LIQSTClXFcDxkGlslToGRMdwAJ6jrzz8TgdT+vNTl9Q9GjIQ6A5eD4
 iKiGW+G9Nctz37ddRmw8gk5z3Ok8/VZbaq7UyGd6i7pJ3OPz7Zilk3oIU70kHR+UkTCZ
 McqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uFJHD3EYYufIxLu1GXNR0BHouTxGLI+iTAat3JRZVXM=;
 b=IXgZGAxp6zdEhMdVKyc1RdUBBU1FBfDn67stisHyF/lUeUKps2p8MopkVr4dXiL6aT
 KsqG0ZpR8REIFUFsPcmC4prBka5IMg63ztobk85Kuz5xoCLrFD+WAYymtffNnzOAP+Hw
 rSLSQgeifzvFRgZFVYq84hjLt1W4/VqM2cL5rAtvY41em0ykTkBHA1NQDESkH0QugEpg
 r/Ss6QoRuWe1G24wf5aKWaejiREPppcwCDA1HUDe5dw53FOXC4SlpZ2Hr8HrySFIR+by
 dSHW9FsAYGAya1FRFX6BuhTOUBSvao8juclNiJ3MofrnBuFdlILjd0ttOIlr8iO4orRO
 /cXw==
X-Gm-Message-State: AOAM532HGiUYM42kwD4tcV+/qKWaGYQBcXZoHiu/07DI8w1hQgc8AF25
 6hBUOkV3elnBDxU/rGGFe6TB3nTr+dX53RAX
X-Google-Smtp-Source: ABdhPJzxdFuG+XkZ94JlG7zO+9J9IqCrBsame1k7tnyKWXS9Ylgg/EyNt/ye8m1hHsoVIRDBQVrGpA==
X-Received: by 2002:adf:9cc1:: with SMTP id h1mr9129630wre.135.1618581345139; 
 Fri, 16 Apr 2021 06:55:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p14sm10686528wrn.49.2021.04.16.06.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 06:55:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0? 0/6] extern "C" overhaul for C++ files
Date: Fri, 16 Apr 2021 14:55:37 +0100
Message-Id: <20210416135543.20382-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; this patchseries is:
 (1) a respin of Paolo's patches, with the review issue Dan
     noticed fixed (ie handle arm-a64.cc too)
 (2) a copy of my "osdep.h: Move system includes to top" patch
 (3) some new patches which try to more comprehensively address
     the extern "C" issue

I've marked this "for-6.0?", but more specifically:
 * I think patches 1 and 2 should go in if we do an rc4
   (and maybe we should do an rc4 given various things that
   have appeared that aren't individually rc4-worthy)
 * patches 3-6 are definitely 6.1 material

We have 2 C++ files in the tree which need to include QEMU
headers: disas/arm-a64.cc and disas/nanomips.cpp. These
include only osdep.h and dis-asm.h, so it is sufficient to
extern-C-ify those two files only.

I'm not wildly enthusiastic about this because it's pretty
invasive (and needs extending if we ever find we need to
include further headers from C++), but it seems to be what
C++ forces upon us...

Patches 1, 2 and 3 have been reviewed (I kept Dan's r-by on
patch 1 since the change to it is just fixing the thing he
noticed). Further review, and opinions on the 6.0-ness, whether
we should do an rc4, etc, appreciated.

thanks
-- PMM

Paolo Bonzini (2):
  osdep: include glib-compat.h before other QEMU headers
  osdep: protect qemu/osdep.h with extern "C"

Peter Maydell (4):
  include/qemu/osdep.h: Move system includes to top
  osdep: Make os-win32.h and os-posix.h handle 'extern "C"' themselves
  include/qemu/bswap.h: Handle being included outside extern "C" block
  include/disas/dis-asm.h: Handle being included outside 'extern "C"'

 include/disas/dis-asm.h   | 12 ++++++++++--
 include/qemu/bswap.h      | 26 ++++++++++++++++++++++----
 include/qemu/compiler.h   |  6 ++++++
 include/qemu/osdep.h      | 34 +++++++++++++++++++++++++++-------
 include/sysemu/os-posix.h |  8 ++++++++
 include/sysemu/os-win32.h |  8 ++++++++
 disas/arm-a64.cc          |  2 --
 disas/nanomips.cpp        |  2 --
 8 files changed, 81 insertions(+), 17 deletions(-)

-- 
2.20.1


