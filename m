Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7B54B4215
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 07:46:44 +0100 (CET)
Received: from localhost ([::1]:51146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJV8F-0001OV-9p
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 01:46:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJV22-0008No-BQ
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 01:40:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJV1z-0005Qz-8M
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 01:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644820804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Di4bjUXM9HtvovYPTLKdxIACS50VdZ+IBHjMot7dkNg=;
 b=EhIIB9BWfqb5+CBQOk3ZF13jDLrn0jscjROH1cEGQw1v6nu+a3sZVawZl8tZSfuwuNB/sE
 JamB9A6E7OEkWwEjFcYI7SEMr12UXo52X/UNooiU9W1l2S63DhPVyn4TgeFmBFN1F6DbgZ
 LHDM6CsdNs+CbJqNT5TZA0EjoJEhD5Y=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-yKcMG7bfMrmlfIaU_u0frw-1; Mon, 14 Feb 2022 01:40:03 -0500
X-MC-Unique: yKcMG7bfMrmlfIaU_u0frw-1
Received: by mail-pl1-f200.google.com with SMTP id
 r19-20020a170902be1300b0014edf03f82eso2744337pls.20
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 22:40:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Di4bjUXM9HtvovYPTLKdxIACS50VdZ+IBHjMot7dkNg=;
 b=JBJ/R9vMLnbazFFQGJgFOF4hB8zOCnS096Q5Zt99NGdYhwc0Ps1m45ZYRugibWEz/w
 vrTjTpo8hL+wBVkhRuQbYn+H0AD8Che9wySlm8UglEQeXrZwJEQS7uP9qGX8pFxRkdv+
 0oi7o0kpL8tABBp2YVCEFEU1oBvskH0T1hu3Cq1FaVZT82BFPEevgmfajOKM38RfMib3
 /EeBtRGdWDeYEVjADIoZ7wXzRAL93JGZ/4KNt8mdFDMbHePPOndN24Vq1bQaZ4q4TutQ
 XHvPKzGhozBRsrK1FY/aiKfDyju+k0tnuI69JiCz2dx12OW/WAsGYYgx8FquzLcZX/F7
 dvIA==
X-Gm-Message-State: AOAM533xl9sUGPyoKfHUwgU1vg6AmqxLrLWx1zWm1DwLcc0knVHogwl+
 TFqoQFWN0wZWZULTwcOQJHYWb/3lbRL/M6moHNzynRPlC6JyuuAd4JWc4H25gsNnK4JIPknIaLe
 JshCAuGEQYe5Q/xc=
X-Received: by 2002:a17:90a:7148:: with SMTP id
 g8mr5936542pjs.35.1644820802115; 
 Sun, 13 Feb 2022 22:40:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9297ULSHaf9syHHsfsfcV3jblBvYVQS16RPtxgMGiZrqkmFxvzuKjRo7ozyV8W8/Zcb5oyw==
X-Received: by 2002:a17:90a:7148:: with SMTP id
 g8mr5936515pjs.35.1644820801832; 
 Sun, 13 Feb 2022 22:40:01 -0800 (PST)
Received: from xz-m1.local ([94.177.118.137])
 by smtp.gmail.com with ESMTPSA id n13sm12580545pjq.13.2022.02.13.22.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 22:40:01 -0800 (PST)
Date: Mon, 14 Feb 2022 14:39:56 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] intel_iommu: support snoop control
Message-ID: <Ygn5PIBNFrWG1+2Y@xz-m1.local>
References: <20220214060346.72455-1-jasowang@redhat.com>
 <Ygn3I3T2DH3SHFXj@xz-m1.local>
 <CACGkMEvr+EDokjH6b3kMac-Zf_n+6KY5+L105Gh4QLquWZUX+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvr+EDokjH6b3kMac-Zf_n+6KY5+L105Gh4QLquWZUX+Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 02:35:18PM +0800, Jason Wang wrote:
> On Mon, Feb 14, 2022 at 2:31 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Mon, Feb 14, 2022 at 02:03:46PM +0800, Jason Wang wrote:
> > > SC is required for some kernel features like vhost-vDPA. So this patch
> > > implements basic SC feature. The idea is pretty simple, for software
> > > emulated DMA it would be always coherent. In this case we can simple
> > > advertise ECAP_SC bit. For VFIO and vhost, thing will be more much
> > > complicated, so this patch simply fail the IOMMU notifier
> > > registration.
> >
> > Could we spell out which vhost branch won't work?
> 
> For vhost, it should work but the problem is that we need to introduce
> more logics to demonstrate the notifier ability (e.g a dedicated
> notifier flag for cc).
> 
> > How about also mention what
> > this patch is used for (perhaps for some pure vdpa tests on fully emulated)?
> 
> That's fine, the main use case so far is to test vDPA in L1 guest.

Yeah, that looks okay.  Leave it be or add some commit message would work too,
either way:

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


