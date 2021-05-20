Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DFF389D01
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 07:17:36 +0200 (CEST)
Received: from localhost ([::1]:38686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljb3v-0004pT-5O
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 01:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljb2I-0003N6-8L; Thu, 20 May 2021 01:15:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:43833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljb2C-0002Tk-EQ; Thu, 20 May 2021 01:15:50 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 z85-20020a1c7e580000b029017a76f3afbaso1888702wmc.2; 
 Wed, 19 May 2021 22:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h/RAkVSLn8EIohFbOqQ/j4BdR4XrgsMKbfL8zmsijSc=;
 b=GWsYF4HTe5I3EMu8+tnw1krFy2b9+vDbeizzcmQ6ClwILILkPkGkXVB3o8z4cC4i6p
 uAvo+U6Dpt8E0Fa4DfBT8KmBGIG8x+eEExRWiXsZ0jNKIR8EW5tszoMqEBrSxkTUwBil
 w/uQbmcgoYlwjrc7sJ6nwc2iGObuuhCvg40/vWn+VqbjLmCAsHbY7l3AH6Qp0/PoPU3U
 XMKREcxLLT7rEqzX4jTdQS7gLtQcMREYQjix5vkdAmx+sGEjkmSzMAQaLIrAG81nsSPy
 58ZgmFglYKLmXuQeSVraa3JpYuldEiSO8e70UBIUXOoMbUw6tQQsg63WyYRVW3pO5wfr
 WfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=h/RAkVSLn8EIohFbOqQ/j4BdR4XrgsMKbfL8zmsijSc=;
 b=qGdhyuj/DbLHZS/NH/A9vdvKNfq7NyvxOiatLKW34FVfyRa4GLw4Z6SdBjB8n7Wt8x
 qmJyx6X/Ph0j67hIuCT2zM6GH2xHtAADNxzfwrOhtV/GPAVPubwgIw6O45vzSyACXReB
 AXLvgt90ilh1F5cq8ekRe19Djx9PgG4Rp/Etin/i1PKxs3vpuRJpFy9FuHyyJEGOuQno
 bU5mTcEjSP02DiKLws2EuBd9+ShNX5CbUQcdqHAP3LgtsonFxVqO/MbXLapGS/HKUE/n
 S2Nt2KvHmu08677C82UzeGlx49V6iRRPgXUkqh8mm4O5VsYY7ipBYFNPQGXEZIgfop2e
 ImeQ==
X-Gm-Message-State: AOAM533lBHhd26TiJ3zWaqrGmcahxFCocBwjpRNxI+c1jB7NMFUAJ8hm
 xctumfbgL0S9fRsAX/BNs2Jw82LeB5h2Ug==
X-Google-Smtp-Source: ABdhPJz8kooIJvTmMJ/rgQq8cOvei0EHKr5eRsT0ZrsItZBRd4iokbpcVP/2kGUtdJGbV66kDnrLeA==
X-Received: by 2002:a7b:ce8d:: with SMTP id q13mr2102692wmj.109.1621487744831; 
 Wed, 19 May 2021 22:15:44 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id j14sm8073313wmj.19.2021.05.19.22.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 22:15:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] exec/memory: Enforce checking MemTxResult values
Date: Thu, 20 May 2021 07:15:39 +0200
Message-Id: <20210520051542.2378774-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various places ignore the MemTxResult indicator of=0D
transaction failed. Fix the easy places.=0D
The rest are the DMA devices, which require deeper=0D
analysis.=0D
=0D
Since v2:=0D
- Dropped "accel/kvm: Let KVM_EXIT_MMIO return error"=0D
- Addressed Peter's review comments=0D
=0D
Since v1:=0D
- Dropped "exec/memory: Emit warning when MemTxResult is ignored"=0D
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg704180.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/arm/boot: Abort if set_kernel_args() fails=0D
  hw/core/loader: Move 'write_rom' trace event earlier=0D
  hw/core/loader: Warn if we fail to load ROM regions at reset=0D
=0D
 hw/arm/boot.c    | 53 ++++++++++++++++++++++++++++++++++++++----------=0D
 hw/core/loader.c | 15 ++++++++++----=0D
 2 files changed, 53 insertions(+), 15 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

