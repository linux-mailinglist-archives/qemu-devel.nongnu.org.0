Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B5D495E56
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 12:23:09 +0100 (CET)
Received: from localhost ([::1]:60254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAs0a-0006B1-Pm
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 06:23:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nArVL-0002s4-JQ
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 05:50:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nArVG-0001Cs-RC
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 05:50:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642762218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UXMVjuKtY2JPmZ5StNrD7R63S6goleChyvP/lIK3mdM=;
 b=Fc2SYkCdyzjegQ6cPG/8oYhH4ezx58P6MBNs9nKGruXMRvWV865UJI5dMKBxqfJOZLZqsH
 EJ7yEyqHzfeiMkYcSMkdFLppwHCvRSzbvSTGoWJiRYJx3iQTEm46yq25NFQ3RpjoY6KJnu
 Wuz4LVW14UwYCQ+zUIxQRAO1yeAjmJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-_I232YoSPY2LRhDHwZaBzw-1; Fri, 21 Jan 2022 05:50:17 -0500
X-MC-Unique: _I232YoSPY2LRhDHwZaBzw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDFD4100C660;
 Fri, 21 Jan 2022 10:50:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79B90752A9;
 Fri, 21 Jan 2022 10:50:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E9DAE1136421; Fri, 21 Jan 2022 11:50:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: "make check-acceptance" takes way too long
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
 <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
Date: Fri, 21 Jan 2022 11:50:09 +0100
In-Reply-To: <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com> (Thomas Huth's
 message of "Fri, 21 Jan 2022 08:56:41 +0100")
Message-ID: <87zgnp4b32.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 20/01/2022 16.13, Peter Maydell wrote:
>> On Fri, 30 Jul 2021 at 16:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> "make check-acceptance" takes way way too long. I just did a run
>>> on an arm-and-aarch64-targets-only debug build and it took over
>>> half an hour, and this despite it skipping or cancelling 26 out
>>> of 58 tests!
>>>
>>> I think that ~10 minutes runtime is reasonable. 30 is not;
>>> ideally no individual test would take more than a minute or so.
>>>
>>> Output saying where the time went. The first two tests take
>>> more than 10 minutes *each*. I think a good start would be to find
>>> a way of testing what they're testing that is less heavyweight.
>>
>> Does anybody have some time to look at this? It makes
>> 'check-acceptance' almost unusable for testing fixes locally...
>
> We could start using the "SPEED" environment variable there, too, just
> like we already do it in the qtests, so that slow tests only get
> executed with SPEED=slow or SPEED=thorough ...?

No objection, but it's no replacement for looking into why these tests
are so slow.

The #1 reason for things being slow is not giving a damn :)


