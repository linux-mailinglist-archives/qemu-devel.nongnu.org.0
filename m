Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292F56C9D1D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 10:04:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pghq0-0005Au-8N; Mon, 27 Mar 2023 04:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pghpx-0005Ag-AT
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 04:04:17 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pghpu-0001Xe-Rr
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 04:04:17 -0400
Received: by mail-ed1-x535.google.com with SMTP id cn12so32254433edb.4
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 01:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1679904253;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g3QK1o8UP1R3SE/VdMbvDjMwbZASFx9O4UbuL3O8EZo=;
 b=BdBjoGzCeYQYixfm82xE5stUSfVtoL8EkmRTL8jtPUn8XcrQMDZpmZctJHpbqcHpZL
 V+7QWJoaJhAgObnLzON5MfMPc4XRiSHH7cpRoNPn4GdJLG70DbEp2Pe3QqqAiuXyL/Jy
 QvKjngr2y/TJtmDeZFOikD4ejV1l/COvoKy/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679904253;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g3QK1o8UP1R3SE/VdMbvDjMwbZASFx9O4UbuL3O8EZo=;
 b=z591XfcyBx9hYxIDf4jok2e7U2h5Ntsw4G1HZf59uGKiBqmo1Rgb/QKYkGLh7fSjDJ
 tQJ9Y9wRhQ9dNamRdemWrUFKY2fBjG0GkMLZng7F8c7uNfKcZz1RqzShM7CXCLCX1IB2
 YXmXPPK8nBOClhJUJ27LmOUfApv8F86YDDqFnF2snQYRdSl5mb+zFB3cryNnHGNvTfi0
 gOu6O9mWxVQk0gZ4f7+WUwjzky9RGmPooNY9KeFFsqDabvQ+4OzzYDQuMhhQ5wNsljLl
 BCmepeA/62zTP/+pi8nUbi1Brmz84C45Oi1CfI53nir1doOL/D/ZNady6MDOz9d3ZPCi
 hlDA==
X-Gm-Message-State: AAQBX9cYaE+p9kYbJ6f1y3jt+oBBUpsychEX2U2BunOXrcbLBZuPals0
 BS7RdnIgGCUdMWyo8z/l46P3ZVW2AB4+6WMx9/U=
X-Google-Smtp-Source: AKy350ZWHowdWLJILOGQ1OwCASMvx8U9H+TygXukQNr3GFRWbL6+DXsByIXdeceaebw/SiFHAxC2Cg3UPUyufLEBCIs=
X-Received: by 2002:a50:cd47:0:b0:4fc:532e:215d with SMTP id
 d7-20020a50cd47000000b004fc532e215dmr5394247edj.6.1679904253004; Mon, 27 Mar
 2023 01:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230326224426.3918167-1-ninad@linux.ibm.com>
 <CACPK8XeZA8nqhgjH_SUDrk3A49dUqnKVONtj+QtcnjOsLUjvGQ@mail.gmail.com>
 <a9ba4cf8-cd4d-2038-6328-66f61ad3ed70@linux.vnet.ibm.com>
In-Reply-To: <a9ba4cf8-cd4d-2038-6328-66f61ad3ed70@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 27 Mar 2023 08:04:00 +0000
Message-ID: <CACPK8XfrM0cCdW7a2+Leiw8dD2RAc8Xakx4ptdE5wdtjp=P27Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] Add support for TPM devices over I2C bus
To: Ninad Palsule <ninad@linux.vnet.ibm.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org, andrew@aj.id.au,
 stefanb@linux.ibm.com, clg@kaod.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, 27 Mar 2023 at 03:52, Ninad Palsule <ninad@linux.vnet.ibm.com> wrote:
