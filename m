Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B807A341FEF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:45:25 +0100 (CET)
Received: from localhost ([::1]:50616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNGNQ-00035c-NR
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lNGJJ-0006lO-Br
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:41:09 -0400
Received: from relay68.bu.edu ([128.197.228.73]:53570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lNGJH-0005bR-Ev
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:41:08 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 12JEeGC6016050
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 19 Mar 2021 10:40:19 -0400
Date: Fri, 19 Mar 2021 10:40:16 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] fuzz: Avoid deprecated misuse of -drive if=sd
Message-ID: <20210319144016.cxbkgsh2u7ot5vlg@mozz.bu.edu>
References: <20210319132008.1830950-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319132008.1830950-1-armbru@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210319 1420, Markus Armbruster wrote:
> qemu-fuzz-i386-target-generic-fuzz-sdhci-v3 uses -drive=sd where it
> should use -drive if=none instead.  This prints a deprecation warning:
> 
>     $ ./build-oss-fuzz/DEST_DIR/qemu-fuzz-i386-target-generic-fuzz-sdhci-v3 -runs=1 -seed=1
>     [ASan warnings snipped...]
> --> i386: -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive: warning: bogus if=sd is deprecated, use if=none
>     INFO: Seed: 1
>     [More normal output snipped...]
> 
> Support for this usage will be gone soon.  Adjust the test.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  tests/qtest/fuzz/generic_fuzz_configs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

Thanks

