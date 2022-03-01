Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925D24C8A5F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 12:12:50 +0100 (CET)
Received: from localhost ([::1]:58298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP0Qy-00070y-JM
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 06:12:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nP0A0-0006D3-Gj
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 05:55:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nP09t-0000jz-Ex
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 05:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646132107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UurYLIgr7CJvP6XEEUyP7ecpvIFEejmstieQuel8yMo=;
 b=bP8aJU0mb1W+WlP+nqE7DMYF2iq66KHS9vmXwoCi2TcuvO8EnJYnDCaPmc5q8aWXrmMswy
 1Ca6E1Ay2np4a8jzmLkU/CLBRo/cLa0M0XHt8p/yXXI0gkNll2ix70zVKN3xWn0iTCDqDe
 AZ89Lz2OWKdUgSUVBSfM4DUC1+so38U=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-nnU9K8GvNwq3cV9w-4HQSw-1; Tue, 01 Mar 2022 05:55:07 -0500
X-MC-Unique: nnU9K8GvNwq3cV9w-4HQSw-1
Received: by mail-pj1-f71.google.com with SMTP id
 y1-20020a17090a644100b001bc901aba0dso8190990pjm.8
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 02:55:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UurYLIgr7CJvP6XEEUyP7ecpvIFEejmstieQuel8yMo=;
 b=dV6yTdQFVRu+ZcXEVitfIUqK9HbPD6XlrgmE0J8qKuPUw1WJdI27sODlzf2LlCSALs
 UwDIvhmZzcfYacpIfzCSnAe3BBe7TfMKInopr90dh6jqzsdiPxMWBINq5a3nQ2GZPP3h
 z2AsPfIgXzqevTCfYPwv74UhjyMgdK3DB6vhbSw5OVZIuD6Sxif4Plq27fNusZqPVAIX
 qod+JIYMrZ0rUMm/nlh5OlrXnXVZwbv+KiIk51lCc5jxUB993044Tlmq7SsnUx07HeMU
 sPqBT9DniEZ8Tx+zfUEZ48a58VNnGMPZbfpI04JsMk8g3gv2HshtqOrGPh6PVIlN7G95
 cyUg==
X-Gm-Message-State: AOAM5314ngeIx9V3ur+uJvPo1mO863gtcRCSxFOcOKXEoRM65Y5QPZRp
 ywwvR9R1q/22yXIVnTGY6ZblCx0HXVJVENt262LbQHVFMfRTrWK8TVVoZVh2C09m24TvCGzA5KE
 RRDhLx84+VqNnxqA=
X-Received: by 2002:a62:7ad5:0:b0:4e1:5bda:823b with SMTP id
 v204-20020a627ad5000000b004e15bda823bmr26720059pfc.75.1646132105800; 
 Tue, 01 Mar 2022 02:55:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwH9ubOx7geWS6wd2e2L2D0O0SlNrFyIUOoZOSm1NKLlM7/3enP7yiebewR6OOD3hagmoXkfg==
X-Received: by 2002:a62:7ad5:0:b0:4e1:5bda:823b with SMTP id
 v204-20020a627ad5000000b004e15bda823bmr26720025pfc.75.1646132105477; 
 Tue, 01 Mar 2022 02:55:05 -0800 (PST)
Received: from xz-m1.local ([94.177.118.132]) by smtp.gmail.com with ESMTPSA id
 e11-20020a63e00b000000b0037341d979b8sm12343648pgh.94.2022.03.01.02.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 02:55:05 -0800 (PST)
Date: Tue, 1 Mar 2022 18:55:00 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 00/25] migration: Postcopy Preemption
Message-ID: <Yh37hLn5Dlffm13P@xz-m1.local>
References: <20220301083925.33483-1-peterx@redhat.com>
 <Yh3mo5VFQ3gT1Gd7@redhat.com> <Yh3yzbmOqAVV9iM9@xz-m1.local>
 <Yh30/nPtWyvqp8xo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yh30/nPtWyvqp8xo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 10:27:10AM +0000, Daniel P. Berrangé wrote:
> > I also didn't know whether there's other limitations of it.  For example,
> > will a new socket pair be a problem for any VM environment (either a
> > limitation from the management app, container, and so on)?  I think it's
> > the same to multifd in that aspect, but I never explored.
> 
> If it needs extra sockets that is something apps will need to be aware
> of unfortunately and explicitly opt-in to :-( Migration is often
> tunnelled/proxied over other channels, so whatever does that needs to
> be aware of possibility of seeing extra sockets.

Ah, then probably it can never be the default.  But for sure it could be
nice that higher level can opt-in and make it a default at some point as
long as it knows the network topology is safe to do so.

> 
> > > > TODO List
> > > > =========
> > > > 
> > > > TLS support
> > > > -----------
> > > > 
> > > > I only noticed its missing very recently.  Since soft freeze is coming, and
> > > > obviously I'm still growing this series, so I tend to have the existing
> > > > material discussed. Let's see if it can still catch the train for QEMU 7.0
> > > > release (soft freeze on 2022-03-08)..
> > > 
> > > I don't like the idea of shipping something that is only half finished.
> > > It means that when apps probe for the feature, they'll see preempt
> > > capability present, but have no idea whether they're using a QEMU that
> > > is broken when combined with TLS or not. We shouldn't merge something
> > > just to meet the soft freeze deadline if we know key features are broken.
> > 
> > IMHO merging and declaring support are two problems.
> > 
> > To me, it's always fine to merge the code that implemented the fundation of a
> > feature.  The feature can be worked upon in the future.
> > 
> > Requiring a feature to be "complete" sometimes can cause burden to not only
> > the author of the series but also reviewers.  It's IMHO not necessary to
> > bind these two ideas.
> > 
> > It's sometimes also hard to define "complete": take the TLS as example, no
> > one probably even noticed that it won't work with TLS and I just noticed it
> > merely these two days..  We obviously can't merge partial patchset, but if
> > the patchset is well isolated, then it's not a blocker for merging, imho.
> > 
> > Per my understanding, what you worried is when we declare it supported but
> > later we never know when TLS will be ready for it.  One solution is I can
> > rename the capability as x-, then after the TLS side ready I drop the x-
> > prefix.  Then Libvirt or any mgmt software doesn't need to support this
> > until we drop the x-, so there's no risk of compatibility.
> > 
> > Would that sound okay to you?
> 
> If it has an x- prefix then we can basically ignore it from a mgmt app
> POV until it is actually finished.
> 
> > I can always step back and work on TLS first before it's merged, but again
> > I don't think it's required.
> 
> Apps increasingly consider use of TLS to be a mandatory feature for
> migration, so until that works, this preempt has to be considered
> unsupported & unfinished IMHO. So either TLS should be ready when
> it merges, or it should be clearly marked unsupported at the QAPI
> level.

Yes, I fully agree with it, and for huge vm migrations I think TLS is in
many cases mandatory.

I do plan to work on it right afterwards if this series land, but as the
series grows I just noticed maybe we should start landing some codes that's
already solid.  Landing the code as another benefit that I want to make
sure the code merged at least won't affect the existing features.

So what I'm curious is why TLS is getting quite some attentions in the past
few years but I didn't even see any selftests included in migration-test on
tls.  That's something I wanted to look into, maybe even before adding the
preempt+tls support. But maybe I just missed something, as I didn't use tls
a lot in the past.

Thanks,

-- 
Peter Xu


