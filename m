Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC154DD514
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 08:10:23 +0100 (CET)
Received: from localhost ([::1]:36626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV6kf-0003C0-T6
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 03:10:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nV6jI-0002Na-Ie
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 03:08:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nV6jF-0008N3-Cd
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 03:08:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647587331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K09/QLKTA5GgTONhLAEVd097SaYDFYzvWA3SFtG94Hc=;
 b=W6y6jt433421TEU2eh0diir4k6L5rE+Rr2A+MsxeWBXPaiT+1egrWd1GVIuqEkbhEqPcEj
 hUlz7qnU65hbZtMzFDgbmQnWgh+o1yG/9xJfRUxIZPQLri/hYbQjZX9H1zUJO/qSXc3v3g
 n7ddTivvK2qkOkactpDzwppOVng/bsI=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-GMlrYkEjOvSmGUw3Od8bkg-1; Fri, 18 Mar 2022 03:08:50 -0400
X-MC-Unique: GMlrYkEjOvSmGUw3Od8bkg-1
Received: by mail-pg1-f200.google.com with SMTP id
 u4-20020a63b544000000b0037c62d8b0ecso2960431pgo.13
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 00:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=K09/QLKTA5GgTONhLAEVd097SaYDFYzvWA3SFtG94Hc=;
 b=r2Sobd+iNhDJNaTcNqbgZm2kFmOqTH/pXxcXKbY4JwZ8NqRjlrJ1Dwi3e1a4oKVZwN
 TCd5M9cx7e+V4+lYDLN+ikrBZrpRjMvQnVy2wcsNwQeNVhEg14WGSokL9Kg0oBnwAQDV
 Lkl/Eufdcrn8lgqTLYFOLJciZXDnQKnTwQ1NW+8V6jli8p9IojgEyTyTC+bHzIiLuLKn
 wKnWnabwGQ/9k4YOEMyV+ooLjNygeklQNG2ljZDg3NBKENOAqy8diVdR0JN8Tfp0MkVG
 X7zjaZbl1U4ermzzNWg+Vp49yDjM9xIlth+kIUzdD7hQJWki0pBDbxmuNU1Rh2vVLQ/Q
 2fQQ==
X-Gm-Message-State: AOAM531lhHBLRdgfd3JjGvfvNp9I8k09ZT7M5ikYRSQT1M0yzLeihCvq
 3KeuEDfIYJZRAK097+emorda2y/EmMU+yABL2erUPVIeHMq9zeTHXwC+K312Cdx6NOInAGzweQf
 i0C5M7b59O6BFlSM=
X-Received: by 2002:a05:6a00:1f19:b0:4fa:6b9c:6e1c with SMTP id
 be25-20020a056a001f1900b004fa6b9c6e1cmr2825217pfb.35.1647587329233; 
 Fri, 18 Mar 2022 00:08:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcMfgJrXQdlbticWb4u2WF5SJ0Lf6unuiPaiybHc29Oa6XkGy/N5CZYojnLjDrRdcSLEFktQ==
X-Received: by 2002:a05:6a00:1f19:b0:4fa:6b9c:6e1c with SMTP id
 be25-20020a056a001f1900b004fa6b9c6e1cmr2825196pfb.35.1647587328880; 
 Fri, 18 Mar 2022 00:08:48 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.138])
 by smtp.gmail.com with ESMTPSA id
 ob13-20020a17090b390d00b001becfd7c6f3sm7851299pjb.27.2022.03.18.00.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 00:08:48 -0700 (PDT)
Date: Fri, 18 Mar 2022 15:08:43 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: Time to introduce a migration protocol negotiation (Re: [PATCH
 v2 00/25] migration: Postcopy Preemption)
