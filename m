Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46FE56B721
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 12:21:19 +0200 (CEST)
Received: from localhost ([::1]:54838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9l6s-0007rI-QO
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 06:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9l4t-0006gE-IN
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:19:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9l4p-0005iI-QP
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657275550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rnGZU6s4XkRIjfuPgeMAORvTh5KrDAHqICYPcvVq4iM=;
 b=IOQw9Cq+PbOQa4oUXGWEfxknc3s1p3EELxdKUhtZZefeSFxFI+69B4vTujqI6nree13zLn
 q2bKPfMQJrAPykyuQnu3M+0TjeOTJRNd8vB6I/YqUoM1MYM7v+Qtx+idJKHQrWE/ViW67x
 wzSeJ2ZCSd5PGO5WtEId1aoYUhlAOm4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-xHRRHKQFNHaO2AmxX2EJDQ-1; Fri, 08 Jul 2022 06:19:03 -0400
X-MC-Unique: xHRRHKQFNHaO2AmxX2EJDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74A7A801590;
 Fri,  8 Jul 2022 10:19:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 520E64010D2A;
 Fri,  8 Jul 2022 10:19:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 117CF21E690D; Fri,  8 Jul 2022 12:19:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kwolf@redhat.com,  hreitz@redhat.com,  peter.maydell@linaro.org,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] qobject: Rewrite implementation of QDict for
 in-order traversal
References: <20220705095421.2455041-1-armbru@redhat.com>
 <87v8s8j4wj.fsf@linaro.org>
Date: Fri, 08 Jul 2022 12:19:02 +0200
In-Reply-To: <87v8s8j4wj.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Thu, 07 Jul 2022 16:52:13 +0100")
Message-ID: <87czefaovd.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Markus Armbruster <armbru@redhat.com> writes:
>
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
>
> Did you consider just using a straight array? What is the usual size of
> a QDict - how many entries do you expect to scale to?

I like the way you think :)

Let me hazard an educated guess.

QDict's intended purpose is "JSON AST for QMP".

Output and syntactically correct input satisfy the QAPI schema.  JSON
objects correspond to a complex type in the schema (struct or union).
The number of members in the schema limits the number of members in the
JSON object ("limits" because members can be optional).

BlockDeviceInfo has 32 members.  As far as I can tell, no type has more.

Exception 1: the 'any' type, currently used for QOM properties

Exception 2: the "'gen': false" schema backdoor, currenrly used for
             device_add arguments, so basically QOM properties again

I can't be bothered to go fishing for the QOM object with the most
properties.  Could exceed 32, but exceeding it by much would surprise
me.

For incorrect input, all bets are off.  We may hand-wave this away, but
only as long as input is trusted.

QDict is used for other purposes in places.  Can't say how many keys to
expect there.  Can say I wish it wasn't.

>> The change of traversal order affects expected test output.  I updated
>> only the tests covered by "make check" so far.  I expect some more to
>> hide under tests/qemu-iotests/.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>


