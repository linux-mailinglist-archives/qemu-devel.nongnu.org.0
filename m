Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD6D6CA1A5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 12:50:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgkPl-0004ka-RN; Mon, 27 Mar 2023 06:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pgkPi-0004kR-TN
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 06:49:22 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pgkPg-0000kP-KX
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 06:49:22 -0400
Received: by mail-ed1-x534.google.com with SMTP id x3so34066934edb.10
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 03:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1679914159;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7gx+XVdky54rBIVMsQPfmaCbg+reP3+dnh35C+kFRD0=;
 b=Ccjw38MErdEFnZz4D4tYM3k3KH2EVwHBdTvXeYYFMUNrqevpfF6QaGxrIE8PDeGWRF
 Pg0OZlJlp4j5oAs54xYDFKRathSWXeHbZQRMxGzvT8v75obJpxqcWOGZbsK3Ux2AYere
 +ivPr5Cb7TzMFBkUQVeSIW429aFjZ7W0BtPvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679914159;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7gx+XVdky54rBIVMsQPfmaCbg+reP3+dnh35C+kFRD0=;
 b=5n2oK4SWE9RCsTGKv8NEv+33bUcvOXZ3zFWKazg703F2L6qjysB6cfEYklNBODBrDH
 4Q9B5NWGx+L7GwHSox78l+V116u1GQ7KGJx9pB7/9jiyff9AM5v9+0PbPUzS1HaJnV8v
 wqOlbTEu1BIv6Fsv6W7NOIRAkxkvzlLjNvLbel3br45S7lq6obA2jCQSFIlxuoMLscv7
 a7kukIbmiuZCw1Aa5jHtuJr4iB5/hfGss4Y72EmM7CigzIpgYcXQfgPsJBZGbuOXD3WC
 sS75R+5QTmRKF56LNs0Dk4ZG4lcfIsstZtH4eXKFUNsBkHo+kQf2pjkEymJ+1c5HePdf
 Lluw==
X-Gm-Message-State: AAQBX9d933bw7skLWn4tA6C3q/lwEvH+SJJiQwQZHJuOtwZJM01Y/9Cd
 4o24zK4bjGzEGbUXwlI0wcpNO0P15Ib2HghtaEc=
X-Google-Smtp-Source: AKy350baA4mu8r8OkeyVm+FOaHD0EsEb5ss2Tt+8nFnQ5OGV6pxQ0ZP/NVWWgDKfwXebgg2pQVPDtlpf5NWW1No1UtU=
X-Received: by 2002:a50:9e8e:0:b0:4fa:4bc4:ad5b with SMTP id
 a14-20020a509e8e000000b004fa4bc4ad5bmr5875444edf.6.1679914158791; Mon, 27 Mar
 2023 03:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230326224426.3918167-1-ninad@linux.ibm.com>
 <CACPK8XeZA8nqhgjH_SUDrk3A49dUqnKVONtj+QtcnjOsLUjvGQ@mail.gmail.com>
 <a9ba4cf8-cd4d-2038-6328-66f61ad3ed70@linux.vnet.ibm.com>
 <CACPK8XfrM0cCdW7a2+Leiw8dD2RAc8Xakx4ptdE5wdtjp=P27Q@mail.gmail.com>
 <f633240f-f8b5-bb7c-6967-7408837181fc@kaod.org>
In-Reply-To: <f633240f-f8b5-bb7c-6967-7408837181fc@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 27 Mar 2023 10:49:06 +0000
Message-ID: <CACPK8XfhjYoCVeL8p66C0J15-VQs9WAcmJh5gPT1f2CGKo9SqQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] Add support for TPM devices over I2C bus
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Ninad Palsule <ninad@linux.vnet.ibm.com>,
 Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org, 
 andrew@aj.id.au, stefanb@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x534.google.com
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

