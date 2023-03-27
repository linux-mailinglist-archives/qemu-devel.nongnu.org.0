Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 102B56CA1A8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 12:50:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgkQ9-0005B5-Mg; Mon, 27 Mar 2023 06:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pgkQ7-00057B-AP
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 06:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pgkQ5-0000ml-Px
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 06:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679914184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=27Yw6oEr+NDtSyElUTZQPTGDnsgL9qm7gtoMdZh94F0=;
 b=CWcW8zpyhmUM+VsEfK+6Zo25+afUYKG+gBHspaaQsPbLsgrhmvjnIQ9tfQADnSVyOFYNe2
 tFx0aKMxOUiVsgmQWRWpcYyu3ylLUIPVhI3X1SjZfmag/fsIqbMPKKFtMeJhgP3Kn17p1e
 UHUMFr6t1umvz5i5ZuB6Aiyz170dac4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-urx2r0fHM6W2m5z3bNtedQ-1; Mon, 27 Mar 2023 06:49:41 -0400
X-MC-Unique: urx2r0fHM6W2m5z3bNtedQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 689E288F46A;
 Mon, 27 Mar 2023 10:49:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 490AC202701E;
 Mon, 27 Mar 2023 10:49:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2F97121E6926; Mon, 27 Mar 2023 12:49:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: quintela@redhat.com,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] Change the default for Mixed declarations.
References: <20230214160738.88614-1-quintela@redhat.com>
 <ZByhueDO9J9MLuSJ@redhat.com> <87pm8ykq09.fsf@secure.mitica>
 <87zg822fnm.fsf@linaro.org>
Date: Mon, 27 Mar 2023 12:49:40 +0200
In-Reply-To: <87zg822fnm.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Fri, 24 Mar 2023 17:56:46 +0000")
Message-ID: <87edpacvuj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Juan Quintela <quintela@redhat.com> writes:
>
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>>> On Tue, Feb 14, 2023 at 05:07:38PM +0100, Juan Quintela wrote:
>>>> Hi
>>>>=20
>>>> I want to enter a discussion about changing the default of the style
>>>> guide.
>>>>=20
>>>> There are several reasons for that:
>>>> - they exist since C99 (i.e. all supported compilers support them)
>>>> - they eliminate the posibility of an unitialized variable.
>>>
>>> Actually they don't do that reliably. In fact, when combined
>>> with usage of 'goto', they introduce uninitialized variables,
>>> despite the declaration having an initialization present, and
>>> thus actively mislead reviewers into thinking their code is
>>> safe.
>>
>> Wait a minute.
>> If you use goto, you are already in special rules.
>>
>> And don't get confused, I fully agree when using goto for two reasons:
>> - performance
>>   if you show that the code is x% faster when using goto, it is
>>   justified.  It is even better if you send a bug report to gcc/clang,
>>   but I will not opose that use.
>
> I await a clear example in the context of QEMU - there is almost always
> a better way to structure things.
>
>> - code clearity
>>   Some code (basically error paths) are clearer with goto that without
>>   them.
>
> Now we have g_auto* and lock guards we should encourage their use. goto
> error_path is a relic of a simpler time ;-)

Only 8004 places to "modernize" (not counting generated code and
documentation) before presence of goto ceases to be a concern.

[...]


