Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93AF3B0854
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:11:39 +0200 (CEST)
Received: from localhost ([::1]:51678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvi3u-0006KB-Ok
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lvi2Y-0003eL-Ut
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:10:14 -0400
Received: from relay68.bu.edu ([128.197.228.73]:39839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lvi2W-0006M2-PS
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:10:14 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 15MF9N0l024653
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 22 Jun 2021 11:09:26 -0400
Date: Tue, 22 Jun 2021 11:09:23 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/4] fuzz: add an instrumentation filter
Message-ID: <20210622150915.ceilqseteuxtifnn@mozz.bu.edu>
References: <20210618154852.5673-1-alxndr@bu.edu>
 <20210618154852.5673-3-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618154852.5673-3-alxndr@bu.edu>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bandan Das <bsd@redhat.com>, f4bug@amsat.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210618 1148, Alexander Bulekov wrote:
<snip>
> diff --git a/configure b/configure
> index debd50c085..40412bcfcf 100755
> --- a/configure
> +++ b/configure
> @@ -6089,6 +6089,10 @@ if test "$fuzzing" = "yes" ; then
>    # If LIB_FUZZING_ENGINE is set, assume we are running on OSS-Fuzz, and the
>    # needed CFLAGS have already been provided
>    if test -z "${LIB_FUZZING_ENGINE+xxx}" ; then
> +    # Specify a filter to only instrument code that is directly related to
> +    # virtual-devices.
> +	QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize-coverage-allowlist=$source_path/scripts/oss-fuzz/instrumentation-filter"

Hmm I just realized this flag seems to only be available for clang-11+.
We will need to do some probing before enabling it here..

> +
>      # Add CFLAGS to tell clang to add fuzzer-related instrumentation to all the
>      # compiled code.
>      QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize=fuzzer-no-link"
> diff --git a/scripts/oss-fuzz/instrumentation-filter b/scripts/oss-fuzz/instrumentation-filter
> new file mode 100644
> index 0000000000..44e853159c
> --- /dev/null
> +++ b/scripts/oss-fuzz/instrumentation-filter
> @@ -0,0 +1,14 @@
> +# Code that we actually want the fuzzer to target
> +# See: https://clang.llvm.org/docs/SanitizerCoverage.html#disabling-instrumentation-without-source-modification
> +#
> +src:*/hw/*
> +src:*/include/hw/*
> +src:*/slirp/*
> +
> +# We don't care about coverage over fuzzer-specific code, however we should
> +# instrument the fuzzer entry-point so libFuzzer always sees at least some
> +# coverage - otherwise it will exit after the first input
> +src:*/tests/qtest/fuzz/fuzz.c
> +
> +# Enable instrumentation for all functions in those files
> +fun:*
> -- 
> 2.28.0
> 

