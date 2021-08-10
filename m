Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA4B3E59E6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 14:26:07 +0200 (CEST)
Received: from localhost ([::1]:54634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDQpa-00084t-Lp
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 08:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mDQoX-0007G3-K8
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:25:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mDQoW-0003mK-8V
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628598299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iOovBNO4hDWef+/IxTkNUBmaqz1Mzy7tZ5xCX+m+BxU=;
 b=cq6OXdTjJ3xgsRkYxBLLZ7sHvPbBFpap8kAaaI8+rEHULvPNu/0HEE2wPp3f3EUuiACIb3
 UiLPuEvaDh9pfD/toI/DiqP6g+2t1CzJP2+YrD5CvRMCiaIMBVrCKr9swICcUbHEW6q2z/
 dEocso2t64QooME40sCe1F15y8ba4iY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-EJZZWxUwO_ecs8it1bU7Fg-1; Tue, 10 Aug 2021 08:24:57 -0400
X-MC-Unique: EJZZWxUwO_ecs8it1bU7Fg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C686287D541;
 Tue, 10 Aug 2021 12:24:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A679460C82;
 Tue, 10 Aug 2021 12:24:48 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v8] tests/tcg/s390x: Test SIGILL and SIGSEGV handling
In-Reply-To: <20210804225146.154513-1-iii@linux.ibm.com>
Organization: Red Hat GmbH
References: <20210804225146.154513-1-iii@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 10 Aug 2021 14:24:46 +0200
Message-ID: <87h7fxwkq9.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Aug 05 2021, Ilya Leoshkevich <iii@linux.ibm.com> wrote:

> Verify that s390x-specific uc_mcontext.psw.addr is reported correctly
> and that signal handling interacts properly with debugging.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>
> v7: https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00463.html
> v7 -> v8: Another rebase needed due to the conflict with Jonathan's
>           50e36dd61652.
>
>  tests/tcg/s390x/Makefile.target               |  17 +-
>  tests/tcg/s390x/gdbstub/test-signals-s390x.py |  76 ++++++++
>  tests/tcg/s390x/signals-s390x.c               | 165 ++++++++++++++++++
>  3 files changed, 257 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/s390x/gdbstub/test-signals-s390x.py
>  create mode 100644 tests/tcg/s390x/signals-s390x.c

Thanks, applied.


