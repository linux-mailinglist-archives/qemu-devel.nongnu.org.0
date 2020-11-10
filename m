Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5562ACA81
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 02:32:24 +0100 (CET)
Received: from localhost ([::1]:40052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcIWF-0002qy-Mm
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 20:32:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kcIV9-0002PK-97
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:31:16 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kcIV1-0000nB-E0
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:31:12 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CVVgK2GnmzhhSr;
 Tue, 10 Nov 2020 09:30:53 +0800 (CST)
Received: from [10.174.186.51] (10.174.186.51) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Tue, 10 Nov 2020 09:30:51 +0800
Subject: Re: [PATCH v2] migration/multifd: close TLS channel before socket
 finalize
From: Zheng Chuan <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <berrange@redhat.com>
References: <1604660094-123959-1-git-send-email-zhengchuan@huawei.com>
Message-ID: <320e042f-10ce-8553-49b2-df338b1852f1@huawei.com>
Date: Tue, 10 Nov 2020 09:30:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1604660094-123959-1-git-send-email-zhengchuan@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhengchuan@huawei.com;
 helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 20:11:42
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping.
Maybe this bugfix is need for qemu-5.2 version.

On 2020/11/6 18:54, Chuan Zheng wrote:
> Since we now support tls multifd, when we cancel migration, the TLS
> sockets will be left as CLOSE-WAIT On Src which results in socket
> leak.
> Fix it by closing TLS channel before socket finalize.
> 
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/multifd.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 68b171f..a6838dc 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -523,6 +523,19 @@ static void multifd_send_terminate_threads(Error *err)
>      }
>  }
>  
> +static void multifd_tls_socket_close(QIOChannel *ioc, Error *err)
> +{
> +    if (ioc &&
> +        object_dynamic_cast(OBJECT(ioc),
> +                            TYPE_QIO_CHANNEL_TLS)) {
> +        /*
> +         * TLS channel is special, we need close it before
> +         * socket finalize.
> +         */
> +        qio_channel_close(ioc, &err);
> +    }
> +}
> +
>  void multifd_save_cleanup(void)
>  {
>      int i;
> @@ -542,6 +555,7 @@ void multifd_save_cleanup(void)
>          MultiFDSendParams *p = &multifd_send_state->params[i];
>          Error *local_err = NULL;
>  
> +        multifd_tls_socket_close(p->c, NULL);
>          socket_send_channel_destroy(p->c);
>          p->c = NULL;
>          qemu_mutex_destroy(&p->mutex);
> 

-- 
Regards.
Chuan

