Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD754091AF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:02:43 +0200 (CEST)
Received: from localhost ([::1]:36674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmXi-0001m2-S5
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mPmIW-0002AS-2p
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:47:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mPmIS-00077q-Oo
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:46:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631540815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZsgV4oTJ9OpIDjjwpTVGWSObFaNi1T9aNp9MGNiVgRA=;
 b=C7TEI/yXM5gtRjgCV7mLxODlcg5BLyLOKIljBOZtix9hcDJ/siKynI0QsrxkFBtQTwvnVR
 5Tns8jz+7FhwHVTfKeLsPRhdAiUg7aP15iWiNPKjXeQWYNZU/uko0X6TEQ2HXAEriioP2i
 qQqCLFkCJRH/tjvxUTKPv5EtpT/K8eY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-fw_NHBoRPvaR9esCVhXxiQ-1; Mon, 13 Sep 2021 09:46:54 -0400
X-MC-Unique: fw_NHBoRPvaR9esCVhXxiQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 bi9-20020a170906a24900b005c74b30ff24so3696186ejb.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 06:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZsgV4oTJ9OpIDjjwpTVGWSObFaNi1T9aNp9MGNiVgRA=;
 b=pazVxoswMgJU4tfnu8HiKyUDSTXvjEDj2yKRIUI0IvIcGAHUd+248k8qjrmt5d5Yic
 UOy6Ks0kmxFa4h0bsh5jqxvmbpIHJkplnx/zmNaMuqES9jEQS+G/hTfQcQ/pYU+Udwvq
 eHJB4EHI14bpbQacx4xdnpMZFM7I4qHqpTH1IMlbYbw5MkIyTBeZwnSZb9Zxmev0EVP6
 C7aerXWGR0pbnICDyFlC0Mskbh4GeVUesks4Q7Mjs3gy9uAC7mk2Sl3B4Jo4LmCJL3jy
 H8ChJTrKvlTeCBpYjoSbEvkM8iVATzpbsmQBoF+dfnpczyEIgPoWONQ1keTbBSdM0pNA
 6Pxw==
X-Gm-Message-State: AOAM531Ew1FZcZDNo+/+v1Y5t3uDtSK4fy1te5tjzr8hVbVKaWiigMZI
 ELi+IUSo7YZoyxTFs4ujrARq4O7fP31vdXL1rr7vPct9JI4dG3WjrRbiOJkkVeT4rsZUFa1FyUB
 fwbvxE6R3KlLf7GE=
X-Received: by 2002:a17:906:c298:: with SMTP id
 r24mr12906547ejz.93.1631540813240; 
 Mon, 13 Sep 2021 06:46:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYthknqQ8ELC28vhXWq3/APH0EkVXMFjZygySIkrZcQKVF2aXHwqy7YmU9p3sJ8V8MWMbEEA==
X-Received: by 2002:a17:906:c298:: with SMTP id
 r24mr12906518ejz.93.1631540812898; 
 Mon, 13 Sep 2021 06:46:52 -0700 (PDT)
Received: from redhat.com ([2.55.151.134])
 by smtp.gmail.com with ESMTPSA id l22sm2110502eds.58.2021.09.13.06.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:46:52 -0700 (PDT)
Date: Mon, 13 Sep 2021 09:46:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] vhost-vsock: fix migration issue when seqpacket is
 supported
Message-ID: <20210913094508-mutt-send-email-mst@kernel.org>
References: <20210907124935.147164-1-sgarzare@redhat.com>
 <YTdnkPR+LjNFXaeQ@redhat.com>
 <20210909044603-mutt-send-email-mst@kernel.org>
 <YTnNlEz+0LohJHRG@redhat.com>
 <20210909063623-mutt-send-email-mst@kernel.org>
 <20210913125142.t34brj4qfvngkfgh@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210913125142.t34brj4qfvngkfgh@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Jiang Wang <jiang.wang@bytedance.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 02:51:42PM +0200, Stefano Garzarella wrote:
