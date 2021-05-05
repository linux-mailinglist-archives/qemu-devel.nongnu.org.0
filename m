Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9492E373E1D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:08:59 +0200 (CEST)
Received: from localhost ([::1]:43760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJ90-0005cZ-3z
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1leJ2S-0001pb-2L
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:02:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1leJ2F-0001ql-Nj
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620226918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fhMp4x+KILijfTKHWUNCFvTuYIYiXuFj4VSPB80hbqg=;
 b=FjbU1LlfoQqj4O5QB4o7wBRUaTGzjrNY2URPy3rvJY27+s77scHzzOxo4cYZyot91pvoOy
 Xy+nF2uJDwTeqf4roOOFyaWuneR8+lZZyEqyZlfoZbMCoTw3xzkWExcx+fBzMpW/lfa6bn
 SDc5PrSyocZwbE5Xb3LfmioYLDyrSHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-QXJDeNWnNMaHXWeVmloDqQ-1; Wed, 05 May 2021 11:01:47 -0400
X-MC-Unique: QXJDeNWnNMaHXWeVmloDqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB3141020C24;
 Wed,  5 May 2021 15:01:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64EBD6062C;
 Wed,  5 May 2021 15:01:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D934A1138529; Wed,  5 May 2021 17:01:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 02/10] accel: Introduce 'query-accels' QMP command
References: <20210501223638.510712-1-philmd@redhat.com>
 <20210501223638.510712-3-philmd@redhat.com>
 <87o8dpvet4.fsf@dusky.pond.sub.org>
 <918d1fc1-260c-57b7-2dd9-61f1125a2aa2@redhat.com>
Date: Wed, 05 May 2021 17:01:41 +0200
In-Reply-To: <918d1fc1-260c-57b7-2dd9-61f1125a2aa2@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 5 May 2021 13:49:45
 +0200")
Message-ID: <87tunhns16.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 5/5/21 9:07 AM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> Introduce the 'query-accels' QMP command which returns a list
>>> of built-in accelerator names.
>>>
>>> - Accelerator is a QAPI enum of all existing accelerators,
>>>
>>> - AcceleratorInfo is a QAPI structure providing accelerator
>>>   specific information. Currently the common structure base
>>>   provides the name of the accelerator, while the specific
>>>   part is empty, but each accelerator can expand it.
>>>
>>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>>
>>> For example on a KVM-only build we get:
>>>
>>>     { "execute": "query-accels" }
>>>     {
>>>         "return": [
>>>             {
>>>                 "name": "qtest"
>>>             },
>>>             {
>>>                 "name": "kvm"
>>>             }
>>>         ]
>>>     }
>>>
>>> Note that we can't make the enum values or union branches conditional
>>> because of target-specific poisoning of accelerator definitions.
>>=20
>> Let me try to complete this argument;
>>=20
>>   If we did, enum Accelerator could only be used in target-specific
>>   code.  But we want to use it in generic code, too.
>>=20
>> Which generic code exactly?
>
>
> cpu.c:133:#ifdef CONFIG_TCG
> hmp-commands-info.hx:271:#if defined(CONFIG_TCG)
> monitor/misc.c:324:#ifdef CONFIG_TCG
> softmmu/physmem.c:28:#ifdef CONFIG_TCG
>
> and more importantly:
>
> include/exec/cpu-all.h:430:#ifdef CONFIG_TCG
> include/exec/cpu-defs.h:77:#if !defined(CONFIG_USER_ONLY) &&
> defined(CONFIG_TCG)
> include/exec/exec-all.h:25:#ifdef CONFIG_TCG
> include/sysemu/cpu-timers.h:27:#ifdef CONFIG_TCG
>
> Thomas might provide more cases, IIRC he audited this recently.

No need, I'm interested in examples, not a complete list.

Please amend the commit message:

    Note that we can't make the enum values or union branches conditional
    because of target-specific poisoning of accelerator definitions.
    If we did, enum Accelerator could only be used in target-specific
    code.  But we want to also use it in generic code, such as ...

with ... replaced by one or more references to relevant code.

If we expect readers of the code to later wonder why we're not using
QAPI conditionals, then we should add a comment to the QAPI schema,
too.  Not a demand, since I'm not sure what to expect.


