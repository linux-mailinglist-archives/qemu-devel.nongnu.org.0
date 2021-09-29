Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3967A41C61E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:55:39 +0200 (CEST)
Received: from localhost ([::1]:56440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVa3d-0007Kb-PT
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mVZlL-0004j2-N3
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:36:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mVZlK-00016w-4s
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632922601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LYtViig/g1dl4E8j8DohGhGsBBf6SN4aPtWa7MUuC9w=;
 b=GmZm46snxD3GBWBgaJu1nSrB8fHWXIUVjHt9kgtDDzOg8Hh3ZNFCyw+ZO/d81HZwd9mGRS
 jd+hFPSr4OftO68CWajgfxfuHpS19Z9xsRy8VrKiqCSONvbQ6y8dqRaCd4g0ErhUQgVJyg
 S1P1q938N9PU/38LaLS4pa+BRnw6UsI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-wV-Pn8I2O6C70hCd5Lp2zA-1; Wed, 29 Sep 2021 09:36:31 -0400
X-MC-Unique: wV-Pn8I2O6C70hCd5Lp2zA-1
Received: by mail-ed1-f70.google.com with SMTP id
 z6-20020a50cd06000000b003d2c2e38f1fso2464674edi.1
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LYtViig/g1dl4E8j8DohGhGsBBf6SN4aPtWa7MUuC9w=;
 b=VLLEo9WUiQh9ganYG36BS5mmm2TOG2G3sdOvDyk49f+teHkl0Bjp3mScrc1OgEGBDc
 sTU3ThfbWv0eSRpQi3OlVl41vjl73VhY/EX4DzkwagywAWDgFUlg2EZbOE7shlXMojrt
 4sd/WhwVYj5aGXC36sSpddwvq+gYxFuSD9ynzYNPH0tfmX87QN3mx4FoxBAQD85xCN1G
 7yh7arSFwVzFfwPDHGIYlkLsFEjIHRW44Ttf5kP3xTWbXZATm6yY5bZY2CqQvtr1tUXz
 zfm0QYTi0NkMtQVx4DVmJf+1ZgUPCC2NUD3KjGfvZdg6nA7Lo15/yxKGVBwd+76nn+85
 2DFA==
X-Gm-Message-State: AOAM5333TDzo83Wq8Ql9KBO6QNf6dzkabnZYdNZtFFJqThl/gmdnnmSV
 ue03we8ojhZNo//N2Z0DEilQ0hmBmujntzhRtmhXDogeyjrUvehutSLzLy+ZmwiM4MCHhSau4+5
 YO3/n0765w1PwQdw=
X-Received: by 2002:aa7:d7d5:: with SMTP id e21mr15257738eds.27.1632922589953; 
 Wed, 29 Sep 2021 06:36:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMhatOuAT23/V8rt9p/f7ouxvf6ydFljvi9kW1BEOp6jdvWq/EPq9XKcuRB1FA8u5yUxLi0w==
X-Received: by 2002:aa7:d7d5:: with SMTP id e21mr15257724eds.27.1632922589799; 
 Wed, 29 Sep 2021 06:36:29 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207e:f99f:d8a8:76c3:157e:444b])
 by smtp.gmail.com with ESMTPSA id i6sm1387339ejd.57.2021.09.29.06.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:36:29 -0700 (PDT)
Date: Wed, 29 Sep 2021 09:36:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH] virtio-net : Add check for VIRTIO_NET_F_MAC
Message-ID: <20210929093513-mutt-send-email-mst@kernel.org>
References: <20210929065215.21549-1-lulu@redhat.com>
 <8566c96d-5a61-fec7-f898-e5ac0937fd06@msgid.tls.msk.ru>
 <CACLfguUZ-JrcGenNecUZkaXf7upRiih73QPkhxN+fPKFaEpL8A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACLfguUZ-JrcGenNecUZkaXf7upRiih73QPkhxN+fPKFaEpL8A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Cc: Jason Wang <jasowang@redhat.com>, mjt@tls.msk.ru,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 08:08:40PM +0800, Cindy Lu wrote:
> On Wed, Sep 29, 2021 at 6:07 PM Michael Tokarev <mjt@tls.msk.ru> wrote:
> >
> > 29.09.2021 09:52, Cindy Lu wrote:
> > > For vdpa device, if the host support VIRTIO_NET_F_MAC
> > > we need to read the mac address from hardware, so need
> > > to check this bit, the logic is
> > > 1 if the host support VIRTIO_NET_F_MAC and the mac address
> > >     is correct, qemu will use the mac address in hardware
> > > 2.if the host not support , qemu will use the mac from cmdline
> >
> > So if hw supports NET_F_MAC, cmdline-provided parameter will
> > silently be ignored?
> >
> yes, this is based on the virtio spec, you can check this document in
> 5.1.5 Device Initialization
> https://docs.oasis-open.org/virtio/virtio/v1.1/csprd01/virtio-v1.1-csprd01.html

Maybe use the hw mac if mac is not provided? If provided
make sure the command line matches the hardware, and fail
otherwise?

> Also, this check it only working for vdpa device
> > s/host not support/host does not support this feature/
> Thanks , will fix this
> >
> > > 3.if the cmdline not provide mac address, qemu will use radam mac
> > > address
> >
> > s/not/does not/
> > s/radam/random/
> >
> thanks, will fix this
> > Thanks,
> >
> > /mjt
> >


