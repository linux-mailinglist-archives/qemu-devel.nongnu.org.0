Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBEF2CA3F7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:38:13 +0100 (CET)
Received: from localhost ([::1]:41736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5rA-0000M8-Jy
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:38:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5oZ-0006tE-Ev
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:35:31 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:36501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5oX-0000Fn-QP
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:35:31 -0500
Received: by mail-wr1-x442.google.com with SMTP id z7so2675216wrn.3
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 05:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zCdGdhw6lENfvEbaXC9A6QwkzqbNPKIEjWRS2wSl+BY=;
 b=WpkFsEWZvA4O3W+79/7I05FmY/ySIwIY5dGaYgyB4cZrwLsGfmxYBH8bYJpabhXej7
 zTBmWdfO2uvGBz1bqinYlRMVc7Rvx/DdPzwppJLH0FdtpadMw+/t4LYPYdIzBmdCpsYq
 4H5pbshaTWU08urr0z5coY13RbUqZu8fW3NxrFDG4glKrZh1wratfygKdoZw9be+HHGD
 7FhwZgHH7IeSMwa+s7J1kt/LlrLPweuwRvSD+0vKVWEXwt2J5uuXfnENU9dQJ85frKGf
 ch6X/TE4Gb03mJxm7Mt3nkFCQOOlnu8d5Mq9A631fHtbakxOIiEovxtMwpSUH61JXbE+
 xyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zCdGdhw6lENfvEbaXC9A6QwkzqbNPKIEjWRS2wSl+BY=;
 b=UYvwEf3qTkGVazf6eJPt4xFhEU93T42SFPsuIYyx1R5oHya05TD4ld+eUPG4p80xGb
 bQWQstA1ml+PpScoBz0gghGRLUpRQt7EW0rBSgz2TvJwv1tbyus8kaSMHojC31U/K3xl
 aPv/YqMguDNm3dsoRzFn3r/MjLnADTCvPrDA0seJ5XzuPNxENssIj1RxKmBHu+CGpXdX
 49q49X3AzIPJ5oSV7kQyxxVEJIdmqu/3R73J7q6aN7q+GHum98czI/TWvdve2Kj+NiAC
 jJTWSm/lf7yCXz0+OFaCVK25R6WyGyC/OBAS6RI7O0pYfDSsoVPgJoqD9730abrff7hl
 JH4Q==
X-Gm-Message-State: AOAM530a9B9DJOVPeWgjmvaVuPCHcHElkY9H+9QfR1BL59OODt5JX5MJ
 Ha1iGGA/d6XQFfiToWYVljU=
X-Google-Smtp-Source: ABdhPJzQ9i4bTdQPh5TWjZ0M8vyqvJkWMi4gOaAup8iSa5A15WeE5j8plbY8eGXvj927pzlT4HTIuQ==
X-Received: by 2002:adf:8b4a:: with SMTP id v10mr3990779wra.212.1606829728110; 
 Tue, 01 Dec 2020 05:35:28 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id v189sm3103145wmg.14.2020.12.01.05.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:35:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] linux-user: Rework get_elf_hwcap() and support MIPS
 Loongson 2F/3E
Date: Tue,  1 Dec 2020 14:35:19 +0100
Message-Id: <20201201133525.2866838-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Meng Zhuo <mengzhuo1203@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the GET_FEATURE_REG_SET() and GET_FEATURE_REG_EQU()=0D
macros to check if an instruction set is supported by a CPU=0D
using CP0 read-only bits (instead of QEMU insn_flags which=0D
is not always coherent - we might remove it soon).=0D
=0D
Use these macros to test for MSA ASE and Release 6.=0D
=0D
Update the ELF HWCAP bits and set the Loongson instructions=0D
so we can run 2F/3E userland binaries.=0D
=0D
Supersedes: <20201201083951.2745111-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  linux-user/elfload: Move GET_FEATURE macro out of get_elf_hwcap() body=0D
  linux-user/elfload: Rename MIPS GET_FEATURE() as GET_FEATURE_INSN()=0D
  linux-user/elfload: Introduce MIPS GET_FEATURE_REG_SET() macro=0D
  linux-user/elfload: Introduce MIPS GET_FEATURE_REG_EQU() macro=0D
  linux-user/elfload: Update HWCAP bits from linux 5.7=0D
  linux-user: Add support for MIPS Loongson 2F/3E=0D
=0D
 linux-user/elfload.c | 41 ++++++++++++++++++++++++++++++++++-------=0D
 1 file changed, 34 insertions(+), 7 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