Message-ID: <YjQv+8KRrLoks/TP@xz-m1.local>
References: <Yh30/nPtWyvqp8xo@redhat.com> <Yh37hLn5Dlffm13P@xz-m1.local>
 <Yh5O/eq4If4MYpTq@work-vm> <Yi+ONfiZlQD2LoHX@redhat.com>
 <YjAul3GIWmB3+v0P@xz-m1.local> <YjB1XXzIsJWtSR4E@redhat.com>
 <YjFZ84Wdz6jpSekr@xz-m1.local> <YjG1AGhai1QvDdrd@redhat.com>
 <YjG+iHCmCXRPIV1m@xz-m1.local> <YjHDZSCZM3VmUVx8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YjHDZSCZM3VmUVx8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Mar 16, 2022 at 11:00:53AM +0000, Daniel P. Berrangé wrote:
> On Wed, Mar 16, 2022 at 06:40:08PM +0800, Peter Xu wrote:
> > On Wed, Mar 16, 2022 at 09:59:28AM +0000, Daniel P. Berrangé wrote:
> > > On Wed, Mar 16, 2022 at 11:30:59AM +0800, Peter Xu wrote:
> > > > On Tue, Mar 15, 2022 at 11:15:41AM +0000, Daniel P. Berrangé wrote:
> > > > > > I still remember you mentioned the upper layer softwares can have
> > > > > > assumption on using only 1 pair of socket for migration, I think that makes
> > > > > > postcopy-preempt by default impossible.
> > > > > > 
> > > > > > Why multifd is different here?
> > > > > 
> > > > > It isn't different. We went through the pain to extending libvirt
> > > > > to know how to open many channels for multifd. We'll have todo
> > > > > the same with this postcopy-pre-empt. To this day though, management
> > > > > apps above libvirt largely don't enable multifd, which is a real
> > > > > shame. This is the key reason I think we need to handle this at
> > > > > the QEMU level automatically.
> > > > 
> > > > But I still don't undertand how QEMU could know about those tunnels, which
> > > > should be beyond QEMU's awareness?
> > > > 
> > > > The tunneling program can be some admin initiated socat tcp forwarding
> > > > programs, which by default may not allow >1 socket pairs.
> > > > 
> > > > Or maybe I have mis-understood on what's the tunneling we're discussing?
> > > 
> > > I dont think I was talking about tunneling at all, just QEMU
> > > migration protocol options !
> > 
> > Ah. :)
> > 
> > > 
> > > If an app is tunnelling QEMU's migration protocol over some
> > > channel, that isn't important to QEMU - regardless whether a
> > > passed in 'fd:' protocol FD is a direct TCP socket, or a
> > > UNIX socket for a tunnel, QEMU works the same way. In one
> > > of my other replies I mention a way to make 'fd:' work with
> > > an arbitrary number of channels, by using an event from QEMU
> > > to request the app provide additional FDs.
> > 
> > I very much agree on the whole concept of what you proposed, either on the
> > new negotiation phase itself, or the idea that with the negotiation phase
> > we can try to auto-enable some features we not used to.
> > 
> > What I wanted to express is we can't enable either preempt mode or multifd
> > automatically from qemu even with them, because these two are quite special
> > IMHO in that qemu doesn't know whether the mgmt app can handle the multiple
> > socket pairs.  Yes we could teach qemu to dynamically accept new "fd"s, but
> > again IMHO that still needs to be intervened by the mgmt app.
> 
> My proposal absolutely *can* let QEMU do that automatically, and that
> is one of the most important benefits of it.
> 
> [quote]
> Introduce one *final-no-more-never-again-after-this* migration
> capability called "protocol-negotiation".
> 
> When that capability is set, first declare that henceforth the
> migration transport is REQUIRED to support **multiple**,
> **bi-directional** channels. We might only use 1 TCP channel
> in some cases, but it declares our intent that we expect to be
> able to use as many channels as we see fit henceforth.
> [/quote]
> 
> IOW, any management app that enabled 'protocol-negotiation' is explicitly
> declaring that it accepts the new requirements for support for multiple
> channels. An app which enabled 'protocol-negotiation' capability while
> only allowing 1 chanels is simply broken, because it would be violating
> the documented requirements for the capability.

Sorry I misteriously overlooked that paragraph.. it's just that from the
wording "negotiation" shouldn't rely on multipe sockets, since from the
literal meaning any bidirectional channel should be negotiatable.  But I
see what you mean now..  Thanks,

-- 
Peter Xu


