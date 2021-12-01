Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F91465563
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 19:26:56 +0100 (CET)
Received: from localhost ([::1]:55560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msUJj-0005S5-Dz
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 13:26:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1msUHn-0004ch-G7
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 13:24:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1msUHk-0004gc-Io
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 13:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638383091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xrpSRReZmPvhal5ABC4T0w1DR/qY72VRWwX2USDuA5s=;
 b=SAQHrr4d+VxfVTrc0sbYgVazwkPFwXDamIJv5N6shvLFTARFkzEViK7xXTi4RRQyULUx9J
 uTXHnF+MOblPEWfV6tv/dFKCxU+JIWf7E/uaYS3VLqQMUCm6xipE3Wc/Wj7Pewd01EggUb
 TWJ15sS1JoiFa9/Wa6HW1ht0nKaXIzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-JwJ5ol4RN0uHXqpnakJPqQ-1; Wed, 01 Dec 2021 13:24:48 -0500
X-MC-Unique: JwJ5ol4RN0uHXqpnakJPqQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAF801023F4F;
 Wed,  1 Dec 2021 18:24:46 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.193.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE91C60622;
 Wed,  1 Dec 2021 18:24:34 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v2 1/4] tls: add macros for coroutine-safe TLS variables
References: <20211201170120.286139-1-stefanha@redhat.com>
 <20211201170120.286139-2-stefanha@redhat.com>
Date: Wed, 01 Dec 2021 19:24:33 +0100
In-Reply-To: <20211201170120.286139-2-stefanha@redhat.com> (Stefan Hajnoczi's
 message of "Wed, 1 Dec 2021 17:01:17 +0000")
Message-ID: <87h7bs6v4u.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=fweimer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi:

> +#elif defined(__x86_64__)
> +#define QEMU_CO_TLS_ADDR(ret, var)                              \
> +    asm volatile("rdfsbase %0\n\t"                              \
> +                 "lea "#var"@tpoff(%0), %0" : "=r"(ret))
> +#endif

RDFSBASE needs quite recent kernels.  I think you should use

  movq %%fs:0, %0

instead, which is equivalent for the x86-64 psABI.

Thanks,
Florian


