Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB962D8F2D
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 18:53:42 +0100 (CET)
Received: from localhost ([::1]:43606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koVYz-00036A-PL
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 12:53:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVWZ-0001jZ-LN; Sun, 13 Dec 2020 12:51:11 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:33557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVWX-0004kN-Qy; Sun, 13 Dec 2020 12:51:11 -0500
Received: from [192.168.100.1] ([82.252.135.218]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mzz6s-1jri82473W-00x2Sp; Sun, 13 Dec 2020 18:50:53 +0100
Subject: Re: [PATCH RESEND v2 6/7] blockdev: Fix a memleak in
 drive_backup_prepare()
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201023061218.2080844-1-kuhn.chenqun@huawei.com>
 <20201023061218.2080844-7-kuhn.chenqun@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <cfa4b934-66e3-9c08-a7ab-9b23aa999dfc@vivier.eu>
Date: Sun, 13 Dec 2020 18:50:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201023061218.2080844-7-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YnIZk7i0lm0le/12WpUq277Mzx7pIXIYdHt3bdAtkZheSbWsWKx
 Xt81xANMFj4Dh3bCY6aRX2OBQis13Wcrv/ecjfYn8TfZtiimm7u1BVVrDlgVWdlDDzggRg2
 Es/l0cbboiMmXJLcNcr58T5sBhKUKrOm+gu2x7pKfiGB1DkZG89uwk+iWCMFzYtqeCF5Z83
 9JBX/cUs9KTtewQT+9/Wg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+MaX2wNA/kc=:B80c6Mb/VEFQ/OrXN9jkn1
 juCiZLcVlxL8zwU772QW2HG/GOqFel3AD562BksNDjWQVOLdSboX/6d0UQ3WqNqgRR7dfAa4C
 zM3BLKchGEKnknd4tJiPmA/2JyPMEGk0geKG66bwcbrytbJWbJ0IlmK4NYMEvzimz+AF9gO7p
 sUMxrakx8JblYHVyPzZgxxA28ubTePCrO+VI48bjGSPYmznFSmBx280OjCCi+gHuFWRrt00/y
 sKxnZ9XZtZbiy/lcgkIeXjTmO7netbmCEp/cuH0MU2mLPJbuHmlhRIuqt3W+VBKWkF6+bnvNO
 Vd1XGvdy2AYmNLOMhZ/xtYXnfhoFm8vYuym4jKSCfCJoIQxdjAVK7X2i30v8/VKN5lbWatnVA
 sdP9plhrEJG847iNu7LDdN4L6Qqkf6pF5VOZ0+OzFftJ9jYfS88HnG8aJlqukLRcAusRDms0s
 MTvLdGv7Vw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/10/2020 à 08:12, Chen Qun a écrit :
> From: Pan Nengyuan <pannengyuan@huawei.com>
> 
> 'local_err' seems forgot to propagate in error path, it'll cause
> a memleak. Fix it.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Li Qiang <liq3ea@gmail.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
>  blockdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/blockdev.c b/blockdev.c
> index fe6fb5dc1d..6fd68f74f3 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -1827,6 +1827,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
>      if (set_backing_hd) {
>          bdrv_set_backing_hd(target_bs, source, &local_err);
>          if (local_err) {
> +            error_propagate(errp, local_err);
>              goto unref;
>          }
>      }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


