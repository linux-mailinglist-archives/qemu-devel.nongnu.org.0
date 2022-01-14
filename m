Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDCA48E2FF
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 04:36:51 +0100 (CET)
Received: from localhost ([::1]:41242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8DOT-0001vb-UL
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 22:36:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n8DNA-0001BE-GH
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 22:35:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n8DN8-00063W-Vt
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 22:35:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642131325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KjBNzOUTV3LA9eGdb8MaUMPnBWLQR6cDo/LqDKaEusU=;
 b=UXcB2L2CcdFZXSXzGWAXqUFOJfd/+yy44xOaHtVJeb6OXzZzsN83MhQP7W+jyb90eiyWQ4
 x1aynE7HkPTD8gi/K5rNCocaHfNcanTuluB1QfQsOPxVTGdnBrsmaXzV9gB2gs4Oc4Rf19
 rdWrkgVNWlIake2GD42uzLztYlW3tn8=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-FcmaJIQDPjOccrM4o3hgkg-1; Thu, 13 Jan 2022 22:35:22 -0500
X-MC-Unique: FcmaJIQDPjOccrM4o3hgkg-1
Received: by mail-pf1-f200.google.com with SMTP id
 m13-20020a056a00080d00b004be40ef1fd9so991650pfk.22
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 19:35:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KjBNzOUTV3LA9eGdb8MaUMPnBWLQR6cDo/LqDKaEusU=;
 b=0KcD+6cKsqc4Ud7oUEP41MTxLpGKGDxr0EU0kjomvAZ0pDynnYzO4nS2pxRbUveS3W
 AqFhbv6YJ8fODHaD6CA8lOGCLju/UG+oyTjN0GVqYxJhhSId7O7KMcn9sjWOT6pUaM2E
 OV7gfqG1Bvma7EBVgnFnYstGfVeq7WX1VLoNX074eUn3T9bSpW/J4tsrmxxPJF6L1WrY
 Hf+JvdZlL1GuUb9TevU9eCXC0pmZbld/upX2AWosBK+nTjGD9jhjmmEERv8jVERzsFD4
 UYa/lSi7F3B2bE9WpvYn+JiTn0+bajyceqHCUMsX728Q5Y+2cYi/i6AlvL5RsjoC3UK0
 jBVw==
X-Gm-Message-State: AOAM533g5G/eln7hffomGd6X6MThiQvJ9/5+1U9Hg7j4TyAlUVtPOwml
 w8o0uwU9oop8ye+0DuX0aM8IROyjUe1Pa6dMEBfFhTl2YJOGLmtM5LQsPhK+b/oG/URnSldCndq
 MpWgT6J9JRXx++No=
X-Received: by 2002:a17:90b:684:: with SMTP id m4mr8461959pjz.5.1642131321706; 
 Thu, 13 Jan 2022 19:35:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygn5I3hbY4rCAmKPemlK7FMiG57b0H2SPQ8U1TYU0La9FvwIFsgAEZjhOLYg/6nAkAYY4T2w==
X-Received: by 2002:a17:90b:684:: with SMTP id m4mr8461932pjz.5.1642131321389; 
 Thu, 13 Jan 2022 19:35:21 -0800 (PST)
Received: from xz-m1.local ([191.101.132.59])
 by smtp.gmail.com with ESMTPSA id 17sm3415965pgt.6.2022.01.13.19.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 19:35:20 -0800 (PST)
Date: Fri, 14 Jan 2022 11:35:14 +0800
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v10 2/3] cpu-throttle: implement virtual CPU throttle
Message-ID: <YeDvckGNTYq7OZTO@xz-m1.local>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <671e8a25261262085b998a08ef8dafdcdc9e0ae9.1639479557.git.huangy81@chinatelecom.cn>
 <YcVWzuPDawXtXGIX@xz-m1.local>
 <98211637-b2ad-d99b-9dc2-23c5d3566b24@chinatelecom.cn>
 <YdOxDRvCaXutEmOx@xz-m1.local> <87pmov61wv.fsf@dusky.pond.sub.org>
 <38d0cc91-2995-2d73-d917-e5e1fc4e5206@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <38d0cc91-2995-2d73-d917-e5e1fc4e5206@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 14, 2022 at 09:30:39AM +0800, Hyman Huang wrote:
> 
> 
> 在 2022/1/14 0:22, Markus Armbruster 写道:
> > Peter Xu <peterx@redhat.com> writes:
> > 
> > > On Fri, Dec 31, 2021 at 12:36:40AM +0800, Hyman Huang wrote:
> > > > > > +struct {
> > > > > > +    DirtyLimitState *states;
> > > > > > +    int max_cpus;
> > > > > > +    unsigned long *bmap; /* running thread bitmap */
> > > > > > +    unsigned long nr;
> > > > > > +    QemuThread thread;
> > > > > > +} *dirtylimit_state;
> > > > > > +
> > > > > > +static bool dirtylimit_quit = true;
> > > > > 
> > > > > Again, I think "quit" is not a good wording to show "whether dirtylimit is in
> > > > > service".  How about "dirtylimit_global_enabled"?
> > > > > 
> > > > > You can actually use "dirtylimit_state" to show whether it's enabled already
> > > > > (then drop the global value) since it's a pointer.  It shouldn't need to be
> > > > > init-once-for-all, but we can alloc the strucuture wAhen dirty limit enabled
> > > > > globally, and destroy it (and reset it to NULL) when globally disabled.
> > > > > 
> > > > > Then "whether it's enabled" is simply to check "!!dirtylimit_state" under BQL.
> > > > Yes, checking pointer is fairly straightforword, but since dirtylimit thread
> > > > also access the dirtylimit_state when doing the limit, if we free
> > > > dirtylimit_state after last limited vcpu be canceled, dirtylimit thread
> > > > would crash when reference null pointer. And this method turn out to
> > > > introduce a mutex lock to protect dirtylimit_state, comparing with qatomic
> > > > operation, which is better ?
> > > 
> > > I don't see much difference here on using either atomic or mutex, because it's
> > > not a hot path.
> > 
> > Quick interjection without having bothered to understand the details:
> > correct use of atomics and memory barriers is *much* harder than correct
> > use of locks.  Stick to locks unless you *know* they impair performance

Yong,

Just a heads up - You seem to have replied something but there's really nothing
I saw... it happened multiple times, so I hope you didn't miss it by sending
something empty.

I agree with Markus, and that's also what I wanted to express too (it's not a
perf critical path, so we don't necessarily need to use atomics; obviously I
failed again on using English to express myself.. :).  But I don't urge it if
the atomics works pretty simple and well.  I think I'll read the atomic version
you posted first and I'll comment again there.

Thanks,

-- 
Peter Xu


