Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C75558ACED
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:11:06 +0200 (CEST)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJyye-00014a-Tv
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1oJyx9-00079s-0e; Fri, 05 Aug 2022 11:09:31 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:56382
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1oJyx6-0005YR-Uf; Fri, 05 Aug 2022 11:09:30 -0400
Received: from [192.168.178.59] (p57b42628.dip0.t-ipconnect.de [87.180.38.40])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 40400DA0EBF;
 Fri,  5 Aug 2022 17:09:25 +0200 (CEST)
Message-ID: <ba123d50-002a-3b33-a2f6-e530df5a4265@weilnetz.de>
Date: Fri, 5 Aug 2022 17:09:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org
References: <20220805145617.952881-1-bmeng.cn@gmail.com>
 <20220805145617.952881-2-bmeng.cn@gmail.com>
Subject: Re: [PATCH 2/2] util/aio-win32: Correct the event array size in
 aio_poll()
In-Reply-To: <20220805145617.952881-2-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>

Am 05.08.22 um 16:56 schrieb Bin Meng:

> From: Bin Meng <bin.meng@windriver.com>
>
> WaitForMultipleObjects() can only wait for MAXIMUM_WAIT_OBJECTS
> object handles. Correct the event array size in aio_poll() and
> add a assert() to ensure it does not cause out of bound access.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>   util/aio-win32.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/util/aio-win32.c b/util/aio-win32.c
> index 44003d645e..8cf5779567 100644
> --- a/util/aio-win32.c
> +++ b/util/aio-win32.c
> @@ -326,7 +326,7 @@ void aio_dispatch(AioContext *ctx)
>   bool aio_poll(AioContext *ctx, bool blocking)
>   {
>       AioHandler *node;
> -    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
> +    HANDLE events[MAXIMUM_WAIT_OBJECTS];
>       bool progress, have_select_revents, first;
>       int count;
>       int timeout;
> @@ -369,6 +369,7 @@ bool aio_poll(AioContext *ctx, bool blocking)
>       QLIST_FOREACH_RCU(node, &ctx->aio_handlers, node) {
>           if (!node->deleted && node->io_notify
>               && aio_node_check(ctx, node->is_external)) {
> +            assert(count < MAXIMUM_WAIT_OBJECTS);


Would using g_assert for new code be better? Currently the rest of that 
file (and most QEMU code) uses assert.

count could also be changed from int to unsigned (which matches better 
to the unsigned DWORD).

Reviewed-by: Stefan Weil <sw@weilnetz.de>



