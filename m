Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CF42F9405
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 17:50:42 +0100 (CET)
Received: from localhost ([::1]:51086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1BGD-0005LF-Ey
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 11:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BDy-0003kL-Aj
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:48:22 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BDu-0001mi-Mw
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:48:19 -0500
Received: by mail-wm1-x332.google.com with SMTP id o10so4721871wmc.1
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 08:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j3JO6B4e+EksihTZ4KfA1a5Cno5UeILnoolPiRJ8pcI=;
 b=YkpPqM1oOwfyBRG+q9tS50pmH6pgiQQ/qvcyMSjTpDN1WNDXyPpUQawXMiPbNnZYhM
 ZP+s4vt5IUQOK31ZSK7fmoyfWzwojtCCuKTqn3iOHn6SbvHHyqcFlU7SUbff0g3p/9Le
 vNnvnACMC0VkZmkATaJPXA8XC7a7ZhQUgn/ZL7cC5pmJ7G7kVzazLoQ+eexQejn2kU4Z
 5zG4OOe1cBqHlMQZhTA+HfqVuCHH7rqXnNp7BujF8dPObXNTJf9qVhBUkhi4dtlhtStB
 KB/AeQHIHayEuLbxG5YtXUuJqSpUsIw3WPLdApNZY16k3kYVMtiral6QVQh5zpaYpflT
 otmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=j3JO6B4e+EksihTZ4KfA1a5Cno5UeILnoolPiRJ8pcI=;
 b=t4NaoUC+80HT13ES/8pUCkaiC16md1aKsByPMQ9Ut6CzG5ADxjjCKx5AY24YGpO1YX
 aVO7bkgZjobJlrxcL+0696UZR89Cs2lYWcC3LB2cVmXducxZw41lNDzcDoArRNRLhnVQ
 QkljcPVGqNPtyIedEO1R+H+SwrsUKftMdSGf3tPBSUExNSuHvvrxxL/3a4eHVkK4kjAK
 XeVOqOxK2B0XuBOVMOUIdQXHbA3k5WclCHXh7Kv8oigfvwAzqaQxhMM61nohftHxjOLt
 UJHQ10MrC6GRbwO+VmgHu3wDWiyUMM5C0h3j/Yx1xBafZp+hjUhmsLkogoUGfyUnlTdE
 SAag==
X-Gm-Message-State: AOAM531ruR2NrbHvDGvBNiWFP90pQ/ruAfhUmHyXp4Eqcgsk4SMfRbAt
 dgLLP5cnqsFc5vikMkLG0NDx9r5cSzk=
X-Google-Smtp-Source: ABdhPJy6yZBcyMc4IxiPyTVlfC6thFZHe3S7haW7zp89Rh2ENSvfgF2CbEJJ4/GmHyxdhSriNWoOwg==
X-Received: by 2002:a7b:c31a:: with SMTP id k26mr17035379wmj.72.1610902096473; 
 Sun, 17 Jan 2021 08:48:16 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g18sm18132670wrw.61.2021.01.17.08.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 08:48:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] accel: Restrict TCG-specific code
Date: Sun, 17 Jan 2021 17:48:07 +0100
Message-Id: <20210117164813.4101761-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
I've prepared some patches to have KVM-only builds.=0D
Some patches are generic - well kind of, instead they are=0D
TCG specific =3D) - so I'm sending them as a separate series.=0D
=0D
Please review,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  accel/tcg: Make cpu_gen_init() static=0D
  accel/tcg: Restrict tb_flush_jmp_cache() from other accelerators=0D
  accel/tcg: Restrict tb_gen_code() from other accelerators=0D
  accel/tcg: Declare missing cpu_loop_exit*() stubs=0D
  accel/tcg: Restrict cpu_io_recompile() from other accelerators=0D
  softmmu: Restrict watchpoint handlers to TCG accelerator=0D
=0D
 accel/tcg/internal.h      | 23 +++++++++++++++++++++++=0D
 include/exec/exec-all.h   | 11 -----------=0D
 include/hw/core/cpu.h     |  4 ++--=0D
 accel/stubs/tcg-stub.c    | 10 ++++++++++=0D
 accel/tcg/cpu-exec.c      |  1 +=0D
 accel/tcg/cputlb.c        |  1 +=0D
 accel/tcg/translate-all.c |  3 ++-=0D
 accel/tcg/user-exec.c     |  1 +=0D
 softmmu/physmem.c         |  4 ++++=0D
 9 files changed, 44 insertions(+), 14 deletions(-)=0D
 create mode 100644 accel/tcg/internal.h=0D
=0D
-- =0D
2.26.2=0D
=0D

