Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACF3264791
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 15:57:56 +0200 (CEST)
Received: from localhost ([::1]:47262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGN5H-0007S0-4P
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 09:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kGN3i-0005dF-Tl
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 09:56:18 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:43356 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kGN3g-0003Yg-TF
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 09:56:18 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A4F86A8F8A7665795C26;
 Thu, 10 Sep 2020 21:56:07 +0800 (CST)
Received: from [127.0.0.1] (10.174.186.4) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Thu, 10 Sep 2020
 21:56:00 +0800
Subject: Re: [PATCH v1 2/7] migration/tls: extract migration_tls_client_create
 for common-use
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <1599663177-53993-1-git-send-email-zhengchuan@huawei.com>
 <1599663177-53993-3-git-send-email-zhengchuan@huawei.com>
 <20200910131622.GT1083348@redhat.com>
From: Zheng Chuan <zhengchuan@huawei.com>
Message-ID: <0584a6af-3d87-d28c-ffe8-47fab20bb3d4@huawei.com>
Date: Thu, 10 Sep 2020 21:55:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200910131622.GT1083348@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.186.4]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhengchuan@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 09:56:08
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.576,
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
Cc: zhang.zhanghailiang@huawei.com, quintela@redhat.com, yuxiating@huawei.com,
 dgilbert@redhat.com, xiexiangyou@huawei.com, qemu-devel@nongnu.org,
 alex.chen@huawei.com, jinyan12@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/9/10 21:16, Daniel P. Berrangé wrote:
> On Wed, Sep 09, 2020 at 10:52:52PM +0800, Chuan Zheng wrote:
>> migration_tls_client_create will be used in multifd-tls, let's
>> extract it.
>>
>> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
>> Signed-off-by: Yan Jin <jinyan12@huawei.com>
>> ---
>>  migration/tls.c | 26 ++++++++++++++++++--------
>>  migration/tls.h |  6 ++++++
>>  2 files changed, 24 insertions(+), 8 deletions(-)
>>
>> diff --git a/migration/tls.c b/migration/tls.c
>> index 7a02ec8..e888698 100644
>> --- a/migration/tls.c
>> +++ b/migration/tls.c
>> @@ -22,7 +22,6 @@
>>  #include "channel.h"
>>  #include "migration.h"
>>  #include "tls.h"
>> -#include "io/channel-tls.h"
>>  #include "crypto/tlscreds.h"
>>  #include "qemu/error-report.h"
>>  #include "qapi/error.h"
>> @@ -125,11 +124,10 @@ static void migration_tls_outgoing_handshake(QIOTask *task,
>>      object_unref(OBJECT(ioc));
>>  }
>>  
>> -
>> -void migration_tls_channel_connect(MigrationState *s,
>> -                                   QIOChannel *ioc,
>> -                                   const char *hostname,
>> -                                   Error **errp)
>> +QIOChannelTLS *migration_tls_client_create(MigrationState *s,
>> +                                 QIOChannel *ioc,
>> +                                 const char *hostname,
>> +                                 Error **errp)
> 
> Alignment of parameters is messed up.
> 
Sure, will fix in v2
>>  {
>>      QCryptoTLSCreds *creds;
>>      QIOChannelTLS *tioc;
>> @@ -137,7 +135,7 @@ void migration_tls_channel_connect(MigrationState *s,
>>      creds = migration_tls_get_creds(
>>          s, QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT, errp);
>>      if (!creds) {
>> -        return;
>> +        return NULL;
>>      }
>>  
>>      if (s->parameters.tls_hostname && *s->parameters.tls_hostname) {
>> @@ -145,11 +143,23 @@ void migration_tls_channel_connect(MigrationState *s,
>>      }
>>      if (!hostname) {
>>          error_setg(errp, "No hostname available for TLS");
>> -        return;
>> +        return NULL;
>>      }
>>  
>>      tioc = qio_channel_tls_new_client(
>>          ioc, creds, hostname, errp);
>> +
>> +    return tioc;
>> +}
>> +
>> +void migration_tls_channel_connect(MigrationState *s,
>> +                                   QIOChannel *ioc,
>> +                                   const char *hostname,
>> +                                   Error **errp)
>> +{
>> +    QIOChannelTLS *tioc;
>> +
>> +    tioc = migration_tls_client_create(s, ioc, hostname, errp);
>>      if (!tioc) {
>>          return;
>>      }
>> diff --git a/migration/tls.h b/migration/tls.h
>> index cdd7000..d4a0861 100644
>> --- a/migration/tls.h
>> +++ b/migration/tls.h
>> @@ -22,11 +22,17 @@
>>  #define QEMU_MIGRATION_TLS_H
>>  
>>  #include "io/channel.h"
>> +#include "io/channel-tls.h"
>>  
>>  void migration_tls_channel_process_incoming(MigrationState *s,
>>                                              QIOChannel *ioc,
>>                                              Error **errp);
>>  
>> +QIOChannelTLS *migration_tls_client_create(MigrationState *s,
>> +                                   QIOChannel *ioc,
>> +                                   const char *hostname,
>> +                                   Error **errp);
> 
> Again alignment is messed up.
> 
> Assuming that's fixed
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> 
> 
> Regards,
> Daniel
> 


