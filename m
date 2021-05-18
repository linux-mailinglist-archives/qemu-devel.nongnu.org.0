Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3C438792C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:50:28 +0200 (CEST)
Received: from localhost ([::1]:46836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizB5-00069I-B2
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1liyvR-00054p-6f
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:34:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1liyvP-0000QN-Av
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621341254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/bMsaabbuOnd8qsOzFvEpi7QqzGfMz5MDDxSOLYSVlI=;
 b=bnc2HYKfrKRr/TEESQjBjGsDHNsfEm80OZ9fPGUSMZcAqDAKMwne9jAWesOLiLa6ThM3Oj
 uryzYrrgsjqYgpu2vh9lhootUn78QLa6TlvJWi/ulNExxUmwpwN+xFvp50FVNq0wTyXiZh
 UyK5dOCD9O7UM8E7k3NDIqudG+4Xy8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-Tl-7B4ZvPE6fEgDcm_-Dtg-1; Tue, 18 May 2021 08:34:10 -0400
X-MC-Unique: Tl-7B4ZvPE6fEgDcm_-Dtg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB8E61922962
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:34:09 +0000 (UTC)
Received: from work-vm (ovpn-115-45.ams2.redhat.com [10.36.115.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAA2A1897F;
 Tue, 18 May 2021 12:34:08 +0000 (UTC)
Date: Tue, 18 May 2021 13:34:06 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 7/7] virtiofsd: Set req->reply_sent right
 after sending reply
Message-ID: <YKO0PnCCO7jMBmBB@work-vm>
References: <20210511213736.281016-1-vgoyal@redhat.com>
 <20210511213736.281016-8-vgoyal@redhat.com>
 <5ad6f5e9-0a12-54ce-163a-532f916cc8e8@redhat.com>
 <20210517130816.GC546943@horse.lan>
MIME-Version: 1.0
In-Reply-To: <20210517130816.GC546943@horse.lan>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Connor Kuehl <ckuehl@redhat.com>, virtio-fs@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> On Thu, May 13, 2021 at 03:50:13PM -0500, Connor Kuehl wrote:
> > On 5/11/21 4:37 PM, Vivek Goyal wrote:
> > > There is no reason to set it in label "err". We should be able to set
> > > it right after sending reply. It is easier to read.
> > > 
> > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > ---
> > >  tools/virtiofsd/fuse_virtio.c | 5 +----
> > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > > 
> > > diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> > > index aa53808ef9..b1767dd5b9 100644
> > > --- a/tools/virtiofsd/fuse_virtio.c
> > > +++ b/tools/virtiofsd/fuse_virtio.c
> > > @@ -446,12 +446,9 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
> > >      vu_queue_notify(dev, q);
> > >      pthread_mutex_unlock(&qi->vq_lock);
> > >      vu_dispatch_unlock(qi->virtio_dev);
> > > +    req->reply_sent = true;
> > >  
> > >  err:
> > 
> > Just a really minor comment: after all these changes, I would venture
> > that "out" is a more appropriate label name than "err" at this point.
> 
> May be. This path is used both by error path as well as success path. Just
> that value of "ret" changes. I am not particular about it. So I will
> change this to "out".

Well, if it only does 'return ret' we can get rid of the
label and just do return's at the places that did the goto's.

Dave

> Thanks
> Vivek
> > 
> > > -    if (ret == 0) {
> > > -        req->reply_sent = true;
> > > -    }
> > > -
> > >      return ret;
> > >  }
> > >  
> > > 
> > 
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


