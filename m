Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CC72E0167
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 21:05:46 +0100 (CET)
Received: from localhost ([::1]:49818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krRRB-0005Q0-13
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 15:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1krRO8-0004SC-1a
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 15:02:36 -0500
Received: from relay64.bu.edu ([128.197.228.104]:52168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1krRO3-0000rQ-FN
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 15:02:35 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: pool-72-93-72-163.bstnma.fios.verizon.net [72.93.72.163]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 0BLK1G6J014772
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 21 Dec 2020 15:01:20 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/4] fuzz: split QTest writes from the rightmost byte
In-Reply-To: <ME3P282MB1492172012FA8E0D08819C07FCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB1492172012FA8E0D08819C07FCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
Date: Mon, 21 Dec 2020 15:01:16 -0500
Message-ID: <87r1nj3p4j.fsf@stormtrooper.vrmnet>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: darren.kenny@oracle.com, bsd@redhat.com, thuth@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qiuhao Li <Qiuhao.Li@outlook.com> writes:

> Currently, we split the write commands' data from the middle. If it does not
> work, try to move the pivot "left" and retry until there is no space left.
> But, this is complete for ram writes but not for IO writes.
>
> For example, there is an IO write command:
>
>   write addr uuxxxxuu
>
> u is the unnecessary byte for the crash. Unlike ram write commands, in most
> case, a split IO write won't trigger the same crash, So if we split from the
> middle, we will get:
>
>   write addr uu (will be removed in next round)
>   write addr xxxxuu
>
> For xxxxuu, since split it from the middle and retry to the leftmost byte
> won't get the same crash, we will be stopped from removing the last two
> bytes.
>

Good catch! I missed this case.

> Therefore, we should split QTest writes from the rightmost byte.
>
> Tested with Bug 1908062. Refined vs. Original result:
>
> outl 0xcf8 0x8000081c            outl 0xcf8 0x8000081c
> outb 0xcfc 0xc3                  outb 0xcfc 0xc3
> outl 0xcf8 0x8000082f            outl 0xcf8 0x8000082f
> outl 0xcf8 0x80000804            outl 0xcf8 0x80000804
> outl 0xcfc 0x9b2765be            outl 0xcfc 0x9b2765be
> write 0xc300001024 0x2 0x0055    write 0xc300001024 0x2 0x0055
> write 0xc300001028 0x1 0x5a      write 0xc300001028 0x1 0x5a
> write 0xc30000101c 0x1 0x01      write 0xc30000101c 0x1 0x01
> writel 0xc30000100c 0x2a6f6c63   writel 0xc30000100c 0x2a6f6c63
> write 0xc300001018 0x1 0xa4  <-- write 0xc300001016 0x3 0xa4a4a4
> write 0x5c 0x1 0x19              write 0x5c 0x1 0x19
> write 0xc300003002 0x1 0x8a      write 0xc300003002 0x1 0x8a
>

Can we wrap-around to the right when we hit the end of the input on the
left, instead of going byte-by-byte? Otherwise, i think we would need
O(n) operations to reach the leftmost in a write, rather than O(logN).

i.e.
xxxxuu ->
xxx xuu ->
xx xxuu ->
x xxxuu ->
xxxxu u

I think the case where we would need to wrap around the entire input
usually happens for smaller writes, so it shouldn't slow the minimizer
down too much

-Alex

> Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> ---
>  scripts/oss-fuzz/minimize_qtest_trace.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
> index d3b09e6567..855c3bcb54 100755
> --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> @@ -140,7 +140,7 @@ def minimize_trace(inpath, outpath):
>
>          # 3.) If it is a qtest write command: write addr len data, try to split
>          # it into two separate write commands. If splitting the write down the
> -        # middle does not work, try to move the pivot "left" and retry, until
> +        # rightmost does not work, try to move the pivot "left" and retry, until
>          # there is no space left. The idea is to prune unneccessary bytes from
>          # long writes, while accommodating arbitrary MemoryRegion access sizes
>          # and alignments.
> @@ -149,7 +149,7 @@ def minimize_trace(inpath, outpath):
>              length = int(newtrace[i].split()[2], 16)
>              data = newtrace[i].split()[3][2:]
>              if length > 1:
> -                leftlength = int(length/2)
> +                leftlength = length - 1
>                  rightlength = length - leftlength
>                  newtrace.insert(i+1, "")
>                  while leftlength > 0:
> --
> 2.25.1

