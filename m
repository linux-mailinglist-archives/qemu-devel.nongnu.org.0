Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25715BCD08
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 15:24:49 +0200 (CEST)
Received: from localhost ([::1]:40416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaGlU-0002ZW-PB
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 09:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaGLp-000595-2u
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 08:58:17 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:42881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaGLn-0002Da-LU
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 08:58:16 -0400
Received: by mail-ua1-f46.google.com with SMTP id i17so8384387uaq.9
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 05:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=UzGIqKfFliZ4PVwE+NMmxhze/aS8nod2JcqYrg0mLeA=;
 b=cI1tBSRCItxwtUBLmOv4FyY5BuHB0ProC7pG1Uy2AyIzK/nC4WsUSwEla6A1MO6AIx
 sPI/b650mGFDJu3V/8EiPgNsAyDt5pQAkKR3nWHwNPsT1Rp++mX4TMpg15X3iXYTcRS5
 +R33ExnaCfXztW+k4he0qAK/HhCH4oIp3FMLlfVptSED2e1XzJvLnvQxgwKWxMrrD3DC
 rXIPRocIDbe2RPaVGRHZMqKx173cI+FqKKDw7o40n5IGNn+37iEs5NrqyznH8gyJw8Jg
 pVJ6gZQ4nhO4MqNxBhh2STVQsIvtKUGovq9igCblWWXPQKwF+5qZgmQ4QmkXNQ39NOhT
 weSQ==
X-Gm-Message-State: ACrzQf29MyMcF3vyCqE5VGtIPr3SaVCI3OwK+tj7iuQooy9RW0CuotAo
 jAon3pKj4ImRuWKR3bKZwSQRPJKb/cjoBgxgNEg=
X-Google-Smtp-Source: AMsMyM7aK5qtn1ItsfgzBOmCoRa3VR0l1/0n9l7DMvqobm7j6e5rzjg6vohO3mz9PltoIN9/udsCP6zXuI9ymdNwd5E=
X-Received: by 2002:ab0:c07:0:b0:3ae:8f1f:2c53 with SMTP id
 a7-20020ab00c07000000b003ae8f1f2c53mr5764819uak.17.1663592294691; Mon, 19 Sep
 2022 05:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220530170739.19072-1-avihaih@nvidia.com>
 <20220530170739.19072-9-avihaih@nvidia.com>
 <efba4434-4044-f7ff-0f22-a5e39f48560f@huawei.com>
 <20220919055044.47372c9f.alex.williamson@redhat.com>
In-Reply-To: <20220919055044.47372c9f.alex.williamson@redhat.com>
Date: Mon, 19 Sep 2022 14:58:03 +0200
Message-ID: <CAAdtpL4__8op6ms_s1Q698ChE8NFSTbenJt5xggQeO=zg0+wOA@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] vfio/migration: Remove VFIO migration protocol v1
To: Alex Williamson <alex.williamson@redhat.com>,
 Avihai Horon <avihaih@nvidia.com>
Cc: liulongfang <liulongfang@huawei.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
 Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas <yishaih@nvidia.com>, 
 Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, 
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, 
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 jiangkunkun@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.222.46;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ua1-f46.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Mon, Sep 19, 2022 at 1:57 PM Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> On Mon, 19 Sep 2022 16:35:49 +0800
> liulongfang <liulongfang@huawei.com> wrote:
>
> > On 2022/5/31 1:07, Avihai Horon Wrote:
> > > Now that v2 protocol implementation has been added, remove the
> > > deprecated v1 implementation.
> > > "struct vfio_device_migration_info" still exists in vfio.h,
> > why does qemu need to delete v1 implementation?
>
> It never progressed past experimental support, upstream never committed
> to support it, it's dead code relative to the kernel specification now.

Avihai, do you mind adding Alex explanation in your commit description please?

> Thanks,
>
> Alex
>
>

