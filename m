Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDCB62DF66
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 16:13:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovgZU-0006IJ-Bd; Thu, 17 Nov 2022 10:12:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.baluta@nxp.com>)
 id 1ovgVS-00056p-EP
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 10:08:46 -0500
Received: from mail-am7eur03on2063.outbound.protection.outlook.com
 ([40.107.105.63] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.baluta@nxp.com>)
 id 1ovgVQ-0002uK-E3
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 10:08:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWbqvSfdj879Xwyretsxsa7h2//LU58vmjQhFtHOVBO9ZwmesnFBg02RZmrBpAazXQDd0fwgz2x2GbCJ/GYughYzrKFlBSrbtt6VEDqF5aFqerM2fMlYo6+29yBYAQunVzZpQFsihSI5lygnRJZsSisW4pyQt+htJ+wVQS6RcWC/b3NIGX79lvKK9FX1xQp3OzNJSogLkbGxQeoFh3WKrEidbAHBdcRr0OpSvTrNi6TLFihUt+NEIvrDd0ZmOQfM5IwwrKc7MGP9+26iKmeIhpIpU918wHRb5d79kFz6zj2U5NcLuA0Amv5B/yGP+ZINYaUx18GmBWgjNDw/nOGxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8KKrMqhZGdw3Z/AbWHCgpPVanAA9HSTE+F77XIgyFY=;
 b=cmhnrhP71wkHUkw71npsZSHHD8ZpQbcHw17uIFNZDhC6saE172PBwVyfJ1U535j/I4HmV0ZxTPxYrHitILQAMoERDfBxfqdvDxb+wK0QtfBEG/kQP5p66WGLUNnr/ZOkx73HtT7LcN7OKYccYDpvZJpOFZicyQ1rMkV8lBwXr+08nDbdIkEp6lGtlIwQYOVPyezrjPzx4UgYOo5o5cuS2n59FzqcwW4Uj8Q0ydq7AnprvQ9UoqKqCbsoT1fHiUWOeW7RZ/ubDz33Js29D4gyVNdXthsISv9iUNrSWtZ6WrgHbeHQllGIzu3jY1PKiSCEvbqlO6yk8T+hFBbjRB4Rbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8KKrMqhZGdw3Z/AbWHCgpPVanAA9HSTE+F77XIgyFY=;
 b=oCyWhzCLzrjaWdHW8zbOtPQMmGHKoruUUDMBBUj6ZkaS9L7Tn0OknwmNMObgMRaWEoFiDWNjgzRGx0sscCcJNqGOZlSNY0Q495dCX994TnqVKqXXpeOcQWuGPA0JlqBO5asHsH8Bm1L4e1qGrDdcFFbCykTYefEu2AOPWT0WvPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by GV1PR04MB9103.eurprd04.prod.outlook.com (2603:10a6:150:22::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Thu, 17 Nov
 2022 15:03:35 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::c59a:f4cf:58d9:1f5e]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::c59a:f4cf:58d9:1f5e%7]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 15:03:35 +0000
