Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A005A4FCE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 17:07:00 +0200 (CEST)
Received: from localhost ([::1]:48114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSgLq-00042B-AZ
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 11:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1oSffs-0003PQ-1x
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 10:23:36 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1oSffq-0000Ak-D6
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 10:23:35 -0400
Received: by mail-pg1-x535.google.com with SMTP id x80so4260972pgx.0
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 07:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc;
 bh=4cG8SuTbT6q2YfhVVJ2iSeJxE967cm1DlXOgq7L4Vh8=;
 b=gJMk/+ir58wBx6Ql6mIvkYomyQeXKrSGBwWS3aNhXpTMqoW2yVcrImz9/F/zUB/cv1
 ngJbruce8ztV4eCjB8Pi970EIc2mO+A/z42Nca/iv93QLU3pJaOOEJxrT3qFhsqMmbO9
 K9CieJIK0Hu3114jaxbF5KskeJwsoNl9bbJmocAAhuxS3yA5f1UXccOaGgSNsZswCBmK
 kjM2Z6FvKzJaVCMYdGnI4Hp5iuO/69muqvy7MZwRrVA8qQ1otFMBIRAzY7ZdZ09ABhTm
 tTNJIHvystHGMUsKZh07Z2cl1YwMy5ovz9/GnDCZx7sfjehi+60a/qNeLxulhzFV2iQS
 aNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc;
 bh=4cG8SuTbT6q2YfhVVJ2iSeJxE967cm1DlXOgq7L4Vh8=;
 b=qLFlMBbtTyLPkDUHCJCd6MjfzdavJYNrNRYLtoDkVPYhwzXu6UESdS0Fxh9nPVVy74
 3QJ6LXyDVavOZ91gHH2BbgAiR4i9S4trXPNkkaePwDvAN8ZH5kL3MITIt9NLzSx45du3
 QFSouDpvvomTBvfmVnhjbcP6PVtGxkK7mWHlcAUPnuYKcynHac3emVRdhvITCBWM+tkw
 9wOwMAMRzAAugPRoljTKUy5kH2n0Fp5rpZ7VX0+psL1f4w6IfvTMsgridubNm3GXDdF1
 m90zFJzGMhL0hyXWWF5sUdkr1qQfc422voLlMrI15KGvC5EDOsHRAJmX8SvAE9vHrp3B
 19Rg==
X-Gm-Message-State: ACgBeo3VK/9rfEj5RaITg+PYrjYTzJmC4Ib0RcCMlU+piwwR77DaR3op
 5GPcNRCVXa5umxOFdMwdyBKc6et2RXlIZA==
X-Google-Smtp-Source: AA6agR4IvjpKs02Mw63yKl4Ev1hK7Vnk2Uuvnfk0zwA7WZ89c7Ir4qPXwMz55sGTwrdljQ7TrhPa9Q==
X-Received: by 2002:a05:6a02:4b:b0:42b:d98a:d85b with SMTP id
 az11-20020a056a02004b00b0042bd98ad85bmr6740358pgb.556.1661783011718; 
 Mon, 29 Aug 2022 07:23:31 -0700 (PDT)
Received: from localhost.localdomain (c-98-35-17-78.hsd1.ca.comcast.net.
 [98.35.17.78]) by smtp.gmail.com with ESMTPSA id
 q9-20020a170902bd8900b0016f035dcd75sm7505507pls.193.2022.08.29.07.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 07:23:30 -0700 (PDT)
From: Ricky Zhou <ricky@rzhou.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 Ricky Zhou <ricky@rzhou.org>
Subject: [PATCH 0/1] target/i386: Raise #GP on unaligned m128 accesses when
 required.
Date: Mon, 29 Aug 2022 07:23:25 -0700
Message-Id: <20220829142326.39562-1-ricky@rzhou.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=ricky.zhou@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 29 Aug 2022 10:59:21 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a change to raise #GP on unaligned m128 loads/stores when
required by the spec. Some notes on this change:

1. I considered making use of the existing support for enforcing memory
   alignment (setting MO_ALIGN_16 in the load/store's MemOp), but
   rejected this approach. There are at least two scenarios where we
   might want to do alignment checks in x86:
   
   a. Loads/stores when the AC flag is enabled (which should raise #AC
      on misalignment)
   b. SSE/AVX instructions which require memory alignment (which raise
      #GP on misalignment)
   
   The MemOp alignment checking mechanism can only handle one of these
   scenarios, since they require different exceptions to be raised. I
   think it make more sense to use the existing memory alignment support
   for implementing (a), since helper_unaligned_{ld,st} is already
   triggers SIGBUS in qemu-user. This is why I ended up implementing (b)
   with a helper.

2. It is often the case that legacy SSE instructions require 16 byte
   alignment of 128-bit memory operands, but AVX versions of the
   instructions do not (e.g. movsldup requires alignment and vmovsldup
   does not). From what I can tell, QEMU currently doesn't appear to
   report AVX support in cpuid, but it still seems to emulate some of
   these instructions if you tell it to execute them. This change
   attempts to distinguish between legacy SSE instructions and AVX
   instructions by by conditioning on !(s->prefix & PREFIX_VEX). Not
   sure this is very future-proof though - for example, it may need to
   be updated if support for EVEX prefixes is added. LMK if there's a
   nicer way to do this.

3. I tested this by running a Linux VM in qemu-system-x86_64 and
   verifying that movaps on an misaligned address triggers a segfault.

Ricky Zhou (1):
  target/i386: Raise #GP on unaligned m128 accesses when required.

 target/i386/helper.h         |  1 +
 target/i386/tcg/mem_helper.c |  8 ++++++++
 target/i386/tcg/translate.c  | 38 +++++++++++++++++++++++++++++++++---
 3 files changed, 44 insertions(+), 3 deletions(-)

-- 
2.37.2