>
> Hi Joel,
>
> On 3/26/23 8:05 PM, Joel Stanley wrote:
> > Hi Ninad,
> >
> > On Sun, 26 Mar 2023 at 22:44, Ninad Palsule <ninad@linux.ibm.com> wrote:
> >> Hello,
> >>
> >> I have incorporated review comments from Stefan. Please review.
> >>
> >> This drop adds support for the TPM devices attached to the I2C bus. It
> >> only supports the TPM2 protocol. You need to run it with the external
> >> TPM emulator like swtpm. I have tested it with swtpm.
> > Nice work. I tested these stop cedric's aspeed-8.0 qemu tree, using
> > the rainier machine and the openbmc dev-6.1 kernel.
> >
> > We get this message when booting from a kernel:
> >
> > [    0.582699] tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)
> > [    0.586361] tpm tpm0: A TPM error (256) occurred attempting the self test
> > [    0.586623] tpm tpm0: starting up the TPM manually
> >
> > Do we understand why the error appears?
>
>
> Yes, As per kernel code this is an expected error for some emulators.
>
> On swtpm emulator, It returns TPM2_RC_INITIALIZE if emulator is not
> initialized. I searched it in swtpm and it indicated that selftest
> requested before it is initialized. I meant to ask Stefan but busy with
> the review comments.

The swtpm man page mentions some flags we can set. Perhaps they would help?

       --flags [not-need-init]
[,startup-clear|startup-state|startup-deactivated|startup-none]


>
> This function comment in the driver mentioned below indicate that this
> case possible with emulators.
>
> /**
>   * tpm2_startup - turn on the TPM
>   * @chip: TPM chip to use
>   *
>   * Normally the firmware should start the TPM. This function is
> provided as a
>   * workaround if this does not happen. A legal case for this could be for
>   * example when a TPM emulator is used.
>   *
>   * Return: same as tpm_transmit_cmd()
>   */
>
> static int tpm2_startup(struct tpm_chip *chip)
>

> > However on a clean boot into the TPM, the u-boot tpm commands fail:
> >
> > ast# tpm info
> > tpm@2e v2.0: VendorID 0x1014, DeviceID 0x0001, RevisionID 0x01 [closed]
> > ast# tpINTERRUPT>
> > ast# tpm init
> > ast# tpm info
> > tpm@2e v2.0: VendorID 0x1014, DeviceID 0x0001, RevisionID 0x01 [open]
> > ast# tpm pcr_read 0 0x81000000
> > Error: 256
> > ast# md.l 0x81000000 16
> > 81000000: 00000000 00000000 00000000 00000000    ................
> > 81000010: 00000000 00000000 00000000 00000000    ................
> > 81000020: 00000000 00000000 00000000 00000000    ................
> > 81000030: 00000000 00000000 00000000 00000000    ................
> > 81000040: 00000000 00000000 00000000 00000000    ................
> > 81000050: 00000000 00000000                      ........
> >
> > This doesn't need to block merging into qemu, as the model works fine
> > for pcr measurement and accessing under Linux. However it would be
> > good to work though these issues in case there's a modelling
> > discrepancy.
>
>
> Yes, Please provide me details on how to reproduce it. I will take a look.

This is the buildroot tree I've been using for testing:

https://github.com/shenki/buildroot/commits/ast2600-tpm

git clone https://github.com/shenki/buildroot -b ast2600-tpm
cd buildroot
make O=ast2600evb aspeed_ast2600evb_defconfig

I launch it with this qemu commandline:

swtpm socket --tpmstate dir=$XDG_RUNTIME_DIR --ctrl
type=unixio,path=$XDG_RUNTIME_DIR/swtpm-socket --tpm2

qemu-system-arm -M ast2600-evb -nographic -drive
file=ast2600evb/images/flash.img,if=mtd,format=raw -chardev
socket,id=chrtpm,path=$XDG_RUNTIME_DIR/swtpm-socket -tpmdev
emulator,id=tpm0,chardev=chrtpm -device
tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e

If you want to reproduce the u-boot behaviour, press any key to
interrupt the boot.

Booting this way, you can also test the u-boot behaviour. Once you're
in userspace:

# echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device
[   13.637081] tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)
[   13.665239] i2c i2c-12: new_device: Instantiated device tpm_tis_i2c at 0x2e

# cat /sys/class/tpm/tpm0/pcr-sha256/0
FE9A732EAA7842D77DEECFC1DC610EBEA9414BFC39BEEBC8D2F071CF030FA592

