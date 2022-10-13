Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CF85FD307
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 03:52:25 +0200 (CEST)
Received: from localhost ([::1]:33692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oinOa-0006LO-1a
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 21:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom.leiming@gmail.com>)
 id 1oinNJ-0004zI-Sq
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 21:51:05 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tom.leiming@gmail.com>)
 id 1oinNI-0006gC-6o
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 21:51:05 -0400
Received: by mail-pg1-x529.google.com with SMTP id b5so347291pgb.6
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 18:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=k+fj3xaPXr55GP2FJv1sRZl6lOLiSQ/9qXaPvpYFz2w=;
 b=Sm9uh2W7FEzUaBs04hT8hSWvVQG5de9bJ5uV8g35ZaNBfyeQEyzQyCv+/COgZdKuCY
 xWQrkJLHa18E97WyAsMNpkzyzvHEF36kq4d0D+e58dDnP54SV0Ks68V8xNbyGhz+nbA5
 ZgrjkUYgcIGUNkJTBiM4NrZPt0yHxPJ2SSqya2v3jIS1ivwnuQQzj6alQ2j9gw/3nJkx
 bfdcAKCVWHNB0UF1m4qfnjW+buy87goAruDFsHQrqdQqYc53xqSfN6BZDepREMH7dFrt
 SPBSrE3MIPPoIrxOyyKxQxCYIFzwWu8Hpu1c0GnG69tbmQKQlijJ6aMkrbr4gvzrPMSo
 Yi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k+fj3xaPXr55GP2FJv1sRZl6lOLiSQ/9qXaPvpYFz2w=;
 b=ivQUtcdKnVWi5dxTK8i7nwFpdxm8nvejN6mhB4YtaTaPYEi6LBGGCIvQhXE5FNxzFW
 23gOAVHE1CCHW24woHzHQMg6OPr9aYPUrjYAP8N81WtuaUVG28aapUFw14xCLMAejDK/
 metPNOdR6Wl0gX6JDAXe1dmLQKuv3ECA76kEzLZ4adc8k0pZgT4qGv/zOGp3AR/Wbljv
 2r62MVlkS9NdA72trpyck3FKbPsqGDrBdGOPGK9HYI1IzJRXAuhTDIcgk8SlxUkTn/U1
 jm6h/4+d2m6EJRCciTvU/70BL93zkjvwamamlMY6hZnaI/ElDBUmuaVsfh5m1bTaNWOL
 bb5g==
X-Gm-Message-State: ACrzQf224iPv3Ex/zKjydKCIpmRHZZOuHmVafS1P8sumnZ/kaKWEsYEZ
 XmU3M53BAvWK7xxVHjql3c8=
X-Google-Smtp-Source: AMsMyM75EDZVE7nkn1nTc50WrEt+rGU6bP4inf/wRAlexWY2XHy+pHtUGiG0l8M07fJ9CT1+s4wSCQ==
X-Received: by 2002:a63:c145:0:b0:44e:9366:f982 with SMTP id
 p5-20020a63c145000000b0044e9366f982mr27587348pgi.584.1665625862576; 
 Wed, 12 Oct 2022 18:51:02 -0700 (PDT)
Received: from T590 ([43.228.180.230]) by smtp.gmail.com with ESMTPSA id
 y4-20020a623204000000b00562ab71b863sm496161pfy.214.2022.10.12.18.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 18:51:02 -0700 (PDT)
Date: Thu, 13 Oct 2022 09:50:55 +0800
From: Ming Lei <tom.leiming@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, io-uring@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kirill Tkhai <kirill.tkhai@openvz.org>,
 Manuel Bentele <development@manuel-bentele.de>,
 qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: ublk-qcow2: ublk-qcow2 is available
Message-ID: <Y0du/9K3II70tZTD@T590>
References: <Yza1u1KfKa7ycQm0@T590> <Yzs9xQlVuW41TuNC@fedora>
 <YzwARuAZdaoGTUfP@T590>
 <CAJSP0QXVK=wUy_JgJ9NmNMtKTRoRX0MwOZUuFWU-1mVWWKij8A@mail.gmail.com>
 <20221006101400.GC7636@redhat.com>
 <CAJSP0QXbnhkVgfgMfC=MAyvF63Oof_ZGDvNFhniDCvVY-f6Hmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QXbnhkVgfgMfC=MAyvF63Oof_ZGDvNFhniDCvVY-f6Hmw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=tom.leiming@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 12, 2022 at 10:15:28AM -0400, Stefan Hajnoczi wrote:
> On Thu, 6 Oct 2022 at 06:14, Richard W.M. Jones <rjones@redhat.com> wrote:
> >
> > On Tue, Oct 04, 2022 at 09:53:32AM -0400, Stefan Hajnoczi wrote:
> > > qemu-nbd doesn't use io_uring to handle the backend IO,
> >
> > Would this be fixed by your (not yet upstream) libblkio driver for
> > qemu?
> 
> I was wrong, qemu-nbd has syntax to use io_uring:
> 
>   $ qemu-nbd ... --image-opts driver=file,filename=test.img,aio=io_uring

Yeah, I saw the option, previously when I tried io_uring via:

qemu-nbd -c /dev/nbd11 -n --aio=io_uring $my_file

It complains that 'qemu-nbd: Invalid aio mode 'io_uring'' even though
that 'qemu-nbd --help' does say that io_uring is supported.

Today just tried it on Fedora 37, looks it starts working with
--aio=io_uring, but the IOPS is basically same with --aio=native, and
IO trace shows that io_uring is used by qemu-nbd.


Thanks,
Ming

