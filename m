Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9064D9475
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 07:16:34 +0100 (CET)
Received: from localhost ([::1]:49862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU0Tw-0001A7-O0
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 02:16:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nU0RR-0007lO-QP
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:13:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nU0RN-0004JG-DL
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647324831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iyrJzcrSLcyCJ+fH3uiXFjDpNpubqxwLo3pXDNwhrF8=;
 b=Mre3A170G/SP84aq0eRx7zeplgyddD/JSZkPXwIqZ1X5jQ0xv46zftDLF2GzoXWiMHvHl2
 Pd3/JNUurhDDle0rwEW+M+JSvgYNyqmre1jOqInEHkBmkXQ9+XTerCaLl9Qw1LooHI5eRI
 UYmzC2FIO7qoFS0RdMe1tIO8cxHQ9wY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-poZBZnsjPuKqGCO7k9mZNg-1; Tue, 15 Mar 2022 02:13:50 -0400
X-MC-Unique: poZBZnsjPuKqGCO7k9mZNg-1
Received: by mail-pj1-f69.google.com with SMTP id
 bv2-20020a17090af18200b001c63c69a774so734304pjb.0
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 23:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iyrJzcrSLcyCJ+fH3uiXFjDpNpubqxwLo3pXDNwhrF8=;
 b=OQbAiMcWtzmKwEw2GaY6UC0oJu8lk5DwYgvaz+TVL1zklvFZBKM4E/Bih4tYAeraUT
 4dEoQjHkTkgbO1ncrcmJw8EsbrXxbL3f3nWcpd+5W/zSROiNDXi2h/NErHHHtvRMXgCd
 RssmMjpCNdle0xEa2nqmS0dvAce4qpXXSjujKNYD32OwkZX0IF5ucBeJQeJuIpDtDLnE
 H/uWCo/4XrSAFTTgxGxPJe9DMuJNpmQF0RuQEz/DGT5Y8XEy5eHsCuQLYXcifjrBvwbv
 nyGHT7xYgBJo44a3kFE4georf4s6iqLf5IT0kzxU+xd2oQUpVga5QinNFidawywBujWO
 GSxw==
X-Gm-Message-State: AOAM533PamHXDmhwD+Hpji9A482A0Yk75z5yqbEaJ/zuOiIBrxxH+APD
 ypVUjKrynp7/yHcDexi3G9mCxhc4o4Se5qHOikgyxf7nX9ti04l3pBzBYI5PXmtL+MUMIjyvTGW
 MT+SBPbH9sX7HTas=
X-Received: by 2002:a05:6a00:1943:b0:4cb:79c9:fa48 with SMTP id
 s3-20020a056a00194300b004cb79c9fa48mr27123200pfk.47.1647324829063; 
 Mon, 14 Mar 2022 23:13:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwAILYPY1sqeojd1JBl85P8JKNSiXV/R7B0ZBjdIzEEpvlgZBmiLk7GHZFcq2MguFCx2ciXA==
X-Received: by 2002:a05:6a00:1943:b0:4cb:79c9:fa48 with SMTP id
 s3-20020a056a00194300b004cb79c9fa48mr27123159pfk.47.1647324828578; 
 Mon, 14 Mar 2022 23:13:48 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.43]) by smtp.gmail.com with ESMTPSA id
 y14-20020a62f24e000000b004f7d604f5ddsm5776447pfl.181.2022.03.14.23.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 23:13:48 -0700 (PDT)
Date: Tue, 15 Mar 2022 14:13:43 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: Time to introduce a migration protocol negotiation (Re: [PATCH
 v2 00/25] migration: Postcopy Preemption)
Message-ID: <YjAul3GIWmB3+v0P@xz-m1.local>
References: <20220301083925.33483-1-peterx@redhat.com>
 <Yh3mo5VFQ3gT1Gd7@redhat.com> <Yh3yzbmOqAVV9iM9@xz-m1.local>
 <Yh30/nPtWyvqp8xo@redhat.com> <Yh37hLn5Dlffm13P@xz-m1.local>
 <Yh5O/eq4If4MYpTq@work-vm> <Yi+ONfiZlQD2LoHX@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yi+ONfiZlQD2LoHX@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 06:49:25PM +0000, Daniel P. Berrangé wrote:
> Taking a step back here and looking at the bigger picture of
> migration protocol configuration....
> 
> Almost every time we add a new feature to migration, we end up
> having to define at least one new migration parameter, then wire
> it up in libvirt, and then the mgmt app too, often needing to
> ensure it is turn on for both client and server at the same time.
> 
> 
> For some features, requiring an explicit opt-in could make sense,
> because we don't know for sure that the feature is always a benefit.
> These are things that can be thought of as workload sensitive
> tunables.
> 
> 
> For other features though, it feels like we would be better off if
> we could turn it on by default with no config. These are things
> that can be thought of as migration infrastructre / transport
> architectural designs.

Thanks for raising this discussion.  That's something I wanted to raise too
but I just haven't, at least formally.

Actually I think I raised this question once or twice, but I just didn't
insist trying. :)

> 
> 
> eg it would be nice to be able to use multifd by default for
> migration. We would still want a tunable to control the number
> of channels, but we ought to be able to just start with a default
> number of channels automatically, so the tunable is only needed
> for special cases.

I still remember you mentioned the upper layer softwares can have
assumption on using only 1 pair of socket for migration, I think that makes
postcopy-preempt by default impossible.

Why multifd is different here?

> 
> This post-copy is another case.  We should start off knowing
> we can switch to post-copy at any time.

This one is kind of special and it'll be harder, IMHO.

AFAIU, postcopy users will always initiate the migration with at least a
full round of precopy, with the hope that all the static guest pages will
be migrated.

