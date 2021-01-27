Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B743067C2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 00:23:36 +0100 (CET)
Received: from localhost ([::1]:50778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4u9u-0001iz-R8
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 18:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4u8L-0000iR-NY
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:21:57 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4u8K-0006ED-0a
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:21:57 -0500
Received: by mail-wr1-x435.google.com with SMTP id q7so3598820wre.13
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 15:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PpMYgpAIHgDlVuIZnvox74Phhx4eyrGL6Q2LF+UkTo4=;
 b=CiJoSwWxyIN8HP3xWF/t6za2IR8YU2MNQiEhpg1/1JwGML2ecleZ3gynRcSazv4h3o
 kZ0DMfuislsN16uDI2kcjHeTzoSBIggX7LTzW6agdI/m9hMskUQMN37GVYC/lGGlHL9w
 eobbgp2WHB6aiIX3GZAAtvPmXBrrVlGYvILJjdTG4rwoLXUrOuGD3hfdkxXTyarPcl09
 SJLnMgUJIjS5/IDQbwbzjDZ8M7HatmcRXcRqKUE4Onrv390vSwJplC2UoZRg7lOO3mNl
 DKgI+VF3bGp+u+9Lu34s9n+jCn6niZw4S32RWYh51n1MempoVXKbYq5xNQMoXcLKXG4J
 qslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PpMYgpAIHgDlVuIZnvox74Phhx4eyrGL6Q2LF+UkTo4=;
 b=EiC/cm8XAJoTjkUSzbdn+wBMDz76SNHLeZrlaLj8NXqRqCZ3P0z2+1j4mMU9KUM+24
 GFoBg8F+pxMSgT/6xtU0RSprVsseaK5meg8OSA1E/1stIr22m/oltoV2JvDqCMBifR29
 SGWtV9Y4LemUPfBypnNkAAvY3DadEyOkEuHWagfq5AWYfPkPU8/DmSQhCryrYanqMOAV
 x27jtsHFXEY1+/BO9lb3apQOgreuvyUvoStjNFIagtPpvfbO+COBEFq7/LgKLHPxy7qF
 Rlliu0aYUEwZGi6SYUovOweQjvmpzr48Qp3ywkrRV4mRAdwLrbqOYij2uTt1nI7Vzto7
 Ialw==
X-Gm-Message-State: AOAM530r+7CGSgZ9EkjjVO+Zcd9NRVijEP7Nmc7QDj38ARa0bVeXprsF
 KRo9afR0vjFsPTfCCTcoqMbK2eba61Q=
X-Google-Smtp-Source: ABdhPJwfm5TWEAZ/1P0ddOqmSr6MUjoGti3+qqpNVbFwjP9kuIdxxHkzXS3GOMRJvl3rRfzyP0qzEg==
X-Received: by 2002:adf:8b41:: with SMTP id v1mr13256240wra.282.1611789714107; 
 Wed, 27 Jan 2021 15:21:54 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g1sm4659019wrq.30.2021.01.27.15.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 15:21:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] target/sh4: Pass MMUAccessType to get_physical_address()
Date: Thu, 28 Jan 2021 00:21:46 +0100
Message-Id: <20210127232151.3523581-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joe Komlodi <komlodi@xilinx.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Taking notes while reviewing commit 671a0a1265a=0D
("use MMUAccessType instead of int in mmu_translate").=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  target/sh4: Fix code style for checkpatch.pl=0D
  target/sh4: Replace magic value by MMUAccessType definitions=0D
  target/sh4: Pass mmu_idx to get_physical_address()=0D
  target/sh4: Let get_physical_address() use MMUAccessType access_type=0D
  target/sh4: Remove unused definitions=0D
=0D
 target/sh4/cpu.h    | 11 -----=0D
 target/sh4/helper.c | 99 ++++++++++++++++++++++-----------------------=0D
 2 files changed, 49 insertions(+), 61 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

