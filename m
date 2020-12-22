Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4092E0E1E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 19:13:11 +0100 (CET)
Received: from localhost ([::1]:48452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krm9l-0000OA-Tl
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 13:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krm8Z-0008Il-TZ; Tue, 22 Dec 2020 13:11:55 -0500
Received: from mail-am6eur05on2122.outbound.protection.outlook.com
 ([40.107.22.122]:20392 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krm8W-0006be-QA; Tue, 22 Dec 2020 13:11:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hU5yL0rSNgJp16qnpAd1j4fkm5zBdMag2g39LX6XAzFXkCmsj5NnbMSeSRhVmPzTBB6CQyHkO9gbKWFAZ8V02afm65gCTN+Ljbkk0XeH9pgg3W91kzD+AtL7XMm3PW2Ko3bj//upV2rfeWSAPBcuMX1OXxfaMD9LMLAt2dOvh9mjnQuJqIJFhGRozU/ZTndtMuwDLsTxdNk7onpwHMXE8e2S7HH2jT9YhPedHE7aFeB22Cug6qL/XYqHZRtZ9J0TnT4Mju65EkvutXDglXIsh23HlaB9jPwTQNFdB73ZJpGNIYCEiasffiS+Wcwmr9uXnCTxxkulXY+Z/bZPDrFqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRDOdlREUZyT1IOMReAFnwUVpiVc81ngDvfYD8O5+ow=;
 b=ltipTO4FhYhOoyE0LjkChsIpqDIxlXaTMCN5RcQ9xymgOAwhV+Ov4PI5P1ttaQY0mt+IMEgOfL6YHNGUspXCSILFHX9h5rgj/j9juXIM2HVHRgJwHvnGq1rOxzEFsJZKAY5ojz3QexWXpTVjNHB5FDlGMoDBNxTmgGwG6CBF5P0Yw0/vSH57qdX5YQGfTHFRlVRCUPSRZdyVQ3j6my4uAVIsGBNoakcPRgVACf6MfFk+GMZZ9m83UyMANrCdXZt/Yu7RACQCenNLNxESghCcVqncNuJdEyV2mp/mqoznC/A/zCqpGuGxTz3qGNd9K6Oh4px3XJcmlQeoIFSchXgRUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRDOdlREUZyT1IOMReAFnwUVpiVc81ngDvfYD8O5+ow=;
 b=ksi6zkc5CmO6cHKjELKKzxfp4y0RShHwMvtFcMY+5UhOmGoej2vioprMYre758uwtsd7LHnlgG/tZ7/B3pqPAoy/TDDAoL92NdpdRoLlNUW8XP904CPGE1/GYWGumvISXP+SuFMOD1m3Ym2qxmqr2dWLxkEWIg/UPNbo7PIRB70=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6166.eurprd08.prod.outlook.com (2603:10a6:20b:296::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Tue, 22 Dec
 2020 18:11:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 18:11:49 +0000
Subject: Re: [PATCH v15 10/13] qapi: block-stream: add "bottom" argument
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
 <20201216061703.70908-11-vsementsov@virtuozzo.com>
 <d7d127a1-e70b-4e1f-acc8-eaf9230dd70a@redhat.com>
 <4039f38e-e519-fe51-45c8-ce761587961b@virtuozzo.com>
Message-ID: <7b1283f5-5597-05d7-c73b-a99af9cccba7@virtuozzo.com>
Date: Tue, 22 Dec 2020 21:11:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <4039f38e-e519-fe51-45c8-ce761587961b@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.19 via Frontend Transport; Tue, 22 Dec 2020 18:11:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba02857a-3a7b-475f-6d9b-08d8a6a50d84
X-MS-TrafficTypeDiagnostic: AS8PR08MB6166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61662F7FA4157CDEED7C1F8DC1DF0@AS8PR08MB6166.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c4Fjr8vRq5Wag35OXb9fJpY+4qiN8hXnUltT47qi0hpGuJe2k42q1tPqrWWNRq9vS8XTxFCio1XGIUttqJU5sgkAjN6GDkQZNCfKhsLyZTL82aDt2ntIyZ+PDhpsUauAto5UvVFIiyf1gx29pSny7BPTKBjYseHGtnxOojDc5E6kZkFU8PdvpfYtbACqQbE0hdsPd83enhS0n+h8hbaief2pxXbCFr4dWXfEP+tDdm2t9YAS+00TiOZ7qTkzToMfL/1HZUnaWPEbUeTwS5Q9qiLC235s+edlRYYX6u4OBu69/+vrCi7wFkkFJxF69ERWLA6p/i3XFl/KDCVi9DNRpIQriouA+LdKGZPj6cY2qYteVGFYikM4Y2W4Np275ey/nDFi7GJ8y0E6bFCQsQ0NprZ7WGZqQe+Sqe5MnLphyLTMzYJlL/cvlwUkc6L/n58xjkfr9u2cWShDnCj7jZ0e3CbtuBjR61s1p/hEgK1gd8g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(31686004)(558084003)(8676002)(31696002)(2616005)(66476007)(52116002)(66946007)(16526019)(956004)(107886003)(5660300002)(16576012)(86362001)(36756003)(186003)(66556008)(6486002)(4326008)(2906002)(498600001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHBnRE14bjFLMElGbGZSUVBRRWNhUzBBRnJOb0FlL0hTR2tVWVdUdGRjSlZZ?=
 =?utf-8?B?dkdHd3VXQnppanE0VzU5eFpNd1NjL0NJREVrVHgyVVlsWVZTRHdqR3Rta05V?=
 =?utf-8?B?SUdSUkN5SWN1WS9wNXhvQmZEdUE0NkhKMFMyYnFic0tpQ1FBYXBhV0VFL1FG?=
 =?utf-8?B?NXNCUU05T0xtK1o1Z3lqT1Y0VGljd0JQME5ZUUNjOHdRVk9IejhzRVpTVUNz?=
 =?utf-8?B?R0NXTEQ2bVl1SktXdXFMbjBubWJzWVhsZkRwbEY0UXRER1dLOHQvV2Y4OGFD?=
 =?utf-8?B?R0tYcER4VTlOdXZBOTQ3MlBBeFNxRERRaEZjeDVPVFFRaEJyTk9GMTAyZzY2?=
 =?utf-8?B?UUtkMlRTVW91TVpKR1Y5K3BkK0Y4TWgvckhkV0YrOHVCeTQvQk0xdnZBc3Bk?=
 =?utf-8?B?cHpVRzVEVGRTQmJ3c2tLSkZZeUFyTDdGWDZvN0hkWU9BYlpCOU1jOE1hVEVt?=
 =?utf-8?B?UXZSOHRVQzVuRVk5WmZBOTQ0M1AxRnJrdi9BTXorOSt6NEhTZ0xmSHhsT1VP?=
 =?utf-8?B?ajFxbGR1Wm5vTUUvSk9wSmcxZi9oZU1TMm5YcFJaYy9oU3EvMVRQUHdEV29x?=
 =?utf-8?B?RGpvWFlpZVFTV3JDNUlWOGt5QzI0QjUwdlRyZkhoR1NlSThnSDFCMEc5ZUxx?=
 =?utf-8?B?cTJIQllBZ05sczVFTXhFYkxFUDZqaVB1ZU9TVHFqeWlJWEprRGtJV3NnckpU?=
 =?utf-8?B?OHJBQVhwT3RaSUdCVjVvM1lpcHlJbXlzVmowTFJ6MGgxRWswNWd6OFFIeVgy?=
 =?utf-8?B?U0xRdnBYZEJ5RWZTYVRWanByUUw5cFVXSVVRc2FOOEE2QjFNaEJ6eWJ4MUFJ?=
 =?utf-8?B?bXhMV25jcm40cGNRWVc1Y2M2dDJrUEVMMjRJZWFpL3pXa0pEOUxpbVRoSStu?=
 =?utf-8?B?amJmRmNPTWliSkRJWGFZQk1SZ3JFSEIrWjZyOXlNNU5qR2lZSFlsY2NTMDQr?=
 =?utf-8?B?dWtCUzNaMWY0cjRGOVpHRnZ5WC83QWtUdVZFQkFTZjk5WjlQU01LdWJNTWhy?=
 =?utf-8?B?bU9ucGZWZ21ReFhIYk1RZ0pDVnJrR1d6NEFPN0tueDI3ZDB3R01MSFNPWGRo?=
 =?utf-8?B?NFZDamdLVHNrWm5ZNTlubjY2M2w0R2VuQkNKQmVmRHdZR1R5dlVuRFdXdkIw?=
 =?utf-8?B?VUJKQk4yQnBqMU11N0FtWmd3TVg2b0xxL2JidU1LbW1HQ3FTNk05S3FCUy83?=
 =?utf-8?B?UXBkZmlQNHFZTHVXRjlSQmtLUGFFSVpuVDJISHpLR1l2NTZsUHRzbHNhb3Mr?=
 =?utf-8?B?bXVDVXd2cXUvdVhtT21FSjdBdGZjOVdHYjdQVFRxVXpaZkx3akRsY0FZQ1pQ?=
 =?utf-8?Q?rBQ5jY9IphgfwkTZXN8Z34P7RsudUVN/7P?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 18:11:49.8895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: ba02857a-3a7b-475f-6d9b-08d8a6a50d84
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAYPco2no+F7G3ywEwzeuGwJOHqC1Jzk7a9Rl4NDDRn5Ml9KCXOe6Vr+HCSOZ/HPT/OGteGiWcinh9Fb8xHgU8B1bRaThY17IqsGFZaRIN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6166
Received-SPF: pass client-ip=40.107.22.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.12.2020 21:00, Vladimir Sementsov-Ogievskiy wrote:
> We shouldn't have use-cases when backing-fmt is set to something another than final base node.

I mean, we shouldn't have use-cases when backing-file is [...]



-- 
Best regards,
Vladimir

