Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981BD14DA81
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 13:19:05 +0100 (CET)
Received: from localhost ([::1]:59782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ix8mm-0007aQ-NT
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 07:19:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49365)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ix8lr-00078J-Dw
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 07:18:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ix8lm-0001HG-Ec
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 07:18:07 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32213
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ix8lm-0001Fo-B0
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 07:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580386680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BC95U+roXqLaCEO0eR1FA65xMr/NFa0hjbHnejYlJUY=;
 b=OXYZK7M/w4HN3Ch4oWuDO9GCnYGhhV6li7Uxocazxbhtc/3B7USqQ8vUtAjldtfFmD3sJ0
 xJ26P6XAbElJPmnDbikGHyA6TZSgpKIa4lI0c2NvCz++wj0bKYcQeP2k2BTbCG3ktQHbqg
 YQG9koyoLqxHNcp+HJ/7HPdVgDKBkl4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-ExgNuJWqPRClMS6gmbk-eg-1; Thu, 30 Jan 2020 07:17:56 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2013B107ACCC
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2020 12:17:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D921BF6C1;
 Thu, 30 Jan 2020 12:17:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 516991138404; Thu, 30 Jan 2020 13:17:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v5 1/8] multifd: Add multifd-method parameter
References: <20200129115655.10414-1-quintela@redhat.com>
 <20200129115655.10414-2-quintela@redhat.com>
 <87lfppxtum.fsf@dusky.pond.sub.org> <87wo99xq93.fsf@secure.laptop>
Date: Thu, 30 Jan 2020 13:17:53 +0100
In-Reply-To: <87wo99xq93.fsf@secure.laptop> (Juan Quintela's message of "Thu, 
 30 Jan 2020 10:11:52 +0100")
Message-ID: <87ftfxt9xq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: ExgNuJWqPRClMS6gmbk-eg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Juan Quintela <quintela@redhat.com> writes:

> Markus Armbruster <armbru@redhat.com> wrote:
>> Juan Quintela <quintela@redhat.com> writes:
>>
>>> This will store the compression method to use.  We start with none.
>>>
>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>
>> I don't remember giving my R-by.  I gave my Acked-by for
>> [PATCH v2 06/10] migration: Add multifd-compress parameter
>> Message-ID: <87d0cku5hq.fsf@dusky.pond.sub.org>
>> https://lists.nongnu.org/archive/html/qemu-devel/2019-12/msg04153.html
>
>> If I did give my R-by for a later revision, let me know.
>
> Hi
>
> Ouch, I *thought* that you got confused.  It happens to me all the time.
> Apologies.
> So, how I should I put that Acked-by: in the commit?

Replace

    Reviewed-by: Markus Armbruster <armbru@redhat.com>

by

    Acked-by: Markus Armbruster <armbru@redhat.com>

>> One small suggestion below.
>
> Thanks.
>
>>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> [...]
>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>> index b7348d0c8b..96a126751c 100644
>>> --- a/qapi/migration.json
>>> +++ b/qapi/migration.json
>>> @@ -488,6 +488,19 @@
>>>  ##
>>>  { 'command': 'query-migrate-capabilities', 'returns':
>>> ['MigrationCapabilityStatus']}
>>> =20
>>> +##
>>> +# @MultiFDMethod:
>>> +#
>>> +# An enumeration of multifd compression.
>>
>> Suggest "compression methods."
>
> will do.
>
> Sorry again for the missunderstanding.

No harm, no foul :)


