Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D1C2D30B6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 18:14:13 +0100 (CET)
Received: from localhost ([::1]:51780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmgZ2-0004cv-MW
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 12:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmgGd-0004iw-Q5; Tue, 08 Dec 2020 11:55:13 -0500
Received: from mail-eopbgr70120.outbound.protection.outlook.com
 ([40.107.7.120]:52959 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmgGY-0001Ti-0t; Tue, 08 Dec 2020 11:55:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blx86G+9Cv/HkBeb7TAMucKwPJfXIU/49LMwGx7+6BYDeuW+f4XjlmPI20yMVnwA1EUzSHwiOPEaONn4MkH9Nq1iGEZHknwvopyK8lXjNmgq4fO1MY5Y5JwkAh7o/LFRzpd06vTdYa3E60Ht/GLaWGNafW4xXxRVojqUubDR9b/u4zcPMgVyV1Hf7iiDkCM6WOo9DQSymWL6hv7ZqEMiVty7XzeEnaaq/nx9RvAz7j1pNr8DzV8OQRTddHRqaDlCyoO5BbdcyIMZn7NWY/qNAfKQnyJR3mPI0sgaicujgzKw4nklTkDSTyKN5IQa0WdmozcqoXHFLfJ9uitjyDbGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAzVy6pRzB9zCF/cyQexaqjcnr/HGyBAr31qBGLGb08=;
 b=WvB4fYinc1c08ydVQFWb5vqYB9BI4WN5DRKdLWFiLM3fwj2Al3MifKelJ7FkVTHbfzRcPYS/FtEuzJtBdeb8FCsIPQHM+J+S8H+XvYyMYhT/+7v48au1sHmOMazkmSgQTlPGjT9eVSzIAZ1bNSHGh5AOmgQYsou2NXx+W5DEWGECCWRg3VBDIYIx2BL7zNKogpxcz7EKSGetYCOKd+AUkLQ0B3YXutr6/HMShOlkvYZKB2CkHow+7FcacpMMY91DVMwlz5eFZcLy38qv8K3lnNsmg1688/bgx1ODO2vK28CVYni+ViMjEP9i1HtepJV8j/A6pHhN528qCA/X2ETNsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAzVy6pRzB9zCF/cyQexaqjcnr/HGyBAr31qBGLGb08=;
 b=uNy2IyPXQmEUKqidwCtDySiC5C1neNWP1Y6lb8FB70S4aQs55+MNCdFKvrP10haGcNULCMZRNutzquKC/qT1nZ7bYtn/GAD1Bk9gr3aaRPCugpT6rooviGewZeRtL12M4HNWWOhusJFhiJr8E+TctafsbamzRJiMg1rboKke5p4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB5504.eurprd08.prod.outlook.com (2603:10a6:803:13b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Tue, 8 Dec
 2020 16:55:00 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%4]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 16:55:00 +0000
Subject: Re: [PATCH v3 2/2] block: qcow2: remove the created file on
 initialization error
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
References: <20201208142159.492489-1-mlevitsk@redhat.com>
 <20201208142159.492489-3-mlevitsk@redhat.com>
 <87338c70-225e-d238-3a68-acd811716aba@virtuozzo.com>
 <e3d93eb4499c613f7fa9f998e7a85ea373578965.camel@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e851592e-016f-9292-f265-f03276b04f7a@virtuozzo.com>
Date: Tue, 8 Dec 2020 19:54:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <e3d93eb4499c613f7fa9f998e7a85ea373578965.camel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0902CA0013.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::23) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM4PR0902CA0013.eurprd09.prod.outlook.com (2603:10a6:200:9b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Tue, 8 Dec 2020 16:54:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9021402-db96-47f3-de2c-08d89b9a0048
X-MS-TrafficTypeDiagnostic: VI1PR08MB5504:
X-Microsoft-Antispam-PRVS: <VI1PR08MB55047EAA7DF23A5C2C2FA2DBC1CD0@VI1PR08MB5504.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yZaRpulqc6HUrWCnK61WU3o1P/xkVkSXqN1JkqhUPVhWVLTbeIpppGCd3vSs2zhMPaKM8m70u+YfEXkYmv0r3wmR3Ome/4CnFvDU9z0BFig6MThTvRlh9+PIlVd0RFBg7wKWafrugIQh4NyEvQ+B0OjdQUXlvmnYmeGjBivH9+7Wjeqn6BGtvUJLVa5+yLTZzIAmLxjFBz9UTvT5qdUNsoBrUp9DNEXUG4ToXboZ7fO4XbT9Ui7ZFqy6bzHVd7mvw3RGOB+mMSFgb9AtwpYfdQW5ivLeXhaZSI01TdMKnUdt2NXIA2k5qFIgmW1FjT/SWBR5aEi+yXqyQPVC+Dh8GoPCwXANopQXToo0ea9AAnhNfJswkvZFJkbzmo2d2gTf4iZQx+GUnSoVi9MYZ+X6dsOSTDyq2Y5qgFgmWh9yHz1I/Rv2YRBiMNh+AhaQILtU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(16576012)(186003)(956004)(54906003)(31696002)(31686004)(8936002)(66556008)(8676002)(5660300002)(66946007)(6486002)(86362001)(16526019)(34490700003)(66476007)(36756003)(4326008)(52116002)(2906002)(2616005)(26005)(83380400001)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bjJMdGZGU0dTNmUzL0diYzc5K2FZTStoaUJFS0FmWjFqeVFSMFR6V3BYTjJK?=
 =?utf-8?B?M0pNZFVNNFdQbktwWEdlRnlrMzFzdTlIanBWWTlQaS9mN3h1cnJpbUFDTG84?=
 =?utf-8?B?WXc3QjNvYmF5ZDNWdkNBK2s3L1pCcW1SUFhtSDNzbEFLSEdWUVcrbWhnYUpP?=
 =?utf-8?B?ZXZFaWxzMDNXUVViMTJ6Uzc1QjdNYnZNcHpVaCtUZGJYZ3U0WDg2eW01a3Zn?=
 =?utf-8?B?Z0lScHMrd05CWjJYUXk0QkpwNCtMZ2RaWVRhb0lwYmp5dHpTUjNaSGdVWXJw?=
 =?utf-8?B?aHN2N3RRK2pZMWpqS2hjdXlaejVuV1BML2haT285Wjh1R1VacjQzeXdqUUl5?=
 =?utf-8?B?UHllMGlsRnB6cXFzd3ZQL2JmKzlYd2lsSXZ4dVU1Zkh1OE1yckFmY2xvVi9P?=
 =?utf-8?B?Qm83TGh0U3A4M3ZvSXVkTkVFL3RKSUVJWjRteWJMVHROclR5dURNcEE2NWxJ?=
 =?utf-8?B?V3BSa3MvNVFpUVlMRHJESHdKRzVGVEpFdkNxcHBrS2FWN2NUcFV2M0JubUtQ?=
 =?utf-8?B?dnQ5Yk1XU090Yk1wQWFSUkZmeFM2YW5jN2x2aEdoaFVXbCs4ZS9QTHpJMlNO?=
 =?utf-8?B?YXhXcFZmSG9CK2NEOFltNjVkWmZWRzZsNlVDb2xqTVhRdDB0ZUNBYjVwNTRR?=
 =?utf-8?B?b091WGZXVXB0VW5WcS91TlV3UWZkSzQ2aVlhV014eU0zSng3aU91YUtrVFpy?=
 =?utf-8?B?NzNxTEZxZzNHNTN3bkFWQjlqUE9Jc2ZDQnIraHBYMXdxQXBlT3RvYkZGbU8r?=
 =?utf-8?B?M3U5MjlVVXNwb3RiL2xkeXA0bGRRQXNGSkFva05VYTEyRTVhM2pLMjJ1NlZq?=
 =?utf-8?B?QnUwK0ZmdmZKMXN5SEs0R3dQeEhnNnE0c1R6QWZhdzJsMFFadTVsZkpxV1lQ?=
 =?utf-8?B?c1FRa2t5WHFVOWNKZDh0Vlg2YjhHa0t6dDdaOHhrSndSNWtObm5sQjc1RE1s?=
 =?utf-8?B?dzgzWEdwNFpFVzAyUzA2MENWdFNGT29RdVRVdnJyeEFheldtZzRKWVhqdzlN?=
 =?utf-8?B?YU04eDRkblBBblduS1lsd1dySzNybmhpRnlKL2VBZGJyUXgwMnVqNEpMQTNG?=
 =?utf-8?B?T1FSOVB1MlovZ3Y4R3UrMnhhZ2JTVE5mY0xGUzVjNXBXTEVTSjdUSjlIOXpD?=
 =?utf-8?B?YlNKTnpveTNIRDRXbHpFV09LMWlyS25QVk5tOVovdEFZWjJhbWd6WjdaM0ZB?=
 =?utf-8?B?RkE5NGVISDV5SmlCOEFwTmFMY29JeGFZYmpkWDY1LzU4cm1vZTYyczR6Ly9p?=
 =?utf-8?B?RzdTMzlrWHE3NEVHc0E4OXphTzhxbElMVER5czcvVGMrNkVJQi9Fak54bzQ5?=
 =?utf-8?Q?ZofzN/peyYdnU5DKOVdkxGuEugtttd62Kz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 16:55:00.3993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: e9021402-db96-47f3-de2c-08d89b9a0048
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tojf75YXaky7BQvK/n6+HqvTTaEjOQiADirxGRP56YnfvziC0PDdmoYxhIdiP1fxMqMoPbNyAJnoz2b/gfswrLdw3BKxW46gZt759qvpiXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5504
Received-SPF: pass client-ip=40.107.7.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

08.12.2020 19:27, Maxim Levitsky wrote:
> On Tue, 2020-12-08 at 18:47 +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 08.12.2020 17:21, Maxim Levitsky wrote:
>>> If the qcow initialization fails, we should remove the file if it was
>>> already created, to avoid leaving stale files around.
>>>
>>> We already do this for luks raw images.
>>>
>>> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
>>> ---
>>>    block/qcow2.c | 13 +++++++++++++
>>>    1 file changed, 13 insertions(+)
>>>
>>> diff --git a/block/qcow2.c b/block/qcow2.c
>>> index 3a90ef2786..3bc2096b72 100644
>>> --- a/block/qcow2.c
>>> +++ b/block/qcow2.c
>>> @@ -3848,6 +3848,19 @@ static int coroutine_fn qcow2_co_create_opts(BlockDriver *drv,
>>>        /* Create the qcow2 image (format layer) */
>>>        ret = qcow2_co_create(create_options, errp);
>>>        if (ret < 0) {
>>> +
>>> +        Error *local_delete_err = NULL;
>>> +        int r_del = bdrv_co_delete_file(bs, &local_delete_err);
>>> +        /*
>>> +         * ENOTSUP will happen if the block driver doesn't support
>>> +         * the 'bdrv_co_delete_file' interface. This is a predictable
>>> +         * scenario and shouldn't be reported back to the user.
>>> +         */
>>> +        if ((r_del < 0) && (r_del != -ENOTSUP)) {
>>> +            error_report_err(local_delete_err);
>>> +        } else {
>>> +            error_free(local_delete_err);
>>> +        }
>>>            goto finish;
>>>        }
>>>    
>>>
>>
>> Hi!
>>
>> As I understand, qcow2_co_create is a new interface and qcow2_co_create_opts() is old, and now works as a wrapper on qcow2_co_create.
>>
>> I think it's better to do the cleanup in qcow2_co_create, to bring the feature both to new and old interface in the same way.
> 
> I think that the new interface doesn't need this fix, since
> using the new interface is only possible from qmp which
> forces the user to explicitly create and open the file
> prior to formatting it with qcow2 format.
> 

Oh yes, you are right. File is created by bdrv_create_file() in qcow2_co_create_opts() not in qcow2_co_create(). Still, I think, you should remove the file on any failure after bdrv_create_file() call, but you remove it only on the last failure point..


-- 
Best regards,
Vladimir

