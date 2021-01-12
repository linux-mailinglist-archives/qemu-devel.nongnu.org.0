Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3698A2F3BF5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:57:00 +0100 (CET)
Received: from localhost ([::1]:51602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzRes-0003gs-Q5
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRd9-0002TF-I0
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:55:11 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRd8-0001Pt-69
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:55:11 -0500
Received: by mail-wm1-x32e.google.com with SMTP id g25so2521992wmh.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KyGpzYvDqquV01cMQ6FO0Y9bwAkFKJ08rQRuKQ1kOGY=;
 b=lOPD1j9evPX5a5DXGKo4uKk+0KBEgItIlw3dMtaXgLbbJCTIDCHZA20MldBnpu4YsF
 djt0hXYw8sq/q1Lm/TLjqC9vLZJDcpNomwDhx7exQz6RYe5iZrVW8ztSkv+Mdy4uzFls
 G9WqKvIuFgwrMUUHmWjx3WZFpRIgotwpotHEjqxOH3OyysA1YnYndvDX9rEpfR4eIZII
 enM6LG5bKfs1V9v4zXDIlhKRWQa/56Z8tuXcUehCQeaMRLbeobx2L6oONorcUE+wicNn
 qmccq/2IA4rJk+/qZWCXeXTagVlEb/ImhKUgrB08delm5GvE4uNT/GQBxFnJyFcFoZrO
 ACiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=KyGpzYvDqquV01cMQ6FO0Y9bwAkFKJ08rQRuKQ1kOGY=;
 b=VuCF8JxTG9cBiocv52QgGaS50UBlas99Po1DtB1UXGhFORQp657Lz9H2/0J+Eq/2x0
 O4iOFfDOERj9NPK8zOqnIvgBTJGadsFa/1VVOMaiEN4QdrzKz1EF93tQ3iM9A++QW5Sj
 HtGYT1e/Jr8uOO8VYFDIfrouC28cmzaftX3WXFdMPO4OMZcWurvV29zYBowbeprrfp44
 5AuCMEgTics527pBmbhtUeUKahn1g/tspjuaa9TzwPH5ErQVpRLusbe7gtGFQ/VuaEIW
 VmnqT+1F8IC0XqgQiiMGbtpnFsL3JMLyjBIH3+O77MvRnkjyygcpb6vn4pXBc/Xco9X+
 fydQ==
X-Gm-Message-State: AOAM5315obclmtHpc5KqgvNvyYw6slgwsuyIIFqZryGNk/knFWmCYzkr
 WgW4hLSXpxtZN/qEUNe32S6doIO+zUo=
X-Google-Smtp-Source: ABdhPJzEr5tXdSiZd2tucKVmEy/bjaDpzCddL1jajnjsvP/h1dQD1mFtZAVNC0ONeMiP1E4gHPuqpA==
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr1104499wmh.77.1610488507713; 
 Tue, 12 Jan 2021 13:55:07 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id i7sm7387151wrv.12.2021.01.12.13.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 13:55:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] target/mips: Convert Loongson LEXT opcodes to decodetree
Date: Tue, 12 Jan 2021 22:54:58 +0100
Message-Id: <20210112215504.2093955-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Loongson is next step in the "MIPS decodetree conversion" epic.=0D
Start with the simplest extension.=0D
=0D
The diffstat addition comes from the TCG functions expanded.=0D
The code is easier to review now.=0D
IMO this is also a good template to show how easy a decodetree=0D
conversion can be (and how nice the .decode file is to review) :P=0D
=0D
Please review,=0D
=0D
Phil.=0D
=0D
Based-on: <20210112184156.2014305-1-f4bug@amsat.org>=0D
          "decodetree: Allow 'dot' in opcode names"=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  target/mips: Re-introduce OPC_ADDUH_QB_DSP and OPC_MUL_PH_DSP=0D
  target/mips: Convert Loongson DDIV.G opcodes to decodetree=0D
  target/mips: Convert Loongson DIV.G opcodes to decodetree=0D
  target/mips: Convert Loongson [D]DIVU.G opcodes to decodetree=0D
  target/mips: Convert Loongson [D]MOD[U].G opcodes to decodetree=0D
  target/mips: Convert Loongson [D]MULT[U].G opcodes to decodetree=0D
=0D
 target/mips/translate.h       |   1 +=0D
 target/mips/godson2.decode    |  29 +++=0D
 target/mips/loong-ext.decode  |  30 +++=0D
 target/mips/loong_translate.c | 334 ++++++++++++++++++++++++++++++++++=0D
 target/mips/translate.c       | 287 ++---------------------------=0D
 target/mips/meson.build       |   3 +=0D
 6 files changed, 409 insertions(+), 275 deletions(-)=0D
 create mode 100644 target/mips/godson2.decode=0D
 create mode 100644 target/mips/loong-ext.decode=0D
 create mode 100644 target/mips/loong_translate.c=0D
=0D
-- =0D
2.26.2=0D
=0D

