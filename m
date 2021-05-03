Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE7B371476
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:45:56 +0200 (CEST)
Received: from localhost ([::1]:51632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldX1P-0000iS-CW
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWw7-0005zP-6n; Mon, 03 May 2021 07:40:28 -0400
Received: from mail-eopbgr30099.outbound.protection.outlook.com
 ([40.107.3.99]:20310 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWvz-0003GM-RF; Mon, 03 May 2021 07:40:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaL+A5BTtdCw2Ga/nvB9TxwycXQG6cZ6bC7tW83iOb8LByaa0hwCBNOLRZtj9mgEY0pCAjxz6ED33hdPposu2uGcopoRZdTl1NU0+anxPdyElhv8Fwuqq6aIY3TTs5cSt3+k5gO0THj3QWykojok85XOccTdUwySygEKjYow9i/sI/EAEySaeco3Zpc+/iM4feU37CaxtilLc6NskDQYGZvrhyyTnEYBroqwfpJQc5L0tZ/hSB/hQb0CG8w1iBXrgXbldkTe95kyNJilbA/qV3mn1h8i+4i5YaW2d1K12I2Wq6A8r4V/ktYPOc1N9BzgaMHX/xeCDlRXk3QEm2H0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qMmPjVEKE6z8ym9BqMCRlRlPBT31+rm7bUSBXTxgIw=;
 b=m3kxkURsNONxXY8iz9pzSm2mvh2MmMQdCpMG/cQo+gss5mjTa7HInGLS9tEdbNNgWmqAxppKe356R3A29iyl485BxK7G/FodEAG5cOCJcAR7jopQPZt8rRIqTBUE/PHGSdBo/OXK4IkoXAB1Ovnh4XumuOU+BMgrn08/h2EvkcKbNScaitoJ8l68OA/Tkj/W0LImTZhDMUBjPDgsbCY93MlrwA49xwy25utVrqU9pVQd98PKCAm7hI7BLu+9aruigz5F7lyos5RCh1ascRoSV2AZsCsmsPqVyDpXxWwfFqPP7m9bM338Xf1Bkl3Ck39dZMXpSi7baVzg9iGMs6C5tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qMmPjVEKE6z8ym9BqMCRlRlPBT31+rm7bUSBXTxgIw=;
 b=h2hnz8PQ3VBSykPpB4BEUdz06t+w3PdcCp3zZvXFOV6somoxG3bZdaqlAHhs71u7NdSUtY7DOp3InnvlLOIUm8wZZTD6Sw+Jl/jBn/yuD1gv3Mxbwrm1DyKRnsldqYZe6hOWcdt+rU5OaipXKA67N30R7sDWfv3JLvOpK/354M0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4343.eurprd08.prod.outlook.com (2603:10a6:20b:ba::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.43; Mon, 3 May
 2021 11:40:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4087.039; Mon, 3 May 2021
 11:40:15 +0000
Subject: Re: [PATCH 2/2] block: Fix Transaction leak in bdrv_reopen_multiple()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: mreitz@redhat.com, qemu-devel@nongnu.org
References: <20210503110555.24001-1-kwolf@redhat.com>
 <20210503110555.24001-3-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ca5be7fe-9468-fce0-6f23-4d1c4c8ad1fb@virtuozzo.com>
Date: Mon, 3 May 2021 14:40:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210503110555.24001-3-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: PR0P264CA0273.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 PR0P264CA0273.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 11:40:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bbc83c8-7028-480a-dfff-08d90e28384b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4343:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4343E2CE74038B2EB8433706C15B9@AM6PR08MB4343.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bG2ZIYmOXGj8jaelG3DVmwVbeQEwQJsYdv25Nv+rX8Apx6b1IMOnuBZY1rmkhckchuBubwy/JllSmaolphCxwmMv/Z85AJD+1OBsG8TTUfKc/83ZT1MdPYykbrpEP3lteZoXOCWdKasfpqbbJQlRNOusICdVcXbWBp5TOstt8Arjz7Tmxx7SCUO23Bu3eNfpVsYGDaUDinPQqT0yB+k7RezyrMxFCgcU+vgQPmYyvScNbDOiGaiPGMVrOB9tqInOi+NEaYPCP1U6rtKzESRYl/VHf79vwP4h6deLhguxPrZsN4ni+Sf1JyRWo+qNvXsolg1n9/cb4jkd9T5g7ocyEF86UxgVEQNwv23mqHqMs+7vNUPb6EGsAlsYQbqobc58H23lSCht2B4F/jBPjYOE2Kbq4C2g8yT2x5wnUX96cWzLezjqXpt7NzS/zSRnxJ0PeXbCtGxhVJcUgsmhe6ZRKVJpYLfYAy5/PTbcOAflEQ2FjrATP1pi5JFnrhpyfhvKyE46kNXcaA6lj5RTALF2VsFaeiVFpXP0K01GSm6aC2ABAOF+gQyk+oYE1aN+kg8131ga4YQjYvFu4bLsMb7glGrK5nbwATwgB4rzVFtxHaHXxv29bOPufeJOFdZmPEH5Q0TA35zzjFs7OltkW38pNA5j5tGXAI9GTUCBgp6SwitmIGkP55O0YaVXV+XFmJSlpUf2mfmevB7bXEwfBkFH4JwJE7BmFErDYJpJ2acAiAg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39830400003)(366004)(346002)(31696002)(86362001)(38350700002)(38100700002)(36756003)(8936002)(66946007)(66556008)(66476007)(2906002)(4744005)(5660300002)(83380400001)(8676002)(26005)(186003)(16526019)(31686004)(6486002)(4326008)(478600001)(956004)(2616005)(316002)(16576012)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NGZlNTVoRTRjV0M3QkY5M2RldkZpdGFzbWswVEVWWTNTRzJISzFtTUdjUi9B?=
 =?utf-8?B?Yk5Qa3IrK3BRdlFWM3FKNHBXaGlKd0syNHlISHNmR2dtMldqWG9FbnVrRUxH?=
 =?utf-8?B?em1hUDEzaDN3VmRWV0V1WHdHVTFvcU1sdFNtclVCN01IeFFmWVlJMWoyM0VC?=
 =?utf-8?B?T0lqZVFWcVpPV2sxTHlEaWpuSmNvdTB2amtHazZFVk5EZ1IraGdsaEdyVnFj?=
 =?utf-8?B?YkZsT0Q5dWZ3RmJ2WlJ6VEIyVGZyMmdWYjFGSUhBeW8rdGFoM0lwY3JTdk1P?=
 =?utf-8?B?cDhNUVdycWRpaTVMTjNFSjl0czE1M2VSQm9ZQmRVdUxsR3JHWVNOeWhTUU0v?=
 =?utf-8?B?alpRMllMbDVEWXdlYnMvRTlTRmtoUWpyQzdUK00yQUhYWW9ycHV0SE5jN2c0?=
 =?utf-8?B?aEVvNkZVUzBzMGJnc09qcWtXbGhZeTZObTQrOEVPR3JqSk1RRFNKTzhlWkk0?=
 =?utf-8?B?dlhKWEJBY3M1aWJDb1lrbTB0YnJBNCtJQXdpRTVnZHUzdEs4Qzc0d1dQd0V5?=
 =?utf-8?B?U2dFNzNRaHdXMmxSZ0l2MUxDV2RETFNGOGV0bVY0WmJkeWQ2Ymc3c2tLWjVt?=
 =?utf-8?B?Z3F2ZFJEdkR2TFB6Q0Q2SDUybnJGOGM2SyswY0lUS05LenNlQytkWThFNktJ?=
 =?utf-8?B?NmpFc2FTNitVNTZiLytVS2NZTlRaN2loTjMzZDFqNFc4d2NFcDRMSVNJUkRG?=
 =?utf-8?B?OVV0VFh4bk5WNDlHVHgydVJ1VTBsNGxDRFlURStkWStadDQzaUpiVEJxZW91?=
 =?utf-8?B?SHdjQW0rNTdpME5tZlozZlY2QmdEZFdMMFAyZjk0S0V0Y2hOTTFJOC9IYXls?=
 =?utf-8?B?M2RYS1dKdVdSMVQxMThLbTZmNEhyc2s2OStYbW0xQWxjditWSlJMZ1FBQlAz?=
 =?utf-8?B?NFBWTUg4RFpzTzROQ2Erdk9KN0JtcUlySmhvK3ZUR2I0S2xLWjZJaENtL2RN?=
 =?utf-8?B?MVpiRkFPVVlrQzF6dUxyL0JkaDEwaFJhWHhZd2RsZ2s5MysxSGNpcmJTNW5J?=
 =?utf-8?B?SktheTZQVTkwcEN1UVF6Uld3RElFZGFFZlVyN0hPWkJpdkwzeUp0cUdIZGh6?=
 =?utf-8?B?bnhNSHhoOGRpSmg0UGh6bEI2bVc4L214N0ZnMXNQeTU4MzkreWNjaGgxWFRx?=
 =?utf-8?B?NGNCdXFUY2VVc3Jpdm1SQjBPclBZV0EwTWxodENHdy80ZHJ4UHMvNWJQcjlv?=
 =?utf-8?B?T0N4aXNoMXFBRDlwMjRKMUhzbER6ZkN4b3FHVDBuOTJTOUV0Sy9rd1JYbEY3?=
 =?utf-8?B?KzZkdlZaMmp6OG82S1NOSW51UkFncmNaQzhnR3BCdEpMYzJrbS8yaFBEUTRa?=
 =?utf-8?B?b1djbktjT1hmQVo2VnpCbFRXMlg0T0VDQWtPaks4SlFBaTZxNWVLdDN2VkFG?=
 =?utf-8?B?UXBSRGVvRnVTWXRJNC9zYmhLUEVFalVuT1F4eVlnV0RsVFN3TGoxamh2TTlF?=
 =?utf-8?B?cUVMbVpEdVZkZU9Nd0NqQ21IdEF4R29VRmVXdEtOcnhlK1pOQ0pPOUU0dGU0?=
 =?utf-8?B?WjFDK0dqVDJjRkFuN3JLeE04NEY1RFlNdEhyS3dXYWZOK0MzYkgwdWh6UmZR?=
 =?utf-8?B?MExiUXQ3UElKck0wWG80OGs2dE1ueWNJbGNlZWk1d3Rvc0ZqM2RQamRMV0pB?=
 =?utf-8?B?ZmhWS3NLaUN5VVVaekpZTmJSWDFEY3lsMWVqV2Q2Z0VSQ2tXVHRVSjhQUVBz?=
 =?utf-8?B?cVczU3RPa0Q3L0V3SXNxV2hSMlVRMDFvTDZUVkxHQVBHUC9NaEljSENyQVRR?=
 =?utf-8?Q?5FxagdI/geRytCv89HlFhYA0mtlqNGkTLZ8U9Mb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbc83c8-7028-480a-dfff-08d90e28384b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 11:40:15.6379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66A2waEeP2tJa93twMSkrVI05PQQkXU7rGOtatrx8EKs+CtSVyCyGQZ+LaydI1+QA+i0d/loBF5AV38idNAwRUhYB/MIDqPQcCbJFiPrqhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4343
Received-SPF: pass client-ip=40.107.3.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

03.05.2021 14:05, Kevin Wolf wrote:
> Like other error paths, this one needs to call tran_finalize() and clean
> up the BlockReopenQueue, too.

We don't need the "abort" loop on that path. And clean-up of BlockReopenQueue is at "cleanup:" label.

So I'd prefer Peter's suggestion (my "[PATCH 2/6] block: bdrv_reopen_multiple(): fix leak of tran object")

> 
> Fixes: CID 1452772
> Fixes: 72373e40fbc7e4218061a8211384db362d3e7348
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block.c b/block.c
> index 5c0ced6238..69615fabd1 100644
> --- a/block.c
> +++ b/block.c
> @@ -4052,7 +4052,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
>           ret = bdrv_flush(bs_entry->state.bs);
>           if (ret < 0) {
>               error_setg_errno(errp, -ret, "Error flushing drive");
> -            goto cleanup;
> +            goto abort;
>           }
>       }
>   
> 




-- 
Best regards,
Vladimir

