Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0362FF502
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:47:52 +0100 (CET)
Received: from localhost ([::1]:39624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fvr-0001wF-Jo
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:47:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2fse-0008Pl-W0; Thu, 21 Jan 2021 14:44:33 -0500
Received: from mail-eopbgr10103.outbound.protection.outlook.com
 ([40.107.1.103]:27366 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2fsZ-0004pQ-Tw; Thu, 21 Jan 2021 14:44:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9E7WNUi+SYxtPImbqHs+fTydTpDASgS06TI8cyjPlQtO+jmHJyZEt+r4CNt0jh/3pLOkAXDtKRoBo148V1z1rQjwHbdsoDRq3MArGDUeoU0HGJjwd1UYVgN4MYnGtU6JtaDDK2suX73mLv/uYmW9rUF9B5QiLL+BQFlZx+mxAkgidZIBC/fPSBm9HTEcAWdxGZ7hFOJDXijCZgtvdO0y2PEKKlynP+xz6z1ZoRaJfeYKsRyWERTNoVAD1nkSeT8bB8ihD566JnmZaHvN8UXwUpNNHukX/xNl/2/YkiWK9ZbqmL388HGjr7AK60LIM/9x8/lS80bL5lZPFTcTu0i1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLcXXqk80wGacmXhyqCb2eZnt1xsHa3bsF3Dnum1Mag=;
 b=ja6YiuiXWXTHOPioM5PofEVNrUhw1bmwqzsvz2ClZi1riGYP0uwt7nycMA0H2/Bd6VTtAUY89RGDLSO49yY7ZYw5YWaWFcav0AUEz7KqbPoDgBdZ4WtpayAQFveehke73XrbdUGd3D+QGSdtmPmnbRqSGrYTY7OcaM0dcg/+A6ytXpyETDUNsqyiUyOEbnPbBvVou1HSSIu0Bl9lhvwwoQ5UvgxSmtYwK47v/HzqhkIzrHqrsJHrRA4rHgwUJTFblM7/wrTDs8d0bkOfeOturXaKqd+sdPImXF1I+0jAoeXqRXAX9ZSweCiTnK5ObyzFRB1FhYS8Zc5kXG3PsIFTpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLcXXqk80wGacmXhyqCb2eZnt1xsHa3bsF3Dnum1Mag=;
 b=sPxnI+co0AJFDNi4jKhceh0Eoy4EE5bBiWMsbNELztlI+hdZL/mEblZDPjWXhnm2D8ugGVrQiEqO75SqmFUdgMRqS5xtFwwmnFELPlCgVNgIdTtyprOwH4i/qE6uI9hagZ0lM/hve2pFWYgNAsVnyiT/1kDcWx5RrCa6ssLNXfY=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4021.eurprd08.prod.outlook.com (2603:10a6:20b:aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 19:44:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 19:44:24 +0000
Subject: Re: [PATCH 00/11] mirror: cancel nbd reconnect
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
 <9929c251-603b-9d22-30c3-d8261d212e1c@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a76b99e4-afa3-63c7-5d33-523480ce9ba3@virtuozzo.com>
Date: Thu, 21 Jan 2021 22:44:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <9929c251-603b-9d22-30c3-d8261d212e1c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM4PR0202CA0004.eurprd02.prod.outlook.com
 (2603:10a6:200:89::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM4PR0202CA0004.eurprd02.prod.outlook.com (2603:10a6:200:89::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Thu, 21 Jan 2021 19:44:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 201614cb-d441-40d2-8203-08d8be44f4c0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4021:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4021728068C2781BA408DA0FC1A10@AM6PR08MB4021.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OrjweInq28j4nKINDm6miH8CnSqWicr8Yp3wZjCGlL3I7GrGaJNU2hRsdGGl3losjUBW/g/htK4T0vON4c9H1R9WQRnGV/EyUYvY76LtTVWwYazax+pRf0lCMz9QEEDTvrk6kkhXZhtIJpssy3Kb4Jk83MHH3LI1jNeJhQX86SbsqWNtKFEcQciQaFqqeqj5oYVNZVaFpeBWFKplgAaenOU4s0w6eI4xvOZ4zUT0pmSBKgK8611Mk5hidK66MIypsK2X3njTinlNMhuxXswYkGUXQ1hDLCEnWjL4B3jozfAI5kucAGUPC5fA3ud2wAedLfOW+y6WY5ZZzpcRjL6fwZ3tX8YHnFOa9Flw40srQktjhXDw0SkPzNxrtlGu5U6tB3mLuHtQPnDjQtEZvNXtbV479/uCEF9ywfoBsAW8Yb4NhMR+DWgl4sqwjt5HsR14JfFfdmvDrNlWAO89qcRbdc7llaWAzkKNbjTw8AhkqJ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39830400003)(376002)(396003)(366004)(66556008)(16526019)(52116002)(53546011)(4326008)(83380400001)(31696002)(36756003)(66476007)(107886003)(186003)(66946007)(86362001)(2906002)(478600001)(6486002)(31686004)(2616005)(956004)(316002)(5660300002)(4744005)(8676002)(8936002)(26005)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ym1CS1dHNkJNeTFKWHNRd3kxU3NSUSsvMTIvdWtTZkpqdVAwczhLbFF2Y3Iy?=
 =?utf-8?B?MXRtaWlLa1h5RnJtZTlKUzNmcGtzWm0vUGhxVXlkMWJBZkg3OHAvWXlvREg3?=
 =?utf-8?B?bWxBcm93bHJJVFlZR24wbTJ2TENwZXcvNTY5VGZ1MEZZVk8xTnV2ckg3dkFq?=
 =?utf-8?B?UDBYNW9Da0gwOHlkbHlZaCt2NUFVVUpERDBZSXQ1bnhZRjgyK254WVVMUnd3?=
 =?utf-8?B?bVZBMERiVU15NHpxVXI3UXlVU1dXcUs1WUdFV0E1dEdVb3ZPc2xlTkUrbytq?=
 =?utf-8?B?QXJJa3FmVzRlZjR1eTNmdStZdGtWeXFpeHozT01QdlpkZXF0b2Vrei81VDZ3?=
 =?utf-8?B?MHU3d1pQbXpCZGRVdUF0ODFTbmUrdXdwNWUyM3JwbnNvTXhUK1BwaHZQM0Y3?=
 =?utf-8?B?RXJOdzJ4WEZ1eGhNVjYzaEllTk9Wa1J2V3kwekVOU1VNNXVqR3kwVjNMTVM4?=
 =?utf-8?B?ZGE4K3ArNjNxVUVrdjBzOW54UWRmMkdWN1R3NlR3N2JkcW9HeVowTlgvWExj?=
 =?utf-8?B?dUtIOWdPV09QckFrN1gyVi9pU2krWENKa3NiR0dXM0tyWGVvYndIdTROQm0y?=
 =?utf-8?B?bzVCZUdDdWpiV1J1OFhQNlJQQWtyV2t6MThtVW5ZcDMxNXJsOTBrWm9CclNy?=
 =?utf-8?B?ZEs1V21SZFNldnR1QkpFUlVVVW96OTczaXk1Rk1nbmUzdE0vL3lIQ1hZb3o3?=
 =?utf-8?B?L0lMM1k0Q0Y1YkJQc1Z2NndoK2c5N1U2Q29LSU1ZTlhST2ExYVZUTkYyNVhv?=
 =?utf-8?B?NFNYQllDVExOT1JiVExoS0lKYnhseFN2TTFLM0pYRXJCUzFBN3ZFOUtxOVJC?=
 =?utf-8?B?Vm82eVVVTlk3bVJHZFdJdGFkTFI5OGZzWDlka2tENmZ6b3pKdWdCcnNYWXNK?=
 =?utf-8?B?Nk9zWW9WRisvNE9uN3ppanh2c3pWbURTWjdEQk0raDBPazk3aTI2ZHMxZ3J2?=
 =?utf-8?B?T2hSV3U1RW0yR2JSM3JVdXNSSTVMU3BFcFpPYllvQzFMWHhqVnJ1THJlOVFa?=
 =?utf-8?B?WE8wRUlGSXBlK29wcTJOVEt3VkozbzByVjBqNmhXaU4xeW9uR29nY1cybXhT?=
 =?utf-8?B?QTcxYUJINkNoQkM5NE9sbXZuK1BPdVBhenlEaHNzaHJBbnlkbHgrZ3gvSTZF?=
 =?utf-8?B?dHlCK0VnMElKT0ViMmlkUzlhclcyU1JTekM4dUZ3eXJJQXdhLzcrOCtjM25X?=
 =?utf-8?B?R2hoN09zRHB6UVFmbmFUeTVlZGgzR1N0Q29SMGlqRUdsKzNqR09JQkw2bFlr?=
 =?utf-8?B?OWd2Yml2clR0alA4SnREbU00Q1lmMnlFMVBINTF6UE05QlZ3NndKSGltUVVB?=
 =?utf-8?Q?5G+TAWo1/ebtzNH+dO48ZuIWfPM9U1ei+4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201614cb-d441-40d2-8203-08d8be44f4c0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 19:44:24.7226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hrm8Ux/Jsi6aIrIhCPTMI1kE8fsSyfzFeN3MGwQu6b83q/Qx5j7gx3U/dBidKa8xikZtiLYcHMQkl4XFjZhGSRDYWf2/aSyaZqB8YzFM2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4021
Received-SPF: pass client-ip=40.107.1.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

21.01.2021 05:14, Eric Blake wrote:
> On 11/18/20 12:04 PM, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>>
>> The problem
>>
>> Assume we have mirror job with nbd target node with enabled reconnect.
>> Connection failed. So, all current requests to nbd node are waiting for
>> nbd driver to reconnect. And they will wait for reconnect-delay time
>> specified in nbd blockdev options. This timeout may be long enough, for
>> example, we in Virtuozzo use 300 seconds by default.
>>
>> So, if at this moment user tries to cancel the job, job will wait for
>> its in-flight requests to finish up to 300 seconds. From the user point
>> of view, cancelling the job takes a long time. Bad.
>>
>> Solution
>>
>> Let's just cancel "waiting for reconnect in in-flight request coroutines"
>> on mirror (and backup) cancel. Welcome the series below.
> 
> Because of my question on 4/11, I did not queue the entire series yet.
> But 6/11 was trivial enough to queue now.
> 

Thanks!

-- 
Best regards,
Vladimir

