Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE69D3DFD0C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:37:16 +0200 (CEST)
Received: from localhost ([::1]:38770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCOq-0006eT-1q
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBCNJ-0004OZ-DB
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:35:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBCNH-0004tj-Nf
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:35:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628066139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zc4kf+hX0DjKqWOtVUFAoXgMEoPtCLxLte7MgFoeU5w=;
 b=ImXs/YEYt7r+MmcpJUd+yz4ri1JGOAo7D8+FkLXR30udTLJvg4Lm9aUWwdL/41pLpl3kGj
 F0kbacxyFF4YYgtNqEpztPgIJ6XuZTMFquAgCj9jvVyTlN4QOt5jcIuRt+/fa1ylHfLMcV
 KMIxmdLLwqrndwATsF2qRFCqwke/NLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-WZzhM6KDODGG8gcU5peEdA-1; Wed, 04 Aug 2021 04:35:37 -0400
X-MC-Unique: WZzhM6KDODGG8gcU5peEdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ACD080363C;
 Wed,  4 Aug 2021 08:35:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEF6819C44;
 Wed,  4 Aug 2021 08:35:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 57BEF11380A0; Wed,  4 Aug 2021 10:35:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 4/6] coverity-model: clean up the models for array
 allocation functions
References: <20210731062741.301102-1-pbonzini@redhat.com>
 <20210731062741.301102-5-pbonzini@redhat.com>
 <CAFEAcA95XPt-2oeKM1gCCRDOjAyf4m0vkoQNGwLZk4swo4gDAA@mail.gmail.com>
 <a0cf06ce-55ae-fe35-64ef-f3d66c2708c0@redhat.com>
Date: Wed, 04 Aug 2021 10:35:35 +0200
In-Reply-To: <a0cf06ce-55ae-fe35-64ef-f3d66c2708c0@redhat.com> (Paolo
 Bonzini's message of "Mon, 2 Aug 2021 18:20:55 +0200")
Message-ID: <87tuk5ip48.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 02/08/21 14:36, Peter Maydell wrote:
>> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
>> The real g_malloc_n() returns failure if the multiplication
>> would overflow;

Really?  Its documentation:

    This function is similar to g_malloc(), allocating (n_blocks *
    n_block_bytes) bytes, but care is taken to detect possible overflow
    during multiplication.

There's also g_try_malloc_n():

    This function is similar to g_try_malloc(), allocating (n_blocks *
    n_block_bytes) bytes, but care is taken to detect possible overflow
    during multiplication.

I read this as g_malloc_n() can return null only for zero size, and
crashes on error, just like g_malloc_n().  g_try_malloc_n() behaves like
g_try_malloc_n(), i.e. it returns null on failure.

>>                 I guess Coverity currently doesn't have any
>> warnings it generates as a result of assuming overflow
>> might happen?
>
> I couldn't find any Coverity-specific way to detect overflow, but

Does it need one?

Quick peek at Coverity 2012.12 Checker Reference:

    4.188. INTEGER_OVERFLOW
    [...]
    4.188.1. Overview

    Supported Languages: C, C++, Objective-C, Objective-C++

    INTEGER_OVERFLOW finds many cases of integer overflows and
    truncations resulting from arithmetic operations. Some forms of
    integer overflow can cause security vulnerabilities, for example,
    when the overflowed value is used as the argument to an allocation
    function. [...]

    [...]

    Disabled by default: INTEGER_OVERFLOW is disabled by default. To
    enable it, you can use the --enable option to the cov-analyze
    command.

The example that follows shows a memory allocation where the size is
computed like TAINTED * sizeof(MUMBLE), where TAINTED is a "tainted
source", and the allocation's size is a "tainted sink".

Our model for g_malloc_n() uses __coverity_alloc(), which should provide
"tainted sink".

> making nmemb a tainted sink could be an interesting way to ensure that 
> untrusted data does not end up causing such a failure.
>
> Likewise, we should try making __bufwrite taint the buffer it is
> writing to; there's already a TODO for that but I never followed up on
> it.

__bufwrite() tells Coverity that the buf[len] bytes are overwritten with
unspecified data.  I'd expect that to taint the buffer already.


