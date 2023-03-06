Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52326AD0E1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 22:54:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIm3-0006PC-Jf; Mon, 06 Mar 2023 16:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZIlt-0006MJ-BH
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:53:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZIlq-00052b-Nx
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:53:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678139605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VRIpxlrynP1SpC+3nvwxvVk+4i78gDycPoMeRnZAdc4=;
 b=XYJ18sHXDox+FWqFffrd5UZQtXyeIzvEifJJ7e/aKcW2fw16/34wZD3tpVEMc9lwIaE1PX
 7jgnBBhrSkyXk0PewA+B8Qff3Jxf6b3wr0DJAgRlzOsOlJ0CHDcn/0LvEOZwrUbKGqVPdx
 otTsYwSfhrD6A8R1IBWLwMiO4uSKLnw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-2FQ05meUNyi8WFbr7I-L6A-1; Mon, 06 Mar 2023 16:53:24 -0500
X-MC-Unique: 2FQ05meUNyi8WFbr7I-L6A-1
Received: by mail-wm1-f72.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so7313490wmj.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 13:53:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678139603;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VRIpxlrynP1SpC+3nvwxvVk+4i78gDycPoMeRnZAdc4=;
 b=KxUf7fUIPBMCbJxGHGdjUQBI6xns/qL0QjQEnp2VzwJG1EYR5fgwRiHCALckTbQQ1Z
 kW9aJBb9RzW9LjC8UFJrr2Cbd/L87Ikc1BmXc7PnimKtWLKljQmmU8AgcV8CquMWCpaK
 yvAJUIeAEoiANbECQpA3C9vdos5C0lxG+PCusf+r2K289zN53t7Jp8MPiQfbAuRVlE7Z
 u8zs3ZPNIhMHPgT97lVhgShDvzyo1/mSDU0hjWW1f8dn6vu76jQD2QW71KksgqzZQ14n
 J1pRw3NAuEwB/8QZBtrKrIAr2M2hQpl9vPBTNec+jjJwyh7ErSr09np/fvzaeuYVcZaA
 7Rqg==
X-Gm-Message-State: AO0yUKW8FgyaT/8jJfKAc0+7w1PBO3epq2GGnCHCYW+nTgYEfTukeTHg
 4fMLeRnBZ0P55Ye+uLQ1nlpOz3aio46+YMST6U2Ihc+ROFJk5P5VXJvNgAdecwgfJihUXxXeUL2
 dCgbPllGXQvzde1M=
X-Received: by 2002:a05:600c:600a:b0:3df:e468:17dc with SMTP id
 az10-20020a05600c600a00b003dfe46817dcmr10431090wmb.40.1678139602921; 
 Mon, 06 Mar 2023 13:53:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/VcIiDLR0Hyeg5ocMtprH6ZKshpcNTPqNvz1rGO2u/jwiEXJwI/ZismXXlOswIi0YxQOXKJQ==
X-Received: by 2002:a05:600c:600a:b0:3df:e468:17dc with SMTP id
 az10-20020a05600c600a00b003dfe46817dcmr10431073wmb.40.1678139602577; 
 Mon, 06 Mar 2023 13:53:22 -0800 (PST)
Received: from redhat.com ([2.52.23.160]) by smtp.gmail.com with ESMTPSA id
 e13-20020adff34d000000b002c53cc7504csm10731251wrp.78.2023.03.06.13.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 13:53:22 -0800 (PST)
Date: Mon, 6 Mar 2023 16:53:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Message-ID: <20230306165137-mutt-send-email-mst@kernel.org>
References: <20230228094756-mutt-send-email-mst@kernel.org>
 <f3338868-d43a-a499-5db8-2fb06d244e37@yandex-team.ru>
 <20230228161602-mutt-send-email-mst@kernel.org>
 <8c3c140a-3c11-ba21-0c53-9cf25928bad0@yandex-team.ru>
 <20230301101212-mutt-send-email-mst@kernel.org>
 <78299aea-4049-991b-fe89-de0d1845bdff@yandex-team.ru>
 <20230301121224-mutt-send-email-mst@kernel.org>
 <bc89a1b1-2478-7780-0d74-64aac91beed5@yandex-team.ru>
 <20230301152038-mutt-send-email-mst@kernel.org>
 <c85c067f-5bbb-ca5c-a6ba-bae1c356eef1@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c85c067f-5bbb-ca5c-a6ba-bae1c356eef1@yandex-team.ru>
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

On Mon, Mar 06, 2023 at 10:55:29PM +0200, Anton Kuchin wrote:
> On 01/03/2023 22:22, Michael S. Tsirkin wrote:
> > On Wed, Mar 01, 2023 at 09:35:56PM +0200, Anton Kuchin wrote:
> > > I do trust them :)
> > > I have to, otherwise we would need to pack all the properties and
> > > flags of qemu to the migration stream and validate them at
> > > destination or entire migration ends up broken beyond repair if
> > > orchestrators tend to do stupid things and need babysitting.
> > This is not at all a crazy idea. It has some disadvantages
> > too esp around cross version migration, which is why we
> > don't do this yet.
> > 
> 
> Indeed. I know VMMs that chose this path. But as long as
> qemu decided to trust orchestrators I think we'd better
> keep this consistent across the codebase.
> 
> Only ivshmem_pre_load callback bothers to check device
> property and virtio_net_tx_waiting_pre_load checks that
> number of queue pairs doesn't exceed allowed maximum, all
> other *_pre_load functions generally just initialize some
> parts of state that need to be set before stream starts
> loading.

We do validate things by necessity we just try to do
as much as we can table-driver so it's not open-coded
and less visible. We used to have lot more callbacks
nowdays we try to keep it table driven.
But e.g. pci streams RO state and validates that it's the same
on destination.


-- 
MST


