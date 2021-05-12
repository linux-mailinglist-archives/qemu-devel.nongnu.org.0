Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E5F37B652
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 08:45:01 +0200 (CEST)
Received: from localhost ([::1]:34424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgic8-0005jA-VK
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 02:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lgiZS-0003eH-S4; Wed, 12 May 2021 02:42:15 -0400
Received: from mail-eopbgr00119.outbound.protection.outlook.com
 ([40.107.0.119]:22225 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lgiZO-0005FQ-I4; Wed, 12 May 2021 02:42:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJwBaNucziHYrcTkvfhohy0P+wh43tcel6eB36+WGg/OT7vI57MBwwv0Qw9R6D1feL/afWh5lXUTUpRcUJtXjZAklKiaH5RdgArZgMJM7dpS23Ryi6Ntb0+EmDkz1ir9MEYXvCCvUqLPdtl2QTqesmzo/QYnA4vx9OQOfnFtrlP2rKDBGUJcbp+Pq+oDeuOdd6OonO6p33mYrZ6tDtTvEcNx7/esjCSxFIs092RyaV8Allk0A3NsYJmQsa0sVxP0Pa1PKoxbT+YMvKldxTrxk7jsvnyiWgH6WkM1VIwdIMvvIuy/epMNlEjVSrcpHm0OF8Zf4vjBLwDsVs1Ctq1nJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tq2M45YDXunojhjDwzB7nL57j1wXWINUqQjYBBkKu+c=;
 b=UZkV6NZ2PdDfe9W1grolrK4sZI2GW7qCHz2UvjAf7BH8Ja2rmFN2cFMlaG+tCDjX6vKNpK1L9UpK8YunALnvvmP366lAjGg7w1QlwLfDzqIpzQbkqCec/57cEdZpAuW3HClH+u2AYm4jV26z0STW+SHaFfHweMWjiHKZQEhUUxeiEfv6tua0OArwhPeOunHjoVy/cZVyu3FP1D5qQ3PUK/GQ4VH7XAsnrYD3SiFIPSGX+BuIui/g9c6FatnxfO1q3aLNOoQ9eFOY9a9BgGIGsRmv1Og/8schNDReNQ00kEf3KQmRZFHKNntrsFXA8Ab8J7/j4cpRV0QbMJ0vTEvWkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tq2M45YDXunojhjDwzB7nL57j1wXWINUqQjYBBkKu+c=;
 b=POrh5Xl8QUZOngWDsiBv4Vm2Whb5fsOybM0APqtGVJ/ayrJXAi22xK1TNcH8hcRrEj17Wqsss2+gl01pPvEccHaOWns3Y151K3GTlbqlxpmkv7CyTxgvv7Bmi/hFvjsFYrxxDxD8623qZJ8Ig594LSWwIn+l9DKgzSDByRPeurE=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3766.eurprd08.prod.outlook.com (2603:10a6:20b:83::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 12 May
 2021 06:42:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 06:42:06 +0000
Subject: Re: [PATCH v3 16/33] nbd/client-connection: add possibility of
 negotiation
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-17-vsementsov@virtuozzo.com>
 <YJpgQ3/9buUGwTMC@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a75b4a98-5a9e-56bf-0606-0cfa8b7dd41e@virtuozzo.com>
Date: Wed, 12 May 2021 09:42:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YJpgQ3/9buUGwTMC@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: AM0PR01CA0126.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 AM0PR01CA0126.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Wed, 12 May 2021 06:42:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dd3d0ff-87bf-4d31-75fd-08d915110efc
X-MS-TrafficTypeDiagnostic: AM6PR08MB3766:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB376611FCA70B45C534AE08FAC1529@AM6PR08MB3766.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:295;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PHBTEEu7g5CiAkXDssNZlHOLuIEQ1U66E7Jv9D4cMrihN6UIhmLQKfLtCGJSjyeNBZLQpeDkEYHswMcD6zi3THN97g3jjIFjzJvvpjVnQtGOKpbAdjlLzJ/anw9TMQkVFxDfX0edh4X4AC03clIMSqcONFFQjaJu+rMGpO19T0AQ2UKxyRNmEeNYc5md5tbxB6N3puMfbSSl92HvpTFzUSXzsBDmc+2xjuCFEq68Vvc1hcnJu4dqmbuh0bKr/1qzbGME8DVYHCDAcAqzDOS8o4yA8/9KUnWXpSN5pCTmlSPckgQYZ58W+SgqfYgheW8oV2V7N7zn1qzo6ELu6SD9Lf80Ffj4InHC2KCR6QkfbG31saebyhsSVkvqB/mOnSRcWmEh9LtLBYP/QbITqumjCx4MZ70uLrbNAIMF+wG9cK+RxG8ClnvYg27TsV0DObUsZarHMnzTGVVDA6U7WEa2UW3Dlo3e/wCFmz+YFeGlicn3LdVETnPiv9W/bpfKENDU1oVpmOvxXLdMjjsGsJHzBv40JqL6sQi9RW4yHEGail4JBiaJnrSkei9QBK19ba2v6f2V7074F596p/WbdMXPqkbpsZIOs6MGmMblHv5FY9JdgICRvoD8DXEaeXmIIeIyzn9lgXXIUgNLPqJsAktqY5lP7JmVLdCZ1yygY9xqLFx6HU1T//D0l42JJvWJHPis
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(376002)(396003)(346002)(366004)(136003)(186003)(83380400001)(52116002)(16526019)(38100700002)(38350700002)(2616005)(8936002)(956004)(8676002)(2906002)(6486002)(66476007)(36756003)(31696002)(66946007)(86362001)(66556008)(16576012)(31686004)(316002)(478600001)(5660300002)(26005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WGFSekhUVDN4MFpuYk04SVU1c20yUWxBL1FxeExnY29hZ0tNYlh1OENVenAx?=
 =?utf-8?B?QUJRRkFSbVNwa25oSWtpckx0SzdhVFM3djVoTVk3b2JXcXkvU3RWRGZwdE5V?=
 =?utf-8?B?R2I2ZFVjZTJCRWFFekhZM3lzTkhIU1krb3dUc1VSbWw3SkZCUi8wNGw2SmpW?=
 =?utf-8?B?T3h6T3ZaMEIrSlhTTjhjS0ZBeWI2QXpUSExGR3Q4QTFacSsvMU5QeVRNc21S?=
 =?utf-8?B?dXZneWkwNy9sT2xSd1RzZlFPY3VPbWFEd0pGbW0vVmM3WjdVd3VHdkZyL1Iw?=
 =?utf-8?B?WUxPQ3lkSUw2ZEhlc3AvbE5nNlFuTnNzZU02L0dPYStBYUlRZVh4Qlo0OWJP?=
 =?utf-8?B?V2JzcFZXajlqRU9EQWFXYktqNXRqWDlXYm1WeWQ2NW8vekNsQUVZd2xZd2F6?=
 =?utf-8?B?Yk83T1JkTnhSYzJQMnJTbEFKdHJ4U1hUUnlqTE8vUjRLNVpxZTdmbWNkRlFD?=
 =?utf-8?B?SFdlZDBhdWFUc3NBMkFrTVZrMG44MXFncHB6cWtpcDlsbkVqNUxHVXhZNkNu?=
 =?utf-8?B?WGsrM1FpYXhSZXVIU0ptYzBzdmNQOU1lcjF0NkZPQVZPTVdJcjcrZ0RiSWRP?=
 =?utf-8?B?NzIvZlM4bUpXWk1FNWk4bXFFNUFZajN0QktRT0F4M2FwYkJpMXhBeEU1SGc5?=
 =?utf-8?B?Wm9uNGJ5ZmpUbmpRWmRYZHd4bk5SSXNPb1hOSVVvdWVjbDVNd3NVcVo1M3I3?=
 =?utf-8?B?R0g5QlZtVHp3dW1PV21rdGVsV1UxcVJsL2JvR21BYXhOWGp0c2FXVWRjcEFr?=
 =?utf-8?B?MTBwdHNXeFQyd0Z5OERHK1l1ZmRCcGhINFJNS1JpRTVnemN3VTAzbnZxWkpY?=
 =?utf-8?B?cGxROFFoVXo4T2xXUlc3ZktGenpwb2MrWUZqVXFDYlJ6d0dPU2w5Rnc2UXFx?=
 =?utf-8?B?ZTlTMXZpRzZiMEZ3dUN2bGpYaEVQZVRHVnZuaUJwYTJhT1B5RDlpdEhpVUIx?=
 =?utf-8?B?c05zcEtoWmFOSXFzQXptcW9nQWtrdGVQS1pLOE0zbkZxdFV1UGlNMmV3Q09H?=
 =?utf-8?B?ZlEyUWU4blFrd0xMYnMwaldobkl3Mk45VXJCc0t4bkIwbUVGTFRaME5mYU1N?=
 =?utf-8?B?dlJtOHRnRVFMNE54bUtFUXI3UXQ2TVlUb2E3TDRuaURpTmNYMFdVZG1wVkdk?=
 =?utf-8?B?VUc5VkZOZTZib01VUDdBQ0xpcGR5bDdrQS9kT240WlRuVW0xRHV5TUlJY2tW?=
 =?utf-8?B?MmNydkpQTDk2ZFZqMndpV2dIU0gxUjg2TW9qemllT0lnTnNiSytkTEh6Vm1o?=
 =?utf-8?B?dEFXVEErYjQrZVVUcWFsa1ozQVlsNGtwQlc2WS9ZQ3N4bU5uUDlUUmQxblB1?=
 =?utf-8?B?Y2cxRURScnNEbmdVbTFvdUw0cG8wZUdRdUdtZ0hCcXArOVhmOTkvYzRuby93?=
 =?utf-8?B?Ym9PTnN3OTVJNkxFRHF0UGRKS01KaGdaYTBDbThvQUhmcncrYnlSNStyRGFS?=
 =?utf-8?B?bmI1b2FkQWl0dXM5WEh1Q21va2hKMGZZRXdUdkowYmxuWWVOTVNKREMyR01o?=
 =?utf-8?B?MnRiVkN2d2Z5MGRmQTFmemIwK2t0MVVyeFRGWUdYRWFTT1RhZldGUS95OXRW?=
 =?utf-8?B?N0ZFbzlUMklmd2NxYnBaUmpHc09FRkpGRzk5MWRyOWNFYThScFVsSkptWHNw?=
 =?utf-8?B?RU1DaFlISWl2VXBEVVY5bVZGQk1pNlNmYkVwbUFJbmlSeHZsTDJ3Q2QwQ1JR?=
 =?utf-8?B?bGEwb1RNUVJOMWdsZmNvV0FoMHBURTJTbTJZNTVFTkdzU2NpNVJPS3dSNGE3?=
 =?utf-8?Q?WG8byGDP16YVJxMnopD3tZJtjcsAk5oDjo7Fj9n?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd3d0ff-87bf-4d31-75fd-08d915110efc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 06:42:06.0973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGNnjtTglAwjRmzjXFkRhGc0ggrEZElszON6Vg3jCepwQ5ZPKi5b7y2Gh7yKhipVKIx651khdLEHeVCTOuBJovJK92NeJaNpWUMPnGa4lo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3766
Received-SPF: pass client-ip=40.107.0.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

11.05.2021 13:45, Roman Kagan wrote:
> On Fri, Apr 16, 2021 at 11:08:54AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Add arguments and logic to support nbd negotiation in the same thread
>> after successful connection.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/nbd.h     |   9 +++-
>>   block/nbd.c             |   4 +-
>>   nbd/client-connection.c | 105 ++++++++++++++++++++++++++++++++++++++--
>>   3 files changed, 109 insertions(+), 9 deletions(-)
>>
>> diff --git a/include/block/nbd.h b/include/block/nbd.h
>> index 57381be76f..5d86e6a393 100644
>> --- a/include/block/nbd.h
>> +++ b/include/block/nbd.h
>> @@ -409,11 +409,16 @@ const char *nbd_err_lookup(int err);
>>   /* nbd/client-connection.c */
>>   typedef struct NBDClientConnection NBDClientConnection;
>>   
>> -NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr);
>> +NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
>> +                                               bool do_negotiation,
>> +                                               const char *export_name,
>> +                                               const char *x_dirty_bitmap,
>> +                                               QCryptoTLSCreds *tlscreds);
>>   void nbd_client_connection_release(NBDClientConnection *conn);
>>   
>>   QIOChannelSocket *coroutine_fn
>> -nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
>> +nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
>> +                            QIOChannel **ioc, Error **errp);
>>   
>>   void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
>>   
>> diff --git a/block/nbd.c b/block/nbd.c
>> index 9bd68dcf10..5e63caaf4b 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -361,7 +361,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>>           s->ioc = NULL;
>>       }
>>   
>> -    s->sioc = nbd_co_establish_connection(s->conn, NULL);
>> +    s->sioc = nbd_co_establish_connection(s->conn, NULL, NULL, NULL);
>>       if (!s->sioc) {
>>           ret = -ECONNREFUSED;
>>           goto out;
>> @@ -2033,7 +2033,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
>>           goto fail;
>>       }
>>   
>> -    s->conn = nbd_client_connection_new(s->saddr);
>> +    s->conn = nbd_client_connection_new(s->saddr, false, NULL, NULL, NULL);
>>   
>>       /*
>>        * establish TCP connection, return error if it fails
>> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
>> index b45a0bd5f6..ae4a77f826 100644
>> --- a/nbd/client-connection.c
>> +++ b/nbd/client-connection.c
>> @@ -30,14 +30,19 @@
>>   #include "qapi/clone-visitor.h"
>>   
>>   struct NBDClientConnection {
>> -    /* Initialization constants */
>> +    /* Initialization constants, never change */
>>       SocketAddress *saddr; /* address to connect to */
>> +    QCryptoTLSCreds *tlscreds;
>> +    NBDExportInfo initial_info;
>> +    bool do_negotiation;
>>   
>>       /*
>>        * Result of last attempt. Valid in FAIL and SUCCESS states.
>>        * If you want to steal error, don't forget to set pointer to NULL.
>>        */
>> +    NBDExportInfo updated_info;
>>       QIOChannelSocket *sioc;
>> +    QIOChannel *ioc;
>>       Error *err;
>>   
>>       QemuMutex mutex;
>> @@ -47,12 +52,25 @@ struct NBDClientConnection {
>>       Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
>>   };
>>   
>> -NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr)
>> +NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
>> +                                               bool do_negotiation,
>> +                                               const char *export_name,
>> +                                               const char *x_dirty_bitmap,
>> +                                               QCryptoTLSCreds *tlscreds)
>>   {
>>       NBDClientConnection *conn = g_new(NBDClientConnection, 1);
>>   
>> +    object_ref(OBJECT(tlscreds));
>>       *conn = (NBDClientConnection) {
>>           .saddr = QAPI_CLONE(SocketAddress, saddr),
>> +        .tlscreds = tlscreds,
>> +        .do_negotiation = do_negotiation,
>> +
>> +        .initial_info.request_sizes = true,
>> +        .initial_info.structured_reply = true,
>> +        .initial_info.base_allocation = true,
>> +        .initial_info.x_dirty_bitmap = g_strdup(x_dirty_bitmap),
>> +        .initial_info.name = g_strdup(export_name ?: "")
>>       };
>>   
>>       qemu_mutex_init(&conn->mutex);
>> @@ -68,9 +86,59 @@ static void nbd_client_connection_do_free(NBDClientConnection *conn)
>>       }
>>       error_free(conn->err);
>>       qapi_free_SocketAddress(conn->saddr);
>> +    object_unref(OBJECT(conn->tlscreds));
>> +    g_free(conn->initial_info.x_dirty_bitmap);
>> +    g_free(conn->initial_info.name);
>>       g_free(conn);
>>   }
>>   
>> +/*
>> + * Connect to @addr and do NBD negotiation if @info is not null. If @tlscreds
>> + * given @outioc is provided. @outioc is provided only on success.  The call may
> 
> s/given/are given/
> s/provided/returned/g
> 
>> + * be cancelled in parallel by simply qio_channel_shutdown(sioc).
> 
> I assume by "in parallel" you mean "from another thread", I'd suggest to
> spell this out.  I'm also wondering how safe it really is.  In general
> sockets should be fine with concurrent send()/recv() and shutdown(): the
> sender/receiver will be woken up with an error.  Dunno if it's true for
> an arbitrary qio_channel.

Hmm.. Good notice. I'll look at it.

>  Also it may be worth documenting that the
> code path that cancels must leave all the cleanup up to the negotiation
> code, otherwise it risks conflicting.
> 
>> + */
>> +static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
>> +                       NBDExportInfo *info, QCryptoTLSCreds *tlscreds,
>> +                       QIOChannel **outioc, Error **errp)
>> +{
>> +    int ret;
>> +
>> +    if (outioc) {
>> +        *outioc = NULL;
>> +    }
>> +
>> +    ret = qio_channel_socket_connect_sync(sioc, addr, errp);
>> +    if (ret < 0) {
>> +        return ret;
>> +    }
>> +
>> +    if (!info) {
>> +        return 0;
>> +    }
>> +
>> +    ret = nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc), tlscreds,
>> +                                tlscreds ? addr->u.inet.host : NULL,
>> +                                outioc, info, errp);
>> +    if (ret < 0) {
>> +        /*
>> +         * nbd_receive_negotiate() may setup tls ioc and return it even on
>> +         * failure path. In this case we should use it instead of original
>> +         * channel.
>> +         */
>> +        if (outioc && *outioc) {
>> +            qio_channel_close(QIO_CHANNEL(*outioc), NULL);
>> +            object_unref(OBJECT(*outioc));
>> +            *outioc = NULL;
>> +        } else {
>> +            qio_channel_close(QIO_CHANNEL(sioc), NULL);
>> +        }
>> +
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static void *connect_thread_func(void *opaque)
>>   {
>>       NBDClientConnection *conn = opaque;
>> @@ -81,12 +149,19 @@ static void *connect_thread_func(void *opaque)
>>   
>>       error_free(conn->err);
>>       conn->err = NULL;
>> -    ret = qio_channel_socket_connect_sync(conn->sioc, conn->saddr, &conn->err);
>> +    conn->updated_info = conn->initial_info;
>> +
>> +    ret = nbd_connect(conn->sioc, conn->saddr,
>> +                      conn->do_negotiation ? &conn->updated_info : NULL,
>> +                      conn->tlscreds, &conn->ioc, &conn->err);
>>       if (ret < 0) {
>>           object_unref(OBJECT(conn->sioc));
>>           conn->sioc = NULL;
>>       }
>>   
>> +    conn->updated_info.x_dirty_bitmap = NULL;
>> +    conn->updated_info.name = NULL;
>> +
>>       WITH_QEMU_LOCK_GUARD(&conn->mutex) {
>>           assert(conn->running);
>>           conn->running = false;
>> @@ -94,8 +169,8 @@ static void *connect_thread_func(void *opaque)
>>               aio_co_schedule(NULL, conn->wait_co);
>>               conn->wait_co = NULL;
>>           }
>> +        do_free = conn->detached;
>>       }
>> -    do_free = conn->detached;
> 
> This looks like the response to my earlier comment ;)  This hunk just
> needs to be squashed into the previous patch.
> 
>>   
>>   
>>       if (do_free) {
>> @@ -131,12 +206,24 @@ void nbd_client_connection_release(NBDClientConnection *conn)
>>    *   if thread is already succeeded in background, and user didn't get the
>>    *     result, just return it now
>>    *   otherwise if thread is not running, start a thread and wait for completion
>> + *
>> + * If @info is not NULL, also do nbd-negotiation after successful connection.
>> + * In this case info is used only as out parameter, and is fully initialized by
>> + * nbd_co_establish_connection(). "IN" fields of info as well as related only to
>> + * nbd_receive_export_list() would be zero (see description of NBDExportInfo in
>> + * include/block/nbd.h).
>>    */
>>   QIOChannelSocket *coroutine_fn
>> -nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
>> +nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
>> +                            QIOChannel **ioc, Error **errp)
>>   {
>>       QemuThread thread;
>>   
>> +    if (conn->do_negotiation) {
>> +        assert(info);
>> +        assert(ioc);
>> +    }
>> +
>>       WITH_QEMU_LOCK_GUARD(&conn->mutex) {
>>           /*
>>            * Don't call nbd_co_establish_connection() in several coroutines in
>> @@ -147,6 +234,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
>>           if (!conn->running) {
>>               if (conn->sioc) {
>>                   /* Previous attempt finally succeeded in background */
>> +                if (conn->do_negotiation) {
>> +                    *ioc = g_steal_pointer(&conn->ioc);
>> +                    memcpy(info, &conn->updated_info, sizeof(*info));
>> +                }
>>                   return g_steal_pointer(&conn->sioc);
>>               }
>>   
>> @@ -178,6 +269,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
>>           } else {
>>               error_propagate(errp, conn->err);
>>               conn->err = NULL;
>> +            if (conn->sioc && conn->do_negotiation) {
>> +                *ioc = g_steal_pointer(&conn->ioc);
>> +                memcpy(info, &conn->updated_info, sizeof(*info));
>> +            }
>>               return g_steal_pointer(&conn->sioc);
>>           }
>>       }
>> -- 
>> 2.29.2
>>


-- 
Best regards,
Vladimir

