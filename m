Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC505423D9C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 14:19:58 +0200 (CEST)
Received: from localhost ([::1]:39560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY5tt-0004A7-Rk
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 08:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mY5sP-0002lN-Od
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 08:18:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mY5sI-00060c-Cj
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 08:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633522694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ndtV10lme76yIJHfG48XPmluFB/9wzsVi20W0MsJ23k=;
 b=LCg0s/5Vig2obga2tv585xmdj6P5O9TYpEsVptgtyiPpB2DniefKYSMZBa2YPpB8Z9qSfu
 4B9/qduBHgMohPz2K3DmaOzsjunxz+s81IrRR7boTARxMdNP+5eAD+6z5S0kSV2mIdgNpJ
 BDFpUg86yc5BaR3UHZm7TYURiJAT3T8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-wNnIaGf-P5WOVLzvFBPVIQ-1; Wed, 06 Oct 2021 08:18:12 -0400
X-MC-Unique: wNnIaGf-P5WOVLzvFBPVIQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 h12-20020aa7c5cc000000b003dad185759bso2471675eds.6
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 05:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ndtV10lme76yIJHfG48XPmluFB/9wzsVi20W0MsJ23k=;
 b=6mvbr6H9BNhpFfzKmKY0eTqzU2gyiSWCUlttx3jOny5ryrvFJTYXmX+F3BstLVkha6
 G03rP4QafLtGiGUswCZlY+DumOLuRESGqWMPB/vIv6MmfPz/5k/lNQtyeM+jwF3fYu4N
 KtzfY7axgYVJ27+hJGGYLLdCwwaj9cj3262YwDcUCRXlBHr5xZYqXgQrYEf3JDj1UFyj
 AG+R5LS7+SO272EC4Eo1+s73neWAeSH6MLcmBDBREftyzAMH6EdyLMK37U9z4BL0qI1b
 Z7U+swtRFa17dkp6/nYFAZK+PrgPmrCFa7DWWx4TVl0GWQ/wlWMGSW0G4kLNX2LTlnc7
 pv9Q==
X-Gm-Message-State: AOAM5305d4XVKPhUDDiTzRXlfJxg9a/OF3g5K6YhV5zXX2AeXVuxiwaX
 feU0tszbGAXNJu+xCQA9tEZSjJdj6cGZ68yQjWT2F28q9AS3mZgZBVXo/BC3xvMHSOHd3UE8dd0
 HEWUID9I8DLjSxOA=
X-Received: by 2002:a17:906:36d6:: with SMTP id
 b22mr31352079ejc.387.1633522691768; 
 Wed, 06 Oct 2021 05:18:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxktqJKZIpXstigKimI2gYdnAhJ/pWX+StA0nj5y1cJnc9fqnm5lKjCVu6XH+RlLtACfix5BA==
X-Received: by 2002:a17:906:36d6:: with SMTP id
 b22mr31352051ejc.387.1633522691555; 
 Wed, 06 Oct 2021 05:18:11 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id eg31sm688363edb.38.2021.10.06.05.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 05:18:09 -0700 (PDT)
Date: Wed, 6 Oct 2021 08:18:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v0 0/2] virtio-blk and vhost-user-blk cross-device
 migration
Message-ID: <20211006081653-mutt-send-email-mst@kernel.org>
References: <YVuL0FRN5ilRN2Pd@rvkaganb.lan>
 <20211005024754-mutt-send-email-mst@kernel.org>
 <YVxaodahFBOvANL0@work-vm>
 <20211005161008.iq5ao7t2sdqeo6kc@habkost.net>
 <20211005175503-mutt-send-email-mst@kernel.org>
 <YV1ZuizhQ5gO9nd6@work-vm>
 <20211006041419-mutt-send-email-mst@kernel.org>
 <YV1eQmM/+HXZy06C@work-vm>
 <20211006043314-mutt-send-email-mst@kernel.org>
 <YV1hyB4oeRDNbFjw@work-vm>
MIME-Version: 1.0
In-Reply-To: <YV1hyB4oeRDNbFjw@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Oct 06, 2021 at 09:43:52AM +0100, Dr. David Alan Gilbert wrote:
> * Michael S. Tsirkin (mst@redhat.com) wrote:
> > On Wed, Oct 06, 2021 at 09:28:50AM +0100, Dr. David Alan Gilbert wrote:
> > > To me it feels the same as the distinction between vhost-kernel and qemu
> > > backended virtio that we get in net and others - in principal it's just 
> > > another implementation.
> > 
> > In net it's actually like this. Same -device, a different netdev.
> > 
> > > A tricky part is guaranteeing the set of visible virtio features between
> > > implementations; we have that problem when we use vhost-kernel and run
> > > on a newer/older kernel and gain virtio features; the same will be true
> > > with vhost-user implementations.
> > 
> > That's not new but yes we need to work on this.
> > 
> > > But this would make the structure of a vhost-user implementation quite
> > > different.
> > > 
> > > Dave
> > 
> > Right. That's why I'm reluctant to just add a new device type that
> > has special compatibility requirements.
> 
> Hmm but there's already another layer of hack^Wabstraction in there isn't there -
> there's already:
>     virtio-blk-pci
>     virtio-blk-device
> 
> created when the user specifies a virtio-blk device?
> 
> Dave

virtio-*-pci is there because it was felt these devices look
differently from e.g. virtio-ccw so should have a different name.
virtio-blk-device is an internal thingy, users and guests have no idea.


> 
> > > > 
> > > > > > -- 
> > > > > > MST
> > > > > > 
> > > > > -- 
> > > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > > 
> > > -- 
> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


