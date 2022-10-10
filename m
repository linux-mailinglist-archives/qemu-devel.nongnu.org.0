Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0535F9D2C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 12:58:43 +0200 (CEST)
Received: from localhost ([::1]:37634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohqUc-0005pt-4F
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 06:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohqR7-0002gR-O0
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 06:55:06 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohqR5-0000vM-Qx
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 06:55:05 -0400
Received: by mail-pl1-x631.google.com with SMTP id c24so10057117plo.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 03:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rCR1ZszeABuDB8oLYdEXz3A4Abb5mNA9cC8R24IBJh4=;
 b=QN+t+HcJnWAM4LVnMiuOsPFpFRh3bfncW0ch16rEv0w+uMxWorcKWqR4dyAwLYWgen
 gKy6jFNcD60xZiifQZD0HGNexvnH9327IcfBxlkQCaULIerbQwSke+sIYvO3KlzOCUwL
 r4w0y9ElAVqMdJlx29jDLXcDgjqxzIyoj0XSoCcextJIRQ2P/Zcr5QuC93Z6dzVgdz4P
 Q8srbBX9b3ppSoTNEcdUNJkgBxFcCiHaNzxVaOUoN7E9iveeISjUAhHfxMolN9EpUR/r
 /EsQrVoAvp8Xz4q/RWSWXv/qMQ7DlrlHpkTMabwwTfNI+L585N32lgCYlhzV7fUc6ZDC
 3Lhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rCR1ZszeABuDB8oLYdEXz3A4Abb5mNA9cC8R24IBJh4=;
 b=FhEc+zSfJuup6Rme3WGJst08Rg7CJMWRAxBmFis928R3X3zwd97U1WJwouIMbMx/ab
 5VZujThxjJhRAPrPvMRRws0CQAdFZAcJjH68M8vpwIabGPXEDXaG2PtPGOj8SQYtkXkc
 OTHOdOveEr88gVdzcgZ3kyotJ7GKuYf5Nb2hsOdFGjdMspGy1FHgCvndN+SiDV+4wNqT
 1P1L0ZDmtg7iQcXV8AOK/u079I63ifNE3keKtaLANdoUidDAlT/Rh6Fk1lmvNm88aLJh
 XlogAti2UDk1d3JsgjJ1bNdCoLPiPnFOOBF8FoIohecz05j/iWT7UG3AF26m0s+py0Ig
 yltw==
X-Gm-Message-State: ACrzQf2j+iprDsvREe1MPlRUop+0z482ceXOOfd6fD5k4/Pt0u8wKmI9
 c+86DhOsktoEfx4dksw1p5OCPb5f1jjVYb5UUF5JkA==
X-Google-Smtp-Source: AMsMyM4Pda3F4fWuFbQJ9TRlYJhKU1OXlIHnfbeUODUIph+GXwTW4qiRyfjf8gtgqsF1EjCcFaB8m3jt3yBJaoCXmMw=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr18292965plb.60.1665399302197; Mon, 10
 Oct 2022 03:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220929232339.372813-1-Jason@zx2c4.com>
 <CAFEAcA-Ac-=i_DK5MUtKtTqH7OpyzHAi6u=tHFAFZyvdr1KP8A@mail.gmail.com>
In-Reply-To: <CAFEAcA-Ac-=i_DK5MUtKtTqH7OpyzHAi6u=tHFAFZyvdr1KP8A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2022 11:54:50 +0100
Message-ID: <CAFEAcA-fOdNeDz9_Hbm7R3_3o2T4Zw8wPrgOtVLK9tUNMciZow@mail.gmail.com>
Subject: Re: [PATCH 1/6] device-tree: add re-randomization helper function
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 David Gibson <david@gibson.dropbear.id.au>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, 
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Oct 2022 at 14:16, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 30 Sept 2022 at 00:23, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > When the system reboots, the rng-seed that the FDT has should be
> > re-randomized, so that the new boot gets a new seed. Several
> > architectures require this functionality, so export a function for
> > injecting a new seed into the given FDT.
> >
> > Cc: Alistair Francis <alistair.francis@wdc.com>
> > Cc: David Gibson <david@gibson.dropbear.id.au>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>
> Hi; I've applied this series to target-arm.next (seems the easiest way
> to take it into the tree).

Unfortunately it turns out that this breaks the reverse-debugging
test that is part of 'make check-avocado'.

Running all of 'check-avocado' takes a long time, so here's how
to run the specific test:

      make -C your-build-tree check-venv   # Only for the first time
      your-build-tree/tests/venv/bin/avocado run
your-build-tree/tests/avocado/boot_linux.py

Probably more convenient though is to run the equivalent commands
by hand:

wget -O /tmp/vmlinuz
https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/29/Everything/aarch64/os/images/pxeboot/vmlinuz
./build/x86/qemu-img create -f qcow2 /tmp/disk.qcow2 128M
./build/x86/qemu-system-aarch64 -display none -machine virt -serial
stdio -cpu cortex-a53 -icount
shift=7,rr=record,rrfile=/tmp/qemu.rr,rrsnapshot=init -net none -drive
file=/tmp/disk.qcow2 -kernel /tmp/vmlinuz
# this will boot the kernel to the no-root-fs panic; hit ctrl-C when
it gets there
./build/x86/qemu-system-aarch64 -display none -machine virt -serial
stdio -cpu cortex-a53 -icount
shift=7,rr=replay,rrfile=/tmp/qemu.rr,rrsnapshot=init  -net none
-drive file=/tmp/disk.qcow2 -kernel /tmp/vmlinuz
# same command line, but 'replay' rather than 'record', QEMU will exit
with an error:
qemu-system-aarch64: Missing random event in the replay log

Without these patches the replay step will replay the recorded execution
up to the guest panic.

The error is essentially the record-and-replay subsystem saying "the
replay just asked for a random number at point when the recording
did not ask for one, and so there's no 'this is what the number was'
info in the record".

I have had a quick look, and I think the reason for this is that
load_snapshot() ("reset the VM state to the snapshot state stored in the
disk image or migration stream") does a system reset. The replay
process involves a lot of "load state from a snapshot and play
forwards from there" operations. It doesn't expect that load_snapshot()
would result in something reading random data, but now that we are
calling qemu_guest_getrandom() in a reset hook, that happens.

I'm not sure exactly what the best approach here is, so I've cc'd
the migration and replay submaintainers. For the moment I'm dropping
this patchset from target-arm.next.

thanks
-- PMM

