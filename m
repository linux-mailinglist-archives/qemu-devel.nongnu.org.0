Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202392D2C83
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 15:05:12 +0100 (CET)
Received: from localhost ([::1]:33310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmdc6-0007jc-KG
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 09:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kmdUr-0004gd-7P; Tue, 08 Dec 2020 08:57:41 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kmdUj-0005FU-3v; Tue, 08 Dec 2020 08:57:40 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cr1v01ZK3zkn5h;
 Tue,  8 Dec 2020 21:56:44 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Tue, 8 Dec 2020 21:57:17 +0800
Message-ID: <5FCF863C.7030907@huawei.com>
Date: Tue, 8 Dec 2020 21:57:16 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2] qemu-nbd: Fix a memleak in nbd_client_thread()
References: <20201203135855.70136-1-alex.chen@huawei.com>
 <71e57a20-1a4f-5931-25df-b2740b3a5834@virtuozzo.com>
In-Reply-To: <71e57a20-1a4f-5931-25df-b2740b3a5834@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
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

On 2020/12/8 21:41, Vladimir Sementsov-Ogievskiy wrote:
> 03.12.2020 16:58, Alex Chen wrote:
>> When the qio_channel_socket_connect_sync() fails
>> we should goto 'out_socket' label to free the 'sioc' instead of
>> goto 'out' label.
>> In addition, there's a lot of redundant code in the successful branch
>> and the error branch, optimize it.
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Alex Chen <alex.chen@huawei.com>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>   qemu-nbd.c | 38 +++++++++++++++-----------------------
>>   1 file changed, 15 insertions(+), 23 deletions(-)
>>
>> diff --git a/qemu-nbd.c b/qemu-nbd.c
>> index a7075c5419..9583ee1af6 100644
>> --- a/qemu-nbd.c
>> +++ b/qemu-nbd.c
>> @@ -265,8 +265,8 @@ static void *nbd_client_thread(void *arg)
>>       char *device = arg;
>>       NBDExportInfo info = { .request_sizes = false, .name = g_strdup("") };
>>       QIOChannelSocket *sioc;
>> -    int fd;
>> -    int ret;
>> +    int fd = -1;
>> +    int ret = EXIT_FAILURE;
>>       pthread_t show_parts_thread;
>>       Error *local_error = NULL;
>>   @@ -278,26 +278,24 @@ static void *nbd_client_thread(void *arg)
>>           goto out;
>>       }
>>   -    ret = nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc),
>> -                                NULL, NULL, NULL, &info, &local_error);
>> -    if (ret < 0) {
>> +    if (nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc),
>> +                              NULL, NULL, NULL, &info, &local_error) < 0) {
>>           if (local_error) {
>>               error_report_err(local_error);
>>           }
>> -        goto out_socket;
>> +        goto out;
>>       }
>>         fd = open(device, O_RDWR);
>>       if (fd < 0) {
>>           /* Linux-only, we can use %m in printf.  */
>>           error_report("Failed to open %s: %m", device);
>> -        goto out_socket;
>> +        goto out;
>>       }
>>   -    ret = nbd_init(fd, sioc, &info, &local_error);
>> -    if (ret < 0) {
>> +    if (nbd_init(fd, sioc, &info, &local_error) < 0) {
>>           error_report_err(local_error);
>> -        goto out_fd;
>> +        goto out;
>>       }
>>         /* update partition table */
>> @@ -311,24 +309,18 @@ static void *nbd_client_thread(void *arg)
>>           dup2(STDOUT_FILENO, STDERR_FILENO);
>>       }
>>   -    ret = nbd_client(fd);
>> -    if (ret) {
>> -        goto out_fd;
>> +    if (nbd_client(fd) == 0) {
>> +        ret = EXIT_SUCCESS;
> 
> It's not obvious that nbd_client() returns 0 on success, it calls ioctl(), which may return something positive in theory..
> 
> So, with s/==/>=/, or with just
> 
> if (nbd_client(fd) < 0) {
>   goto out;
> }
> 
> ret = EXIT_SUCCESS;
> 
> 
> (which is good common pattern I think)
> 
> :
> 

Thanks for your review, I will fix it and send patch v3.

Thanks,
Alex


