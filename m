Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76392382CE0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:09:29 +0200 (CEST)
Received: from localhost ([::1]:34524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liczw-0004Rs-F0
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1licyy-0003h8-PE
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:08:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1licyt-0004gj-2q
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621256901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CPWzzsmU20vjoqkbdJrZdsQdEtWUqEMadCuZOAsB0nY=;
 b=aA4zk0sHiaOEGPrgNuWxyue8/5aM8Kvai95u9uwaBoWKsEK4h7eh95Wz1jSBEG9CJHBTYc
 /EhCj0WqQFFGkdEgExWCVfkvJRLj9Bm/BugXy9aYZw6m4cpx7lMeIVGZui7uRxdp10kFUd
 HD8ESjeWfKb2+6vnkdAph5biH2H59nY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-1yKZ9e_0Ohu49FdygKL2lg-1; Mon, 17 May 2021 09:08:19 -0400
X-MC-Unique: 1yKZ9e_0Ohu49FdygKL2lg-1
Received: by mail-qv1-f69.google.com with SMTP id
 c5-20020a0ca9c50000b02901aede9b5061so4681619qvb.14
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 06:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CPWzzsmU20vjoqkbdJrZdsQdEtWUqEMadCuZOAsB0nY=;
 b=MEGjvfogpP9ePKP1Gg6cKlBMdSQBAlCKy26T1Db47GQdIXzU4r/XHAKOsRZUoQNRP6
 rdb67BmZhkKhVBgwJBVuiqk4CMPoE2H9WdN72Vis/65QN+TIQS2L1QnLUiV+m007yADU
 BNj2K6tfCLPtM1YmtmADeVotwxMWVIF/0tYTmsP2EqU57B65mG5o1Q8AN0iwH0XF7YhY
 nwwg0jpeiavv41uiJ2YDoGyfRKH6flUJXaiMeVHvoId4QNu8yCzjkBzIib72xowWr4zV
 VYCnkVDoQ4LgFdbF/25SGZIdXF16lC0gn9y581ESV1rJcXvpRtRRMXClb6SpOD/8nokw
 +3vA==
X-Gm-Message-State: AOAM530ULa4ofU/05bCRKfIebd1sDc1/gaHXAzF/u+xkRFGOyMOTFb/c
 TYkcQisEO2TZsV2e/SEbAXhBWZNS2X4shw+W9rbBUAIZ0hJNd/G5GB/Fv5+jPJHk+G2SyI0RTsH
 CNgcwSLiFx9fMyWg=
X-Received: by 2002:a05:622a:15:: with SMTP id
 x21mr24161033qtw.234.1621256899104; 
 Mon, 17 May 2021 06:08:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOBYHw+uerOuvhdUyf3PFZFAOD6tcw8dOul3qD/okyJ29XImDCsgY5ikxWHCGUmeFbBKRvzA==
X-Received: by 2002:a05:622a:15:: with SMTP id
 x21mr24161005qtw.234.1621256898934; 
 Mon, 17 May 2021 06:08:18 -0700 (PDT)
Received: from horse.lan (pool-173-76-174-238.bstnma.fios.verizon.net.
 [173.76.174.238])
 by smtp.gmail.com with ESMTPSA id f8sm10243814qka.86.2021.05.17.06.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 06:08:18 -0700 (PDT)
Date: Mon, 17 May 2021 09:08:16 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 7/7] virtiofsd: Set req->reply_sent right
 after sending reply
Message-ID: <20210517130816.GC546943@horse.lan>
References: <20210511213736.281016-1-vgoyal@redhat.com>
 <20210511213736.281016-8-vgoyal@redhat.com>
 <5ad6f5e9-0a12-54ce-163a-532f916cc8e8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5ad6f5e9-0a12-54ce-163a-532f916cc8e8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 13, 2021 at 03:50:13PM -0500, Connor Kuehl wrote:
> On 5/11/21 4:37 PM, Vivek Goyal wrote:
> > There is no reason to set it in label "err". We should be able to set
> > it right after sending reply. It is easier to read.
> > 
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> >  tools/virtiofsd/fuse_virtio.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> > index aa53808ef9..b1767dd5b9 100644
> > --- a/tools/virtiofsd/fuse_virtio.c
> > +++ b/tools/virtiofsd/fuse_virtio.c
> > @@ -446,12 +446,9 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
> >      vu_queue_notify(dev, q);
> >      pthread_mutex_unlock(&qi->vq_lock);
> >      vu_dispatch_unlock(qi->virtio_dev);
> > +    req->reply_sent = true;
> >  
> >  err:
> 
> Just a really minor comment: after all these changes, I would venture
> that "out" is a more appropriate label name than "err" at this point.

May be. This path is used both by error path as well as success path. Just
that value of "ret" changes. I am not particular about it. So I will
change this to "out".

Thanks
Vivek
> 
> > -    if (ret == 0) {
> > -        req->reply_sent = true;
> > -    }
> > -
> >      return ret;
> >  }
> >  
> > 
> 


