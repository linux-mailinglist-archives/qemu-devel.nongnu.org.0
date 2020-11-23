Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C212BFE31
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 03:34:12 +0100 (CET)
Received: from localhost ([::1]:39592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh1gB-0006mx-ET
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 21:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kh1ep-00068P-Cg; Sun, 22 Nov 2020 21:32:47 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kh1em-00087C-Dq; Sun, 22 Nov 2020 21:32:47 -0500
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4CfWPs59nvz4x0m;
 Mon, 23 Nov 2020 10:32:01 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Mon, 23 Nov 2020 10:32:25 +0800
Received: from [10.174.185.187] (10.174.185.187) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Mon, 23 Nov 2020 10:32:25 +0800
Subject: Re: [PATCH] ui/vnc: Add missing lock for send_color_map
To: <qemu-devel@nongnu.org>
References: <20201116141338.148911-1-liangpeng10@huawei.com>
From: Peng Liang <liangpeng10@huawei.com>
Message-ID: <cc6ce1e8-3052-a4d6-fdfd-8ac07f527133@huawei.com>
Date: Mon, 23 Nov 2020 10:32:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201116141338.148911-1-liangpeng10@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.187]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=liangpeng10@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: zhang.zhanghailiang@huawei.com, qemu-stable@nongnu.org,
 xiexiangyou@huawei.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping.

On 11/16/2020 10:13 PM, Peng Liang wrote:
> vnc_write() should be locked after the RFB protocol is initialized.
> 
> Fixes: 0c426e4534b4 ("vnc: Add support for color map")
> Cc: qemu-stable@nongnu.org
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
> ---
>  ui/vnc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 49235056f7a8..ca3fc376aeb5 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -2156,6 +2156,7 @@ static void send_color_map(VncState *vs)
>  {
>      int i;
>  
> +    vnc_lock_output(vs);
>      vnc_write_u8(vs, VNC_MSG_SERVER_SET_COLOUR_MAP_ENTRIES);
>      vnc_write_u8(vs,  0);    /* padding     */
>      vnc_write_u16(vs, 0);    /* first color */
> @@ -2168,6 +2169,7 @@ static void send_color_map(VncState *vs)
>          vnc_write_u16(vs, (((i >> pf->gshift) & pf->gmax) << (16 - pf->gbits)));
>          vnc_write_u16(vs, (((i >> pf->bshift) & pf->bmax) << (16 - pf->bbits)));
>      }
> +    vnc_unlock_output(vs);
>  }
>  
>  static void set_pixel_format(VncState *vs, int bits_per_pixel,
> 

Thanks,
Peng

