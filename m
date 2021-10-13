Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396AA42CCED
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 23:39:54 +0200 (CEST)
Received: from localhost ([::1]:38804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1malya-0006lq-S2
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 17:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1malxG-0005qh-19
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1malxC-0002dV-As
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634161104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a7QArn96rj8K3jBDc8Ou92i8IMvMRIANoRxIfQUx1iU=;
 b=bKo6U0FCTarLb8UoO6MNe/xuOIz9clYP7XzoP3ugBK2SiiyafhAEFb7Ze4xVhvPECCj472
 JffSo6ewg3T1e8FcropRSEMHEIdru/2QI/go+ddpND9gtddShRD260tPCi5ivC4jPEXKiP
 UAvlD3q34MuGXiAMS9rfghjjWQz5Iiw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-SPF6aD6iNkSmF5ycuj16fA-1; Wed, 13 Oct 2021 17:38:21 -0400
X-MC-Unique: SPF6aD6iNkSmF5ycuj16fA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB839A40C3;
 Wed, 13 Oct 2021 21:38:19 +0000 (UTC)
Received: from redhat.com (ovpn-114-130.phx2.redhat.com [10.3.114.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11294694B5;
 Wed, 13 Oct 2021 21:37:46 +0000 (UTC)
Date: Wed, 13 Oct 2021 16:37:44 -0500
From: Eric Blake <eblake@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH v2 09/15] softmmu/qdev-monitor: add error handling in
 qdev_set_id
Message-ID: <20211013213744.dv46wd7qc3zv2li2@redhat.com>
References: <20211008133442.141332-1-kwolf@redhat.com>
 <20211008133442.141332-10-kwolf@redhat.com>
 <20211011210025.kq4qjwn7kzfcwwl5@redhat.com>
 <5a732276-a974-1a8c-7f45-921713454bfa@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <5a732276-a974-1a8c-7f45-921713454bfa@greensocs.com>
User-Agent: NeoMutt/20210205-854-613e2c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, libvir-list@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 vsementsov@virtuozzo.com, its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 03:10:38PM +0200, Damien Hedde wrote:
> > > @@ -691,7 +703,13 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
> > >           }
> > >       }
> > > -    qdev_set_id(dev, g_strdup(qemu_opts_id(opts)));
> > > +    /*
> > > +     * set dev's parent and register its id.
> > > +     * If it fails it means the id is already taken.
> > > +     */
> > > +    if (!qdev_set_id(dev, g_strdup(qemu_opts_id(opts)), errp)) {
> > > +        goto err_del_dev;
> > 
> > ...nor on this, which means the g_strdup() leaks on failure.
> > 
> 
> Since we strdup the id just before calling qdev_set_id.
> Maybe we should do the the strdup in qdev_set_id (and free things on error
> there too). It seems simplier than freeing things on the callee side just in
> case of an error.

Indeed.  If we expected qdev_set_id() to be passed something that it
can later free, we would have used 'char *'; but because we used
'const char *' for that parameter, it really does make more sense for
the callers to pass in any string and for qdev_set_id() to do the
necessary strdup()ing, as well as clean up on error.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


