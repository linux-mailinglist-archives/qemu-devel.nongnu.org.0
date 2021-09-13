Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37187409035
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:51:07 +0200 (CEST)
Received: from localhost ([::1]:33698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmMT-0005yy-VD
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mPlR9-0002P3-Bo
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:51:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mPlR6-0000Tq-3z
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631537507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fg/wZJETi5otndoBk/UgAfPLkCj8MsEaIsCcL1jF7kI=;
 b=PRfx2xKTfG0FsqOkqobu3CAVaHbEDaLy/gSpr42HN3cBmwDHtV9ZFxAW3RC91kVetQTrHC
 M+C3tVNoyByaMGzlydXGJMy6m7jLzMuw/1GHhhLhDHnHq87GVGT1pIZkEvgjW/nd3Yaxsi
 klJevOC1uT4RqGgIQbNTWYoAxq02n1E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-H3UyydfIP8q_UlUVln9-aw-1; Mon, 13 Sep 2021 08:51:46 -0400
X-MC-Unique: H3UyydfIP8q_UlUVln9-aw-1
Received: by mail-ed1-f71.google.com with SMTP id
 i8-20020a50fc08000000b003d1cb7bebe5so1698882edr.7
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 05:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fg/wZJETi5otndoBk/UgAfPLkCj8MsEaIsCcL1jF7kI=;
 b=K1ukmUrT1LVXXyAUu724nYsNral7qGZ5uxmDun0Mo0jJCoCgaWjPkU6JChTUWjMCtm
 5g/fHQ+ci9+bIRtCJIxsBzQDuDtqghDiXW4+ebiQG0DcSrFnhOR3Fs+inGscKYSD/kcY
 l8V1NWMRQxNUJ3+Rz24gJgEuOV/PW+wol4DyYyht/anp6MCDiQY10KH6Hso1sAgTWhai
 7ucqCboKaRxyjR4UGrfxtwhR0ONYdDLZrlWPutPlUppi+OlNf8xKCZLMOWuG8YmkEiJT
 WetsaOgI0Nn5VOGWqhG367QtWJenIP5t8cCGl5QCm6f8rQ8lwEmwSzrYZy/xmHPOW0ks
 KmLA==
X-Gm-Message-State: AOAM533i0LXJndysAWndkbEuABygUWQ7f141OTTVAM35PHdIJH9mQo7L
 DB2rePsn5Z7FdbrOEF4+V7zvVxqIZNYTnavCnQGiBbe1jzeF6La3ydDgYKENkZPG+yBpWW08CoM
 SoswP9ccLmoLO9GQ=
X-Received: by 2002:a50:d6d8:: with SMTP id l24mr13204823edj.297.1631537505097; 
 Mon, 13 Sep 2021 05:51:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrwyY/xe/D14ghLQoRkkM1Ipe/oHckn1+u1QyN/5mAXS4gqflxTLwsCzxOOzfGpGeQsEoc/Q==
X-Received: by 2002:a50:d6d8:: with SMTP id l24mr13204802edj.297.1631537504911; 
 Mon, 13 Sep 2021 05:51:44 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id d10sm3921862edx.57.2021.09.13.05.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 05:51:44 -0700 (PDT)
Date: Mon, 13 Sep 2021 14:51:42 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost-vsock: fix migration issue when seqpacket is
 supported
Message-ID: <20210913125142.t34brj4qfvngkfgh@steredhat>
References: <20210907124935.147164-1-sgarzare@redhat.com>
 <YTdnkPR+LjNFXaeQ@redhat.com>
 <20210909044603-mutt-send-email-mst@kernel.org>
 <YTnNlEz+0LohJHRG@redhat.com>
 <20210909063623-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210909063623-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Sep 10, 2021 at 02:35:53AM -0400, Michael S. Tsirkin wrote:
>On Thu, Sep 09, 2021 at 10:02:12AM +0100, Daniel P. Berrangé wrote:
>> On Thu, Sep 09, 2021 at 04:47:42AM -0400, Michael S. Tsirkin wrote:
>> > On Tue, Sep 07, 2021 at 02:22:24PM +0100, Daniel P. Berrangé wrote:
>> > > On Tue, Sep 07, 2021 at 02:49:35PM +0200, Stefano Garzarella wrote:
>> > > > Commit 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
>> > > > enabled the SEQPACKET feature bit.
>> > > > This commit is released with QEMU 6.1, so if we try to migrate a VM where
>> > > > the host kernel supports SEQPACKET but machine type version is less than
>> > > > 6.1, we get the following errors:
>> > > >
>> > > >     Features 0x130000002 unsupported. Allowed features: 0x179000000
>> > > >     Failed to load virtio-vhost_vsock:virtio
>> > > >     error while loading state for instance 0x0 of device '0000:00:05.0/virtio-vhost_vsock'
>> > > >     load of migration failed: Operation not permitted
>> > > >
>> > > > Let's disable the feature bit for machine types < 6.1, adding a
>> > > > `features` field to VHostVSock to simplify the handling of upcoming
>> > > > features we will support.
>> > >
>> > > IIUC, this will still leave migration broken for anyone migrating
>> > > a >= 6.1 machine type between a kernel that supports SEQPACKET and
>> > > a kernel lacking that, or vica-verca.
>> > >
>> > > If a feature is dependant on a host kernel feature we can't turn
>> > > that on automatically as part of the machine type, as we need
>> > > ABI stability across migration indepdant of kernel version.
>> > >
>> > >
>> > > Regards,
>> > > Daniel
>> >
>> > This is a fundamental problem we have with kernel accelerators.
>> > A higher level solution at management level is needed.
>> > For now yes, we do turn features on by default,
>> > consistent kernels on source and destination are assumed.
>> > For downstreams not a problem at all as they update
>> > userspace and kernel in concert.
>>
>> Even downstream in RHEL that is not actually valid anymore. Container
>> based deployment has killed any assumptions that can be made in this
>> respect. Even if the userspace and kernel are updated in lockstep in
>> a particular RHEL release, you cannot assume the running environment
>> will have a matched pair.
>>
>> Users can be running QEMU userspace from RHEL-8.5 inside a container
>> that has been deployed on a host using a 8.3 kernel. We've even had
>> cases of running QEMU from RHEL-8, on a RHEL-7 host.
>>
>> Regards,
>> Daniel
>
>Is there finally an interest in addressing this then?  This would
>involve collecting host features across a cluster and for each host
>figuring out a configuration that works for migration. IIRC a tool was
>proposed for the task (to live alongside e.g. qemu-img).

Apart from the tool, what if we provide a mechanism for adding/removing 
device features at run-time?
After migration we could tell the guest that a feature is no longer 
available.

Maybe it's too complicated, but it would allow us to solve the problem 
of migrating between different kernels or, with vDPA, between different 
devices that don't support all features.

>
>As long as we just stick to the machine type the best we can do is
>probably to keep doing what we do now (hope that the two host kernels
>are more or less consistent) as otherwise we'd have to never enable any
>new features in vsock.

Should we at least merge this patch to allow to migrate a VM between a 
new and an old qemu even if the kernel is the same?

Thanks,
Stefano


