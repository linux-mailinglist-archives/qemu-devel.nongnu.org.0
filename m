Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E791C3C39
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 16:03:02 +0200 (CEST)
Received: from localhost ([::1]:34242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVbgT-0006qE-7s
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 10:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jVben-0005dB-NB
 for qemu-devel@nongnu.org; Mon, 04 May 2020 10:01:17 -0400
Received: from relay64.bu.edu ([128.197.228.104]:58835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jVbem-00055A-7H
 for qemu-devel@nongnu.org; Mon, 04 May 2020 10:01:16 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 044E02l9025534
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 4 May 2020 10:00:05 -0400
Date: Mon, 4 May 2020 10:00:02 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] chardev: enable distinct input for -chardev file
Message-ID: <20200504140002.vszohd2m5dlkkuse@mozz.bu.edu>
References: <20200501172559.6470-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501172559.6470-1-alxndr@bu.edu>
User-Agent: NeoMutt/20180716
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 10:01:13
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 200501 1325, Alexander Bulekov wrote:
...
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 292d4e7c0c..bbb091872f 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2938,7 +2938,7 @@ DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
>      "-chardev vc,id=id[[,width=width][,height=height]][[,cols=cols][,rows=rows]]\n"
>      "         [,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>      "-chardev ringbuf,id=id[,size=size][,logfile=PATH][,logappend=on|off]\n"
> -    "-chardev file,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
> +    "-chardev file,id=id,path=path[,in=PATH][,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>      "-chardev pipe,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>  #ifdef _WIN32
>      "-chardev console,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
> @@ -3137,13 +3137,16 @@ The available backends are:
>      Create a ring buffer with fixed size ``size``. size must be a power
>      of two and defaults to ``64K``.
>  
> -``-chardev file,id=id,path=path``
> +``-chardev file,id=id,path=path,in=in``

Just noticed that this should be  
-chardev file,id=id,path=path,[in=in]
I'll fix it in v2.

-Alex

>      Log all traffic received from the guest to a file.
>  
>      ``path`` specifies the path of the file to be opened. This file will
>      be created if it does not already exist, and overwritten if it does.
>      ``path`` is required.
>  
> +    ``in`` specifies a separate file as the input to the chardev. If
> +    ``in`` is omitted, ``path`` is used for both input and output
> +
>  ``-chardev pipe,id=id,path=path``
>      Create a two-way connection to the guest. The behaviour differs
>      slightly between Windows hosts and other hosts:
> -- 
> 2.26.2
> 

