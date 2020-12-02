Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8902D2CB29F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 03:05:50 +0100 (CET)
Received: from localhost ([::1]:46512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkHWf-0003Cn-Ig
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 21:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kkHTm-00024r-UR; Tue, 01 Dec 2020 21:02:50 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kkHTg-0003BD-Er; Tue, 01 Dec 2020 21:02:49 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cm2K95rZmzhlSF;
 Wed,  2 Dec 2020 10:02:05 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Wed, 2 Dec 2020 10:02:18 +0800
Message-ID: <5FC6F5AB.30300@huawei.com>
Date: Wed, 2 Dec 2020 10:02:19 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] qemu-nbd: Fix a memleak in nbd_client_thread()
References: <20201201061349.110262-1-alex.chen@huawei.com>
 <e2180a73-b2e8-4613-00dd-2850e07c2c46@redhat.com>
In-Reply-To: <e2180a73-b2e8-4613-00dd-2850e07c2c46@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=alex.chen@huawei.com;
 helo=szxga06-in.huawei.com
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/12/2 4:15, Eric Blake wrote:
> On 12/1/20 12:13 AM, Alex Chen wrote:
>> When the qio_channel_socket_connect_sync() fails
>> we should goto 'out_socket' label to free the 'sioc' instead of
>> goto 'out' label.
>> In addition, now the 'out' label is useless, delete it.
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Alex Chen <alex.chen@huawei.com>
>> ---
>>  qemu-nbd.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/qemu-nbd.c b/qemu-nbd.c
>> index 47587a709e..643b0777c0 100644
>> --- a/qemu-nbd.c
>> +++ b/qemu-nbd.c
>> @@ -275,7 +275,7 @@ static void *nbd_client_thread(void *arg)
>>                                          saddr,
>>                                          &local_error) < 0) {
>>          error_report_err(local_error);
>> -        goto out;
>> +        goto out_socket;
>>      }
>>  
>>      ret = nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc),
>> @@ -325,7 +325,6 @@ out_fd:
>>      close(fd);
>>  out_socket:
>>      object_unref(OBJECT(sioc));
>> -out:
>>      g_free(info.name);
>>      kill(getpid(), SIGTERM);
>>      return (void *) EXIT_FAILURE;
>>
> 
> While the patch looks correct, we have a lot of duplication.  Simpler
> might be a solution with only one exit label altogether:
> 

Thanks for your review, I will modify the patch and send patch v2 according to your suggestion.
BTW, do I need to split this patch into two patches, one to solve the memleak and the other to optimizes the redundant code?

Thanks,
Alex

> diff --git i/qemu-nbd.c w/qemu-nbd.c
> index a7075c5419d7..d7bdcd0011ba 100644
> --- i/qemu-nbd.c
> +++ w/qemu-nbd.c
> @@ -265,8 +265,8 @@ static void *nbd_client_thread(void *arg)
>      char *device = arg;
>      NBDExportInfo info = { .request_sizes = false, .name = g_strdup("") };
>      QIOChannelSocket *sioc;
> -    int fd;
> -    int ret;
> +    int fd = -1;
> +    int ret = EXIT_FAILURE;
>      pthread_t show_parts_thread;
>      Error *local_error = NULL;
> 
> @@ -278,26 +278,24 @@ static void *nbd_client_thread(void *arg)
>          goto out;
>      }
> 
> -    ret = nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc),
> -                                NULL, NULL, NULL, &info, &local_error);
> -    if (ret < 0) {
> +    if (nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc),
> +                              NULL, NULL, NULL, &info, &local_error) < 0) {
>          if (local_error) {
>              error_report_err(local_error);
>          }
> -        goto out_socket;
> +        goto out;
>      }
> 
>      fd = open(device, O_RDWR);
>      if (fd < 0) {
>          /* Linux-only, we can use %m in printf.  */
>          error_report("Failed to open %s: %m", device);
> -        goto out_socket;
> +        goto out;
>      }
> 
> -    ret = nbd_init(fd, sioc, &info, &local_error);
> -    if (ret < 0) {
> +    if (nbd_init(fd, sioc, &info, &local_error) < 0) {
>          error_report_err(local_error);
> -        goto out_fd;
> +        goto out;
>      }
> 
>      /* update partition table */
> @@ -311,24 +309,18 @@ static void *nbd_client_thread(void *arg)
>          dup2(STDOUT_FILENO, STDERR_FILENO);
>      }
> 
> -    ret = nbd_client(fd);
> -    if (ret) {
> -        goto out_fd;
> +    if (nbd_client(fd) == 0) {
> +        ret = EXIT_SUCCESS;
>      }
> -    close(fd);
> -    object_unref(OBJECT(sioc));
> -    g_free(info.name);
> -    kill(getpid(), SIGTERM);
> -    return (void *) EXIT_SUCCESS;
> 
> -out_fd:
> -    close(fd);
> -out_socket:
> + out:
> +    if (fd >= 0) {
> +        close(fd);
> +    }
>      object_unref(OBJECT(sioc));
> -out:
>      g_free(info.name);
>      kill(getpid(), SIGTERM);
> -    return (void *) EXIT_FAILURE;
> +    return (void *) (intptr_t) ret;
>  }
>  #endif /* HAVE_NBD_DEVICE */
> 



