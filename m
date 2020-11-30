Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2C92C8819
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 16:35:52 +0100 (CET)
Received: from localhost ([::1]:44944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjlDT-0001SQ-Sp
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 10:35:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kjlC7-000106-TR
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:34:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kjlC6-0005NC-7v
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606750465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F+UYQD+bWETdxRMpMlslkT7GebUYZLRwhXEL9mK2mgw=;
 b=NmonNdquiutVWW0LkQgrPW+H/v14z7CnCZFxzOW3nhiwyAfEljq/yKZb8oncM/Dz8zb/aG
 NjYV4AjRoJtL6I+B5s66x4aIlW9/2BRq37zuZPpD6FkvsqzFQH0b+j6MqsydDITk4Ya/F9
 zX6sZ0K/SjmttGrApO3QshY/ycxXz38=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-z0x_86b4Mg623gZT_xmcqw-1; Mon, 30 Nov 2020 10:34:23 -0500
X-MC-Unique: z0x_86b4Mg623gZT_xmcqw-1
Received: by mail-qk1-f198.google.com with SMTP id r124so9919530qkd.8
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 07:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F+UYQD+bWETdxRMpMlslkT7GebUYZLRwhXEL9mK2mgw=;
 b=O2xVKWbA2or7z+8chQK4jTtqzVwzSKLJTHc24khz7+uOhBIXXTxdIFFS5fzPKYIb0I
 TVt6x1US+RilO2GC6Uh+VXVFF++WtEjmF+/Y9R75c3O0Wt+wENDwFXe8DuDuGS08p8hR
 JKYo3Gejc9/sHIAjDmdw+brXnNnGzPpxHENDkzusUBGc1UbSZCejJbZj9J5wiTLUd3gr
 mYjfQGU8x7o5L9MGfszQDqP9XFdg+cg1MhqNQouk6OSfvsPvP4DuUDeoAWoZY0yOR+pc
 j+28ACT8wYPRjO2rTFqPjFHFcDGONZoEMludOvs/79hORtUX3Dup1znZyEF/gemevF+D
 4pdg==
X-Gm-Message-State: AOAM532nhDywcKvY+u9f1D+cvPiRpMoBR9Rd2HFZ8Vyrmbzn6rgGPJQv
 R/MeC9Eg6t/g8D6mwD76b0R4UPFmPjVDWg+SfpcqYQInc6dLLM9vQmJO9HKouBkn8Rx3cUX5M7R
 3U+lqszPTCCwEKt0=
X-Received: by 2002:ac8:6750:: with SMTP id n16mr22292352qtp.362.1606750462858; 
 Mon, 30 Nov 2020 07:34:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwj8+RF7o8k4ZKm2WEiW7eLuB7oWwJNz68KLBStfoyGjANZORbcdG23nMIdjwKxSRt3+PAZMQ==
X-Received: by 2002:ac8:6750:: with SMTP id n16mr22292301qtp.362.1606750462378; 
 Mon, 30 Nov 2020 07:34:22 -0800 (PST)
Received: from xz-x1 ([142.126.81.247])
 by smtp.gmail.com with ESMTPSA id a6sm15072717qkg.136.2020.11.30.07.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 07:34:21 -0800 (PST)
Date: Mon, 30 Nov 2020 10:34:19 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v4 2/6] introduce UFFD-WP low-level interface helpers
Message-ID: <20201130153419.GA3277@xz-x1>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126151734.743849-3-andrey.gruzdev@virtuozzo.com>
 <20201127210400.GF6573@xz-x1>
 <bfd5afe2-3c4c-8c5b-a984-5c8bdc502a33@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <bfd5afe2-3c4c-8c5b-a984-5c8bdc502a33@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Nov 29, 2020 at 11:12:10PM +0300, Andrey Gruzdev wrote:
> > > +void ram_write_tracking_stop(void)
> > > +{
> > > +#ifdef CONFIG_LINUX
> > > +    RAMState *rs = ram_state;
> > > +    RAMBlock *bs;
> > > +    assert(rs->uffdio_fd >= 0);
> > 
> > Maybe too harsh - we can return if it's invalid.
> > 
> > Meanwhile, better rcu_read_lock(), as well?
> > 
> 
> Yep, RCU lock, I'll add. Why too harsh? Just a debug assertion.

I was afraid some special path could trigger ram_write_tracking_stop() being
called before ram_write_tracking_start(), then vm could crash.  If we can
guarantee that not happening, then it's also ok with assert().

[...]

> > > +/**
> > > + * uffd_poll_events: poll UFFD file descriptor for read
> > > + *
> > > + * Returns true if events are available for read, false otherwise
> > > + *
> > > + * @uffd: UFFD file descriptor
> > > + * @tmo: timeout in milliseconds, 0 for non-blocking operation,
> > > + *       negative value for infinite wait
> > > + */
> > > +bool uffd_poll_events(int uffd, int tmo)
> > 
> > Shall we spell "tmo" out?
> In the comment? I think it's ok.

I'd suggest to spell it out everywhere, especially in the codes.  But feel free
to take your own preference.  Thanks,

-- 
Peter Xu


