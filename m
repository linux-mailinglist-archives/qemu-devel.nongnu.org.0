Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2B34DC5B8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 13:22:21 +0100 (CET)
Received: from localhost ([::1]:54634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUp92-0004bK-Vl
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 08:22:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nUp3U-0000za-7X
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:16:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nUp3Q-0004cK-38
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:16:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647519390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3wLtgfMrTnAZM8DXX9aNtATXtMHzYutHAPU39Y7o/dI=;
 b=H0a6LCok3y/qokehN+KrgNtOGYvzW4U7E7ug+KXd4+ppUrSG3tjd45Rfno0a5vCHTzcs0c
 9fnKaMaOh20cYLTsJNuXTlLEf987w/cJ+hftW3RGZgGUGIxILO/HTgwGKHzdzMqogmVI67
 I/rp2hMyhFh9ldaUkHAWrnXFiK8FTF8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-3IkmjK_gPZyjO_eJMkjJ8A-1; Thu, 17 Mar 2022 08:16:29 -0400
X-MC-Unique: 3IkmjK_gPZyjO_eJMkjJ8A-1
Received: by mail-wm1-f69.google.com with SMTP id
 i6-20020a05600c354600b0038be262d9d9so3049995wmq.8
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 05:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=3wLtgfMrTnAZM8DXX9aNtATXtMHzYutHAPU39Y7o/dI=;
 b=d5KvCAclNzcQmYa+t+7JYVo34XW5Bjbi8yoBcuUOggi6VElsYqoxpfyXC0cEvMCaa9
 jA57eGg5Am98nDPPk2niG78tkc/pnQWA7tm2JfhkEdtNCn5jLueeuap05SKqxcj4sw5k
 e0kkUA6r3ff+pPuhRIm/GkqDvW61xAc8mgrxzudVPNdkix5+b2oOmiDGDlQmTxE7XoZr
 mjU05UmsYVJ6BaGSXuPQrJ7rb3/ibejqFJLjggRpb1Lfb2m015x/FJUTod3TTxXNf3OE
 0PZKvoOkSXPB07kLGD0i/J5vfJYjPA/DW4he+XZxhnM2Y6vyGP/BYw/edAB1gDBPv3x9
 tJQA==
X-Gm-Message-State: AOAM5303GIrF/WjlG473+lbT+RpxHCAUd+ZnF1QKUAqgFcuvhsKpJcm6
 d3iwhfPDP1QPaBNS6SxW3ZATFsc/mGREmI+/J/7WE/+rGTNgE9Q4yLwybOwwKqCgmBRuUm0+gTe
 SosTBkm0Z4dPWrs0=
X-Received: by 2002:a1c:cc01:0:b0:37b:dcc8:7dfd with SMTP id
 h1-20020a1ccc01000000b0037bdcc87dfdmr3724651wmb.134.1647519388328; 
 Thu, 17 Mar 2022 05:16:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHfD1jIvFpupLAusnY4Fd0iKCx8tIR2EJSfod0+/8IawgCzq8+g6tv40A8GB+QvYNMXV0ljw==
X-Received: by 2002:a1c:cc01:0:b0:37b:dcc8:7dfd with SMTP id
 h1-20020a1ccc01000000b0037bdcc87dfdmr3724623wmb.134.1647519387994; 
 Thu, 17 Mar 2022 05:16:27 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm4074678wri.4.2022.03.17.05.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 05:16:27 -0700 (PDT)
Date: Thu, 17 Mar 2022 12:16:25 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Message-ID: <YjMmmSHMkTE6sPE0@work-vm>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
 <YjCnss5W5MhZK1Hw@redhat.com> <YjC2+F2SkNEDOXTe@redhat.com>
 <7b634dc9-cca5-c9d0-e392-21a594851b0c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7b634dc9-cca5-c9d0-e392-21a594851b0c@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> On 3/15/22 16:55, Daniel P. Berrangé wrote:
> > Expecting maintainers to enforce a subset during code review feels
> > like it would be a tedious burden, that will inevitably let stuff
> > through because humans are fallible, especially when presented
> > with uninspiring, tedious, repetitive tasks.
> > 
> > Restricting ourselves to a subset is only viable if we have
> > an automated tool that can reliably enforce that subset. I'm not
> > sure that any such tool exists, and not convinced our time is
> > best served by trying to write & maintainer one either.
> 
> We don't need to have a policy on which features are used.  We need to have
> goals for what to use C++ for.  I won't go into further details here,
> because I had already posted "When and how to use C++"[1] about an hour
> before your reply.
> 
> > IOW, I fear one we allow C++ in any level, it won't be practical
> > to constrain it as much we desire. I fear us turning QEMU into
> > even more of a monster like other big C++ apps I see which take
> > all hours to compile while using all available RAM in Fedora RPM
> > build hosts.
> 
> Sorry but this is FUD.  There's plenty of C++ apps and libraries that do not
> "take hours to compile while using all available RAM".  You're probably
> thinking of the Chromium/Firefox/Libreoffice triplet but those are an order
> of magnitude larger than QEMU.  And in fact, QEMU is *already* a monster
> that takes longer to compile than most other packages, no matter the
> language they're written in.
> 
> Most of KDE and everything that uses Qt is written in C++, and so is
> Inkscape in GTK+ land.  LLVM and Clang are written in C++.  Hotspot and V8
> are written in C++.  Kodi, MAME and DolphinEmu are written in C++. GCC and
> GDB have migrated to C++ and their compile times have not exploded.

While I think it does take longer to compile, the bigger problem for
the CI setup is the amount of RAM-per-compile-process; it's not so much
the fact that those applications are huge that's the problem, it's that
a make -j ($threads) can run out of RAM.

Dave

> > My other question is whether adoption of C++ would complicate any
> > desire to make more use of Rust in QEMU ? I know Rust came out of
> > work by the Mozilla Firefox crew, and Firefox was C++, but I don't
> > have any idea how they integrated use of Rust with Firefox, so
> > whether there are any gotcha's for us or not ?
> 
> Any Rust integration would go through C APIs.  Using Rust in the block layer
> would certainly be much harder, though perhaps not impossible, if the block
> layer uses C++ coroutines.  Rust supports something similar, but
> two-direction interoperability would be hard.
> 
> For everything else, not much.  Even if using C++, the fact that QEMU's APIs
> are primarily C would not change.  Changing "timer_mod_ns(timer, ns)" to
> "timer.modify_ns(ns)" is not on the table.
> 
> But really, first of all the question should be who is doing work on
> integrating Rust with QEMU.  I typically hear about this topic exactly once
> a year at KVM Forum, and then nothing.  We have seen Marc-André's QAPI
> integration experiment, but it's not clear to me what the path would be from
> there to wider use in QEMU.
> 
> In particular, after ~3 years of talking about it, it is not even clear:
> 
> - what subsystems would benefit the most from the adoption of Rust, and
> whether that would be feasible without a rewrite which will simply never
> happen
> 
> - what the plans would be for coexistence of Rust and C code within a
> subsystem
> 
> - whether maintainers would be on board with adopting a completely different
> language, and who in the community has enough Rust experience to shepherd us
> through the learning experience
> 
> The first two questions have answers in the other message if s/Rust/C++/,
> and as to the last I think we're already further in the discussion.
> 
> Thanks,
> 
> Paolo
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


