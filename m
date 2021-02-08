Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BCD3143EF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:37:56 +0100 (CET)
Received: from localhost ([::1]:45314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9G6N-0001oU-Hh
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:37:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9D6e-0004fR-QJ; Mon, 08 Feb 2021 15:26:01 -0500
Received: from mail-oo1-f50.google.com ([209.85.161.50]:43454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9D6d-0006Cw-BR; Mon, 08 Feb 2021 15:26:00 -0500
Received: by mail-oo1-f50.google.com with SMTP id x19so3737146ooj.10;
 Mon, 08 Feb 2021 12:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HGetua8XCBtAtwMqCDKtlbQAFFnu6x0ZjUXkCtwKkeA=;
 b=pToMKCNH/sZkq/ilUmB4PJ7b40Q43NVOuOZFiLXh+0Z0M1Ow55H++eheQISo3WmP6h
 H7I8RDUqvL/kc/+jN3ezR+6yOpNd6PjNxmz2rIlOW//DxiRsGXpOtTaEgKfFOz7UWcVC
 4irIHP5BVmX0k0Lh6YFP7s94zlhCmmd1BJNw4rwdlqw4a9eUNZuoC3DOcBMeGPQwRgFK
 HC9uKGCdlKFRB2kjzJdIO1gQm/poBcTIh6QHRcD78VED+zceJRMmeQvn5ttfFFpsSINH
 we6ZXi+F2C5yo8N2tkdPJl8eMNs9MUBQ/ja69I3BYvR6MllJCguu1oajl+/+00bTsjdN
 67qQ==
X-Gm-Message-State: AOAM532Lt5hcBcJXkGQylWqOv44Ak3YkFTF8aiYv0gmVgmUV02Pe6GDm
 zjsRpCJbyIjpEmwNeQvZz7xBFWrCfv7hdojRhrU=
X-Google-Smtp-Source: ABdhPJxSts55u4/dcZlcn6mjpEiTTRSIMwVKcGPdpGAQs0q6dTyulPDqvxvmTe1EOipfdb3Ot9QKZLJRAwcwhbA/z4c=
X-Received: by 2002:a4a:1881:: with SMTP id 123mr13573934ooo.59.1612815957487; 
 Mon, 08 Feb 2021 12:25:57 -0800 (PST)
MIME-Version: 1.0
References: <20210208193450.2689517-1-f4bug@amsat.org>
 <CAA8xKjUPrQkqdJR46Pa4U2ymBDL=KZHvVC9-CzQOR3OqOp8hPg@mail.gmail.com>
In-Reply-To: <CAA8xKjUPrQkqdJR46Pa4U2ymBDL=KZHvVC9-CzQOR3OqOp8hPg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 8 Feb 2021 21:25:46 +0100
Message-ID: <CAAdtpL4_aLOz0FQihjXh1J9yQkkcW_VKM+pfwkKZ3KceykiN+w@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/sdhci: Do not modify BlockSizeRegister if
 transaction in progress
To: Mauro Matteo Cascella <mcascell@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.161.50;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oo1-f50.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "open list:Block layer core" <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Li Qiang <liq3ea@163.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Prasad J Pandit <ppandit@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 8, 2021 at 8:59 PM Mauro Matteo Cascella
<mcascell@redhat.com> wrote:
> On Mon, Feb 8, 2021 at 8:35 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> >
> > Per the "SD Host Controller Simplified Specification Version 2.00"
> > spec. 'Table 2-4 : Block Size Register':
> >
> >   Transfer Block Size [...] can be accessed only if no
> >   transaction is executing (i.e., after a transaction has stopped).
> >   Read operations during transfers may return an invalid value,
> >   and write operations shall be ignored.
> >
...
> >
> > Fixes: CVE-2020-17380
> > Fixes: CVE-2020-25085
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> > Cc: Mauro Matteo Cascella <mcascell@redhat.com>
> > Cc: Alexander Bulekov <alxndr@bu.edu>
> > Cc: Alistair Francis <alistair.francis@wdc.com>
> > Cc: Prasad J Pandit <ppandit@redhat.com>
> > Cc: Bandan Das <bsd@redhat.com>
> >
> > RFC because missing Reported-by tags, launchpad/bugzilla links and
> > qtest reproducer. Sending for review meanwhile.
...
> For the above CVEs:
> Tested-by: Mauro Matteo Cascella <mcascell@redhat.com>

Thanks Mauro for testing. Do you know what tags I should add for the credit=
s?

Phil.

