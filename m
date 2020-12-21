Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0C92E019B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 21:39:43 +0100 (CET)
Received: from localhost ([::1]:50660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krRy2-0003L5-Pk
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 15:39:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1krRuh-0008EJ-PU
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 15:36:16 -0500
Received: from relay68.bu.edu ([128.197.228.73]:39980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1krRue-0003rf-Os
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 15:36:15 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 0BLKZhBX006631
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 21 Dec 2020 15:35:46 -0500
Date: Mon, 21 Dec 2020 15:35:43 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH 3/4] fuzz: setting bits in operand of out/write to zero
Message-ID: <20201221203543.vlezaw2sxiq7wpde@mozz.bu.edu>
References: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB149243C4D0FE93B71E6B8AA6FCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ME3P282MB149243C4D0FE93B71E6B8AA6FCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
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
> Simplifying the crash cases by opportunistically setting bits in
> operands of
> out/write to zero may help to debug, since usually bit one means turn on
> or
> trigger a function while zero is the default turn-off setting.
> 
> Tested Bug 1908062. Refined vs. Original result:
> 
> outl 0xcf8 0x8000081c            outl 0xcf8 0x8000081c
> outb 0xcfc 0xc3                  outb 0xcfc 0xc3
> outl 0xcf8 0x0               <-- outl 0xcf8 0x8000082f
> outl 0xcf8 0x80000804            outl 0xcf8 0x80000804
> outl 0xcfc 0x10000006        <-- outl 0xcfc 0x9b2765be
> write 0xc300001024 0x2 0x10  <-- write 0xc300001024 0x2 0x0055
> write 0xc300001028 0x1 0x5a      write 0xc300001028 0x1 0x5a
> write 0xc30000101c 0x1 0x01      write 0xc30000101c 0x1 0x01
> writel 0xc30000100c 0x2a6f6c63   writel 0xc30000100c 0x2a6f6c63
> write 0xc300001018 0x1 0x80  <-- write 0xc300001018 0x1 0xa4
> write 0x5c 0x1 0x10          <-- write 0x5c 0x1 0x19
> write 0xc300003002 0x1 0x0   <-- write 0xc300003002 0x1 0x8a
> 
> Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>

Looks good. One nit below.

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>


> ---
>  scripts/oss-fuzz/minimize_qtest_trace.py | 42 +++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
> index 855c3bcb54..f3e88064c4 100755
> --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> @@ -172,7 +172,47 @@ def minimize_trace(inpath, outpath):
>                      newtrace[i] = prior
>                      del newtrace[i+1]
>          i += 1
> -    check_if_trace_crashes(newtrace, outpath)
> +
> +    assert(check_if_trace_crashes(newtrace, outpath))
> +
> +    TIMEOUT = (end-start)*2 # input is short now
> +
> +    # try setting bits in operands of out/write to zero
> +    i = 0
> +    while i < len(newtrace):
> +        if (not newtrace[i].startswith("write ") and not
> +           newtrace[i].startswith("out")):
> +           i += 1
> +           continue
> +        # write ADDR SIZE DATA
> +        # outx ADDR VALUE
> +        print("\nzero setting bits: {}".format(newtrace[i]))
> +
> +        prefix = " ".join(newtrace[i].split()[:-1])
> +        data = newtrace[i].split()[-1]
> +        data_bin = bin(int(data, 16))
> +        data_bin_list = list(data_bin)
> +
> +        for j in range(2, len(data_bin_list)):
> +            prior = newtrace[i]
> +            if (data_bin_list[j] == '1'):
> +                data_bin_list[j] = '0'
> +                data_try = hex(int("".join(data_bin_list), 2))
> +                # It seems qtest only accect hex with one byte zero padding
                                         ^^ "accepts padded hex-values."

> +                if len(data_try) % 2 == 1:
> +                    data_try = data_try[:2] + "0" + data_try[2:-1]
> +
> +                newtrace[i] = "{prefix} {data_try}\n".format(
> +                        prefix=prefix,
> +                        data_try=data_try)
> +
> +                if not check_if_trace_crashes(newtrace, outpath):
> +                    data_bin_list[j] = '1'
> +                    newtrace[i] = prior
> +
> +        i += 1
> +
> +    assert(check_if_trace_crashes(newtrace, outpath))
>  
>  
>  if __name__ == '__main__':
> -- 
> 2.25.1
> 

