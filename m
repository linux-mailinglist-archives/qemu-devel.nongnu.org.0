Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5442FA7D0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:46:43 +0100 (CET)
Received: from localhost ([::1]:37780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Yby-00012n-Pg
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:46:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1Xxd-0008IR-Jz; Mon, 18 Jan 2021 12:05:20 -0500
Received: from mail-eopbgr10120.outbound.protection.outlook.com
 ([40.107.1.120]:4998 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1XxR-0007i4-Hj; Mon, 18 Jan 2021 12:04:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAn6OlDivm4kJ8PoTuAy806VzyefphIdAydG1OPlH23DEgZREkPklCseasOpwRz85QgSEpPcrFO33IUDWkt3Z6MbdWXQRV4tCTpva4tqWTSPr/esuRFrJFgVfJaMrQLVax8NDwii20+K+DHT2iihBCOBGOv+alxah2Leu0BOx/nScfDUbrXW/Gv5/MM9EAxw/HCg0ZhR39W2L6nJTOo0HEVFaqkf/UIHTi9KpCmAAUu+uiW8kRVmE/Mt0b5hUgsZUxb5a9D2ZrY927lKmV+sNXetS71Ql7A3I3ro2JOAbyWKUCGIP+nozkpLk9ZcPnWiPoPDCLKmo+7aXqiI6HzZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80pBH5+FbvojFtAjgAWH4azyZqfyySejun2AEBQ6ZR0=;
 b=iCr0MdINT5jrMBU1xiHVvg6zCXDSRImBX1XrJft6EluPh0f/rTleGKo9UUny1EN/bFQl3/cWeiPM4tUpzgHrEhfcREskj7/uSRGw0xQjX8HAK+y/cg8Y9G1V7tRtB4bC7BwN1DbGWdPi08qbdb2/PhUysqwkQbJL3V5c5SDAvYMjfvtqrEGDRq8kyBr7qx31N8lKj4lDnePr8+tBeg8W62rnlYhWnGh2VlQsAEcJIfHRn+Afglf9RHtW8IlMldvWBTeYAI8HKuk49upa8Hr+fv5+oMObO3/a+Sq7BtbbkBcithJXZtE/cwV297jhYvTUA33rMHOJrn4KMjd3clJf3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80pBH5+FbvojFtAjgAWH4azyZqfyySejun2AEBQ6ZR0=;
 b=iUT1aLTYDk5cw76gKt/F6vwBdQizXA2mWTZkbJFgp9xTDIiknOtMOje8e9giHnjTwZsE6MG6KF+JBLfw3/T6wbIRlaTEsqHsmvcAsio7eRAfO83UrAEFhEXuGFJGzj5DV02AvDVGlJlq544SsQJ28Q+203IQNl1CLGobyycTumM=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4535.eurprd08.prod.outlook.com (2603:10a6:20b:74::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Mon, 18 Jan
 2021 17:04:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 17:04:45 +0000
Subject: Re: [PATCH v4 00/23] backup performance: block_status + async
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
 <3d6f7b5a-49b6-bed8-8048-38552fa6292a@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <958b0ef8-8810-2be1-022a-40a9feaea81f@virtuozzo.com>
Date: Mon, 18 Jan 2021 20:04:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <3d6f7b5a-49b6-bed8-8048-38552fa6292a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.76]
X-ClientProxiedBy: AM0PR03CA0019.eurprd03.prod.outlook.com
 (2603:10a6:208:14::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.76) by
 AM0PR03CA0019.eurprd03.prod.outlook.com (2603:10a6:208:14::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Mon, 18 Jan 2021 17:04:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9441d96c-39e2-4a8e-dfb3-08d8bbd327c6
X-MS-TrafficTypeDiagnostic: AM6PR08MB4535:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB453592BB7C0CB1C45AECC5BAC1A40@AM6PR08MB4535.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tVnwexRdLgvaAfFf9LlhpzE/jID1R28Zdj9yscGduWbmvgtAr4eCSBEd6r1SfTw4N251Aa8PoHSTNaduc4EqBybEKKlkhkpaLXGR3A1VFDvkgmz1I+XVSyUZwX7EjFAOB3RSmn6QlVCr1vQ3UfofkBlfbr5tq2E7V5aHZDgQR8ERVpMAzOX88F4aLUOnC9IFGzXoLLRY8fF07A/HGG8qMd+oP73L3lBCgBjeqDaybqYDvhnhmSC/fvkvQ3mpBT1P04tS2HTgVD3tNKtXf0Z7PD/N9Q9TjpRBzmRn8IXmm4keJT81MDEFOHXoUdAn3kGDg0uQznrENl51ybCTVVeIXdivXX2s1EbLRYzz9zFw9LqVYc6+7ju2NIBSSoHhWt8Rfi3Xk4hl0XlK7tBn7AfH1RDNsCqMTP/E59NP1ZGT0cDX5xGaPe2LXmivVHEJ7mKHysCYaLSvKztIDTG5fAb+tggO7pinw39LH+wR1LwTajpGgAUbeiHrakyXvEcdzm6bQRHhsPAjCUZLTig/Ml2qxhyrfLMZCrTnG/6Ci2MpzgUoF7GkVOyJ3MXd6XTTXmPG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(396003)(366004)(376002)(136003)(16526019)(36756003)(186003)(2616005)(31696002)(53546011)(107886003)(26005)(956004)(66946007)(66476007)(8936002)(5660300002)(31686004)(6486002)(16576012)(66556008)(4326008)(8676002)(966005)(2906002)(478600001)(86362001)(83380400001)(52116002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aENHRVJ0eHJuR3ExTW94enF6bm4vVEl6Wk1sdEtNR0xMd05VVXBCOWxJcytZ?=
 =?utf-8?B?bUJlMExEMjV2bExkS1lLVTZzNTBFLzlSamdTOEtadElIdkhMaHlQdHh4SUw0?=
 =?utf-8?B?U1pRWktEVmdnOUxTRUgvUFZvTEFhVTlqWWFmMGU5YVpvNDRuYlh3QmpZQmI1?=
 =?utf-8?B?VEM2UWpVeTIwdkpKNTc2V3g5TnhMWWZab00yR3FKb2F4a1haR2hnMFozME56?=
 =?utf-8?B?ZHVSZ0VaNzBhUGErRDlieDRYZDdqdjJ3dWprMkZLY1RiYVFtaFA0Q0lwYXRT?=
 =?utf-8?B?OHJKU3d3cjh3ODhpNGdyRUxDK0c3VDBZd213MjU3M3poeUR5K3pqclVhNGtj?=
 =?utf-8?B?YmxGbWRlWHVqVUtDOUVqZmltRUxJdy9kWjBXWnB5S1FxeW9ycGpEczNPbk9l?=
 =?utf-8?B?dVVSR2lkR241cUxxZlBKWDVMV0xab1Z6cUJpZ1ZUVGpGOFMzMWV1UmxjdDdB?=
 =?utf-8?B?K0puMlp5cmlZUWR3U001WW4zSWlLMGlyYlVxM3dqM2hHTGx0UXdvMHdTdmFE?=
 =?utf-8?B?RThZWmx4WVdoWW9UeUtrVTJJZVhMWC9kR0hkRERML3lyNlJIbmlVNlhPV2pa?=
 =?utf-8?B?M0hLZGx3VitZK3R3RkUwQVRCSkNZbld0Z1lEL1RpZk1pNTdFR3BKYWlRV25w?=
 =?utf-8?B?VUJFd2NIMHJpN2VsYVBzNTFRVHhDYjAva0g5OHIyWm9BdjFSQWV5d3pSR2NT?=
 =?utf-8?B?bzB2SFRzUU5ZSlRtTFBDbkxGdmpLdkJrYmxHZkhCb0dvVFBUbWowanlyZDVu?=
 =?utf-8?B?TlNzZTVndHZEd3dHQ3Y3WTRKeUdNZlh4c1JadGhGNnZtbzFEZENCRnhNckNP?=
 =?utf-8?B?TzZRSUppQi9WcElwZ3VnT3ZmajluZ21oU1NvbERKSktCTk9reVNwL2o2eDRZ?=
 =?utf-8?B?RjdiSmxXU2s5YlFjU05qbENab3B5dFBkYUhuanFsN1VHSW1Uajl0ZUFCWk03?=
 =?utf-8?B?MHBNTmZ3ZmFOY1pWOUs1ZG0vWnBtOFpKZHdYWWgybEVLd0ppWHBEL0ZPdDYy?=
 =?utf-8?B?SExZcGxQTlpVMmp0R1ZiTzRPS3FJVHBkUVFEdXFQREZaTC9BZHVma3Fnd09r?=
 =?utf-8?B?MC95SGtCMnE4QUVkNzBpcVhkVlZ3ZVREMU5ubkFpTlppTk5wRi9LS0FCSGZz?=
 =?utf-8?B?MTcxR3ZRWU5ZUERNdUNlT3AzajJOa0cyMUFxOTFDemVzdHJKd281bXBDYXo0?=
 =?utf-8?B?SkI3bmJmQmlsdzJJU3J2dWhSejVLeENGMTh6L2g1NmhkYjlWdERrY3g2cXFx?=
 =?utf-8?B?MmVBOUdqSEZPZFdPaE55TTF4N2tYb3ZxT3ZlVE1aYzdlRzExR29WZ1FQK2JK?=
 =?utf-8?Q?EhccBorgubxa2Og6DwJhYDQH1Bkb0l2I34?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9441d96c-39e2-4a8e-dfb3-08d8bbd327c6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 17:04:45.5083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCaDjmFtaQXknW3WnDgk3hg0ybmvmAVXHighGHEhRPD5itxfKQE5qpjvbmiUxuO3sN3MwQyejLW7OjSKatnQUjMIz8scgzv7oLt6PlcSOUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4535
Received-SPF: pass client-ip=40.107.1.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

18.01.2021 18:07, Max Reitz wrote:
> On 16.01.21 22:46, Vladimir Sementsov-Ogievskiy wrote:
>> Hi Max!
>> I applied my series onto yours 129-fixing and found, that 129 fails for backup.
>> And setting small max-chunk and even max-workers to 1 doesn't help! (setting
>> speed like in v3 still helps).
>>
>> And I found, that the problem is that really, the whole backup job goes during
>> drain, because in new architecture we do just job_yield() during the whole
>> background block-copy.
> 
> OK, so as it was in v3, the job was drained, but since it was already yielding while block-copy was running in the background, nothing happened; the block-copy completed and only then was the job woken (and then there was no reason to pause, because it was done already).
> 
> So now the job is entered on drain, too (not only user pauses), which means that it gets a chance to pause background requests.
> 
> In backup’s case, that means invoking job_yield() again, which sets a job_pause_point(), which will cancel the block-copy.  Once the job is unpaused (re-entered by job_resume()), backup sees block-copy is cancelled (and finished), leaves the loop, and retries with a new block-copy call.
> 
> I think I got it now.
> 
> 
> So all that’s left is issuing a thanks to you – thanks! – and announcing that I’ve applied this series to my block branch (with s/not unsupported/not supported/ in patch 23):
> 
> https://git.xanclic.moe/XanClic/qemu/commits/branch/block
> 

Great! Thanks!


-- 
Best regards,
Vladimir

