Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4F839FD92
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:26:32 +0200 (CEST)
Received: from localhost ([::1]:34112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqfUl-0001B1-UH
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqfSm-0007FL-5g; Tue, 08 Jun 2021 13:24:28 -0400
Received: from mail-eopbgr60135.outbound.protection.outlook.com
 ([40.107.6.135]:7905 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqfSg-0005O6-TP; Tue, 08 Jun 2021 13:24:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUMZSN6hml67qz26bfFN0zkvmF8nqoVj8unm8BBt84RJ9ZaCwdWHc0ne+6dHSrEqrHVZYqX31f5TPdMAGNxpkCN0maK8j13TgtK8E0DIP0pH5QnqLr07jFw+//ua5dm6himqog5a+h8rMwp0KySWJTHq3psT8/DfhwDj0xxIX6jZVKt1JuO8spX+4dCZcISkdzZluvyaT57jDfgI7Mt9h0m1mnX67Pu5A0qQR98OTEjqOC11icYZz6H9cCyyaEiGDfKgAtJiDtiqBAVABay0X2EhKFJAy6wJXoQS9T7UAC83bXSJLMjFwaFA5vhtPudYGf3YBtQU1ia+pjtRwFe1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQS1bNpRTlGQZE2S6up/RmEDKiQ0dim430kUfvVkKIo=;
 b=iKBhvMewchY7DQtkqrIvVR7D26/108ZPWQrfv+vzx16DqsbBba0sFawJrK/dSrpKvBA/xYJ30YL+2vlveCTEPnnuIsEsRz8HMFYnoq7QxJNswNgP/LfUTO7pDcTJ2zwImM++mOQPZuCVke5hT9qVzZpGv7pj457kC5wQJ6TzjZMUjc9ddHghnHZgrAKOqgmlTcQvkoEX90Zt3DaufM9qBilNd76l0OSxSrbrP+Vk2JQp+om0b4tnPUxPuM3DcRtG1xT0tqC3vwfMrtyKgZmWgHI/mFJx+FzLu83S6XPtbBNFAiKjRCTnCJ9ijEj191vO8WKKd+1gKtCBfhsyJvEPjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQS1bNpRTlGQZE2S6up/RmEDKiQ0dim430kUfvVkKIo=;
 b=k198DoqE7/ACa8dsev2GvoMiU6rIwtpiZXO7jwZab90wc/aVxruEVDrBlF2FNoSmsKUUyLzfRVsRD3ey0Y0rVRHssm8NGQxS7wkwvyNSHI9sP5mIL/FgKaut+gJmzO2lsgj0vywbUB4feHuA2ii1sAZogsOeTozcgwYX6QxRHGE=
Authentication-Results: incoming.gitlab.com; dkim=none (message not signed)
 header.d=none;incoming.gitlab.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4168.eurprd08.prod.outlook.com (2603:10a6:20b:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Tue, 8 Jun
 2021 17:24:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 17:24:19 +0000
Subject: Re: [PATCH] blockdev: fix drive-backup transaction endless drained
 section
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, eblake@redhat.com,
 incoming+qemu-project-qemu-11167699-5rxbjn6o3eu8n4pzsbiyd55wo-issue-399@incoming.gitlab.com
References: <20210608171852.250775-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e5e2f2b2-9dbd-0aaa-8c20-aa38ed168acc@virtuozzo.com>
Date: Tue, 8 Jun 2021 20:24:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210608171852.250775-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM4PR0701CA0035.eurprd07.prod.outlook.com
 (2603:10a6:200:42::45) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM4PR0701CA0035.eurprd07.prod.outlook.com (2603:10a6:200:42::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.12 via Frontend
 Transport; Tue, 8 Jun 2021 17:24:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c26d96ba-faf7-4493-dd2f-08d92aa23fe2
X-MS-TrafficTypeDiagnostic: AM6PR08MB4168:
X-Microsoft-Antispam-PRVS: <AM6PR08MB41681BF8BECFAA6E45D9AA62C1379@AM6PR08MB4168.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uqZEPswN1CdhfvbjMovbvcS9yeDtPqw15kTFppDQRW6w7s7IDzKUd5LbKoAwvNvpabwM8IY0K6IuzLkOd1aW64lyyF6Rm3iIkiVbgIqIT377FuSyOhwmnJXjTnqw8O3id5u16XDNCgJYqMUhCQLL/77roGAsm7aQBO5ldI6Y2ufM2kd9p/AF2fdQE9XDH/1qbfY9yId9ctUIOTWO9LNFyAK7pux07biN7eKf91lUerbQVgb1Yy/+FQ2UGFjE1lzFU8xBimyycXsrGUvN8dFs1s7vGPDjzlFSKB7ht+dy6WgM4NMVQxANfJbJk+m2ozghGm8HPUolg+XEhaiWOImntALHvAuwC1jbcr4hPyWur7vQkIDF7ILlZj/D52AF7VTp+3Vt1L+iLYe1FX7/V3NUhh+Rfz9KmMeV4O0j9TZF6IylAbgRT5ZVk1CDvYUtah+g4lLE2t9fwbTZN9C4s7PY4fXqUYPxynf8TNIvhiFPRKKn/A4bjVGAeO4ZdtgOSW8jX3iS79CPy/RvpeB4MTB+fd+sDKExI4e/ykSwpFhZxMYW4bYt82Ui+FgnYy1axcf0aAQQGUpyrDhI17lIBy5BL0pm7WGv6Z1I6xdn8weGJEtAPtqGe6F6oAn20sjmJmmSuxNKy0YvX4zChQWtOcKiQu3FUEAZLk+ZHcDZKrbERthtMO8vskdBzF84HKsWiKE0YmDQd4WBw9sq/0fLtTq8BgoSWvfbjVMX4IiyHN+3pwfhHHHCZzCCrY6wrQW2zncQkU+WdhIsFTFQIcHEmMxYnVeEfL9B1oP5ceikwyQHSNDGW4fy+cLx9+ER8CS/j1/+rErUEolcs20w30Qo2lpb3tNSUn1Xzr3H822bCymIH58=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39840400004)(376002)(396003)(16576012)(316002)(86362001)(66946007)(6916009)(5660300002)(2616005)(478600001)(16526019)(66556008)(38100700002)(52116002)(83380400001)(38350700002)(186003)(26005)(66476007)(8936002)(4326008)(31696002)(966005)(36756003)(8676002)(6486002)(956004)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U3hIUmlDZVBsY1pNZHhTa0MwaW9iWnk4RHBoN1IxQXpVNkE0RWJvSEZ4ckY3?=
 =?utf-8?B?a1ZqNkx3dDVWV1B1OUlQKy9JU2d1VFJFeVcwTExXVkdQZHM0YmR1RUFLSnpj?=
 =?utf-8?B?YmprSTA5TEx0Q2h5ZUJDUnF6aUVueWkyR3kwYjdub2NpK0s1UXRIZnk4RFIz?=
 =?utf-8?B?WmJnUEd4cFNKd01ZNFlzZUdoQXdvUmRmZFFJSjlJUWNpZGJTOVN4WGorOXpK?=
 =?utf-8?B?U1RTaURGeXVSYWtlWm52S3lXaU54VjYzUzZsYWcvOWp6dkFodUZPSjhUVTVi?=
 =?utf-8?B?bFhCZzIzYm9WdDEvNDVQdDZGWko5aTMwZ2ZVVmZYeVBQSWtyRmRyR0kxR1BL?=
 =?utf-8?B?SE15OTVLTmJZeVJxemZHblN6dUxoTEhtZFNHWTBUSytVVEduMW9TbmVkS3M5?=
 =?utf-8?B?M3lLb3dLNFUvZVk4QWJBb1U4bkNXZlhjQjBJd3prMFFlb0g0aHNqL3FnbTVD?=
 =?utf-8?B?UTBEblhsTXpQMmIxNzFIbTFEb253azdJZDdlOElMVHp0TnhGN3Y1REo1ZU9j?=
 =?utf-8?B?RXhXQmhpNTlUMkN0L3VPUmMvcmNXcDgvNFZGWURKc1JCYnM4bGpzcEgvcHlL?=
 =?utf-8?B?THlYY0pYUlZpQlZ6WG05WGlIekVCMzJteXBQanVtTFVvZkM2cFpYVVBOMWta?=
 =?utf-8?B?dXlxKzYwSWpDZmRJRzd6b21pTVc1OUQwRTRQWXJvZkNISk1PQnFSOVArck9i?=
 =?utf-8?B?VVhTRDFWWnBQVGI1NzFOY2h3VmdrYkFhc1Q3TVR2NXN4Y0RtelhaeGhkc3Nv?=
 =?utf-8?B?VzRlRXRTZTZaWDNiMGd1andJd2d3T0FaUnBDREwyakpEM2V0S21QemJ1VTJY?=
 =?utf-8?B?MEQyTjRQNnFIdVZJeXdJekVOQ3NNYTljcTRQWWlFclQ3ektIY1hvWFcvaEFz?=
 =?utf-8?B?UElRQUtNQ1RWZE90SHpGa01NOUxncnlTSUt1NFh2Wk9nSXJjalh2dktkbzNl?=
 =?utf-8?B?K3RibldqSm5WSHJLVHU4bGtpUXZUaGpRZlZyWUFDTXdnU2xYVFdWc1hDZFBm?=
 =?utf-8?B?Tk9HU1pneEZobVVlTGYwTVRpZmRjdGRzKzErN0xGcXhRZUk1eGUvZkd1ZDNE?=
 =?utf-8?B?ZlliUDV2UklUQnhNbHVxTWEyZTlNNCtHVWRQc2FsV3JkUEU4c1UvbXlyZUtB?=
 =?utf-8?B?VHpWV2UwZHVHR3VTdzZxRXU3c1VaWnFJRzMxYVE1SmtoSFVLTVNONEJkUlo3?=
 =?utf-8?B?YSt6dkw0UlhYaDV4Ry9RWkd5WUFYVUd3ZDlycWpsdXhQdXZheTkrUVlUa3hR?=
 =?utf-8?B?d0l4KzVVQWY0dTh2SzhySEdJc1dZZVQ3MjhBK3VnUjFXSFk5aE0rWkliVld1?=
 =?utf-8?B?ZURqZHNUWTNOd2RjYnRZZGF0OENIak5CSTZIdnBjZGFkUDRoSndwTjJxdm1S?=
 =?utf-8?B?RnRPV0dWakVRY1hTUENpMko4S0VQSEZNUFhUVmlybHE3cmJlTkY2REpMa3Jk?=
 =?utf-8?B?czllN1FZOUhpZDBjTEs0WGhYYmdnOHFIRWl6R3lZSXgwVHQ0enJHdGdiVGwx?=
 =?utf-8?B?SGxzVG5aSGNEeWgyd3A5NDhwbXM5RlRFVlJvdi9jUENrSXFaRkt4K0ZCYVJ6?=
 =?utf-8?B?WG14QkFMbGlDN0svajI3SEMzZ2JxVkJVNVprZk81M0FMaUF1WFg1T3pKS0tV?=
 =?utf-8?B?cEFiTHlVeVdtS0FLL2VWQjlxQkgxU29VMzZJaDRKQkFlSUw4UVJKZmhuWHBm?=
 =?utf-8?B?cTlVajIweStFdXN5MklRNmNFVDJreWltbUZnTWNsM1NPeFA2bUd4ejN6c2xk?=
 =?utf-8?Q?cFPiwfZFJwq3+1mcFN53pt54kUlCi99mQLJbSbi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c26d96ba-faf7-4493-dd2f-08d92aa23fe2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 17:24:19.5671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khR7R3R3Mu1gfNA5/nwGR8Hp8fRbI5jwhQNtVxLEBW9nS2qHoHi5CvtoIDiJV6oOLdDl+v+GFQXvnc4vcX+dA7sLA3Mc8esQxyAgLGOmWak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4168
Received-SPF: pass client-ip=40.107.6.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

[try add gitlab issue email to cc, will see how it work :)]

08.06.2021 20:18, Vladimir Sementsov-Ogievskiy wrote:
> drive_backup_prepare() does bdrv_drained_begin() in hope that
> bdrv_drained_end() will be called in drive_backup_clean(). Still we
> need to set state->bs for this to work. That's done too late: a lot of
> failure paths in drive_backup_prepare() miss setting state->bs. Fix
> that.
> 
> Fixes: 2288ccfac96281c316db942d10e3f921c1373064
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/399

Reported-by: Sergey Zhuravlev

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   blockdev.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/blockdev.c b/blockdev.c
> index f08192deda..094c085962 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -1714,6 +1714,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
>       aio_context = bdrv_get_aio_context(bs);
>       aio_context_acquire(aio_context);
>   
> +    state->bs = bs;
>       /* Paired with .clean() */
>       bdrv_drained_begin(bs);
>   
> @@ -1813,8 +1814,6 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
>           }
>       }
>   
> -    state->bs = bs;
> -
>       state->job = do_backup_common(qapi_DriveBackup_base(backup),
>                                     bs, target_bs, aio_context,
>                                     common->block_job_txn, errp);
> 


-- 
Best regards,
Vladimir

