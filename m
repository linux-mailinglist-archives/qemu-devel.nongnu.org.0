Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D8E52C9BF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 04:19:45 +0200 (CEST)
Received: from localhost ([::1]:35488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrVlQ-0004KZ-3L
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 22:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nrVkJ-0003ab-6V
 for qemu-devel@nongnu.org; Wed, 18 May 2022 22:18:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nrVkF-0005v1-Sy
 for qemu-devel@nongnu.org; Wed, 18 May 2022 22:18:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652926710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mGqZw2cMmNl3pAAyNL25pfnd4+IrupH+VnKF7OzaqnA=;
 b=jAJ+9qId/vXfPnm9w6FrAauYcZlAcmV6bVLmbxIG1as3jeDyO83QKViZELhBV+2+DA179Y
 nnE0jbNLU8J55dQpasV6U4WhEe6NCCy2/Z6R27J0fnUHwUfVLFvWTg6wMuD8YBrnf/R1TR
 qQYQf15lEfEN9QbEAQcNWIRA//GuGt4=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-qLCZLUVGNquZlyPKYcrRlg-1; Wed, 18 May 2022 22:18:27 -0400
X-MC-Unique: qLCZLUVGNquZlyPKYcrRlg-1
Received: by mail-lf1-f70.google.com with SMTP id
 bu3-20020a056512168300b0047791fb1d68so1896439lfb.23
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 19:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mGqZw2cMmNl3pAAyNL25pfnd4+IrupH+VnKF7OzaqnA=;
 b=tBR0ciIDvoJBOZkrhbvbbGlNQu0Ie6roGMx9aJJJK576EUNjdu01YafaTfpnAz/gVR
 J8k036BfuZ8b/KUayDLYmvVoPpfUdsCipTSE2rSLpf8ASKJOQC237xuB5N+ZiYzyU5KQ
 /vrroEz6bv09gmebQbMfyRu/lcWo5VXMwCEjDT8IiQz6A6SYPSXBO2y5P9gcsYZzcE9u
 9246s19LMV56ejT83NCzt+RQYHkGHhwI/rAvpiDgOkvVIyp6t+C7Rb3yufTZEpdHGSIY
 RxHS31BNCsHUnZxS2nqs/v4SQu3h50fJW7jgUgD9+BY7xXWBiC1d9vg+Ni5wI5TMdWkR
 M+cg==
X-Gm-Message-State: AOAM532TeYSrUNAZEhA9UMSZEX8Xt3ZbcDi17LxtGoTZF4bF4mxRHN7H
 OIUSpy6RcpDlihNaiMWYlBqj8KmUCQomV1KZZIV7au78uvVrgRpaViU5RRgnww6BUygPkPplDdh
 PqaQB1BiXNxvwhmj7/A22H+cvbsxSTmg=
X-Received: by 2002:a2e:81c1:0:b0:24b:f44:3970 with SMTP id
 s1-20020a2e81c1000000b0024b0f443970mr1350724ljg.97.1652926705030; 
 Wed, 18 May 2022 19:18:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2W4/dLBJiYdyKCSKssZlmBKZgMhBa89ex6Ds8lz339rRPnviNL9c7TI1BbZXqlzQU0ijyYqcFtHHf58tDkEE=
X-Received: by 2002:a2e:81c1:0:b0:24b:f44:3970 with SMTP id
 s1-20020a2e81c1000000b0024b0f443970mr1350716ljg.97.1652926704807; Wed, 18 May
 2022 19:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220401034702.687057-1-chen.zhang@intel.com>
 <20220401034702.687057-2-chen.zhang@intel.com>
 <CACGkMEs7FeRCr4E9E68gS+GBTgdebeD=f0dYnPivyZ2G1mWmvw@mail.gmail.com>
 <MWHPR11MB0031EE757A9C70E8F506BC899BFA9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <MWHPR11MB00318C5C371743AD30AB9CE69BC49@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEtdaP6x0xdwVWfHmBLWOJQ=ffepbmz-6quWq3g8FC5GCg@mail.gmail.com>
 <YoTv6hUkdggrfd4l@work-vm>
In-Reply-To: <YoTv6hUkdggrfd4l@work-vm>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 19 May 2022 10:18:14 +0800
Message-ID: <CACGkMEu6nxmZiyi=w_+hwemETfRJfhvwMypeSiLY1QZ_g9tJ4A@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition support
 form COLO to PRELAUNCH
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "Zhang, Chen" <chen.zhang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>, 
 Like Xu <like.xu@linux.intel.com>, Juan Quintela <quintela@redhat.com>
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

On Wed, May 18, 2022 at 9:09 PM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Jason Wang (jasowang@redhat.com) wrote:
> > On Sat, May 7, 2022 at 10:03 AM Zhang, Chen <chen.zhang@intel.com> wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Zhang, Chen
> > > > Sent: Wednesday, April 27, 2022 5:26 PM
> > > > To: Jason Wang <jasowang@redhat.com>; Paolo Bonzini
> > > > <pbonzini@redhat.com>
> > > > Cc: Li Zhijian <lizhijian@cn.fujitsu.com>; qemu-dev <qemu-
> > > > devel@nongnu.org>; Like Xu <like.xu@linux.intel.com>
> > > > Subject: RE: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition
> > > > support form COLO to PRELAUNCH
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > Sent: Wednesday, April 27, 2022 4:57 PM
> > > > > To: Zhang, Chen <chen.zhang@intel.com>
> > > > > Cc: Li Zhijian <lizhijian@cn.fujitsu.com>; qemu-dev <qemu-
> > > > > devel@nongnu.org>; Like Xu <like.xu@linux.intel.com>
> > > > > Subject: Re: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition
> > > > > support form COLO to PRELAUNCH
> > > > >
> > > > > On Fri, Apr 1, 2022 at 11:59 AM Zhang Chen <chen.zhang@intel.com> wrote:
> > > > > >
> > > > > > If the checkpoint occurs when the guest finishes restarting but has
> > > > > > not started running, the runstate_set() may reject the transition
> > > > > > from COLO to PRELAUNCH with the crash log:
> > > > > >
> > > > > > {"timestamp": {"seconds": 1593484591, "microseconds": 26605},\
> > > > > > "event": "RESET", "data": {"guest": true, "reason": "guest-reset"}}
> > > > > > qemu-system-x86_64: invalid runstate transition: 'colo' -> 'prelaunch'
> > > > > >
> > > > > > Long-term testing says that it's pretty safe.
> > > > > >
> > > > > > Signed-off-by: Like Xu <like.xu@linux.intel.com>
> > > > > > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > > > >
> > > > > I'd expect this to get ack from the relevant maintainers.
> > > > >
> > > >
> > > > The scripts/get_maintainer.pl can't find relevant maintainers for this patch.
> > > > Maybe Paolo have time to cover this simple patch related to runstate?
> > >
> > > No news for a while, any comments for unmaintained files changes ?
> > > Ping...
> >
> > Adding David and Juan.
>
> This looks OK to me;
>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Great.

>
> it should be fine to merge it along with the pull that takes the other
> patches.

Yes, I've queued this series.

Thanks

>
> Dave
>
> > Thanks
> >
> > >
> > > Thanks
> > > Chen
> > >
> > > >
> > > > Thanks
> > > > Chen
> > > >
> > > > > Thanks
> > > > >
> > > > > > ---
> > > > > >  softmmu/runstate.c | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > >
> > > > > > diff --git a/softmmu/runstate.c b/softmmu/runstate.c index
> > > > > > e0d869b21a..c021c56338 100644
> > > > > > --- a/softmmu/runstate.c
> > > > > > +++ b/softmmu/runstate.c
> > > > > > @@ -127,6 +127,7 @@ static const RunStateTransition
> > > > > runstate_transitions_def[] = {
> > > > > >      { RUN_STATE_RESTORE_VM, RUN_STATE_PRELAUNCH },
> > > > > >
> > > > > >      { RUN_STATE_COLO, RUN_STATE_RUNNING },
> > > > > > +    { RUN_STATE_COLO, RUN_STATE_PRELAUNCH },
> > > > > >      { RUN_STATE_COLO, RUN_STATE_SHUTDOWN},
> > > > > >
> > > > > >      { RUN_STATE_RUNNING, RUN_STATE_DEBUG },
> > > > > > --
> > > > > > 2.25.1
> > > > > >
> > >
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>


