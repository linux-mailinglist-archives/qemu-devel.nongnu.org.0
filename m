Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3B4492CE8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 19:01:34 +0100 (CET)
Received: from localhost ([::1]:56234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9snU-0002vW-9U
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 13:01:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9sUq-00012q-Hd
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:42:16 -0500
Received: from [2a00:1450:4864:20::332] (port=36827
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9sUo-0000Xh-NT
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:42:16 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso6245573wma.1
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 09:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=yiCEjI8JfPfqCEo7Cl7P5TMQ7OZQg4c96RYgriBMfqQ=;
 b=gg/tLDkX5uYjvQ5+Y4j70ObZue/NmZjSft/mCRxqEjDMJFewqjY6PDGJVKM62VfKaC
 KcNG2q9Ujf/ETSaDBE2dkI6wUDP9G2zTpd9jxchZcg2DOif5Sl8PQ20S2IWQhrpcdpdr
 SwKlFNwXzF1o1vT94u4BbF6IkoZjeJVA/AAjpLaOHaG0W7w52vaJ5ze7InwaJNMtObtC
 ihmuwARXsKaucVjcbwZIi23Dy+KBwQCrE/Pbb04lGT+DXHVSjehtugjG6+ntBL55t2/i
 HEWyfiis5Q5xslCLrvCfT5+L4Tj/ySk1rLm+5PRc2znK6T/0iehf6xgiQxj5IUdiBAPb
 p56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=yiCEjI8JfPfqCEo7Cl7P5TMQ7OZQg4c96RYgriBMfqQ=;
 b=In6I0dbhPa1NCI1ogSmc05srMPut0TlGL0PniCkaegwYsRcBLVtXjtTMbTQpXkUT5F
 1w2v6XpB9TNue99x16EX2OPFvtvirqd2VHjkzEmU2g3mtbtwrv6zi45PeYbHEJq9pJp/
 152JEhK22va3TZehP7RSUFqk2UmdRn30BzGqRanqTpC2fUXhuIfbZ2mCMRkybb4koexi
 2+uhVTXtAHL34RVtyS+KJvCpeRdYhj4YXRKTZn2OwFAp2whT1+u7/Xsw8zZH+87u+fSL
 ShwkcEUZM8xGagUnQobQv35cVaNAKil59g0DmjnGj6TqD8mR7MRmipZNcGIA9o4D2AuQ
 6LnQ==
X-Gm-Message-State: AOAM530dOMWyzPzqniIq2PpevxVn+QWD0zYFUd7s3JoAqQA88nsoHhnD
 3e6cLB2Hdfp2qvppWZjwuGcrFg==
X-Google-Smtp-Source: ABdhPJyLo/Jm/u3xhe5bOnmO7zriTg+M8wVMAv+PuNKwc3D9cdcMlHFSeP0E2aSJFhF4xo89Dtmt9g==
X-Received: by 2002:a7b:cbc3:: with SMTP id n3mr26360565wmi.12.1642527733280; 
 Tue, 18 Jan 2022 09:42:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k10sm17321663wrz.113.2022.01.18.09.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 09:42:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC1B01FFB7;
 Tue, 18 Jan 2022 17:42:11 +0000 (GMT)
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 00/13] arm gicv3 ITS: Various bug fixes and refactorings
Date: Tue, 18 Jan 2022 17:37:23 +0000
In-reply-to: <20220111171048.3545974-1-peter.maydell@linaro.org>
Message-ID: <87pmop7xfw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Andre.przywara@arm.com,
 Shashi Mallela <shashi.mallela@linaro.org>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> I've been working on the ITS to add support for the GICv4 functionality.
> In the course of that I found a handful of bugs in it and also some
> places where the code benefited from refactoring to make it a better
> base to put in the GICv4 parts. This patchset is just the bugfixes
> and cleanups, because there are enough patches here that I figured it
> made sense to send them out now rather than holding on to them.
>
> Most of these patches were in v1 and have been reviewed already.

I've reviewed the patches and they look good to me. kvm-unit-tests is
still failing some tests but the ones it fails hasn't changed from
before this patch:

  =E2=9C=97  env QEMU=3D$HOME/lsrc/qemu.git/builds/arm.all/qemu-system-aarc=
h64 ./run_tests.sh -g gic
  PASS gicv2-ipi (3 tests)
  PASS gicv2-mmio (17 tests, 1 skipped)
  FAIL gicv2-mmio-up (17 tests, 2 unexpected failures)
  FAIL gicv2-mmio-3p (17 tests, 3 unexpected failures)
  PASS gicv3-ipi (3 tests)
  PASS gicv2-active (1 tests)
  PASS gicv3-active (1 tests)

That said running with -d unimp,guest_errors there are some things that
should probably be double checked, e.g.:

  /home/alex/lsrc/qemu.git/builds/arm.all/qemu-system-aarch64 -nodefaults -=
machine virt -accel tcg -cpu cortex-a57 -device virtio-serial-device -devic=
e virtconsole,chardev=3D
  ctd -chardev testdev,id=3Dctd -device pci-testdev -display none -serial s=
tdio -kernel arm/gic.flat -machine gic-version=3D2 -smp 1 -append "mmio" -d=
 unimp,guest_errors
  PASS: gicv2: mmio: all CPUs have interrupts
  gic_dist_readb: Bad offset 8=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset 9=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset a=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset b=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  INFO: gicv2: mmio: IIDR: 0x00000000=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset 4=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset 5=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset 6=20
  gic_dist_writeb: Bad offset 7=20
  gic_dist_writeb: Bad offset 4=20
  gic_dist_writeb: Bad offset 5=20
  gic_dist_writeb: Bad offset 6=20=20
  gic_dist_writeb: Bad offset 7=20=20
  gic_dist_writeb: Bad offset 4=20=20
  gic_dist_writeb: Bad offset 5=20=20
  gic_dist_writeb: Bad offset 6=20
  gic_dist_writeb: Bad offset 7=20
  PASS: gicv2: mmio: GICD_TYPER is read-only
  gic_dist_readb: Bad offset 8=20=20
  gic_dist_readb: Bad offset 9=20=20=20
  gic_dist_readb: Bad offset a=20=20=20
  gic_dist_readb: Bad offset b=20=20=20
  gic_dist_writeb: Bad offset 8=20=20
  gic_dist_writeb: Bad offset 9=20
  gic_dist_writeb: Bad offset a=20
  gic_dist_writeb: Bad offset b=20
  gic_dist_readb: Bad offset 8=20=20
  gic_dist_readb: Bad offset 9=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset a=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset b=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset 8=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset 9=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset a=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset b=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset 8=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset 9=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset a=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_readb: Bad offset b=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
  PASS: gicv2: mmio: GICD_IIDR is read-only=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset fe8=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset fe9=20=20=20=20=20=20=20=20=20
  gic_dist_writeb: Bad offset fea
  gic_dist_writeb: Bad offset feb
  gic_dist_writeb: Bad offset fe8
  gic_dist_writeb: Bad offset fe9
  gic_dist_writeb: Bad offset fea
  gic_dist_writeb: Bad offset feb
  gic_dist_writeb: Bad offset fe8
  gic_dist_writeb: Bad offset fe9
  gic_dist_writeb: Bad offset fea
  gic_dist_writeb: Bad offset feb
  PASS: gicv2: mmio: ICPIDR2 is read-only
  INFO: gicv2: mmio: value of ICPIDR2: 0x0000002b
  PASS: gicv2: mmio: IPRIORITYR: consistent priority masking
  INFO: gicv2: mmio: IPRIORITYR: priority mask is 0xffffffff
  PASS: gicv2: mmio: IPRIORITYR: implements at least 4 priority bits
  INFO: gicv2: mmio: IPRIORITYR: 8 priority bits implemented
  PASS: gicv2: mmio: IPRIORITYR: clearing priorities
  gic_dist_readb: Bad offset 520
  gic_dist_readb: Bad offset 521
  gic_dist_readb: Bad offset 522
  gic_dist_readb: Bad offset 523
  gic_dist_writeb: Bad offset 520
  gic_dist_writeb: Bad offset 521
  gic_dist_writeb: Bad offset 522
  gic_dist_writeb: Bad offset 523
  gic_dist_readb: Bad offset 520
  gic_dist_readb: Bad offset 521
  gic_dist_readb: Bad offset 522
  gic_dist_readb: Bad offset 523
  gic_dist_writeb: Bad offset 520
  gic_dist_writeb: Bad offset 521
  gic_dist_writeb: Bad offset 522
  gic_dist_writeb: Bad offset 523
  gic_dist_readb: Bad offset 520
  gic_dist_readb: Bad offset 521
  gic_dist_readb: Bad offset 522
  gic_dist_readb: Bad offset 523
  PASS: gicv2: mmio: IPRIORITYR: accesses beyond limit RAZ/WI
  PASS: gicv2: mmio: IPRIORITYR: accessing last SPIs
  PASS: gicv2: mmio: IPRIORITYR: priorities are preserved
  PASS: gicv2: mmio: IPRIORITYR: byte reads successful
  PASS: gicv2: mmio: IPRIORITYR: byte writes successful
  PASS: gicv2: mmio: ITARGETSR: bits for non-existent CPUs masked
  INFO: gicv2: mmio: ITARGETSR: 7 non-existent CPUs
  PASS: gicv2: mmio: ITARGETSR: accesses beyond limit RAZ/WI
  FAIL: gicv2: mmio: ITARGETSR: register content preserved
  INFO: gicv2: mmio: ITARGETSR: writing 01010001 reads back as 00000000
  PASS: gicv2: mmio: ITARGETSR: byte reads successful
  FAIL: gicv2: mmio: ITARGETSR: byte writes successful
  INFO: gicv2: mmio: ITARGETSR: writing 0x1f into bytes 2 =3D> 0x00000000
  SUMMARY: 17 tests, 2 unexpected failures


>
> Changes from v1:
>  * first half of the series is now upstream
>  * patch 1 now has the '1ULL' and uint64_t fixes that were
>    partly split across two patches in the old series and partly missing
>  * new patches 12 and 13
>
> NB: I left the returns of -1 in patch 11.
>
> Patches still needing review: 1, 12, 13
>
> thanks
> -- PMM
>
> Peter Maydell (13):
>   hw/intc/arm_gicv3_its: Fix event ID bounds checks
>   hw/intc/arm_gicv3_its: Convert int ID check to num_intids convention
>   hw/intc/arm_gicv3_its: Fix handling of process_its_cmd() return value
>   hw/intc/arm_gicv3_its: Don't use data if reading command failed
>   hw/intc/arm_gicv3_its: Use enum for return value of process_*
>     functions
>   hw/intc/arm_gicv3_its: Fix return codes in process_its_cmd()
>   hw/intc/arm_gicv3_its: Refactor process_its_cmd() to reduce nesting
>   hw/intc/arm_gicv3_its: Fix return codes in process_mapti()
>   hw/intc/arm_gicv3_its: Fix return codes in process_mapc()
>   hw/intc/arm_gicv3_its: Fix return codes in process_mapd()
>   hw/intc/arm_gicv3_its: Factor out "find address of table entry" code
>   hw/intc/arm_gicv3_its: Check indexes before use, not after
>   hw/intc/arm_gicv3_its: Range-check ICID before indexing into
>     collection table
>
>  hw/intc/arm_gicv3_its.c | 492 ++++++++++++++++++----------------------
>  1 file changed, 225 insertions(+), 267 deletions(-)


--=20
Alex Benn=C3=A9e

