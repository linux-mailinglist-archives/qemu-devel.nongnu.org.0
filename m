Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668552D8F2A
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 18:51:39 +0100 (CET)
Received: from localhost ([::1]:40002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koVX0-0001Us-GQ
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 12:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVSG-0005tF-Mr; Sun, 13 Dec 2020 12:46:44 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:52241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVSB-0004GW-P0; Sun, 13 Dec 2020 12:46:44 -0500
Received: from [192.168.100.1] ([82.252.135.218]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M6URd-1kmZVR08rZ-006zlE; Sun, 13 Dec 2020 18:46:24 +0100
Subject: Re: [PATCH RESEND v2 7/7] block/file-posix: fix a possible undefined
 behavior
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201023061218.2080844-1-kuhn.chenqun@huawei.com>
 <20201023061218.2080844-8-kuhn.chenqun@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <300b4b01-9eb5-d2b8-8032-9910f84e825c@vivier.eu>
Date: Sun, 13 Dec 2020 18:46:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201023061218.2080844-8-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rDDD4+ovKDCZQf8gnulGX2SuJG5erPQT646luEI5cHUc6gHuU4Y
 qfj/bzVfGKKRQplOokh4KHfw6D9Sxt/Nh0LDIvM6zpyneBnVTYIPB2TQgDWhWXS0UuyJb8D
 fF9QnatQ3kthRhDenMvNokh6YC0E5kY/5vna0C8i8LkXml3bqUVBDdlsb5bH6EF/CkEmfaE
 SktUiL4uU4ev9INTxr2nQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cQDvoLySKSs=:SuVabJ+wzGIQF6t3fC0rae
 fN8+9SGe9cuv8rugjajwTL5g2AZObFayEqsCVVEhJK19AvAx+7Oi2/fOXoma3eyCWDgr58kus
 4iQI5GAdbweGUcLgURqaglLApAgKg9aF2gpSrz57DTCkdvLzQbbPLjDi0OqdNr0wwXqVsZ5qj
 H92mCVdc7xlPyE83AKacTIY600efoL1YnKLTTT3/AD+4J3C5r16KVZ3LhlMZ/wwLbXnUvm2oJ
 uWuC7cGGy9s00O8Uj1/iViN7+eXQkfCC+Yln5FcBL+6UDvWpu91e2mx/YR2UypUen7WJJ+Zt1
 kpeMazUQSGhycX5EO5jdmoZltOPXjutroWan4gis4s7h9a773xkuDCd5Ypu6ohvBxC5DFRJ1g
 maCJSvp4ylunI8vrXFa1ibAwbNvHFR9fcoPsJYTvlbfen0Qsvro2RNBCFi0gbVgf3kdWdO9OT
 0L9VaZ7c7w==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 zhang.zhanghailiang@huawei.com, pannengyuan@huawei.com,
 Li Qiang <liq3ea@gmail.com>, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/10/2020 à 08:12, Chen Qun a écrit :
> From: Pan Nengyuan <pannengyuan@huawei.com>
> 
> local_err is not initialized to NULL, it will cause a assert error as below:
> qemu/util/error.c:59: error_setv: Assertion `*errp == NULL' failed.
> 
> Fixes: c6447510690
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Li Qiang <liq3ea@gmail.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
>  block/file-posix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index c63926d592..b711124672 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -2110,7 +2110,7 @@ static void raw_aio_attach_aio_context(BlockDriverState *bs,
>  #endif
>  #ifdef CONFIG_LINUX_IO_URING
>      if (s->use_linux_io_uring) {
> -        Error *local_err;
> +        Error *local_err = NULL;
>          if (!aio_setup_linux_io_uring(new_context, &local_err)) {
>              error_reportf_err(local_err, "Unable to use linux io_uring, "
>                                           "falling back to thread pool: ");
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


