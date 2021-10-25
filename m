Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822C7438F9A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 08:39:20 +0200 (CEST)
Received: from localhost ([::1]:54116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1metde-0001os-T4
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 02:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1metWZ-0000l2-2d; Mon, 25 Oct 2021 02:31:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1metWK-0000ot-Jg; Mon, 25 Oct 2021 02:31:58 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E4D37407BB;
 Mon, 25 Oct 2021 09:31:31 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 073A2141;
 Mon, 25 Oct 2021 09:31:32 +0300 (MSK)
Subject: Re: [PATCH] block/export/fuse.c: fix musl build
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, qemu-devel@nongnu.org
References: <20211022095209.1319671-1-fontaine.fabrice@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <6168250e-9bd6-a672-4f1f-b1ecf8f8cd4c@msgid.tls.msk.ru>
Date: Mon, 25 Oct 2021 09:31:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211022095209.1319671-1-fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.33,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.10.2021 12:52, Fabrice Fontaine пишет:
> Include linux/falloc.h if CONFIG_FALLOCATE_ZERO_RANGE is defined to fix
> https://gitlab.com/qemu-project/qemu/-/commit/50482fda98bd62e072c30b7ea73c985c4e9d9bbb
> and avoid the following build failure on musl:
> 
> ../block/export/fuse.c: In function 'fuse_fallocate':
> ../block/export/fuse.c:643:21: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
>    643 |     else if (mode & FALLOC_FL_ZERO_RANGE) {
>        |                     ^~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/be24433a429fda681fb66698160132c1c99bc53b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   block/export/fuse.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/block/export/fuse.c b/block/export/fuse.c
> index 2e3bf8270b..823c126d23 100644
> --- a/block/export/fuse.c
> +++ b/block/export/fuse.c
> @@ -31,6 +31,10 @@
>   #include <fuse.h>
>   #include <fuse_lowlevel.h>
>   
> +#if defined(CONFIG_FALLOCATE_ZERO_RANGE)

shouldn't it be "if !defined" ?

/mjt

> +#include <linux/falloc.h>
> +#endif
> +
>   #ifdef __linux__
>   #include <linux/fs.h>
>   #endif
> 


