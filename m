Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DCC4B8FF5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 19:15:23 +0100 (CET)
Received: from localhost ([::1]:39712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOpm-0003MA-Qh
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 13:15:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1nKOoD-0001DB-BD
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 13:13:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1nKOo8-0006lc-Sd
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 13:13:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645035217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ny4DybM2M4p2MCxOBw1f3RkuKNvLwCvFQWJnjC/gKFI=;
 b=Adetwn3o2SR9qYJc9d1kdL6HzY/xETsBWTKSUKsIz8nZoC57LHRdE7t/p9UnWl2oAQWyNJ
 0sTp7kLGsdJa1eZJ/Ds6VcWK9CZUBid65t18tRJDxlcX1SIrspI19vgKiDgMNjhWvzxEvW
 kGuanQR0Yfifs6beZmOAImNjfVmcrBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-Z-asbatfOJ6vqwPX95yZIA-1; Wed, 16 Feb 2022 13:13:33 -0500
X-MC-Unique: Z-asbatfOJ6vqwPX95yZIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 091311006AA3;
 Wed, 16 Feb 2022 18:13:32 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.195.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A14F677465;
 Wed, 16 Feb 2022 18:13:07 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Portable inline asm to get address of TLS variable
References: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
Date: Wed, 16 Feb 2022 19:13:05 +0100
In-Reply-To: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain> (Stefan Hajnoczi's
 message of "Wed, 16 Feb 2022 17:46:11 +0000")
Message-ID: <87leyaznm6.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=fweimer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi:

> I've been trying to make the inline asm that gets the address of a TLS
> variable for QEMU coroutines pass QEMU's GitLab CI.
> https://gitlab.com/stefanha/qemu/-/blob/coroutine-tls-fix/include/qemu/coroutine-tls.h#L89
>
> The code isn't -fPIC-friendly (R_X86_64_TPOFF32 relocations aren't
> allowed in -fPIC shared libraries) so builds fail with ./configure
> --enable-modules. While I was tackling this I stumbled on this:
>
>   void *dst_ptr;
>   asm volatile("" : "=r"(dst_ptr) : "0"(&tls_var))
>
> What's nice about it:
> - It's portable, there are no arch-specific assembly instructions.
> - It works for both -fPIC and non-PIC.
>
> However, I wonder if the compiler might reuse a register that already
> contains the address. Then we'd have the coroutine problem again when
> qemu_coroutine_yield() is called between the earlier address calculation
> and the asm volatile statement.
>
> Thoughts?

Sorry, I don't see why this isn't equivalent to a plain &tls_var.
What exactly are you trying to achieve?

Thanks,
Florian


