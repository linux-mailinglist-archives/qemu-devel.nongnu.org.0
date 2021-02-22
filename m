Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39BD3219D7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:12:03 +0100 (CET)
Received: from localhost ([::1]:56290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBwQ-0008Ds-MD
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:12:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEBuj-00072j-Ti
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:10:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEBuh-0007Ei-Nz
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:10:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614003014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P9jLpacpv3y5bVGNmxsGqJ5xosbuK2ThJRlad9eNY+A=;
 b=GujvWmFD8DLcwxJNFsRsvM3/cBVrC+jLWeD8GyIDFN8Uqo+q6TjqYDBYE31ThimexdR3pR
 t8Umr5dF2cvhGwjKKuXJ7Zc9jQps+MHg36NPNzteET0do5f9y59ojzB5isfZyahbVZ0Vmk
 IsNl0Uezg6ownbliLgsROhf01kbgh3o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-xwcFCnGCNHKLgAFyc5kL2Q-1; Mon, 22 Feb 2021 09:10:11 -0500
X-MC-Unique: xwcFCnGCNHKLgAFyc5kL2Q-1
Received: by mail-wr1-f69.google.com with SMTP id d7so6102785wri.23
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 06:10:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P9jLpacpv3y5bVGNmxsGqJ5xosbuK2ThJRlad9eNY+A=;
 b=bO/lHQI2sJhVBohkUsqUHpvCEGcQr704rOWRL0AZCnfOkyLiHo+xpocTssKzkcTR8I
 UONxzwE2eFCkKQ0e51Dux+2vilESfHNjS1C2BKo/ytikr1W9SyyYoTrK+nfo3PBZTahd
 ZSd96Kv5cBqJKz8tA2F0CFE4u0ou69ahU5mLGrBd7RnN5orJhjtW/1hFBg6WSFFHMqeO
 KgFP1NPZus9cEA3aYQpDmMVkgwrQMiTuU1UCDVxyjWNjGsUmxSCzk1ZNPdvTKMNYCqrZ
 TF/maPa+DAruLIx0rYjOMuXwq6yn8kq+tq2RssrGU3ekvyJ+qIwOjPEdBR8zfIu8VcR6
 zJvg==
X-Gm-Message-State: AOAM533svemsQItPaDP4EqH7vHkWqQemrRfy2w5TYT82ZZPuWLR4oDCo
 Vp6n5QbimjNeOLbEHy2M0obWGEjz8Czo1HoiQMLx+Ni1Gfo1OsfiziZSUsvemfTMDMWC05Hc/jd
 fNdHUNOWN6+lErlA=
X-Received: by 2002:a05:600c:4ec7:: with SMTP id
 g7mr20052333wmq.56.1614003010056; 
 Mon, 22 Feb 2021 06:10:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+XYIVSn8e4GxouCaVquzuRZPm/ofnt+clQ4TrOCkj3UfQKlsetKgDztvIokoOxW0bqY9MpA==
X-Received: by 2002:a05:600c:4ec7:: with SMTP id
 g7mr20052306wmq.56.1614003009844; 
 Mon, 22 Feb 2021 06:10:09 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z13sm15822964wmi.45.2021.02.22.06.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 06:10:09 -0800 (PST)
Subject: Re: [PATCH v2] configure: fix --enable-fuzzing linker failures
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210221174510.22542-1-alxndr@bu.edu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8b32dd12-826f-77c9-f68d-40151d61d783@redhat.com>
Date: Mon, 22 Feb 2021 15:10:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210221174510.22542-1-alxndr@bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, Li Qiang <liq3ea@163.com>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/02/21 18:45, Alexander Bulekov wrote:
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

Queued, thanks.

Paolo


