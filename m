Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F1632D621
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:11:45 +0100 (CET)
Received: from localhost ([::1]:58366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpdg-0000dV-7M
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:11:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHpRv-0004sW-E3
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:59:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHpRp-00047L-V7
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:59:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614869969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k8aokm4o3XQg0NfVp1/bXV+mg6FJRBcrazbhFwcdBX4=;
 b=S6V33YW49JzXo9odil1tVgi9kPuAWjWQEG1CAy/t7oQ6e3hkFyZrI7RKB0DuQ8E/mrvP0p
 p2OK/FoZkVY/JCiXklt3A7FMV7Ax7k7BF2ikSN7QHksdybp3esEQv+AYxElDSmEaykV0wI
 F2g1AwQApMo7fb400lI25u0Kvpt2hUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-k9Zek_lOMOKxSiHpSEZg_g-1; Thu, 04 Mar 2021 09:59:27 -0500
X-MC-Unique: k9Zek_lOMOKxSiHpSEZg_g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E8D987A83A;
 Thu,  4 Mar 2021 14:59:26 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-64.ams2.redhat.com [10.36.113.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0061560C0F;
 Thu,  4 Mar 2021 14:59:21 +0000 (UTC)
Date: Thu, 4 Mar 2021 15:59:17 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: QEMU RBD is slow with QCOW2 images
Message-ID: <20210304145917.GF9607@merkur.fritz.box>
References: <20210303174058.sdy5ygdfu75xy4rr@steredhat>
 <20210304120502.GA9607@merkur.fritz.box>
 <20210304140829.4tfdrd2mhqa4o76h@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210304140829.4tfdrd2mhqa4o76h@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Lieven <pl@kamp.de>, Jason Dillaman <dillaman@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.03.2021 um 15:08 hat Stefano Garzarella geschrieben:
> On Thu, Mar 04, 2021 at 01:05:02PM +0100, Kevin Wolf wrote:
> > Am 03.03.2021 um 18:40 hat Stefano Garzarella geschrieben:
> > > Hi Jason,
> > > as reported in this BZ [1], when qemu-img creates a QCOW2 image on RBD
> > > writing data is very slow compared to a raw file.
> > > 
> > > Comparing raw vs QCOW2 image creation with RBD I found that we use a
> > > different object size, for the raw file I see '4 MiB objects', for
> > > QCOW2 I
> > > see '64 KiB objects' as reported on comment 14 [2].
> > > This should be the main issue of slowness, indeed forcing in the code 4 MiB
> > > object size also for QCOW2 increased the speed a lot.
> > > 
> > > Looking better I discovered that for raw files, we call rbd_create() with
> > > obj_order = 0 (if 'cluster_size' options is not defined), so the default
> > > object size is used.
> > > Instead for QCOW2, we use obj_order = 16, since the default 'cluster_size'
> > > defined for QCOW2, is 64 KiB.
> > 
> > Hm, the QemuOpts-based image creation is messy, but why does the rbd
> > driver even see the cluster_size option?
> > 
> > The first thing qcow2_co_create_opts() does is splitting the passed
> > QemuOpts into options it will process on the qcow2 layer and options
> > that are passed to the protocol layer. So if you pass a cluster_size
> > option, qcow2 should take it for itself and not pass it to rbd.
> > 
> > If it is passed to rbd, I think that's a bug in the qcow2 driver.
> 
> IIUC qcow2 properyl remove it, but when rbd uses qemu_opt_get_size_del(opts,
> BLOCK_OPT_CLUSTER_SIZE, 0) the default value of qcow2 format is returned.
> 
> Going in depth in qemu_opt_get_size_helper(), I found that qemu_opt_find()
> properly returns a NULL pointer, but then we call find_default_by_name()
> that returns the default value of qcow2 format (64k).

Ugh, I see why. We're passing the protocol driver a QemuOpts that was
created for a QemuOptsList with the qcow2 default, not for its own
QemuOptsList. This is wrong.

Note that the QemuOptsList is not qcow2_create_opts itself, but a list
that is created with qemu_opts_append() to combine qcow2 and rbd options
into a new QemuOptsList. For overlapping options, the format wins.

I don't think you can change the QemuOptsList of an existing QemuOpts,
nor is there a clone operation that could just copy all options into a
new QemuOpts created for the rbd QemuOptsList, so maybe the easiest
hack^Wsolution would be converting to QDict and back...

> > > Using '-o cluster_size=2M' with qemu-img changed only the qcow2 cluster
> > > size, since in qcow2_co_create_opts() we remove the 'cluster_size' from
> > > QemuOpts calling qemu_opts_to_qdict_filtered().
> > > For some reason that I have yet to understand, after this deletion, however
> > > remains in QemuOpts the default value of 'cluster_size' for qcow2 (64 KiB),
> > > that it's used in qemu_rbd_co_create_opts()
> > 
> > So it seems you came to a similar conclusion. We need to find out where
> > the 64k come from and just fix that so that rbd uses its default.
> 
> Yes, I tried debugging above, but I'm not sure how to fix it.
> 
> Maybe a new parameter in qemu_opt_get_size_helper() to prevent it from
> looking for the default value.
> Or we should prevent the default value from being added to the
> opts->list->desc, but that part is still not very clear to me.

opts->list is already wrong, I think this is what we need to fix.

> > > At this point my doubts are:
> > > Does it make sense to use the same cluster_size as qcow2 as object_size in
> > > RBD?
> > > If we want to keep the 2 options separated, how can it be done? Should we
> > > rename the option in block/rbd.c?
> > 
> > My lazy answer is that you could just use QMP blockdev-create, where you
> > create layer by layer separately.
> > 
> > What could possibly be done for the QemuOpts is using the dotted syntax
> > like for opening, so you could specify file.cluster_size=... for the
> > protocol layer (or data_file.cluster_size=... for the external data
> > file etc.)
> 
> This would be cool :-)

I'm almost sure that compatibility will make this more complicated than
it sounds, but we could have a try.

Kevin


