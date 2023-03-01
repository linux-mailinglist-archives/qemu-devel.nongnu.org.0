Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A0B6A6D6F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:52:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMsP-0007qA-1V; Wed, 01 Mar 2023 08:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pXMsE-0007od-A5
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pXMsC-0002gM-8F
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677678719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mftfQEi9wdaH6McKuPClmRUmMChN2OhoG+1UjGPOpjw=;
 b=AIXUY9apdKrVPNzPQ9jpLaG/2Mi1Pw3tcexix89ipHBAYuIABqpcaYGP2D3KonbWDr9Gfw
 ncP5ZsALiGDTjWrGbKcD6qYCZfCM41dG2da61/HZ4EirRhsfbdacCZ4mW+UFpSGznUSQAp
 3i6nmynfCkbpl+z7pZaR/9+3BoISo5Y=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-221-ybI1atrsPQeKsjrFLRUOwg-1; Wed, 01 Mar 2023 08:51:58 -0500
X-MC-Unique: ybI1atrsPQeKsjrFLRUOwg-1
Received: by mail-pf1-f197.google.com with SMTP id
 h1-20020a62de01000000b005d943b97706so6889201pfg.0
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 05:51:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mftfQEi9wdaH6McKuPClmRUmMChN2OhoG+1UjGPOpjw=;
 b=YQs23IyYfsQSj/ZgaWfB/iOgVRtXuKD/dzCoiKemc0t+6mrhNcfzc7pbEOEdlS5tZv
 clwhDE/voMdi1bKSi4oqda3dP62B0wLc8pmpOw7FZqi5HWvjJjTdxVVSwwLHNTYXmlTi
 3WZraxRVzBEziup9I9lbCWpGjxZmfSTyuy+OTr4QxHDOxVfrW0//x/TNzUxxYRTELI0u
 35e06eoLSAa0FSNfpZVqGVLy1Q41xhLHJjbbxGmXURfNMeFUWHegxq9orupzKWOsphRR
 dukFqZD9AzNJNig1uc9IfxrL/Jbob26J3ZtJeS/67WclNmlKQ+8nsptOhWS/Y6R1Xy/i
 TaWQ==
X-Gm-Message-State: AO0yUKUxWvasCBxFgWJSJQUHDWWORJ8GpNhzpIeedlfRjXy3QCp6+gKW
 FrhbEEbSLtM3E9ei7WOv8CpXauVs27EW/zHT0zouBUKIGgIVY2yxaASrpghgiXa4yI9HQKT42lr
 nll8+tUk44gksbuiaM/VkDjB0HOh5UMY=
X-Received: by 2002:a17:902:a3cd:b0:19c:be03:ce10 with SMTP id
 q13-20020a170902a3cd00b0019cbe03ce10mr2318743plb.9.1677678717057; 
 Wed, 01 Mar 2023 05:51:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+VwIMpkQPmtqSDdknUDIutD4sizupNM19vKv5zm2iK/1JA7xp0lu/ds3MQ/WbVn6ZY+NHdJ+zI4iECpRjydb4=
X-Received: by 2002:a17:902:a3cd:b0:19c:be03:ce10 with SMTP id
 q13-20020a170902a3cd00b0019cbe03ce10mr2318736plb.9.1677678716764; Wed, 01 Mar
 2023 05:51:56 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Mar 2023 05:51:56 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <20230228150216.77912-1-cohuck@redhat.com>
 <20230228150216.77912-2-cohuck@redhat.com>
 <CABJz62OHjrq_V1QD4g4azzLm812EJapPEja81optr8o7jpnaHQ@mail.gmail.com>
 <874jr4dbcr.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <874jr4dbcr.fsf@redhat.com>
Date: Wed, 1 Mar 2023 05:51:56 -0800
Message-ID: <CABJz62MQH2U1QM26PcC3F1cy7t=53_mxkgViLKjcUMVmi29w+Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] arm/kvm: add support for MTE
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 kvm@vger.kernel.org, Eric Auger <eauger@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 01, 2023 at 11:17:40AM +0100, Cornelia Huck wrote:
> On Tue, Feb 28 2023, Andrea Bolognani <abologna@redhat.com> wrote:
> > On Tue, Feb 28, 2023 at 04:02:15PM +0100, Cornelia Huck wrote:
> >> +MTE CPU Property
> >> +================
> >> +
> >> +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
> >> +presence of tag memory (which can be turned on for the ``virt`` machine via
> >> +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
> >> +proper migration support is implemented, enabling MTE will install a migration
> >> +blocker.
> >
> > Is it okay to use -machine virt,mte=on unconditionally for both KVM
> > and TCG guests when MTE support is requested, or will that not work
> > for the former?
>
> QEMU will error out if you try this with KVM (basically, same behaviour
> as before.) Is that a problem for libvirt, or merely a bit inconvinient?

I'm actually a bit confused. The documentation for the mte property
of the virt machine type says

  mte
    Set on/off to enable/disable emulating a guest CPU which implements
    the Arm Memory Tagging Extensions. The default is off.

So why is there a need to have a CPU property in addition to the
existing machine type property?

From the libvirt integration point of view, setting the machine type
property only for TCG is not a problem.

-- 
Andrea Bolognani / Red Hat / Virtualization


