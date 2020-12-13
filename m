Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2A92D8F28
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 18:47:44 +0100 (CET)
Received: from localhost ([::1]:59922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koVTC-0006Bs-Ry
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 12:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVPx-0003HU-4a; Sun, 13 Dec 2020 12:44:21 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:57201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koVPv-0003wx-BN; Sun, 13 Dec 2020 12:44:20 -0500
Received: from [192.168.100.1] ([82.252.135.218]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mvbr4-1jw84g0SYQ-00sfOl; Sun, 13 Dec 2020 18:44:04 +0100
Subject: Re: [PATCH RESEND v2 3/7] elf2dmp/qemu_elf: Plug memleak in
 QEMU_Elf_init
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201023061218.2080844-1-kuhn.chenqun@huawei.com>
 <20201023061218.2080844-4-kuhn.chenqun@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1973545a-9f9b-94d0-fadd-ec7c24fd33b8@vivier.eu>
Date: Sun, 13 Dec 2020 18:44:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201023061218.2080844-4-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:p58boa6Au0Zq074pzjtd+QSW+aY5esRBlEpW4DZjNWtBh4NNflb
 ynODHtZQrSayjV4t9t4svDgTKsyDRtL+iw8QqMhVuaCneAvwWaCZ/v4WJCl8nbZiXLQA/tW
 +bjrmSyPhoKUz9edf7ztb0sAaMpVlQ6RqHoL8+rW67WQhHGM9WYwNKxcKx/ILqX4bm3s7gl
 wR9G5sfZmyPVyMIKKHOqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VWyE5Q6prgo=:FyvWkXUhBjycM9pKpLPrhO
 HWHAVTvtIXbKDTWADpwqp54xg9TU7GO6TznJf7nECWmH5CcF3QfeRjtbkSaxmrzjIySx+kCvw
 g+vjXa8tzT6UsUmvgYoRIOd7bK7coGuMaSi7I1KaFGrOCvCfvFSc9hbkJZxXprzMl29QhdLR6
 3RW7yCe46cBKnl4zcUxtDtrL25OzNNosBGq38hBtDBQRl/KxmCGlyVVkw0PiJo+rNssjUP+Rv
 /P8xTkgfrVfoLyWzjqjg3L6XuyVJM2wpuhlHpz21NIlhqqDkpWtYSN2rBFABi1XTDcQqqVP11
 IEYqNKZQ0LTUV3Q5cRMObh0dfO1H7XNoqiUfrG5nJ/85lnaxhglLXbcGkbcg9GFCVk36+P4+3
 zhLhmkyO7UJTCDrtVfAa59CUmIA42KzuY+v4FgU6EfVKin3AScDzVEjTWnMS23hWPV2P3kjFS
 RuRccABCDw==
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
Cc: lvivier@redhat.com, zhang.zhanghailiang@huawei.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, Li Qiang <liq3ea@gmail.com>,
 pannengyuan@huawei.com, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/10/2020 à 08:12, Chen Qun a écrit :
> From: Pan Nengyuan <pannengyuan@huawei.com>
> 
> Missing g_error_free in QEMU_Elf_init() error path. Fix that.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> Reviewed-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> Reviewed-by: Li Qiang <liq3ea@gmail.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
>  contrib/elf2dmp/qemu_elf.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/contrib/elf2dmp/qemu_elf.c b/contrib/elf2dmp/qemu_elf.c
> index 0db7816586..b601b6d7ba 100644
> --- a/contrib/elf2dmp/qemu_elf.c
> +++ b/contrib/elf2dmp/qemu_elf.c
> @@ -126,6 +126,7 @@ int QEMU_Elf_init(QEMU_Elf *qe, const char *filename)
>      qe->gmf = g_mapped_file_new(filename, TRUE, &gerr);
>      if (gerr) {
>          eprintf("Failed to map ELF dump file \'%s\'\n", filename);
> +        g_error_free(gerr);
>          return 1;
>      }
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

