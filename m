Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4A92D1C80
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 22:57:42 +0100 (CET)
Received: from localhost ([::1]:42188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmOVp-0004H5-Ga
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 16:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmORN-0000wA-RB
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:53:05 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:39673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmORM-0004ei-9K
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:53:05 -0500
Received: by mail-ej1-x643.google.com with SMTP id n26so21688665eju.6
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 13:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MO7YPd2X9UZHaNx9TZxo4BTR/XxQyu9FkO8bk39Q+j4=;
 b=a9G85RurMWcyAIEGHvJm0R2TIDpY17Ln57YyT4jZkI7iV0W/PJ6pWLozrtUBDkB3Hg
 +GXRSA5UB2PTVwljQRSVERJIGL2Rb/7211ls3+Yc2BUCty7EQJ4r7EkxjtOTMCj4kkZ9
 frqJ4+J3TnABPR20uNLECzm1gS8ZK7GYEE6YoIsxxkuzk1XiVG6jJ2aPh3PxSbq/MICj
 nPRlDW1DTgFu11+K7HJX1bSU2PGwzOGl8+CQAE4snY3ryV+CGQkMJDuCo7eWKBL62qIs
 FGex4VlN7CHzdrSf0wXHj8MRuRqMycRv5nF5vDIO4ZR6nAoCDZ/RtncPO6UoOvsvqh9z
 DMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=MO7YPd2X9UZHaNx9TZxo4BTR/XxQyu9FkO8bk39Q+j4=;
 b=VVmFtaXdTpSaDlrsJHb5EYYQnNj7QSuoDdE2QuxgO7OTrqLEuBQIAeecitfhwEiaD+
 EJCxalT5g6WGTUmLVrpbKciXSgoyIyUOwehqtB5GO94zr5OPKbJnKpyblN2Z/cj3A4iw
 rjBT/oTGR0WzDhiiV4pRlKb135pCDThzM6mPg7UotHdVrBHjFdqU3ougNamdmmj4S6BQ
 wia+TKpvm0HLFjs/PidelWvZV7uLcb88wJQlJj/0unDnQkKd/dazwmi3rhJosYrqInDk
 dSpUj8NyqveI7O92O3eX0kJx5lckV4zLFL3IUs0I1zWce2Jsa5IADVLfZOyK8CEDUT03
 /QjA==
X-Gm-Message-State: AOAM532uck+0Sif7ygEnGDXzxoIpFm4VvcJZ/nCT0FL1mubZuMOkmXtE
 NLkbPsCIA3HclGmqct7gXxQpnXseg2U=
X-Google-Smtp-Source: ABdhPJxSdXwNhv41bhmEk9Nu8jjZJZU0iWWw/vOtfznT7ZqpoKBvJitHpc4kug5aYTEmYrlZU3kvYQ==
X-Received: by 2002:a17:906:4756:: with SMTP id
 j22mr21453586ejs.353.1607377979926; 
 Mon, 07 Dec 2020 13:52:59 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id f19sm13727143ejk.116.2020.12.07.13.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 13:52:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/2] target/mips: Let cpu_supports_isa() take CPUMIPSState
 argument
Date: Mon,  7 Dec 2020 22:52:55 +0100
Message-Id: <20201207215257.4004222-1-f4bug@amsat.org>
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
 Paul Burton <paulburton@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jiaxun,=0D
=0D
Here goes the cpu_supports_isa() helper for your bootloader API:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg764582.html=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  target/mips: Rename cpu_supports_FEAT() as cpu_type_supports_FEAT()=0D
  target/mips: Introduce cpu_supports_isa() taking CPUMIPSState argument=0D
=0D
 target/mips/cpu.h       | 5 +++--=0D
 hw/mips/boston.c        | 4 ++--=0D
 hw/mips/malta.c         | 4 ++--=0D
 target/mips/cpu.c       | 5 +++++=0D
 target/mips/translate.c | 4 ++--=0D
 5 files changed, 14 insertions(+), 8 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

