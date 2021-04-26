Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2676C36B15B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 12:11:51 +0200 (CEST)
Received: from localhost ([::1]:33922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1layDW-0001HJ-5k
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 06:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1layBC-00009S-LU; Mon, 26 Apr 2021 06:09:26 -0400
Received: from mail-eopbgr00130.outbound.protection.outlook.com
 ([40.107.0.130]:34022 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1layBA-0004u7-0Q; Mon, 26 Apr 2021 06:09:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iM42dRiFVcx7R1krt6A3Oskbxh2hreD7iL+haUaKABSIavFBxWV16SmVJqQYGlRwOOzmTX1o0DdA/CbTszWo2GQsFmKkNoLtwJ2aAy0u+SoWPf2W2uHO4Fcw8qW9/HzWIEbBFC+AAD6ABurKptX+ue++tTXb2tPlkkM+bHonNoL/qieO475POQiuvKvb3GZbBJgAl2pubI3vNTBWTPD0bxCumoEOFmMpkIBa3Y//QvHvZ852TpJwQ2DHFib3CbPV1FsHvgGk2rTJMEsNm7c8Zug7jamreocts+qI1m1NQ82yDVPcAqlmIMVvIfTDsv4yo9ZNcdMDfIQCGZSv7ETP2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFbXeb8q/+w85PtnNT5HVLJgqwp3Dt1W/OsEd6scFu4=;
 b=UdKo1aOqGrxtyF2dV/xB2KPGke+KaS4yboPGoVPNK9sXllzB/b94dScqAxWK8HDRb/aeVlQ/5AkCQRgTFTZiYwH9eaVST7jcBzkzQmOrvOCTUOr2jvzE36CPMmhUZjy4il5/zgHxYCSSalSWo6qq98HCTZENTk7wBAuUcvhwi5I6E3Ftds2OPUL8PyQ00X9HFMCqN2un7wdIhcFrz0tdcQGPh0FYHa9I9W8d93RXhqJ/1/Qdc0g5XMnE9no6zU7DI7QrmWQQkuiETEnfss2NiWAPQaNCf521DGC2vJAyydfKHMLT5RxPN/bTJgbjQBlcHesIWA6gS554uae6lcnxGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFbXeb8q/+w85PtnNT5HVLJgqwp3Dt1W/OsEd6scFu4=;
 b=L0IgauInuvuWVLhSp6SKR5WW8lXyGseRorbwItQFYG1wLd0LpWEk458F+uwkJeWaT2WPeLAF1r6h6y3HkyFaNrB6U388Qe7DWpVN4apr0c65l8IZRWn21HzRdoYwcU4cxwdDFzbRk71L3X3T5JuwCsnBYzLZOYNqD5OmbtTFHy4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1714.eurprd08.prod.outlook.com (2603:10a6:203:3a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Mon, 26 Apr
 2021 10:09:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 10:09:21 +0000
Subject: Re: [PATCH 2/2] iotests/307: Test iothread conflict for exports
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210422145335.65814-1-mreitz@redhat.com>
 <20210422145335.65814-3-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <171a9a0a-78fc-3861-739b-2e3ac1a895cb@virtuozzo.com>
Date: Mon, 26 Apr 2021 13:09:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210422145335.65814-3-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: PR2P264CA0012.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::24)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 PR2P264CA0012.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Mon, 26 Apr 2021 10:09:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ea1a2b3-261a-4110-eb2b-08d9089b5c0f
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1714:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1714EFAAAAD9BFD1245918F1C1429@AM5PR0801MB1714.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GOD1dJnxJoTzTghbAbLMoImgMj3iExHJpTZg1Uymt9G/lP0pAGxs6E0RUFwc/Zx+5ue+RmJyycMIv08ayTgJYqwZX/2YvWGzkVvj5qsBCrzcokfrjOaDQcsP4XQEJBRrNemu8ZQ3hqB+tPQYazvZIwDaNt70jzjM4u1NdqJ7UVst/A+aAdXrZHrjznIXuy5S1rb7ML+gG7fXL1YE+P773zDlNa+Atp7l6r1vb28HMs/gvIsPhjqtItkAcq1FodWN+cQBUtQRBACJWRdn8R9VZPrOdfoP6TZb/Y0rD2aNizjCEWYqZkstlv/ffQ1SNQgt5FEGBY7bf123qDYVb+zfBWqslnOMOIDEpZT1BJlRHS4l9MS8saoA+JV+gOKlzcdk/kpxJ4vetn83Pa2aXm7bqiXUcKhqmJzb3P15oAAH9JyDCMJk4+hi8fi5jC7djoWnyn6Mv8MprTvffuWIqqGB+ERu6wVsyveKucCyb8h1Zn623T8BIq0QoZSSZIQdsAMbsrPy1ea439dX5hY7/ic8rNlci46G3QZ7LJ4TlPrfjIFez8MrY/yIpWy/GJGfk/f1mRbPRLF6uTxPPAUNmBSYzMAZ08qTRMOu29QYucNhOzE9egWsPZ/Pxcl5YKY6StISNA0y2/be9DycckGMP4mDY3UeHtFCopybrrvXZlrDf08qPePedHCOBbBhqw6OdMSQULkXIb64pPmzD4x3DNFViwNSeS6lyqG+PiU1XSE42nk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39830400003)(366004)(396003)(6486002)(31696002)(8676002)(4744005)(38350700002)(5660300002)(31686004)(16576012)(52116002)(38100700002)(316002)(2616005)(4326008)(86362001)(54906003)(956004)(8936002)(26005)(16526019)(2906002)(186003)(83380400001)(36756003)(478600001)(66476007)(66556008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VHZWNG9HRXFSZ3E2ckVyRnJqMkdybVNzb0JSWTRqSThOeXR6WGFsQlpybjhn?=
 =?utf-8?B?SlE5ODljN0l2NUVlMGVWQzFYMUR5c1RKeldkSTMvYVdkbmNGVzRGNVBSTVNU?=
 =?utf-8?B?ZG1iNjZkRE1nOHMwZGp0U05hM21MWGhHcDFRdWorazB4SnFjNXQ3SkZMMWxE?=
 =?utf-8?B?Qmw4YUpuQjF5djdFNzZVcUxiSCtyMGlIU3owVEdiYTFSeldsazVHT3VNbkg0?=
 =?utf-8?B?c0RmbFN2dlNCbnF5SXlNRGhFWVEySThqdDh2SlZpN3FKWFE1UlVBOFJGT28x?=
 =?utf-8?B?VkUvUC9nYzV6U2xqN0F1NWN2Sy9qMTlxRVBrWlBYWVRTengyWlI1aFRRVlQ4?=
 =?utf-8?B?aUhMaHhqRlNST1FucVdLYWliM2JJVDBMWHB1T21KZmVLYW00N1FPdk5pV2ts?=
 =?utf-8?B?YkczOS9zNEZvU0M2cTNQcDd0eEJnbDc4Z3YzeS9JakhOSmFQWndjYm52ekxN?=
 =?utf-8?B?SFFoeEIzV0NtenNnZjlnZVo5YXd3QW8reFR0cXFIcFM4ZndNSU53U1F0dzZx?=
 =?utf-8?B?V1JMbldSb0FrNDIrSjZJZnJXK2o2M2hhTHlRanlyV2RkM1hNMUZzTGM5YlQ2?=
 =?utf-8?B?US9qYmczc1llNndWS1ZVK0V3d1lPVmFZd0U3YUNHaWNiMzh6ZDNmNStMSWkx?=
 =?utf-8?B?VzNIT1JIREhTMm9Fei9sMGhhcEZxc29iYnZCYWZQU1VrVDBpdi9ybHNCSVZ6?=
 =?utf-8?B?eUpsNnhwSWFjVjg5S1A4S3lJcE02M3Y4RFB0Mk5xckMyM0lFNGZZZ2tWcW1q?=
 =?utf-8?B?VGxGbGZJTjh0Smt4OS9jMk84eGsvcGdHcy81cjFKZnNFQU1UdlZLRStLcW96?=
 =?utf-8?B?QkJrS2gvVkVhYkkxUFRyTzB0L0F5Wjh3Z1VXdmdCRGkwS2FBUlV2QXk0dThG?=
 =?utf-8?B?SDlKdVhHSVpQTFVqTDdYbnllUjlpL0pvb1UyQUgvMHBXNkFxbTAwd3ZBR1Ux?=
 =?utf-8?B?elg0c3E4Rm5wUE9DOU1iMEpNSW5pMS90RlRkcmNhME9FNytlSVJKc3U0cEow?=
 =?utf-8?B?dGdxWklVMExnWG5VekpoaUVBSDkrYXRjWU1PdXJJaVo1R0kwYjM2U1l0cC9y?=
 =?utf-8?B?aWRSMkprM2tYQkwxaDVoS1RLbCsxOHBlWkFuWkcyc21COHhzZWpvbk1jRjMr?=
 =?utf-8?B?cm9NR0tVdDZVbWEvVjhaTFovYjlwSUs3TnZnRXV1aHZhOUNJV1R1Tjd0VlNP?=
 =?utf-8?B?bC9sb25haWM1MzBsYmcwVDBNYmVWSWllY0lVYzRvZWk5RHNGMzZXZlFPUDRP?=
 =?utf-8?B?dEoyeXloeVFSNWdRMUZlb1cxYXNTMWhpY2VoUm5qNjdNKy9MK0ZLSFlXZzFG?=
 =?utf-8?B?TzNSZnR1b3pMWTVkTHluZXNiK1F1ZEhzVm9ZeG53V2hGbnJQaTlzTDNseWQx?=
 =?utf-8?B?dVhYWlkvUllGSit3aWN0WmJSNUE1a0FqcVRqQzJFSnVmaEc4UFh4SXRaZ204?=
 =?utf-8?B?UWdKRXE0ak5EZE5BenovaTc0NzVmWHJsL0FUYWEvZmpua3JmMXF0bXBJOW9v?=
 =?utf-8?B?Q1FtMHJHRHJXK2RzRDlSKzIvdDJSbzZ0NC9sWENWMTE3eS8wOGhQbkQ4dXpO?=
 =?utf-8?B?TFBrODFzQmdjbkx6Z2pHdVZaVlpxUVdzYUFRNE90cVMyWElFNi94bDNzd3pF?=
 =?utf-8?B?WVc3UktNTlZDU1M1NElQWkx1SnpreHZDZzV4VDZURkxPc1czdHJ5T1pYQUlC?=
 =?utf-8?B?aUV6YzdaZFZhM3NQOU5jazdiejV0TVBuWGpEM0c3bkx5MGYwa3VpYTE5dmRW?=
 =?utf-8?Q?ZYoM7S4I2LFkqAd1gVbr84DxGxCsNLUxLLaqFdb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea1a2b3-261a-4110-eb2b-08d9089b5c0f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 10:09:20.9381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEeZWh43Rx2EoNYe3pUAiMpP10rIIO3qusLyk9H1LuF3lbTS4WzDBxbyh2L0L71RwV9BgNOnMkVJT1zERTiTCtTliHQeaViZaECISLgI++Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1714
Received-SPF: pass client-ip=40.107.0.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

22.04.2021 17:53, Max Reitz wrote:
> Passing fixed-iothread=true should make iothread conflicts fatal,
> whereas fixed-iothread=false should not.
> 
> Combine the second case with an error condition that is checked after
> the iothread is handled, to verify that qemu does not crash if there is
> such an error after changing the iothread failed.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Tested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

