Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFBE49FBA3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 15:27:24 +0100 (CET)
Received: from localhost ([::1]:52316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDSDi-0002SU-Lf
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 09:27:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDS4S-0007rE-LY
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:17:48 -0500
Received: from [2a00:1450:4864:20::32d] (port=40614
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDS4P-0002PG-9F
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:17:48 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 d138-20020a1c1d90000000b0034e043aaac7so5701050wmd.5
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 06:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=sRb2SpkuldrUP/tTjMfekMux1B9SIkY93GGpOdS4aJo=;
 b=DtLMiUbpPg/VNrewAgwaJuDxkiTYUjsPqzvTikDah5sMqBGf1X0+ZaCuAiGM/VbM1D
 v4Cx37mOkeJJJGI8Yy5/GyhkmvkKTvNWNu6aWOS6OvptTsOpjhvyMyVoDyLtKvbFvw4z
 FYjJWA93s8vZay5IM5YguLFIxLyp/8WapN4+5Ey47g184dEN8piXVltNbsjJ6QYWYV6C
 byqd6wIGNrNtDRolopEWvwxFCcGn8uHygTiPooEt2VTX5LVQJgP0TkWDBL0Y9couhNcp
 ZKSUuZDX3jqHsKYj/xuO9Sn2uFimL62XwXI0hKCkdP2MbOWPBncqInFzvo4kja/u/CSM
 hrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=sRb2SpkuldrUP/tTjMfekMux1B9SIkY93GGpOdS4aJo=;
 b=HjqTxW1e86yXPj8wlcaw8D0bPjBBODDay5aXKaWZ+C1jFoD6VH1T93o6pjuORIP7LN
 VrZmWGa62FSLq8mlOYxZxiTM3+ya8OZAZIRD+/R9Y6bGb6y0JR958+e8PCb1O0ZjE1DD
 PIVvDDKOso6uHjoohuE4BPo/8ihhXKcYlUHQwKwjlJzLqzs+6T+shP0dTr60lC+cWZq9
 nHWoslHmGf/I64kfcVXla18kw9ZULIbKJ0Wm6Wji0cxeOxKUPcAtAIwTDkECyZpBm02o
 V0RWvq9cahMH35EPwBTeGMVl/yfLA8nFQw9pDBtQpylPX9nmadyyxj18TFZaRLoRr4nE
 x65w==
X-Gm-Message-State: AOAM530URlZ5AT6ky1KDmRY+yLB+GOUNfoFO+th0itPB/WNyjZm5GEQp
 x1UEgdmS+ZngbI0AX2AMAoHqRIBMqiC5R11IwtNPHW8ZEHye+Q==
X-Google-Smtp-Source: ABdhPJyKHccR7xbN0ijYbMC246r/HT0WkoJxaEnBIclczSgut4dw2rGOc8JPrV1rwJufTfap0+P9TaHAPGF2LWSgbUs=
X-Received: by 2002:a1c:a90d:: with SMTP id s13mr7659903wme.32.1643379455503; 
 Fri, 28 Jan 2022 06:17:35 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 14:17:24 +0000
Message-ID: <CAFEAcA-VUOa3R8_BZzJ0d3+RQyZJgwQ-P+3RWPHBoJQYUc7_Mg@mail.gmail.com>
Subject: should we have a Kconfig "device group" for I2C devices?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; I've been looking into what is the right way to handle in Kconfig
an i2c device which is intended for the user to specify on the command
line with a -device option.
(It's the lsm303dlhc magnetometer, currently in code review:
https://patchew.org/QEMU/20210921093227.18592-1-kevin.townsend@linaro.org/ )

Currently all our i2c devices are just pulled in by "select FOO" from
the Kconfig stanza for a board which has that kind of sensor hardwired
on-board. But for at least some of them it works fine to just specify
them on the commandline of any board that has an i2c controller that
allows pluggable devices. (For instance we do that kind of commandline
plugging in our test suite with tests/qtest/tmp105-test.c.)

What's the best way to structure this? For PCI we have the "device
group" PCI_DEVICES as documented in
https://qemu-project.gitlab.io/qemu/devel/kconfig.html#guidelines-for-writing-kconfig-files
and PCI devices say
    default y if PCI_DEVICES
    depends on PCI

For ISA devices we seem to make them say
    default y
    depends on ISA_BUS

I2C devices currently just say
    depends on I2C

Should we have an I2C_DEVICES, which boards where there's a sensible
user-pluggable i2c controller can specifically select ? Or should we
mark the i2c devices which are sensibly user-pluggable as
"default y" ? Or something else ?

thanks
-- PMM

