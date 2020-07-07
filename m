Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245B721657C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 06:42:59 +0200 (CEST)
Received: from localhost ([::1]:47566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsfRa-0006HY-7h
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 00:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jsfQk-0005s1-CU
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 00:42:07 -0400
Received: from relay64.bu.edu ([128.197.228.104]:47156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jsfQi-0007A3-Jw
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 00:42:05 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 0674fOZW018355
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 7 Jul 2020 00:41:28 -0400
Date: Tue, 7 Jul 2020 00:41:24 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 4/4] docs/fuzz: add instructions for generating a
 coverage report
Message-ID: <20200707044124.d4f2em2cdfivdrcq@mozz.bu.edu>
References: <20200706195534.14962-1-alxndr@bu.edu>
 <20200706195534.14962-5-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200706195534.14962-5-alxndr@bu.edu>
User-Agent: NeoMutt/20180716
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:42:03
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: bsd@redhat.com, philmd@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 200706 1555, Alexander Bulekov wrote:
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  docs/devel/fuzzing.txt | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/docs/devel/fuzzing.txt b/docs/devel/fuzzing.txt
> index 284d57f8fd..a9816ffce9 100644
> --- a/docs/devel/fuzzing.txt
> +++ b/docs/devel/fuzzing.txt
> @@ -85,6 +85,25 @@ better coverage performance, depending on the target.
>  Note that libFuzzer's exact behavior will depend on the version of
>  clang and libFuzzer used to build the device fuzzers.
>  
> +== Generating Coverage Reports ==
> +Code coverage is a crucial metric for evaluating a fuzzer's performance.
> +libFuzzer's output provides a "cov: " column that provides a total number of
> +unique blocks/edges covered. To examine coverage on a line-by-line basis we
> +can use Clang coverage:
> +
> + 1. Configure libFuzzer to store a corpus of all interesting inputs (see
> +    CORPUS_DIR above)
> + 2. ./configure the QEMU build with:
> +    --enable-sanitizers \
Oops... that should be --enable-fuzzing \

> +    --extra-cflags="-fprofile-instr-generate -fcoverage-mapping"
> + 3. Re-run the fuzzer. Specify $CORPUS_DIR/* as an argument, telling libfuzzer
> +    to execute all of the inputs in $CORPUS_DIR and exit. Once the process
> +    exits, you should find a file, "default.profraw" in the working directory.
> + 4. Execute these commands to generate a detailed HTML coverage-report:
> + llvm-profdata merge -output=default.profdata default.profraw
> + llvm-cov show ./path/to/qemu-fuzz-i386 -instr-profile=default.profdata \
> + --format html -output-dir=/path/to/output/report
> +
>  == Adding a new fuzzer ==
>  Coverage over virtual devices can be improved by adding additional fuzzers.
>  Fuzzers are kept in tests/qtest/fuzz/ and should be added to
> -- 
> 2.26.2
> 

