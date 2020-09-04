Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2CB25CEF4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 03:06:37 +0200 (CEST)
Received: from localhost ([::1]:56744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE0BY-00055G-3a
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 21:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kE09z-0002RD-GE
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 21:04:59 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4677 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kE09x-0002jR-CS
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 21:04:59 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 07104F7496714BEE0720;
 Fri,  4 Sep 2020 09:04:46 +0800 (CST)
Received: from [127.0.0.1] (10.174.187.160) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0;
 Fri, 4 Sep 2020 09:04:39 +0800
Message-ID: <5F5192A7.4030805@huawei.com>
Date: Fri, 4 Sep 2020 09:04:39 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: Re: elf2dmp: Fix memory leak on main() error paths
References: <5F463659.8080101@huawei.com>
In-Reply-To: <5F463659.8080101@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.160]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 21:04:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.403,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhengchuan@huawei.com, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping.

On 2020/8/26 18:15, AlexChen wrote:
> From: AlexChen <alex.chen@huawei.com>
> 
> The 'kdgb' is allocating memory in get_kdbg(), but it is not freed
> in both fill_header() and fill_context() failed branches, fix it.
> 
> Signed-off-by: AlexChen <alex.chen@huawei.com>
> ---
>  contrib/elf2dmp/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
> index 9a2dbc2902..ac746e49e0 100644
> --- a/contrib/elf2dmp/main.c
> +++ b/contrib/elf2dmp/main.c
> @@ -568,12 +568,12 @@ int main(int argc, char *argv[])
>      if (fill_header(&header, &ps, &vs, KdDebuggerDataBlock, kdbg,
>              KdVersionBlock, qemu_elf.state_nr)) {
>          err = 1;
> -        goto out_pdb;
> +        goto out_kdbg;
>      }
> 
>      if (fill_context(kdbg, &vs, &qemu_elf)) {
>          err = 1;
> -        goto out_pdb;
> +        goto out_kdbg;
>      }
> 
>      if (write_dump(&ps, &header, argv[2])) {
> 



