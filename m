Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2672EC961
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 05:31:01 +0100 (CET)
Received: from localhost ([::1]:58980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxMwu-0006th-2u
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 23:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kxMvk-0006UL-NR
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 23:29:48 -0500
Received: from relay64.bu.edu ([128.197.228.104]:44776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kxMvi-0000It-UT
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 23:29:48 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 1074SYYw017643
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 6 Jan 2021 23:28:37 -0500
Date: Wed, 6 Jan 2021 23:28:34 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH v4 3/7] fuzz: split write operand using binary approach
Message-ID: <20210107042834.jquwmfoqbc4nqorl@mozz.bu.edu>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB174580AA2D8580EDFF256757FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ME3P282MB174580AA2D8580EDFF256757FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org, darren.kenny@oracle.com,
 bsd@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201229 1240, Qiuhao Li wrote:
> Currently, we split the write commands' data from the middle. If it does not
> work, try to move the pivot left by one byte and retry until there is no
> space.
> 
> But, this method has two flaws:
> 
> 1. It may fail to trim all unnecessary bytes on the right side.
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
> 2. The algorithm complexity is O(n) since we move the pivot byte by byte.
> 
> To solve the first issue, we can try a symmetrical position on the right if
> we fail on the left. As for the second issue, instead moving by one byte, we
> can approach the boundary exponentially, achieving O(log(n)).
> 
> Give an example:
> 
>                    xxxxuu len=6
>                         +
>                         |
>                         +
>                  xxx,xuu 6/2=3 fail
>                         +
>          +--------------+-------------+
>          |                            |
>          +                            +
>   xx,xxuu 6/2^2=1 fail         xxxxu,u 6-1=5 success
>                                  +   +
>          +------------------+----+   |
>          |                  |        +-------------+ u removed
>          +                  +
>    xx,xxu 5/2=2 fail  xxxx,u 6-2=4 success
>                            +
>                            |
>                            +-----------+ u removed
> 
> In some rare case, this algorithm will fail to trim all unnecessary bytes:
> 
>   xxxxxxxxxuxxxxxx
>   xxxxxxxx-xuxxxxxx Fail
>   xxxx-xxxxxuxxxxxx Fail
>   xxxxxxxxxuxx-xxxx Fail
>   ...
> 
> I think the trade-off is worth it.
> 
> Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

> ---
>  scripts/oss-fuzz/minimize_qtest_trace.py | 29 ++++++++++++++++--------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
> index 0b665ae657..1a26bf5b93 100755
> --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> @@ -94,7 +94,7 @@ def minimize_trace(inpath, outpath):
>          prior = newtrace[i:i+remove_step]
>          for j in range(i, i+remove_step):
>              newtrace[j] = ""
> -        print("Removing {lines} ...".format(lines=prior))
> +        print("Removing {lines} ...\n".format(lines=prior))
>          if check_if_trace_crashes(newtrace, outpath):
>              i += remove_step
>              # Double the number of lines to remove for next round
> @@ -107,9 +107,11 @@ def minimize_trace(inpath, outpath):
>              remove_step = 1
>              continue
>          newtrace[i] = prior[0] # remove_step = 1
> +
>          # 2.) Try to replace write{bwlq} commands with a write addr, len
>          # command. Since this can require swapping endianness, try both LE and
>          # BE options. We do this, so we can "trim" the writes in (3)
> +
>          if (newtrace[i].startswith("write") and not
>              newtrace[i].startswith("write ")):
>              suffix = newtrace[i].split()[0][-1]
> @@ -130,11 +132,15 @@ def minimize_trace(inpath, outpath):
>                  newtrace[i] = prior[0]
>  
>          # 3.) If it is a qtest write command: write addr len data, try to split
> -        # it into two separate write commands. If splitting the write down the
> -        # middle does not work, try to move the pivot "left" and retry, until
> -        # there is no space left. The idea is to prune unneccessary bytes from
> -        # long writes, while accommodating arbitrary MemoryRegion access sizes
> -        # and alignments.
> +        # it into two separate write commands. If splitting the data operand
> +        # from length/2^n bytes to the left does not work, try to move the pivot
> +        # to the right side, then add one to n, until length/2^n == 0. The idea
> +        # is to prune unneccessary bytes from long writes, while accommodating
> +        # arbitrary MemoryRegion access sizes and alignments.
> +
> +        # This algorithm will fail under some rare situations.
> +        # e.g., xxxxxxxxxuxxxxxx (u is the unnecessary byte)
> +
>          if newtrace[i].startswith("write "):
>              addr = int(newtrace[i].split()[1], 16)
>              length = int(newtrace[i].split()[2], 16)
> @@ -143,6 +149,7 @@ def minimize_trace(inpath, outpath):
>                  leftlength = int(length/2)
>                  rightlength = length - leftlength
>                  newtrace.insert(i+1, "")
> +                power = 1
>                  while leftlength > 0:
>                      newtrace[i] = "write {addr} {size} 0x{data}\n".format(
>                              addr=hex(addr),
> @@ -154,9 +161,13 @@ def minimize_trace(inpath, outpath):
>                              data=data[leftlength*2:])
>                      if check_if_trace_crashes(newtrace, outpath):
>                          break
> -                    else:
> -                        leftlength -= 1
> -                        rightlength += 1
> +                    # move the pivot to right side
> +                    if leftlength < rightlength:
> +                        rightlength, leftlength = leftlength, rightlength
> +                        continue
> +                    power += 1
> +                    leftlength = int(length/pow(2, power))
> +                    rightlength = length - leftlength
>                  if check_if_trace_crashes(newtrace, outpath):
>                      i -= 1
>                  else:
> -- 
> 2.25.1
> 

