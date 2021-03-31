Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A938B3504C9
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 18:39:22 +0200 (CEST)
Received: from localhost ([::1]:45340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRdsH-0000ZM-O5
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 12:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lRdqm-0007xi-LB
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:37:48 -0400
Received: from relay68.bu.edu ([128.197.228.73]:44219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lRdqk-00061y-8I
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:37:48 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 12VGaYPR022476
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 31 Mar 2021 12:36:37 -0400
Date: Wed, 31 Mar 2021 12:36:34 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci.yml: Use unrecoverable address sanitizer
Message-ID: <20210331163634.oh7gznylvyxtwzz3@mozz.bu.edu>
References: <20210331160546.3071575-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331160546.3071575-1-thuth@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210331 1805, Thomas Huth wrote:
> Make sure that errors don't go unnoticed by using the unrecoverable
> sanitizer switch here, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

I thought sanitizer recovery is disabled by default for ASan. I've only
seen it enabled by default for UBSan. The docs seem to hint at this as
well [1]. Was there something specific in the CI logs that went
unnoticed?

[1] https://github.com/llvm/llvm-project/blame/04f10ab367b5c547f5de3285890e74146a5949b0/clang/docs/UsersManual.rst#L1579
(No clue how to properly view non-rendered markdown on github, without
the blame ui)

-Alex

>  .gitlab-ci.yml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 4c43dd2570..846d3932cf 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -661,7 +661,8 @@ build-oss-fuzz:
>      IMAGE: fedora
>    script:
>      - mkdir build-oss-fuzz
> -    - CC="clang" CXX="clang++" CFLAGS="-fsanitize=address"
> +    - CC="clang" CXX="clang++"
> +      CFLAGS="-fsanitize=address -fno-sanitize-recover=address"
>        ./scripts/oss-fuzz/build.sh
>      - export ASAN_OPTIONS="fast_unwind_on_malloc=0"
>      - for fuzzer in $(find ./build-oss-fuzz/DEST_DIR/ -executable -type f
> -- 
> 2.27.0
> 

