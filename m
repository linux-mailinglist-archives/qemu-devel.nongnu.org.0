Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2252F2CC44C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 18:53:27 +0100 (CET)
Received: from localhost ([::1]:51944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkWJi-0007Wy-7M
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 12:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkWHt-0006Yu-3V
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:51:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkWHr-0004Fp-G1
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606931489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VvMR0sWFDgR5yiezujeYPR/xreWHnc7psevnHYtF58w=;
 b=PGeahcGT8cODJ4/xKoUvROGrMdh8M68MolWQb22eQVYVicSNh9JkwU40Uf73iae6ujYqOs
 sGrvKQaUflWFkfVT4M6FTTNE0qGwHjTb0I91t7ho0WE4KfYooD1OxyMA+Ujs6bCWzlWJOQ
 hTkcMzj/pu5dmC9J2NaNgJLxldm4j+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-YAdpCHD8OLaWTbGr3vRkAQ-1; Wed, 02 Dec 2020 12:51:25 -0500
X-MC-Unique: YAdpCHD8OLaWTbGr3vRkAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57BA6100C60C;
 Wed,  2 Dec 2020 17:51:24 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-199.ams2.redhat.com [10.36.113.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 051CA189BB;
 Wed,  2 Dec 2020 17:51:22 +0000 (UTC)
Date: Wed, 2 Dec 2020 18:51:21 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: Plans to bring QMP 'x-blockdev-reopen' out of experimental?
Message-ID: <20201202175121.GI16765@merkur.fritz.box>
References: <20201006091001.GA64583@paraplu>
 <w51mu0ifbuf.fsf@maestria.local.igalia.com>
 <w51k0vmf9k3.fsf@maestria.local.igalia.com>
 <20201020082333.GB4452@merkur.fritz.box>
 <w51blfctcfb.fsf@maestria.local.igalia.com>
 <20201202162808.GG16765@merkur.fritz.box>
 <w518sagtb4j.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
In-Reply-To: <w518sagtb4j.fsf@maestria.local.igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: armbru@redhat.com, mreitz@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.12.2020 um 17:40 hat Alberto Garcia geschrieben:
> On Wed 02 Dec 2020 05:28:08 PM CET, Kevin Wolf wrote:
> 
> >> So x-blockdev-reopen sees that we want to replace the current
> >> bs->file ("hd0-file") with a new one ("throttle0"). The problem here
> >> is that throttle0 has hd0-file as its child, so when we check the
> >> permissions on throttle0 (and its children) we get that hd0-file
> >> refuses because it's already being used (although in in the process
> >> of being replaced) by hd0:
> >> 
> >> "Conflicts with use by hd0 as 'file', which does not allow 'write, resize' on hd0-file"
> >> 
> > This kind of situation isn't new, I believe some of the existing graph
> > changes (iirc in the context of block jobs) can cause the same problem.
> >
> > This is essentially why some functions in the permission system take a
> > GSList *ignore_children. So I believe the right thing to do here is
> > telling the permission system that it needs to check the situation
> > without the BdrvChild that links hd0 with hd0-file.
> 
> I had tried this already and it does work when inserting the filter (we
> know that 'hd0-file' is about to be detached from the parent so we can
> put it in the list) but I don't think it's so easy if we want to remove
> the filter, i.e.
> 
>    hd0 -> throttle -> hd0-file     ======>     hd0 -> hd0-file
> 
> In this case we get a similar error, we want to make hd0-file a child of
> hd0 but it is being used by the throttle filter.
> 
> Telling bdrv_check_update_perm() to ignore hd0's current child
> (throttle) won't solve the problem.

Isn't this the very same case as removing e.g. a mirror filter from the
chain? I'm sure we have already solved this somewhere.

Hm, no, it might actually be different in that the throttle node
survives this, so we do have to check that the resulting graph is
valid. Do we need a combined operation to remove the throttle node from
the graph and immediately delete it?

> > I don't know the exact stack trace of your failure, so maybe this
> > parameter isn't available yet in the place where you need it, but in
> > the core functions it exists.
> 
> This is in bdrv_reopen_multiple(), in the same place where we are
> currently checking the permissions of the new backing file.

Oh, it's not happening while actually changing the links, but the check
before trying? I guess both would fail in this case anyway, but good to
know.

Kevin


