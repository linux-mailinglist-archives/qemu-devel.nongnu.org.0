Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAD72D58DA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:04:46 +0100 (CET)
Received: from localhost ([::1]:57440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knJkb-000288-MC
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1knJim-0001YO-ME
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:02:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1knJij-00089Q-Fk
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607598168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=epsU98XPqS+LLsUNt83ZQUJFq2UiqfQVnriGRV6+psw=;
 b=Eg1YXMORrqNK6btn/jg77YJCHpzigr6DQarqvh456gnf9dnRcE2+FMTGj2sz7AbXS9Ozvg
 ONXoe5KhqqsyU9omT7hiuE6sEUkd5qfrStPzEfH4LTL/sV0DIVdexK99EgB632kAkenhJa
 /ims/iDpwyjhnQ71OsymkRnDl0aBP6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-M4cvxivwObC323mVhXCA6g-1; Thu, 10 Dec 2020 06:02:45 -0500
X-MC-Unique: M4cvxivwObC323mVhXCA6g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C82E11007465;
 Thu, 10 Dec 2020 11:02:43 +0000 (UTC)
Received: from starship (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DE705D9DD;
 Thu, 10 Dec 2020 11:02:40 +0000 (UTC)
Message-ID: <b4d3ed25f62205f57681600b73ad1ea4257b32b8.camel@redhat.com>
Subject: Re: [PATCH v5 4/4] block: qcow2: remove the created file on
 initialization error
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, 
 qemu-devel@nongnu.org
Date: Thu, 10 Dec 2020 13:02:38 +0200
In-Reply-To: <8a89f793-23a9-e209-bc34-fe273897143e@virtuozzo.com>
References: <20201209203326.879381-1-mlevitsk@redhat.com>
 <20201209203326.879381-5-mlevitsk@redhat.com>
 <8a89f793-23a9-e209-bc34-fe273897143e@virtuozzo.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-12-10 at 14:00 +0300, Vladimir Sementsov-Ogievskiy wrote:
> 09.12.2020 23:33, Maxim Levitsky wrote:
> > If the qcow initialization fails, we should remove the file if it was
> > already created, to avoid leaving stale files around.
> > 
> > We already do this for luks raw images.
> > 
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > Reviewed-by: Alberto Garcia <berto@igalia.com>
> > ---
> >   block/qcow2.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/block/qcow2.c b/block/qcow2.c
> > index 3a90ef2786..68c9182f92 100644
> > --- a/block/qcow2.c
> > +++ b/block/qcow2.c
> > @@ -3847,12 +3847,14 @@ static int coroutine_fn qcow2_co_create_opts(BlockDriver *drv,
> >   
> >       /* Create the qcow2 image (format layer) */
> >       ret = qcow2_co_create(create_options, errp);
> > +finish:
> >       if (ret < 0) {
> > -        goto finish;
> > +        bdrv_co_delete_file_noerr(bs);
> > +        bdrv_co_delete_file_noerr(data_bs);
> >       }
> >   
> >       ret = 0;
> 
> Ooops :) After this patch the function always returns zero :)

Indeed :-(

These small changes done in the last minute are the most dangerous.

Best regards,
	Maxim Levitsky
> 
> > -finish:
> > +
> >       qobject_unref(qdict);
> >       bdrv_unref(bs);
> >       bdrv_unref(data_bs);
> > 
> 
> 



