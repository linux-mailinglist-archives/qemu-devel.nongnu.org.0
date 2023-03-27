Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EBA6C993E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 03:07:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgbIg-0001EU-MX; Sun, 26 Mar 2023 21:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pgbId-0001E3-BQ
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 21:05:27 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pgbIa-0007bE-FR
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 21:05:27 -0400
Received: by mail-ed1-x535.google.com with SMTP id r11so29418199edd.5
 for <qemu-devel@nongnu.org>; Sun, 26 Mar 2023 18:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1679879122;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DWx2XU9SCc8+ibWN1J7nQwo1yckURy/JAlNzfeSjrrQ=;
 b=HhX7KVw9CqblFlS5wJvuzQJ+KLFTYy1rIYYa/2Mojv3vu9Ty3fwIEyYpD6lnU5ZD2z
 WWBBKzD60BJbIWpfxolIjuAw93DJjKjsNIlVwbAWpFH5fSgJ3sdNpHPzxf5qkPDpEmHF
 KKuZvhMNqYH4vnAisv23vCszwYDu/z2+wljaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679879122;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DWx2XU9SCc8+ibWN1J7nQwo1yckURy/JAlNzfeSjrrQ=;
 b=6kBi0rBZzMynA0RCkEn0QTGT0GhW41zn3L8wD6EW3qkUMjMckJsuwSMUL7PGOzocXC
 r9T70mi1QpHykWMxv4PscrDBJ4X+PmMrQXAtlPtOqIqbNxkpT9tmxLwCgy4r7C0nDqlH
 WZGm8Pws+DF9ZP+57aVH6cQziKZSFSbFy/Kt2Lt8PDQt+7n9PjM0YYm+t5eE0Wl0wUAg
 eroK6xvn7oVwwkK54iv/KNT936Balek6Ru+ki2NSgZkghpH/6LoMzClRhpv2AggN9kmL
 5j+t3HzCWrfvMeDTjBP4f997W8PSgcZxkQqMJ8uTHsbjQGfyK3JgwMyoy8myvTZBQjQO
 vy8g==
X-Gm-Message-State: AAQBX9eKnd9fDup0RiNHiGgV8AZzEXwFC3jM2u0GFjdnJIBOj9PcicwZ
 3/Pdo4TcihYstWTmffqi8Ht36WZ1s6qlB9h3Has=
X-Google-Smtp-Source: AKy350YqRy77kx96mHe5T84sjexLN/UcNoz91flMyqY3Higgj+1Hd0a/uh6jvIYYf5gCWcLD0dxsMpMPKnSKjxTN6qU=
X-Received: by 2002:a17:906:a86:b0:933:f6e8:26d9 with SMTP id
 y6-20020a1709060a8600b00933f6e826d9mr4928615ejf.15.1679879121640; Sun, 26 Mar
 2023 18:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230326224426.3918167-1-ninad@linux.ibm.com>
In-Reply-To: <20230326224426.3918167-1-ninad@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 27 Mar 2023 01:05:09 +0000
Message-ID: <CACPK8XeZA8nqhgjH_SUDrk3A49dUqnKVONtj+QtcnjOsLUjvGQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] Add support for TPM devices over I2C bus
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: qemu-devel@nongnu.org, andrew@aj.id.au, stefanb@linux.ibm.com, 
 clg@kaod.org
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

Hi Ninad,

On Sun, 26 Mar 2023 at 22:44, Ninad Palsule <ninad@linux.ibm.com> wrote:
>
> Hello,
>
> I have incorporated review comments from Stefan. Please review.
>
> This drop adds support for the TPM devices attached to the I2C bus. It
> only supports the TPM2 protocol. You need to run it with the external
> TPM emulator like swtpm. I have tested it with swtpm.

Nice work. I tested these stop cedric's aspeed-8.0 qemu tree, using
the rainier machine and the openbmc dev-6.1 kernel.

We get this message when booting from a kernel:

[    0.582699] tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)
[    0.586361] tpm tpm0: A TPM error (256) occurred attempting the self test
[    0.586623] tpm tpm0: starting up the TPM manually

Do we understand why the error appears?

# grep -r . /sys/class/tpm/tpm0/pcr-sha256/ | sort -n -k 7 -t /
/sys/class/tpm/tpm0/pcr-sha256/0:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/1:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/2:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/3:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/4:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/5:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/6:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/7:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/8:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/9:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/10:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/11:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/12:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/13:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/14:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/15:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/16:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/17:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
/sys/class/tpm/tpm0/pcr-sha256/18:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
/sys/class/tpm/tpm0/pcr-sha256/19:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
/sys/class/tpm/tpm0/pcr-sha256/20:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
/sys/class/tpm/tpm0/pcr-sha256/21:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
/sys/class/tpm/tpm0/pcr-sha256/22:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
/sys/class/tpm/tpm0/pcr-sha256/23:0000000000000000000000000000000000000000000000000000000000000000

