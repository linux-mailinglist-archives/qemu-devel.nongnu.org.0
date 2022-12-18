Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB91065043E
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:52:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xoB-0007Ru-EG; Sun, 18 Dec 2022 12:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6xo8-0007Q8-SV
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:50:40 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6xo7-0000KT-6Z
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:50:40 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 n65-20020a17090a2cc700b0021bc5ef7a14so6959078pjd.0
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 09:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IpcrZGdhh1waN/hj3/0G162AA2VI609HuEYrCVPnj6c=;
 b=Emx147kaJZlA48LU+OuSFLYldjMMliZFtv7D/M9jIj5x18Xd903GFveDSNEr2h04JU
 xYypATctfhbqQ6nSSHQXxIM9j6JQn9xppsSYyEgDKpOGYQi2Vaj/TlvzAzoyzbZh9Yae
 nNzJu6eWEJd/LRxQdefM1b2+IQO4E9OkATWZwZkf+EJ9aZbZB7sVtXzCtEmk8/xCVPma
 roVRpRPK+LcL/87ygS68gDLs/otEx5w+NYxW/AGCpYVFAdUmpPQtWrFByq4JdSjZUjlf
 MvGtZZoioIHmP9zu/L8Zd5Z9ayxJSS7/qyUE+XteOaWoEGZr/Q4RWc48M/Z5uDR2QmdV
 SkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IpcrZGdhh1waN/hj3/0G162AA2VI609HuEYrCVPnj6c=;
 b=xeQF6V3kR1WbyoQODtAidoXbiM6E0yBfq8Hz8D3aqu558HHGTn+ltTuJ3cJMWUXJwx
 YXOQgqh9HXNk33i1noKmDSczS7Qph8Ds/f9zELdKRKbLsDYMZfS38GlViQ4xUXmyqoG2
 JI2aqTHfsl6qKcfOAhtaCXybEE5nxWbU6spoEIX+FDeXTXQRLvDCjq0j3mwkbcScfXlU
 IzidwZuYKNUWXbIFV6c2nKnUr3cxvJf36wZrV6X2O//r2FmhrbRM/PhlLikDrhrYShdQ
 NLAxhf2REDmtYOleQsJF+SgSnyEZMtvqlX/kQpvsoZzlQ5rX1XBTuvIGw227RqfIgjra
 E9yA==
X-Gm-Message-State: ANoB5pnfxmMSaKnK3dmh1RyPLJ84anHku/9qh4z5W83yZe1fzsKHQsum
 p6fShRqxqkX00y66fj++M4ZoGd5byU0f0qNV
X-Google-Smtp-Source: AA0mqf7pgylsZQKXfQlnai8Ki5ufYQTYKraWn9IVuS1A3Go2I0lsnNgb/JFdp+Lr47uHsw9zUAUPeg==
X-Received: by 2002:a17:902:bc88:b0:186:748e:9383 with SMTP id
 bb8-20020a170902bc8800b00186748e9383mr35912628plb.46.1671385836828; 
 Sun, 18 Dec 2022 09:50:36 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:3808:f064:41b8:eb9e])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a170902d2c900b00176b84eb29asm5318837plc.301.2022.12.18.09.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 09:50:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 0/2] target sh4 and tricore patches
Date: Sun, 18 Dec 2022 09:50:33 -0800
Message-Id: <20221218175035.449904-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 562d4af32ec2213061f844b3838223fd7711b56a:

  Merge tag 'pull-loongarch-20221215' of https://gitlab.com/gaosong/qemu into staging (2022-12-18 13:53:29 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-misc-20221218

for you to fetch changes up to 3b1371159cdb6f31d87fbb339853cc6a963ea6a1:

  target/tricore: Fix gdbstub write to address registers (2022-12-18 09:39:17 -0800)

----------------------------------------------------------------
Fix tricore gdbstub.
Fix superh_cpu_synchronize_from_tb.

----------------------------------------------------------------
Guenter Roeck (1):
      target/sh4: Mask restore of env->flags from tb->flags

Richard Henderson (1):
      target/tricore: Fix gdbstub write to address registers

 target/sh4/cpu.c         | 2 +-
 target/tricore/gdbstub.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

