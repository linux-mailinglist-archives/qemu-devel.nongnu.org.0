Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB0630786B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:44:32 +0100 (CET)
Received: from localhost ([::1]:50598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58X9-00037v-Ip
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:44:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58UH-00008w-Ca
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:41:33 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:46957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58UF-0007Ct-Uj
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:41:33 -0500
Received: by mail-ed1-x52d.google.com with SMTP id dj23so6835865edb.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GpdUpn5Mm3vSAENjKj90/XRZPLUp/KCHv6H1AH3H9zk=;
 b=gINvWmTdPq0CzKshGkAh8DGmK0rTCMVmThk8oZ5ctnFmIs6SGI6SuQnT+jzoVX+ZVf
 SIQHY4EfiYiDRcIGh+NPyr7d+wApeeI0ePdKGm7w9tJlE4G4+jTW2wYbOrEiWYbf18Z2
 GZ8xJynTv1OMqSCrOmUOtwqdSvi6umBjp5q2CdlXhPlOzBP+l79NJZitIVe3rtPfYzX7
 tCntFUCXmeJQjbHJLL83u5AgeBaKAyJDbHRjcwm9djwsaoHywPcFEi+TAHMOJ4ymlJiC
 RUC3eqrBRqbrWxjEmMd+EqvjpXrFP+O9EvWfvrWsi07/oRO1woOJzUEszYJGXDiZAq+d
 L4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GpdUpn5Mm3vSAENjKj90/XRZPLUp/KCHv6H1AH3H9zk=;
 b=Qu4Z22FVr1EsXK+qPvUcjDthu1637OlsOZCV0PWjopzsaYGdjp9IJ7aZ8leTm3fEQB
 fpJP75Ailjv/b9/XTnomkpyowvJEZrPPQN6VM5MFbUvimBeCBkNrKLyjHtkiq7dGB1ea
 FIrw5JxAZ4lMKcXukt5HjlN+33Lw224nqrhsArcR4J3Iqm0PnajSv9j3Se+/eaMnQ/KD
 nhAw3kyYtKsbQ40eLDUrKcEnBdoyNWl4jhSasIpxB0BGN+W9FcGM1RtQaAA09qL+BqS8
 Acib14CMSeUmq9XKmxkbEr/s3Ot/3+1fzGsWCOs06GiOaLBJRfFRAfyX79V0Fjn3FR+3
 2zXA==
X-Gm-Message-State: AOAM533zpZFbj8FB6lmVKcE3S3IeeG58ytglcUdQhP0kZ3aF8ct8jT+2
 U4nnDOPPSg2TSUX6O61rLn1Jv8f3BW8=
X-Google-Smtp-Source: ABdhPJyevnFw2SVMuYQ9/bWaJoa3XNbDpJA6djK4Z+HJRg42f0yC9MYjCAYf2A34eO7D2CLiJyY3YQ==
X-Received: by 2002:a50:bc15:: with SMTP id j21mr14265640edh.187.1611844887762; 
 Thu, 28 Jan 2021 06:41:27 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id o11sm3084710eds.19.2021.01.28.06.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:41:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/13] target/mips: Replace integer by MMUAccessType enum when
 possible
Date: Thu, 28 Jan 2021 15:41:12 +0100
Message-Id: <20210128144125.3696119-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Taking notes while reviewing commit 671a0a1265a=0D
("use MMUAccessType instead of int in mmu_translate").=0D
=0D
Philippe Mathieu-Daud=C3=A9 (13):=0D
  target/mips: Remove access_type argument from map_address() handler=0D
  target/mips: Remove access_type argument from get_seg_physical_address=0D
  target/mips: Remove access_type arg from get_segctl_physical_address()=0D
  target/mips: Remove access_type argument from get_physical_address()=0D
  target/mips: Remove unused MMU definitions=0D
  target/mips: Replace magic value by MMU_DATA_LOAD definition=0D
  target/mips: Let page_table_walk_refill() take MMUAccessType argument=0D
  target/mips: Let do_translate_address() take MMUAccessType argument=0D
  target/mips: Let cpu_mips_translate_address() take MMUAccessType arg=0D
  target/mips: Let raise_mmu_exception() take MMUAccessType argument=0D
  target/mips: Let get_physical_address() take MMUAccessType argument=0D
  target/mips: Let get_seg*_physical_address() take MMUAccessType arg=0D
  target/mips: Let CPUMIPSTLBContext::map_address() take MMUAccessType=0D
=0D
 target/mips/cpu.h        | 16 ---------=0D
 target/mips/internal.h   | 10 +++---=0D
 target/mips/op_helper.c  |  9 ++---=0D
 target/mips/tlb_helper.c | 78 +++++++++++++++++++---------------------=0D
 4 files changed, 47 insertions(+), 66 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

