Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8DB55BAC6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 17:35:13 +0200 (CEST)
Received: from localhost ([::1]:48584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5qld-0005V7-18
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 11:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o5qkB-0004d6-C8
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 11:33:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o5qk8-0003Qz-D5
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 11:33:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656344019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NZ+++UP5A+FlFcT5xn6GTZU0qNkT3o9w3tD5+HOMncE=;
 b=ZXOCCkbj6zriBuibDjE6jM5lysvoaqWXavPkCpEHN2fwIdeJn5faH8ZV22fLpUJWrAf0pK
 TOKZzCI+SKy/f5aEULJ6l6GTw7e0w1s7/7Ivc1FjMeFlwXag2eDsa0Ro/U5N8U4StLFjQB
 fUtCODbghnMi1pUXzBAlVRczoBaUnow=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-k5JMT3CbMHe_eXuHHVAGLA-1; Mon, 27 Jun 2022 11:33:33 -0400
X-MC-Unique: k5JMT3CbMHe_eXuHHVAGLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 958062806AC0;
 Mon, 27 Jun 2022 15:33:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 636032166B26;
 Mon, 27 Jun 2022 15:33:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 464EA21E690D; Mon, 27 Jun 2022 17:33:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  QEMU Developers
 <qemu-devel@nongnu.org>
Subject: Re: use of uninitialized variable involving visit_type_uint32() and
 friends
References: <CAFEAcA-wExOSiuJ5F6nBwWXcWW2c1rqHCfT=JNrdWQ4baqu3Og@mail.gmail.com>
 <CABgObfbu3MK6SCNGOFGGHWO72e3dYygUybgyavALKq5_pnWK0A@mail.gmail.com>
 <CAFEAcA-OBz90QjcDFCjm=gEZOnS1RRwEVY6=5+QBZNwvo7hD-g@mail.gmail.com>
Date: Mon, 27 Jun 2022 17:33:30 +0200
In-Reply-To: <CAFEAcA-OBz90QjcDFCjm=gEZOnS1RRwEVY6=5+QBZNwvo7hD-g@mail.gmail.com>
 (Peter Maydell's message of "Mon, 27 Jun 2022 14:33:52 +0100")
Message-ID: <87o7ye15px.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 1 Apr 2022 at 09:08, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>>
>>
>> On Thu, Mar 31, 2022 at 7:35 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> Coverity warns about use of uninitialized data in what seems
>>> to be a common pattern of use of visit_type_uint32() and similar
>>> functions. Here's an example from target/arm/cpu64.c:
>>>
>>> static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
>>>                                    void *opaque, Error **errp)
>>> {
>>>     ARMCPU *cpu = ARM_CPU(obj);
>>>     uint32_t max_vq;
>>>     if (!visit_type_uint32(v, name, &max_vq, errp)) {
>>>         return;
>>>     }
>>>     [code that does something with max_vq here]
>>> }
>>>
>>> This doesn't initialize max_vq, on the apparent assumption
>>> that visit_type_uint32() will do so. But that function [...]
>>> reads the value of *obj (the uninitialized max_vq).
>>
>>
>> The visit_type_* functions are written to work for both getters and setters.
>> For the leaves, that means potentially reading uninitialized data.  It is
>> harmless but very ugly, and with respect to static analysis it was all but
>> a time bomb, all the time.
>>
>> The best (but most intrusive) solution would be to add a parameter to all
>> visit_type_* functions with the expected "direction" of the visit, which
>> could be checked against v->type.
>
> So do we have a plan for what we want to do with this issue?
>
> In the meantime, any objections to my just marking all the Coverity
> issues which are pointing out that visit_* functions use uninitialized
> data as 'false positive' ? There are a ton of them, and they clog up
> the issue UI and make it hard to see other actually interesting reports.

I think to object, I would have to propose an alternative with a
reasonable chance of success within a reasonable time frame.  I can't,
so I won't.

Paolo proposed improvements, and I think they're worth exploring, but
such musings fall well short of my condition for "may object".


