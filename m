Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D83047FBBA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 11:04:07 +0100 (CET)
Received: from localhost ([::1]:39090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1mrO-0002lw-0c
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 05:04:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n1mor-0001XC-8u
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 05:01:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n1mon-0000lt-UG
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 05:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640599284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H2VnKaNwYG8GFn9HjceVvnT5HgMc4tIB+ZpmLcUSKJQ=;
 b=N3DjA/YvEikES6zN4IfofawMryqkjLTb/69hum/ktyfeAkZTjaC8idtl9QoEbpQsctVMXj
 ctz7vkpZzozDFeUeQ10wOlPkzdGwvsEQpeEUSzdXeFgJvj8E/lmBdo4BYdaWQjp2Inqzor
 mu4gwNQr01exBLAXNpDsfIF7k+Y7ijQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-Mq_-j9BLNOSWOFddrc6qqg-1; Mon, 27 Dec 2021 05:01:23 -0500
X-MC-Unique: Mq_-j9BLNOSWOFddrc6qqg-1
Received: by mail-ed1-f71.google.com with SMTP id
 i5-20020a05640242c500b003f84839a8c3so10717635edc.6
 for <qemu-devel@nongnu.org>; Mon, 27 Dec 2021 02:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H2VnKaNwYG8GFn9HjceVvnT5HgMc4tIB+ZpmLcUSKJQ=;
 b=rjK0izn1+y98yER7cSfbrW3XE4c3nNoHQ+tHCt40FxKcQPmI+cznbjld/j1xAU0h6N
 JDxfv5qCN/4qEwYQ2wDe/QL2OomGXW5qNKaBFFVFHarX9bpXx0S5Dxsj+qFVrWAraq6t
 tw4m2x6sdL2o0LEu0l30NlzLU/uaTZB44C+qWT1EGEc+utJhIfUDVH8pIwH3fhz0NEqE
 3KeqssIDQqTqCz7hC2UkRQEHmV0hv8w3+oyf8OM81ZKsWQ+cZDYfiO5Ld+TonMNTh/T+
 Z/SJIyM1xAjUhSIRQ8OGBFMv2kYzsQNMtU3f5q6AsJPvNoL3DemUV36ssPeL02vBs/yg
 /6xw==
X-Gm-Message-State: AOAM530uJmtsoYDWltF9zCTij+NA4jpmIGkEnTHiZMvfeSLeGFGsC+5u
 ah5jvEC1Qlk4h8n8kI1SA6/ZO/vTcRc72e73c0n93bLx/9gcMalU6cy5/nPqFAYcX6QBpC0Q8m0
 jMwhz139vD2waweg=
X-Received: by 2002:aa7:da8a:: with SMTP id q10mr15905982eds.302.1640599282326; 
 Mon, 27 Dec 2021 02:01:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9CdfVfUmy1CZM1yhDlN62xLEt/Rm0+TYDOl5gNp1F65YY8IhMOZu0BfmXwXZ3MS8jXGTW9Q==
X-Received: by 2002:aa7:da8a:: with SMTP id q10mr15905960eds.302.1640599282008; 
 Mon, 27 Dec 2021 02:01:22 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id i8sm3945466edc.91.2021.12.27.02.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 02:01:21 -0800 (PST)
Date: Mon, 27 Dec 2021 11:01:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/qtest/test-x86-cpuid-compat: Check for machines
 before using them
Message-ID: <20211227110120.5d61f6ee@redhat.com>
In-Reply-To: <20211222153923.1000420-1-thuth@redhat.com>
References: <20211222153923.1000420-1-thuth@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.575,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Dec 2021 16:39:23 +0100
Thomas Huth <thuth@redhat.com> wrote:

> The user might have disabled the pc-i440fx machine type (or it's older
> versions, like done in downstream RHEL) in the QEMU binary, so let's
> better check whether the machine types are available before using them.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
Looks good to me, so

Reviewed-by: Igor Mammedov <imammedo@redhat.com>


the only concern is that when deprecated machine is removed,
this code will happily hide test block which should be removed.

> ---
>  tests/qtest/test-x86-cpuid-compat.c | 85 ++++++++++++++++-------------
>  1 file changed, 48 insertions(+), 37 deletions(-)
> 
> diff --git a/tests/qtest/test-x86-cpuid-compat.c b/tests/qtest/test-x86-cpuid-compat.c
> index f28848e06e..39138db774 100644
> --- a/tests/qtest/test-x86-cpuid-compat.c
> +++ b/tests/qtest/test-x86-cpuid-compat.c
> @@ -302,54 +302,65 @@ int main(int argc, char **argv)
>  
>      /* Check compatibility of old machine-types that didn't
>       * auto-increase level/xlevel/xlevel2: */
> -
> -    add_cpuid_test("x86/cpuid/auto-level/pc-2.7",
> -                   "-machine pc-i440fx-2.7 -cpu 486,arat=on,avx512vbmi=on,xsaveopt=on",
> -                   "level", 1);
> -    add_cpuid_test("x86/cpuid/auto-xlevel/pc-2.7",
> -                   "-machine pc-i440fx-2.7 -cpu 486,3dnow=on,sse4a=on,invtsc=on,npt=on,svm=on",
> -                   "xlevel", 0);
> -    add_cpuid_test("x86/cpuid/auto-xlevel2/pc-2.7",
> -                   "-machine pc-i440fx-2.7 -cpu 486,xstore=on",
> -                   "xlevel2", 0);
> +    if (qtest_has_machine("pc-i440fx-2.7")) {
> +        add_cpuid_test("x86/cpuid/auto-level/pc-2.7",
> +                       "-machine pc-i440fx-2.7 -cpu 486,arat=on,avx512vbmi=on,xsaveopt=on",
> +                       "level", 1);
> +        add_cpuid_test("x86/cpuid/auto-xlevel/pc-2.7",
> +                       "-machine pc-i440fx-2.7 -cpu 486,3dnow=on,sse4a=on,invtsc=on,npt=on,svm=on",
> +                       "xlevel", 0);
> +        add_cpuid_test("x86/cpuid/auto-xlevel2/pc-2.7",
> +                       "-machine pc-i440fx-2.7 -cpu 486,xstore=on",
> +                       "xlevel2", 0);
> +    }
>      /*
>       * QEMU 1.4.0 had auto-level enabled for CPUID[7], already,
>       * and the compat code that sets default level shouldn't
>       * disable the auto-level=7 code:
>       */
> -    add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-1.4/off",
> -                   "-machine pc-i440fx-1.4 -cpu Nehalem",
> -                   "level", 2);
> -    add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-1.5/on",
> -                   "-machine pc-i440fx-1.4 -cpu Nehalem,smap=on",
> -                   "level", 7);
> -    add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.3/off",
> -                   "-machine pc-i440fx-2.3 -cpu Penryn",
> -                   "level", 4);
> -    add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.3/on",
> -                   "-machine pc-i440fx-2.3 -cpu Penryn,erms=on",
> -                   "level", 7);
> -    add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.9/off",
> -                   "-machine pc-i440fx-2.9 -cpu Conroe",
> -                   "level", 10);
> -    add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.9/on",
> -                   "-machine pc-i440fx-2.9 -cpu Conroe,erms=on",
> -                   "level", 10);
> +    if (qtest_has_machine("pc-i440fx-1.4")) {
> +        add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-1.4/off",
> +                       "-machine pc-i440fx-1.4 -cpu Nehalem",
> +                       "level", 2);
> +        add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-1.5/on",
> +                       "-machine pc-i440fx-1.4 -cpu Nehalem,smap=on",
> +                       "level", 7);
> +    }
> +    if (qtest_has_machine("pc-i440fx-2.3")) {
> +        add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.3/off",
> +                       "-machine pc-i440fx-2.3 -cpu Penryn",
> +                       "level", 4);
> +        add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.3/on",
> +                       "-machine pc-i440fx-2.3 -cpu Penryn,erms=on",
> +                       "level", 7);
> +    }
> +    if (qtest_has_machine("pc-i440fx-2.9")) {
> +        add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.9/off",
> +                       "-machine pc-i440fx-2.9 -cpu Conroe",
> +                       "level", 10);
> +        add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.9/on",
> +                       "-machine pc-i440fx-2.9 -cpu Conroe,erms=on",
> +                       "level", 10);
> +    }
>  
>      /*
>       * xlevel doesn't have any feature that triggers auto-level
>       * code on old machine-types.  Just check that the compat code
>       * is working correctly:
>       */
> -    add_cpuid_test("x86/cpuid/xlevel-compat/pc-i440fx-2.3",
> -                   "-machine pc-i440fx-2.3 -cpu SandyBridge",
> -                   "xlevel", 0x8000000a);
> -    add_cpuid_test("x86/cpuid/xlevel-compat/pc-i440fx-2.4/npt-off",
> -                   "-machine pc-i440fx-2.4 -cpu SandyBridge,",
> -                   "xlevel", 0x80000008);
> -    add_cpuid_test("x86/cpuid/xlevel-compat/pc-i440fx-2.4/npt-on",
> -                   "-machine pc-i440fx-2.4 -cpu SandyBridge,svm=on,npt=on",
> -                   "xlevel", 0x80000008);
> +    if (qtest_has_machine("pc-i440fx-2.3")) {
> +        add_cpuid_test("x86/cpuid/xlevel-compat/pc-i440fx-2.3",
> +                       "-machine pc-i440fx-2.3 -cpu SandyBridge",
> +                       "xlevel", 0x8000000a);
> +    }
> +    if (qtest_has_machine("pc-i440fx-2.4")) {
> +        add_cpuid_test("x86/cpuid/xlevel-compat/pc-i440fx-2.4/npt-off",
> +                       "-machine pc-i440fx-2.4 -cpu SandyBridge,",
> +                       "xlevel", 0x80000008);
> +        add_cpuid_test("x86/cpuid/xlevel-compat/pc-i440fx-2.4/npt-on",
> +                       "-machine pc-i440fx-2.4 -cpu SandyBridge,svm=on,npt=on",
> +                       "xlevel", 0x80000008);
> +    }
>  
>      /* Test feature parsing */
>      add_feature_test("x86/cpuid/features/plus",


