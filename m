Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCBB69D671
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 23:45:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUEtf-0005bg-8Y; Mon, 20 Feb 2023 17:44:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUEtc-0005bY-4K
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 17:44:32 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUEta-0001RQ-5F
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 17:44:31 -0500
Received: by mail-wr1-x431.google.com with SMTP id p8so2743059wrt.12
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 14:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yEWf7W+++Z/UwWfLCI/85LHHKKlWMkLzqRHmLIbXKIc=;
 b=IaXJnM4aCTeBbTBCblBEUtKBjVLKagackvWGdyTmbJcSl8oeYpAshqyfmWlRKbWjjW
 GNua+cWbp4N7Rl3JXForFfVGmH5a3sy97Yf93u1tSR7f9cHet3CmfTILzDcPJQcg9Ilk
 Osgp742FQehxP2RsSG5OHMMsePrHbZ+xO6ICUg70eQjunSFiMa19RvluhsGlBWdANXNh
 OhEJO470iSvkG9WxTolFkv+Ch1a1k7L5gMbCgzF+9VTChCGW8r6Lpz+74Q3+CNcp0uY/
 3pu6bZqY3hgn0sP/9kT6c55JgTs7GNuN7pWmmS0Ycg532QcYK5IRzwFJ46IuN6vfvIjf
 ljsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yEWf7W+++Z/UwWfLCI/85LHHKKlWMkLzqRHmLIbXKIc=;
 b=ykCalpVN/yeisiqnVnEEeyMBYGkvnlhLJVUCbsEkDmcmPoNknynDfNeXwhMBi8u8+T
 OA465Wl3xt+FmauK1tvcBKEc97Pb6xLcD//gbywJPowFdGFH/YFFfKZI9da4MdYzV4R4
 wbLMjkbuvipk6RJ36MdMpIBiBevBXeBAyNghkEaxsiS/EB6Gigo0uj6wsyx+TVJC+98i
 layG1yeeiKjg2rNduvy/anmEVD3uueOVKFeIEDVKc/+chT/6HFxpJcA9CwrB0QsUPMZG
 P7SSuNajUuMLFVuXWo+3jr9FEh5dbxNLc85ewzVxzdNjE0mScL0hlq4WM4DlS+Gq5KcY
 Ae6g==
X-Gm-Message-State: AO0yUKVVnCrhZz+IvNfBuRdJ7g+tyvOAD2JOBdMLUIOeX5k1DiXD7Sn5
 r8ihW68eDEUFyyd1bK6RrI5u2g==
X-Google-Smtp-Source: AK7set9d9eA/PSAHZp2GFc0n3kqUpwjEkNEh72pS4QD5rcyGDi+6dNC7Uz6XDs6sg6RPywI1NOQsGA==
X-Received: by 2002:a5d:5141:0:b0:2c5:9fc4:8844 with SMTP id
 u1-20020a5d5141000000b002c59fc48844mr1722351wrt.9.1676933068223; 
 Mon, 20 Feb 2023 14:44:28 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a15-20020adffb8f000000b002c3f03d8851sm2374524wrr.16.2023.02.20.14.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 14:44:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6CB3D1FFB7;
 Mon, 20 Feb 2023 22:44:27 +0000 (GMT)
References: <20230104133935.4639-1-philmd@linaro.org>
 <20230104133935.4639-6-philmd@linaro.org>
 <Y88BmxzRqtnpAsWG@dev-arch.thelio-3990X>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Bernhard
 Beschow
 <shentey@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 5/6] hw/mips/gt64xxx_pci: Endian-swap using
 PCI_HOST_BRIDGE MemoryRegionOps
Date: Mon, 20 Feb 2023 22:43:28 +0000
In-reply-to: <Y88BmxzRqtnpAsWG@dev-arch.thelio-3990X>
Message-ID: <87zg98q7n8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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


Nathan Chancellor <nathan@kernel.org> writes:

> Hi Philippe,
>
> On Wed, Jan 04, 2023 at 02:39:34PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> GT64120's PCI endianness swapping works on little-endian hosts,
>> but doesn't on big-endian ones. Instead of complicating how
>> CFGADDR/CFGDATA registers deal with endianness, use the existing
>> MemoryRegionOps from hw/pci/pci_host.c. Doing so also reduce the
>> access to internal PCI_HOST_BRIDGE fields.
>>=20
>> Map the PCI_HOST_BRIDGE MemoryRegionOps into the corresponding
>> CFGADDR/CFGDATA regions in the ISD MMIO and remove the unused
>> code in the current ISD read/write handlers.
>>=20
>> Update the mapping when PCI0_CMD register is accessed (in case
>> the endianness is changed).
>>=20
>> This allows using the GT64120 on a big-endian host (and boot
>> the MIPS Malta machine in little-endian).
>>=20
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> This change as commit 145e2198d7 ("hw/mips/gt64xxx_pci: Endian-swap
> using PCI_HOST_BRIDGE MemoryRegionOps") in QEMU master causes a hang
> when trying to poweroff a malta_defconfig + CONFIG_CPU_BIG_ENDIAN=3Dy
> kernel on an x86_64 host. The kernel has been built from latest mainline
> using the kernel.org toolchains [1], just in case it matters.
>
> $ timeout --foreground 30s qemu-system-mips \
> -cpu 24Kf \
> -machine malta \
> -kernel vmlinux \
> -display none \
> -initrd rootfs.cpio \
> -m 512m \
> -nodefaults \
> -no-reboot \
> -serial mon:stdio
> ...
<snip>

Ahh also this commit got fingered by the tuxrun test for the same
combination:

  ./run --runtime docker --qemu-binary /home/alex.bennee/lsrc/qemu.git/buil=
ds/bisect/qemu-system-mips64 --device qemu-mips64

with my in flight patches for tuxrun's host support.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

