Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF51511842
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 15:23:52 +0200 (CEST)
Received: from localhost ([::1]:48862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njhe3-00005H-Qr
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 09:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1njhcS-0006sU-Va
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 09:22:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1njhcR-0004qI-Ac
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 09:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651065730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JnV28g7P9NZReDcOOlM86fhKA+mVcbhjv7kqaMYwkSI=;
 b=bukeCihcM5ncAmjlaqSMRK+Sqh0y03hEjBbELZo/e0fVKZRLjCiQMKCJLRedMP9nBL8Ali
 aIomRyzyy54SVHFgUUeRaAoP8ogrlxX6/8f4NMkkLiw/WCT8aQVRXhEtvPM5BjqD76Rjdx
 MsjPDFk28NXt9OLfnpYAiIF8//H1iVU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-D_huR2ZZN5-WjJrSOQh9Eg-1; Wed, 27 Apr 2022 09:22:07 -0400
X-MC-Unique: D_huR2ZZN5-WjJrSOQh9Eg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D81C9281AF02;
 Wed, 27 Apr 2022 13:22:06 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 303EDC08087;
 Wed, 27 Apr 2022 13:22:04 +0000 (UTC)
Date: Wed, 27 Apr 2022 15:22:03 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Subject: Re: [PATCH v4 4/6] vduse-blk: implements vduse-blk export
Message-ID: <YmlDe5uh5NSjQT3n@redhat.com>
References: <20220406075921.105-1-xieyongji@bytedance.com>
 <20220406075921.105-5-xieyongji@bytedance.com>
 <Ymglzs0iKKUFiFNW@redhat.com>
 <CACycT3t5YJmo=zwVUF=gbfK5eczqZ1rx1ZaP6iePr7PLBJPzfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACycT3t5YJmo=zwVUF=gbfK5eczqZ1rx1ZaP6iePr7PLBJPzfQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, jsnow@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.04.2022 um 05:11 hat Yongji Xie geschrieben:
> On Wed, Apr 27, 2022 at 1:03 AM Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Am 06.04.2022 um 09:59 hat Xie Yongji geschrieben:
> > > This implements a VDUSE block backends based on
> > > the libvduse library. We can use it to export the BDSs
> > > for both VM and container (host) usage.
> > >
> > > The new command-line syntax is:
> > >
> > > $ qemu-storage-daemon \
> > >     --blockdev file,node-name=drive0,filename=test.img \
> > >     --export vduse-blk,node-name=drive0,id=vduse-export0,writable=on
> > >
> > > After the qemu-storage-daemon started, we need to use
> > > the "vdpa" command to attach the device to vDPA bus:
> > >
> > > $ vdpa dev add name vduse-export0 mgmtdev vduse
> > >
> > > Also the device must be removed via the "vdpa" command
> > > before we stop the qemu-storage-daemon.
> > >
> > > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> >
> > The request handling code is almos the same as for the vhost-user-blk
> > export. I wonder if we could share this code instead of copying.
> >
> 
> I think we can. Will do it v5.
> 
> > The main difference seems to be that you chose not to support discard
> > and write_zeroes yet. I'm curious if there is a reason why the
> > vhost-user-blk code wouldn't work for vdpa there?
> >
> 
> They are different protocols. The data plane is similar, so we can
> share some codes. But the control plane is different, e.g., vhost-user
> can only work for guests but vdpa can work for both guests and hosts.

Yes, sure, but discard/write_zeroes are part of the data plane, no?
You're already sharing (or at the moment copying) the code for the other
request types mostly unchanged, so I wondered what is different about
discard/write_zeroes.

Kevin