> On Fri, Sep 10, 2021 at 02:35:53AM -0400, Michael S. Tsirkin wrote:
> > On Thu, Sep 09, 2021 at 10:02:12AM +0100, Daniel P. Berrangé wrote:
> > > On Thu, Sep 09, 2021 at 04:47:42AM -0400, Michael S. Tsirkin wrote:
> > > > On Tue, Sep 07, 2021 at 02:22:24PM +0100, Daniel P. Berrangé wrote:
> > > > > On Tue, Sep 07, 2021 at 02:49:35PM +0200, Stefano Garzarella wrote:
> > > > > > Commit 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
> > > > > > enabled the SEQPACKET feature bit.
> > > > > > This commit is released with QEMU 6.1, so if we try to migrate a VM where
> > > > > > the host kernel supports SEQPACKET but machine type version is less than
> > > > > > 6.1, we get the following errors:
> > > > > >
> > > > > >     Features 0x130000002 unsupported. Allowed features: 0x179000000
> > > > > >     Failed to load virtio-vhost_vsock:virtio
> > > > > >     error while loading state for instance 0x0 of device '0000:00:05.0/virtio-vhost_vsock'
> > > > > >     load of migration failed: Operation not permitted
> > > > > >
> > > > > > Let's disable the feature bit for machine types < 6.1, adding a
> > > > > > `features` field to VHostVSock to simplify the handling of upcoming
> > > > > > features we will support.
> > > > >
> > > > > IIUC, this will still leave migration broken for anyone migrating
> > > > > a >= 6.1 machine type between a kernel that supports SEQPACKET and
> > > > > a kernel lacking that, or vica-verca.
> > > > >
> > > > > If a feature is dependant on a host kernel feature we can't turn
> > > > > that on automatically as part of the machine type, as we need
> > > > > ABI stability across migration indepdant of kernel version.
> > > > >
> > > > >
> > > > > Regards,
> > > > > Daniel
> > > >
> > > > This is a fundamental problem we have with kernel accelerators.
> > > > A higher level solution at management level is needed.
> > > > For now yes, we do turn features on by default,
> > > > consistent kernels on source and destination are assumed.
> > > > For downstreams not a problem at all as they update
> > > > userspace and kernel in concert.
> > > 
> > > Even downstream in RHEL that is not actually valid anymore. Container
> > > based deployment has killed any assumptions that can be made in this
> > > respect. Even if the userspace and kernel are updated in lockstep in
> > > a particular RHEL release, you cannot assume the running environment
> > > will have a matched pair.
> > > 
> > > Users can be running QEMU userspace from RHEL-8.5 inside a container
> > > that has been deployed on a host using a 8.3 kernel. We've even had
> > > cases of running QEMU from RHEL-8, on a RHEL-7 host.
> > > 
> > > Regards,
> > > Daniel
> > 
> > Is there finally an interest in addressing this then?  This would
> > involve collecting host features across a cluster and for each host
> > figuring out a configuration that works for migration. IIRC a tool was
> > proposed for the task (to live alongside e.g. qemu-img).
> 
> Apart from the tool, what if we provide a mechanism for adding/removing
> device features at run-time?
> After migration we could tell the guest that a feature is no longer
> available.
> 
> Maybe it's too complicated, but it would allow us to solve the problem of
> migrating between different kernels or, with vDPA, between different devices
> that don't support all features.

Possible going forward but not supported by the spec at this point,
and tricky to do generally.
It's possible to do it in a vsock specific way since sockets
are currently closed across migration.


> > 
> > As long as we just stick to the machine type the best we can do is
> > probably to keep doing what we do now (hope that the two host kernels
> > are more or less consistent) as otherwise we'd have to never enable any
> > new features in vsock.
> 
> Should we at least merge this patch to allow to migrate a VM between a new
> and an old qemu even if the kernel is the same?
> 
> Thanks,
> Stefano

I'm inclined to do this, yes.

-- 
MST


