Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF4F481A0B
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 07:52:21 +0100 (CET)
Received: from localhost ([::1]:37018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2pIS-00028N-03
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 01:52:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n2p1K-00053b-Jt
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 01:34:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n2p1H-0006Ha-5u
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 01:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640846073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RrK0YEjcZnwhAFnxQVeUrUzsz5f27n/ECPC7v+lqfPo=;
 b=iykG5+5co8Pb9S4xP+qbeIhSbkoKB0DbOg/iTmThvF2YMOGqFwuRNqI8FZprzPAHjT9ymT
 rWiY2iMtNACtUIXa5LLKezvEezceuAnBDhkaq6lnbIKq5SNop/5BH8LagJB9LQ7GYrnnKo
 /KqDD3tDIbtfPybIc1kW9iBLu1pJcug=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-MCyaTDsDOFyiMDSHUOreMg-1; Thu, 30 Dec 2021 01:34:31 -0500
X-MC-Unique: MCyaTDsDOFyiMDSHUOreMg-1
Received: by mail-wr1-f69.google.com with SMTP id
 s30-20020adfa29e000000b001a25caee635so5800660wra.19
 for <qemu-devel@nongnu.org>; Wed, 29 Dec 2021 22:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RrK0YEjcZnwhAFnxQVeUrUzsz5f27n/ECPC7v+lqfPo=;
 b=pwkfkKEgazTrYisVXgfeyGcDTqdXHlKhCWycakI4A5rbPk8Qo8MVz5EzR3RwsO0eZI
 S6ZILqA74fLHnBJE4mexEhGji4woNKgpKy/NYny8QJftCW6+pI9NYVQ3QgKAOvhfHcWc
 TRgVCvMYH9j9yMzYnF7vydVYRk1v6wT3kGWAK4hTTwTM64sdflhaOt2ueFkFvU782RXH
 DJYMCO+92RBhh5KakQ4wOnz55hXnpNo4ky/UjdSYK70aNmj6gPDmB1IiN/D/CbfWI5sJ
 fXXrKPhPBfREeb5Rz3txc8cn/Y0vdd4z0++TCN7HeAdnrNCvRffkWH88JtMReDHt5tYh
 Bmmw==
X-Gm-Message-State: AOAM532MfG/ySbk5039hTEjCAYSmuImQjCAoDAiNk0dr/GEhsB4CtOQl
 6MhFqK7pR2obTNSu13fMbG9Re+9D7f0Vt8Ff6grBrPBEfWE8RvOFY3ihWqTPUXo3S9rxLMeuZ7j
 271MU5Xt+/zb/PGM=
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr23756078wry.286.1640846069945; 
 Wed, 29 Dec 2021 22:34:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNZg25I0bhcvvHr/bFiX44epENQD281hFu31scfkVuQXrtKZ+q4f9efy/WsyO47gXwrXOE7w==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr23756041wry.286.1640846069610; 
 Wed, 29 Dec 2021 22:34:29 -0800 (PST)
Received: from xz-m1.local ([64.64.123.14])
 by smtp.gmail.com with ESMTPSA id h14sm22986175wrz.31.2021.12.29.22.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 22:34:29 -0800 (PST)
Date: Thu, 30 Dec 2021 14:34:22 +0800
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v10 1/3] migration/dirtyrate: implement vCPU dirtyrate
 calculation periodically
Message-ID: <Yc1S4KMVZxFrlbNb@xz-m1.local>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <dd69e3b37bb9b3fd9cd1fa6d6bf10b8faf461c83.1639479557.git.huangy81@chinatelecom.cn>
 <YcRZpy1zecHd9jMh@xz-m1.local>
 <511005c6-b9ce-6673-0529-e0b7d18bfead@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <511005c6-b9ce-6673-0529-e0b7d18bfead@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.573,
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
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 30, 2021 at 01:01:09PM +0800, Hyman Huang wrote:
> > > +/**
> > > + * dirtylimit_calc_state_finalize
> > > + *
> > > + * finalize dirty page rate calculation state.
> > > + */
> > > +void dirtylimit_calc_state_finalize(void);
> > > +#endif
> > 
> > Since dirtylimit and dirtyrate looks so alike, not sure it's easier to just
> > reuse dirtyrate.h; after all you reused dirtyrate.c.
> I'm working on this, and i find it's fine to just reuse dirtyrate.h, but the
> origin dirtyrate.h didn't export any function to other qemu module, so we
> should add a new file include/sysemu/dirtyrate.h to export the dirty page
> rage caluculation util function, how do you think about this?

I see what you meant, yeah if it's exported outside migration/ then looks fine.

> 
> I'm doing the code review and i find that it is more reasonable to implement
> the dirtylimit just in a standalone file such as softmmu/dirtylimit.c, since
> the implementation of dirtylimit in v10 has nothing to do with throttle algo
> in softmmu/cpu-throttle.c. If we merge the two implemenation into one file,
> it is weired. Is this ok?

Sure.

> > At least it can be changed into something like:
> > 
> >    dirtylimit_calc_func(DirtyRateVcpu *stat)
> >    {
> >        // never race against cpu hotplug/unplug
> >        cpu_list_lock();
> > 
> >        // this should include allocate buffers and record initial values for all cores
> >        record = vcpu_dirty_stat_alloc();
> >        // do the sleep
> >        duration = vcpu_dirty_stat_wait(records)
> > 
> >        // the "difference"..
> >        global_dirty_log_sync();
> > 
> >        // collect end timestamps, calculates
> >        vcpu_dirty_stat_collect(stat, records);
> >        vcpu_dirty_stat_free(stat);
> > 
> >        cpu_list_unlock();
> > 
> >        return stat;
> >    }
> > 
> > It may miss something but just to show what I meant..
> I think this work is refactor and i do this in a standalone commit before
> the dirtylimit commits. Is this ok?

I think that's more than welcomed if you can split the patch into smaller ones;
they'll be even easier to be reviewed.

Thanks,

-- 
Peter Xu