Message-ID: <9473a8cf-8880-a10f-525f-b06a7d92e505@nxp.com>
Date: Thu, 17 Nov 2022 17:02:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: tkutergin@gmail.com, qemu-devel@nongnu.org
References: <20221110090444.550362-1-tkutergin@gmail.com>
Subject: [PATCH] target/arm: added cortex-a55 CPU support for qemu-virt
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@nxp.com>
Cc: laurentiu.mihalcea@nxp.com, daniel.baluta@gmail.com
In-Reply-To: <20221110090444.550362-1-tkutergin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0070.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::23) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|GV1PR04MB9103:EE_
X-MS-Office365-Filtering-Correlation-Id: c172bd48-03b9-4492-4cd5-08dac8ace61c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2KoZA5XBqmgTdwTq63I3fp5F2Fm1798meH5sYVLSejDiUvuEpMmjonfoJNzUcQNYyWFdbaa8y3hDKQsAu4G8QA16u+NO3ysTViyaBee8QVb3G2LB5U49UqTiRM2zvgBg/tfcp3jbzj79qfoNBUYDLrEvqQmUZYfNm0eOnlFX4qIByYYtD75bftkKFB5ExymvuH6a21AFhzjIkxcWyk4SNFGyKAsiA4WUKciKbLiF++Ap9cAekY6HJpNoALCX0yO3vad3IblBZjVFCNhvcxo2beOprWaajHE2PG3IVa01OoNH6QlfxDtibZazLalQpo/qZJPsDe2gGQzFnsncMHTo+UaR1XlFpIW2HQdypamTRnBJfkDCo52Dw1TDSDpw8kbV9r2dRTU0D+MnFkJ7Kg+5mmYjkTijcgsrRGuP5wrq25B135S8PAVMle6dBIikuUrJPMFGlSnUhdMjUKbIfglTUAOLfm34i8tHI1/hugGahGawGW0L/lKQqDxPNsL9PhQ2kD5bvmmCO4pFmTreLOHXUhXJrfZyzhxTUZztZOvagVEr7uEGWrNjqs1bW7KUE8F4l1D6AEhQmr5kXOwyj+AsFygxHw9jkSRKfbUtbh1uacktRiNBgE3lwlC6wbUIT9o9eoGPVF1bGJv3Q2cnVeu6fCAaaiEOGeutA9edHsKMI3dNaBYRCVnSq24IyHA4L7H01S7ObHFrcdIaGQy7Oc1cYYexTrgjkM+5A1chsOJBMcaLU5dSIyXffCV2boAIaIEC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199015)(558084003)(86362001)(36756003)(31696002)(478600001)(316002)(8936002)(66946007)(6486002)(38350700002)(66476007)(41300700001)(8676002)(2906002)(4326008)(66556008)(44832011)(5660300002)(38100700002)(6666004)(6512007)(26005)(52116002)(6506007)(186003)(2616005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEZBakVXQ3lDTWlscW45aXQ2QWY2OWh4YmZST3NXM2VUUWZmWCsxTk1odUpa?=
 =?utf-8?B?ZnMrdUxnYjJWVVlSQWYzN0lJMy9qQnFUWWdnSnJIMHFXZDVmNzJqWEg1SFRU?=
 =?utf-8?B?Mkh3TUl6Z1gxeklWWk1uZWlaeWFseThiaUxaZCtUakNRM2JrZGJLRlF4Zldz?=
 =?utf-8?B?dFUvVTdUdEQydDYrNHdSTGhYSVBQaWt6ay85c1FjNEs0Y1Z5NUhxUmk0d2RN?=
 =?utf-8?B?RC9rOTFBSGNMa0d2dmp6WkMwUS8rOTV6b1hDNzg1OEJwM1hxTHBuN0pLbVRX?=
 =?utf-8?B?MnZWV0w3ZFFPQlM5SFpZQkVsN1RZZ1JZUHMvNE1VSytxOGliZzdPRWtwY0NY?=
 =?utf-8?B?NWZyTVo1NlRjQms4a3N6bnljLzUvR2IyeFQxMnhUSjdpam8vMkVBTXlVMWFo?=
 =?utf-8?B?a0FzOUFrQjZ1T1QzeXJ1dGt0WVpZM1VSQmpKWmRyL2JKSEFaVys4NWgyVy9Y?=
 =?utf-8?B?elBpOGEycGQrdHJGRkpXODV5S1hVdFpJcXJuaGpiZzZIRDRUdkhtclhWVlYw?=
 =?utf-8?B?RzFMOXhWL0gyQnIzZGtjM3ZZSlg4S2pYRjVaVUpOM3JoZ0tjMFpaQ0VlQWYr?=
 =?utf-8?B?QmlSRDJnZ3E5M001RlBGaUV6RC8wQ0xoOGUvVGtkL3Y3NUJFMlc2ejBCdTdU?=
 =?utf-8?B?WmlCL29HRkpHSVJZcHE2VERacE1VYS80WE1qWUQ1dndreFU5L2pZK0NIazVa?=
 =?utf-8?B?SHBmZWJLcXQ4Y3VsTnFqZXlOQWkvdThHaEdVZy95Zmh6aDdiSVRyblZpREIx?=
 =?utf-8?B?TjNEUGpkMVRYYkszaWNoZUdJTGNmRm4vWjFrYldXb3dEU0tLK0swemtZK0RP?=
 =?utf-8?B?N04zRXRtc0tkWkZ3VGdMaUJGQnJBWGJSYjdrcHZ5dXNURUxiSjV6c25JYTlQ?=
 =?utf-8?B?RjVRdUNDaU1Ma2FWeEJJL0hDZ1Z5L2NGZlRVOFBEelpQajRiUXJyQ2tuVnVx?=
 =?utf-8?B?UVR3SEFDWCtnTDUyNFBJREpaVWF1enVtVUZBOHdyQk4yYUtNaWUwcjh1V1l0?=
 =?utf-8?B?ZFJpYWE0RHRpQ2FtWFcxWjhhek5kWWswK09qbGxNVE9qTnNIWUFPNWFHRUFU?=
 =?utf-8?B?SWk3elRJWWVCMzdRb3ZmbkZvV0RTYW9rUTVXMTRtN0Z2d2JjWGpaNUFlbmI1?=
 =?utf-8?B?MGdVV0NiNXlpMDlRcmc3N0tkNm5sRzROeWFmMHB2d1VCTkV5N3JhMHZ6TTR6?=
 =?utf-8?B?NDJoMEpPTGNpVHUxU0kvVlZxS1ovd1NyODdDcFZUcEljVFBUcmNWQnN3YUtE?=
 =?utf-8?B?R2NROGxyUm40RmxmOVhTUnFSeWVOVkZ5T3pTUllrT1hQclREaFR4cjR1SSt6?=
 =?utf-8?B?eEhSSCsxMm12Q3RIRS92dWxYYjFURG4wZmJtdm00aVdLR09haVVQSVZWRFpM?=
 =?utf-8?B?T2d2UDUxancxTDhxdFNWOGtzV2R6VDcybFVuQWxMNzl1amV1bVdLR0hOdWRv?=
 =?utf-8?B?M2lzZlZuRUVrc0duRFJQcGJxejhMRHRMNjVraFdMUWVGbWZzMndMSW9kQytk?=
 =?utf-8?B?ZXNqRndkS3o5bWdaQUxEQTkxeFNWeENWZHExQ3NKakJTVkdteGtEUnBPLzlu?=
 =?utf-8?B?bVdlRk1tbkdoM21SVFBWT3hYWVR1aW9EYm9iNnJBVjU1TUZjWHpJdGZzNVg5?=
 =?utf-8?B?MDMrT3JjQ2Nua0ZmRW51ZDdJazdDbnVneHp0c3BuTjJ1cnBmbXFMaEpPS21n?=
 =?utf-8?B?SnVZTEJTSklhM2NjVlN0SmluN3hoMEtRZHQwUVBSVDVSWDEyQzBEazJsZEJC?=
 =?utf-8?B?K215ZU5jb0dYeUFHaDk4TGlYaTE0VTVucHhiRDJxc1pPaWRDV1pEOFc0UlRy?=
 =?utf-8?B?a0wzS2MyVDIrSHk4OXl6dXpmeENmYndKSGJCQXJ4K2ppVzBhWmNNaE1JdERY?=
 =?utf-8?B?cHRZeTNBeTBMdE5JR05ibUtuZE5NSWJUWlMwaTc5WUhsOE1teS9QQXppZ1d0?=
 =?utf-8?B?cHJiZkRYb3NMTS9mMGF6Uk1rTGxTUzBaamQ5bnJWS3BVZEI3eFo4b3Z2UFBS?=
 =?utf-8?B?Wlk5V3E1d0lScVZBTVlJR2dDY3dHczgvbDZNUkNzaFFLNFZBUy9vc3RXbWVF?=
 =?utf-8?B?U093V3FCY1F5ZENNSDUvZFpTUFpkcjIyNXN5bVk2QXJLTFcycHJKQ3liNG91?=
 =?utf-8?Q?1ZGh2C1D2LuF/ou5v7/EdClMr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c172bd48-03b9-4492-4cd5-08dac8ace61c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 15:03:34.9390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jS6qmyfaJqt42FAgr4BROYmVQklf5UpOyxtsOJWv9nH/zw8quLoKuIpw29FSmvuT67jVBcvfOLFZaWRjOaViLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9103
Received-SPF: pass client-ip=40.107.105.63; envelope-from=daniel.baluta@nxp.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 17 Nov 2022 10:12:54 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Patch looks good to me.

Maybe you might add some references to chapters from RM where this numbers

come from. Similar with aarch64_a76_initfn function for example.


