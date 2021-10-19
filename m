Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EDF432D63
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 07:48:26 +0200 (CEST)
Received: from localhost ([::1]:44658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mchz7-0002zu-8Y
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 01:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mchwy-0001jM-TL
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 01:46:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mchwv-0006X4-Cp
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 01:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634622367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=elf3ttCOkYxUG/kAG5KhltP9mp7kB2KlHPIfKwOSMIM=;
 b=Tq5n80P3IaIvlcs0HoojT5ut1soyyTf72UN2ExtKJaFFC/2GIwDTZ8BlKSTvhH+DTcNMwT
 5M64wEsmRttRLkEB0QYYERFuH7qpME3MVvJwz0Z0Ub4INTubTFnfpnnSzUeNP9Slw7Sk6H
 YDWcZ8jOSYDn9mwcHiMd2dAs26qfjEg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-uagSPghmNW2nY-a5d1QdVQ-1; Tue, 19 Oct 2021 01:46:06 -0400
X-MC-Unique: uagSPghmNW2nY-a5d1QdVQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 c4-20020a5d6cc4000000b00160edc8bb28so9678784wrc.9
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 22:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=elf3ttCOkYxUG/kAG5KhltP9mp7kB2KlHPIfKwOSMIM=;
 b=cKhQmoaWVSiKa6rnSsf8EjenpGEbC0mocApzwmsI8N0FGn9wy24w1CUOG5ceHK7Dfb
 +S3A+iSAjYogJoiPLNX5cCaSR99G3hQYrh5oonit3ZT79fsDSqg2brQLwYv8F1+pTgcv
 QP2auco9MGvx9Tf3b10ETIUehAwYjJOra4q/a2uUHp5Qc2aX2auQhl2OpQDrAG8k8x8O
 JB1+H71Sqr9dYYfwV/VNy97IrBvZf7vGBzXfGQ3LA4LO+P60fNEl0jMO7fD4wV9NeBXu
 f1lMkU8ghxJ0SD70DnCS97f4Jk5bp3xy6ErK2oGNUSM1sgRVmD+c9TH3uiPfIJvqZgNv
 bCTg==
X-Gm-Message-State: AOAM531HiR2Uv74Pqs0nYikoW2KoV5aJe7bupBVD/rkk2M3wqPO14IeK
 RFO1vBNUbwI8XvkSfdV9r12iFFCxsCCQ4fh8aHTBFyLkaTLA8Br6cmGdfOOnWUBCwcYVPdJt+4L
 rxZwaPKv81Fx1pbM=
X-Received: by 2002:adf:bc48:: with SMTP id a8mr40591200wrh.19.1634622364896; 
 Mon, 18 Oct 2021 22:46:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRJP9r/E7MhVR1wypiD10QkHGc14drzPJeinVYsLKWohIPrLkHOojt8vhBmV0vzvR5xAbbZg==
X-Received: by 2002:adf:bc48:: with SMTP id a8mr40591179wrh.19.1634622364701; 
 Mon, 18 Oct 2021 22:46:04 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id z5sm1407806wmp.26.2021.10.18.22.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 22:46:03 -0700 (PDT)
Date: Tue, 19 Oct 2021 01:46:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211019014209-mutt-send-email-mst@kernel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211018113535-mutt-send-email-mst@kernel.org>
 <20211019052144.q4cy2qrvdh34rxml@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20211019052144.q4cy2qrvdh34rxml@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 07:21:44AM +0200, Gerd Hoffmann wrote:
> On Mon, Oct 18, 2021 at 11:36:45AM -0400, Michael S. Tsirkin wrote:
> > On Mon, Oct 11, 2021 at 02:04:58PM +0200, Gerd Hoffmann wrote:
> > > 
> > > 
> > > Gerd Hoffmann (6):
> > >   pci: implement power state
> > >   pcie: implement slow power control for pcie root ports
> > >   pcie: add power indicator blink check
> > >   pcie: factor out pcie_cap_slot_unplug()
> > >   pcie: fast unplug when slot power is off
> > >   pcie: expire pending delete
> > 
> > So what's left to do here?
> > I'm guessing more testing?
> 
> Yes.  Maybe ask rh qe to run the patch set through their hotplug test
> suite (to avoid a apci-hotplug style disaster where qe found various
> issues after release)?

I'll poke around to see if they can help us... we'll need
a backport for that though.

> > I would also like to see a shorter timeout, maybe 100ms, so
> > that we are more responsive to guest changes in resending request.
> 
> I don't think it is a good idea to go for a shorter timeout given that
> the 5 seconds are in the specs and we want avoid a resent request being
> interpreted as cancel.
> It also wouldn't change anything at least for linux guests because linux
> is waiting those 5 seconds (with power indicator in blinking state).
> Only the reason for refusing 'device_del' changes from "5 secs not over
> yet" to "guest is busy processing the hotplug request".

First 5 seconds yes. But the retries afterwards?

> 
> We could consider to tackle the 5sec timeout on the guest side, i.e.
> have linux skip the 5sec wait in case the root port is virtual (should
> be easy to figure by checking the pci id).
> 
> take care,
>   Gerd

Yes ... do we want to control how long it blinks from hypervisor side?
And if we do then what? Shorten retry period?

-- 
MST


