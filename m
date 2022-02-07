Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039B54AB8F2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:44:17 +0100 (CET)
Received: from localhost ([::1]:51782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH1VH-0000gS-VL
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:44:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nH1Nv-0003Dd-En
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:36:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nH1Nr-0001Cp-Rb
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:36:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644230194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MDGBfbO9+8XjvwYMV6jPG9Yp99oJphiXOV4RCTX+L+s=;
 b=dLDOu2hoPuu1lznXKhUnpo8fc4TJRzuZxqrRoefj0n8ovGBKjgUIS5gWoniI00c02gu5JO
 lSpmgdZb3m5RpI+Eh3YZHsACrKTTGRdE5ECwICpOyK+of+fMCrEr+hB9KV4LHPAALjw46a
 EzHsQb6JbnzbDjts6NvlPHjP9M/A86M=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-jJI_SAWOMO6dzyjNuxIrlA-1; Mon, 07 Feb 2022 05:36:31 -0500
X-MC-Unique: jJI_SAWOMO6dzyjNuxIrlA-1
Received: by mail-pf1-f200.google.com with SMTP id
 188-20020a6219c5000000b004ce24bef61fso7055530pfz.9
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 02:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MDGBfbO9+8XjvwYMV6jPG9Yp99oJphiXOV4RCTX+L+s=;
 b=q923ch6JodIjYLk9RZ261P/gMY7SYu1LoCOPXC4RsZoHGrzqOLn/LtlBRdk7VAxK2I
 8nuymKp17RDtcLNgaIvgbsLoNjxZUJKm9aBxeVxOkqVkMG8KeLMIadjPQ1AXugJhwbhP
 Dc3C4wdIUH1cedyyaCVVnpigwuZInLivsaqqSHH05Icws/h2coipVtwVYb++RqbM9KuA
 XBMuaH8G2rzx5/dcuVA+FHOI5a39zbdTJZnbyf5sSlMSiDe+wCG2t46ElNoCF7HwkQdv
 Z56brMiGiSbZlbuaPScrnhHYH1GmknETV6mGXUwuxYOn3P0c6u4nLFPIYqknT4taiEy1
 3dRQ==
X-Gm-Message-State: AOAM530gPPByj4L/QpsqyKGvpU8lilhxigYgUTMeXT/xInbeGesEfO4C
 QwA72DvP7G348opsdFQ3ZonpqtU3WE6itHhQRVlIT0lgfufP5YLPX+4Gg0/6i2CidAANpZDDRWt
 60a0l08tvKC1f7lc=
X-Received: by 2002:a17:902:d64f:: with SMTP id
 y15mr15236717plh.145.1644230190278; 
 Mon, 07 Feb 2022 02:36:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3NdZJ/VMvoiD0o0CoC5bNwwFUjl7ihsA9gkYQ1M8QSIwlgBoXawUyVbbSf2wwfRENrisd7Q==
X-Received: by 2002:a17:902:d64f:: with SMTP id
 y15mr15236702plh.145.1644230190013; 
 Mon, 07 Feb 2022 02:36:30 -0800 (PST)
Received: from xz-m1.local ([94.177.118.121])
 by smtp.gmail.com with ESMTPSA id i8sm3210865pgf.94.2022.02.07.02.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 02:36:29 -0800 (PST)
Date: Mon, 7 Feb 2022 18:36:23 +0800
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] memory: Fix qemu crash on starting dirty log twice with
 stopped VM
Message-ID: <YgD2J5zOpJFKxrZz@xz-m1.local>
References: <20220207032622.19931-1-peterx@redhat.com>
 <77520dd3-1e7c-efc5-0bea-d53dcea6261f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <77520dd3-1e7c-efc5-0bea-d53dcea6261f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Hyman Huang <huangy81@chinatelecom.cn>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07, 2022 at 10:08:44AM +0100, Paolo Bonzini wrote:
> >   void memory_global_dirty_log_start(unsigned int flags)
> >   {
> >       unsigned int old_flags = global_dirty_tracking;
> > -    if (vmstate_change) {
> > -        qemu_del_vm_change_state_handler(vmstate_change);
> > -        vmstate_change = NULL;
> > -    }
> > +    /*
> > +     * If there is postponed dirty log stop flags, do it, so that start/stop
> > +     * will always be paired.  A smarter thing to do is ignore start process if
> > +     * the same flag has got postponed on stop, but it shouldn't matter a lot
> > +     * in major user scenarios, so keep the code simple for now.
> > +     */
> > +    memory_global_dirty_log_stop_postponed_run();
> 
> I think this should be as easy as doing here:
> 
>     postponed_stop_flags &= ~flags;
>     memory_global_dirty_log_stop_postponed_run();
>     flags &= ~global_dirty_tracking_flags;
>     if (!flags) {
>         return;
>     }
> 
> plus adding an "if (postponed_stop_flags)" in
> memory_global_dirty_log_stop_postponed_run?

Yeah I can do.  Though the latter "if (!flags)" check will also start to allow
nesting of memory_global_dirty_log_start(), and it'll make this assert useless:

    assert(!(global_dirty_tracking & flags));

I'll probably drop it too, then.

Curious: do we have any real case of nesting calls of starting dirty log?  I
always thought there's none, but I could miss something.

I'll post a v2 soon.  Thanks for the quick review!

-- 
Peter Xu


