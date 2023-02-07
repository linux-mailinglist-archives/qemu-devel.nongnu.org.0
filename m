Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D50168E325
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 22:50:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPVqe-0008TW-VR; Tue, 07 Feb 2023 16:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPVqd-0008TI-1v
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:49:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPVqb-0008Tl-Fx
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675806592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iikwuz+oiUrSrO6cEjnOmr7Jimu4wmHc20ogMd5zKws=;
 b=FUF4Aeal/XAlaJBZJeOJ2bfa4EjmaOSkc9Qf7FtfoOOMW7Np0hIYP88G0kveCrJTeiRXRs
 BfOjpiqWJvXTUyJUdIKUxSnG2hW1jPxQ021rMJ/PcdMnm4hFP8pVLDdnAmAkwudOzcXvG4
 5qaKaYFc2tVFuNpF1uAzTOHMZsTFMAs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-wnN1jwnKPt-HhbXbdd9-NA-1; Tue, 07 Feb 2023 16:49:34 -0500
X-MC-Unique: wnN1jwnKPt-HhbXbdd9-NA-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg25-20020a05600c3c9900b003da1f6a7b2dso72145wmb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 13:49:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iikwuz+oiUrSrO6cEjnOmr7Jimu4wmHc20ogMd5zKws=;
 b=Md5gtGiEWocR3AkRxWn4iNF/jfzCpNjgawJON335XOHTLIgrvEeoc4aFyNlmYM7g14
 wYFRCqR48AbQGZ0jr7rF3jDMs0uZSP6mY2Yg2OEHI0GY6gWBwHqAf7VjGQqQkgf+8ld2
 RMHYMcovNoXsW7zgOTWwHW+mkOuEssC7gNRY61nF7gnTNeIf4vVXjbICGNNK5Xe06e5T
 KoIbWyRQ03+DEXN22OLApXmNVDC/ZstGC2tB5PA7BSE7fzTYkxAaIlTxQgDkmrrKvuZR
 O2jikxD4MdO7sPbfLUYwg8G9KqqiDGvAvSjZGcu9hmBT6WEyacbMunOQbh7JsRMwQ/Xb
 zSCQ==
X-Gm-Message-State: AO0yUKUW9QjrkmY/6qFP0SqQn2o81PDASZmXGaQJcoEc7c7cRLs1kh6X
 uSwtKdqf4lQovli2E3GripIenmSpHOmUMN26Eixo42iLigFad8h6+/TA9SY/cFiQw6TcZs9Gstz
 NdUTC6eRdSD+jV2g=
X-Received: by 2002:a05:600c:43c4:b0:3dd:1b76:347f with SMTP id
 f4-20020a05600c43c400b003dd1b76347fmr4358773wmn.18.1675806573460; 
 Tue, 07 Feb 2023 13:49:33 -0800 (PST)
X-Google-Smtp-Source: AK7set87JhzG51j5HgjzixTE7mICm4ieXyt8EaSYShTfsIUz/bMhJPRu+qiifn1BOlH1bKEfM3e34Q==
X-Received: by 2002:a05:600c:43c4:b0:3dd:1b76:347f with SMTP id
 f4-20020a05600c43c400b003dd1b76347fmr4358762wmn.18.1675806573243; 
 Tue, 07 Feb 2023 13:49:33 -0800 (PST)
Received: from redhat.com ([2.52.8.17]) by smtp.gmail.com with ESMTPSA id
 s16-20020adff810000000b002c3dc4131f5sm9847244wrp.18.2023.02.07.13.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 13:49:32 -0800 (PST)
Date: Tue, 7 Feb 2023 16:49:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, thuth@redhat.com, david.daney@fungible.com
Subject: Re: [PATCH] virtio-rng-pci: fix transitional migration compat for
 vectors
Message-ID: <20230207164849-mutt-send-email-mst@kernel.org>
References: <20230207174944.138255-1-dgilbert@redhat.com>
 <659136d2-206b-0146-086a-09388c96ce45@linaro.org>
 <Y+KZGc7LvIAqdZqN@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+KZGc7LvIAqdZqN@work-vm>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Feb 07, 2023 at 06:31:53PM +0000, Dr. David Alan Gilbert wrote:
> * Philippe Mathieu-Daudé (philmd@linaro.org) wrote:
> > On 7/2/23 18:49, Dr. David Alan Gilbert (git) wrote:
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > 
> > > In bad9c5a5166fd5e3a892b7b0477cf2f4bd3a959a I fixed the virito-rng-pci
> > 
> > Typo "virtio-rng-pci".
> 
> I've made that typo SO many times...



Add this in .vimrc

ab virito virtio

and never make this mistake again ... as long as you use vim ;)


> > > migration compatibility, but it was discovered that we also need to fix
> > > the other aliases of the device for the transitional cases.
> > > 
> > > Fixes: 9ea02e8f1 ('virtio-rng-pci: Allow setting nvectors, so we can use MSI-X')
> > > bz: https://bugzilla.redhat.com/show_bug.cgi?id=2162569
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > ---
> > >   hw/core/machine.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index b5cd42cd8c..4627b274d9 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -49,6 +49,8 @@ const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
> > >   GlobalProperty hw_compat_7_1[] = {
> > >       { "virtio-device", "queue_reset", "false" },
> > >       { "virtio-rng-pci", "vectors", "0" },
> > > +    { "virtio-rng-pci-transitional", "vectors", "0" },
> > > +    { "virtio-rng-pci-non-transitional", "vectors", "0" },
> > 
> > Ouch :(
> > 
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Thanks!
> 
> Dave
> 
> > 
> > >   };
> > >   const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


