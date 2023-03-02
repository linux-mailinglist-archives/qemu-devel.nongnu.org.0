Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F164D6A837D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:27:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXix2-0003Ua-Hj; Thu, 02 Mar 2023 08:26:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pXiws-0003RH-Jo
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:26:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pXiwr-0004X3-4e
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:26:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677763575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a2nxODxGNCf2GEDTesp0abZC6ZU/bJOaxWOZgcF9cDk=;
 b=IaLeNYPymJrQwRmC9SE0u0csq/4RI1WbMiN38blaAWgXqEGCRdS05ETB3ZY/IxRt+OiIDh
 6mpz+WuONc6NOYqpUhOAQCs0PeRMYz9X/tTPeEwjuxDhUZ1ZQYkfvprnXURZZ0zvYYy4Vh
 egA4IPNnlyn4srZlQwAnR+VBX0EDrLs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-f5WNOqXyO6-aa48-cPrfJg-1; Thu, 02 Mar 2023 08:26:09 -0500
X-MC-Unique: f5WNOqXyO6-aa48-cPrfJg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B06F800B23;
 Thu,  2 Mar 2023 13:26:09 +0000 (UTC)
Received: from localhost (unknown [10.39.192.174])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEDC740C83B6;
 Thu,  2 Mar 2023 13:26:08 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric
 Auger <eauger@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v6 1/2] arm/kvm: add support for MTE
In-Reply-To: <CABJz62PbzFMB3ifg7OvTXe34TS5b3xDHJk8XGs-inA5t5UEAtA@mail.gmail.com>
Organization: Red Hat GmbH
References: <20230228150216.77912-1-cohuck@redhat.com>
 <20230228150216.77912-2-cohuck@redhat.com>
 <CABJz62OHjrq_V1QD4g4azzLm812EJapPEja81optr8o7jpnaHQ@mail.gmail.com>
 <874jr4dbcr.fsf@redhat.com>
 <CABJz62MQH2U1QM26PcC3F1cy7t=53_mxkgViLKjcUMVmi29w+Q@mail.gmail.com>
 <87sfeoblsa.fsf@redhat.com>
 <CABJz62PbzFMB3ifg7OvTXe34TS5b3xDHJk8XGs-inA5t5UEAtA@mail.gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 02 Mar 2023 14:26:06 +0100
Message-ID: <87fsanmgi9.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Mar 01 2023, Andrea Bolognani <abologna@redhat.com> wrote:

> On Wed, Mar 01, 2023 at 03:15:17PM +0100, Cornelia Huck wrote:
>> On Wed, Mar 01 2023, Andrea Bolognani <abologna@redhat.com> wrote:
>> > I'm actually a bit confused. The documentation for the mte property
>> > of the virt machine type says
>> >
>> >   mte
>> >     Set on/off to enable/disable emulating a guest CPU which implements
>> >     the Arm Memory Tagging Extensions. The default is off.
>> >
>> > So why is there a need to have a CPU property in addition to the
>> > existing machine type property?
>>
>> I think the state prior to my patches is actually a bit confusing: the
>> user needs to set a machine type property (causing tag memory to be
>> allocated), which in turn enables a cpu feature. Supporting the machine
>> type property for KVM does not make much sense IMHO: we don't allocate
>> tag memory for KVM (in fact, that would not work). We have to keep the
>> previous behaviour, and explicitly instructing QEMU to create cpus with
>> a certain feature via a cpu property makes the most sense to me.
>
> I agree that a CPU feature makes more sense.
>
>> We might want to tweak the documentation for the machine property to
>> indicate that it creates tag memory and only implicitly enables mte but
>> is a pre-req for it -- thoughts?
>
> I wonder if it would be possible to flip things around, so that the
> machine property is retained with its existing behavior for backwards
> compatibility, but both for KVM and for TCG the CPU property can be
> used on its own?
>
> Basically, keeping the default of machine.mte to off when cpu.mte is
> not specified, but switching it to on when it is. This way, you'd be
> able to simply use
>
>   -machine virt -cpu xxx,mte=on
>
> to enable MTE, regardless of whether you're using KVM or TCG, instead
> of requiring the above for KVM and
>
>   -machine virt,mte=on -cpu xxx
>
> for TCG.

The machine prop is a bool; that means that we cannot distinguish
between "user did not set mte at all" and "user explicitly set
mte=off" -- I think we want

  -machine virt,mte=off -cpu xxx,mte=on

to generate an error, but that would still imply that we'd need to error
out for

  -machine virt -cpu xxx,mte=on

as well.

We could make the machine prop OnOffAuto, but that looks like overkill
to me.

>
> Note that, from libvirt's point of view, there's no advantage to
> doing things that way instead of what you already have. Handling the
> additional machine property is a complete non-issue. But it would
> make things nicer for people running QEMU directly, I think.

I'm tempted to simply consider this to be another wart of the QEMU
command line :)


