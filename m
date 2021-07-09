Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9084C3C1FCF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 09:03:33 +0200 (CEST)
Received: from localhost ([::1]:53624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1kXs-00016U-LZ
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 03:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1kWW-0007vz-Nm
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:02:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1kWS-0001Iq-2z
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625814122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X0weUt4D+BdzccXuzHsHZNvOQHTvAHvZs+arUmzrCPg=;
 b=iv+ip4AaTEzKcogDXsE43J+GsYmR1leVEba5QfelfE0mSFA/1wIk0/iSrMkQsRYIvehlSd
 3RPKeW2Qk2EBwwIBJDEuHy01ZNEosjyPZLqgpQueO+BRf9l8KzGfxV9GOa9rVuOK1wSBy4
 HtpURl34usnjIUdxfolGYiEfcVww/8w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-Jp_XiXL1MpW257CfORefPg-1; Fri, 09 Jul 2021 02:58:33 -0400
X-MC-Unique: Jp_XiXL1MpW257CfORefPg-1
Received: by mail-wm1-f70.google.com with SMTP id
 i3-20020a05600c3543b02902075ed92710so4843362wmq.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 23:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X0weUt4D+BdzccXuzHsHZNvOQHTvAHvZs+arUmzrCPg=;
 b=f1028y7abPZyYcHhKqt/wTIkETjaiOHeKSfJzMHXQ4XLm0GvX5wLXX0VWK6kaqMg7Z
 hoNVYeEXkJsRcMa1Q2nzDynMJG2lYfWkaiflP9yWQMPd2sKNEieLMMusJgOcVuZcL7mM
 RXlIqUar3+SsQ1AgFg8oe1qMDG7dpxzAxyei7XsC4yzBzmiZJe9eGah/hQxTv716SXBF
 TmzhkLg5ksZB2ID1Ur87hfCyY/CV34uEDyFyh0rtJrxIZ/nsNS2FQKCF3Gv8RvGgiUXA
 35PKqktQue9Ssf+dUU1RfEWZ22e4G+LmRyTKYqcbRp8sQ91a2CAm1NPJ4NMVM+2Z6sCn
 2fBg==
X-Gm-Message-State: AOAM5300Aq1DQcNM7S9NnnyeuJrWcddM6iXXPqs5L0iWMmwrfdeDRrav
 XYFiHnubyxRuFHq0wn67SfwhngvuFR3t1Vki882OcULSXftAQiJEakqtQ6eMZFvimZvv0Qx/mjy
 gWIjE/zDZg25jHJQ=
X-Received: by 2002:a05:600c:3b86:: with SMTP id
 n6mr28434530wms.28.1625813912780; 
 Thu, 08 Jul 2021 23:58:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhqopRzNEQSGigcZiNeTBV53UkOCuk0lupgJh2igPeid+TZw4Nuf7mlYGlkNE6v7RFiwJl2A==
X-Received: by 2002:a05:600c:3b86:: with SMTP id
 n6mr28434500wms.28.1625813912497; 
 Thu, 08 Jul 2021 23:58:32 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id f1sm4217609wri.74.2021.07.08.23.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 23:58:31 -0700 (PDT)
Date: Fri, 9 Jul 2021 02:58:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PULL 13/13] MAINTAINERS: Add maintainer for vhost-user RNG
 implementation
Message-ID: <20210709025729-mutt-send-email-mst@kernel.org>
References: <20210707150157.52328-1-mst@redhat.com>
 <20210707150157.52328-14-mst@redhat.com>
 <CANLsYkw6MbY+8d6HpApZ3np1ACfya8S34MbhoPbUUUyn43Md2w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANLsYkw6MbY+8d6HpApZ3np1ACfya8S34MbhoPbUUUyn43Md2w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Thu, Jul 08, 2021 at 04:01:05PM -0600, Mathieu Poirier wrote:
> Hi Michael,
> 
> On Wed, 7 Jul 2021 at 09:03, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> >
> > This patch adds entry for the vhost-user-rng related files.
> >
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Message-Id: <20210614202842.581640-6-mathieu.poirier@linaro.org>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> The pull request's changelog [1] mentions the addition of the
> vhost-user-rng feature and patch 13/13 [2] of that same pull request
> adds an entry in MAINTAINERS.  On the flip side the files for the
> feature [3] are absent from the pull request.  As such I see two
> possibilities:
> 
> 1) The files for the vhost-user-rng feature should have been part of
> the pull request but fell through the cracks.
> 2) The vhost-user-rng feature was added to the pull request by mistake.
> 
> Please let me know.
> 
> Thanks,
> Mathieu
> 
> [1]. https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01530.html
> [2]. https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01543.html
> [3]. https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg03560.html


The files fell through the cracks. Will pick for the next pull. Thanks
for reporting this!


> > ---
> >  MAINTAINERS | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index cfbf7ef79b..517f22b2e7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1949,6 +1949,15 @@ F: include/sysemu/rng*.h
> >  F: backends/rng*.c
> >  F: tests/qtest/virtio-rng-test.c
> >
> > +vhost-user-rng
> > +M: Mathieu Poirier <mathieu.poirier@linaro.org>
> > +S: Supported
> > +F: docs/tools/vhost-user-rng.rst
> > +F: hw/virtio/vhost-user-rng.c
> > +F: hw/virtio/vhost-user-rng-pci.c
> > +F: include/hw/virtio/vhost-user-rng.h
> > +F: tools/vhost-user-rng/*
> > +
> >  virtio-crypto
> >  M: Gonglei <arei.gonglei@huawei.com>
> >  S: Supported
> > --
> > MST
> >


