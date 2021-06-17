Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48763AB5A6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 16:16:31 +0200 (CEST)
Received: from localhost ([::1]:54718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltsoo-0002vb-O5
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 10:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ltsmq-0000o9-0X
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:14:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ltsmm-0006ZW-7j
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623939262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3iDYzemEfvyBr5j053kFgUhvBAcaGUQWHEX3m7tez/E=;
 b=hile8qPNcG7FLA6lxL6Jl9LaKiCU1Pjz1Yz+Usc650sm9IZgvFQw3IrDzs+N2fMyBWU5Yf
 E/rQLaoW49sY3EDRY74hUdWUThuNcCVgQQiFEIRZ6AOyLj7AKphMVTGk5FJOTIAzvNYqQq
 a5RfRPTt2R8j8gbLTK/tVYY6A7RNhFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-bdVvo9HJMsm0JPyCCelcjw-1; Thu, 17 Jun 2021 10:14:20 -0400
X-MC-Unique: bdVvo9HJMsm0JPyCCelcjw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A4088015DB;
 Thu, 17 Jun 2021 14:14:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9FAD100164C;
 Thu, 17 Jun 2021 14:14:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 81863113865F; Thu, 17 Jun 2021 16:14:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v9] qapi: introduce 'query-kvm-cpuid' action
References: <20210603090753.11688-1-valeriy.vdovin@virtuozzo.com>
 <87im2d6p5v.fsf@dusky.pond.sub.org>
 <20210617074919.GA998232@dhcp-172-16-24-191.sw.ru>
 <87a6no3fzf.fsf@dusky.pond.sub.org>
 <790d22e1-5de9-ba20-6c03-415b62223d7d@suse.de>
Date: Thu, 17 Jun 2021 16:14:17 +0200
In-Reply-To: <790d22e1-5de9-ba20-6c03-415b62223d7d@suse.de> (Claudio Fontana's
 message of "Thu, 17 Jun 2021 13:56:31 +0200")
Message-ID: <877dis1sue.fsf@dusky.pond.sub.org>
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
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Claudio Fontana <cfontana@suse.de> writes:

> On 6/17/21 1:09 PM, Markus Armbruster wrote:
>> Valeriy Vdovin <valeriy.vdovin@virtuozzo.com> writes:
>> 
>>> On Thu, Jun 17, 2021 at 07:22:36AM +0200, Markus Armbruster wrote:
>>>> Valeriy Vdovin <valeriy.vdovin@virtuozzo.com> writes:
>>>>
>>>>> Introducing new qapi method 'query-kvm-cpuid'. This method can be used to
>>>>
>>>> It's actually a QMP command.  There are no "qapi methods".
>>>>
>>>>> get virtualized cpu model info generated by QEMU during VM initialization in
>>>>> the form of cpuid representation.
>>>>>
>>>>> Diving into more details about virtual cpu generation: QEMU first parses '-cpu'
>>>>
>>>> virtual CPU
>>>>
>>>>> command line option. From there it takes the name of the model as the basis for
>>>>> feature set of the new virtual cpu. After that it uses trailing '-cpu' options,
>>>>> that state if additional cpu features should be present on the virtual cpu or
>>>>> excluded from it (tokens '+'/'-' or '=on'/'=off').
>>>>> After that QEMU checks if the host's cpu can actually support the derived
>>>>> feature set and applies host limitations to it.
>>>>> After this initialization procedure, virtual cpu has it's model and
>>>>> vendor names, and a working feature set and is ready for identification
>>>>> instructions such as CPUID.
>>>>>
>>>>> Currently full output for this method is only supported for x86 cpus.
>>>>
>>>> Not sure about "currently": the interface looks quite x86-specific to me.
>>>>
>>> Yes, at some point I was thinking this interface could become generic,
>>> but does not seem possible, so I'll remove this note.
>>>
>>>> The commit message doesn't mention KVM except in the command name.  The
>>>> schema provides the command only if defined(CONFIG_KVM).
>>>>
>>>> Can you explain why you need the restriction to CONFIG_KVM?
>>>>
>>> This CONFIG_KVM is used as a solution to a broken build if --disable-kvm
>>> flag is set. I was choosing between this and writing empty implementation into
>>> kvm-stub.c
>> 
>> If the command only makes sense for KVM, then it's named correctly, but
>> the commit message lacks a (brief!) explanation why it only makes for
>> KVM.
>
>
> Is it meaningful for HVF?

I can't see why it couldn't be.

Different tack: if KVM is compiled out entirely, the command isn't
there, and trying to use it fails like

    {"error": {"class": "CommandNotFound", "desc": "The command query-kvm-cpuid has not been found"}}

If KVM is compiled in, but disabled, e.g. with -machine accel=tcg, then
the command fails like

    {"error": {"class": "GenericError", "desc": "VCPU was not initialized yet"}}

This is misleading.  The VCPU is actually running, it's just the wrong
kind of VCPU.

>> If it just isn't implemented for anything but KVM, then putting "kvm"
>> into the command name is a bad idea.  Also, the commit message should
>> briefly note the restriction to KVM.

Perhaps this one is closer to reality.

>> Pick one :)
>> 
>> [...]


