Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF6A52BB62
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 15:13:26 +0200 (CEST)
Received: from localhost ([::1]:53026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrJUT-0000nf-62
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 09:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nrJQL-000439-Mq
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:09:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nrJQJ-0006qa-55
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:09:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652879345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vfGSzvG/1AzEFMbwerpXy8n6rwOZmB5W60yagVUmYVw=;
 b=VnUBIf0TXOTjuMPUG420Zlg/loL/DdS/Jf2eaqbMSq1tcePvtbc1ar7gi9I0BaQRt/Rycw
 A1x1N4blXJvhrVs3lWu/ZGLSqY42/liLnxS2AWUbGsYtxD3c/dM8WISL9BUWfCfEqKzJ7O
 DbTZNpg2gmd5/mQnpPEmBa/RahV1k54=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-exsUM0D4ODCYqBsiySQkEg-1; Wed, 18 May 2022 09:09:04 -0400
X-MC-Unique: exsUM0D4ODCYqBsiySQkEg-1
Received: by mail-wm1-f72.google.com with SMTP id
 q128-20020a1c4386000000b003942fe15835so854786wma.6
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 06:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vfGSzvG/1AzEFMbwerpXy8n6rwOZmB5W60yagVUmYVw=;
 b=AcaO+wkHz4qDO4+FUxUUFL2CtVECFIH21ifu00N1rTgpfSSuUXSRc7SqYt5ApF7ex6
 nFgt8/+iz+jRACXyVuU8MOlkC6+41ki/3k7ZzoOYxcbZcVJA1m/DI9U2xtxPV94mblZb
 4DbTqhMvZ92bcako/jbo7BAKijaWfzuFcogqjw5ZS7l3Wx95x/JXp+DdtnJfgcwxFp3p
 yr+h46kRcUfe2oFZ97oYBtZhVnTX4dlW6SnPjTTZmNWUnJe732N9qc02XLnlr2mvWv5d
 lfvEWBL0fRH5MDEmFzUE4KAn3gCtbrOhZPbXW365HkQOv5Hk6Bs2qAUmbzXiP+PfBZIg
 9W0w==
X-Gm-Message-State: AOAM5338pnNRBTQbvsvwGCaeb8pJTm9CulJ/DqMttkCCgEeC8i0Rtg3y
 f0iaYzrt6zqFbx786PhHFraemrkRO/f6MvQDif+iW9U5ahdnsECTjGbAElCM0tCNF6/ftpPZobq
 UHulkeVdYqMNJe5o=
X-Received: by 2002:a05:6000:1c12:b0:20e:603e:b294 with SMTP id
 ba18-20020a0560001c1200b0020e603eb294mr2819633wrb.27.1652879341498; 
 Wed, 18 May 2022 06:09:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweK9M3QrRmYDqNsvsJdYxSrE3E/3N6fF0v2g/3SA+w70H7KhmgZd63vvnzp3x8o4WAdIj34g==
X-Received: by 2002:a05:6000:1c12:b0:20e:603e:b294 with SMTP id
 ba18-20020a0560001c1200b0020e603eb294mr2819608wrb.27.1652879341251; 
 Wed, 18 May 2022 06:09:01 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 i29-20020adfaadd000000b0020c5253d8casm2157205wrc.22.2022.05.18.06.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 06:09:00 -0700 (PDT)
Date: Wed, 18 May 2022 14:08:58 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: "Zhang, Chen" <chen.zhang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>,
 qemu-dev <qemu-devel@nongnu.org>, Like Xu <like.xu@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition
 support form COLO to PRELAUNCH
Message-ID: <YoTv6hUkdggrfd4l@work-vm>
References: <20220401034702.687057-1-chen.zhang@intel.com>
 <20220401034702.687057-2-chen.zhang@intel.com>
 <CACGkMEs7FeRCr4E9E68gS+GBTgdebeD=f0dYnPivyZ2G1mWmvw@mail.gmail.com>
 <MWHPR11MB0031EE757A9C70E8F506BC899BFA9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <MWHPR11MB00318C5C371743AD30AB9CE69BC49@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEtdaP6x0xdwVWfHmBLWOJQ=ffepbmz-6quWq3g8FC5GCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEtdaP6x0xdwVWfHmBLWOJQ=ffepbmz-6quWq3g8FC5GCg@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Jason Wang (jasowang@redhat.com) wrote:
> On Sat, May 7, 2022 at 10:03 AM Zhang, Chen <chen.zhang@intel.com> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Zhang, Chen
> > > Sent: Wednesday, April 27, 2022 5:26 PM
> > > To: Jason Wang <jasowang@redhat.com>; Paolo Bonzini
> > > <pbonzini@redhat.com>
> > > Cc: Li Zhijian <lizhijian@cn.fujitsu.com>; qemu-dev <qemu-
> > > devel@nongnu.org>; Like Xu <like.xu@linux.intel.com>
> > > Subject: RE: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition
> > > support form COLO to PRELAUNCH
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Wednesday, April 27, 2022 4:57 PM
> > > > To: Zhang, Chen <chen.zhang@intel.com>
> > > > Cc: Li Zhijian <lizhijian@cn.fujitsu.com>; qemu-dev <qemu-
> > > > devel@nongnu.org>; Like Xu <like.xu@linux.intel.com>
> > > > Subject: Re: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition
> > > > support form COLO to PRELAUNCH
> > > >
> > > > On Fri, Apr 1, 2022 at 11:59 AM Zhang Chen <chen.zhang@intel.com> wrote:
> > > > >
> > > > > If the checkpoint occurs when the guest finishes restarting but has
> > > > > not started running, the runstate_set() may reject the transition
> > > > > from COLO to PRELAUNCH with the crash log:
> > > > >
> > > > > {"timestamp": {"seconds": 1593484591, "microseconds": 26605},\
> > > > > "event": "RESET", "data": {"guest": true, "reason": "guest-reset"}}
> > > > > qemu-system-x86_64: invalid runstate transition: 'colo' -> 'prelaunch'
> > > > >
> > > > > Long-term testing says that it's pretty safe.
> > > > >
> > > > > Signed-off-by: Like Xu <like.xu@linux.intel.com>
> > > > > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > > >
> > > > I'd expect this to get ack from the relevant maintainers.
> > > >
> > >
> > > The scripts/get_maintainer.pl can't find relevant maintainers for this patch.
> > > Maybe Paolo have time to cover this simple patch related to runstate?
> >
> > No news for a while, any comments for unmaintained files changes ?
> > Ping...
> 
> Adding David and Juan.

This looks OK to me;

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

it should be fine to merge it along with the pull that takes the other
patches.

Dave

> Thanks
> 
> >
> > Thanks
> > Chen
> >
> > >
> > > Thanks
> > > Chen
> > >
> > > > Thanks
> > > >
> > > > > ---
> > > > >  softmmu/runstate.c | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/softmmu/runstate.c b/softmmu/runstate.c index
> > > > > e0d869b21a..c021c56338 100644
> > > > > --- a/softmmu/runstate.c
> > > > > +++ b/softmmu/runstate.c
> > > > > @@ -127,6 +127,7 @@ static const RunStateTransition
> > > > runstate_transitions_def[] = {
> > > > >      { RUN_STATE_RESTORE_VM, RUN_STATE_PRELAUNCH },
> > > > >
> > > > >      { RUN_STATE_COLO, RUN_STATE_RUNNING },
> > > > > +    { RUN_STATE_COLO, RUN_STATE_PRELAUNCH },
> > > > >      { RUN_STATE_COLO, RUN_STATE_SHUTDOWN},
> > > > >
> > > > >      { RUN_STATE_RUNNING, RUN_STATE_DEBUG },
> > > > > --
> > > > > 2.25.1
> > > > >
> >
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


