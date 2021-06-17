Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8BB3AB207
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 13:10:48 +0200 (CEST)
Received: from localhost ([::1]:35960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltpv5-0004J9-Dq
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 07:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ltptl-0003cg-M4
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:09:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ltptb-0002k5-JR
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623928154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7qWZzuA2Y1bo+JLlFd2CD8tH7SKYj99Hgs/TVPOjKEo=;
 b=NBXVVirzZRo2EsjjqAUf5kU+FdbjhQkw3iGO89u0cuiBRWf9L3vSmbR7aeluYVifAK1cFd
 bShLjNeOdMCVQZkKfRTKLAU6BGQffIPDsm8HOTmYACmvvn03ejDqzz2VlUS2MASxpkH3zO
 cEgvdClT3dpQ3XjIyw2qx2hOwlKqIpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-GDFr9j2-PsCsyLCXOTrHDQ-1; Thu, 17 Jun 2021 07:09:13 -0400
X-MC-Unique: GDFr9j2-PsCsyLCXOTrHDQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A7C6100CF71;
 Thu, 17 Jun 2021 11:09:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A9271002D71;
 Thu, 17 Jun 2021 11:09:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F0E24113865F; Thu, 17 Jun 2021 13:09:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
Subject: Re: [PATCH v9] qapi: introduce 'query-kvm-cpuid' action
References: <20210603090753.11688-1-valeriy.vdovin@virtuozzo.com>
 <87im2d6p5v.fsf@dusky.pond.sub.org>
 <20210617074919.GA998232@dhcp-172-16-24-191.sw.ru>
Date: Thu, 17 Jun 2021 13:09:08 +0200
In-Reply-To: <20210617074919.GA998232@dhcp-172-16-24-191.sw.ru> (Valeriy
 Vdovin's message of "Thu, 17 Jun 2021 10:49:19 +0300")
Message-ID: <87a6no3fzf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Denis Lunev <den@openvz.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Valeriy Vdovin <valeriy.vdovin@virtuozzo.com> writes:

> On Thu, Jun 17, 2021 at 07:22:36AM +0200, Markus Armbruster wrote:
>> Valeriy Vdovin <valeriy.vdovin@virtuozzo.com> writes:
>> 
>> > Introducing new qapi method 'query-kvm-cpuid'. This method can be used to
>> 
>> It's actually a QMP command.  There are no "qapi methods".
>> 
>> > get virtualized cpu model info generated by QEMU during VM initialization in
>> > the form of cpuid representation.
>> >
>> > Diving into more details about virtual cpu generation: QEMU first parses '-cpu'
>> 
>> virtual CPU
>> 
>> > command line option. From there it takes the name of the model as the basis for
>> > feature set of the new virtual cpu. After that it uses trailing '-cpu' options,
>> > that state if additional cpu features should be present on the virtual cpu or
>> > excluded from it (tokens '+'/'-' or '=on'/'=off').
>> > After that QEMU checks if the host's cpu can actually support the derived
>> > feature set and applies host limitations to it.
>> > After this initialization procedure, virtual cpu has it's model and
>> > vendor names, and a working feature set and is ready for identification
>> > instructions such as CPUID.
>> >
>> > Currently full output for this method is only supported for x86 cpus.
>> 
>> Not sure about "currently": the interface looks quite x86-specific to me.
>> 
> Yes, at some point I was thinking this interface could become generic,
> but does not seem possible, so I'll remove this note.
>
>> The commit message doesn't mention KVM except in the command name.  The
>> schema provides the command only if defined(CONFIG_KVM).
>> 
>> Can you explain why you need the restriction to CONFIG_KVM?
>> 
> This CONFIG_KVM is used as a solution to a broken build if --disable-kvm
> flag is set. I was choosing between this and writing empty implementation into
> kvm-stub.c

If the command only makes sense for KVM, then it's named correctly, but
the commit message lacks a (brief!) explanation why it only makes for
KVM.

If it just isn't implemented for anything but KVM, then putting "kvm"
into the command name is a bad idea.  Also, the commit message should
briefly note the restriction to KVM.

Pick one :)

[...]


