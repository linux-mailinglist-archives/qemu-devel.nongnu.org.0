Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC291C17E5
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 16:38:49 +0200 (CEST)
Received: from localhost ([::1]:55920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUWoS-0002Tv-2w
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 10:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alxndr@bu.edu>) id 1jUWnd-0001ed-8T
 for qemu-devel@nongnu.org; Fri, 01 May 2020 10:37:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alxndr@bu.edu>) id 1jUWnc-0004fD-9D
 for qemu-devel@nongnu.org; Fri, 01 May 2020 10:37:56 -0400
Received: from relay64.bu.edu ([128.197.228.104]:59987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jUWnb-0004dI-T2
 for qemu-devel@nongnu.org; Fri, 01 May 2020 10:37:55 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 041EauTL029030
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 1 May 2020 10:36:59 -0400
Date: Fri, 1 May 2020 10:36:56 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] fuzz: select fuzz target using executable name
Message-ID: <20200501143656.ejasikkkxopmrcxo@mozz.bu.edu>
References: <20200501135612.32249-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501135612.32249-1-alxndr@bu.edu>
User-Agent: NeoMutt/20180716
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/01 10:37:54
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Received-From: 128.197.228.104
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
Cc: Laurent Vivier <lvivier@redhat.com>, peter.maydell@linaro.org,
 Thomas Huth <thuth@redhat.com>, Bandan Das <bsd@redhat.com>,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please ignore. I think I misunderstood the issue with the pull-request.
Additionally, this patch still has incorrect spacing and is missing
review tags.

On 200501 0956, Alexander Bulekov wrote:
> The fuzzers are built into a binary (e.g. qemu-fuzz-i386). To select the
> device to fuzz/fuzz target, we usually use the --fuzz-target= argument.
> This commit allows the fuzz-target to be specified using the name of the
> executable. If the executable name ends with -target-FUZZ_TARGET, then
> we select the fuzz target based on this name, rather than the
> --fuzz-target argument. This is useful for systems such as oss-fuzz
> where we don't have control of the arguments passed to the fuzzer.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  tests/qtest/fuzz/fuzz.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> This patch should be free of any changes to the slirp submodule.
> 
> diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
> index 0d78ac8d36..c6932cec4a 100644
> --- a/tests/qtest/fuzz/fuzz.c
> +++ b/tests/qtest/fuzz/fuzz.c
> @@ -91,6 +91,7 @@ static void usage(char *path)
>          printf(" * %s  : %s\n", tmp->target->name,
>                  tmp->target->description);
>      }
> +    printf("Alternatively, add -target-FUZZ_TARGET to the executable name\n");
>      exit(0);
>  }
>  
> @@ -143,18 +144,20 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
>      module_call_init(MODULE_INIT_QOM);
>      module_call_init(MODULE_INIT_LIBQOS);
>  
> -    if (*argc <= 1) {
> +    target_name = strstr(**argv, "-target-");
> +    if (target_name) {        /* The binary name specifies the target */
> +                target_name += strlen("-target-");
> +    } else if (*argc > 1) {  /* The target is specified as an argument */
> +        target_name = (*argv)[1];
> +        if (!strstr(target_name, "--fuzz-target=")) {
> +            usage(**argv);
> +        }
> +        target_name += strlen("--fuzz-target=");
> +    } else {
>          usage(**argv);
>      }
>  
>      /* Identify the fuzz target */
> -    target_name = (*argv)[1];
> -    if (!strstr(target_name, "--fuzz-target=")) {
> -        usage(**argv);
> -    }
> -
> -    target_name += strlen("--fuzz-target=");
> -
>      fuzz_target = fuzz_get_target(target_name);
>      if (!fuzz_target) {
>          usage(**argv);
> -- 
> 2.26.2
> 

