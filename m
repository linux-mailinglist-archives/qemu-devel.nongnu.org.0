Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F4D2ECA45
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 06:56:38 +0100 (CET)
Received: from localhost ([::1]:37612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxOHl-0003Dd-GD
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 00:56:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kxOG4-0002Qp-Cu
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 00:54:52 -0500
Received: from relay68.bu.edu ([128.197.228.73]:33014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kxOG2-0007Nf-I4
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 00:54:51 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 1075s8nW010641
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 7 Jan 2021 00:54:11 -0500
Date: Thu, 7 Jan 2021 00:54:08 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH v4 6/7] fuzz: add minimization options
Message-ID: <20210107055408.dj2fdn6rpjeucedn@mozz.bu.edu>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB1745F90579724DF1BCC3F18FFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ME3P282MB1745F90579724DF1BCC3F18FFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org, darren.kenny@oracle.com,
 bsd@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201229 1240, Qiuhao Li wrote:
> -M1: loop around the remove minimizer
> -M2: try setting bits in operand of write/out to zero
> Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

> ---
>  scripts/oss-fuzz/minimize_qtest_trace.py | 32 +++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
> index 70ac0c5366..a681984076 100755
> --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> @@ -16,6 +16,10 @@ QEMU_PATH = None
>  TIMEOUT = 5
>  CRASH_TOKEN = None
>  
> +# Minimization levels
> +M1 = False # loop around the remove minimizer
> +M2 = False # try setting bits in operand of write/out to zero
> +
>  write_suffix_lookup = {"b": (1, "B"),
>                         "w": (2, "H"),
>                         "l": (4, "L"),
> @@ -23,10 +27,20 @@ write_suffix_lookup = {"b": (1, "B"),
>  
>  def usage():
>      sys.exit("""\
> -Usage: QEMU_PATH="/path/to/qemu" QEMU_ARGS="args" {} input_trace output_trace
> +Usage:
> +
> +QEMU_PATH="/path/to/qemu" QEMU_ARGS="args" {} [Options] input_trace output_trace
> +
>  By default, will try to use the second-to-last line in the output to identify
>  whether the crash occred. Optionally, manually set a string that idenitifes the
>  crash by setting CRASH_TOKEN=
> +
> +Options:
> +
> +-M1: enable a loop around the remove minimizer, which may help decrease some
> +     timing dependant instructions. Off by default.
> +-M2: try setting bits in operand of write/out to zero. Off by default.
> +
>  """.format((sys.argv[0])))
>  
>  deduplication_note = """\n\
> @@ -213,24 +227,30 @@ def minimize_trace(inpath, outpath):
>      print("Setting the timeout for {} seconds".format(TIMEOUT))
>  
>      newtrace = trace[:]
> -
> +    global M1, M2
>      # remove minimizer
>      old_len = len(newtrace) + 1
>      while(old_len > len(newtrace)):
>          old_len = len(newtrace)
> +        print("trace lenth = ", old_len)
>          remove_minimizer(newtrace, outpath)
> +        if not M1 and not M2:
> +            break
>          newtrace = list(filter(lambda s: s != "", newtrace))
>      assert(check_if_trace_crashes(newtrace, outpath))
>  
> -    # set zero minimizer
> -    set_zero_minimizer(newtrace, outpath)
> +    if M2:
> +        set_zero_minimizer(newtrace, outpath)
>      assert(check_if_trace_crashes(newtrace, outpath))
>  
>  
>  if __name__ == '__main__':
>      if len(sys.argv) < 3:
>          usage()
> -
> +    if "-M1" in sys.argv:
> +        M1 = True
> +    if "-M2" in sys.argv:
> +        M2 = True
>      QEMU_PATH = os.getenv("QEMU_PATH")
>      QEMU_ARGS = os.getenv("QEMU_ARGS")
>      if QEMU_PATH is None or QEMU_ARGS is None:
> @@ -239,4 +259,4 @@ if __name__ == '__main__':
>      #     QEMU_ARGS += " -accel qtest"
>      CRASH_TOKEN = os.getenv("CRASH_TOKEN")
>      QEMU_ARGS += " -qtest stdio -monitor none -serial none "
> -    minimize_trace(sys.argv[1], sys.argv[2])
> +    minimize_trace(sys.argv[-2], sys.argv[-1])
> -- 
> 2.25.1
> 

