Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7036986D0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 22:02:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOus-0007Rp-RJ; Wed, 15 Feb 2023 16:02:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSOum-0007QX-9C
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 16:02:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSOuj-0001Q7-Na
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 16:02:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676494924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TnJ3fSSd8S6K2YvOX3X1SKBTQibopmzhwZOmYFfZ8cA=;
 b=MJbCcuvqr8bulOGaA5yKlMjEh56h+oItvKbG5OkhRAI8/xp5CXesYCacx33oOBv7EDolk+
 MsER3aNejvvVc2QlGRN0IWBtTxgERYoh0TGnCt4I5lwWBmMrzQ3rZypXpiceHuDO6Z7EYa
 mneNZt80vAQQ5uExSmrjo5OTfat/eRA=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-223-19KnK4yNPLeGZATZjmU9rQ-1; Wed, 15 Feb 2023 16:02:03 -0500
X-MC-Unique: 19KnK4yNPLeGZATZjmU9rQ-1
Received: by mail-io1-f72.google.com with SMTP id
 n3-20020a056602340300b0073e7646594aso6248058ioz.8
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 13:02:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TnJ3fSSd8S6K2YvOX3X1SKBTQibopmzhwZOmYFfZ8cA=;
 b=unPbLqctbnQxd/rnlc947nonOsa3TIJLoJ17Dvx+MhV8h9g34zuXFy/rIMUnUnr/v+
 GSf+16A5jf/TjeXpstQ0RYYXmeVzhSu2iIZJKwHhERBoaTjn01SJsG5l+oOcZ10at9uk
 j7LVqhPNx8lMt1AtpEDeGBS88bCeeRbYdy6TV1daJ2hIUcAcWCESknzqIO2U65PI/SSB
 8+/TxnaMEOGtjNL3xPrUOIClLkI9M6GJkc4kVp8PTJS2xKOXASFc93APFvzDIlUAU2oS
 q1+lKWWNjqy6NTvEh4+natwBjhxTL/bTlYSOw6/qrhlxwz8nXqPIjHZkDkW0HI8Zs8ho
 UslQ==
X-Gm-Message-State: AO0yUKWtxoT+yeFCNJZ/mDw58bn48tdt1ZUCTmENUzbCNAPpj90E9YKU
 GaOIxHbmAoGghwm/t49QkUcypN1zv0Qvg5spKUpr/KYhARPhNjoe2+at1ox53uj1K5+aDoZdxFo
 2D+s33elqLpKPq6k=
X-Received: by 2002:a92:c548:0:b0:315:3b69:7f74 with SMTP id
 a8-20020a92c548000000b003153b697f74mr3414356ilj.23.1676494922586; 
 Wed, 15 Feb 2023 13:02:02 -0800 (PST)
X-Google-Smtp-Source: AK7set+INYBHMMMpFimck7EE0W8tYzBm5t55mb2QA3RUhrHVYQGTLV/JCdLFd+Dxt+Kyo+YEO7zSmg==
X-Received: by 2002:a92:c548:0:b0:315:3b69:7f74 with SMTP id
 a8-20020a92c548000000b003153b697f74mr3414339ilj.23.1676494922287; 
 Wed, 15 Feb 2023 13:02:02 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 l25-20020a02cd99000000b003a9632cb099sm1618456jap.51.2023.02.15.13.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 13:02:01 -0800 (PST)
Date: Wed, 15 Feb 2023 14:02:00 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Juan Quintela <quintela@redhat.com>, Avihai Horon <avihaih@nvidia.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v10 03/12] vfio/migration: Allow migration without VFIO
 IOMMU dirty tracking support
Message-ID: <20230215140200.19b6e308.alex.williamson@redhat.com>
In-Reply-To: <Y+1CsmyjkUIOCrvs@nvidia.com>
References: <20230209192043.14885-1-avihaih@nvidia.com>
 <20230209192043.14885-4-avihaih@nvidia.com>
 <8735773xr7.fsf@secure.mitica>
 <2efede77-0b06-0efa-1ea2-86300307c86f@nvidia.com>
 <87sff6ztxq.fsf@secure.mitica>
 <20230215131435.3e14aa55.alex.williamson@redhat.com>
 <Y+1CsmyjkUIOCrvs@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Wed, 15 Feb 2023 16:38:10 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Feb 15, 2023 at 01:14:35PM -0700, Alex Williamson wrote:
> 
> > We'll need to consider whether we want to keep "dumb" dirty tracking,
> > or even any form of dirty tracking in the type1 uAPI, under an
> > experimental opt-in.  Thanks,  
> 
> I was expecting we'd delete the kernel code for type 1 dirty tracking
> once the v2 parts are merged to qemu since we don't and won't have any
> kernel implementation of it..
> 
> The big point of this to allow qmeu to continue on with a future
> kernel that no longer reports it supports this.

Right, in the part-1 series adding v2 support, we have no other dirty
tracking, so it serves a purpose until we have device-level dirty
tracking in the part-2 series.  After that, we can certainly at least
remove the type1 dirty tracking since there never were, and likely never
will be, any in-kernel implementations.  I could go either way if we
want to keep the in-QEMU dirty-everything tracking around as an
experimental option to aid migration driver development/debug (ie.
maybe enabling it preempts device dirty tracking as a comparison for
debug).  Thanks,

Alex


