Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDED32E496
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:18:58 +0100 (CET)
Received: from localhost ([::1]:53866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6bp-0006sc-DI
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lI6Zr-0006He-W5
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:16:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lI6Zo-000055-CC
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:16:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614935811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R5QfAeXtbi014W8uzzNNRwtU1aw+nQfnv8rpCYVyrB0=;
 b=DkbQ2rJ/ooxSRL7P1bABvYF5yZfE36vGtpR0y4P2Qmm6XTBc1FbbLrSqtcdOZPC5eilJv3
 5eXcizjw8I1VH1C8Nfh3ePonxmkB4NH9LhK0umDAFFXwxdqaSexudswiBb4g/fEXH7TVVD
 2hbF8EcYaQALcSfFZi1PHkworwM5U1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-RfkdVVANMcGFoX-LEhgH6A-1; Fri, 05 Mar 2021 04:16:49 -0500
X-MC-Unique: RfkdVVANMcGFoX-LEhgH6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CE37108BD06;
 Fri,  5 Mar 2021 09:16:48 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B79E1002393;
 Fri,  5 Mar 2021 09:16:42 +0000 (UTC)
Date: Fri, 5 Mar 2021 10:16:41 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: QEMU RBD is slow with QCOW2 images
Message-ID: <20210305091641.GA5155@merkur.fritz.box>
References: <20210303174058.sdy5ygdfu75xy4rr@steredhat>
 <20210304120502.GA9607@merkur.fritz.box>
 <20210304140829.4tfdrd2mhqa4o76h@steredhat>
 <20210304145917.GF9607@merkur.fritz.box>
 <20210304173254.3qid3tm26eq6yweg@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210304173254.3qid3tm26eq6yweg@steredhat>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Am 04.03.2021 um 18:32 hat Stefano Garzarella geschrieben:
> On Thu, Mar 04, 2021 at 03:59:17PM +0100, Kevin Wolf wrote:
> > Am 04.03.2021 um 15:08 hat Stefano Garzarella geschrieben:
> > > On Thu, Mar 04, 2021 at 01:05:02PM +0100, Kevin Wolf wrote:
> > > > Am 03.03.2021 um 18:40 hat Stefano Garzarella geschrieben:
> > > > > Hi Jason,
> > > > > as reported in this BZ [1], when qemu-img creates a QCOW2 image on RBD
> > > > > writing data is very slow compared to a raw file.
> > > > >
> > > > > Comparing raw vs QCOW2 image creation with RBD I found that we use a
> > > > > different object size, for the raw file I see '4 MiB objects', for
> > > > > QCOW2 I
> > > > > see '64 KiB objects' as reported on comment 14 [2].
> > > > > This should be the main issue of slowness, indeed forcing in the code 4 MiB
> > > > > object size also for QCOW2 increased the speed a lot.
> > > > >
> > > > > Looking better I discovered that for raw files, we call rbd_create() with
> > > > > obj_order = 0 (if 'cluster_size' options is not defined), so the default
> > > > > object size is used.
> > > > > Instead for QCOW2, we use obj_order = 16, since the default 'cluster_size'
> > > > > defined for QCOW2, is 64 KiB.
> > > >
> > > > Hm, the QemuOpts-based image creation is messy, but why does the rbd
> > > > driver even see the cluster_size option?
> > > >
> > > > The first thing qcow2_co_create_opts() does is splitting the passed
> > > > QemuOpts into options it will process on the qcow2 layer and options
> > > > that are passed to the protocol layer. So if you pass a cluster_size
> > > > option, qcow2 should take it for itself and not pass it to rbd.
> > > >
> > > > If it is passed to rbd, I think that's a bug in the qcow2 driver.
> > > 
> > > IIUC qcow2 properyl remove it, but when rbd uses qemu_opt_get_size_del(opts,
> > > BLOCK_OPT_CLUSTER_SIZE, 0) the default value of qcow2 format is returned.
> > > 
> > > Going in depth in qemu_opt_get_size_helper(), I found that qemu_opt_find()
> > > properly returns a NULL pointer, but then we call find_default_by_name()
> > > that returns the default value of qcow2 format (64k).
> > 
> > Ugh, I see why. We're passing the protocol driver a QemuOpts that was
> > created for a QemuOptsList with the qcow2 default, not for its own
> > QemuOptsList. This is wrong.
> > 
> > Note that the QemuOptsList is not qcow2_create_opts itself, but a list
> > that is created with qemu_opts_append() to combine qcow2 and rbd options
> > into a new QemuOptsList. For overlapping options, the format wins.
> > 
> > I don't think you can change the QemuOptsList of an existing QemuOpts,
> > nor is there a clone operation that could just copy all options into a
> > new QemuOpts created for the rbd QemuOptsList, so maybe the easiest
> > hack^Wsolution would be converting to QDict and back...
> 
> Do you mean something like this? (I'll send a proper patch when everything
> is a little clearer to me :-)
> 
> diff --git a/block.c b/block.c
> index a1f3cecd75..74b02b32dc 100644
> --- a/block.c
> +++ b/block.c
> @@ -671,13 +671,33 @@ out:
>  int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
>  {
>      BlockDriver *drv;
> +    QemuOpts *new_opts;
> +    QDict *qdict;
> +    int ret;
> 
>      drv = bdrv_find_protocol(filename, true, errp);
>      if (drv == NULL) {
>          return -ENOENT;
>      }
> 
> -    return bdrv_create(drv, filename, opts, errp);
> +    if (!drv->create_opts) {
> +        error_setg(errp, "Driver '%s' does not support image creation",
> +                   drv->format_name);
> +        return -ENOTSUP;
> +    }
> +
> +    qdict = qemu_opts_to_qdict(opts, NULL);
> +    new_opts = qemu_opts_from_qdict(drv->create_opts, qdict, errp);
> +    if (new_opts == NULL) {
> +        ret = -EINVAL;
> +        goto out;
> +    }
> +
> +    ret = bdrv_create(drv, filename, new_opts, errp);
> +out:
> +    qemu_opts_del(new_opts);
> +    qobject_unref(qdict);
> +    return ret;
>  }

Something like this, yes. Does it work for you?

Of course, in the real patch it could use a comment why we're doing
these seemingly redundant conversions.

Kevin


