Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732632CF6C6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:31:28 +0100 (CET)
Received: from localhost ([::1]:33234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJbr-0005j3-7i
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:31:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klJX5-0002UA-Uu
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:26:32 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:39645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klJX2-0007tJ-VQ
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:26:31 -0500
Received: by mail-ed1-x542.google.com with SMTP id c7so7429430edv.6
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 14:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uwKR7KS8WLPDKQzh9oQMJDJpUOQZpM1XIY1wR/MLSSQ=;
 b=J74Y218SBxd6HFPsckkkwTa4dpLOcpe37zxyUVj7njnaAbGsKXfhBq8vm7s9sZiPqd
 0TeWXu8Qnlxcjb/+AGTkbSiZza2xcHSlHo9LPsz+1J3DSMCjgt3C7nztnsZ1V6ScBB70
 RxSLmROhImJ2nkgYRux4VM9gj0ta5WU49lLxMFRWwj1FJx8BHgj+7OFG2ju5vfCFBafd
 7Dcga6dZ1r2+heggldpIh9tsFSxT9kutC6OF+Ghk96bV37NLnXjCFF0Z0CyWvEiOos2I
 59/GQ7+uZguNg0wmX7lAJbhB5lukGfyUU2LIrMmGskHx+xQdv4+AsWzuJiSFucj5s7fH
 id7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=uwKR7KS8WLPDKQzh9oQMJDJpUOQZpM1XIY1wR/MLSSQ=;
 b=Wb4UdC7cB1+djerVLpJrsCmf+ixINTq7S89tYDKNOoMLixYZpFc+mYiL4FBoLUsqOk
 dEdUqAZX/XQw4bNPrHFQwD6OdPuwUKkIAjVeXqjqfQiqn3NV8IW9kZgU5JRv/TyQhczP
 3rWSKBtaxY15rIclh3qMF07B4pZnW/gPAlANdu5wfcfFei68rr6mHBfwc8/y24Sld7kg
 7GjHUEwzdm3511eCITMwBeJCASuVTuPNbDj4K5MGvZwwJHubZ7e8ORlYxsBejR6GL4/M
 f9jbNR0N9qBKDd83YtuACGjB2hzIBMSVByhbzfJPowHyY0u5XrLqETHmQJHvWel8iHdp
 E8pg==
X-Gm-Message-State: AOAM533AdnlwAsHcN4dHKPIAuBN9gYqYbsok8ST1t7Fg4wZsfHFF90Ly
 CFuAaqeJD0N+tn7LNqazkao=
X-Google-Smtp-Source: ABdhPJy7qRj5lpRt39weatYB+Qf+cAa0u9ivQlq8FVSsskNcmnKKaoRTjSh5GB3eGQV7vJdYPvh9Fw==
X-Received: by 2002:a50:e791:: with SMTP id b17mr9576557edn.388.1607120785221; 
 Fri, 04 Dec 2020 14:26:25 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id g3sm3921763ejr.12.2020.12.04.14.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 14:26:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 0/5] mips: Sanitize Multi-Threading ASE
Date: Fri,  4 Dec 2020 23:26:17 +0100
Message-Id: <20201204222622.2743175-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x542.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewing the MIPS code, ASE after ASE.=0D
Time for MT ASE.=0D
=0D
- Introduce/use ase_mt_available() helper to check=0D
  if MT ASE is present=0D
- Avoid setting MT specific registers if MT ASE is absent=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  target/mips: Remove mips_def_t unused argument from mvp_init()=0D
  target/mips: Introduce ase_mt_available() helper=0D
  target/mips: Do not initialize MT registers if MT ASE absent=0D
  hw/mips/malta: Do not initialize MT registers if MT ASE absent=0D
  hw/mips/malta: Rewrite CP0_MVPConf0 access using deposit()=0D
=0D
 target/mips/cpu.h                |  7 +++++++=0D
 hw/mips/cps.c                    |  3 +--=0D
 hw/mips/malta.c                  | 10 ++++++++--=0D
 target/mips/cp0_helper.c         |  2 +-=0D
 target/mips/cpu.c                |  2 +-=0D
 target/mips/helper.c             |  2 +-=0D
 target/mips/translate.c          |  4 ++--=0D
 target/mips/translate_init.c.inc |  6 +++++-=0D
 8 files changed, 26 insertions(+), 10 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