It could even keep going with the 2nd, or 3rd iteration until the VM admin
thinks it's proper to trigger the last phase postcopy. So at least for some
use scenarios the switch of pre->post does require human resource
intervention.

However we could still have some parameter so that when the user wants to
let QEMU decide the time of switch, then we could at least still consider:

  -global migration.postcopy-auto-switch=off|on|immediate

We could define "off|on|immediate" as:

  - "off": this should still be the default, means we need another
    migrate-start-postcopy QMP command to trigger the switch

  - "first": this can mean that right after we finish the 1st round
    migration we automatically switch to postcopy

  - "immediate": this will be the most interesting that I wanted to try
    out, which is.. we could consider start postcopy right now without
    precopy.  It further means:

    - KVM dirty tracking is not needed at all, because all pages are dirty
      by default on dest qemu, so all pages need to be requested.  This
      removes _all_ dirty tracking complexity.

    - It will be the most bandwidth-friendly solution, because literally
      each guest page is only sent once.

I could have got off-topic a bit more especially on the "immediate" option
above, but since we're talking about auto-switch of postcopy I want to
mention this because this has been in my mind for a very long time...

> We should further be able to add pre-emption if we find it available.

Yeah here I have the same question per multifd above.  I just have no idea
whether QEMU has such knowledge on making this decision.  E.g., how could
QEMU know whether upper app is not tunneling the migration stream?  How
could QEMU know whether the upper app could handle multiple tcp sockets
well?

> IOW, we should
> not have required anything more than 'switch to post-copy' to
> be exposed to mgmtm apps.
> 
> Or enabling zero copy on either send or receive side.
> 
> Or enabling kernel-TLS offload
> 
> Or ..insert other interesting protocol feature...
> 
> 
> 
> All this stems from our current migration protocol that started
> as a single unidirectional channel, which goes straight into
> the migration data stream, with no protocol handshake  and
> thus no feature negotiation either.
> 
> We've offloaded feature negotiation to libvirt and in turn to
> the mgmt app and this is awful, for thue layers above, but
> also awful for QEMU. Because multifd requires mgmt app opt-in,
> we can wait 10 years and there will still be countless apps
> using single-fd mode because they've not been updated to
> opt-in.  If we negotiated features at QEMU level we could
> have everything using multifd in a few years, and have dropped
> single-fd mode a few years later.
> 
> 
> So rather than following our historical practice, anjd adding
> yet another migration parameter for a specific feature, I'd
> really encourage us to put a stop to it and future proof
> ourselves.
> 
> 
> Introduce one *final-no-more-never-again-after-this* migration
> capability called "protocol-negotiation".

Let's see how Juan/Dave/others think.. anyway, that's something I always
wanted.

IMHO an even simpler term can be as simple as:

  -global migration.handshake=on

But the naming is not anything important. The idea should always be that
the protocol should not be static anymore (which was only based on
cap/params set by the user) but it can be dynamic depending on how the
handshake/negotiation goes.

I would very much second that idea if it'll come one day.

> 
> 
> When that capability is set, first declare that henceforth the
> migration transport is REQUIRED to support **multiple**,
> **bi-directional** channels.

This new capability will simply need to depend on the return-path
capability we already have.  E.g. exec-typed migration won't be able to
enable return-path, so not applicable to this one too.

When we introduce return-path capability, we _could_ have already required
handshake already.  We didn't, iirc, because at that time I haven't thought
solid on how to define this dynamic protocol, and there we have a real
problem to solve, which is when dest QEMU failed to load the last phase of
device state we used to have a bug (when without return-path capability)
that both QEMUs will quit and VM data corrupted.

The new return-path well resolve that problem because that allows the dest
QEMU to do a very last phase ACK to source telling the source QEMU to quit,
otherwise the src QEMU will always contain the most latest guest pages
(we're only talking about precopy here, of course..).

> We might only use 1 TCP channel
> in some cases, but it declares our intent that we expect to be
> able to use as many channels as we see fit henceforth.
> 
> Now define a protocol handshake. A 5 minute thought experiment
> starts off with something simple:
> 
>    dst -> src:  Greeting Message:
>                   Magic: "QEMU-MIGRATE"  12 bytes
>                   Num Versions: 1 byte
>                   Version list: 1 byte * num versions
>                   Num features: 4 bytes
>                   Feature list: string * num features
> 
>    src -> dst:  Greeting Reply:
>                   Magic: "QEMU-MIGRATE" 12 bytes
>                   Select version: 1 byte
>                   Num select features: 4 bytes
>                   Selected features: string * num features   
> 
>    .... possibly more src <-> dst messages depending on
>         features negotiated....
> 
>    src -> dst:  start migration
>  
>     ...traditional migration stream runs now for the remainder
>        of this connection ...
> 
> 
> 
> I suggest "dst" starts first, so that connecting to a dst lets you
> easily debug whether QEMU is speaking v2 or just waiting for the
> client to send something as traditionally the case.

No strong opinion on which QEMU should start the conversation, just to
mention that we may not be able to use this to identify whether it's an old
or new QEMU, afaiu, because of network delays?

We can never tell whether the dest QEMU didn't talk is because it's an old
binary or it's new binary but with high latency network.

> 
> This shouldn't need very much code, and it gives us flexibility
> to do all sorts of interesting things going forward with less
> overhead for everyone involved.
> 
> We can layer in a real authentication system like SASL after
> the greeting without any libvirt / mgmt app support
> 
> We can enable zero-copy at will. We can enable kernel-TLS at
> will. We can add new TCP connections for clever feature XYZ.
> 
> We get a back channel every time, so dst can pass info back
> to the src to optimize behaviour.
> 
> We can experiment with features and throw them away again
> later without involving the mgmt app, since we negotiate
> their use.

Thanks,

-- 
Peter Xu


