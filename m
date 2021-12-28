Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91BD480A01
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 15:31:22 +0100 (CET)
Received: from localhost ([::1]:58170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2DVZ-0006hW-9l
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 09:31:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2DT1-0005uv-BH; Tue, 28 Dec 2021 09:28:43 -0500
Received: from [2a01:111:f400:7d00::724] (port=43745
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2DSw-0002X2-D1; Tue, 28 Dec 2021 09:28:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCbU4Tcm8hE/nXkwy7KRqyP1jg5tArvg+U1uiJrDlgdEwPz2QLjdsLBzErVwD44utuLId+nngXuN3Cl//PD0ID+okffPe7cbVGVZPha3aB98K57EU7wtEyaFx4LMpPWTERUVyykuC9PY5BHQzRr8G97a6OvSJ/KCyAjbF/oOXKfBHXeE+f1RoRwxtn7fXM/x5PswxEc66w5XGhDY+6aFz+8IFczvZJpa8gKu/F5X5KiB6VaY5LNZAVPaKixC7G7K8q5MG1gnHwinZNkigvxh26k12fPqX6IHFEJ1Opyksm2Tx/bmbWTEweMjxKf0Tb0wb0YGHoO6wrPP0Anc9cVVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jykrcQ91rfeNhA8sIQCvBk9nkkLWUo3vonsHjXjEqBM=;
 b=hQuybj15bv4JPD37sJuNwRJICLf/pKLtINUAxXxh8xUr++uQdg+G0rc4zfPm3j+ijwxtbD6hqOVcV0ojEcieMvSmR8lsbOrQp5igfPs0DW8aAYRz6d4G+orsuIKTlcOXkge9rWw/yon+Taq/LNeVM+0+0wuei7072NhaB/T/TfWPwfuGzgUTgnSCcLW/aPBbEITctOC93xV0sQlVgnKlJtY0w7Eq2EeDsaq39m2qDim6iwEIKFlTEV127ECdKy7Foednomfq9awH3q7AbfzqF8STj64/ZuwEDB50BCnKPVrpc82BGDWlMJYzsQl99OxrMkaYAWrX2R8rwNsWypTOhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jykrcQ91rfeNhA8sIQCvBk9nkkLWUo3vonsHjXjEqBM=;
 b=qaguPiE7ygy3iRWB1Tuth9e+ojS+OsHlASdkuuIQxlTp0vA1AQw9UtmjkF22bK3Lkguj5dEWscOfRUPbL1Ih0HI8BloilzN8ccr3hxC1sscPZlAaKCpR0pIREBcH0y8W41q2U6sbYmPKF8rUDA+9PIPFt9tA0/LG7g6atcCdeLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3540.eurprd08.prod.outlook.com (2603:10a6:208:e3::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.22; Tue, 28 Dec
 2021 14:28:34 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 14:28:34 +0000
Message-ID: <3a2e27f4-11ab-9033-da04-f96f5503057d@virtuozzo.com>
Date: Tue, 28 Dec 2021 17:28:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 0/5] block-job: drop BlockJob.blk
Content-Language: en-US
To: Nikta Lapshin <nikita.lapshin@virtuozzo.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20211224153552.2086061-1-vsementsov@virtuozzo.com>
 <946b2758-c921-4efd-efee-6c052c04d839@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <946b2758-c921-4efd-efee-6c052c04d839@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::16) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 110d06ac-88e0-4937-6c75-08d9ca0e53dc
X-MS-TrafficTypeDiagnostic: AM0PR08MB3540:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB35401ADC28C79EF85F56EC4CC1439@AM0PR08MB3540.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BB5w64MR2Aeep68o0Lj+EEwk3MshXXnzSvgDQBbHWxMggZWLfBjaFI8B73+2QrsVK76CIYhHkcvzUMTbi8/cZmacDdsgvbQ5ZgVNups6xh2xg/f65l3W4mpA8r9RshHe+Ho1/jVMBeNfvHqAnKW/6D2sVf8Rt0uKukPyItaPQNEpQ153gJjJ2CRvXorEibHrYwa8aBARxGKtD5jDttAsx2JUYuYHDJ+c5Ns5VDkoMNs+NvD7qz1PoMPou2MVeFBfh1sIvxNx2OILD3P1H6FTEQAY6oDwhU54U3anFYbRK+IqX39qAQFgwHoL2QZ2teoEytm1ztGLnSCXwznlZHKNL+KhRT388/oEdt26d/P2rNBD5ekwEgVnawqRAXV8loVfkrLAqiXlagsO/wGOUhEXPB90IIQHQIMjbXT6WhrV7oY/7LaBReQqoHthV7WV6QIocm6h39uo0SC9EGJDmgaq2gbhI7sov/pSxqKDkJltx/yjjmKnRlGkZcIAqSQbroz2M+ek0ElSTV8tl5Rm5uu20l0i9UxkV9bQT98o0QaQWo1ciiceQmDrMmJSjlysjp441oYeIADdypDyqJ6l/4eRR33QTeoNBm+OwIB2baJ9N5IS54Gof3e2bzh4aTYUlYRgLUvspMG6faRbV9oPQQnPKiRns2PG93ag7rdb0dfDFykw3tBZ1Km8miEV0o/NGoI49XPQQ9tmUTdYJ4MiwtSCHjh/LVbsWWICnSXwfMbt7AZOTYiGnoPP10Oe0oOMLyU2j2hQxhuyRNxSpYSxS+MReg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66946007)(6512007)(2906002)(31696002)(5660300002)(508600001)(66556008)(8676002)(6486002)(53546011)(6506007)(38350700002)(83380400001)(186003)(38100700002)(316002)(26005)(8936002)(2616005)(31686004)(4744005)(86362001)(6666004)(52116002)(4326008)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGtSU3g5Y284NDN4QzI4V0ZuT1lDQUZrOXZSSHhJUEVtclZIUDBpZW1RcXM5?=
 =?utf-8?B?aEh3NS8zL2t5ZFB3Zmw4WFFqZFZRRlFOa3dndzV5MXB1dHdweUhFSDZSNWdK?=
 =?utf-8?B?VGRRMWxzWnlWd1FzaEhUR3QwM3R2eXZJK2tkVTVZTkhrcGtzNk9ueDJmVElN?=
 =?utf-8?B?S1ZiQ0tXcDYycFd5SUR4TFlxVWl6aUNYQytkR2xvdUJqczBCMkkxMkN5S1dG?=
 =?utf-8?B?MnlENnFEdmpPK053YW1CL3pXZGdCdjIrY0ErSGhuVGw4cUo2R3dBQ05IQUp5?=
 =?utf-8?B?Yi9pd3g0SlJXakswVzhXc2pEZVljK0lBUk4vdDU5Z2lETnhGY0ZKbG5laS9X?=
 =?utf-8?B?cDJYMDNrVm42Z1RmK2MyRDB1MUZQS0w0cUh0L2JwNXNQOUYzMHpNb3NvdnZW?=
 =?utf-8?B?aWR4VHJBWThQZHVtalRXeVcvUHYrQ3V5WDRkY1dNNWNRWFZGaUZKOUxpTkQ4?=
 =?utf-8?B?NDN5TU45OGFQemRWaWFtb0F1OGZnWDg5ck80WXlEUjVSVUFCeHdna2JmMitL?=
 =?utf-8?B?em5SeUdPMGNiKzFnY3Q0b0lsOW53WUp1Smhpc0dDSUtnZUNBTDBzVW1SU0RB?=
 =?utf-8?B?dThYTXNJQnFTTGpyb0VFcTBGRWRUcFAvSGFXTThpS1NGdk4veGM1eUZoYmdZ?=
 =?utf-8?B?MldvMnpPM3dwbEdmL3hQd01iVCthMVRzSDMveGhJTTJmbWROT0VoU1VlMVpN?=
 =?utf-8?B?UkYzazNqQ1dndEd3RkZmM21KWlRqZzJrUGxVRW1JcVdvc2FFcUM5OHZLVXFR?=
 =?utf-8?B?OW96L2F1cmFZQmc5MExlckpzNW8wcThGQzZSRndJcXhjZHBaRDV4dTNpcnIv?=
 =?utf-8?B?ZWw2YzRKQVUvZEJ6S2t4RE9wY1haNUFramI3dEhpOUhOTUJvYWJkWGxKL1Nr?=
 =?utf-8?B?M3lPcjUweWdCMkZVL0ZhenVzRldjNzk3bTVLNms3Z0k3Unl5VmJWYW4rWFhx?=
 =?utf-8?B?K2c2QXRFMDhGUklpWEQ3WWY1MmFrS05jb3gzNVY2S041bHFsSWJSNys2aWxx?=
 =?utf-8?B?WWo5V1hSVFNGREtKVUNPcXdQNDdrWFBpaGU1NmVlVEdBb2FiN2tSbFd1b1Iw?=
 =?utf-8?B?WTgvN0V5TDd4bGRoMVlIVmQ2bll3MlFENjBBZmFqZGtkWFZSNVBmbitRY21r?=
 =?utf-8?B?WnVvV3BTbGk1eGdCay9mNkVoUzhCUThtQzA4OGIwV0t4a1JyYm4rODI4Y0tF?=
 =?utf-8?B?bFk5Q292VEM0SFI5eFRhVWl6czhSOGtTYU9FTU1vSmJYT0doT0g2U2pPWWU0?=
 =?utf-8?B?SVNiZjdLZ3BBVnAyWTkzM2hPODJNbU9DaU5IYTBpNzhNc3BWVWdYVFVkd0NT?=
 =?utf-8?B?dWVMYWh4cExjT1k3Tm54ektmR0VtZEE5UnYyREN6aE9OTW9OV0NvOCsxOW4v?=
 =?utf-8?B?WUlUODRqUGg4L201MlNVallINGljOUpGNzJVZzQ2RkFmRFN0QXVRNGNWMU5I?=
 =?utf-8?B?QkVNNHZydkxPUlhaZkpjcDVuUGRmZnRmNllrL282R1RoKy8rcU9GM0E0TU9Z?=
 =?utf-8?B?OFVoTnFGYXE0U0dQVXRTVzhFTWNtZTZKMTRxN09wbVhmSjhFeHh1RnFxc0hC?=
 =?utf-8?B?MWdiQWp6MUtaSmd2eGVjV0NJeXowSkNlOHVuTG9USThOeERQMjAvb2VZWE84?=
 =?utf-8?B?K2JpVzhIKzU0V2hnNjdLTUZ0WnBkbUhKVlk4a2gwZlU1Qnp2NUtiRUIvU2Vx?=
 =?utf-8?B?NXBrelBMNUNyWGRjeFVyZkljakhOSFR4NzZxblR2bjlUWURxRDEvaFBJSlhn?=
 =?utf-8?B?V25NYTYrY0VmTEl5ZnArN3FlcUV2djZCVlJ1UGVGRmUweWEzQisyVVRRcmNI?=
 =?utf-8?B?TFRTa3B6c2NhZjFTY2ZiT0lJeHVaUkkvQ2o2Z0J0OGd2MVZ2TE5Kek9kbmJQ?=
 =?utf-8?B?eXdkUkc2ZkJ4TnAwRSt2SmY0akdTZHBvRW5iOGJwbTVNSHNsQytNVjVxeXJR?=
 =?utf-8?B?c3JRY05JN3FLM3BWd1VDOC90SFErSnplVW9mK3o3d0h5K0YvQmlEN0pkMTdv?=
 =?utf-8?B?dE9KTHhkdGhScUUyZ3ZOS3lFdWZOaTN0UTRjU3dBeEZPQVBrd1JUSUpubE9E?=
 =?utf-8?B?YzVWT0tVMTVlZDhiRWtKcmRZOSsrcDUvcEo3OStFV1Z1Z29UZUtKZXJvQkY5?=
 =?utf-8?B?RTc3OXlLV3VkL2NodWpZelFtUElhSzJKVG95SWxLeG4ySVREU1ZoekJKTVh3?=
 =?utf-8?B?WVdqZ2hjMFo2Z0t6RENXMGJCODRDMENuRUpNYUpmS2tkaGpKdExFUk1KVUUr?=
 =?utf-8?Q?6pjbxLaH6sQLQTS2xUDOMCqCJ/ymAfrfhtzdFTs4Fg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 110d06ac-88e0-4937-6c75-08d9ca0e53dc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 14:28:34.0254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mVG+AZkz8VAYqnv1PY1cKr/aYGfj/m2zaCnzUglDcVIxGTYM9X3Wh0nC5w0ARHIGwK/qy8NNTUoabD6j21PeFUphNdy9ZbeimQyW61ksSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3540
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::724
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::724;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

27.12.2021 15:13, Nikta Lapshin wrote:
> 
> On 12/24/21 18:35, Vladimir Sementsov-Ogievskiy wrote:
> 
>> Hi all!
>>
>> v2: rebase on master, fix iostest 283
>>
>> Block jobs usually operate with several block nodes, and better to
>> handle them symmetrically, than use one from s->common.blk and one from
>> s->target (or something like this). Moreover, generic blockjob layer has
>> no use of BlockJob.blk. And more-moreover, most of block-jobs don't
>> really use this blk. Actually only block-stream use it.
>>
>> I've started this thing (unbinding block-job and its main node) long
>> ago. First step was removing bs->job pointer in b23c580c946644b. Then
>> block_job_drain was dropped in bb0c94099382b5273.
>>
>> Now let's finally drop job->blk pointer
> 
> Reviewed-by: Nikita Lapshin<nikita.lapshin@virtuozzo.com>
> 

Thanks for review, applied to my jobs branch.

-- 
Best regards,
Vladimir

