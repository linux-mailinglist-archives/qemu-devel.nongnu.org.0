Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0FD40ABF4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:44:28 +0200 (CEST)
Received: from localhost ([::1]:37022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5vP-0002B3-82
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mQ5tR-0007uO-LJ
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 06:42:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mQ5tK-0008B2-EP
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 06:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631616136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hI5iVxjgm4jXE0DxCSg64zhcEk0B/UHAHh2+yD9swP4=;
 b=E01Akz3h/HjYLoblyebz0ypgBJGN8KpaXAtWIB7FdimTZqZJviwQ/VL9ml4Brm3sqNy9V6
 LhNOeiBaRfi9bI4V+cn2Xl16U/o/oRckmCBXZbdSh99wUlRCfvHlClpJcgiYeYz7RQkE+e
 BnJZDlJMqrS7aaemBt8DDE0D9nOyzgg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-0G0fg1SOMUmKRE92Y81eZQ-1; Tue, 14 Sep 2021 06:42:13 -0400
X-MC-Unique: 0G0fg1SOMUmKRE92Y81eZQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 e7-20020aa7d7c7000000b003d3e6df477cso448325eds.20
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 03:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hI5iVxjgm4jXE0DxCSg64zhcEk0B/UHAHh2+yD9swP4=;
 b=HqVL9OofP1vVloj3zC+sL89ZVe6DLJEF+e4mQt/xevCK0JNp/Wl+0CetEBnS8PWSfG
 Y1/xXAPRIdNBTzQSMSJVZRA35NiUKHNqatux1BY2aV/UOhBOa9z5RjlTP2Cg1mO3A8C0
 zSB0myLTTyDITKz4qHI4r3cUadh4l2XhtaQ4OhPDb6xtusT+4wke6yYeHKpB0grr2/+X
 BZQB+YFtmZl8+jAXzeopxnqWhkExTzIURvt1tCS787CP9VrbQ28ZRuFzuFeKW2dXqXps
 CJjNjJkIwlra5S4zpYD/m9kc9Yqf7tuGCFuWJ89pTAmeU80H0dwNMIZ3ZD2wPFaVEOPO
 G3Dw==
X-Gm-Message-State: AOAM531ypUIU9iI8N7Yd8E8lO4Hq01rLwEPfklzIpGIWbt+x/TdXkpjV
 M5uUiML4Cb7TC+gc+BdoZzPxF20V9mWD6dvSeTPU3Dv82q6xtWtgY1LjZ8rNmaz/7uotpn1h5UR
 Rsftc6FoH71aeeCY=
X-Received: by 2002:a17:906:9b09:: with SMTP id
 eo9mr10316263ejc.166.1631616132629; 
 Tue, 14 Sep 2021 03:42:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpgIg2spU38noTNfqs7ajSlzUY2cpFgWLjl+e1ltdDGLgAcplaVIFOqa0D3xwVng4zIlcLkw==
X-Received: by 2002:a17:906:9b09:: with SMTP id
 eo9mr10316241ejc.166.1631616132361; 
 Tue, 14 Sep 2021 03:42:12 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id n10sm4712697ejk.86.2021.09.14.03.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 03:42:11 -0700 (PDT)
Date: Tue, 14 Sep 2021 12:42:09 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost-vsock: fix migration issue when seqpacket is
 supported
Message-ID: <20210914104209.knw76yfzs2547rrb@steredhat>
References: <20210907124935.147164-1-sgarzare@redhat.com>
 <YTdnkPR+LjNFXaeQ@redhat.com>
 <20210909044603-mutt-send-email-mst@kernel.org>
 <YTnNlEz+0LohJHRG@redhat.com>
 <20210909063623-mutt-send-email-mst@kernel.org>
 <20210913125142.t34brj4qfvngkfgh@steredhat>
 <20210913094508-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210913094508-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Jiang Wang <jiang.wang@bytedance.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 09:46:48AM -0400, Michael S. Tsirkin wrote:
>On Mon, Sep 13, 2021 at 02:51:42PM +0200, Stefano Garzarella wrote:
>> On Fri, Sep 10, 2021 at 02:35:53AM -0400, Michael S. Tsirkin wrote:
>> > On Thu, Sep 09, 2021 at 10:02:12AM +0100, Daniel P. Berrangé wrote:
>> > > On Thu, Sep 09, 2021 at 04:47:42AM -0400, Michael S. Tsirkin wrote:
>> > > > On Tue, Sep 07, 2021 at 02:22:24PM +0100, Daniel P. Berrangé wrote:
>> > > > > On Tue, Sep 07, 2021 at 02:49:35PM +0200, Stefano Garzarella wrote:
>> > > > > > Commit 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
>> > > > > > enabled the SEQPACKET feature bit.
>> > > > > > This commit is released with QEMU 6.1, so if we try to migrate a VM where
>> > > > > > the host kernel supports SEQPACKET but machine type version is less than
>> > > > > > 6.1, we get the following errors:
>> > > > > >
>> > > > > >     Features 0x130000002 unsupported. Allowed features: 0x179000000
>> > > > > >     Failed to load virtio-vhost_vsock:virtio
>> > > > > >     error while loading state for instance 0x0 of device '0000:00:05.0/virtio-vhost_vsock'
>> > > > > >     load of migration failed: Operation not permitted
>> > > > > >
>> > > > > > Let's disable the feature bit for machine types < 6.1, adding a
>> > > > > > `features` field to VHostVSock to simplify the handling of upcoming
>> > > > > > features we will support.
>> > > > >
>> > > > > IIUC, this will still leave migration broken for anyone migrating
>> > > > > a >= 6.1 machine type between a kernel that supports SEQPACKET and
>> > > > > a kernel lacking that, or vica-verca.
>> > > > >
>> > > > > If a feature is dependant on a host kernel feature we can't turn
>> > > > > that on automatically as part of the machine type, as we need
>> > > > > ABI stability across migration indepdant of kernel version.
>> > > > >
>> > > > >
>> > > > > Regards,
>> > > > > Daniel
>> > > >
>> > > > This is a fundamental problem we have with kernel accelerators.
>> > > > A higher level solution at management level is needed.
>> > > > For now yes, we do turn features on by default,
>> > > > consistent kernels on source and destination are assumed.
>> > > > For downstreams not a problem at all as they update
>> > > > userspace and kernel in concert.
>> > >
>> > > Even downstream in RHEL that is not actually valid anymore. Container
>> > > based deployment has killed any assumptions that can be made in this
>> > > respect. Even if the userspace and kernel are updated in lockstep in
>> > > a particular RHEL release, you cannot assume the running environment
>> > > will have a matched pair.
>> > >
>> > > Users can be running QEMU userspace from RHEL-8.5 inside a container
>> > > that has been deployed on a host using a 8.3 kernel. We've even had
>> > > cases of running QEMU from RHEL-8, on a RHEL-7 host.
>> > >
>> > > Regards,
>> > > Daniel
>> >
>> > Is there finally an interest in addressing this then?  This would
>> > involve collecting host features across a cluster and for each host
>> > figuring out a configuration that works for migration. IIRC a tool was
>> > proposed for the task (to live alongside e.g. qemu-img).
>>
>> Apart from the tool, what if we provide a mechanism for adding/removing
>> device features at run-time?
>> After migration we could tell the guest that a feature is no longer
>> available.
>>
>> Maybe it's too complicated, but it would allow us to solve the problem of
>> migrating between different kernels or, with vDPA, between different devices
>> that don't support all features.
>
>Possible going forward but not supported by the spec at this point,
>and tricky to do generally.
>It's possible to do it in a vsock specific way since sockets
>are currently closed across migration.

Yep, I see.

>
>
>> >
>> > As long as we just stick to the machine type the best we can do is
>> > probably to keep doing what we do now (hope that the two host kernels
>> > are more or less consistent) as otherwise we'd have to never enable any
>> > new features in vsock.
>>
>> Should we at least merge this patch to allow to migrate a VM between a new
>> and an old qemu even if the kernel is the same?
>>
>> Thanks,
>> Stefano
>
>I'm inclined to do this, yes.
>

If you haven't queued it yet, I'd like to send a v2 using an 
`on,off,auto` property: `auto` would be the actual behavior when 
enabled, `on` instead requires that the kernel supports the feature 
otherwise there is an error.

Thanks,
Stefano


