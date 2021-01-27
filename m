Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356153055FE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 09:44:13 +0100 (CET)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4gQt-00041G-IA
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 03:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4gPa-0003WC-Mu
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 03:42:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4gPX-0008R3-Mw
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 03:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611736965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/h+wQP+NhcGmYICARqGpLiVSGU33Ss1a7ENQkoqmvyU=;
 b=C8kM478S6CdN5oG+tbXTb442xjKk4ELX7nl5Llg0v654EfFK+IhqRKRL0vHpnpsrkg6o/3
 DNuN8IqWchpTBzq/2sAVmng71/f3eYkU1mhHbKjyaxAwbmva21DJ81VeKB1doPc9GOMRY9
 7sUGKY7vIg/B1/HygFArhUMZ5XuuKCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-kjtxzEIvPBaFfvJcfpUl1Q-1; Wed, 27 Jan 2021 03:42:43 -0500
X-MC-Unique: kjtxzEIvPBaFfvJcfpUl1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4ADB1800D42;
 Wed, 27 Jan 2021 08:42:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B14E60C05;
 Wed, 27 Jan 2021 08:42:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DEFEB113865F; Wed, 27 Jan 2021 09:42:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 00/12] buildsys: Do not build various objects if not
 necessary
References: <20210122204441.2145197-1-philmd@redhat.com>
 <87eei7ycbu.fsf@linaro.org>
 <33307716-5ef8-ba62-428b-c136ec0f19db@redhat.com>
 <87sg6n1xyz.fsf@dusky.pond.sub.org>
 <1da8f947-adda-312c-b0d4-a81f362b0447@redhat.com>
Date: Wed, 27 Jan 2021 09:42:40 +0100
In-Reply-To: <1da8f947-adda-312c-b0d4-a81f362b0447@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 26 Jan 2021 20:38:14
 +0100")
Message-ID: <87h7n2wz27.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 1/26/21 5:09 PM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> On 1/26/21 3:57 PM, Alex Benn=C3=A9e wrote:
>>>>
>>>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>>>
>>>>> In this series we deselect a bunch of features when they
>>>>> not required, so less objects are built.
>>>>>
>>>>> While this reduce pressure on CI and slow systems, this is
>>>>> particularly helpful for developers regularly testing multiple
>>>>> build configurations.
>>>>>
>>>>> All CI tests pass:
>>>>> https://gitlab.com/philmd/qemu/-/pipelines/245654160
>>>>>
>>>>> Supersedes: <20210120151916.1167448-1-philmd@redhat.com>
>>>>
>>>> Series looks good to me but I guess you need some sub-system feedback.
>>>
>>> Yeah, I will wait for Markus feedback on qapi/ before respining (with
>>> target/ fix), ...
>>=20
>> Maybe I'm naive today, but to me this looks like a case of "if it still
>> builds, it's fine".
>>=20
>> Anything in particular you want my feedback for?
>
> You are listed as qapi/ maintainer with Michael :)
>
> QAPI
> M: Markus Armbruster <armbru@redhat.com>
> M: Michael Roth <michael.roth@amd.com>
> S: Supported
> F: qapi/
>
> If it is fine to you, then I'll respin addressing Paolo's comments.
>
> Thanks :)
>
> Phil.

Go right ahead!


