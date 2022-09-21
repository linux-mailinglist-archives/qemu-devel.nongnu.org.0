Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2665BFF4D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 15:57:12 +0200 (CEST)
Received: from localhost ([::1]:44130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob0Du-0001Pi-Vy
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 09:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oazgL-0005MQ-Ih
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:22:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oazgI-0003zq-Va
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:22:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663766544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3/foKuq3LrMFu91ZFKCszSU+NXTM6Rf9iWUcrpxd2pU=;
 b=Eytg2zjVyLkG5115pnQddwgmBYZ25cud4VGpkif0jTWq2fGomh/5WzPa3f7vtHS5AYMofX
 u0TVwhedpqaTIqMMSVofoYdFq9Oykg0PUWWR4aW0CMEApiZBJt7qgAckHJmftwh63KjP7A
 vvCvdCR677MST7ypIrom5BxGJFfgbFE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-RrxkrozcNGaLOpsyUCKHwA-1; Wed, 21 Sep 2022 09:22:23 -0400
X-MC-Unique: RrxkrozcNGaLOpsyUCKHwA-1
Received: by mail-ej1-f69.google.com with SMTP id
 sb32-20020a1709076da000b0077faea20701so3115384ejc.10
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 06:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3/foKuq3LrMFu91ZFKCszSU+NXTM6Rf9iWUcrpxd2pU=;
 b=H5vyenHNEZESXg+TYIX/UXnaVytLQoq68eSGnwG+hmZDrUcHFM3CR2xxCgcjayke6C
 cXgxUi0e0o+LJWbJkweYyZGwq+HnGdW7HmANzrUPFopeTNpgrRTOOvwebNQpRPbw2Jzc
 1sqbbq/3uH4ztrgPeXMJaR1z+HhZwjIs0TxvCENkF0Jd9EMyJcYb405TCDeZNl7/v88M
 xEj10RPO3dHjA/Oh6QMSD/Cl8LFkxMrQ7AD+dyClJ0A3dV7WJ+1jQOmurIpZXj6ZQv//
 dwEXPN8LnwMAYc3C/4s2w4DUHJjcWwhP/DXTvErQF6F5sNNZRCrkznzHjVTRHtSYykRG
 IiYg==
X-Gm-Message-State: ACrzQf2MDrWLt0OIcDKGpXFMGvZJB62nwNP3UJ0yVMiJ4rkmxu4Nf4ZO
 CSHWoe7jNvoSlcP5oLNXfUZZ2FdN+IGFAfyTzDF69lN8+HUdg+juBryGDr74G4OpnZWLtYwYvwg
 AqvB7v5kYqGbR9Zg=
X-Received: by 2002:a05:6402:1d4f:b0:450:fd05:628c with SMTP id
 dz15-20020a0564021d4f00b00450fd05628cmr25168255edb.419.1663766540758; 
 Wed, 21 Sep 2022 06:22:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6v+p2CjnGXpxRu4mooXPo8reYgaZAccwLzcSiGhLaWsQlMobOjlDRPcMk7UokBDCIDfzT+oA==
X-Received: by 2002:a05:6402:1d4f:b0:450:fd05:628c with SMTP id
 dz15-20020a0564021d4f00b00450fd05628cmr25168226edb.419.1663766540452; 
 Wed, 21 Sep 2022 06:22:20 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 la17-20020a170907781100b007821f4bc328sm643970ejc.178.2022.09.21.06.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 06:22:19 -0700 (PDT)
Date: Wed, 21 Sep 2022 15:22:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org, Eric Auger
 <eric.auger@redhat.com>, Peter Xu <peterx@redhat.com>,
 wanghaibin.wang@huawei.com
Subject: Re: [PATCH v2] hw/acpi: Add ospm_status hook implementation for
 acpi-ged
Message-ID: <20220921152218.7b55dc76@redhat.com>
In-Reply-To: <CAFEAcA8jdjkZc24FqXBbw+LBJZ5HiCygqY3Y0S2TtmRzdx1P-A@mail.gmail.com>
References: <20220816094957.31700-1-zhukeqian1@huawei.com>
 <20220824170433.7ba675ca@redhat.com>
 <CAFEAcA8jdjkZc24FqXBbw+LBJZ5HiCygqY3Y0S2TtmRzdx1P-A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 20 Sep 2022 14:15:36 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 24 Aug 2022 at 16:04, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Tue, 16 Aug 2022 17:49:57 +0800
> > Keqian Zhu <zhukeqian1@huawei.com> wrote:
> >  
> > > Setup an ARM virtual machine of machine virt and execute qmp "query-acpi-ospm-status"
> > > causes segmentation fault with following dumpstack:
> > >  #1  0x0000aaaaab64235c in qmp_query_acpi_ospm_status (errp=errp@entry=0xfffffffff030) at ../monitor/qmp-cmds.c:312
> > >  #2  0x0000aaaaabfc4e20 in qmp_marshal_query_acpi_ospm_status (args=<optimized out>, ret=0xffffea4ffe90, errp=0xffffea4ffe88) at qapi/qapi-commands-acpi.c:63
> > >  #3  0x0000aaaaabff8ba0 in do_qmp_dispatch_bh (opaque=0xffffea4ffe98) at ../qapi/qmp-dispatch.c:128
> > >  #4  0x0000aaaaac02e594 in aio_bh_call (bh=0xffffe0004d80) at ../util/async.c:150
> > >  #5  aio_bh_poll (ctx=ctx@entry=0xaaaaad0f6040) at ../util/async.c:178
> > >  #6  0x0000aaaaac00bd40 in aio_dispatch (ctx=ctx@entry=0xaaaaad0f6040) at ../util/aio-posix.c:421
> > >  #7  0x0000aaaaac02e010 in aio_ctx_dispatch (source=0xaaaaad0f6040, callback=<optimized out>, user_data=<optimized out>) at ../util/async.c:320
> > >  #8  0x0000fffff76f6884 in g_main_context_dispatch () at /usr/lib64/libglib-2.0.so.0
> > >  #9  0x0000aaaaac0452d4 in glib_pollfds_poll () at ../util/main-loop.c:297
> > >  #10 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:320
> > >  #11 main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:596
> > >  #12 0x0000aaaaab5c9e50 in qemu_main_loop () at ../softmmu/runstate.c:734
> > >  #13 0x0000aaaaab185370 in qemu_main (argc=argc@entry=47, argv=argv@entry=0xfffffffff518, envp=envp@entry=0x0) at ../softmmu/main.c:38
> > >  #14 0x0000aaaaab16f99c in main (argc=47, argv=0xfffffffff518) at ../softmmu/main.c:47
> > >
> > > Fixes: ebb62075021a ("hw/acpi: Add ACPI Generic Event Device Support")
> > > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>  
> >
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>  
> 
> I notice this doesn't seem to have gone in yet -- whose tree is it
> going to go via?

I'd guess ARM tree (due to almost sole user virt-arm).
(there are toy users like microvm and new loongarch)

> 
> thanks
> -- PMM
> 


