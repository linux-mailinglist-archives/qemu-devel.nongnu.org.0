Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CAC3BF422
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 04:59:51 +0200 (CEST)
Received: from localhost ([::1]:56420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1KGU-0007Hn-5P
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 22:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m1KFa-0005Sk-Bm
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 22:58:54 -0400
Received: from relay68.bu.edu ([128.197.228.73]:38965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m1KFY-0002Tk-40
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 22:58:53 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 1682wLY5002592
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 7 Jul 2021 22:58:25 -0400
Date: Wed, 7 Jul 2021 22:58:21 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v5 2/3] fuzz: add an instrumentation filter
Message-ID: <20210708025821.aokkjfqxluv7mrjv@mozz.bu.edu>
References: <20210630034124.222689-1-alxndr@bu.edu>
 <20210630034124.222689-3-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210630034124.222689-3-alxndr@bu.edu>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 darren.kenny@oracle.com, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210629 2341, Alexander Bulekov wrote:
> By default, -fsanitize=fuzzer instruments all code with coverage
> information. However, this means that libfuzzer will track coverage over
> hundreds of source files that are unrelated to virtual-devices. This
> means that libfuzzer will optimize inputs for coverage observed in timer
> code, memory APIs etc. This slows down the fuzzer and stores many inputs
> that are not relevant to the actual virtual-devices.
> 
> With this change, clang versions that support the
> "-fsanitize-coverage-allowlist" will only instrument a subset of the
> compiled code, that is directly related to virtual-devices.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Ping?

Are there any other device-related subdirectories we should add to the
filter besides slirp? I'm considering net/ , since it do not seem to
generate much coverage noise, and there might be some tricky codepaths
there that benefit from the coverage guidance.

-Alex

> ---
>  configure                                        | 13 +++++++++++++
>  scripts/oss-fuzz/instrumentation-filter-template | 14 ++++++++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644 scripts/oss-fuzz/instrumentation-filter-template
> 
> diff --git a/configure b/configure
> index 38704b4e11..3b6ca054b9 100755
> --- a/configure
> +++ b/configure
> @@ -5189,6 +5189,11 @@ if test "$fuzzing" = "yes" && test -z "${LIB_FUZZING_ENGINE+xxx}"; then
>      error_exit "Your compiler doesn't support -fsanitize=fuzzer"
>      exit 1
>    fi
> +  have_clang_coverage_filter=no
> +  echo > $TMPTXT
> +  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=fuzzer -fsanitize-coverage-allowlist=$TMPTXT" ""; then
> +      have_clang_coverage_filter=yes
> +  fi
>  fi
>  
>  # Thread sanitizer is, for now, much noisier than the other sanitizers;
> @@ -6120,6 +6125,14 @@ if test "$fuzzing" = "yes" ; then
>      # rule for the fuzzer adds these to the link_args. They need to be
>      # configurable, to support OSS-Fuzz
>      FUZZ_EXE_LDFLAGS="-fsanitize=fuzzer"
> +
> +    # Specify a filter to only instrument code that is directly related to
> +    # virtual-devices.
> +    if test "$have_clang_coverage_filter" = "yes" ; then
> +        cp "$source_path/scripts/oss-fuzz/instrumentation-filter-template" \
> +            instrumentation-filter
> +        QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize-coverage-allowlist=instrumentation-filter"
> +    fi
>    else
>      FUZZ_EXE_LDFLAGS="$LIB_FUZZING_ENGINE"
>    fi
> diff --git a/scripts/oss-fuzz/instrumentation-filter-template b/scripts/oss-fuzz/instrumentation-filter-template
> new file mode 100644
> index 0000000000..44e853159c
> --- /dev/null
> +++ b/scripts/oss-fuzz/instrumentation-filter-template
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

