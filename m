Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A3F293456
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 07:41:09 +0200 (CEST)
Received: from localhost ([::1]:54688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUkOT-0002kt-1v
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 01:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kUkMs-0001qJ-VS
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 01:39:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kUkMn-0006z6-E0
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 01:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603172362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/Qt8pYkY5W39Onbr1+LbIOcNIFQu0+K1vSJgDQBQkk=;
 b=Fovt70JDEcK1FeumJMLcn5eV/Iv/RlVnKPqjqjYybHVTOU/uYmdPGirvi1KANKTVb8BvIF
 hdBE0rktUzoUao/UV0iiqsKDDmNa8qqwXqtdyyXtMn99pB4GHu/6gAGgVS2hWnL+2Avgbt
 54E3jSiVDfFdlj6GVENAlgE8ENFzVks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-mK-rxqIUNs6NpjoDBNNjTg-1; Tue, 20 Oct 2020 01:39:19 -0400
X-MC-Unique: mK-rxqIUNs6NpjoDBNNjTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1F4E8049C8
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 05:39:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EB7521E93;
 Tue, 20 Oct 2020 05:39:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 175871132A08; Tue, 20 Oct 2020 07:39:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 0/5] qapi: Restrict machine (and migration) specific
 commands
References: <20201012121536.3381997-1-philmd@redhat.com>
 <20201015182824.GG5733@habkost.net>
 <87ft6a1wgn.fsf@dusky.pond.sub.org>
 <20201019123014.GI5733@habkost.net>
 <87mu0i2mc7.fsf@dusky.pond.sub.org>
 <f57b2080-50ac-ee44-be8d-2dd4d6431d57@redhat.com>
Date: Tue, 20 Oct 2020 07:39:17 +0200
In-Reply-To: <f57b2080-50ac-ee44-be8d-2dd4d6431d57@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 19 Oct 2020 20:04:30
 +0200")
Message-ID: <8736291mnu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 10/19/20 6:48 PM, Markus Armbruster wrote:
>> Eduardo Habkost <ehabkost@redhat.com> writes:
>>=20
>>> On Mon, Oct 19, 2020 at 09:55:20AM +0200, Markus Armbruster wrote:
>>>> Eduardo Habkost <ehabkost@redhat.com> writes:
>>>>
>>>>> On Mon, Oct 12, 2020 at 02:15:31PM +0200, Philippe Mathieu-Daud=C3=A9=
 wrote:
>>>>>> Reduce the machine code pulled into qemu-storage-daemon.
>>>>>>
>>>>>> The series is fully Acked, but Markus wants it reviewed
>>>>>> by the Machine core maintainers.
>>>>>
>>>>> I've confirmed that all patches move QAPI schema code without
>>>>> introducing any additional changes.
>>>>>
>>>>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>>>>
>>>> I take this as "I agree the things moved to machine.json belong there"=
.
>>>> Holler if I'm mistaken.
>>>
>>> I agree machine.json is better than misc.json for them, yes.
>>>
>>> I miss short descriptions of the purpose of each file, though.
>>> It would help us decide what's appropriate in the future.
>>
>> The QAPI modules are commonly aligned with sub-systems defined in
>> MAINTAINERS.
>>
>> Regardless, file comments would be nice.
>
> I don't understand what you mean/expect by "file comments".
> Example?

A comment explaining the file, at the beginning of the file.

> W.r.t. MAINTAINERS, I can move Xen code to qapi/migration-xen.json;

How much could be moved, and from where?

Sub-modules don't need to mirror MAINTAINERS slavishly.  We want
reasonably-sized modules, and we want useful get_maintainer.pl output.

> 'query-kvm' is used when no KVM built it, so I'll let it in
> machine.json; the others seem to belong in machine.json too,
> with no particular justification.


