Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5CB2D30BD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 18:15:05 +0100 (CET)
Received: from localhost ([::1]:53236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmgZq-0005Fg-T9
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 12:15:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kmgXG-0003be-KP
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:12:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kmgXD-0007HJ-A5
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:12:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607447537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+slDR5+j+Bl3ETtqMHeTsyjy0HFVQdSvzls9do+w/6M=;
 b=Ds2Yk/CM1GATRKmbNIo1gL2hJCo4S3P2eWsASgcIicKtnqOFAbNrDo+wGHSB6Lwo+35J4I
 L/u7luYVVvv5mgs3K2a64LSt/jYBAudfeIDh1taI0VrHGD02CVh7T2rWWSlWLSjBmjTyCu
 Xf6EMFyxPI1RD0gsMzGdA5Pf6bqwoQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-QumKW06uPM641tW5Paj5bQ-1; Tue, 08 Dec 2020 12:12:15 -0500
X-MC-Unique: QumKW06uPM641tW5Paj5bQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0E36180E46A;
 Tue,  8 Dec 2020 17:11:49 +0000 (UTC)
Received: from starship (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A12AE6E528;
 Tue,  8 Dec 2020 17:11:46 +0000 (UTC)
Message-ID: <d37114774b4f6cf23134ea459a6e4d7d773d61b4.camel@redhat.com>
Subject: Re: [PATCH v3 2/2] block: qcow2: remove the created file on
 initialization error
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, 
 qemu-devel@nongnu.org
Date: Tue, 08 Dec 2020 19:11:45 +0200
In-Reply-To: <e851592e-016f-9292-f265-f03276b04f7a@virtuozzo.com>
References: <20201208142159.492489-1-mlevitsk@redhat.com>
 <20201208142159.492489-3-mlevitsk@redhat.com>
 <87338c70-225e-d238-3a68-acd811716aba@virtuozzo.com>
 <e3d93eb4499c613f7fa9f998e7a85ea373578965.camel@redhat.com>
 <e851592e-016f-9292-f265-f03276b04f7a@virtuozzo.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-12-08 at 19:54 +0300, Vladimir Sementsov-Ogievskiy wrote:
> 08.12.2020 19:27, Maxim Levitsky wrote:
> > On Tue, 2020-12-08 at 18:47 +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > 08.12.2020 17:21, Maxim Levitsky wrote:
> > > > If the qcow initialization fails, we should remove the file if it was
> > > > already created, to avoid leaving stale files around.
> > > > 
> > > > We already do this for luks raw images.
> > > > 
> > > > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > > > ---
> > > >    block/qcow2.c | 13 +++++++++++++
> > > >    1 file changed, 13 insertions(+)
> > > > 
> > > > diff --git a/block/qcow2.c b/block/qcow2.c
> > > > index 3a90ef2786..3bc2096b72 100644
> > > > --- a/block/qcow2.c
> > > > +++ b/block/qcow2.c
> > > > @@ -3848,6 +3848,19 @@ static int coroutine_fn qcow2_co_create_opts(BlockDriver *drv,
> > > >        /* Create the qcow2 image (format layer) */
> > > >        ret = qcow2_co_create(create_options, errp);
> > > >        if (ret < 0) {
> > > > +
> > > > +        Error *local_delete_err = NULL;
> > > > +        int r_del = bdrv_co_delete_file(bs, &local_delete_err);
> > > > +        /*
> > > > +         * ENOTSUP will happen if the block driver doesn't support
> > > > +         * the 'bdrv_co_delete_file' interface. This is a predictable
> > > > +         * scenario and shouldn't be reported back to the user.
> > > > +         */
> > > > +        if ((r_del < 0) && (r_del != -ENOTSUP)) {
> > > > +            error_report_err(local_delete_err);
> > > > +        } else {
> > > > +            error_free(local_delete_err);
> > > > +        }
> > > >            goto finish;
> > > >        }
> > > >    
> > > > 
> > > 
> > > Hi!
> > > 
> > > As I understand, qcow2_co_create is a new interface and qcow2_co_create_opts() is old, and now works as a wrapper on qcow2_co_create.
> > > 
> > > I think it's better to do the cleanup in qcow2_co_create, to bring the feature both to new and old interface in the same way.
> > 
> > I think that the new interface doesn't need this fix, since
> > using the new interface is only possible from qmp which
> > forces the user to explicitly create and open the file
> > prior to formatting it with qcow2 format.
> > 
> 
> Oh yes, you are right. File is created by bdrv_create_file() in qcow2_co_create_opts() not in qcow2_co_create(). Still, I think, you should remove the file on any failure after bdrv_create_file() call, but you remove it only on the last failure point..

You are right! The bulk of the code that can fail is in qcow2_co_create_opts but there 
are indeed few error conditions prior to that.

Thanks for pointing that out.
I'll fix that.

Best regards,
	Maxim Levitsky


> 
> 



