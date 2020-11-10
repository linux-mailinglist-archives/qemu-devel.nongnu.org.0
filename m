Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D872B2AD410
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:48:57 +0100 (CET)
Received: from localhost ([::1]:48412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRCq-0001wy-SF
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kcRA9-0000ga-JC
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:46:09 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kcRA6-0003hy-Bp
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:46:09 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CVkzY5nWDz15SHF;
 Tue, 10 Nov 2020 18:45:45 +0800 (CST)
Received: from [10.174.186.51] (10.174.186.51) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Tue, 10 Nov 2020 18:45:46 +0800
Subject: Re: [PATCH v2] migration/multifd: close TLS channel before socket
 finalize
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <1604660094-123959-1-git-send-email-zhengchuan@huawei.com>
 <20201110101223.GA869656@redhat.com>
From: Zheng Chuan <zhengchuan@huawei.com>
Message-ID: <2dbfc8d0-a426-93bc-a4e0-a7e813d34dce@huawei.com>
Date: Tue, 10 Nov 2020 18:45:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201110101223.GA869656@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.186.51]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 05:45:56
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 dgilbert@redhat.com, xiexiangyou@huawei.com, qemu-devel@nongnu.org,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/11/10 18:12, Daniel P. Berrangé wrote:
> On Fri, Nov 06, 2020 at 06:54:54PM +0800, Chuan Zheng wrote:
>> Since we now support tls multifd, when we cancel migration, the TLS
>> sockets will be left as CLOSE-WAIT On Src which results in socket
>> leak.
>> Fix it by closing TLS channel before socket finalize.
>>
>> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
>> ---
>>  migration/multifd.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index 68b171f..a6838dc 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -523,6 +523,19 @@ static void multifd_send_terminate_threads(Error *err)
>>      }
>>  }
>>  
>> +static void multifd_tls_socket_close(QIOChannel *ioc, Error *err)
>> +{
>> +    if (ioc &&
>> +        object_dynamic_cast(OBJECT(ioc),
>> +                            TYPE_QIO_CHANNEL_TLS)) {
>> +        /*
>> +         * TLS channel is special, we need close it before
>> +         * socket finalize.
>> +         */
>> +        qio_channel_close(ioc, &err);
>> +    }
>> +}
> 
> This doesn't feel quite right to me.  Calling qio_channel_close will close
> both the TLS layer, and the underlying QIOChannelSocket. If the latter
> is safe to do, then we don't need the object_dynamic_cast() check, we can
> do it unconditionally whether we're using TLS or not.
> 
> Having said that, I'm not sure if we actually want to be using
> qio_channel_close or not ?
> 
> I would have expected that there is already code somewhere else in the
> migration layer that is closing these multifd channels, but I can't
> actually find where that happens right now.  Assuming that code does
> exist though, qio_channel_shutdown(ioc, BOTH) feels like the right
> answer to unblock waiting I/O ops.
> 
Hi, Daniel.
Actually, I have tried to use qio_channel_shutdown at the same place, but it seems not work right.
the socket connection is closed by observing through 'ss' command but the socket fds in /proc/$(qemu pid)/fd are still
residual.

The underlying QIOChannelSocket will be closed by qio_channel_socket_finalize() through object_unref(QIOChannel) later in socket_send_channel_destroy(),
does that means it is safe to close both of TLS and tcp socket?


>> +
>>  void multifd_save_cleanup(void)
>>  {
>>      int i;
>> @@ -542,6 +555,7 @@ void multifd_save_cleanup(void)
>>          MultiFDSendParams *p = &multifd_send_state->params[i];
>>          Error *local_err = NULL;
>>  
>> +        multifd_tls_socket_close(p->c, NULL);
>>          socket_send_channel_destroy(p->c);
>>          p->c = NULL;
>>          qemu_mutex_destroy(&p->mutex);
>> -- 
>> 1.8.3.1
>>
> 
> Regards,
> Daniel
> 

-- 
Regards.
Chuan

