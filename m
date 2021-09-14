Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A5F40A864
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 09:45:23 +0200 (CEST)
Received: from localhost ([::1]:45072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ384-0004bY-BW
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 03:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1mQ36h-0003lZ-2P; Tue, 14 Sep 2021 03:43:55 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1mQ36e-00083w-Bl; Tue, 14 Sep 2021 03:43:54 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H7wGb1ZsqzbmWd;
 Tue, 14 Sep 2021 15:39:35 +0800 (CST)
Received: from kwepeml500004.china.huawei.com (7.221.188.141) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 14 Sep 2021 15:43:38 +0800
Received: from [10.174.187.138] (10.174.187.138) by
 kwepeml500004.china.huawei.com (7.221.188.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 14 Sep 2021 15:43:37 +0800
Message-ID: <614052A9.4060107@huawei.com>
Date: Tue, 14 Sep 2021 15:43:37 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH V2] util: Remove redundant checks in the openpty()
References: <5F9FE5B8.1030803@huawei.com>
In-Reply-To: <5F9FE5B8.1030803@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepeml500004.china.huawei.com (7.221.188.141)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=alex.chen@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, yebiaoxiang@huawei.com,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This patch has been reviewed by Peter. who can help merge it?

Thanks,
Alex

On 2020/11/2 18:55, AlexChen wrote:
> As we can see from the following function call stack, amaster and aslave
> can not be NULL: char_pty_open() -> qemu_openpty_raw() -> openpty().
> In addition, according to the API specification for openpty():
> https://www.gnu.org/software/libc/manual/html_node/Pseudo_002dTerminal-Pairs.html,
> the arguments name, termp and winp can all be NULL, but arguments amaster or aslave
> can not be NULL.
> Finally, amaster and aslave has been dereferenced at the beginning of the openpty().
> So the checks on amaster and aslave in the openpty() are redundant. Remove them.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  util/qemu-openpty.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/util/qemu-openpty.c b/util/qemu-openpty.c
> index eb17f5b0bc..427f43a769 100644
> --- a/util/qemu-openpty.c
> +++ b/util/qemu-openpty.c
> @@ -80,10 +80,9 @@ static int openpty(int *amaster, int *aslave, char *name,
>              (termp != NULL && tcgetattr(sfd, termp) < 0))
>                  goto err;
> 
> -        if (amaster)
> -                *amaster = mfd;
> -        if (aslave)
> -                *aslave = sfd;
> +        *amaster = mfd;
> +        *aslave = sfd;
> +
>          if (winp)
>                  ioctl(sfd, TIOCSWINSZ, winp);
> 


