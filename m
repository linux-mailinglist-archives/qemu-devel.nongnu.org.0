Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5233532F917
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 10:10:34 +0100 (CET)
Received: from localhost ([::1]:56250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lISxE-0000zp-RF
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 04:10:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lISvh-0008R4-6j
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 04:08:57 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lISvc-0000aM-Ff
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 04:08:56 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DszJ32k2wz16H2B;
 Sat,  6 Mar 2021 17:06:59 +0800 (CST)
Received: from [10.174.186.51] (10.174.186.51) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Sat, 6 Mar 2021 17:08:36 +0800
From: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH v2 1/2] migration/tls: fix inverted semantics in
 multifd_channel_connect
To: Hao Wang <wanghao232@huawei.com>, <quintela@redhat.com>,
 <dgilbert@redhat.com>, <berrange@redhat.com>
References: <20210209104237.2250941-1-wanghao232@huawei.com>
 <20210209104237.2250941-2-wanghao232@huawei.com>
Message-ID: <5214c14b-2845-7c9f-acaf-983aaee18d49@huawei.com>
Date: Sat, 6 Mar 2021 17:08:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210209104237.2250941-2-wanghao232@huawei.com>
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
> Function multifd_channel_connect() return "true" to indicate failure,
> which is rather confusing. Fix that.
> 
> Signed-off-by: Hao Wang <wanghao232@huawei.com>
> ---
>  migration/multifd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 1a1e589064..2a1ea85ade 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -798,9 +798,9 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
>                   * function after the TLS handshake,
>                   * so we mustn't call multifd_send_thread until then
>                   */
> -                return false;
> -            } else {
>                  return true;
> +            } else {
> +                return false;
>              }
>          } else {
>              /* update for tls qio channel */
> @@ -808,10 +808,10 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
>              qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
>                                     QEMU_THREAD_JOINABLE);
>         }
> -       return false;
> +       return true;
>      }
>  
> -    return true;
> +    return false;
>  }
>  
>  static void multifd_new_send_channel_cleanup(MultiFDSendParams *p,
> @@ -844,7 +844,7 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
>          p->c = QIO_CHANNEL(sioc);
>          qio_channel_set_delay(p->c, false);
>          p->running = true;
> -        if (multifd_channel_connect(p, sioc, local_err)) {
> +        if (!multifd_channel_connect(p, sioc, local_err)) {
>              goto cleanup;
>          }
>          return;
> 

-- 
Regards.
Chuan

