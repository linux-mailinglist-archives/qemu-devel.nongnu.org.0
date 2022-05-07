Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3C051E43D
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 07:10:46 +0200 (CEST)
Received: from localhost ([::1]:36282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnCiL-0002Hm-76
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 01:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nnCgj-0001XD-7C
 for qemu-devel@nongnu.org; Sat, 07 May 2022 01:09:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nnCgg-00060l-9C
 for qemu-devel@nongnu.org; Sat, 07 May 2022 01:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651900141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=krRvoos8S1qWjv8gyAafH5Hwb+irr2nbxRMgAWR2/Pc=;
 b=KSMchxoClR6W5xoieA8eijhTOOwCSPjvjVxhe730aSAUYIgmMpQR/3hlSdhXfR0zU93eR7
 dKVqAVloMzodMn/mDTskMvpbT6kS4uEi+SJk+/XimkZTXbsRV+IRcalYdN2SVPHm78j7Kt
 ZLYk+PorSpMkznDXSh2EDxUoQouNmqg=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-FHZmnTP9P9ib0DPtaIN41Q-1; Sat, 07 May 2022 01:08:59 -0400
X-MC-Unique: FHZmnTP9P9ib0DPtaIN41Q-1
Received: by mail-lf1-f70.google.com with SMTP id
 n3-20020ac242c3000000b00473d8af3a0cso2772047lfl.21
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 22:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=krRvoos8S1qWjv8gyAafH5Hwb+irr2nbxRMgAWR2/Pc=;
 b=NFmhykLHZT8TcvBBI3Al7a19aDuMxZm2OTZrN5OsDr4YleUm5OiaVBdY4MdCJ2Ydit
 1wOQGr05CSq3yEtgqZfYk5nsVtO8ITs4aIWwoU0CBjXHXMpjoK4d4lGazorRsf+onKKR
 NaMVxGXmJi2NxGog3TtxRXuO6SkoYN8cot8UbzJJIn4/pV6m7Lr2c7KzSZn9FyEQLgUk
 +V9rLMiWZpzxL2iLBrH9ImbtyLRHt8FBVdTj8C0qBVGz4BSg++pgrGdPdiKFbpmJIUJV
 M/ls82eYafbbCAuRjpOkE2F0xYsRKaenvVLaofhATjCcDRYKkqBJEpSdmcypc8mUhq7/
 8N9A==
X-Gm-Message-State: AOAM530N8Ep1XmiXg7W6F9/8omSmajGu7kqqfuID2D20nJe3Uv3XX3Dv
 RzTP9rJUmCt/lpPkvS6j/9wxrsSDvBcuBxtUN2Uc2oLsKuk3yNNEWXe+qL8r3CZqNfd9JPC9AEc
 LqcX5uC53rz2/98NjMXWEZHDvHuv08gA=
X-Received: by 2002:a2e:b057:0:b0:24f:2668:833b with SMTP id
 d23-20020a2eb057000000b0024f2668833bmr4096759ljl.300.1651900137714; 
 Fri, 06 May 2022 22:08:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8zB5EQfO1AKh1jfKh3qTPwq+uOCgguzaAO42OTbwIlhw8IlyKJZKXLwgMHj6IPctKKyoWXVaeJO2fWHQGTh0=
X-Received: by 2002:a2e:b057:0:b0:24f:2668:833b with SMTP id
 d23-20020a2eb057000000b0024f2668833bmr4096749ljl.300.1651900137536; Fri, 06
 May 2022 22:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220401034702.687057-1-chen.zhang@intel.com>
 <20220401034702.687057-2-chen.zhang@intel.com>
 <CACGkMEs7FeRCr4E9E68gS+GBTgdebeD=f0dYnPivyZ2G1mWmvw@mail.gmail.com>
 <MWHPR11MB0031EE757A9C70E8F506BC899BFA9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <MWHPR11MB00318C5C371743AD30AB9CE69BC49@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB00318C5C371743AD30AB9CE69BC49@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Sat, 7 May 2022 13:08:46 +0800
Message-ID: <CACGkMEtdaP6x0xdwVWfHmBLWOJQ=ffepbmz-6quWq3g8FC5GCg@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition support
 form COLO to PRELAUNCH
To: "Zhang, Chen" <chen.zhang@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 qemu-dev <qemu-devel@nongnu.org>, Like Xu <like.xu@linux.intel.com>, 
 David Gilbert <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, May 7, 2022 at 10:03 AM Zhang, Chen <chen.zhang@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Zhang, Chen
> > Sent: Wednesday, April 27, 2022 5:26 PM
> > To: Jason Wang <jasowang@redhat.com>; Paolo Bonzini
> > <pbonzini@redhat.com>
> > Cc: Li Zhijian <lizhijian@cn.fujitsu.com>; qemu-dev <qemu-
> > devel@nongnu.org>; Like Xu <like.xu@linux.intel.com>
> > Subject: RE: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition
> > support form COLO to PRELAUNCH
> >
> >
> >
> > > -----Original Message-----
> > > From: Jason Wang <jasowang@redhat.com>
> > > Sent: Wednesday, April 27, 2022 4:57 PM
> > > To: Zhang, Chen <chen.zhang@intel.com>
> > > Cc: Li Zhijian <lizhijian@cn.fujitsu.com>; qemu-dev <qemu-
> > > devel@nongnu.org>; Like Xu <like.xu@linux.intel.com>
> > > Subject: Re: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition
> > > support form COLO to PRELAUNCH
> > >
> > > On Fri, Apr 1, 2022 at 11:59 AM Zhang Chen <chen.zhang@intel.com> wrote:
> > > >
> > > > If the checkpoint occurs when the guest finishes restarting but has
> > > > not started running, the runstate_set() may reject the transition
> > > > from COLO to PRELAUNCH with the crash log:
> > > >
> > > > {"timestamp": {"seconds": 1593484591, "microseconds": 26605},\
> > > > "event": "RESET", "data": {"guest": true, "reason": "guest-reset"}}
> > > > qemu-system-x86_64: invalid runstate transition: 'colo' -> 'prelaunch'
> > > >
> > > > Long-term testing says that it's pretty safe.
> > > >
> > > > Signed-off-by: Like Xu <like.xu@linux.intel.com>
> > > > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > >
> > > I'd expect this to get ack from the relevant maintainers.
> > >
> >
> > The scripts/get_maintainer.pl can't find relevant maintainers for this patch.
> > Maybe Paolo have time to cover this simple patch related to runstate?
>
> No news for a while, any comments for unmaintained files changes ?
> Ping...

Adding David and Juan.

Thanks

>
> Thanks
> Chen
>
> >
> > Thanks
> > Chen
> >
> > > Thanks
> > >
> > > > ---
> > > >  softmmu/runstate.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/softmmu/runstate.c b/softmmu/runstate.c index
> > > > e0d869b21a..c021c56338 100644
> > > > --- a/softmmu/runstate.c
> > > > +++ b/softmmu/runstate.c
> > > > @@ -127,6 +127,7 @@ static const RunStateTransition
> > > runstate_transitions_def[] = {
> > > >      { RUN_STATE_RESTORE_VM, RUN_STATE_PRELAUNCH },
> > > >
> > > >      { RUN_STATE_COLO, RUN_STATE_RUNNING },
> > > > +    { RUN_STATE_COLO, RUN_STATE_PRELAUNCH },
> > > >      { RUN_STATE_COLO, RUN_STATE_SHUTDOWN},
> > > >
> > > >      { RUN_STATE_RUNNING, RUN_STATE_DEBUG },
> > > > --
> > > > 2.25.1
> > > >
>


