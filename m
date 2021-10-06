Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07430424044
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 16:39:19 +0200 (CEST)
Received: from localhost ([::1]:50400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY84k-0003IB-4O
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 10:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mY83R-0001gg-KC
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 10:37:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mY83M-0003dx-OO
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 10:37:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633531072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wPxu3IvTAfJAU19KYf5BM/vF3S8DxDd7WYXM7nwLI4w=;
 b=E7fwvjSwoxLMzVSy59YTsChHyVmdB+0iC6ejZzHhFfG0FKlm/bMKPLfS1vGHiVkKqteLxP
 psS3THGRVUOeb/9hfWwhV5LjH5vsv1MNaoWvK162xu9Oy9luwkMVp1jqHSZogh9tQvNvaH
 q7R7721G9FQccNxWHCocPLepz4KYgr0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-TDj2_nouMI28kEkwNJealQ-1; Wed, 06 Oct 2021 10:37:51 -0400
X-MC-Unique: TDj2_nouMI28kEkwNJealQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 r11-20020aa7cfcb000000b003d4fbd652b9so813603edy.14
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 07:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wPxu3IvTAfJAU19KYf5BM/vF3S8DxDd7WYXM7nwLI4w=;
 b=SCrWKTkUlp6FYpPtkWpX5+vsrEOJhyFgxSLa+xh1GO6UZgllu0L2f1eHelUYGHnZYL
 7xfL3XSG+i50zIdYOX/cGfBAThM1c/pluFH7VHb506lfaGlLSwhxzbGX3q8etFw031O1
 LV8nWtofr87/QNneuUiVzF5EjmvUvLm2RSl8op0J6Lr2ygG/0rZBnRmc0DNRpGsaH6bq
 LT4WjyW6ShBCXETXoLLR5zrsXE6ontPcgO9gSCI1AEy4NE0q+dINs6sUZgweWL/0Vq8n
 ZSvfFdu3ErvCPVPwH5SdDTBlXc8Vni3sSzwm0RN7i8iPu6hWQ+1X6empyftF+2qb+dDp
 yswA==
X-Gm-Message-State: AOAM532mmvQUlpjggIVgveLLuyNK3zxMCFChr0IttzSg7/t00OB1J57V
 yUzfRViVQttydxGgXhPURsUtV4Z0HvAEkIG1r3clvQdDRJRy7KrymHZX0/BVGl7DAVqq+5RKMhJ
 PFQqRrQ5zWs8k6pc=
X-Received: by 2002:a17:906:774f:: with SMTP id
 o15mr32544302ejn.200.1633531069767; 
 Wed, 06 Oct 2021 07:37:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9dwD6BQBvP2dvvl3chyVpWIL+jAzxXaIv4R6igubR6Hft3w8COV3KPjMNqgX8TS6Tn+7l3A==
X-Received: by 2002:a17:906:774f:: with SMTP id
 o15mr32544277ejn.200.1633531069546; 
 Wed, 06 Oct 2021 07:37:49 -0700 (PDT)
Received: from redhat.com ([2.55.143.13])
 by smtp.gmail.com with ESMTPSA id f4sm8971974ejf.61.2021.10.06.07.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 07:37:49 -0700 (PDT)
Date: Wed, 6 Oct 2021 10:37:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v0 0/2] virtio-blk and vhost-user-blk cross-device
 migration
Message-ID: <20211006103705-mutt-send-email-mst@kernel.org>
References: <20211005175503-mutt-send-email-mst@kernel.org>
 <YV1ZuizhQ5gO9nd6@work-vm>
 <20211006041419-mutt-send-email-mst@kernel.org>
 <YV1eQmM/+HXZy06C@work-vm>
 <20211006043314-mutt-send-email-mst@kernel.org>
 <YV1hyB4oeRDNbFjw@work-vm>
 <20211006081653-mutt-send-email-mst@kernel.org>
 <YV2kwdeC04HYry7h@work-vm>
 <20211006093707-mutt-send-email-mst@kernel.org>
 <YV2yb0Nsx80dysWs@work-vm>
MIME-Version: 1.0
In-Reply-To: <YV2yb0Nsx80dysWs@work-vm>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, Oct 06, 2021 at 03:27:59PM +0100, Dr. David Alan Gilbert wrote:
> * Michael S. Tsirkin (mst@redhat.com) wrote:
> > On Wed, Oct 06, 2021 at 02:29:37PM +0100, Dr. David Alan Gilbert wrote:
> > > * Michael S. Tsirkin (mst@redhat.com) wrote:
> > > > On Wed, Oct 06, 2021 at 09:43:52AM +0100, Dr. David Alan Gilbert wrote:
> > > > > * Michael S. Tsirkin (mst@redhat.com) wrote:
> > > > > > On Wed, Oct 06, 2021 at 09:28:50AM +0100, Dr. David Alan Gilbert wrote:
> > > > > > > To me it feels the same as the distinction between vhost-kernel and qemu
> > > > > > > backended virtio that we get in net and others - in principal it's just 
> > > > > > > another implementation.
> > > > > > 
> > > > > > In net it's actually like this. Same -device, a different netdev.
> > > > > > 
> > > > > > > A tricky part is guaranteeing the set of visible virtio features between
> > > > > > > implementations; we have that problem when we use vhost-kernel and run
> > > > > > > on a newer/older kernel and gain virtio features; the same will be true
> > > > > > > with vhost-user implementations.
> > > > > > 
> > > > > > That's not new but yes we need to work on this.
> > > > > > 
> > > > > > > But this would make the structure of a vhost-user implementation quite
> > > > > > > different.
> > > > > > > 
> > > > > > > Dave
> > > > > > 
> > > > > > Right. That's why I'm reluctant to just add a new device type that
> > > > > > has special compatibility requirements.
> > > > > 
> > > > > Hmm but there's already another layer of hack^Wabstraction in there isn't there -
> > > > > there's already:
> > > > >     virtio-blk-pci
> > > > >     virtio-blk-device
> > > > > 
> > > > > created when the user specifies a virtio-blk device?
> > > > > 
> > > > > Dave
> > > > 
> > > > virtio-*-pci is there because it was felt these devices look
> > > > differently from e.g. virtio-ccw so should have a different name.
> > > > virtio-blk-device is an internal thingy, users and guests have no idea.
> > > 
> > > Right, so to do what we're asking here, should we keep the
> > > virtio-blk-pci and instantiate virtio-blk-vhost-user instead of
> > > virtio-blk-device?
> > > 
> > > Dave
> > 
> > I guess that's possible, but we need to pass a bunch of parameters.
> > -drive is probably the right want to do that, right?
> 
> I'm not sure about -drive - isn't that very tied into the block layer?
> 
> Dave


If not, we'll need to add some other object, and tie it's id to the device.

> > > > 
> > > > > 
> > > > > > > > 
> > > > > > > > > > -- 
> > > > > > > > > > MST
> > > > > > > > > > 
> > > > > > > > > -- 
> > > > > > > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > > > > > > 
> > > > > > > -- 
> > > > > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > > > > 
> > > > > -- 
> > > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > > 
> > > -- 
> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


