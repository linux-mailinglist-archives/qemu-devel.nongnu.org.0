Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CF54B0752
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 08:36:50 +0100 (CET)
Received: from localhost ([::1]:36394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI40W-0003C8-UO
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 02:36:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nI3Ky-0005YC-RV; Thu, 10 Feb 2022 01:53:52 -0500
Received: from [2607:f8b0:4864:20::435] (port=37503
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nI3Kw-00048v-SW; Thu, 10 Feb 2022 01:53:52 -0500
Received: by mail-pf1-x435.google.com with SMTP id y5so8596813pfe.4;
 Wed, 09 Feb 2022 22:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nJ8/Op0gSGtwLjijGZrlTLvbrN1+s/DE0X2WZtKXQeA=;
 b=fuNb8mqj9CeqzfZVtoqQMmanB8BM5RJGqnO8tZQmqLaYyc9CLIJHgdAFmrobbksIRK
 FwJwiHw5oEwqjTlkIPsSdctupUhigVhItkrwUIqGLiNwGaTBWVnPnIdVXv3GxRT1HBFh
 /9c5I1bLS/+XguWcuP88z06f6vkye5ogbYajjiTKtuOlj2ByYVy7eely6qL9nTmloNCu
 om8o13YQmpJscyqTz0Tn9y0VFC4uZXMApEmZcDTsi+gsr2QuVxJOcEgrTi1QKl1m5Qls
 tliPQzWPnA7C2WXCDKMcEJ6p8kSgqrAA007SxgyRmpDg/uXAevGB0O97Pjowby0lBjKd
 z3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nJ8/Op0gSGtwLjijGZrlTLvbrN1+s/DE0X2WZtKXQeA=;
 b=F7xwp+dPgBhxY0e2NAlqiJRHZ5yDE4CWVnlgneTmZQD2IQT2V11BSCttwb6WVhAQ4M
 CMhHLZS6t28DgLPYL4ax+Rptz/QuaQzUFMYZN5Seohs2porqOubwsTdBV9+S/fkCvpTf
 Do/QPTBi1KNhF3FQ9tQitL+5Joi8KpQ4q+yIwHmabTuc59faGTHUbhSlpY+EJTSudGFG
 6J0fVHI9Swxii9oYEvxQ25zAFVuV/Mf5XuchBT9azyHKW8f+zoIz1WlhY4UQLSSfSAFD
 2pg3cxmcfxuA7uJuaF4iySwCS8UGBIspQ515BZQrCbdomJeIfRPt+uSD+PfFBAa8J/zV
 00Rg==
X-Gm-Message-State: AOAM5315DkeAl7v3f2v4EQiDG+BDEwwST9Ng6GY6B9mGmv9cceQ0Y9Ky
 0U4jWUWRRPTfFM4nGEsJimIojcOW8j0=
X-Google-Smtp-Source: ABdhPJyf2ghLNGRKI33kG7ZQWmzFR03OlrzFAO75aKqh7xYE6eClVgvandy5bdgQdazCnzcvo3QldQ==
X-Received: by 2002:a63:d952:: with SMTP id e18mr5012357pgj.290.1644476028335; 
 Wed, 09 Feb 2022 22:53:48 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (121-44-67-214.tpgi.com.au. [121.44.67.214])
 by smtp.gmail.com with ESMTPSA id mw14sm1147729pjb.6.2022.02.09.22.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 22:53:48 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [RFC PATCH 0/3] spapr: nested-hv support for TCG
Date: Thu, 10 Feb 2022 16:53:37 +1000
Message-Id: <20220210065340.1276367-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here's a little thing I've been hacking on. I was pretty amazed I
could even get it working, let alone being so small and not too
horrible to look at. A few people thought it would be useful for
prototyping and hacking and running kvm tests, etc. So, thoughts
on the overall idea and code structure?

There's possibly a few layering violations there with me short-cutting
and not calling vhc method for checking cpu in nested at least, and a
bit of cleanup and few loose ends, but hopefully nothing fundamentally
terrible.

It works and boots an L2 into a distro with unmodified Linux kernels
running in the L1 and L2.

Thanks,
Nick

Nicholas Piggin (3):
  target/ppc: raise HV interrupts for partition table entry problems
  spapr: prevent hdec timer being set up under virtual hypervisor
  spapr: implement nested-hv support for the TCG virtual hypervisor

 hw/ppc/ppc.c               |  22 ++-
 hw/ppc/spapr.c             |  16 ++
 hw/ppc/spapr_caps.c        |   5 +-
 hw/ppc/spapr_cpu_core.c    |   6 +-
 hw/ppc/spapr_hcall.c       | 316 +++++++++++++++++++++++++++++++++++++
 include/hw/ppc/ppc.h       |   3 +
 include/hw/ppc/spapr.h     |  75 ++++++++-
 target/ppc/cpu.h           |   6 +
 target/ppc/excp_helper.c   |  60 ++++---
 target/ppc/helper_regs.c   |   1 +
 target/ppc/mmu-book3s-v3.c |  20 ++-
 target/ppc/mmu-radix64.c   |  19 +--
 12 files changed, 505 insertions(+), 44 deletions(-)

-- 
2.23.0


