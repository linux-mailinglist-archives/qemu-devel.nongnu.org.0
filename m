Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E67367518
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 00:18:55 +0200 (CEST)
Received: from localhost ([::1]:53032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZLBO-0005Ua-BC
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 18:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZL9v-0004zb-3t; Wed, 21 Apr 2021 18:17:23 -0400
Received: from mail-eopbgr70122.outbound.protection.outlook.com
 ([40.107.7.122]:61664 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZL9p-0005qk-KN; Wed, 21 Apr 2021 18:17:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ViGiVW8nsEGOKJTevnNmuc8HyocoI3LUZWBmZF7kkMjleuq3xwLVNX9DLeMNKFEYyzJa/GV+yRNngfRdrJ7INQZUiUqH/0RSQApgHh03Qk/LQRIHMDreljVn32exnUhcNChFqIwkhsGFp+I4T0Ou+0oZ9cbA/JC7c6NaVLUkkI2tGIA5hIiUENp5bJGfj1kMs99NOBkNKpnI9m1j0QY7EwCiQUofkCwzlSoRda8KSV1ThqpzfkD48XJROmJroP/h5FDyS8PohOR6wTKpmJLQLHnx/gWK0dhinKig7MSSO478lh3KxdX6L3gd86Xq5G/kfPLoJsXahUKX9HoJRWOyhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VcD+K2pSMtUr0saSavtRgieLlDa+zi+tuNwnLwP1yg=;
 b=CxBVgoju+noYec9XXAMJ+vcTGRIpHPDL6gfhXDGYr3n1YbHLeo/ktmL1gnL9slTjGK6FrSgFtqWGZV023Q2SUUYqa+0EirPbYptGRNrS4M/bKDbDAdYFvkESBfGHwJhga7yIMhz+aQycTtZT5j/EDAGTrZRn9QXqyYbUS9Q32DiCsSByJJ13DnKDekhPyhB1KIWbU4sm/PhbVHlrquvyvqrm492OT6dLCyMYT4wCaf3pJstctsUiBdo5wRxdiYQT2kaTrfqe82eld3EOTFVJlnghX7WnGY4d7TjtB6HwfppY2yQfb4VM7DOar4DYj5GLSLxNlF3SHo2f91NwoX8ylA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VcD+K2pSMtUr0saSavtRgieLlDa+zi+tuNwnLwP1yg=;
 b=HZ9F0yej+sppbQ+o0Tvv+n95E1gQ5T1mTR9bRsZVhB1BVQAyiuXx4DORtWfZVNXfsjGWlJjgLrxPUPu8labGvgRndrSaD8l9ra3VxTPm6IB9xDvGdiUaHHTKfrFO7qKQ6RINq8pN4HVXwfqd3lLkvZOYBC34wVLb1rHWlVlTx64=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4598.eurprd08.prod.outlook.com (2603:10a6:20b:83::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 21 Apr
 2021 22:17:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Wed, 21 Apr 2021
 22:17:13 +0000
Subject: Re: [PATCH v2 4/8] block: make before-write notifiers thread-safe
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
References: <20210419085541.22310-1-eesposit@redhat.com>
 <20210419085541.22310-5-eesposit@redhat.com>
 <4f1ff207-2a18-fea7-b9e8-a2e5191e82da@virtuozzo.com>
Message-ID: <5cabd2f3-f1e9-09a7-c0df-0a7eaa396c1d@virtuozzo.com>
Date: Thu, 22 Apr 2021 01:17:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <4f1ff207-2a18-fea7-b9e8-a2e5191e82da@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.6 via Frontend Transport; Wed, 21 Apr 2021 22:17:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 657ccc6b-b188-4a31-ed03-08d9051336d1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4598:
X-Microsoft-Antispam-PRVS: <AM6PR08MB459891D6AA26C899C34F4947C1479@AM6PR08MB4598.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9jA3CUV1Ces9YmjnjnwBlgfK72A8HWNrB2TEJM7lfR9evlqSXvonSwDxSEz8FEpw7SdBGfiZWVkpTsIbeQ7Ok9Cf8IiM5WtWQRDLv5Tk2ESZrqx2mNQ+7VQRTuzTcSCAfTdpxNAO7EIbm6iXdbFcgpL07LEXSNH4ePuRffLjTW2epeCqSUHp18Ed3thSDu6UwfxXLeiDD3zez6G9IHMtRsXLfYOzwHlU371uDCe93cWSwvFZBteCoOG5dScgdp0HwxXpfGS015YprZHw1xS5FKu2vCPFEe6QrAhgnIryyu5IPqC+O8BrOuuAs6QLfhwJEK1DdFSvSldverrs7FF6MaseJCDdlOu8nQIAWH6gtcBk7EUofmeZhHi0KJd7UedtDi17F/E3FghP4fD+zSVWsDaDgpYFEhxDAoxgeNSbYGCP4xqBwUhRASeGl47cbqS48+i9hgmONbdJaXqWBWRM5a643VaM7THbqXwjp6r7XnPign3CAgGrYvIPFXg7/qEvLqkaZbdaZ9smNMS+PbxLC4wG6vdoZZzjtgcgtTZcTYOOujI/mI86A3AwMWhY10+H8UXOUK84dzBUMF9BSzwaJUKSjDMzCxlZEqrPLwVFYCodLVsyCtJLUGJ7an56EalD2+dp5hHbMj9UbIeHYF4r1zoeeWBExaNcoYx6yVuWQwaPUCDy6gg8DsOAB38BBZ/t0MNTky0SmvF6b9hBJHmluw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39830400003)(376002)(346002)(136003)(366004)(7416002)(16576012)(316002)(8936002)(6486002)(5660300002)(4744005)(54906003)(4326008)(31686004)(8676002)(38100700002)(38350700002)(186003)(26005)(2906002)(52116002)(36756003)(478600001)(31696002)(66556008)(66476007)(66946007)(83380400001)(956004)(16526019)(2616005)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SU4wVXJteit2QThXa2RES0pNclh0Wlh5OVIzdjVtc2d0NmpTZ20vUHJGTkw0?=
 =?utf-8?B?NWcvWksra3dGM2F4d2Z3TXBzMzgweS9mMC9UcEVyR1FDdmVsbWJkL2xGYVF0?=
 =?utf-8?B?VVJidjFwbWZrcWhsMFRmM3AvSVJUWUFmQnl6eUNRTmlmdVMzVUl6aklqSWxi?=
 =?utf-8?B?Qm40WmNrRGI5VG5PeXMxNzkxd3dNTmJvbmxycHkvT0F2ZkYwKzFPVk8yRXNF?=
 =?utf-8?B?UWRUblVOVGNEVFc5Z29JU1lRajc3UjBXd1ZIcnFkZHpyTXkwRks4M3NhTlYy?=
 =?utf-8?B?T3FVb3ptRnhKZmdib3UyTDd1cmtYb1FZdmdzcUN4TEJPWm5UR2pBMm9zRDl1?=
 =?utf-8?B?RWZEWEZGQyt1R3doK2FTWlV1R01QT2ZqRmhYclV4ZTZDOGRBS3Nyemk0VEJS?=
 =?utf-8?B?aXRWeW1scCtpQVJRdTZ2WWg4MGZ6QVNKdEdxK3hjc2hWbGcvL1VPYzNhWGRS?=
 =?utf-8?B?NHV6Z1BtV1ZjaXN4UzNRU0loZ05jMkdvUEJmb3MzRHVoVTdZTytYWTR1dUVO?=
 =?utf-8?B?eE5qalZ3UWZXeHNWLzFYVm1iNkFoZTJJNm5PMDJkSGZwdlRlQ2tnZWsyVmpK?=
 =?utf-8?B?MDVSNjlTVVpsT0RWQXZkYVQ5VFpQTHVETWRINGZVMFJpZjM2Mm83N3draDZQ?=
 =?utf-8?B?bFMySVdXKy9rUEZWZms5QnNiR3lIbTB6Rjc4cmFGb3dHT3VrNEFIZjBJMUZV?=
 =?utf-8?B?SzFheENWN3BMRTZyMktGTWhzM3JWY0IrZzhVcUV2cjZjUm9JclNvTytid21I?=
 =?utf-8?B?WkxYNkkyOWlDdFdTZkVWaW53b2dCWU1TMjJ0UTM3Q3Urb05sYnVhMkZ6QXMy?=
 =?utf-8?B?bjVqVmRhNXcxQjVkVDEvUkpjUDUxcEJpRCtFcWhXRDJ4VmIvelVtZWhMa2JQ?=
 =?utf-8?B?emlYMjZoZDBNMDd5eVZKYXNaMHRHWlpHSHhkaC9aUnZrR2dDMGdoU0YvOFZX?=
 =?utf-8?B?cjlJelBuakFZYnJZRXJ5MTg2dzRwRlJTMTM5ZzlCak5JM3cxMGVSenIvTEht?=
 =?utf-8?B?SFUrUEdEc3JhVFhvRVdGbnVtSFhqUEtqVFVrRG5YelBKTmJPRlllZzF2T295?=
 =?utf-8?B?R2d6TG85WStacVZldnNPTkZmQ1JKMDVCY0hDSnVPM2JhMmgvVmJOYzhXc1c1?=
 =?utf-8?B?NGIzOEhIM2lNcmdEYlJacnEyangvS0E4czRLK2ZTMmdUVWdvTW0vY0EzcVNG?=
 =?utf-8?B?dEZqRE10WEtDcTlxWXkxY2V1UUhVM2dRWmhzWUExMVpTNmVOSVN2UUpHVVZX?=
 =?utf-8?B?Z214ZW5KNkFEWWU0UDFSdUVRNE5lRTc4d2hvSFUxY2xLKzR5UXVIbDlHRGFU?=
 =?utf-8?B?WlFsc0RtWEVsNUtGbFNzZ0Yrd0szOGRHeGM5MTQzSWx1cE9sYTlyclhwYy9w?=
 =?utf-8?B?TnEzdlNDRG9rQzdVNjYzaE1IMGRqYUVCRlNEOSt3cG45Yk5Ob0dtRk9ISmo5?=
 =?utf-8?B?STh3d0FFMnU3VnMwSGxoNmJ0MmNHdnZTYi85blU3OUJHaVBCYXp3cVZWcDJI?=
 =?utf-8?B?S3dkcjBQemc3SnR1K3gvYzdNWkxWMXBQbW05SC9adzJCWEJzVGkveG9rcWxl?=
 =?utf-8?B?RDJCRWNjekxTYld3ZDdORmpXa3EwbktKM2JCRUtIRVJTdFBTL2I1UytNVjdt?=
 =?utf-8?B?aTJuYTA2UlhYMVE1TThScFBhZENEeGZERGs2K2ZCVzcza3daNStPYk1zWU56?=
 =?utf-8?B?Smo3aXV3NHVUbCs5SCt6VU9lMXFCd3FjRnFnNU1OMEd2L3dvZDI3K3hQTDBY?=
 =?utf-8?Q?8j7z4RyCMxXPyaZvrY++sh5JcVzeJm3is18BMk3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657ccc6b-b188-4a31-ed03-08d9051336d1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 22:17:13.3180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnQm3xO6R3k2SKri/B4HwOdo0VpPHC8X+QVnGkyByklLu9TEzI6GalaJ36Hf2uPWaYx2m7z/Y75LEo3raTqedQaheaeqd8UqyJ1NdyqvH0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4598
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.04.2021 00:23, Vladimir Sementsov-Ogievskiy wrote:
> 19.04.2021 11:55, Emanuele Giuseppe Esposito wrote:
>> Reads access the list in RCU style, so be careful to avoid use-after-free
>> scenarios in the backup block job.  Apart from this, all that's needed
>> is protecting updates with a mutex.
> 
> Note that backup doesn't use write-notifiers now. Probably best thing to do is to update other users to use filters instead of write notifiers, and drop write notifiers at all. But it may require more work, so don't care.

But on the other hand.. Why not. We can go without filter and still drop write-notifiers. Look at my new patch "[PATCH] block: simplify write-threshold and drop write notifiers"

-- 
Best regards,
Vladimir

