Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D233BBA35
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:32:51 +0200 (CEST)
Received: from localhost ([::1]:42890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0KyA-0003Ze-VG
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m0KtJ-0006ek-21
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:27:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m0KtB-0007gf-Nb
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625477248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SqP7xEhsb7L24aNd0+eWdkHP85KEjTiFjtls5B1CstU=;
 b=S5wyk8FsG5GwLp+4G3O8lSqnPTKbgcGTgXsIAOQapsK/WZxKPB6A6x9N27brvRr5D/0pqH
 XlnKj+HKzL9djNx8dVThUAq7oITOWDlotS/AtYuvsK3+Ad5EBYWq9iBnYrSz1Wo5rBRQDq
 mdyK8AsCSZOVP59hNIS6Bt4qjmSwOZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-ZSPM0Z1hNlGvGsdDF6rm_Q-1; Mon, 05 Jul 2021 05:27:25 -0400
X-MC-Unique: ZSPM0Z1hNlGvGsdDF6rm_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65200804140;
 Mon,  5 Jul 2021 09:27:23 +0000 (UTC)
Received: from localhost (ovpn-112-39.ams2.redhat.com [10.36.112.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B6125C1A1;
 Mon,  5 Jul 2021 09:27:19 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 0/2] target/s390x: Fix SIGILL/SIGFPE/SIGTRAP psw.addr
 reporting
In-Reply-To: <3624d483-dd11-6464-bbfd-ed2921b2fcfe@vivier.eu>
Organization: Red Hat GmbH
References: <20210623023250.3667563-1-iii@linux.ibm.com>
 <87a6n5j976.fsf@redhat.com>
 <3624d483-dd11-6464-bbfd-ed2921b2fcfe@vivier.eu>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 05 Jul 2021 11:27:17 +0200
Message-ID: <87wnq5i00a.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 02 2021, Laurent Vivier <laurent@vivier.eu> wrote:

> Le 02/07/2021 =C3=A0 12:34, Cornelia Huck a =C3=A9crit=C2=A0:
>> On Wed, Jun 23 2021, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
>>=20
>>> qemu-s390x puts a wrong value into SIGILL's siginfo_t's psw.addr: it
>>> should be a pointer to the instruction following the illegal
>>> instruction, but at the moment it is a pointer to the illegal
>>> instruction itself. This breaks OpenJDK, which relies on this value.
>>> A similar problem exists for SIGFPE and SIGTRAP.
>>>
>>> Patch 1 fixes the issue, patch 2 adds a test.
>>>
>>> v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06592.h=
tml
>>> v1 -> v2: Use a better buglink (Cornelia), simplify the inline asm
>>>           magic in the test and add an explanation (David).
>>>
>>> v2: https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06649.h=
tml
>>> v2 -> v3: Fix SIGSEGV handling (found when trying to run valgrind under
>>>           qemu-user).
>>>
>>> v3: https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg00299.h=
tml
>>> v3 -> v4: Fix compiling the test on Ubuntu 20.04 (Jonathan).
>>>
>>> v4: https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg05848.h=
tml
>>> v4 -> v5: Greatly simplify the fix (Ulrich).
>>>
>>> Note: the compare-and-trap SIGFPE issue is being fixed separately.
>>> https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg05690.html
>>>
>>> Ilya Leoshkevich (2):
>>>   target/s390x: Fix SIGILL/SIGFPE/SIGTRAP psw.addr reporting
>>>   tests/tcg/s390x: Test SIGILL and SIGSEGV handling
>>>
>>>  linux-user/s390x/cpu_loop.c     |   5 +
>>>  tests/tcg/s390x/Makefile.target |   1 +
>>>  tests/tcg/s390x/signal.c        | 165 ++++++++++++++++++++++++++++++++
>>>  3 files changed, 171 insertions(+)
>>>  create mode 100644 tests/tcg/s390x/signal.c
>>=20
>> What's the status of this and
>> <20210621141452.2045-1-jonathan.albrecht@linux.vnet.ibm.com>? linux-user
>> is not really my turf, but it would be sad if this fell through the
>> cracks.
>>=20
>
> If from the S390x point of view they are correct, I can collect them via =
linux-user.

Thanks!

Acked-by: Cornelia Huck <cohuck@redhat.com>


