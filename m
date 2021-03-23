Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A243466B2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:50:07 +0100 (CET)
Received: from localhost ([::1]:38432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlAM-0002PO-3l
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOl00-0006rh-FB; Tue, 23 Mar 2021 13:39:25 -0400
Received: from mail-eopbgr70107.outbound.protection.outlook.com
 ([40.107.7.107]:13446 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOkzv-0002S2-1M; Tue, 23 Mar 2021 13:39:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjrlR7ltELg0fHj6Jz+PfnrwVkQu8KHdi5bz1okcQDQ8Ljj0B+p0l73pMCwAs0p9tcn/JkdySONDlgPa6OSKEuvmNEKH4LffV+fnvhE7RZ+ilEiSo+6YNl1tST3/W2TUxq81p3tlFYSrfN9t3qiuk33FszGvy3T8ztbAm8t8okt1wjxJU1Z+9ZT0p04r46XyGhJK8s/5NHR2QxtmnJ+bmLh6rQ2e/3PDQc0fuJ5pOrCfx6Sx+l/22PJ3sgy/YuTipFUSLKh6+D2WpfC+xSX8sL+h9j0OvEM/veeVwBJpr10ZhhvFYSpRdlXnW7arwtwxQA//xxlRPCeEo3A8J74BwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oO9zMEXx0G0HFEszmCkwKCvSgMRPRfUW5nP/5tG94g=;
 b=evrRjYjBxZs9XZAgZBzQ0RGffJTBnDU/CzdQaqkaqySWtHvLu3+pdGJpwFqt25GVhRY5pzqUjvmBbG57CmFukXqoBvv8zXqoooJk0Vo32VhZDSMidjodKxzbw5je72jWpn2MD53rQUUvascm+w4XtGLhGoa54aENxK+tsIKcUbK07R/7dUrvtXMIvhx5+aOFEVb0OlH2rSV4AZcJ/rN1qfxyC2mtrbiOe1/qvb576YCLhiwrw16d+WuwIl9Y7jqE9/5CrioSMBZ+sy0F5oNSZyw+q7L9SqXGlPR+qO6FwMYnO9pNaBbHHL5lgmpSHQ9h5nA+UUVBOvyRRFgp2Xa4qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oO9zMEXx0G0HFEszmCkwKCvSgMRPRfUW5nP/5tG94g=;
 b=ZZLmAQj1P9hxFLNmJ4DCLFQVM6bYlxGwSA/SKIV6/9M36r80o6ainuPLlVbE4P/jKNM3p7P5G80ge/44wv5BpScC1yny3WHDBhFhVSrKoPeyCCAB7jC/2CQVpX9YRazXwAQ95WORqA0w4PG++HwUpoEsmBBn0kBdxbf3cfrT1nY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6102.eurprd08.prod.outlook.com (2603:10a6:20b:23d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 17:39:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 17:39:04 +0000
Subject: Re: [PATCH 3/4] qemu-iotests: let "check" spawn an arbitrary test
 command
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, qemu-block@nongnu.org, kwolf@redhat.com,
 mreitz@redhat.com
References: <20210323130614.146399-1-pbonzini@redhat.com>
 <20210323130614.146399-4-pbonzini@redhat.com>
 <ac3b47aa-344a-a6aa-a1d8-2c2dba2d540c@virtuozzo.com>
 <14ed8b41-f8bc-b350-c859-2ac51a54663a@redhat.com>
 <b89670c6-153d-8434-da06-b212b887bc88@virtuozzo.com>
 <0046f47b-6a46-6299-5816-44b7517a207a@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b9f072bd-c675-5360-c0f6-a88cd4a6046c@virtuozzo.com>
Date: Tue, 23 Mar 2021 20:39:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <0046f47b-6a46-6299-5816-44b7517a207a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0123.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 ZR0P278CA0123.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 17:39:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c702aba-6107-4d24-3ea9-08d8ee228d98
X-MS-TrafficTypeDiagnostic: AS8PR08MB6102:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6102D0F4CA0452AAC57CB720C1649@AS8PR08MB6102.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dJvW6vNpV31LW2hq0f6sdK69pTtc1AWn8nFFuI3D9MLfPJHiv6bjEsnSRdCEuOAbC9RAzFHDqUy7FlP1GxFR4+aYy/hihHUiQm3x8BL2es6UUKUAy9hnAJvJXZOvZIrUCF8uy7JvqcHG9GAoCYyJYwtQOyt6ChFc+V2L0rD0yOfl3DH5+uLQZMOvsF0EHdjyg6ridQhoHFzRWCgf/qKghTlKxRPsSGIzBiOlgBkADXgZ8dFbZLDQUzcDNIx+QcxLXpIDdMAVktU3Fp1cHw0wYuo1jwV+ybZSFFp9OFMCQ3GTCPzTwgtKRwmh4YhSTm1EeKbgAwi/fgQO5eWpeTl1fEQO3ER5ar+aI3cLSqcQT7l8qiJ0D8R+10Ziwp/qXAbKaADQBOR9cdr/QlCq9gxJkv0mBZAUKToj4/w5neRJqnWdf/5Wtgur98GgnvItEqT6M/SjQ0A35FvMRIU2zNvMFVzkLNXKZfTfxUwKFfkb7jZBO1bzTDbg2BPEqnVNzxgpMwGlJBQ3kk/Sy5FSFKeMuKsiaI85PECqZdSgVm/3CaMcG5sP0qaya2VcuUpwfTSJkhjDb7ESJ+yCfYfNeblx8nSb8UyKWeXF8t41Mqd37Nmxoyeylg5zaJ+NYsFf1z7qceHdTHwmIanus49kteGoFSwOH/r2G0zusspNCd3PciKCn+/EgwoKNpB0JvCzuIJqe8m9CcfEg32cTrcCkUKTYyAswMEUwsIgEyARpzTNgvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(16576012)(2616005)(26005)(6486002)(186003)(956004)(16526019)(2906002)(31686004)(86362001)(31696002)(8676002)(66476007)(8936002)(4326008)(52116002)(53546011)(83380400001)(5660300002)(66556008)(498600001)(38100700001)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TXZPMWd6RkpoVFM0OEtRcGRQWWNKNEFWckdvT2QyaTZGTWNsem9ReTZ6cW1S?=
 =?utf-8?B?MnlEVHBGdXN0QWxqbm1weXhFV2o4VVlveWhSQ0lWTzFzbnQ3ZmZVdjF6bm91?=
 =?utf-8?B?bFIrL0VXNFhGVkFpZ29qaVE4d0ZlM3g0WUN2bDd1YzVlZkFONUFNNTA1clk1?=
 =?utf-8?B?TGFETlNZVC9HekV1eE02aWo2YnE3TGpoZnJlWGlCTFVabTRldk0vWjVrZjJH?=
 =?utf-8?B?VmxiNWwwQmdYSG15cVoyYk5BM0NRTUk1K00wbmlIcXJEd1NoRGJEeEJ1Vkd1?=
 =?utf-8?B?N2p3djBObmZOSjBwSXl5Z2xJR2p2RXlkcVBSY0hKbDBWbnFrNDJscVBzTU85?=
 =?utf-8?B?TDdOVDd1R1M4ZmhNNE11SjlOb0NMMkFyOUhhbDVDMlRsNnFYbXV6a1RmQWVF?=
 =?utf-8?B?UnNPcWV3S1FkMVRya3ZLeWZpU21xcThPcDVHcXFJelB6QUZGSTJmTDhxenVw?=
 =?utf-8?B?ZWpSRFdIdStpcEp3WUtrWUJTSkdkWG5vb0lnaDRxVWkvV1p6RzBRTEdTY2Mw?=
 =?utf-8?B?dEdtQ0FIOVFpOWx6aHdFY3pJbjB1akhyM3FwUVdzNXFMS1NhTjFzZVYxcFVC?=
 =?utf-8?B?Ky9tZEVSQTUrcER1eHRiOEl0WGdBR0xmNnhrQnZtdVZGN0lYbTE5WlliOUkx?=
 =?utf-8?B?SkhpOXhiSVZYZm10ejdCY3Z0d050cGlRMGlDYU93Wm1tc3ZBKzBocW1TUjBx?=
 =?utf-8?B?cWFGK3RnNzhvNDEzWDVWeFRYZkhTWG0xb05qaWIrR1pkajBQVUFiWGpTRjNo?=
 =?utf-8?B?K3ZONlZuajRqQjc0WURxZHJWYUdkTkhJc2IwN0oxNS8xdHpRUm5aWmozbVdD?=
 =?utf-8?B?UGkyYzFpQ0JHYmJUUmFleTRpblZIU1MzZGRmaGNSUzhMQ3cwaUgvNzc3NW5i?=
 =?utf-8?B?VlZlRmw5a3FVRjlpSmJ0cUYrMVg0YnlRU0wzK05SeDNxMFdJalFuWVhzSDFo?=
 =?utf-8?B?dDRIRTczYi9iNmdEY1Z1RjlleGRibTlTREVMSUdwbkNDN3orbVMzMDNxU2dk?=
 =?utf-8?B?eWYxcUJLcjFYbGs3R1REdEpuZDVqSWZDS2xhWCtaQVlhdDBJU3BzWUh3NnMr?=
 =?utf-8?B?aGhSc0pMcDRPYTRrQ01YakdoamdOVGsycWYvblRnVWlncWlUTzdONU9ZUmNQ?=
 =?utf-8?B?Z0pacHVIVnNTWjdBaFpLejNPVDJHZTBUeDcwTkxwOXNDYmlGeENXS0J1U1NR?=
 =?utf-8?B?RXo5WVFWMkhyL3hYbXdBd2VlZTNGS0hkTUl5NzRmMExzR2FSY0x0RDZFRnQ0?=
 =?utf-8?B?NUl4OW9JRzdrVXFkeHhKOGlpZ0NIK2JpSGQvRDZkWVdFNWVCeU9RbEUzY1pI?=
 =?utf-8?B?RmNvMnNPVFBwQ3VFN2VkTi9hTExod0dpMlN3Rk5vWWl0a3hmNnpaZ2hOK2xx?=
 =?utf-8?B?UGRDTjRLS1hlbHhuaFA0RGZwcUs2Vk8wajdNUjR3MVBEN3BFV3pFSENMbHRN?=
 =?utf-8?B?TUZ4cUZVQzRTYzVXY1pJV0tWSFJiTGU0VnFhUS8wRFVVZ1k1dlVxMWRFcENN?=
 =?utf-8?B?SUhIVEJ5QlpxbUs4Z3F3TDJmOWFUVnRKWHR6cEQxd3ErM2k0aXV6ZzFHVGlB?=
 =?utf-8?B?ekg1ek5ZTGVoellQQ0w0V2M2WVo4eVM4azEvL0hTdW0wZHlwTk5NYW1wUXVR?=
 =?utf-8?B?WGRqbHRwQy9zanAxdkRnYzQ1ME1QSVFGd0V1b25OOFpEQWFWYW0rbEV3Zll6?=
 =?utf-8?B?ejdzWGxEWld6L0N1WFpKN1B5T3NvVGQ5NFFxSWExYmd3aWNtbWRVaFNyeVFj?=
 =?utf-8?Q?JHQYblDkISZh2eGj52n2NikeaW9Vm5cv27DsDv4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c702aba-6107-4d24-3ea9-08d8ee228d98
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 17:39:04.6561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2lF/tNo+QBp8YY90/qD95BhR6QprXWtAOwqoRWsf46QexAt6gFZzpNbSc9pvAlZaREdyDygE76nx2okdVME/Fds7yvL5SAfUK1bM4a48vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6102
Received-SPF: pass client-ip=40.107.7.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

23.03.2021 20:22, Paolo Bonzini wrote:
> On 23/03/21 18:11, Vladimir Sementsov-Ogievskiy wrote:
>>> If you have positional arguments that must begin with - and don’t look like negative numbers, you can insert the pseudo-argument '--' which tells parse_args() that everything after that is a positional argument:
>>
>> So, as I understand argparse supports '--' feature out of the box. So, we can keep '*' as is, and it would parse all remaining positional arguments which are either tests or the command, and '--' will be automatically dropped. So, we only need to check existing of '--' in original sys.argv to chose our behavior.
> 
> There is still a difference with REMAINDER:
> 
> ./check aa -- bb
> => REMAINDER: error because ./-- is not a test
> => look for '--':  invoke "aa -- bb"
> 
> So I think REMAINDER provides the best behavior overall.
> 

Ok, with '*' you need to check that exactly sys.argv[-len(agrs.tests)-1] == '--', which gives the same behavior as REMAINDER.

I'm OK with REMAINDER too, still with we probably also need some comment to not embarrass next person who go into documentation and not find it.


-- 
Best regards,
Vladimir

