Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EE0677A96
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 13:12:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJvgV-000679-2q; Mon, 23 Jan 2023 07:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pJvgL-00066k-VX
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:12:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pJvgK-0003ij-7Z
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:12:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674475931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Pz5bqC+1dFWHXTHCuh3EPA33hDztJpxpjwvljUkZAg=;
 b=frbeqUElPSmGuuKcK3gWvELZrBb3WDqIPvznAhOAKyilCcYbFV+4YltgjANSLCFRk80vD8
 3c5mbhfJeiNkGRVaA3QPThEK52jcKkFeYtCQ+J8bH7RcqVRuDZx7LtUPJSf4Ug2sA+X63V
 0J3Pg++3l+FTs9gS9Ep9vBP9HklZyKQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-lLbB4oKJMCy47IJNPlf5FA-1; Mon, 23 Jan 2023 07:12:09 -0500
X-MC-Unique: lLbB4oKJMCy47IJNPlf5FA-1
Received: by mail-ed1-f70.google.com with SMTP id
 w3-20020a056402268300b00487e0d9b53fso8391204edd.10
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 04:12:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Pz5bqC+1dFWHXTHCuh3EPA33hDztJpxpjwvljUkZAg=;
 b=1KGBmhVKcZL4isKHM60om4Wvctdgs40Jro+YOJS4BhXjHjIEkUtMXmmSqRqpq1vKZu
 iNuMJUDI24BAdWIQ3jyW4he7yiDR2ERVUbvxiEsKdvEx4SqDC2WgCH5ckwuNkpSZwGI4
 lBFIs42bGywTcCF6sZzOBXPOSeRnmSHB3aFo5zR76fJkVRJo0LqkzisBf8quD5SlnqB6
 9yjPuzIaenk22cHAUCQi7iGtt0xpiyx48bpF3fz0DZvEnTMhzuy+MBKQE4jU1/fQxohi
 gIMEACgNIv9HJMPYPHMY60P6nFbIAfJj1BC5WBJEuEiGVoHmzyOOENMxXB5VvpLsrdsT
 GBng==
X-Gm-Message-State: AFqh2koMMIyXWktiEZwmmLCrxn+NkrlnzKpq1x463Myv+w+odjndkydp
 +F69VZpE5NZUorkL8aQN1oG7RS4O5Ws8qHCNQB3oMalFLuMUHxzdjgz/HrsR9Rr5+Ps3raj8id5
 PdCTGCVpay/xSPAU=
X-Received: by 2002:a50:c049:0:b0:49e:5902:39d0 with SMTP id
 u9-20020a50c049000000b0049e590239d0mr18696343edd.12.1674475928528; 
 Mon, 23 Jan 2023 04:12:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvjSraSuZrhamfx9NcVTJNClI4px1dEDL9c1v8L+blMlG1YGnPb0dkO685NX269VLr8Kqtmxw==
X-Received: by 2002:a50:c049:0:b0:49e:5902:39d0 with SMTP id
 u9-20020a50c049000000b0049e590239d0mr18696325edd.12.1674475928293; 
 Mon, 23 Jan 2023 04:12:08 -0800 (PST)
Received: from redhat.com ([2.52.149.29]) by smtp.gmail.com with ESMTPSA id
 ec49-20020a0564020d7100b0049e249c0e56sm10594377edb.56.2023.01.23.04.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 04:12:07 -0800 (PST)
Date: Mon, 23 Jan 2023 07:12:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 pbonzini@redhat.com, Mathias Krause <minipli@grsecurity.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH qemu v3] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <20230123071128-mutt-send-email-mst@kernel.org>
References: <Y69fUstLKNv/RLd7@zx2c4.com>
 <20221230220725.618763-1-Jason@zx2c4.com>
 <Y72FmQlNwBsp8Ntc@zx2c4.com>
 <20230110125005-mutt-send-email-mst@kernel.org>
 <Y84LSgtrq1Rq3ItD@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y84LSgtrq1Rq3ItD@sol.localdomain>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Jan 22, 2023 at 08:21:30PM -0800, Eric Biggers wrote:
> Hi Michael,
> 
> On Tue, Jan 10, 2023 at 12:50:42PM -0500, Michael S. Tsirkin wrote:
> > On Tue, Jan 10, 2023 at 04:34:49PM +0100, Jason A. Donenfeld wrote:
> > > Hi Michael,
> > > 
> > > Could you queue up this patch and mark it as a fix for 7.2.1? It is a
> > > straight-up bug fix for a 7.2 regression that's now affected several
> > > users.
> > 
> > OK. In the future pls cc me if you want me to merge a patch. Thanks!
> > 
> > > - It has two Tested-by tags on the thread.
> > > - hpa, the maintainer of the kernel side of this, confirmed on one of
> > >   the various tributary threads that this approach is a correct one.
> > > - It doesn't introduce any new functionality.
> > > 
> > > For your convenience, you can grab this out of lore here:
> > > 
> > >   https://lore.kernel.org/lkml/20221230220725.618763-1-Jason@zx2c4.com/
> > > 
> > > Or if you want to yolo it:
> > > 
> > >   curl https://lore.kernel.org/lkml/20221230220725.618763-1-Jason@zx2c4.com/raw | git am -s
> > > 
> > > It's now sat silent on the mailing list for a while. So let's please get
> > > this committed and backported so that the bug reports stop coming in.
> > > 
> 
> This patch still isn't on QEMU's master branch.  What happened to it?
> 
> - Eric

Indeed though I remember picking it up. Tagged again now. Thanks!


