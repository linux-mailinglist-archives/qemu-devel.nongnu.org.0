Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14E2686E45
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 19:40:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNI0q-0005bY-Pi; Wed, 01 Feb 2023 13:39:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNI0n-0005bG-Va
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 13:39:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNI0m-0000Ta-0H
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 13:39:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675276750;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=irfXd+OrbWvofFmv4DMNGRP0MqrsgnJtsh3k4L15HzA=;
 b=DlIlVhe7kcIgn+Lg5X0J3fIh6S6CQKeF/c6uMODKFFTDqTgJA2fm/pPVZfzvrpE29fjL8w
 lj7vL/Ib352yiR98L2Sa8FGfEoO2jOuCYh8oq+itfOvTjsysEYDo53w+T9yEHj1Z6hS2na
 r+HLdO+xGyH7UJPQ+Ns8NugsQuvRQMw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-155-2EIhTIDoPCi6YbLA9PlyXg-1; Wed, 01 Feb 2023 13:39:08 -0500
X-MC-Unique: 2EIhTIDoPCi6YbLA9PlyXg-1
Received: by mail-wr1-f69.google.com with SMTP id
 i8-20020a05600011c800b002bfb6712623so3103877wrx.6
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 10:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=irfXd+OrbWvofFmv4DMNGRP0MqrsgnJtsh3k4L15HzA=;
 b=AvQpeLYzZuhfjNLBMu5WKRJWxAhDRzsj7wCjI0G+XTE6+udxjJox0H5AX5rGxUxhox
 vGhgYLlhJ/MYz+ZLPh9FqkUhvad5aRiJRRT7ZwcZXNlLL5FJ+7ZZDJVS5IDLZcobAb/O
 X8WEB5ozgEJB/YES7TvdkfdeOnQEUfUaSOvZtDjeZGFFj3FXm4B/PIELn+p0ShO+ITx5
 hds3WdIKrvJFTThgViysKJuIehYNQSItXkfA0vD80/ZvkbIsU43tpc68tvN4u5SIZ7bg
 ePWvxcH75IEuCU6z2zvwbslnFvif2FQf9vby4Q6RRkCUv79H8f/AQQNfzaGcsZY/iala
 pZLA==
X-Gm-Message-State: AO0yUKVMM9IFHxaweDEZd9vOl5864BQSssEaI++8u/JIfRyWAnthgnC5
 Kr5dDZ5vzlMisDhNDNlX+OLOSVga4pLOIOG+J5qYuO24MI56v3wx4fFxn+F5P9bCsUjApiO48C6
 GjUHqqL3mMZ5BNPA=
X-Received: by 2002:a05:600c:468b:b0:3dc:486f:1552 with SMTP id
 p11-20020a05600c468b00b003dc486f1552mr2958252wmo.34.1675276747630; 
 Wed, 01 Feb 2023 10:39:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9wgu5J7HLpiXqapVMiboy+U/oLSr3m8W1k/5mrCDRdWpLICHi4/FuknGpRgDvciRWBI8cK0w==
X-Received: by 2002:a05:600c:468b:b0:3dc:486f:1552 with SMTP id
 p11-20020a05600c468b00b003dc486f1552mr2958236wmo.34.1675276747455; 
 Wed, 01 Feb 2023 10:39:07 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m17-20020a7bce11000000b003dc492e4430sm2589010wmc.28.2023.02.01.10.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 10:39:06 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>
Cc: qemu-devel@nongnu.org,  Markus Armbruster <armbru@redhat.com>,
 peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, "Wei W.
 Wang" <wei.w.wang@intel.com>
Subject: Re: Fortnightly KVM call for 2023-02-07
In-Reply-To: <87o7qof00m.fsf@secure.mitica> (Juan Quintela's message of "Tue, 
 24 Jan 2023 16:03:05 +0100")
References: <87o7qof00m.fsf@secure.mitica>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 19:39:05 +0100
Message-ID: <87ilglxmba.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Juan Quintela <quintela@redhat.com> wrote:
> Hi
>
> Please, send any topic that you are interested in covering in the next
> call in 2 weeks.
>
> We have already topics:
> - single qemu binary
>   People on previous call (today) asked if Markus, Paolo and Peter could
>   be there on next one to further discuss the topic.
>
> - Huge Memory guests
>
>   Will send a separate email with the questions that we want to discuss
>   later during the week.


Hi folks

Just one addition for next call.

"Wang, Wei W" <wei.w.wang@intel.com> has asked to give a presentation
about a new feature:
    TDX Live Migration
He wanted 1h, but I told him that we already have two topics for next
call.  So we leave it in half an hour and will do the rest of the
presentation in a following call.

Later, Juan.


>
> After discussions on the QEMU Summit, we are going to have always open a
> KVM call where you can add topics.
>
>  Call details:
>
> By popular demand, a google calendar public entry with it
>
>   https://calendar.google.com/calendar/event?action=TEMPLATE&tmeid=NWR0NWppODdqNXFyYzAwbzYza3RxN2dob3VfMjAyMjEwMThUMTMwMDAwWiBlZ2VkN2NraTA1bG11MXRuZ3ZrbDN0aGlkc0Bn&tmsrc=eged7cki05lmu1tngvkl3thids%40group.calendar.google.com&scp=ALL
>
> (Let me know if you have any problems with the calendar entry.  I just
> gave up about getting right at the same time CEST, CET, EDT and DST).
>
> If you need phone number details,  contact me privately
>
> Thanks, Juan.


