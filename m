Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 858A332D68D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:27:39 +0100 (CET)
Received: from localhost ([::1]:51426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpt4-0005Fa-H0
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:27:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHprh-0004A8-4I
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:26:13 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHprf-0007kK-Hs
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:26:12 -0500
Received: by mail-wr1-x431.google.com with SMTP id j2so15233276wrx.9
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 07:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QHyn0mTSKUS6MzbmGf3CaB9BjtG74ZWlsMOn+Jjze3M=;
 b=DOimdXeFVx0wH51bD9ph7WtemZKIOSYcynv4jZnAX4puiJyEwq77v/DVmJYcLwfPXW
 1YTqmIZlybjHazT10Md1L187ifmTSwv0DvIAgpdqi5fP3GwqAp9+oUOI7D+JxBzHUlIB
 lApHZ1UFoh+K0y/ttm5meFNpK/SyQsQv5ks6whhB1uDkk+GhPfpZA6Ps0O3uZpgf6rmN
 8EOWaxyLkXAW+1kl3AFMQXEqZrZz0qmZ7hY3CNklGRoW/7fzBEnUjVGKKITOP/Dh8pvD
 TCDeEb45CYo0RhZgU649QigWKGq8uUdxHR1uc+NJ0a0cXYWhrhGOzzXNXMBus0ql3Wur
 m8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QHyn0mTSKUS6MzbmGf3CaB9BjtG74ZWlsMOn+Jjze3M=;
 b=qnAhrQWKqjC0mxWDikqTepxpzWMKD4B6Git2LN7+qaXYvcLag+Oh77HC9+IP8QC0xD
 WeLJXEnsDqZFPQ4U/adUXbrASQTuu1MTbzYcKnyx+e+D8tkWHF0/QUMrwoPJHklCWwLr
 7U/W5RN3zou4pu1f6L8nTgvDOwuL2CbyEKgOQN9tTN9nMtKrhWqirnDaamm0lRZyYvfU
 ePTB+eHt5y/a+yZly8z1NmyTKhri0SBPSzhrPuwiev/h+PKKALg3YwZYFAQi8oimm3wR
 ke1XQNpvRxluwIBXLPprS00mh0De8uWS7y80uAXTHkIgSPLGPkzwJg9EDuMpkeTcDoTd
 Et8g==
X-Gm-Message-State: AOAM532OhJNq6vJhjKl+4S5OaFcq8QD6w+Efhca4BRL2fEEpCp+CfWP6
 sB4FKckxMEBizapu+iyiFM1kll7Oc1U=
X-Google-Smtp-Source: ABdhPJylyZ7q4XIZIrlZDvIYnvI0h3qvV8+QJXnurvCaLEcq+g9Xy1GStPsKuJDkGoC+cE43rAB+Dw==
X-Received: by 2002:a5d:61c9:: with SMTP id q9mr4484661wrv.219.1614871569459; 
 Thu, 04 Mar 2021 07:26:09 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h10sm35430288wrp.22.2021.03.04.07.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 07:26:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 0/3] user-mode: Rename CPUState::opaque as CPUState::task_state
Date: Thu,  4 Mar 2021 16:26:04 +0100
Message-Id: <20210304152607.1817648-1-f4bug@amsat.org>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yet another series trying to clarify CPUState fields.=0D
Here we change 'void *opaque' by 'TaskState *task_state'=0D
to remove confusion regarding when this 'opaque' field=0D
can be used.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  user-mode: Use QEMU_ALIGNED() on TaskState structure=0D
  cpu: Forward-declare user-mode TaskState structure=0D
  user-mode: Rename CPUState::opaque as CPUState::task_state=0D
=0D
 bsd-user/qemu.h                  |  4 ++--=0D
 include/hw/core/cpu.h            |  7 ++++--=0D
 linux-user/m68k/target_cpu.h     |  3 +--=0D
 linux-user/qemu.h                |  6 ++---=0D
 bsd-user/main.c                  |  2 +-=0D
 gdbstub.c                        | 13 ++++------=0D
 hw/semihosting/arm-compat-semi.c | 12 ++++------=0D
 linux-user/aarch64/cpu_loop.c    |  2 +-=0D
 linux-user/arm/cpu_loop.c        |  4 ++--=0D
 linux-user/arm/signal.c          |  2 +-=0D
 linux-user/cris/cpu_loop.c       |  3 +--=0D
 linux-user/elfload.c             |  8 +++----=0D
 linux-user/hppa/signal.c         |  3 +--=0D
 linux-user/linuxload.c           |  2 +-=0D
 linux-user/m68k/cpu_loop.c       |  2 +-=0D
 linux-user/main.c                |  2 +-=0D
 linux-user/mips/cpu_loop.c       |  3 +--=0D
 linux-user/ppc/signal.c          |  7 +++---=0D
 linux-user/riscv/cpu_loop.c      |  3 +--=0D
 linux-user/signal.c              | 34 ++++++++++++--------------=0D
 linux-user/syscall.c             | 41 +++++++++++++-------------------=0D
 linux-user/vm86.c                | 19 +++++++--------=0D
 target/m68k/m68k-semi.c          |  2 +-=0D
 23 files changed, 80 insertions(+), 104 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

