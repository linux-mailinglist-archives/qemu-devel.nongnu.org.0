Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2663E2CEE
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:51:37 +0200 (CEST)
Received: from localhost ([::1]:50342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC1CC-0000wX-Ow
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mC1Al-0007vy-Rh
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:50:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mC1Aj-0002UM-1z
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628261403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XmVsUQJrgSeT6nLOFKNdLIx5FGblyWaByRmmoClSFAM=;
 b=c/nErWdGjL3AdhUPnklBWHbx/Nm/1ZYVxmFUCSQA5Kixl2E60JQ0BxKiasBbf1/LG7jikq
 UReeahatICp5WvF0oj2viZKFQ8ieG59Su1ldzDGZsmmTvRajdxp//tp7tEH2KS0jfb+YOn
 /zfx//5UjGnViVntzip72bLT4fQMlWg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-VZx-wVjgN0ChmSIVzcMMLA-1; Fri, 06 Aug 2021 10:50:02 -0400
X-MC-Unique: VZx-wVjgN0ChmSIVzcMMLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F13E81084F57;
 Fri,  6 Aug 2021 14:50:00 +0000 (UTC)
Received: from localhost (unknown [10.39.192.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FE905C1A3;
 Fri,  6 Aug 2021 14:49:56 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?= <philmd@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1] s390x/ioinst: Fix wrong MSCH alignment check on
 little endian
In-Reply-To: <258ec4a1-b171-46ec-ef01-d49df3d4b254@redhat.com>
Organization: Red Hat GmbH
References: <20210805143753.86520-1-david@redhat.com>
 <875ywizupc.fsf@redhat.com>
 <f699dbe2-1cbb-478a-3330-bd207da12055@redhat.com>
 <344ed7e5-f9a4-6754-32a5-72821e98f869@redhat.com>
 <258ec4a1-b171-46ec-ef01-d49df3d4b254@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 06 Aug 2021 16:49:55 +0200
Message-ID: <87o8aay6ek.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 06 2021, David Hildenbrand <david@redhat.com> wrote:

> On 06.08.21 16:17, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 8/6/21 1:30 PM, David Hildenbrand wrote:
>>> On 06.08.21 13:19, Cornelia Huck wrote:
>>>> On Thu, Aug 05 2021, David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>>> schib->pmcw.chars is 32bit, not 16bit. This fixes the kvm-unit-tests
>>>>> "css" test, which fails with:
>>>>>
>>>>>  =C2=A0=C2=A0 FAIL: Channel Subsystem: measurement block format1: Una=
ligned MB
>>>>> origin:
>>>>>  =C2=A0=C2=A0 Program interrupt: expected(21) =3D=3D received(0)
>>>>>
>>>>> Because we end up not injecting an operand program exception.
>>>>>
>>>>> Fixes: a54b8ac340c2 ("css: SCHIB measurement block origin must be
>>>>> aligned")
>>>>> Cc: Halil Pasic <pasic@linux.ibm.com>
>>>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>>>> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
>>>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>>>> Cc: Thomas Huth <thuth@redhat.com>
>>>>> Cc: Pierre Morel <pmorel@linux.ibm.com>
>>>>> Cc: qemu-s390x@nongnu.org
>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>> ---
>>>>>  =C2=A0 target/s390x/ioinst.c | 2 +-
>>>>>  =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> Same question here: still -rc worthy, or not?
>>>>
>>>
>>> It's been broken forever, this can also wait I guess.
>>=20
>> But the commit referenced is recent:
>>=20
>> commit a54b8ac340c20531daa89929c5ce7fed89fa401d
>> Date:   Fri Feb 19 14:39:33 2021 +0100
>>=20
>>      css: SCHIB measurement block origin must be aligned
>>=20
>
> Well, okay yes :) I don't think it's very urgent though.

I think I agree. Before the referenced commit, we did not do any
alignment checks at all, now we still let some unaligned blocks
pass. I don't think I've seen any issues before, the problem has only
been uncovered by the kvm unit test. So fix-worthy, but probably not
late-rc-worthy.


