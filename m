Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABA64142F7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 09:55:03 +0200 (CEST)
Received: from localhost ([::1]:37454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSx5q-0008TU-7e
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 03:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSx07-0003Sl-01; Wed, 22 Sep 2021 03:49:07 -0400
Received: from mail-vi1eur05on2109.outbound.protection.outlook.com
 ([40.107.21.109]:21824 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSx04-0005ky-VA; Wed, 22 Sep 2021 03:49:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YU+h3V2sq7fs8E6RU298Osy5cQ8juEMVqaJbDB8eCPrm7uiOdICXLBC7zxOPiOSRw/klVGAVZlnMYrLevo9Zee0JGhzd1ZuUUZM5ui/FJuBMupaxnyabc9LhUXAWbGFZgTI16IMvVuw2S1I2i0p9u6i+yqXoD6SIfRgNRWI6x/QKyVJN4rYUy0EAnBl4+JHNvtiYye+C/x1K95Kab1pOsnw24rvfjsSLcswP2s3YuTRaJPoQ1TfBCaYXFueW4bJumGKvDtUJ5OMlD+YaJyDx9HzZKmKBxriT+70cqPf4zstAHWMOHgzQXskSBo4vCSN0x/zKnlOT9A/9WmsGZA9SIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=3K/Po5iU/HaM7f/zJG/AqfM7kxM+Ne/TTFkXTfcAK14=;
 b=ns2zyTZYS33ZFjWCg73FKUo6B172EZBDYW1U/C9JDaCME/V2oxUPA7VOiEcRYXEXACelSYN78WCMof/oe2IBJ+elS78n0/mYo8v93YeQigoGnJlqUrWWxg528p+U5a6ovVY9F3WywrjitfbnjAXOku4i+W/ETNPjCgQ/R2Y9VCMp+9pxTIxuUpp/MWGXuYDMn8Hn/aVsNB6de7hQh82FrXBExG7QKzsXhi0w0Z/VWwZXHQoJr3Ua8ptK41GTdDoTUy13B/8beSIhVM5ygHegYjlXs1fy2OLAyHuxpUhhy3xFtL8KqRO73j7hd+k90D+66GIjdx4sTPRD7x5qOSypiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3K/Po5iU/HaM7f/zJG/AqfM7kxM+Ne/TTFkXTfcAK14=;
 b=lcxUhpj2qL7hqSJaextYI50TJ0ZjdCSjsG1e1ahIXKzHwCpG5NpStevIR9UALVDnIlOsUgK2XYINse1Hr2AY1YuGuokKqnAGx/ovEssqAkDExR7GMYWsUZ5AK7sEBq2rHkG4t0Hk3Cde/wNXkY3nFwEG9RP8YioBab6Vo80ZeM8=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 07:49:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 07:49:00 +0000
Subject: Re: [PATCH v6 0/5] block/nbd: drop connection_co
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, rkagan@virtuozzo.com
References: <20210902103805.25686-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1dba982d-06aa-de41-a1a4-d12c5ce6e336@virtuozzo.com>
Date: Wed, 22 Sep 2021 10:48:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210902103805.25686-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0001.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::13)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR2P264CA0001.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 07:49:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dc72f68-8d3e-4d87-c356-08d97d9d70de
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5494402D1E43B8D53F38EB22C1A29@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B+O+jAqrRr2fbyaSCo3syWdBiPok1cePl62XLGbQW6bW+j36UeA6NTgplhn2yfW38TrUQUIiOC9KyBsSeXd59l/kJdkBt4zoqDbaa0r9c3yi7C4wsRdWRpV6ior194zGBWxR3uDrYZ6sptnLNa5OMBvAs7vgDSJgsMabHR0kbLLTEv0bIMEmnXec52PCLmLIIjUv0BwTuVnGp2aBNtFZDiAFXYE5h2ceY0BWrLg3MyQ5q7BVDN2oU8d6zts5ONNBWdjHDQ8SyL3ySxFyH8kvVnplnof6rKsFUdA3HPHDB3lp3sXLcY1yeyBCG1Lsg2Zvh+zV9dSrIdJ6n3sTCa/RGIJUGnnuJ9Xe+3EQRUEa9J7jGvT0r/YQlce6lgo05G5mD+raR4eA0qO877B6NAPQZaxrgY1av/ylUJBs9L+oQUN2nzauIW6j4lenSOjUclIxnvmnCvtccTM8+MHpveycx+X1KDSKHa/3MIUhJrmYbCdYBH1e75eeUdqy+X5z34LA454lh5cfv6XpHTcDHGTuB3psAOA9vk10w05W8ZEsIsDWLdjzoexNDr2e4dhG9fiSwP/1lHx6XGnI/09p/lL1lTl5B6bZf3VO3wfwgsW6t1EVVN4nAUax1L8IJnHt1L/0PKb57SnFkPQdt1qMUoddGIGtOaOXTxQ05hNgJK4563aK9dzOU5XPLmCyC3SsRfOKNyWzi80OF8cSZxkSdj7eY1Nw2yzP5vVoSkOi2r2Q8Z77A2DtO/FbdieAU5mHQinEVTYu4y9bv8GBvzkAmHxyrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(186003)(5660300002)(66476007)(66556008)(86362001)(6486002)(8936002)(31696002)(2906002)(66946007)(8676002)(38100700002)(38350700002)(16576012)(6916009)(956004)(31686004)(52116002)(316002)(4744005)(107886003)(83380400001)(508600001)(26005)(2616005)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTl4TkZVVGRIaDJzMDh2bEQ1ZlhZcXp1c09nSGVxa3lZL3hoWjBCYWJHRVpX?=
 =?utf-8?B?bDFGN1c2bldyT002UEJ1amR3eDlnRWJMdHFERVV5TzJxK0Zmd2xkOVc1MkM4?=
 =?utf-8?B?eWd1Vy9wYkRxejIxTUwzRXNEbHlFRVZOb1lhRkpjcUtSUk5UeERCZzhnWGkw?=
 =?utf-8?B?cEoxRnZkby8ydHVVeExXbm82d2U1dEVUWlpnck9jdm8zZzF0YXREcmRDaTcv?=
 =?utf-8?B?TGxsczNBa0h6OER5UzJHQXozbjZZMTVFT2FkTmcvMUV6RDYxYWhFUVlXME1u?=
 =?utf-8?B?M0xlYmhsVi9wc0N3SFlLRGFmY1JiVEZtSFU5U1lYOHB1S25HSjl3ZEQyMXZT?=
 =?utf-8?B?d0l1dHMyVlRJRlhoMEtZTjlFY2FNOE04TmgxZFNXY3ZZTWZPWVBaSU95ZjdD?=
 =?utf-8?B?K0NPNSs5aTdhTC92dnlDcy9RTlhpRllDYmpKSG1NRmlWWE9MSHE3d0lFMXVy?=
 =?utf-8?B?OUZIZjI4b2UzY0xXQWhWbFZLS0YrRGFFdVN1UVFEMGM3WXI5MnI5S0xRbm5O?=
 =?utf-8?B?MlNRNkFXSERhUDdLeWRjMjlpTWtpN2ZLRDlvV29WQzdYc1lmL2dibzArRzNV?=
 =?utf-8?B?QnppVFlYckJTSE92aUpQWWg3ZGlyU1BRYmZNZG8zL0dRWS94bEdlY3g3UTVi?=
 =?utf-8?B?bjFxM2h2QzJodlFHT3ArSm1HQ1E2K2VLeFMzY1dITjNXelZySzk2c0F0NHVV?=
 =?utf-8?B?dm9tN3I5ak5QNjVhNWRXN04zTmtUYmZJamVEWjlVM25LVjlpc3VLMjB4aDBQ?=
 =?utf-8?B?YmNtK2p1bWgrZlF0Y0VqZzdaWkgxQ081R1ZXR0dYR0lQNXJFakZtQUVPNTJP?=
 =?utf-8?B?Sko5cnZiUUhwMThTNEZjSkF2QThxNUY5S0ZOVm1tVExwOEt3M2RSNHEwczgr?=
 =?utf-8?B?Ym45YTBXWHBvT1BPcW9DcVIwNEV3NjJsT0dTbE5qdmRtUXYyRkhoYyswV1k2?=
 =?utf-8?B?amJ0UmNydTNSL2U2NFd4MThlRzgvbzRiSG55UndiRUV4bE8xUG83a2dWWEE1?=
 =?utf-8?B?alRSS2t0T0ZianJSNEVhOXRlUE9oV3NTUTdRY245YmtrVEk2ZXcrSUtzallH?=
 =?utf-8?B?VEh2dFVYRm5aOVl1eER6YWlockl2bUNkK2tHWW9nVW1CQWZrTVNBRWEyKzlx?=
 =?utf-8?B?OGpkcW05SkZ6UVlzZmNzZU0vbWZLNFFsSzR0bm8zMUhEVkZPTnViQ2tIVjB6?=
 =?utf-8?B?Y1dZbEU0RHRxNVZ1ZmhEWkVHYnVxRDgrQmpuSm5BanlCQUNrSkFCenl2enl6?=
 =?utf-8?B?NE5ycnErN2hiV0VYRllkamdoTUdYd1RnUjZTY3RyaUVZejE0WW40RUJHQzVy?=
 =?utf-8?B?Y2NUN2lEVEJRRXlOdE9lbzI1Ly8xN2ozODNHQmFtai9LM2VFU0YzODg4VUFm?=
 =?utf-8?B?b1NMM1dPNlRob1pjaUNycVkwRkFSZzUrM3FNZTQxd0lXWjVHeFVMbUtEeE5M?=
 =?utf-8?B?cU9oUFhoYnFIYUJ3NW03aytzd25XbGYvMlhhS2hEdFJZTVg3alNRZWs5ZUlJ?=
 =?utf-8?B?ekdQU284bUwyYVhFSEQ5aVVuQUhRMnBnbE9za3Fxd1dScDd6bGdUSmZORUdj?=
 =?utf-8?B?WTNEb1NzTmNNN25Xb1hvMlFDS20ybnMrazlldVdsdUJqajBnbFBWSXEwUnNa?=
 =?utf-8?B?eHlwcUdJK2J1TVVFdjJZa2gvZVZYZ2JQUnR5VHVOcU03Z3BZMTlHenIyNFcy?=
 =?utf-8?B?QXNZdE9jL3pkNEhieHQwQU01NFUva2UyUFF6YXhLcUhBSGt5a0hCbVdubE82?=
 =?utf-8?Q?7Rjv+PxxkYne89G50lWuaU1EPeATFyjbnQK5LKr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc72f68-8d3e-4d87-c356-08d97d9d70de
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 07:49:00.7964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNSY1kcqRfINorAWd0E/DldcW7UDE9tpMVH5cdQEbRYmJOR9J7CRkJ4F7RUmKK34m7w0w0ME+Uy8uVV15Mkz/GxlSa1BpKfbCqBwByd1+Fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.21.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

ping)

Only one patch is not reviewed. But the biggest one :(

02.09.2021 13:38, Vladimir Sementsov-Ogievskiy wrote:
> v6:
> 01,02: add Eric's r-b
> 03: make new interface clearer
> 04,05: rebased on updated 03
> 
> Vladimir Sementsov-Ogievskiy (5):
>    block/nbd: nbd_channel_error() shutdown channel unconditionally
>    block/nbd: move nbd_recv_coroutines_wake_all() up
>    block/nbd: refactor nbd_recv_coroutines_wake_all()
>    block/nbd: drop connection_co
>    block/nbd: check that received handle is valid
> 
>   block/nbd.c  | 412 +++++++++++++++------------------------------------
>   nbd/client.c |   2 -
>   2 files changed, 121 insertions(+), 293 deletions(-)
> 


-- 
Best regards,
Vladimir