On Mon, 27 Mar 2023 at 08:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> >>> However on a clean boot into the TPM, the u-boot tpm commands fail:
> >>>
> >>> ast# tpm info
> >>> tpm@2e v2.0: VendorID 0x1014, DeviceID 0x0001, RevisionID 0x01 [close=
d]
> >>> ast# tpINTERRUPT>
> >>> ast# tpm init
> >>> ast# tpm info
> >>> tpm@2e v2.0: VendorID 0x1014, DeviceID 0x0001, RevisionID 0x01 [open]
> >>> ast# tpm pcr_read 0 0x81000000
> >>> Error: 256
> >>> ast# md.l 0x81000000 16
> >>> 81000000: 00000000 00000000 00000000 00000000    ................
> >>> 81000010: 00000000 00000000 00000000 00000000    ................
> >>> 81000020: 00000000 00000000 00000000 00000000    ................
> >>> 81000030: 00000000 00000000 00000000 00000000    ................
> >>> 81000040: 00000000 00000000 00000000 00000000    ................
> >>> 81000050: 00000000 00000000                      ........
> >>>
> >>> This doesn't need to block merging into qemu, as the model works fine
> >>> for pcr measurement and accessing under Linux. However it would be
> >>> good to work though these issues in case there's a modelling
> >>> discrepancy.
> >>
> >>
> >> Yes, Please provide me details on how to reproduce it. I will take a l=
ook.
> >
> > This is the buildroot tree I've been using for testing:
> >
> > https://github.com/shenki/buildroot/commits/ast2600-tpm
> >
> > git clone https://github.com/shenki/buildroot -b ast2600-tpm
> > cd buildroot
> > make O=3Dast2600evb aspeed_ast2600evb_defconfig
>
> I have pushed binaries here also :
>
>    https://github.com/legoater/qemu-aspeed-boot/tree/master/images/ast260=
0-evb/buildroot-2023.02-tpm

Thank you!

The non-zero PCRs I see with this are:

#  grep -r . /sys/class/tpm/tpm0/pcr-sha256/ | sort -n -k 7 -t /
/sys/class/tpm/tpm0/pcr-sha256/0:B804724EA13F52A9072BA87FE8FDCC497DFC9DF9AA=
15B9088694639C431688E0
/sys/class/tpm/tpm0/pcr-sha256/1:37F0F710A5502FAE6DB7433B36001FEE1CBF15BA2A=
7D6923207FF56888584714
/sys/class/tpm/tpm0/pcr-sha256/2:E21B703EE69C77476BCCB43EC0336A9A1B2914B378=
944F7B00A10214CA8FEA93
/sys/class/tpm/tpm0/pcr-sha256/3:E21B703EE69C77476BCCB43EC0336A9A1B2914B378=
944F7B00A10214CA8FEA93
/sys/class/tpm/tpm0/pcr-sha256/4:E21B703EE69C77476BCCB43EC0336A9A1B2914B378=
944F7B00A10214CA8FEA93
/sys/class/tpm/tpm0/pcr-sha256/5:E21B703EE69C77476BCCB43EC0336A9A1B2914B378=
944F7B00A10214CA8FEA93
/sys/class/tpm/tpm0/pcr-sha256/6:E21B703EE69C77476BCCB43EC0336A9A1B2914B378=
944F7B00A10214CA8FEA93
/sys/class/tpm/tpm0/pcr-sha256/7:E21B703EE69C77476BCCB43EC0336A9A1B2914B378=
944F7B00A10214CA8FEA93
/sys/class/tpm/tpm0/pcr-sha256/8:C840364040A0F98631A48A4C401C567226BFE5A2A3=
0B958F1800E4849A140F69
/sys/class/tpm/tpm0/pcr-sha256/9:9D00428C528120A3F2D0D8CB0EB5D036D87C0D0F8D=
2990B8C1F12DEFAE3890C7

They seem to be stable across boots, which is good! We could use these
images and that pcr0 value for an avocado test.

Perhaps we could add an init script that binds the driver and prints
the value to the console to save having to log in.

