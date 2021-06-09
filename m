Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAA33A1A61
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 18:02:36 +0200 (CEST)
Received: from localhost ([::1]:36156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0f5-0000ef-JI
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 12:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lr0Sn-00042V-45; Wed, 09 Jun 2021 11:49:53 -0400
Received: from mail-eopbgr70137.outbound.protection.outlook.com
 ([40.107.7.137]:61761 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lr0Sj-0004Q6-SE; Wed, 09 Jun 2021 11:49:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7Co4EYzBj0KRiNJ6AjlDn/l4/a63gfQq0KY72lCkWRRosPOVCNAKpBKr0OrNQz+MCpbeKKcSLxwBQmG0uFWFYzVcHwj0VhXXnJSbef7884GTFUym0M1CXsZC8drEy3F6tqTwVOxjQKLVrnZZbiVtwDlsVm79fhJfkLS2tzc7g8MwAg8fVfl02SowzwHYB2xL6kX6JnasH/ZGwen6YRN4NiIwpMwnEuQyBO7IwEYvIZ8Q2yxizbIQc2NxyA51GHrjQNrUGnmyMn+toB4MB4H8USTeSDH9K6dFF77QnlFheUnwRefSQS29oWNxEIbilz/nUm3vgtBK1TKZx/6cqgI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ly5lp9kx020b2H7a1a+4jwFoMZ8EwyaR4UqXa+1GByE=;
 b=KQ9ILvqRsbuch9QCr42RXdG9EelTqXPkIKWhDS9UJbauc3Uqvf8anh1CounGa9CCvjA2j3Q/ilIYKtHpfq/Jl0FggisL/v7c1yoMT4/xk9HDfqiWIClR2IfIlFPfGyPCxwfxQRo/xzOZSuVt48u4HlIA+FLHYqOs9fXjy3rf42Zb50YZ4DTbPeR7pXCxebejylGmsouqBgBPYN1eiE3R4IldjzhvfuRpQGw9WQniLTvrh+43pK6dEH7fBcAhenQSaob7z8SiGF4ZN1FKAzSqd7Z2ivyh/mJCWjgrb7T0d+MOpR6G4rYLFrHxbp5+fEDX6cn3FuRqYh9AYcMwylmX2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ly5lp9kx020b2H7a1a+4jwFoMZ8EwyaR4UqXa+1GByE=;
 b=S2omkJ6h7HfSBnS2Qq+ViLmRAwgwTWQiDEP4KziWH9pSaRVHuTe/EF46dmX+Q3fk9mrDJiIAVo5oDmP2qcodSDiaVV3biyn5MaF8e+nY297a7jeGahjNST10Z8FhAuHAklKk1klUboiIhGpeEV2KaPrxH2s2DlaJIHHVrBxbSBA=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Wed, 9 Jun
 2021 15:49:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 15:49:47 +0000
Subject: Re: [PATCH v3 14/33] nbd: move connection code from block/nbd to
 nbd/client-connection
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-15-vsementsov@virtuozzo.com>
 <YIiUH3m0GYUajo5P@rvkaganb.lan>
 <84aaa2dc-7a86-c540-fd82-6729d568cd50@virtuozzo.com>
Message-ID: <567676c6-9e1e-b7d8-2c57-300cf454b2fc@virtuozzo.com>
Date: Wed, 9 Jun 2021 18:49:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <84aaa2dc-7a86-c540-fd82-6729d568cd50@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM3PR05CA0088.eurprd05.prod.outlook.com
 (2603:10a6:207:1::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM3PR05CA0088.eurprd05.prod.outlook.com (2603:10a6:207:1::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 15:49:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 928e7b50-0145-44a5-f826-08d92b5e3527
X-MS-TrafficTypeDiagnostic: AS8PR08MB6870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6870D5805089E4A0F61E09F0C1369@AS8PR08MB6870.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:161;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iZGDek3k3kmWip4H9x71NyFEaAk7Yv48PL/hEPXlLvkdG30choPN3tETIXWfzJGsSHxAUwFcHL0Cvk6u2Z+JFNByVLLltOdo3GRM8Tt3j52du+/tLfhhPT9xqcD7nTh3JiBsrvIx7Sc+acn3Bs1BDBoyO+o5ZQUD9/Q3iDrgdkwXCLYJCXi0ge7OskkjFtvsAiP0sQJ5FUcqyWGbUElsHBzBiXhqxnr7dvt0igp6h/ph/agRxorOw7c8kHdaJMLgrwjhdwcRG9BDDgAEH9AYCrxxSzy6A2jZgZfP/XIVRzK14NYoq/Ixct1aivqb6smQZhfQt0Z9kIm/VDKn19TKtnzzYJoiUTelfNLx+7gTilZA/LAkG2nMEbYYvdVjzjKAfJjDC21VPUKc7LEDTooB9PyA2J3VLaHaWy+KufGw0dv8y1b2LCsaHW4EyBvFBhJlWOxqkIix02rsdHFwWyppaTpfdoNw7/blrc01YDQNOHL82q6N7zj/I/NQERwoCiID0O2bDfWiC2C0qm6dKWV5bWQxQtmlIGW5AR48jMH0jhD2+G08avyqTGOJZBLs2ZfetggD2FH5FdvmtoA1vSGxRZxkSbtxci3X0mazUwMvK3fcA1yvRIbsxiyzpNeYNUDcStLjyrE2ypTcjeSFn98o33pOj21Fv9aAq2qJQnFWKaZEKoNmL5F7vrWvI7Y/sFLA7FDPyxTxdzRsoHT1bzfYFO4ezbO96FLByHsD0mjwv2Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(136003)(39840400004)(346002)(31696002)(6486002)(83380400001)(2906002)(66556008)(66476007)(36756003)(316002)(5660300002)(2616005)(16576012)(52116002)(956004)(26005)(66946007)(31686004)(38350700002)(38100700002)(86362001)(478600001)(186003)(8676002)(8936002)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NFZYRjJLbUhGWEVsU3F4MEN6UExPdGhMRFpzK1Zzb3oyU05kN29DbDRjYXBG?=
 =?utf-8?B?bVFFV0FWSXhXVDMwV0lBcytKcWhnMUQyRCtPWDJSM05kNkRZelY0NXRaWlIv?=
 =?utf-8?B?Nmh2MDVLcEJCWkJLaDRVLzc2anZTRDFMckxtZEoxSkVYd3VSUWNmUEhIajNl?=
 =?utf-8?B?c0RBUXhxQjV4dzBkakFvNlJZYkkrWEpWQVZmWlM1VTRrbi9aQ1NzdXArOUR0?=
 =?utf-8?B?MHlqbVNNdkVHT0o2VjVMSFBxNnBJblB4dU02WVJIOWZvRHlzTmd1dU00MlFP?=
 =?utf-8?B?SFZMUHBKN0VCa3liaFFESVF2TlFFd3d3c1E5Y1pZYzgrRW5mMXBBK0kwbHMy?=
 =?utf-8?B?Q3hwQ1NTaUM1WitENTI2K3l3YWUzdHpBeDh2U3RsQ3ozend4bWNDNThhajdv?=
 =?utf-8?B?OTZvUDIvTnVzaHpkYkdhMVNCM2ZmUXlZeWUydVE4S0pKR01iNkFGeWlCSHVk?=
 =?utf-8?B?QllzOXRTcTQzWkFOTUp6eDhUSVVDTWdVVVBIVFh4eHpQak8zWDlRWWhZd1pP?=
 =?utf-8?B?TTZMcW1hd3hETHpZOEIraHpaZ3QxaHdVdUJCWE5ZOE4rTVJSN01HWkZiOFBS?=
 =?utf-8?B?QVR6bWVMcDM4VVRnU0VVWWE1TGV6OEN0cGhKNDhUbCtSMUhkNUd2U0tscEFF?=
 =?utf-8?B?SFhzVnY4Y01SMzVJWmdpaXkvcTdmWDVIS1lIWUc0ZmN0bE1TTXdjVnpta3ph?=
 =?utf-8?B?RTBJWDBmajhWYUsrSWxveGFPbFdUcUdVcnE0NTB1V3dyOW40WWpYU2gwVHE5?=
 =?utf-8?B?bnVMNVI2dEpvYjdPRm5rcVdyb3RVczRHUXNwZit1M3FnNmhSQkdoSU9OVTd2?=
 =?utf-8?B?c20zYlVBZVVYSUdnTzlBSUNIUmtTbmQ3VUFoOVlsV1owSEsvY2RjWGdCenVG?=
 =?utf-8?B?blFKYjVpK2cwbU4vdXhsNEczdVoyVnZaTytmVWZ3Rm8xTWxHOWNBVDUwYThJ?=
 =?utf-8?B?MWhhSVJzeFBEMGo3d3Z0ZWQ3dUF3QlZWVklVcWl5enc4U1ZmNHJnK3BVTUJL?=
 =?utf-8?B?SWVxUWQ2RllBcTd6ekNIM3c3ckZkajlablQwbDR5NGVqNmRiV1VuOHZ4SEI5?=
 =?utf-8?B?K0xsTEhoZnJNV1NjYzRmbFRzUThSRlUxa0g3UFlvZWV0UFZ1TUtpVzlKdTQ2?=
 =?utf-8?B?Y3R3MkgzNEk5SHcvSDEvOWhsM1lQMlUxTlBtY0tRc2tzRTZ0OEpoeDc3ZmZY?=
 =?utf-8?B?WnZ6RDVMSktWUlI4ekxyb0dmSFNEYi9qWlQrVk9jenNoRGk1RDROdk5aRG9U?=
 =?utf-8?B?MXdVT1lsWVI4ajNsejZtemdxamgxR2hDbTFhSFAyRVdTdWt3RUxzZHcxeUNP?=
 =?utf-8?B?TzU5Ny9ndHV3MkpPZGd5TXh2VGcvYVBsNUU3M28xdjVTNzRSb1R2N0d3Zkd0?=
 =?utf-8?B?T1ZwQWtZRVVMdjA5QjlmQ2lPNnpKU2tzWDA2aGlVTFY1RVVkS1dONjlXR1lL?=
 =?utf-8?B?SW5ta3RUaVA4QkFWUU5ZNXRvN3Nnc0dmZmVVWkorRC83bXZJRzd1cFhOVnBJ?=
 =?utf-8?B?SnZBRDdNbThvd1pHZVNIMTYzR29laE5GZlFZbmxuNkZxNTR5ZFB3QVBWUWY5?=
 =?utf-8?B?SVZ4VTAwMGVUa0JQVFl4RmlOa2lUdzZGSTV6WUZjeFgxMCtqM2dDbXIvUk5l?=
 =?utf-8?B?bFZkZU1Jcmh2Yk80MGRaNUdGQ3pkOS9CNGJkMGVnY0NNbDZkbVp4bVVtRUdt?=
 =?utf-8?B?WWNsNTNGWEtPbDI3NTFEU0RKSmxTQlFYVnBES1kxU0U2V1BldWhkSTJEekRR?=
 =?utf-8?Q?4lUheRvl2vVVjJroee2IlEMVLjXOEaX9olM2IQd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928e7b50-0145-44a5-f826-08d92b5e3527
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 15:49:46.9712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dz9/8x2WZpDV7CPbxxVFtiwZ1G4e+5jO8wQ+QnC961NfcjOslnk9OrqqL2E9OZ6lEk6qdA304deemnLnxykCSEfhsVHZW6fleELvL3Bk8Tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6870
Received-SPF: pass client-ip=40.107.7.137;
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

28.04.2021 11:14, Vladimir Sementsov-Ogievskiy wrote:
>>> +struct NBDClientConnection {
>>> +    /* Initialization constants */
>>> +    SocketAddress *saddr; /* address to connect to */
>>> +
>>> +    /*
>>> +     * Result of last attempt. Valid in FAIL and SUCCESS states.
>>> +     * If you want to steal error, don't forget to set pointer to NULL.
>>> +     */
>>> +    QIOChannelSocket *sioc;
>>> +    Error *err;
>>
>> These two are also manipulated under the mutex.  Consider also updating
>> the comment: both these pointers are to be "stolen" by the caller, with
>> the former being valid when the connection succeeds and the latter
>> otherwise.
>>
> 
> Hmm. I should move mutex and "All further" comment above these two fields.
> 
> Ok, I'll think on updating the comment (probably as an additional patch, to keep this as a simple movement). I don't like to document that they are stolen by caller(). For me it sounds like caller is user of the interface. And caller of nbd_co_establish_connection() doesn't stole anything: the structure is private now..

Finally, I decided to improve the comment as part of "[PATCH v3 08/33] block/nbd: drop thr->state" commit, as "FAIL and SUCCESS states" string becomes outdated when we drop these states.

-- 
Best regards,
Vladimir

