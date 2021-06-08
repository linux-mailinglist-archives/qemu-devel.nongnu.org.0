Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA6C39F362
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 12:26:30 +0200 (CEST)
Received: from localhost ([::1]:41340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYwG-0007gy-KS
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 06:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqYuP-0006hL-2v; Tue, 08 Jun 2021 06:24:33 -0400
Received: from mail-eopbgr130138.outbound.protection.outlook.com
 ([40.107.13.138]:56740 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqYuM-00048Z-8D; Tue, 08 Jun 2021 06:24:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnvYc48iLuFzjh1OEciX4o2NlkKRbM8/miBZYgjDhEwdqoISHCDHs7ynCuRXSRYSkW8dhl7X2wkzIpBrJGeWl0ynEjlDefiSya2Ib7bZiL3xdGE6RNGrYKwuJCEk1uYJtN5HsU0CcqIEXrA8gsTu5GnltJfvePmUe0W9F6jzcQSPerevO5hS463Fdq0dXtXANWi9VEkFcZDfbY+8iY+qgbqliCo4l8GVAzkXIE1l9+BTnGeInfmUpBgXyvj4aJuGxbdOYixZlj0oIfmGP8ggbvnI+TYuKc6UPJi9uUCSHvzJ3iCbYDE47iJQeziTSu8OCYKwlclbZL+1q+qQ9hzgTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTCgZ1K649oXUpqUmRU8u92NXXI8dqjCpUZoqBWF+Pk=;
 b=cLTCWmyKZSD3PFJh550R/QWhk5a1glx7gTA3SMa/mXno1Lv9hBO9UTxzlHSRT2kD0vJ85acoaPyFZnnJOnLkIp0iATHXugzeYxoGpflWklWH/WlfnPCwK7zxCv4qJ3tyd/pW3VmALs3QPzo8HzRDJ+kE3xj9gUrEjEGyTyBGGzXxBCsi20A2TBBgCMBCSo8YKbfzn4XT1AyuIRtCG9Y68XdVx1zTRpmC5vdgpHmDBgPh88T+jZ9XEa7P61ZmlYM1UY9jPisQlf9+rlfMOPBMZcgYNs4h1PEU9pzBI3eHlpVKdyawo1VrLOiXq3x9hi7h61wU28yTEoAaY36ew0iATg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTCgZ1K649oXUpqUmRU8u92NXXI8dqjCpUZoqBWF+Pk=;
 b=NcXFy6p2AWwjAmX1hraPTequZlot+Tg56rZZGIymis2+RIcHxyN1nJ6J6GkUA0ibm7Q9O3IE95C54UtVr/A/8pz7xAyFJqXNOibUvFHKsTbDwViwhZGMCkgpA7UWwY+QuSG7QL03iBvhGvdDbX4vxQsxCqFhlymhZ+D/oMslw+4=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4788.eurprd08.prod.outlook.com (2603:10a6:20b:c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27; Tue, 8 Jun
 2021 10:24:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 10:24:25 +0000
Subject: Re: [PATCH v3 17/33] nbd/client-connection: implement connection retry
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-18-vsementsov@virtuozzo.com>
 <YJrvFbUbEx7woi//@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <380c68e9-6b0c-6348-d4c6-b1c220ffd502@virtuozzo.com>
Date: Tue, 8 Jun 2021 13:24:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YJrvFbUbEx7woi//@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM4PR0902CA0005.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM4PR0902CA0005.eurprd09.prod.outlook.com (2603:10a6:200:9b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21 via Frontend
 Transport; Tue, 8 Jun 2021 10:24:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a6d1f7a-36f0-43e8-beed-08d92a679733
X-MS-TrafficTypeDiagnostic: AM6PR08MB4788:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4788CC7F9F490F08AE4949F8C1379@AM6PR08MB4788.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:52;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vUM7dp4onzQQLktmTSE2nMwjTwp9cmTZjI1zhB5xLvVTO5pPWO65K3fd3uOWQSB+9WVhDZxiHyj082brVHpLzfx5u+jn8PMvN3EVxeo1TAW4zpGPncOx95MklA9koFCHHjxLtVhC1hdTQid6HrqBQLjN8fcqI+wjMkW0KXmcKJBsIhB0hAJhVD1c6SFUHSGf485gX09k6zvTvZ0sW9ZnZ9eS8ss/qqskqnqcVzUkuq0SVTkJf9JEBlytx9Pm8t+ykklkpckg1l1NB5UTeYB/en1MuaaljKFDj5wJHrXuS8lFjIonmeW0DD6wS+7PNPbzMYnSp8fIF5CwNjKPIeWypx7jslefa3+en7yhs2FqhnMz3SNZZseu/ZADQNy/fD/nOZ2LkIsPaiPgRoCy9qwzhtj9VKb9QyDWshHcis9ElGXuF9kg4zx1V38UW2lr3qmhopgKeyqcsEes+2r58mPhtB0uudfs83ZNrw8XtIpNep1M4Iit1sKQlxQ6eebYKTdfiqYGk5bh9bHtEFjTbSQFExSn8WnLtrHlVb0fYYC6pAJDaFW9Y3d1/IknFr9S8TmpuMrcx9Zuc+MFhmQtY6EA44vXRaYWlRMFI9Vy9ilnf4KSoZPf1S+IpwZ9F5zgb1ZblcCySmIMcWhZkSmjZczTKM9rNgfVxZ4UWe8YBEBHaAD07nzIFcR2hnVF9c10oYIHSqEMC4v5QNEoALvmpIzKIue1/uJWjBokgYsFK4lZ/Dw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(366004)(376002)(39840400004)(86362001)(956004)(2616005)(186003)(8936002)(26005)(478600001)(38100700002)(38350700002)(66556008)(66476007)(31696002)(66946007)(52116002)(31686004)(83380400001)(6486002)(2906002)(36756003)(16526019)(16576012)(5660300002)(8676002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T0t3cVU0bTY5TXJPbXRhb08ySGtZMWpOTit2bG8zT2g2d3hmRm9VRzB2bEsv?=
 =?utf-8?B?UHgrRW5TMk5ZVHhmbmNIYVlVU2ZBL1huOXR0TlkvVWlWOVlvVkNZbkcyQ0ls?=
 =?utf-8?B?Y2d5bm0vN09CNmJIbEM0UkdVUnhWQ1JVQ3Zua3o4ejVXSy9FQ1VtQkU2SUNJ?=
 =?utf-8?B?aTg5bjA2QTNWTFdieG1QVmtZUnhTaGprN29GOFV1QjBiMmNCcVA4azN0RXhL?=
 =?utf-8?B?R1NDc0Y0bVZBUCsvKzV6eS9YMWJaQzY2NG5mWlFUWWpuckoxMmpTWmlLUDhv?=
 =?utf-8?B?SEFabjE0Nmxhc1M1ai9TTTBqaWp5dTZqaExwYlViQkpJWk9uQUdLeWZ5RFov?=
 =?utf-8?B?KzZnVk1sQzlBcXRSWXhmRmR1aXIwNWNoTXM2aHd2VE94a0RKbERuRk0rYWQr?=
 =?utf-8?B?RzNiRFRGYWNzY3hKaVozZ0Y5MzVjZ3NOYjArbmg0TWo2R0RjR1BPcjlCMUIz?=
 =?utf-8?B?TG5Cd1RMZ056bUQ4ZU5DM2VEeWQ0WWlrejRlcXdRcjZKWWRJUzd3ZURSZVZk?=
 =?utf-8?B?NTFxN080cU1pczZ2NTVrd3djd2pGVjc4UzNBMFBXN3pHMml6RG5iM1pmT3JO?=
 =?utf-8?B?ZlgrYWN1cTRZNEFhUy9qa1IrWWd5Q0hjdHFrUXREa0JWQlNDaHBpbHJySi9s?=
 =?utf-8?B?TWU2Z3VobmpodjU4eDJXN0lEblY2ZTJMdE05ZS9KK1JCZURrMkxKYVBjQ0I2?=
 =?utf-8?B?b0NWZUJhUTlhaE5CVzZQVVhPSzdKRDRmbzhZUUp2aVdmcEtwN2dmTVp4Y1kw?=
 =?utf-8?B?WERDRkgyWjhMUWdSSk1FNnh2RHkxTVcrQ3RNZG8xQkMzek5CU25HMkRZL3Ar?=
 =?utf-8?B?V0VEendxUjdvdWdrTEtjaEhhdWxuTVM5YkRsWXdGbnJCaEJiK3VpeGNLekVN?=
 =?utf-8?B?MWM1RlRTMlc2ek9aU0NSMmJqL3lDR3BJOXZxb3U2YWljWVBDT29zVmNnMDhN?=
 =?utf-8?B?QksvdGRaNFVSczYyTCsyaEExdFZFbjNtekFYR2RjWCtSSW5WN3JudWZlSDJD?=
 =?utf-8?B?cWxXbXJVNlBadHByTkxCVVFST0pEeWxNWXRBL0M0MkREM0V3R05jbUJlUXhV?=
 =?utf-8?B?bXpPZllONXZwQWp2Tzc5NFphbG9ONWJVQjd5Z21ZZ3Y0RDRJYk4yaWQzQVBk?=
 =?utf-8?B?Z2dYVWV0WWM3UlhhL2Z5aEFvRlBaWTdFUC9teElod1ZPdzRYb2gyQloxSDQ5?=
 =?utf-8?B?MGgvbTBHT3R0UVBGKzhmek40SVZlQ1JyaXlneHVobFJESWcwcklyS2huMy9m?=
 =?utf-8?B?SER1c3hJYVY3NTJ3WEZRcU1TT1JEb2YzNkNLWWx6c3JBL09mOUEzZkZUSCty?=
 =?utf-8?B?Rzg3ZGxrSjhmakNkWW1uOEkxbjhvaERVUGloT2N4RkR6TVo1d1RqNkZKeEVE?=
 =?utf-8?B?Z2xDdWd4T1NkeTlhT2l3QXhIRzdFQTRNd0dDOU5CZ05uTVBlRVNOMENBWlF1?=
 =?utf-8?B?TXhzdmJVcnpxOGVBYTFKY0JsS1MyRjdnWW1ZVndTQy9iMEVsRVVtbHgzTk5H?=
 =?utf-8?B?N3p2U0o3ZFpTQnRZU2lQVkcxaGZKK1BRUVJyOTJxd0paazVwZU5HcTVXYzVL?=
 =?utf-8?B?WlRmd3d0ZVBzVURvb29VN0pxOXBTNktUMkVkZnJ1UW5mdk5LbktjOTBPMG1H?=
 =?utf-8?B?NitBSzZLNjZFOWt5NzJxVkk0OE1lSlZJYmxRM0EvUTB2YVJhQVB0YmZ0cGRi?=
 =?utf-8?B?Z3BwMFBuYk1iRDBBSFVVVEJGRzJkKyt0OGlSZVdmOXJBbmdKVzc4Mkk2ZEY0?=
 =?utf-8?Q?SiO3VKxpY5FQUSmOvEU6grQZcG1CeSMJ7QN6gIT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6d1f7a-36f0-43e8-beed-08d92a679733
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 10:24:25.7798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YiWlVIOm50MnDS2KnQoG9+KGk11NjoD/QpQL7Zl8U8o7eMKhgnUXAWZDSQqmdG9MINYSl/IDzHS3D9BXFp8H/t36x8yi5oBAMOtE8dwXSYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4788
Received-SPF: pass client-ip=40.107.13.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

11.05.2021 23:54, Roman Kagan wrote:
> On Fri, Apr 16, 2021 at 11:08:55AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Add an option for thread to retry connection until success. We'll use
>> nbd/client-connection both for reconnect and for initial connection in
>> nbd_open(), so we need a possibility to use same NBDClientConnection
>> instance to connect once in nbd_open() and then use retry semantics for
>> reconnect.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/nbd.h     |  2 ++
>>   nbd/client-connection.c | 55 +++++++++++++++++++++++++++++------------
>>   2 files changed, 41 insertions(+), 16 deletions(-)
>>
>> diff --git a/include/block/nbd.h b/include/block/nbd.h
>> index 5d86e6a393..5bb54d831c 100644
>> --- a/include/block/nbd.h
>> +++ b/include/block/nbd.h
>> @@ -409,6 +409,8 @@ const char *nbd_err_lookup(int err);
>>   /* nbd/client-connection.c */
>>   typedef struct NBDClientConnection NBDClientConnection;
>>   
>> +void nbd_client_connection_enable_retry(NBDClientConnection *conn);
>> +
>>   NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
>>                                                  bool do_negotiation,
>>                                                  const char *export_name,
>> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
>> index ae4a77f826..002bd91f42 100644
>> --- a/nbd/client-connection.c
>> +++ b/nbd/client-connection.c
>> @@ -36,6 +36,8 @@ struct NBDClientConnection {
>>       NBDExportInfo initial_info;
>>       bool do_negotiation;
>>   
>> +    bool do_retry;
>> +
>>       /*
>>        * Result of last attempt. Valid in FAIL and SUCCESS states.
>>        * If you want to steal error, don't forget to set pointer to NULL.
>> @@ -52,6 +54,15 @@ struct NBDClientConnection {
>>       Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
>>   };
>>   
>> +/*
>> + * The function isn't protected by any mutex, so call it when thread is not
>> + * running.
>> + */
>> +void nbd_client_connection_enable_retry(NBDClientConnection *conn)
>> +{
>> +    conn->do_retry = true;
>> +}
>> +
>>   NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
>>                                                  bool do_negotiation,
>>                                                  const char *export_name,
>> @@ -144,24 +155,37 @@ static void *connect_thread_func(void *opaque)
>>       NBDClientConnection *conn = opaque;
>>       bool do_free;
>>       int ret;
>> +    uint64_t timeout = 1;
>> +    uint64_t max_timeout = 16;
>> +
>> +    while (true) {
>> +        conn->sioc = qio_channel_socket_new();
>> +
>> +        error_free(conn->err);
>> +        conn->err = NULL;
>> +        conn->updated_info = conn->initial_info;
>> +
>> +        ret = nbd_connect(conn->sioc, conn->saddr,
>> +                          conn->do_negotiation ? &conn->updated_info : NULL,
>> +                          conn->tlscreds, &conn->ioc, &conn->err);
>> +        conn->updated_info.x_dirty_bitmap = NULL;
>> +        conn->updated_info.name = NULL;
>> +
>> +        if (ret < 0) {
>> +            object_unref(OBJECT(conn->sioc));
>> +            conn->sioc = NULL;
>> +            if (conn->do_retry) {
>> +                sleep(timeout);
>> +                if (timeout < max_timeout) {
>> +                    timeout *= 2;
>> +                }
>> +                continue;
>> +            }
>> +        }
> 
> How is it supposed to get canceled?
> 

Next commit does it
  
>> -    conn->sioc = qio_channel_socket_new();
>> -
>> -    error_free(conn->err);
>> -    conn->err = NULL;
>> -    conn->updated_info = conn->initial_info;
>> -
>> -    ret = nbd_connect(conn->sioc, conn->saddr,
>> -                      conn->do_negotiation ? &conn->updated_info : NULL,
>> -                      conn->tlscreds, &conn->ioc, &conn->err);
>> -    if (ret < 0) {
>> -        object_unref(OBJECT(conn->sioc));
>> -        conn->sioc = NULL;
>> +        break;
>>       }
>>   
>> -    conn->updated_info.x_dirty_bitmap = NULL;
>> -    conn->updated_info.name = NULL;
>> -
>>       WITH_QEMU_LOCK_GUARD(&conn->mutex) {
>>           assert(conn->running);
>>           conn->running = false;
>> @@ -172,7 +196,6 @@ static void *connect_thread_func(void *opaque)
>>           do_free = conn->detached;
>>       }
>>   
>> -
>>       if (do_free) {
>>           nbd_client_connection_do_free(conn);
>>       }
>> -- 
>> 2.29.2
>>


-- 
Best regards,
Vladimir

