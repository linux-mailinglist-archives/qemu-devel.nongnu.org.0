Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C062832F919
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 10:12:10 +0100 (CET)
Received: from localhost ([::1]:59534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lISyn-0002Qy-Pu
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 04:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lISvj-0008RR-7h
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 04:08:59 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lISvh-0000fL-JJ
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 04:08:59 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DszJC5Ztkz16H3S;
 Sat,  6 Mar 2021 17:07:07 +0800 (CST)
Received: from [10.174.186.51] (10.174.186.51) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Sat, 6 Mar 2021 17:08:41 +0800
From: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH v2 2/2] migration/tls: add error handling in
 multifd_tls_handshake_thread
To: Hao Wang <wanghao232@huawei.com>, <quintela@redhat.com>,
 <dgilbert@redhat.com>, <berrange@redhat.com>
References: <20210209104237.2250941-1-wanghao232@huawei.com>
 <20210209104237.2250941-3-wanghao232@huawei.com>
Message-ID: <0e5f64b3-6035-1636-6ffe-51550666089e@huawei.com>
Date: Sat, 6 Mar 2021 17:08:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210209104237.2250941-3-wanghao232@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.chen@huawei.com, yubihong@huawei.com, zhang.zhanghailiang@huawei.com,
 xiexiangyou@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>

On 2021/2/9 18:42, Hao Wang wrote:
> If any error happens during multifd send thread creating (e.g. channel broke
> because new domain is destroyed by the dst), multifd_tls_handshake_thread
> may exit silently, leaving main migration thread hanging (ram_save_setup ->
> multifd_send_sync_main -> qemu_sem_wait(&p->sem_sync)).
> Fix that by adding error handling in multifd_tls_handshake_thread.
> 
> Signed-off-by: Hao Wang <wanghao232@huawei.com>
> ---
>  migration/multifd.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 2a1ea85ade..03527c564c 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -739,7 +739,16 @@ static void multifd_tls_outgoing_handshake(QIOTask *task,
>      } else {
>          trace_multifd_tls_outgoing_handshake_complete(ioc);
>      }
> -    multifd_channel_connect(p, ioc, err);
> +
> +    if (!multifd_channel_connect(p, ioc, err)) {
> +        /*
> +         * Error happen, mark multifd_send_thread status as 'quit' although it
> +         * is not created, and then tell who pay attention to me.
> +         */
> +        p->quit = true;
> +        qemu_sem_post(&multifd_send_state->channels_ready);
> +        qemu_sem_post(&p->sem_sync);
> +    }
>  }
>  
>  static void *multifd_tls_handshake_thread(void *opaque)
> 

-- 
Regards.
Chuan

