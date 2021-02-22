Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D6E321088
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 06:46:30 +0100 (CET)
Received: from localhost ([::1]:34494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE43B-00046T-NU
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 00:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lE41S-0003WW-OE
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 00:44:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lE41O-0007Xw-Mf
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 00:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613972677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RX2Aelf31xy+HW9UliW4fJ9t/eHaTfCkENcb4FsWgnI=;
 b=KsO2UxlHnjNWzkrsJ5VVvmYVcpFFedK36xAOh+rjju+M5gWPyz5d0qdusLnbwUdxLqpJWn
 Hqh5+GtXYIsOdw8DlJ4JgUz/hUNNoHPL8fyef8JxUjHvIsGJ4IZCHE9iFDHK/CxoNZFzE7
 TgfxXXpkkAiZRvTFhMExz604JBYeCJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-EqTv944kNKKCkF79dw2wGA-1; Mon, 22 Feb 2021 00:44:34 -0500
X-MC-Unique: EqTv944kNKKCkF79dw2wGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B73A80197A;
 Mon, 22 Feb 2021 05:44:33 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-97.ams2.redhat.com [10.36.112.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF55C5D9CC;
 Mon, 22 Feb 2021 05:44:31 +0000 (UTC)
Subject: Re: [PATCH v2] configure: fix --enable-fuzzing linker failures
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210221174510.22542-1-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b3395333-4939-b25f-13de-256d092f3835@redhat.com>
Date: Mon, 22 Feb 2021 06:44:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210221174510.22542-1-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, Li Qiang <liq3ea@163.com>, f4bug@amsat.org,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/02/2021 18.45, Alexander Bulekov wrote:
> With --enable-fuzzing, QEMU_CFLAGS include -fsanitize=fuzzer-no-link.
> This should allow us to build non-fuzzer binaries using objects
> instrumented for fuzzing. However, to do that, we also need to link with
> -fsanitize=fuzzer-no-link. We were not doing that.
> 
> Reported-by: Li Qiang <liq3ea@163.com>,
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
> v2: Fix a mistake in the added QEMU_LDFLAGS line
> 
>   configure | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/configure b/configure
> index a79b3746d4..19f2b88589 100755
> --- a/configure
> +++ b/configure
> @@ -6096,7 +6096,17 @@ if test "$fuzzing" = "yes" ; then
>     # If LIB_FUZZING_ENGINE is set, assume we are running on OSS-Fuzz, and the
>     # needed CFLAGS have already been provided
>     if test -z "${LIB_FUZZING_ENGINE+xxx}" ; then
> +    # Add CFLAGS to tell clang to add fuzzer-related instrumentation to all the
> +    # compiled code.
>       QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize=fuzzer-no-link"
> +    # To build non-fuzzer binaries with --enable-fuzzing, link everything with
> +    # fsanitize=fuzzer-no-link. Otherwise, the linker will be unable to bind
> +    # the fuzzer-related callbacks added by instrumentation.
> +    QEMU_LDFLAGS="$QEMU_LDFLAGS -fsanitize=fuzzer-no-link"
> +    # For the actual fuzzer binaries, we need to link against the libfuzzer
> +    # library. Provide the flags for doing this in FUZZ_EXE_LDFLAGS. The meson
> +    # rule for the fuzzer adds these to the link_args. They need to be
> +    # configurable, to support OSS-Fuzz
>       FUZZ_EXE_LDFLAGS="-fsanitize=fuzzer"
>     else
>       FUZZ_EXE_LDFLAGS="$LIB_FUZZING_ENGINE"
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


