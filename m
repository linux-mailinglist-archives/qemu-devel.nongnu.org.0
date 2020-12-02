Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F325A2CC5BA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 19:46:18 +0100 (CET)
Received: from localhost ([::1]:41896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkX8r-00066G-Vn
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 13:46:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX6z-0004ug-CR
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:44:21 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:37277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX6x-0002ZZ-Np
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:44:21 -0500
Received: by mail-ej1-x643.google.com with SMTP id ga15so5958586ejb.4
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 10:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hSmpcykzQuwwBLpIogaztVYhDMmVTRhRVKKuYZtdDSM=;
 b=SVSB1KC+hLG73tSP2ktuBU9FVTjcMVJQSxO2zO2nSySCYqzVqvU5A2jPqKw0sUXS6p
 KmHD7HWpAbY4xRfkZeTV2oxmAE7biDy682X9pgCT+wbiSZTHO0RfdWQGAnpGKKHX09gd
 pA6l4PaJDuO6pjrHrS0QwXniR8QBSOaVowQWK5xwFL6o368ihmeGge4YORLBvdMn7e4p
 pncwytAK6D87mvxdxfqYhgp+Ixn27V2uMS3JZaBwUHZZIggqpqoSBpr6cJwf4Dc7YKuR
 OXOtnfF3GUquxVdbcJBZXsDsAsAKYSujFeoPr5ZsoGi/C3s1EslRFirRLfTDu95/+Eax
 3XQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hSmpcykzQuwwBLpIogaztVYhDMmVTRhRVKKuYZtdDSM=;
 b=qExkTz5DA9Hpkrp4wHbTSB1zkSjhwCIfNHceUg+8R2ydOlrZYG+7qyDOcJSSTZoHGL
 UT9yfRrvrvxvrq18UoYLVXX2vQINbK6+eTozKfggYNJwTwpkMTlLCbkGgJwezSao1nX1
 oeY/hnb5IsuVEmo+ShLdDraMI+PuMC0nTDqmJZziMZ5tWkNl1UgtPAFQP4e6T3n1DTcr
 ELqRA0YrU+cgf/aKfZWAhEnx/zfIsikDKi2zCv4P31HuZpiaZuRfiLu95Gc08gnKhVKc
 qJN2V4Su5dfpN2xANOmfFMZIBa0UaX1Y3VknoGcasGPDtv1noYmWv4Y67C2Zn0/EIb7L
 PU3A==
X-Gm-Message-State: AOAM533BadZRq442knhTJtNiCHIpMrDLU/fDTFeS+hSSWofz5lJoLGh6
 Mgy2G//57h8BnHcLRTpvMbXpef17iu0=
X-Google-Smtp-Source: ABdhPJyMzmZLWgyOOwxUd5Hd1ctpDEn79myeWV2W2IRWp5zvyADTWvznxSaLvFUQwKcUI+zGbLf60g==
X-Received: by 2002:a17:906:7aca:: with SMTP id
 k10mr1086857ejo.215.1606934657806; 
 Wed, 02 Dec 2020 10:44:17 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id c25sm474794ejx.39.2020.12.02.10.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 10:44:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] target/mips: Simplify MSA TCG logic
Date: Wed,  2 Dec 2020 19:44:06 +0100
Message-Id: <20201202184415.1434484-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I converted MSA opcodes to decodetree. To keep the series=0D
small I split it in 2, this is the non-decodetree specific=0D
patches (so non-decodetree experts can review it ;) ).=0D
=0D
First we stop using env->insn_flags to check for MSAi=0D
presence, then we restrict TCG functions to DisasContext*.=0D
=0D
Based-on: <20201130102228.2395100-1-f4bug@amsat.org>=0D
"target/mips: Allow executing MSA instructions on Loongson-3A4000"=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  target/mips: Introduce ase_msa_available() helper=0D
  target/mips: Simplify msa_reset()=0D
  target/mips: Use CP0_Config3 to set MIPS_HFLAG_MSA=0D
  target/mips: Simplify MSA TCG logic=0D
  target/mips: Remove now unused ASE_MSA definition=0D
  target/mips: Alias MSA vector registers on FPU scalar registers=0D
  target/mips: Extract msa_translate_init() from mips_tcg_init()=0D
  target/mips: Remove CPUMIPSState* argument from gen_msa*() methods=0D
  target/mips: Explode gen_msa_branch() as gen_msa_BxZ_V/BxZ()=0D
=0D
 target/mips/internal.h           |   8 +-=0D
 target/mips/mips-defs.h          |   1 -=0D
 target/mips/kvm.c                |  12 +-=0D
 target/mips/translate.c          | 206 ++++++++++++++++++-------------=0D
 target/mips/translate_init.c.inc |  12 +-=0D
 5 files changed, 138 insertions(+), 101 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

