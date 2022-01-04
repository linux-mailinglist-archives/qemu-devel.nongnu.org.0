Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD6B483A97
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 03:33:45 +0100 (CET)
Received: from localhost ([::1]:40872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Zdx-0002As-2f
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 21:33:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n4ZcZ-0001UO-4K
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:32:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n4ZcW-0002Hf-Tp
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641263536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BTwYtrPgea5I1irlNdoFNYa8D7wKDqJ4Hg5eJJgx3zc=;
 b=cjUZiagxnu3DuuWekvjaHsf8nVrKiTb0xo87GG6J1fg1expYWlrAFcFT9QePdmneUiCvpR
 wmVqSo1Owg//eKvG/z0x4Oh4yxEpamIsEAscf7g8Ehlf7HwtICjGtzWhwmknEmPwCZ9I5U
 PN35VkyY0uSL++vgABkHiXXKjPLdIvY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-SRqKbXuyOSSwsK8OkPbCrQ-1; Mon, 03 Jan 2022 21:32:14 -0500
X-MC-Unique: SRqKbXuyOSSwsK8OkPbCrQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 p1-20020a17090a2d8100b001b1e44000daso28232852pjd.9
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 18:32:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BTwYtrPgea5I1irlNdoFNYa8D7wKDqJ4Hg5eJJgx3zc=;
 b=Ejyh0ubXIB7fbRq1bjH3knu2hB4l0DQVLw1matqkEZdYG+sKgJlF0bIPhUUbNGpSi/
 v9KV8Jb27OkKxtA085w4h3yI/yjMHbOYM5UqgxINPM80xuYgo6SMwZN8fr1kGGzW4+Fd
 PMscKWLEAvCmdwPw+f+vwK+ksbgBKcrAYV17kIoNUH4ctoJE0s8Co76A/KyahEmE0q1n
 HYIKPueohZ0S1tRDwvHjO6JErTDYKf80PgO8U2pko8Lg+1mFJvdLSJe74OUnDYkI3wJk
 158890xzWUBkaY509xkxGlhpZdlBFGtCX/tpbBuUbesTZMxhisQjamj+gzdZQdft7cT9
 abyA==
X-Gm-Message-State: AOAM532kN2TNFSVX1PiU5gI11JBT4arvoXSY9jkFxL7WSP8wG5Xb4GWs
 bABY7z6QO/eHJROSZ9cdSoBXw2s2Mvu6pwT+/nlRugBximshKWVQ5JuRB/KNBaH26jqaA4rrPjO
 8DIfZa3I2njEsR7s=
X-Received: by 2002:aa7:8896:0:b0:4bb:38e3:28eb with SMTP id
 z22-20020aa78896000000b004bb38e328ebmr48736096pfe.24.1641263533800; 
 Mon, 03 Jan 2022 18:32:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy97Zcrux8lkasIyLSsir2ONfWuO02Gt9kEk+Y4uqZe5iz4jbsbC9MorTQDAQm6GZ+Xi+JiDw==
X-Received: by 2002:aa7:8896:0:b0:4bb:38e3:28eb with SMTP id
 z22-20020aa78896000000b004bb38e328ebmr48736081pfe.24.1641263533507; 
 Mon, 03 Jan 2022 18:32:13 -0800 (PST)
Received: from xz-m1.local ([191.101.132.50])
 by smtp.gmail.com with ESMTPSA id s29sm33216955pgo.34.2022.01.03.18.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 18:32:12 -0800 (PST)
Date: Tue, 4 Jan 2022 10:32:06 +0800
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v10 2/3] cpu-throttle: implement virtual CPU throttle
Message-ID: <YdOxDRvCaXutEmOx@xz-m1.local>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <671e8a25261262085b998a08ef8dafdcdc9e0ae9.1639479557.git.huangy81@chinatelecom.cn>
 <YcVWzuPDawXtXGIX@xz-m1.local>
 <98211637-b2ad-d99b-9dc2-23c5d3566b24@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <98211637-b2ad-d99b-9dc2-23c5d3566b24@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Dec 31, 2021 at 12:36:40AM +0800, Hyman Huang wrote:
> > > +struct {
> > > +    DirtyLimitState *states;
> > > +    int max_cpus;
> > > +    unsigned long *bmap; /* running thread bitmap */
> > > +    unsigned long nr;
> > > +    QemuThread thread;
> > > +} *dirtylimit_state;
> > > +
> > > +static bool dirtylimit_quit = true;
> > 
> > Again, I think "quit" is not a good wording to show "whether dirtylimit is in
> > service".  How about "dirtylimit_global_enabled"?
> > 
> > You can actually use "dirtylimit_state" to show whether it's enabled already
> > (then drop the global value) since it's a pointer.  It shouldn't need to be
> > init-once-for-all, but we can alloc the strucuture wAhen dirty limit enabled
> > globally, and destroy it (and reset it to NULL) when globally disabled.
> > 
> > Then "whether it's enabled" is simply to check "!!dirtylimit_state" under BQL.
> Yes, checking pointer is fairly straightforword, but since dirtylimit thread
> also access the dirtylimit_state when doing the limit, if we free
> dirtylimit_state after last limited vcpu be canceled, dirtylimit thread
> would crash when reference null pointer. And this method turn out to
> introduce a mutex lock to protect dirtylimit_state, comparing with qatomic
> operation, which is better ?

I don't see much difference here on using either atomic or mutex, because it's
not a hot path.

If to use mutex and not overload BQL we can use a dirtylimit_mutex then before
referencing the pointer anywhere we need to fetch it, and release when sleep.

The only thing confusing to me about the global variable way is having
quit=true as initial value, and clearing it when start.  I think it'll work,
but just reads weird.

How about having "enabled" and "quit" as a normal threaded app?  Then:

  - When init: enabled=0 quit=0
  - When start: enabled=1 quit=0
  - When stop
    - main thread set enabled=1 quit=1
    - dirtylimit sees quit=1, goes to join()
    - main thread reset enable=quit=0

dirtylimit_in_service() should reference "enabled", and "quit" should be only
used for sync on exit.

Thanks,

-- 
Peter Xu