If I boot through the openbmc u-boot for the p10bmc machine, which
measures things into the PCRs:

[    0.556713] tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)

/ # grep -r . /sys/class/tpm/tpm0/pcr-sha256/ | sort -n -k 7 -t /
/sys/class/tpm/tpm0/pcr-sha256/0:AFA13691EFC7BC6E189E92347F20676FB4523302CB957DA9A65C3430C45E8BCC
/sys/class/tpm/tpm0/pcr-sha256/1:37F0F710A5502FAE6DB7433B36001FEE1CBF15BA2A7D6923207FF56888584714
/sys/class/tpm/tpm0/pcr-sha256/2:E21B703EE69C77476BCCB43EC0336A9A1B2914B378944F7B00A10214CA8FEA93
/sys/class/tpm/tpm0/pcr-sha256/3:E21B703EE69C77476BCCB43EC0336A9A1B2914B378944F7B00A10214CA8FEA93
/sys/class/tpm/tpm0/pcr-sha256/4:E21B703EE69C77476BCCB43EC0336A9A1B2914B378944F7B00A10214CA8FEA93
/sys/class/tpm/tpm0/pcr-sha256/5:E21B703EE69C77476BCCB43EC0336A9A1B2914B378944F7B00A10214CA8FEA93
/sys/class/tpm/tpm0/pcr-sha256/6:E21B703EE69C77476BCCB43EC0336A9A1B2914B378944F7B00A10214CA8FEA93
/sys/class/tpm/tpm0/pcr-sha256/7:E21B703EE69C77476BCCB43EC0336A9A1B2914B378944F7B00A10214CA8FEA93
/sys/class/tpm/tpm0/pcr-sha256/8:AE67485BD01E8D6FE0208C46C473940173F66E9C6F43C75ABB404375787E9705
/sys/class/tpm/tpm0/pcr-sha256/9:DB99D92EADBB446894CB0C062AEB673F60DDAFBC62BC2A9CA561A13B31E5357C
/sys/class/tpm/tpm0/pcr-sha256/10:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/11:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/12:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/13:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/14:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/15:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/16:0000000000000000000000000000000000000000000000000000000000000000
/sys/class/tpm/tpm0/pcr-sha256/17:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
/sys/class/tpm/tpm0/pcr-sha256/18:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
/sys/class/tpm/tpm0/pcr-sha256/19:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
/sys/class/tpm/tpm0/pcr-sha256/20:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
/sys/class/tpm/tpm0/pcr-sha256/21:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
/sys/class/tpm/tpm0/pcr-sha256/22:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
/sys/class/tpm/tpm0/pcr-sha256/23:0000000000000000000000000000000000000000000000000000000000000000

However on a clean boot into the TPM, the u-boot tpm commands fail:

ast# tpm info
tpm@2e v2.0: VendorID 0x1014, DeviceID 0x0001, RevisionID 0x01 [closed]
ast# tpINTERRUPT>
ast# tpm init
ast# tpm info
tpm@2e v2.0: VendorID 0x1014, DeviceID 0x0001, RevisionID 0x01 [open]
ast# tpm pcr_read 0 0x81000000
Error: 256
ast# md.l 0x81000000 16
81000000: 00000000 00000000 00000000 00000000    ................
81000010: 00000000 00000000 00000000 00000000    ................
81000020: 00000000 00000000 00000000 00000000    ................
81000030: 00000000 00000000 00000000 00000000    ................
81000040: 00000000 00000000 00000000 00000000    ................
81000050: 00000000 00000000                      ........

This doesn't need to block merging into qemu, as the model works fine
for pcr measurement and accessing under Linux. However it would be
good to work though these issues in case there's a modelling
discrepancy.



>
> I have refered to the work done by zhdaniel@meta.com but at the core
> level out implementation is different.
> https://github.com/theopolis/qemu/commit/2e2e57cde9e419c36af8071bb85392ad1ed70966
>
> Based-on: $MESSAGE_ID
>
>
> Ninad Palsule (3):
>   docs: Add support for TPM devices over I2C bus
>   tpm: Extend common APIs to support TPM TIS I2C
>   tpm: Add support for TPM device over I2C bus
>
>  docs/specs/tpm.rst      |  32 +++
>  hw/arm/Kconfig          |   1 +
>  hw/tpm/Kconfig          |   7 +
>  hw/tpm/meson.build      |   1 +
>  hw/tpm/tpm_tis.h        |   3 +
>  hw/tpm/tpm_tis_common.c |  36 ++-
>  hw/tpm/tpm_tis_i2c.c    | 540 ++++++++++++++++++++++++++++++++++++++++
>  hw/tpm/trace-events     |   6 +
>  include/hw/acpi/tpm.h   |  31 +++
>  include/sysemu/tpm.h    |   3 +
>  10 files changed, 652 insertions(+), 8 deletions(-)
>  create mode 100644 hw/tpm/tpm_tis_i2c.c
>
> --
> 2.37.2
>

