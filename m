Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DD341C3B6
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 13:47:02 +0200 (CEST)
Received: from localhost ([::1]:46436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVY3C-0002Vk-11
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 07:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVXxl-0000J2-MP
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 07:41:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVXxi-0003Tl-Tl
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 07:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632915681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJhusSdWlJOpzPbuzDUn+6W75gJpAvW2hwt7hroyKPU=;
 b=ECt/Co80sOou/HKUniBbOdmoYcjdNq5ryg8C150jHj4kMRdqC5ejqWn+sTwgFozLdUjWhF
 S8x+20Y8+YAic7d/see7RW9aBqB0kObjbZrOO/yh7X+kRJ3XgKVhJeVrSfl5TKNybEewkz
 P9MSv+lrbee73eaafN47TEvq3/ysHAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-UG9M4Z3ANE2rc6oSVMTQUg-1; Wed, 29 Sep 2021 07:41:18 -0400
X-MC-Unique: UG9M4Z3ANE2rc6oSVMTQUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D44719200C1
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 11:41:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 169F210016FB;
 Wed, 29 Sep 2021 11:41:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3AEF5113865F; Wed, 29 Sep 2021 13:41:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] qapi: Make some ObjectTypes depend on the build settings
References: <20210928160232.432980-1-thuth@redhat.com>
 <c85745b0-d913-5f64-4c08-c2d03542107e@redhat.com>
 <0ddcdd25-55d9-f782-2bc3-a11d7078b337@redhat.com>
Date: Wed, 29 Sep 2021 13:41:15 +0200
In-Reply-To: <0ddcdd25-55d9-f782-2bc3-a11d7078b337@redhat.com> (Thomas Huth's
 message of "Wed, 29 Sep 2021 08:17:57 +0200")
Message-ID: <875yujzk10.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 28/09/2021 19.39, Philippe Mathieu-Daud=C3=A9 wrote:
>> I quickly opened qapi/qom.json and spotted another one:
>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -870,3 +870,4 @@
>>         'tls-cipher-suites':          'TlsCredsProperties',
>> -      'x-remote-object':            'RemoteObjectProperties'
>> +      'x-remote-object':            { 'type': 'RemoteObjectProperties',
>> +                                      'if': 'CONFIG_MULTIPROCESS' },
>>     } }
>
> No, CONFIG_MULTIPROCESS is in config-poison.h (it's target specific),
> so that won't work here. We can only use the CONFIG switches from
> config-host.h here.

Target-specific conditions are available in qapi/*-target.json only.

The generated qapi-*-target.h are only usable from target-specific
code.

Moving stuff to qapi/*-target.json may necessitate compiling much more
code per target.  Care is advised.

>> While your change is correct, this isn't maintainable long term.
>> Not sure how we could improve that :/ But having to handle similar
>> information in 3 different places (configure, meson.build, qapi json)
>> is error prone. Thoughts?
>
> The current situation is just that bad since we didn't have these
> 'if:' statements in the past. For future code, I think we just have to
> be more careful during code review...

In my opinion, use of CONFIG_FOO in QAPI schemata is no worse than using
them in C type definitions.

In both cases, we have a choice: compile out stuff this build doesn't
need with compile-time conditionals, or leave it in unused.

In C, we sometimes have to compile out stuff, say when it depends on
headers we don't have.

In QAPI, we sometimes want to compile out stuff to make introspection
more useful.  This can be a killer argument.

> (and for configure vs. meson.build the answer is clear: Move more
> stuff from the configure script into meson.build, so that configure
> finally is only a stupid simple wrapper script)
>
>  Thomas


