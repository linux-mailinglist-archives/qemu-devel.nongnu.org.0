Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1D652B0E6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 05:49:04 +0200 (CEST)
Received: from localhost ([::1]:32922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrAgI-0004Fe-W8
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 23:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nrAeR-000395-DM
 for qemu-devel@nongnu.org; Tue, 17 May 2022 23:47:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nrAeN-000151-J1
 for qemu-devel@nongnu.org; Tue, 17 May 2022 23:47:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652845621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XuBmpTm2TS24iWmTuOLtDn/eZlsp6l4G6rpOymGp5Aw=;
 b=POXE1rwT6+k1LK4TSiAUBz0VVCE77wruIVbRoobcZAyFsx9BCHuZJdY4vVT6yzWUIKPn48
 1l4HzdlawOLgWYk5KRCFivK4eVjss1qVsLlGUuZ2aHFxdIUsRe82gj8IcPtz19IGValxvF
 cKKu41h0Q86qR8CU3rcU/JcBgbtUFGQ=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-b7qcz8fWPYSfn2KUPyR7hg-1; Tue, 17 May 2022 23:47:00 -0400
X-MC-Unique: b7qcz8fWPYSfn2KUPyR7hg-1
Received: by mail-io1-f72.google.com with SMTP id
 u18-20020a5d8712000000b0064c7a7c497aso13648657iom.18
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 20:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=XuBmpTm2TS24iWmTuOLtDn/eZlsp6l4G6rpOymGp5Aw=;
 b=q2WGELxoqvANUzCznvSsjrP37t6CYHTpsEwuP682sCe61KpPgwz+2m0NDRBtxUBzZS
 T3bK3Whcqc1e5DJyPmAMasaUaiIUzXarjRVqvUzr5kTaUe7CIFXGRIuXSv0HhUunPaRP
 2uSHUgssfoDDqib4GJNkXvCEKkQwl5rGTW+Q1zsVO/5dceTSgiOh5KWdNZRwpw0PJm7D
 AbJl6RbU/6t3IidEPt+nHd1Yj/9mzRwYeTydX/Un5cx+ejQEJSqSQzbzbDcE8D4WhCUa
 1WZaiZuAUFM8NJyJOJTkgJO1pKtuOjLB/IbTFi1lzCBL5y9BrRGpkmcYmuflTsfxC1Es
 dGOQ==
X-Gm-Message-State: AOAM531bzqCv8hBsl3GWqYkpq5lkupGWfrO559u+YgbN+WbvXqB4/egD
 +kyM3IDc0pheqrS4NgtkSp8bszQflx9nR1dyR2hgkm89dL2s3yf7mBLCiLrs8kmk+219cDnTVHd
 MdHfOxPzGOa17R80=
X-Received: by 2002:a6b:ca44:0:b0:657:b54a:5c53 with SMTP id
 a65-20020a6bca44000000b00657b54a5c53mr11686886iog.108.1652845619536; 
 Tue, 17 May 2022 20:46:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1FNRvPjhHbyMyWGLM9jH3n56GineRkSHlSaWOKqbgzdCffVqxVWR1QnOX0qr4oKJUCEFHqA==
X-Received: by 2002:a6b:ca44:0:b0:657:b54a:5c53 with SMTP id
 a65-20020a6bca44000000b00657b54a5c53mr11686869iog.108.1652845619085; 
 Tue, 17 May 2022 20:46:59 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f20-20020a02a114000000b0032e189e88bcsm255175jag.17.2022.05.17.20.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 20:46:58 -0700 (PDT)
Date: Tue, 17 May 2022 21:46:56 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Juan Quintela <quintela@redhat.com>, Avihai Horon <avihaih@nvidia.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>, Cornelia
 Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti
 Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 4/9] vfio/migration: Skip pre-copy if dirty page
 tracking is not supported
Message-ID: <20220517214656.62fc10f4.alex.williamson@redhat.com>
In-Reply-To: <20220517173937.GW1343366@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-5-avihaih@nvidia.com>
 <87h75psowp.fsf@secure.mitica>
 <20220516142200.57003872.alex.williamson@redhat.com>
 <20220516230832.GP1343366@nvidia.com>
 <20220517100045.27a696c9.alex.williamson@redhat.com>
 <20220517160844.GV1343366@nvidia.com>
 <20220517112232.7a9f8be9.alex.williamson@redhat.com>
 <20220517173937.GW1343366@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 17 May 2022 14:39:37 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, May 17, 2022 at 11:22:32AM -0600, Alex Williamson wrote:
> 
> > > > It seems like a better solution would be to expose to management
> > > > tools that the VM contains a device that does not support the
> > > > pre-copy phase so that downtime expectations can be adjusted.    
> > > 
> > > I don't expect this to be a real use case though..
> > > 
> > > Remember, you asked for this patch when you wanted qemu to have good
> > > behavior when kernel support for legacy dirty tracking is removed
> > > before we merge v2 support.  
> > 
> > Is wanting good behavior a controversial point?  Did we define this as
> > the desired good behavior?  Ref?    
> 
> As I said, this was intended as a NOP, which is what I thought we
> agreed to. Missing the SLA checking that existed before seems like
> something to fix in this patch.

But even if we have the SLA check, how does a management tool know that
pre-copy will be skipped and that the downtime needs to account for
that?  The current solution is obviously non-optimal, it was mainly
meant for backwards compatibility, but this seems like a fail faster
solution, with less useless work, but also providing less indication
how to configure the migration to succeed.

> This is the discussion thread:
> 
> https://lore.kernel.org/kvm/20220324231159.GA11336@nvidia.com/
> 
>  "I guess I was assuming that enabling v2 migration in QEMU was dependent
>   on the existing type1 dirty tracking because it's the only means we
>   have to tell QEMU that all memory is perpetually dirty when we have a
>   DMA device.  Is that not correct?"

Doesn't sound like me asking for this patch so much as trying to figure
out how to support migration without DMA dirty tracking, and after the
above comment was a concern whether we lock ourselves into a dirty
tracking requirement in the iommufd type1 compatibility interface if we
rely on this type1 feature.  You had spit-balled that QEMU could skip
pre-copy, but this all needs to be vetted with migration folks and
management tools.

> The only point was to prepare qemu for kernel's that don't support the
> legacy dirty tracking API but do have a v2 migration interface. IIRC
> something undesired happens if you do that right now.

Per this patch, the container requires dirty tracking or we add a
blocker and can't migrate the device.
 
> We could also just dirty all memory in qemu and keep it exactly the
> same so every SLA detail works. Or completely block pre-copy based
> flows.
> 
> It it not intended to be a useful configuration, this is just covering
> off backwards compat issues - so I'm not keen to do a bunch of
> management work to support it.

Are we then deemphasizing the vfio compatibility support in iommufd?
If we really don't want to put effort towards backwards compatibility,
should migration support only be enabled with native iommufd support?
Thanks,

Alex


