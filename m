Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED732EF6D2
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 18:56:04 +0100 (CET)
Received: from localhost ([::1]:39124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxvzX-0006EY-Dw
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 12:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1kxvyA-0005TU-Fs
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:54:38 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:50286
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1kxvy8-0005RX-VK
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:54:38 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id 9AF19123391; Fri,  8 Jan 2021 09:54:34 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 8F8AF123390;
 Fri,  8 Jan 2021 09:54:32 -0800 (PST)
Date: Fri, 8 Jan 2021 09:54:31 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] Makefile: add GNU global tags support
Message-ID: <20210108175431.tbf2bqizx4dx6vda@mail.bwidawsk.net>
References: <20210108121935.640-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210108121935.640-1-alex.bennee@linaro.org>
Received-SPF: none client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.144,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-08 12:19:35, Alex Bennée wrote:
> GNU Global is another tags engine which is more like cscope in being
> able to support finding both references and definitions. You will be
> un-surprised to know it also integrates well with Emacs.
> 
> The main benefit of integrating it into find-src-path is it takes less
> time to rebuild the database from scratch when you have a lot of build
> directories under your source tree.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

It might be worth mentioning that the Linux kernel has supported this for a long
time now (10+ years).

Having switched to gtags about 3 years ago, I think it's summarily better and
would really like this to get merged.

> ---
>  Makefile   | 9 ++++++++-
>  .gitignore | 3 +++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index fb9923ff22..66eec99685 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -253,6 +253,13 @@ ctags:
>  	rm -f "$(SRC_PATH)/"tags
>  	$(find-src-path) -exec ctags -f "$(SRC_PATH)/"tags --append {} +
>  
> +.PHONY: gtags
> +gtags:
> +	rm -f "$(SRC_PATH)/"GTAGS
> +	rm -f "$(SRC_PATH)/"GRTAGS
> +	rm -f "$(SRC_PATH)/"GPATH
> +	$(find-src-path) | gtags -f -
> +
>  .PHONY: TAGS
>  TAGS:
>  	rm -f "$(SRC_PATH)/"TAGS
> @@ -279,7 +286,7 @@ help:
>  	$(call print-help,all,Build all)
>  	$(call print-help,dir/file.o,Build specified target only)
>  	$(call print-help,install,Install QEMU, documentation and tools)
> -	$(call print-help,ctags/TAGS,Generate tags file for editors)
> +	$(call print-help,ctags/gtags/TAGS,Generate tags file for editors)
>  	$(call print-help,cscope,Generate cscope index)
>  	$(call print-help,sparse,Run sparse on the QEMU source)
>  	@echo  ''
> diff --git a/.gitignore b/.gitignore
> index b32bca1315..75a4be0724 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -7,6 +7,9 @@
>  cscope.*
>  tags
>  TAGS
> +GPATH
> +GRTAGS
> +GTAGS
>  *~
>  *.ast_raw
>  *.depend_raw
> -- 
> 2.20.1
> 
> 

