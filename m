Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE147526BBB
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 22:44:04 +0200 (CEST)
Received: from localhost ([::1]:44222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npc8p-0008U8-C9
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 16:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1npc7A-0006zG-5G
 for qemu-devel@nongnu.org; Fri, 13 May 2022 16:42:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1npc77-0004la-4l
 for qemu-devel@nongnu.org; Fri, 13 May 2022 16:42:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652474536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BjtN1LesFxVKEwBz47Kxw0Sbgj11YNL8OoCDORnZuig=;
 b=Hi4fKS7qNFmnWPPD59TlcXJ4oS17QrfaM+t4RJrtvAEDqgwFTjdj0j6aG2tjmBOjyG37V+
 HekuGpyWuYzUinqro30Nqy84AxXALOywzNu1UXF9E6Yn/RXF/RvH4MKNrwCuVbahQ1PFDm
 re55IA4NwUe4zYe1y/NqSnSWFyBQ1SY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-e3fSI8KBOle2ZK1b2-BM9g-1; Fri, 13 May 2022 16:42:12 -0400
X-MC-Unique: e3fSI8KBOle2ZK1b2-BM9g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D8793806704;
 Fri, 13 May 2022 20:42:12 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C9322026985;
 Fri, 13 May 2022 20:42:11 +0000 (UTC)
Date: Fri, 13 May 2022 15:42:09 -0500
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 06/13] nbd: remove peppering of nbd_client_connected
Message-ID: <20220513204209.avm64zrxqay5vryy@redhat.com>
References: <20220426201514.170410-1-eblake@redhat.com>
 <20220426201514.170410-7-eblake@redhat.com>
 <CAFEAcA_Ggo+2e4=6inTxKc=h6L1WEzORwiiRfQxs=wFZL2vUow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_Ggo+2e4=6inTxKc=h6L1WEzORwiiRfQxs=wFZL2vUow@mail.gmail.com>
User-Agent: NeoMutt/20220429-54-2d64b2
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 12, 2022 at 05:16:04PM +0100, Peter Maydell wrote:
> On Tue, 26 Apr 2022 at 21:21, Eric Blake <eblake@redhat.com> wrote:
> >
> > From: Paolo Bonzini <pbonzini@redhat.com>
> >
> > It is unnecessary to check nbd_client_connected() because every time
> > s->state is moved out of NBD_CLIENT_CONNECTED the socket is shut down
> > and all coroutines are resumed.
> 
> Hi; Coverity points out (CID 1488362) that this part of this change
> has resulted in some dead code:
> 
> > @@ -512,7 +508,7 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
> >      if (qiov) {
> >          qio_channel_set_cork(s->ioc, true);
> >          rc = nbd_send_request(s->ioc, request);
> > -        if (nbd_client_connected(s) && rc >= 0) {
> > +        if (rc >= 0) {
> >              if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
> >                                         NULL) < 0) {
> >                  rc = -EIO;
> 
> because the change means this code is now
> 
>         if (rc >= 0) {
>             if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
>                                        NULL) < 0) {
>                 rc = -EIO;
>             }
>         } else if (rc >= 0) {
>             rc = -EIO;
>         }
> 
> and the "else if" clause is dead and can be deleted.

Thanks for reporting it.  I can prepare a patch.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


