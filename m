Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D3C4239EA
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 10:45:07 +0200 (CEST)
Received: from localhost ([::1]:47626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY2Xy-0001JQ-3z
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 04:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mY2Wv-0000Vq-KC
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:44:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mY2Wu-0003Iw-8J
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633509839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aY79Q8oqNH+yVfc+ivGrMNdRzjJpaxD6lF5S4ENCZ40=;
 b=StMo3/Fa6c7c719fFoQsIDzYXDgy36USZpHkQB8UX3LL2T5vJ5pwZiBNpAivZoXtsi0OOC
 G9tg1C7Q+UiNLxLvsdFaoYyGR24Pv4XKZSM7V6eqFcnXUkndZ0fIU/nZJ04GO0igwoDfIQ
 2Q7vzRlWHv2O6lrMROrvQXCGdZsVefo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-eVOP86IgPEOKh6B5OToBZQ-1; Wed, 06 Oct 2021 04:43:56 -0400
X-MC-Unique: eVOP86IgPEOKh6B5OToBZQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 n18-20020adff092000000b001609d9081d4so1416285wro.18
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 01:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aY79Q8oqNH+yVfc+ivGrMNdRzjJpaxD6lF5S4ENCZ40=;
 b=EvpuiA5sT0VOZabi1zk5i5v2pDC5ox+8j4D9rAV2dN87Ks/pLcDW8c2eqDKxrTJ+cO
 +/aeUa9U2t2p8O0KK83XzUQ7QV96OjKWoLQ79rM8z0vmGt2McASBXinGaRSjHdO72xNT
 dgk0OmSMO5pemCY1pdObaGm46wV7Qfkj2tQ/sOHCNx8SaAkr8V6zkkmzPz0ED33t1GmX
 1jAhWCF+rgPwt2nsMaKj/pjQimnsyOqnzfpEo2cy/AsX86/qd402OTedewUMWzXJaoYm
 qzKDhHHZVnHZL1Gm1Wy5M2COVMjziKEuPuOOOnzZxecuMUg9hbg+PuGbVxW+RFdpHNVt
 Zytw==
X-Gm-Message-State: AOAM531jRA4GKBDLIjzfeB1WltOga4p76yjavhCIqBca+T+CbHYeqOl3
 5HWsTFLxWu4RunuMYaAlnob5mZraPS/ufJ5ojhiIL8jDSzCr9XcB+BTsVddOD2pcP8aOFsa0VQ+
 st1nSbL8uWXzqfLE=
X-Received: by 2002:adf:b1c5:: with SMTP id r5mr15264737wra.357.1633509835308; 
 Wed, 06 Oct 2021 01:43:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaaXQY4OPmUJIQviK4pW3Nr8Pg/rnO35Uz14WIRYxF2Gsb7YvKahY1mnJvre9Z8w4SA8cPHQ==
X-Received: by 2002:adf:b1c5:: with SMTP id r5mr15264711wra.357.1633509835114; 
 Wed, 06 Oct 2021 01:43:55 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id w18sm20187616wrt.79.2021.10.06.01.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 01:43:54 -0700 (PDT)
Date: Wed, 6 Oct 2021 09:43:52 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v0 0/2] virtio-blk and vhost-user-blk cross-device
 migration
Message-ID: <YV1hyB4oeRDNbFjw@work-vm>
References: <20211004110855-mutt-send-email-mst@kernel.org>
 <YVuL0FRN5ilRN2Pd@rvkaganb.lan>
 <20211005024754-mutt-send-email-mst@kernel.org>
 <YVxaodahFBOvANL0@work-vm>
 <20211005161008.iq5ao7t2sdqeo6kc@habkost.net>
 <20211005175503-mutt-send-email-mst@kernel.org>
 <YV1ZuizhQ5gO9nd6@work-vm>
 <20211006041419-mutt-send-email-mst@kernel.org>
 <YV1eQmM/+HXZy06C@work-vm>
 <20211006043314-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211006043314-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: kwolf@redhat.com, Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, raphael.norwitz@nutanix.com,
 Roman Kagan <rvkagan@yandex-team.ru>, yc-core@yandex-team.ru,
 pbonzini@redhat.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Michael S. Tsirkin (mst@redhat.com) wrote:
> On Wed, Oct 06, 2021 at 09:28:50AM +0100, Dr. David Alan Gilbert wrote:
> > To me it feels the same as the distinction between vhost-kernel and qemu
> > backended virtio that we get in net and others - in principal it's just 
> > another implementation.
> 
> In net it's actually like this. Same -device, a different netdev.
> 
> > A tricky part is guaranteeing the set of visible virtio features between
> > implementations; we have that problem when we use vhost-kernel and run
> > on a newer/older kernel and gain virtio features; the same will be true
> > with vhost-user implementations.
> 
> That's not new but yes we need to work on this.
> 
> > But this would make the structure of a vhost-user implementation quite
> > different.
> > 
> > Dave
> 
> Right. That's why I'm reluctant to just add a new device type that
> has special compatibility requirements.

Hmm but there's already another layer of hack^Wabstraction in there isn't there -
there's already:
    virtio-blk-pci
    virtio-blk-device

created when the user specifies a virtio-blk device?

Dave


> > > 
> > > > > -- 
> > > > > MST
> > > > > 
> > > > -- 
> > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > 
> > -- 
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


