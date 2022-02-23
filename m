Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DAD4C1397
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 14:09:31 +0100 (CET)
Received: from localhost ([::1]:42246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMrOb-0002yS-10
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 08:09:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nMrL7-0001M1-Q5
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 08:05:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nMrL1-0003Uw-CZ
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 08:05:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645621542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F5ISFR3cYI7mN59HBX65GD/3qi2YpKjbt7oC6OcBCVs=;
 b=XGbHNxWBLoeaMzZbMkLqqSsRVlksFkyj4aiQ+trl5n74vNjPYg3QAU1b1OMQIWjbnXSV5h
 eMyYg3W5Ym0jU/DoxYtacDNjkh9jUHtW2T9OBb8tIvCiZ9vHG3et3QBiomQsMF8unhpvCz
 VqDKXt4NruGphYlpm5+noqeOOyAG5S4=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-d-DJ-3QhMpOGDSC80--h4A-1; Wed, 23 Feb 2022 08:05:41 -0500
X-MC-Unique: d-DJ-3QhMpOGDSC80--h4A-1
Received: by mail-pf1-f198.google.com with SMTP id
 f128-20020a623886000000b004e152a2c149so9018282pfa.5
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 05:05:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F5ISFR3cYI7mN59HBX65GD/3qi2YpKjbt7oC6OcBCVs=;
 b=kPbtwePXcKVVi7bwX9/IiYDp9e28YsOrUY/s5mMAdTws3TBh2+E5mdfa247TXAlE0f
 9PgjFzeH4EkkhFN7Aj9vEdtD537kgo2iX6Jy/UhXGwPbUpgSsOiOOi8OhZxFwTZEZYLt
 1IvEbhVflcNfhbpZnS9KeLQXcd+pakmnhdkqzljQeiBEzJvNU8ROvFsiSDhvTgpHIrfY
 bsx4GyoWtMduUHl9oIhfkw+c4R062EuNi/PI8gi53OqmskteFam195FsreoDM7jPGEpV
 PbMzDsGi/Kv/JearZMfbZIicWNke0i/ePPCvi4AYp5s9sgBRUfRtn/VkAP2he6bndRrg
 CIWg==
X-Gm-Message-State: AOAM530f8ruuqo2R3Y7ZhUgwuei8YxJphLBpz6AngXldgT6ghEIeOUhQ
 KPRr4AV0L9iHnN7rAaa3Qfm6UYmkM+Rvc94MhFce4Bm//c7wNkl5EL4wtNLMwpJhACYdfu33H2J
 qJoOcBJelMjT86hA=
X-Received: by 2002:a63:c13:0:b0:375:5941:1fea with SMTP id
 b19-20020a630c13000000b0037559411feamr2303609pgl.33.1645621540019; 
 Wed, 23 Feb 2022 05:05:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaonoKTzUfghpbGBd31TIO3lZ+YZ2u13t1BziXBaIf4liRXKxYa5zdKGbWb0tnit0u/knblA==
X-Received: by 2002:a63:c13:0:b0:375:5941:1fea with SMTP id
 b19-20020a630c13000000b0037559411feamr2303573pgl.33.1645621539547; 
 Wed, 23 Feb 2022 05:05:39 -0800 (PST)
Received: from xz-m1.local ([94.177.118.100]) by smtp.gmail.com with ESMTPSA id
 az22-20020a17090b029600b001bc6500625asm2903573pjb.45.2022.02.23.05.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 05:05:39 -0800 (PST)
Date: Wed, 23 Feb 2022 21:05:34 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 18/20] migration: Postcopy preemption enablement
Message-ID: <YhYxHgbMMs4wNSY6@xz-m1.local>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-19-peterx@redhat.com>
 <YhTAZzuAEyEHGjea@work-vm> <YhXbsyXAXhNLRVsq@xz-m1.local>
 <YhYEuI+immRJZh78@work-vm>
MIME-Version: 1.0
In-Reply-To: <YhYEuI+immRJZh78@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 23, 2022 at 09:56:08AM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > On Tue, Feb 22, 2022 at 10:52:23AM +0000, Dr. David Alan Gilbert wrote:
> > > This does get a bit complicated, which worries me a bit; the code here
> > > is already quite complicated.
> > 
> > Right, it's the way I chose in this patchset on solving this problem.  Not
> > sure whether there's any better and easier way.
> > 
> > For example, we could have used a new thread to send requested pages, and
> > synchronize it with the main thread.  But that'll need other kind of
> > complexity, and I can't quickly tell whether that'll be better.
> > 
> > For this single patch, more than half of the complexity comes from the
> > ability to interrupt sending one huge page half-way.  It's a bit of a pity
> > that, that part will be noop ultimately when with doublemap.
> 
> How does that huge-page interruption interact with recovery?
> i.e. do we know the start of that hugepage arrived?

That's a great question..  I should have mentioned that but I forgot.

When postcopy is interrupted during sending a huge page, the dest QEMU will
not be able to do the UFFDIO_COPY of that huge page (because it lacks
data!) then it also means the received bitmap of that huge page will be
completely cleared.

So when recover happens, the dest QEMU will tell the source about this fact
("Hey this huge page has never transferred", even if it actually has
transferred a few small pages already!).  Then the whole huge page will be
resent.

When postcopy preempt joins the equation, what we need to do is to reset
the temp huge pages (postcopy_pause_incoming()):

    /*
     * If network is interrupted, any temp page we received will be useless
     * because we didn't mark them as "received" in receivedmap.  After a
     * proper recovery later (which will sync src dirty bitmap with receivedmap
     * on dest) these cached small pages will be resent again.
     */
    for (i = 0; i < mis->postcopy_channels; i++) {
        postcopy_temp_page_reset(&mis->postcopy_tmp_pages[i]);
    }

This chunk of code lies in "migration: Introduce postcopy channels on dest
node" but not in the recovery patch, I think that's the major reason why
it's easily overlooked.  However it needs to be there to not break existing
postcopy.

So that's kind of hidden in the past because we don't manage the temp huge
pages explicitly (they used to be local vars, so get reset automatically),
but now we need to do that by hand.

> 
> > 
> > However I kept those only because we don't know when doublemap will be
> > ready, not to say, landing.  Meanwhile we can't assume all kernels will
> > have doublemap even in the future.
> 
> Yeh, if doublemap was already here you could make it a condition of
> allowing you to set the option.

Right.  We'll 100% skip the huge page interruption, just like when the
ramblock is using PAGE_SIZE small pages.

-- 
Peter Xu


