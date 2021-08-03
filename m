Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876293DE826
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:17:52 +0200 (CEST)
Received: from localhost ([::1]:33194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mApcV-0002og-Kv
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mApYH-0003vY-Br
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:13:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mApYD-0001sZ-Iz
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627978404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WKD+wGXP3FzWjatiz3/ukz0pFScOecR7IFHHYD1iuP0=;
 b=TaTWUH6DPxBPQaJfazbvZMiNZG51kKJ7Lz2qv74z8MDNhbwofW1mp50jvpTwlb+6frf7SP
 c8h/ZurG0VgsZ1CruGChy0k9qSIE1WO2is6o6PEyG4mYj0OqwkTreVTCgKjq/BHMBlvxts
 5D0zyVfVzuBGJyQI3oa6Pnr85R2V+P4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-igNzonOuMbyJ4fHvICcqMg-1; Tue, 03 Aug 2021 04:13:19 -0400
X-MC-Unique: igNzonOuMbyJ4fHvICcqMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EA7E1853024;
 Tue,  3 Aug 2021 08:13:17 +0000 (UTC)
Received: from localhost (unknown [10.39.192.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 510B85D6A8;
 Tue,  3 Aug 2021 08:13:13 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v6 0/2] target/s390x: Fix SIGILL and SIGFPE psw.addr
 reporting
In-Reply-To: <20210705210434.45824-1-iii@linux.ibm.com>
Organization: Red Hat GmbH
References: <20210705210434.45824-1-iii@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 03 Aug 2021 10:13:11 +0200
Message-ID: <87pmuvymi0.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 05 2021, Ilya Leoshkevich <iii@linux.ibm.com> wrote:

> qemu-s390x puts a wrong value into SIGILL's siginfo_t's psw.addr: it
> should be a pointer to the instruction following the illegal
> instruction, but at the moment it is a pointer to the illegal
> instruction itself. This breaks OpenJDK, which relies on this value.
> A similar problem exists for SIGFPE.
>
> Patch 1 fixes the issue, patch 2 adds a test.
>
> v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06592.html
> v1 -> v2: Use a better buglink (Cornelia), simplify the inline asm
>           magic in the test and add an explanation (David).
>
> v2: https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06649.html
> v2 -> v3: Fix SIGSEGV handling (found when trying to run valgrind under
>           qemu-user).
>
> v3: https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg00299.html
> v3 -> v4: Fix compiling the test on Ubuntu 20.04 (Jonathan).
>
> v4: https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg05848.html
> v4 -> v5: Greatly simplify the fix (Ulrich).
>
> v5: https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg06244.html
> v5 -> v6: Fix breakpoints (David). Add gdbstub test.
>
> Note: the compare-and-trap SIGFPE issue is being fixed separately.
> https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg05690.html
>
> Ilya Leoshkevich (2):
>   target/s390x: Fix SIGILL and SIGFPE psw.addr reporting
>   tests/tcg/s390x: Test SIGILL and SIGSEGV handling
>
>  linux-user/s390x/cpu_loop.c                   |  12 +-
>  tests/tcg/s390x/Makefile.target               |  18 +-
>  tests/tcg/s390x/gdbstub/test-signals-s390x.py |  76 ++++++++
>  tests/tcg/s390x/signals-s390x.c               | 165 ++++++++++++++++++
>  4 files changed, 269 insertions(+), 2 deletions(-)
>  create mode 100644 tests/tcg/s390x/gdbstub/test-signals-s390x.py
>  create mode 100644 tests/tcg/s390x/signals-s390x.c

So, I'd like to see this merged, but I'm unsure on what we agreed -- I
thought this would go via linux-user. Do I misremember?


