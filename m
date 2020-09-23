Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC6274FB3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 06:02:19 +0200 (CEST)
Received: from localhost ([::1]:55528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKvz0-0003S4-Fj
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 00:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@cn.fujitsu.com>)
 id 1kKvwh-0002O6-7p
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 23:59:55 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:32677
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@cn.fujitsu.com>) id 1kKvwf-0005SX-BO
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 23:59:54 -0400
X-IronPort-AV: E=Sophos;i="5.77,293,1596470400"; d="scan'208";a="99525182"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Sep 2020 11:59:48 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id C3DDE48990D2;
 Wed, 23 Sep 2020 11:59:47 +0800 (CST)
Received: from [10.167.226.45] (10.167.226.45) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 23 Sep 2020 11:59:46 +0800
Subject: Re: [PATCH v2 2/3] Reduce the time of checkpoint for COLO
To: leirao <lei.rao@intel.com>, <chen.zhang@intel.com>, <jasowang@redhat.com>, 
 <quintela@redhat.com>, <dgilbert@redhat.com>, <pbonzini@redhat.com>
References: <1600766690-94980-1-git-send-email-lei.rao@intel.com>
 <1600766690-94980-3-git-send-email-lei.rao@intel.com>
From: Li Zhijian <lizhijian@cn.fujitsu.com>
Message-ID: <25ac8057-c27d-d0e3-9b9f-7669c80e13f6@cn.fujitsu.com>
Date: Wed, 23 Sep 2020 11:59:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1600766690-94980-3-git-send-email-lei.rao@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.167.226.45]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C3DDE48990D2.AD4C8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@cn.fujitsu.com
Received-SPF: none client-ip=183.91.158.132;
 envelope-from=lizhijian@cn.fujitsu.com; helo=heian.cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:59:50
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/22/20 5:24 PM, leirao wrote:
> we should set ram_bulk_stage to false after ram_state_init,
> otherwise the bitmap will be unused in migration_bitmap_find_dirty.
> all pages in ram cache will be flushed to the ram of secondary guest
> for each checkpoint.
>
> Signed-off-by: leirao <lei.rao@intel.com>
> ---
>   migration/ram.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/migration/ram.c b/migration/ram.c
> index 76d4fee..59ff0cf 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3018,6 +3018,18 @@ static void decompress_data_with_multi_threads(QEMUFile *f,
>       qemu_mutex_unlock(&decomp_done_lock);
>   }
>   
> + /*
> +  * we must set ram_bulk_stage to fasle, otherwise in
a typo: s/fasle/false

Reviewed-by: Li Zhijian <lizhijian@cn.fujitsu.com>


> +  * migation_bitmap_find_dirty the bitmap will be unused and
> +  * all the pages in ram cache wil be flushed to the ram of
> +  * secondary VM.
> +  */
> +static void colo_init_ram_state(void)
> +{
> +    ram_state_init(&ram_state);
> +    ram_state->ram_bulk_stage = false;
> +}
> +
>   /*
>    * colo cache: this is for secondary VM, we cache the whole
>    * memory of the secondary VM, it is need to hold the global lock
> @@ -3061,7 +3073,7 @@ int colo_init_ram_cache(void)
>           }
>       }
>   
> -    ram_state_init(&ram_state);
> +    colo_init_ram_state();
>       return 0;
>   }
>   




