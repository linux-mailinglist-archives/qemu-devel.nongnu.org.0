Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2714CBD80
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 13:18:02 +0100 (CET)
Received: from localhost ([::1]:44476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPkPB-0003jM-46
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 07:18:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nPkFo-0004Bm-RL
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:08:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nPkFn-0005AL-7L
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:08:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646309298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f3WbcdEi0KWA0gK2OLNg8nUQ4QDHH6rD1Tttd8eh6KY=;
 b=bNmvUkNYbmNeVrBxHB/i2mCNxq2Z3cPSPgqWW797JAQ5TByqQX5OGVh0E8Qf4I4SgA6XyB
 5Sa6yuiazLG38y5pQadI3LgoMzrI6r/727FThlVs2mIHhMRV/cfRcIPQVHsmEzIRrn8VuP
 guNWLmF/hhMfRY2N4Jw33pUc2bTE++c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-_5EVftJuPLygq_dXDXHWWg-1; Thu, 03 Mar 2022 07:08:15 -0500
X-MC-Unique: _5EVftJuPLygq_dXDXHWWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CDDE51DC;
 Thu,  3 Mar 2022 12:08:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 691AF81F6A;
 Thu,  3 Mar 2022 12:07:56 +0000 (UTC)
Date: Thu, 3 Mar 2022 13:07:54 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 0/4] tls: add macros for coroutine-safe TLS variables
Message-ID: <YiCvmr1Ri/kwDCyF@redhat.com>
References: <20220222140150.27240-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220222140150.27240-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Florian Weimer <fweimer@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.02.2022 um 15:01 hat Stefan Hajnoczi geschrieben:
> v5:
> - Added explicit "#include "qemu/coroutine-tls.h" in patch 4 [Philippe]
> - Updated patch 1 commit description and comments to describe the current
>   noinline plus asm volatile approach [Peter]
> v4:
> - Dropped '[RFC]'.
> - Dropped inline asm for now. -fPIC versions of the code are missing and I
>   hit several issues including a clang LTO bug where thread local variables are
>   incorrectly discarded because inline asm is not analyzed to find symbol
>   dependencies (Serge Guelton is aware).
> - Fixed CI failures.
> v3:
> - Added __attribute__((weak)) to get_ptr_*() [Florian]
> - Replace rdfsbase with mov %%fs:0,%0 [Florian]
> 
> This patch series solves the coroutines TLS problem. Coroutines re-entered from
> another thread sometimes see stale TLS values. This happens because compilers
> may cache values across yield points, so a value from the previous thread will
> be used when the coroutine is re-entered in another thread.
> 
> Serge Guelton developed a portable technique, see the first patch for details.
> 
> I have audited all __thread variables in QEMU and converted those that can be
> used from coroutines. Most actually look safe to me.

Hm, what about the ones in the coroutine implementation itself?

static __thread CoroutineUContext leader;
static __thread Coroutine *current;

Both of them are used in qemu_coroutine_self(), which is a
coroutine_fn, and in qemu_in_coroutine(), which may be called from
coroutine context.

And I seem to remember I've seen crashes related to this in one of the
bug reports we got, where the stack trace clearly showed that one of
these functions had returned a wrong result.

I'm applying this series anyway, it doesn't make the patches incorrect.
But it feels incomplete, so we may need a follow-up patch.

Kevin


