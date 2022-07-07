Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B6456A561
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 16:28:47 +0200 (CEST)
Received: from localhost ([::1]:46346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9SUo-0000NT-Hq
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 10:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9STs-00086u-NL
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 10:27:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9STq-0002k6-Al
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 10:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657204065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ULvJ++hc+xMLY0Eqcaao1GkbphNpgzhANj9Wd4g5CI=;
 b=O6j0yizj2fWmJ4v4j/sZnDcI0Hk56EBq2Mbr3vPYIwahkpwA7hBobMzMef9Y01MkNua0Jm
 fU2ebJL0C36SpgrE4e7R+C7oJBywVG5QMeKTk/hpn59cferz/Eora+4RzNwR6lJ91DQipD
 BxdGaSaMqv2VyTshJaP0wZJLklbBRXg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-Odgp6POTPtG0aFhQdB4GEQ-1; Thu, 07 Jul 2022 10:27:37 -0400
X-MC-Unique: Odgp6POTPtG0aFhQdB4GEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56B5A381079B;
 Thu,  7 Jul 2022 14:27:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DFF2414A7E7;
 Thu,  7 Jul 2022 14:27:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EF6ED21E690D; Thu,  7 Jul 2022 16:27:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  kwolf@redhat.com,  hreitz@redhat.com
Subject: Re: [RFC PATCH] qobject: Rewrite implementation of QDict for
 in-order traversal
References: <20220705095421.2455041-1-armbru@redhat.com>
 <CAFEAcA-xaQSOGWixtnq0XosSsdt2VKACxgCK5KpdkNscBPD-wA@mail.gmail.com>
Date: Thu, 07 Jul 2022 16:27:35 +0200
In-Reply-To: <CAFEAcA-xaQSOGWixtnq0XosSsdt2VKACxgCK5KpdkNscBPD-wA@mail.gmail.com>
 (Peter Maydell's message of "Thu, 7 Jul 2022 13:57:22 +0100")
Message-ID: <87zghlatgo.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

> On Tue, 5 Jul 2022 at 10:54, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> QDict is implemented as a simple hash table of fixed size.  Observe:
>>
>> * Slow for large n.  Not sure this matters.
>>
>> * A QDict with n entries takes 4120 + n * 32 bytes on my box.  Wastes
>>   space for small n, which is a common case.
>>
>> * Order of traversal depends on the hash function and on insertion
>>   order, because it iterates first over buckets, then collision
>>   chains.
>>
>> * Special code ensures qdict_size() takes constant time.
>>
>> Replace the hash table by a linked list.  Observe:
>>
>> * Even slower for large n.  Might be bad enough to matter.
>>
>> * A QDict with n entries takes 32 + n * 24 bytes.
>>
>> * Traversal is in insertion order.
>>
>> * qdict_size() is linear in the number of entries.
>>
>> This is an experiment.  Do not commit to master as is.
>>
>> The change of traversal order affects expected test output.  I updated
>> only the tests covered by "make check" so far.  I expect some more to
>> hide under tests/qemu-iotests/.
>
> Seems to fix the 'rocker' device regression, at least in that
> it no longer gives an error message on startup.
>
> The amount of patching you had to do to expected-output files
> in 'tests' suggests we have quite a lot of test cases that
> are currently implicitly reliant on the hash table traversal
> order, which is not guaranteed to remain stable.

Correct.

I expect to find a few more in tests not run by "make check".

>                                                  Regardless of
> what we do with this patch it would probably be a good idea
> for whatever is outputting the text these tests are comparing
> against to be made to use a stable output order (alphabetical??).

Traversal order before the patch depends on the (fixed) size of the hash
table and the has function for (string) keys.  Both have remained
unchanged since the initial commit (2009), which is why we've gotten
away with relying on it in tests.

Traversal order after the patch depends on insertion order.  I think
this is already an improvement for the tests: now the expected output
depends on what the test does, not on how qdict.c does its job.

If we think this still isn't good enough, we can investigate how to get
test output where the keys are in alphabetical order.


