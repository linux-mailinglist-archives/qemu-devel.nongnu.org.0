Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C21268019F
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 22:35:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMFJv-0002PA-LX; Sun, 29 Jan 2023 16:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pMFJt-0002OY-HC
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 16:34:37 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pMFJr-0001Lm-Eo
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 16:34:37 -0500
Received: by mail-ed1-x52a.google.com with SMTP id v10so9244486edi.8
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 13:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6fR8+5Kh9ZEyrm1V+zG+Wgcc73OLBc1xHuAndXvT+YA=;
 b=Xc3qbWKBz7zJC4x/98yFL4is3oHiFNkl5c81tYTiueMa0U3HfWGX4bzXIxsegzySvd
 R4PoeFrADXgcmONyXQwOeq82hx/VykKeahvl3hewh0zfe4ledgWjaq1QnbQoQx8/qclc
 sLpT0t8PgEVpW37/RciMaTlF+rz3sje574y8akJ8YZsRl5N3ZSkpZAEFZdQFlG6RsI7e
 44sAI5TQXj+bJphTrB8XeWseeaeehvJqPIlcZTtZNvDd5byH0xjSH4TqQ7wCziiyhNGx
 hZL5zWKt/k7wzgZ9s8eqeH5zQozMW7UGdet+CzlBDr26JndQIDBll6TE8tf/oQSWCJyP
 HBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6fR8+5Kh9ZEyrm1V+zG+Wgcc73OLBc1xHuAndXvT+YA=;
 b=IlXtSEJFokS8ne3P3rvEYK8kLWmjQkvvhiqvhFCo99gv4tPd7UY6d3CyBYeNjLwjl3
 YDU8um+ygt0hb33PiQH8mf8r9d1Cf7KptLws1w7z8g8yJiABlq/nc3zWnXpOEr+QeXNW
 PDkTfOJXVEu5ZA4bAIkdL4hywFTD3EN02uXzIU3iDahLGJyLhYU2Xt5Mq4Cz6Touf+i/
 BdQSDN6M4YFkG5/VzN4NFsbpE1hmKnqjUhgkngE2silWv6yGqDZYWlsfLBf7b6bVRMs6
 q/06mWb27fPxgSAhmfub43afCNjWjywWaoB8nbKwKurGk84L5zPtN25BW3NlDMQ7s6p/
 Qzxw==
X-Gm-Message-State: AFqh2kqZ2ncPw6/SfvWMOi3H1CWHKyatxo+IkAse6kt89PtpTvKsfq0V
 hFJZ/8pJPObhWBFRlDnEjnWWPjx7d1Y=
X-Google-Smtp-Source: AMrXdXvokZ83R93jPLL/32gzx3zZq5Gq4ZxLqPO3MsPCvG48xRYH5dIfY/jbDtLB5mWMriSB5LL+EA==
X-Received: by 2002:aa7:db97:0:b0:46c:d2a3:76b3 with SMTP id
 u23-20020aa7db97000000b0046cd2a376b3mr49384895edt.14.1675028073483; 
 Sun, 29 Jan 2023 13:34:33 -0800 (PST)
Received: from localhost.localdomain ([46.183.103.17])
 by smtp.gmail.com with ESMTPSA id
 d1-20020aa7d681000000b0049be07c9ff5sm5831220edr.4.2023.01.29.13.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 13:34:33 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/3] VIA PM Improvements
Date: Sun, 29 Jan 2023 22:34:15 +0100
Message-Id: <20230129213418.87978-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This series is part of my work to bring the VIA south bridges to the PC mac=
hine=0D
[1]. First it resolves a fixme in the device model by using the dedicated A=
CPI=0D
interrupt register for SCI routing. It then enables the device model to swi=
tch=0D
to ACPI. Finally, ACPI shutdown is implemented which guests can take advant=
age=0D
of after switching to ACPI mode.=0D
=0D
Testing done:=0D
- `make check`=0D
- `qemu-system-ppc -M pegasos2 \=0D
                   -rtc base=3Dlocaltime \=0D
                   -device ati-vga,guest_hwcursor=3Dtrue,romfile=3D"" \=0D
                   -cdrom morphos-3.17.iso \=0D
                   -kernel morphos-3.17/boot.img`=0D
- `qemu-system-ppc -M pegasos2 \=0D
                   -device ati-vga,romfile=3D"" \=0D
                   -cdrom morphos-3.17.iso \=0D
                   -bios pegasos2.rom`=0D
- `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom=0D
   manjaro-kde-21.3.2-220704-linux515.iso` on my pc-via branch seems to wor=
k=0D
   without any noticable differences to piix3 except that hotplugging isn't=
=0D
   implemented.=0D
=0D
[1] https://github.com/shentok/qemu/tree/pc-via=0D
=0D
Bernhard Beschow (3):=0D
  hw/isa/vt82c686: Fix SCI routing=0D
  hw/isa/vt82c686: Allow PM controller to switch to ACPI mode=0D
  hw/isa/vt82c686: Implement ACPI powerdown=0D
=0D
 hw/isa/vt82c686.c | 75 +++++++++++++++++++++++++++++++++++++++--------=0D
 1 file changed, 62 insertions(+), 13 deletions(-)=0D
=0D
-- =0D
2.39.1=0D
=0D

