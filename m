Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95613C1FD1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 09:03:44 +0200 (CEST)
Received: from localhost ([::1]:54270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1kY3-0001XZ-Nw
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 03:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1kWn-0008Ck-3v
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:02:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1kWk-0001Si-Rv
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625814141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1+Bq0jaoltZQXmYpBZYV0LAYHE1wV08DXyFUgtxjw+A=;
 b=D11S20ByoXQfGcDXY8huxTm0YaO3bnaTcR/K13D5b8xd2uViTgLq12LqAmV9OLywv0QRwL
 5f4iVTGddmjXOtcnJFkyAGZUdtt6gc9DrVcC9ZIr0/3AHJppDJk5LZVgDaYVNTUAja7XXY
 DXL+UmswSwU7pHRjTt3rTw8smaPvSVA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-3VvE8kajOeOAcZrPNreADA-1; Fri, 09 Jul 2021 03:02:20 -0400
X-MC-Unique: 3VvE8kajOeOAcZrPNreADA-1
Received: by mail-wr1-f69.google.com with SMTP id
 z6-20020a5d4c860000b029013a10564614so2166295wrs.15
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 00:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1+Bq0jaoltZQXmYpBZYV0LAYHE1wV08DXyFUgtxjw+A=;
 b=IAEU14XPtc60vv2+Z9TQz5De/wopcBVshNu1I2T7IWByIskG3sOOzGXKsmU81VPgth
 lnsIbjQSWUZOUiWYT5J+B+6055HwqYLmqI0GcuzrOY5n07DL6UShh1ygs96GctFCAegC
 lkQpQD8vLKFLXAhshkY/seXZ8wsTrOwPNgARBI97xePgYQc4lsFy2+B8u9JrT95wXkTp
 I+fL9mdVPdeIsfocjslsxM3x78VjFQNPhNeQ5xjvtDG5hiTE5Z1DuPyhoC7M3D7Ua47u
 dKFOA0NV/9U8UTaBVEdSbfUELzI7GSGKktdEfjmliidQVEd5DAUjTM7suh/5aNdJR3mB
 zQHA==
X-Gm-Message-State: AOAM531r5T7/h99LbwPajXHBBneXJ3qHydEntB1523UTQGGwfj1if4Bp
 zqoEDdnAugCz8Ik0i04d0FDsRIuUaiFGEQdYnaVAKF09E26ARizOC3T+7eSNlGQSI9/jGRSmm+X
 5KTZa2loYrXUPtWs=
X-Received: by 2002:a5d:58d6:: with SMTP id o22mr8567724wrf.48.1625814139201; 
 Fri, 09 Jul 2021 00:02:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxu5+CUZwXU7H/cAfe8k+BE28nMIm/uI+hRQi2EbvffZL4qU6Zg9K6rh08dCiBlmJJbtcrxww==
X-Received: by 2002:a5d:58d6:: with SMTP id o22mr8567691wrf.48.1625814139000; 
 Fri, 09 Jul 2021 00:02:19 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id d8sm4397994wra.41.2021.07.09.00.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 00:02:18 -0700 (PDT)
Date: Fri, 9 Jul 2021 03:02:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PULL 13/13] MAINTAINERS: Add maintainer for vhost-user RNG
 implementation
Message-ID: <20210709030015-mutt-send-email-mst@kernel.org>
References: <20210707150157.52328-1-mst@redhat.com>
 <20210707150157.52328-14-mst@redhat.com>
 <CANLsYkw6MbY+8d6HpApZ3np1ACfya8S34MbhoPbUUUyn43Md2w@mail.gmail.com>
 <20210709025729-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210709025729-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 09, 2021 at 02:58:32AM -0400, Michael S. Tsirkin wrote:
> On Thu, Jul 08, 2021 at 04:01:05PM -0600, Mathieu Poirier wrote:
> > Hi Michael,
> > 
> > On Wed, 7 Jul 2021 at 09:03, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > >
> > > This patch adds entry for the vhost-user-rng related files.
> > >
> > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > Message-Id: <20210614202842.581640-6-mathieu.poirier@linaro.org>
> > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > The pull request's changelog [1] mentions the addition of the
> > vhost-user-rng feature and patch 13/13 [2] of that same pull request
> > adds an entry in MAINTAINERS.  On the flip side the files for the
> > feature [3] are absent from the pull request.  As such I see two
> > possibilities:
> > 
> > 1) The files for the vhost-user-rng feature should have been part of
> > the pull request but fell through the cracks.
> > 2) The vhost-user-rng feature was added to the pull request by mistake.
> > 
> > Please let me know.
> > 
> > Thanks,
> > Mathieu
> > 
> > [1]. https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01530.html
> > [2]. https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01543.html
> > [3]. https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg03560.html
> 
> 
> The files fell through the cracks. Will pick for the next pull. Thanks
> for reporting this!
> 

Oh no I was too hasty. I dropped vhost-user-rng because of the build
issue I reported but kept the maintainers entry by mistake and
then saw it and included in the commit log.
So it's 2. It's harmless so I guess I won't redo the pull request
but please send a new version addressing the doc build issue asap
so I can include the files themselves.

Thanks!


> > > ---
> > >  MAINTAINERS | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index cfbf7ef79b..517f22b2e7 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -1949,6 +1949,15 @@ F: include/sysemu/rng*.h
> > >  F: backends/rng*.c
> > >  F: tests/qtest/virtio-rng-test.c
> > >
> > > +vhost-user-rng
> > > +M: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > +S: Supported
> > > +F: docs/tools/vhost-user-rng.rst
> > > +F: hw/virtio/vhost-user-rng.c
> > > +F: hw/virtio/vhost-user-rng-pci.c
> > > +F: include/hw/virtio/vhost-user-rng.h
> > > +F: tools/vhost-user-rng/*
> > > +
> > >  virtio-crypto
> > >  M: Gonglei <arei.gonglei@huawei.com>
> > >  S: Supported
> > > --
> > > MST
> > >


