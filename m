Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1AD2CA3DF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:31:47 +0100 (CET)
Received: from localhost ([::1]:59124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5kw-00042J-IL
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:31:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5hn-0002kF-Jh
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:28:34 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5hi-0006HC-HM
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:28:29 -0500
Received: by mail-wr1-x431.google.com with SMTP id r3so2637018wrt.2
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 05:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VZ+owIG+OeLB4siUYnPOyJy4Jkv+mJJBvPXgUK3Sifo=;
 b=tYK6XsVmrK7NvCXZXpt9PM1KHoeTQge56v4KYNpeOf5Ic6Vc4yyT+4ek70Q9xh4NTy
 ukxyB1wyStFtM1KDGQKRAAKgLxu2sBziWGYqDIlkYEgBz4zcdkEEtqRUPCh3QwwiBfPE
 zzzv1iMOomGsucQ4M6gTiKCVYr9JF9sT8rvOsyfZ8QuIaLROWwJONnOVHPoCzcqcnxIb
 n3LWpwvp4w5y8nfncUPN5h4tq5ebBmJMmL0ahG8G8OjVztIdAuyrfQ9WdpTeyZfcvFMq
 xP0vtm7RkTnGnJTkpUCo559P+FqpWgPQlXC3bgJuFDhbpm+8AgORPGaf0bedRPgRYscP
 AAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=VZ+owIG+OeLB4siUYnPOyJy4Jkv+mJJBvPXgUK3Sifo=;
 b=Tc60qBC5EUuLdkLf02P0mhIWrVXZJe7Qt/PHz030xoIKHB3+GwhROsbvgF2AgVdk8e
 B6X2xrIc7PWiwt8L/cqWAmVez/jPaAVBhGBPgLO5rC1Kmytl9cfc+icFezCYat0mFqqc
 hOzpeyh1FeV2Fuj6k6ZwdsAeh0EcSBoFBmxZ6h3K/NUUmQ6JpQoOj9cRyxkz3yJnH3/B
 AcF462ORpVenyIzg/rNENgHKw5SHXf4hpifdv4p35jpi3vO0OTkuTu2ggPQpMGRfFFPw
 E+wf45OwFmd3tTiwA+CX7CTNImbqYT68ChZvtkWsYEFvjIMZ5udht31lBCyZKfEUx6RJ
 hFxw==
X-Gm-Message-State: AOAM533ma+e99Fzf0N3Jw1eA0+APoPDFMw3/FNGUeICt3XZPcx6dtq+t
 JREB4+A10Y6jhwveAL6Vsx0=
X-Google-Smtp-Source: ABdhPJyXRE7kL6L47VmXS7P6HJTPRrAakgDM2/yuq1b0DXPuH365yllcUauWqg2faeHTpavzzamxBw==
X-Received: by 2002:a5d:69d1:: with SMTP id s17mr4048261wrw.104.1606829300657; 
 Tue, 01 Dec 2020 05:28:20 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id c2sm3502442wrf.68.2020.12.01.05.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:28:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Huacai Chen <chenhc@lemote.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/3] target/mips: Add some CP0/MMU missing definitions
Date: Tue,  1 Dec 2020 14:28:14 +0100
Message-Id: <20201201132817.2863301-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add some MIPS3 and R6 definitions to ease code review.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  target/mips: Add CP0 Config0 register definitions for MIPS3 ISA=0D
  target/mips: Replace CP0_Config0 magic values by proper definitions=0D
  target/mips: Explicit Release 6 MMU types=0D
=0D
 target/mips/cpu.h                | 11 +++++++++--=0D
 target/mips/internal.h           |  9 +++++----=0D
 target/mips/translate_init.c.inc | 14 ++++++++------=0D
 3 files changed, 22 insertions(+), 12 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

