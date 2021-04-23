Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C937F36906E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 12:34:16 +0200 (CEST)
Received: from localhost ([::1]:38924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZt8Z-0006er-SX
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 06:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lZt5t-0004or-Ct
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:31:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lZt5q-0003nm-I5
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619173884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4CzG5FikExKyJ3KZeuGJMNLB8X6KOSfGNoI+Q2FaI6Y=;
 b=SnkGcSRt4m4Mim2ZppCtcxSrV6MM2bSuUMApl0IMKl1ARUjNiAUK4lC4hJvRb14PocFpyN
 aIIyhImyEJNsBHAOiGWsW4yCKejAboJOoEw22Szac8IaO+yC8HWZIAiu/jntdu7uRQDvFb
 sZQApqn1cdQ91jDT8OR3GqYZF8Yf7RE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-XPh2Utw9N6u4K6BCxF9urw-1; Fri, 23 Apr 2021 06:31:22 -0400
X-MC-Unique: XPh2Utw9N6u4K6BCxF9urw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C912F107ACCA;
 Fri, 23 Apr 2021 10:31:20 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-167.ams2.redhat.com
 [10.36.113.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A29B1865D;
 Fri, 23 Apr 2021 10:31:14 +0000 (UTC)
Date: Fri, 23 Apr 2021 12:31:11 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH v5 0/4] accel/tcg: Make sure that tb->size != 0 after
 translation
Message-ID: <20210423123111.0575608e.cohuck@redhat.com>
In-Reply-To: <20210416154939.32404-1-iii@linux.ibm.com>
References: <20210416154939.32404-1-iii@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Apr 2021 17:49:35 +0200
Ilya Leoshkevich <iii@linux.ibm.com> wrote:

> If arch-specific code generates a translation block of size 0,
> tb_gen_code() may generate a spurious exception.
> 
> Fix s390x (patch 1), ARM (patch 2) and xtensa (patch 3) and add an
> assertion in order to catch such situations earlier (patch 4).
> 
> v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02037.html
> v1 -> v2: Fix target/s390x instead of trying to tolerate tb->size == 0
>           in tb_gen_code().
> 
> v2: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02101.html
> v2 -> v3: Split the common code change into a separate patch, add the
>           ARM patch in order to fix
>           https://gitlab.com/cohuck/qemu/-/jobs/1178409450
> 
> v3: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02332.html
> v3 -> v4: Add the xtensa patch in order to fix
>           https://gitlab.com/cohuck/qemu/-/jobs/1178409540
> 
> v4: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02592.html
> v4 -> v5: Handle thumb: the following C code triggers the assertion:
>           typedef void (*funcptr)(void);
>           int main() { funcptr f = (funcptr)0xffff0001; f(); }
> 
> Ilya Leoshkevich (4):
>   target/s390x: Fix translation exception on illegal instruction
>   target/arm: Make sure that commpage's tb->size != 0
>   target/xtensa: Make sure that tb->size != 0
>   accel/tcg: Assert that tb->size != 0 after translation
> 
>  accel/tcg/translate-all.c |  1 +
>  target/arm/translate.c    |  2 ++
>  target/s390x/translate.c  | 16 +++++++++++-----
>  target/xtensa/translate.c |  3 +++
>  4 files changed, 17 insertions(+), 5 deletions(-)
> 

So, what's the way forward here? I can pick this if I get an ack for
the arm patch. If someone else wants to take this, I'll just ack the
s390x patch.


