Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45164422E8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 22:50:58 +0100 (CET)
Received: from localhost ([::1]:56514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfCj-0003sx-NB
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 17:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhf9F-0002Xa-Mz
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 17:47:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhf99-0004ti-ED
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 17:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635803231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9BTLqo0tTgZ9J8ueZmatIRXAyJn3/6KOcj91loLbj14=;
 b=NzQVHYtC5hxSyxIBlhunWtEt/Z07jhit0LBplP9T87Pnf11u6N0wxnBFWUU70ijihO48fM
 oZoyRklPj+OF9R8icRFUTlmatY6yQpI12vnxIpRz2JiyGZWWjm1m6BX/PvfkNCj5oMs4M0
 QuMMMfMGxYxY5SAtS3ArHkickWLWduA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-Iv2xPUkXN7ytDmAyzvTAxA-1; Mon, 01 Nov 2021 17:47:10 -0400
X-MC-Unique: Iv2xPUkXN7ytDmAyzvTAxA-1
Received: by mail-ed1-f71.google.com with SMTP id
 r25-20020a05640216d900b003dca3501ab4so16770780edx.15
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 14:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9BTLqo0tTgZ9J8ueZmatIRXAyJn3/6KOcj91loLbj14=;
 b=kvjOtm1qn3LTfKpfGZflQeN93efE9WnCXLf+ZSiqa79+gt3YRFclmqtiooK2gvRVny
 HRqqWaKbH0ucEmaDby6IJUcO4QJkzf7Ozq2BoSpy6+Efybs2qkSdP7TVe6fyPyTVmM22
 kfN9YWusqZAZkunsttEVlXJMD+Qr+A6jonmmJd5qmoBrNQ1rJsb1LSYCHHGOepq548ck
 MnRWgTqAbrUkId9FFWgtadcJJVnnNcrHkHM4mgPKTKHEYtTpdyyTddstNJC03hH0Uunc
 CDajBoMCJWrfkTSQTAX+ZZhkGuli9KooXo7MqCs7+TpnSR0v7qgKWi4aw6kUX1chNaDS
 cFDQ==
X-Gm-Message-State: AOAM5335fkK7lsREjShE00QGdL8L0cRoeQ4ZNgBe/6wiv+v6aK/yqpW2
 6Y3fiMN/9bg+SsAH2HYvnKaz4+Moq6UgMfhPX7Ufow84ZrbOstK/rBtlA2E9tUl0zTaB/SJEwj4
 CrQs3VyqzV32I/do=
X-Received: by 2002:a17:906:6dd8:: with SMTP id
 j24mr4573348ejt.167.1635803229400; 
 Mon, 01 Nov 2021 14:47:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoeodq4KK8X41eq07a83udfLR5kbR9QACNtzqQ5YfCoDg+3n+WpeUs5dUrRkyLgxUKa0s1Cw==
X-Received: by 2002:a17:906:6dd8:: with SMTP id
 j24mr4573307ejt.167.1635803229089; 
 Mon, 01 Nov 2021 14:47:09 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id ca4sm7442878ejb.1.2021.11.01.14.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 14:47:08 -0700 (PDT)
Date: Mon, 1 Nov 2021 17:47:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211101174531-mutt-send-email-mst@kernel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211018113535-mutt-send-email-mst@kernel.org>
 <20211019052144.q4cy2qrvdh34rxml@sirius.home.kraxel.org>
 <20211019014209-mutt-send-email-mst@kernel.org>
 <20211019062919.35wnhiwimr7l3574@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20211019062919.35wnhiwimr7l3574@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 08:29:19AM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > > Yes.  Maybe ask rh qe to run the patch set through their hotplug test
> > > suite (to avoid a apci-hotplug style disaster where qe found various
> > > issues after release)?
> > 
> > I'll poke around to see if they can help us... we'll need
> > a backport for that though.
> 
> Easy, it's a clean cherry-pick for 6.1, scratch build is on the way.
> 
> > > > I would also like to see a shorter timeout, maybe 100ms, so
> > > > that we are more responsive to guest changes in resending request.
> > > 
> > > I don't think it is a good idea to go for a shorter timeout given that
> > > the 5 seconds are in the specs and we want avoid a resent request being
> > > interpreted as cancel.
> > > It also wouldn't change anything at least for linux guests because linux
> > > is waiting those 5 seconds (with power indicator in blinking state).
> > > Only the reason for refusing 'device_del' changes from "5 secs not over
> > > yet" to "guest is busy processing the hotplug request".
> > 
> > First 5 seconds yes. But the retries afterwards?
> 
> Hmm, maybe, but I'd tend to keep it simple and go for 5 secs no matter
> what.  If the guest isn't responding (maybe because it is in the middle
> of a reboot) it's unlikely that fast re-requests are fundamentally
> changing things.
> 
> > > We could consider to tackle the 5sec timeout on the guest side, i.e.
> > > have linux skip the 5sec wait in case the root port is virtual (should
> > > be easy to figure by checking the pci id).
> > > 
> > > take care,
> > >   Gerd
> > 
> > Yes ... do we want to control how long it blinks from hypervisor side?
> 
> Is there a good reason for that?
> If not, then no.  Keep it simple.
> 
> When the guest powers off the slot pcie_cap_slot_write_config() will
> happily unplug the device without additional checks (no check whenever
> the 5 seconds are over, also no check whenever there is a pending unplug
> request in the first place).
> 
> So in theory the guest turning off slot power quickly should work just
> fine and speed up the unplug process in the common case (guest is
> up'n'running and responsitive).  Down to 1-2 secs instead of 5-7.
> Didn't actually test that though.
> 
> take care,
>   Gerd

Even if this speeds up unplug, hotplug remains slow, right?
-- 
MST


