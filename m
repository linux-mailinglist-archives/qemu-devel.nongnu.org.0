Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051E131CA48
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:59:46 +0100 (CET)
Received: from localhost ([::1]:39766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBz17-0007Nh-3g
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lByzm-0006X7-Fu
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:58:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lByzl-0004Ed-2N
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613476700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EHmbNEGxAHTifdf6N0xgYT+qSa50swbQBv8LjO/mXlQ=;
 b=dVyAh5wrmLmjLDE3c3fOKa24Pqaz58OBnLvldTZi4duoCYL0mxmeyMTaC5+F0neueLfV6l
 zMP+JrAskKphCyBOKN+vh8lPebFIiLCMYloiPkFkq9cJqWMzp0fpkDb8gn1J5wyeS+Vt3L
 p4r5e5//rbM2rZ/uk9oHVp6i5aukjf4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-buJuoMUlPIiliTjb98jxQg-1; Tue, 16 Feb 2021 06:58:16 -0500
X-MC-Unique: buJuoMUlPIiliTjb98jxQg-1
Received: by mail-ej1-f71.google.com with SMTP id w16so5906975ejk.7
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 03:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EHmbNEGxAHTifdf6N0xgYT+qSa50swbQBv8LjO/mXlQ=;
 b=g0J+lLHvMFeKXRuNe/6Xqqd6UrRL74x25eoH4PYjj8qgFWIhikb3QWZE4F7/X+6+jT
 QyXUBMucacgkSMaUUIN+nARB+yk2JjoYTIiTT0YIovm/35vC79qfL6clFkEFGepKDfkr
 V9TBt/ZDmfb633vuhefKTmqdNAmLJbdS+c6q/GbLedGuc5cCoOCtWFgA7smDd9V9mE6q
 mMHeYu6zKAFW6G++Fyl5NgQF/ca+xB8LZhSiUbcf3B8g+qHa5USbLza2eD/m38E7c1Jt
 csmcM+SAJAq4YNNM0M8X/BjrDyXdQuCfiQ3u9YlQeYtuIsHLf3lDnMg/ThKofemp9+xm
 GZeA==
X-Gm-Message-State: AOAM532n95cVDeUNyGAmB0W7aktMmpc9tLnl2FTfTRapfAOFFq2Zk3p/
 eyUL9iI4UmGMRzmqX0/omkd9CDSiDMcWTbcSl0QgoCFXtXRDmb59FW98V8FsqPBfIAQxjCG1MHK
 te9ySgEJbnvKQlO0=
X-Received: by 2002:a17:906:2681:: with SMTP id
 t1mr20413140ejc.29.1613476695092; 
 Tue, 16 Feb 2021 03:58:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTRMTOYmej4qDMo5Jtky44UIBKmpnMMVV/yxqnClj6aL1gC3ust5eSL9hFu2voN9fL4oB/Fw==
X-Received: by 2002:a17:906:2681:: with SMTP id
 t1mr20413117ejc.29.1613476694928; 
 Tue, 16 Feb 2021 03:58:14 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id a16sm4739694ejx.77.2021.02.16.03.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 03:58:14 -0800 (PST)
Date: Tue, 16 Feb 2021 06:58:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] virtio-ccw: commands on revision-less devices
Message-ID: <20210216065739-mutt-send-email-mst@kernel.org>
References: <20210216111830.1087847-1-cohuck@redhat.com>
 <20210216064013-mutt-send-email-mst@kernel.org>
 <20210216125150.5cce488d.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210216125150.5cce488d.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 16, 2021 at 12:51:50PM +0100, Cornelia Huck wrote:
> On Tue, 16 Feb 2021 06:40:41 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Tue, Feb 16, 2021 at 12:18:30PM +0100, Cornelia Huck wrote:
> > > The virtio standard specifies that any non-transitional device must
> > > reject commands prior to revision setting (which we do) and else
> > > assume revision 0 (legacy) if the driver sends a non-revision-setting
> > > command first. We neglected to do the latter.
> > > 
> > > Fortunately, nearly everything worked as intended anyway; the only
> > > problem was not properly rejecting revision setting after some other
> > > command had been issued. Easy to fix by setting revision to 0 if
> > > we see a non-revision command on a legacy-capable revision-less
> > > device.
> > > 
> > > Signed-off-by: Cornelia Huck <cohuck@redhat.com>  
> > 
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > Feel free to merge.
> > 
> > Curious how was this discovered.
> 
> Code reading :)
> 
> I have not seen any errors in the wild.

Worth including in the commit log.

-- 
MST


