Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC6730436D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 17:10:55 +0100 (CET)
Received: from localhost ([::1]:37668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Qve-0000bq-2R
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 11:10:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4Qug-0008WA-NZ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:09:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4Que-0002ZQ-6I
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611677390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tOYwokLrA5fWJaV439Jh/tano8/fqOc9s3QTYt8FP2A=;
 b=RPiLSJHYhYmiqajsp9d8NXkkuSrHFvi+Yg9t77y7AGGhmAkN7Cva//ZpzOifouTwgREv3m
 JAYMX9dtfheNjjA6xefCPegOABu44GaurOutOE8UDIOREz9focwLMMw+8YcisYfF7lfWce
 9DhQIuy27OFGY+q3Xh6Vkr7KNbtoFrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-619kA7T9MkuW6Mp3tUOUYA-1; Tue, 26 Jan 2021 11:09:46 -0500
X-MC-Unique: 619kA7T9MkuW6Mp3tUOUYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A518A10054FF;
 Tue, 26 Jan 2021 16:09:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 475D110016FA;
 Tue, 26 Jan 2021 16:09:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C9E6C113865F; Tue, 26 Jan 2021 17:09:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 00/12] buildsys: Do not build various objects if not
 necessary
References: <20210122204441.2145197-1-philmd@redhat.com>
 <87eei7ycbu.fsf@linaro.org>
 <33307716-5ef8-ba62-428b-c136ec0f19db@redhat.com>
Date: Tue, 26 Jan 2021 17:09:40 +0100
In-Reply-To: <33307716-5ef8-ba62-428b-c136ec0f19db@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 26 Jan 2021 16:28:31
 +0100")
Message-ID: <87sg6n1xyz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

> On 1/26/21 3:57 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> In this series we deselect a bunch of features when they
>>> not required, so less objects are built.
>>>
>>> While this reduce pressure on CI and slow systems, this is
>>> particularly helpful for developers regularly testing multiple
>>> build configurations.
>>>
>>> All CI tests pass:
>>> https://gitlab.com/philmd/qemu/-/pipelines/245654160
>>>
>>> Supersedes: <20210120151916.1167448-1-philmd@redhat.com>
>>=20
>> Series looks good to me but I guess you need some sub-system feedback.
>
> Yeah, I will wait for Markus feedback on qapi/ before respining (with
> target/ fix), ...

Maybe I'm naive today, but to me this looks like a case of "if it still
builds, it's fine".

Anything in particular you want my feedback for?

>> I've sent a few more patches that might be worth rolling in to better
>> handle check-tcg/softfloat.
>
> ... including your patches if they aren't merged before.
>
> Thanks for having a look,
>
> Phil.


