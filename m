Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B8E2E01FD
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 22:20:05 +0100 (CET)
Received: from localhost ([::1]:39784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krSb5-0008QC-Qr
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 16:20:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1krSYw-0007ir-6y
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 16:17:50 -0500
Received: from relay64.bu.edu ([128.197.228.104]:53474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1krSYr-00016X-Qy
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 16:17:49 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 0BLLH4Ls030432
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 21 Dec 2020 16:17:07 -0500
Date: Mon, 21 Dec 2020 16:17:04 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH 4/4] fuzz: delay IO until they can't trigger the crash
Message-ID: <20201221211704.qiai5j75fmcqrueo@mozz.bu.edu>
References: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB14920C8592A1D04D4A5685D9FCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ME3P282MB14920C8592A1D04D4A5685D9FCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org, darren.kenny@oracle.com,
 bsd@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201220 0256, Qiuhao Li wrote:
> Since programmers usually trigger an IO just before they need it. Try to
> delay some IO instructions may help us better understanding the timing
> context when debug.
> 
> Tested with Bug 1908062. Refined vs. Original result:
> 
> outl 0xcf8 0x8000081c            outl 0xcf8 0x0
> outb 0xcfc 0xc3                | outl 0xcf8 0x8000081c
> outl 0xcf8 0x80000804          | outb 0xcfc 0xc3
> outl 0xcfc 0x10000006          | outl 0xcf8 0x80000804
> write 0xc300001028 0x1 0x5a    | outl 0xcfc 0x10000006
> write 0xc300001024 0x2 0x10    | write 0xc300001028 0x1 0x5a
> write 0xc30000101c 0x1 0x01    | writel 0xc30000100c 0x2a6f6c63
> write 0xc300003002 0x1 0x0     v write 0xc300001024 0x2 0x10
> write 0x5c 0x1 0x10              write 0xc30000101c 0x1 0x01
> writel 0xc30000100c 0x2a6f6c63   write 0xc300001018 0x1 0x80
> write 0xc300001018 0x1 0x80      write 0x5c 0x1 0x10
> outl 0xcf8 0x0                   write 0xc300003002 0x1 0x0
> 

In this example, I can remove the outl 0xcf8 0x0, and I still see the
crash, so maybe the 1st step in the minimizer is failing somewhere.. 

Is the Refined one better? To me the original one read as:
"Do a bunch of PCI configuration to map an MMIO BAR, then interact with
the MMIO range and trigger some DMA activity". I also know exactly the
line that will trigger the DMA activity and access 0x5c. With the
refined one, I'm not so sure. Which line now causes the DMA read from
0x5c? writel 0xc30000100c? write 0xc300001018?
Is there another example where this type of reordering makes the result
easier to read?

> Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> ---
>  scripts/oss-fuzz/minimize_qtest_trace.py | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
> index f3e88064c4..da7aa73b3c 100755
> --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> @@ -214,6 +214,27 @@ def minimize_trace(inpath, outpath):
>  
>      assert(check_if_trace_crashes(newtrace, outpath))
>  
> +    # delay IO instructions until they can't trigger the crash
> +    # Note: O(n^2) and many timeouts, kinda slow

Maybe do a binary search instead of a linear scan for the optimal position
to save some time?
Also, if you re-run this multiple times, you can end up with different
results, since some lines might not really be tied to a position (e.g.
the outl cf8 0x0 in your example). Maybe it's not a problem, but i'm
still not sure that this is making the result easier to read.
-Alex

> +    i = len(newtrace) - 1
> +    while i >= 0:
> +        tmp_i = newtrace[i]
> +        if len(tmp_i) < 2:
> +            i -= 1
> +            continue
> +        print("Delaying ", newtrace[i])
> +        for j in reversed(range(i+1, len(newtrace)+1)):
> +            newtrace.insert(j, tmp_i)
> +            del newtrace[i]
> +            if check_if_trace_crashes(newtrace, outpath):
> +                break
> +            newtrace.insert(i, tmp_i)
> +            del newtrace[j]
> +        i -= 1
> +
> +    assert(check_if_trace_crashes(newtrace, outpath))
> +    # maybe another removing round
> +
>  
>  if __name__ == '__main__':
>      if len(sys.argv) < 3:
> -- 
> 2.25.1
> 

