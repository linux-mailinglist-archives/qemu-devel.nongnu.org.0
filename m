Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0C8324D14
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 10:42:46 +0100 (CET)
Received: from localhost ([::1]:58860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDAT-00032J-3n
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 04:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFD9N-0002bS-4O
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:41:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFD9K-0004lf-Iv
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:41:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614246092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IxJUF9INVk3co7SQUHBbpAFJ1FKDqAzBz3OxKN8rpso=;
 b=guOK4IMsW7IZBadCAW1IPHTVqUfF6LMuIRzJ+L100MEssF+x8928Jr3ubGJJBVDK/AMAaw
 SAucnehnb8LSsCEy31IJS96d3UIjuLPuKem7nrkjjNe5C3nv9weKkDCT83XXS8s5kota8Y
 Xe2uxEHs2GFwiGmjRU2ebo89hgbzr8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-TK38GyWtMyitB4KItH-r_w-1; Thu, 25 Feb 2021 04:41:30 -0500
X-MC-Unique: TK38GyWtMyitB4KItH-r_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42C6A107ACC7;
 Thu, 25 Feb 2021 09:41:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01FB95D9D7;
 Thu, 25 Feb 2021 09:41:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8B762113860F; Thu, 25 Feb 2021 10:41:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qapi: Remove QMP events and commands from user-mode builds
References: <20210224171642.3242293-1-philmd@redhat.com>
 <12557ba5-e8c1-80ca-8a51-1d7319372d35@redhat.com>
Date: Thu, 25 Feb 2021 10:41:26 +0100
In-Reply-To: <12557ba5-e8c1-80ca-8a51-1d7319372d35@redhat.com> (Paolo
 Bonzini's message of "Wed, 24 Feb 2021 18:35:38 +0100")
Message-ID: <87czwov60p.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 24/02/21 18:16, Philippe Mathieu-Daud=C3=A9 wrote:
>> We removed the QMP loop in user-mode builds in commit 1935e0e4e09
>> ("qapi/meson: Remove QMP from user-mode emulation"), now commands
>> and events code is unreachable.
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   qapi/meson.build | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>> diff --git a/qapi/meson.build b/qapi/meson.build
>> index 0652569bc43..fcb15a78f15 100644
>> --- a/qapi/meson.build
>> +++ b/qapi/meson.build
>> @@ -102,11 +102,15 @@
>>       'qapi-types-@0@.h'.format(module),
>>       'qapi-visit-@0@.c'.format(module),
>>       'qapi-visit-@0@.h'.format(module),
>> -    'qapi-events-@0@.c'.format(module),
>> -    'qapi-events-@0@.h'.format(module),
>> -    'qapi-commands-@0@.c'.format(module),
>> -    'qapi-commands-@0@.h'.format(module),
>>     ]
>> +  if have_system or have_tools
>> +    qapi_module_outputs +=3D [
>> +      'qapi-events-@0@.c'.format(module),
>> +      'qapi-events-@0@.h'.format(module),
>> +      'qapi-commands-@0@.c'.format(module),
>> +      'qapi-commands-@0@.h'.format(module),
>> +    ]
>> +  endif
>>     if module.endswith('-target')
>>       qapi_specific_outputs +=3D qapi_module_outputs
>>     else
>>=20
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

I'm taking this as "Markus, care to take this through your tree?"

Queued, thanks!


