Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF3430C5AE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:29:25 +0100 (CET)
Received: from localhost ([::1]:35836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yYO-00049F-Rs
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:29:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6yVw-0001wG-Il; Tue, 02 Feb 2021 11:26:52 -0500
Received: from mail-vi1eur05on2122.outbound.protection.outlook.com
 ([40.107.21.122]:39296 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6yVt-0007ey-AE; Tue, 02 Feb 2021 11:26:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHrCgkgCobqtu/7XXp0gthQVMMrjKg9dCLmU22X2Va0WFJ4Bt7/8GOE7qACke3VJ986dRIQNOLOCLNdWpidYZF11EhosVTysKSB5Rk3bGQDTblV6LBp1hx+bZiABRFjXwXsys+/5yrZvcvbyPLASaN0snAj4BdRKl2gQyNzdvDHKWO7suY2l4wtuYLCLIoKmYRwyxgBG+1Epfsl8vt8NkV6FKgirxqmGpSrRSmokM7DVwmP8+VHtLnE6CuCsG0IEPierPlnRys1Bt1PKQBDko0vXZbjtM6QLHctVT423Lou4LqjEl0yZzZ0MpMe0Xy3EpGjWsr7VymZ7wLpaVH57XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceF+sVVMoWxhiUQv2iIG5gi/Hl9X/r0WvkzpOTpALiQ=;
 b=n9kRAUKSM8kYyNhGWwxpf+cUmKilvAZyfYs6Y0/cipOpQlZO5KjKRgO6J5iMWd/tPul+WhnHdTGUvLYX2brVZsUQrNRvn/H4H057EWEoFqCKeDyEYWFKdPl1jQG935TBP4NgUC0YTnT0ShSeCEfNLDBhn28w82FV43AUbHGefMgWAvAySA0vLwDPjt8oWYzqmmXdkMzhHIhF2J9+VbBplZkJbuWxwhDcx1/XPz2shyle/kEyCDqxEjyJJa21PWWDcSIUqtFLwQLrL6NM2MzsMEcrb3Wt8ktNroXMPog037JIeDgxfAtQZQRB1CSBE/W7ahpwIZINb9ic8yQhLAG2Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceF+sVVMoWxhiUQv2iIG5gi/Hl9X/r0WvkzpOTpALiQ=;
 b=L1PSP+kp2uQ5myiW4Cp8gEvCPQYfoUnwOJMwdLT8Kx/1krM4eIuhaEyH5j3ESaZWDZyMFnd6MqCBojKfyuS1V5znWPCMcNp7niXIpxLVAvRfImn7TI1xAAWtqLdv5XgVva7pQ8DcCvYAfEeGbDm7l0lpF2ZukkdZfJDez0GOuUY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4069.eurprd08.prod.outlook.com (2603:10a6:20b:af::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.28; Tue, 2 Feb
 2021 16:26:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 16:26:45 +0000
Subject: Re: [PATCH] block: Fix VM size column width in bdrv_snapshot_dump()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210202155911.179865-1-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d81a933c-aded-16ab-b41b-3273bb29408b@virtuozzo.com>
Date: Tue, 2 Feb 2021 19:26:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210202155911.179865-1-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR01CA0162.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.137) by
 AM0PR01CA0162.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend
 Transport; Tue, 2 Feb 2021 16:26:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f75a54e6-a31c-4535-788b-08d8c7975538
X-MS-TrafficTypeDiagnostic: AM6PR08MB4069:
X-Microsoft-Antispam-PRVS: <AM6PR08MB40694B78B5511BCF592791A9C1B59@AM6PR08MB4069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7zwTsUC6mMEfnKGyefhcVMs+MdZOd0ODB/eBcqHsNmSElbmxpHlbVjRGmRXgW8JSvyJ4dBUEW3XsBLB/IM5SBFSbDf0OuYJ5F6MwcGsvSPQmHiV42hPqaAjyDTkZQ9DS/UNmZJT71Xo04fISKbxRZMKfTgiPMDsHMjDM+s3JO2t6D5Syt1v6f1L31zILyfdCLKA5CkkGCHZDsSVdtF3xjAexZf7P47XmKpZt8goEbpsX0XiTTgttqm5XoeMhBQhRQq4wutgshwnxKnEzMAwHb7nle8ZEwhoYneZdLA962TiQsCAe3joIbKRs+IiBV0txs9L592YhryGV3Nnx2qM3SkAvcLobKcwDmuMVGqBRUqQqR6J1HpxV/GGgWjVMNCl9pLM+KyFnkHCUF2dgOIPFBG41Ix51Lr0MAHmZSm5BBa82Z99sTY1RYBSoYxbq60ieHJ++JavYBIA+PiI1RxY6WFhqZUTgZnlEnWG1d/j6VN1W8TM+oUHC0jTbikVylERs5gVC6lESy38LO1Xt/fn/Pk4xEtKv688R1CcYYcwQ/zDBghBwaTsG01gc3ZpVaJHD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39850400004)(396003)(346002)(376002)(52116002)(16576012)(316002)(5660300002)(478600001)(8936002)(956004)(2616005)(31696002)(86362001)(31686004)(4326008)(26005)(16526019)(186003)(66556008)(66476007)(2906002)(66946007)(83380400001)(6486002)(36756003)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y0xReWVKUGpIVTh2eFBSODZsQVFqR25nbXNBWjhzVnAvNXVOcGpQRm5KcjBE?=
 =?utf-8?B?L21sbzhLU3ZWRXJKekZCZGhrdFlnRkdYMXNPWk4yRTVyZHNQOWxvSkpKRDAr?=
 =?utf-8?B?bzU5NXlJUlp2dzloOGd4cjhXMGUyNVA2Rmp1ZFNvOXBSSTJxM3hKSzdULzlJ?=
 =?utf-8?B?K2FKcG9WY0JlS0hzR0xYNHZkS0U1TC9VWEpobE55dzZLdUErQkw3Lyt6VDJE?=
 =?utf-8?B?YWxHeVQxWVJVajRGajBobEdyenRLbHBndTFKQW9vQkZxYkQyR0pvLzkza09Z?=
 =?utf-8?B?ZkVHZERUTGdROUlqT0RqZjdPa1ViNlI0dTJTeDJpbVlDVnYzSjQrTVNOZndR?=
 =?utf-8?B?enFlYTJYUTUxcVp0ckNSekxZeWJnSGE0QTJJSDZ4Z1FsbldSRlQzQ1oyWnhP?=
 =?utf-8?B?Sm9pSHROVmRJTmZ6S3ZYZUplYnB5VGE1WENXTE1tQ1JOMzBNMmFXc2xHVVhS?=
 =?utf-8?B?WHFDeUJhR0tVUHJpemgwWGhWQWVRY1VkeEVTMkh6S2dydjNlZG82cTcwQVBG?=
 =?utf-8?B?U0RnQk5TTy9BQWQ5ZmNrczR1eElOL1Q3c29EeE05Z1pFWnRwVzgrQjJaVjZN?=
 =?utf-8?B?RFMxMkgyaDFWUDYrSDhTVk4ybEdqMEtCZFRZWTZLYjlBWXlLUEhSMDJudHVy?=
 =?utf-8?B?dWYwNStYWHQyOWkrbEd4b1MxOFNaTTBsNTdwSWtzYVM4MDk5QlRlQXZJWDNN?=
 =?utf-8?B?ZzlXLzd1cTlmMmFIVUhacTEyWlEzZjVkc1NLdTZuOHdrMTFJbXN1WGloanJI?=
 =?utf-8?B?NHZZV2hVMlBKTjFtd0oyd2NncGNyampsVGdjSC9ZL01Mc3drVUt6WUFxanNo?=
 =?utf-8?B?MENIcitmcHJvY3FqYkpSUm1vc0hQQjR0OXJCT3RxRHN6bnBjRzk1R2hLY2Q3?=
 =?utf-8?B?dWxGbnk3bVJVUi91ZDVFR0gxbWNIcDd0RVg0ekJLMjlSWW50cUJpK1pIUUpy?=
 =?utf-8?B?eGwyZzIyTkF1TmFabXV4WjhuM2tXc21qQnNKc0NxNVlLcDIzTUxicUl2VkI3?=
 =?utf-8?B?NWNWN2d2MHBjNlMxMjFjS3BYejBkVDNtek5PczlBb1hlY1ZkbFkrOExoYm9n?=
 =?utf-8?B?RjZIcVVMdXFqUjJ2WUU3NHAyUytvaHhxMzQrU0hTVnJtdTBMK0lScEZiQ2JP?=
 =?utf-8?B?QkJwMVBEVFY3dGp2Y2loU2xaRm81QXRINUk4bmozRmVYZm5xQkhGdVJGQktV?=
 =?utf-8?B?ZFVYaWhXVXk0RVJ4MDJ3aituSnFmcFN0REJ6aFVEeDl4N0hMVWNrSDhQNmt2?=
 =?utf-8?B?OTQ0YlJFTllnNlFVeHhuaUx2NlZKQTE5QWtqODNMQTRjS3NtL2R6SW50RkZ2?=
 =?utf-8?B?ZXYzM2NDRFlvWDBFVnN2dEpXaTdnMGN5SnhGMDd5NmpHK05vTzhnaW5qSXJp?=
 =?utf-8?B?WnB4eUJZT29ucHc4T0srRjNTcVdYelZ0dC9ScVNUSWpXb09EaGZINnBmazFS?=
 =?utf-8?B?TUZuZ0JxT0txYzZMam1PRXZsMmF1RWUvUlV1MjJRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f75a54e6-a31c-4535-788b-08d8c7975538
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 16:26:45.7375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25HmboTuBH4DNV4JxX6zYxbhYjW31d+k261JjvUQdZo18uovcVDs27eOSu7ysYScP0ENPCXQMoAtEuJjtnv0JA6yMl5Efk/ZHrKNx67wu+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4069
Received-SPF: pass client-ip=40.107.21.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

02.02.2021 18:59, Kevin Wolf wrote:
> size_to_str() can return a size like "4.24 MiB", with a single digit
> integer part and two fractional digits. This is eight characters, but
> commit b39847a5 changed the format string to only reserve seven
> characters for the column.
> 
> This can result in unaligned columns, which in turn changes the output of
> iotests case 267 because exceeding the column size defeats the attempt
> to filter the size out of the output (observed with the ppc64 emulator).
> The resulting change is only a whitespace change, but since commit
> f203080b this is enough for iotests to consider the test failed.
> 
> Taking a character away from the tag name column and adding it to the VM
> size column doesn't change anything in the common case (the tag name is
> left justified, the VM size is right justified), but fixes this case.
> 
> Fixes: b39847a50553b7679d6d7fefbe6a108a17aacf8d
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   block/qapi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/block/qapi.c b/block/qapi.c
> index 0a96099e36..84a0aadc09 100644
> --- a/block/qapi.c
> +++ b/block/qapi.c
> @@ -677,7 +677,7 @@ void bdrv_snapshot_dump(QEMUSnapshotInfo *sn)
>       char *sizing = NULL;
>   
>       if (!sn) {
> -        qemu_printf("%-10s%-18s%7s%20s%13s%11s",
> +        qemu_printf("%-10s%-17s%8s%20s%13s%11s",

Hmm, the sum is 79, so I think it's safe to keep 18 for tag and still update 7 to 8.. But it doesn't really matter.

>                       "ID", "TAG", "VM SIZE", "DATE", "VM CLOCK", "ICOUNT");
>       } else {
>           ti = sn->date_sec;
> @@ -696,7 +696,7 @@ void bdrv_snapshot_dump(QEMUSnapshotInfo *sn)
>               snprintf(icount_buf, sizeof(icount_buf),
>                   "%"PRId64, sn->icount);
>           }
> -        qemu_printf("%-9s %-17s %7s%20s%13s%11s",
> +        qemu_printf("%-9s %-16s %8s%20s%13s%11s",
>                       sn->id_str, sn->name,
>                       sizing,
>                       date_buf,
> 


-- 
Best regards,
Vladimir

