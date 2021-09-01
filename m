Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC8F3FD8FC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:48:33 +0200 (CEST)
Received: from localhost ([::1]:53204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOjI-0001JH-RZ
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLO3I-00063E-IA; Wed, 01 Sep 2021 07:05:11 -0400
Received: from mail-eopbgr60115.outbound.protection.outlook.com
 ([40.107.6.115]:44326 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLO3E-0002eS-Pv; Wed, 01 Sep 2021 07:05:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcJd+V7NEuiYY8AGaQN/2b8j4OdGYhOoelm0N8q9i7FBXaOerxskY7IsLveQ2jpNisVpyzyfFG+QdXjrv+d67eDb1ZJHK9TAnDSlPH5rbsV3siekGekh4JYLHGEJm5T0kpLW8QMTxmbyigvSlI60zWqam4WPv3E+wH6iX4BiBvFwi2J1GeaTEyYhxEBaDavHpt7mjIr6nRLmtsOBtNPb3r86NbMM5nDdT2CQXpaCea7EJZwqAFiFxVxkEmyJQ5jXwdIyDUCnLIWGT0n/4HYTOGLhJEXwwOHJZfz9G/rbrr40S/Cw2FFZSiH6R6SlQCCIv1DAd45v+FoYCR6VlNxnZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FYWt+SuVHtDyiAJstNl3YEV+g2+8HcpLkRsNlbUkrY=;
 b=dPe8PoZTUGqAM4xlK1isLTwcIGUephrT9kSW4nS40GZ2JdWGQUyxX0zsbs38hNJXWgJQdn6+lHWdv4hLpW7RYYvNKlQJ/bZXlBdLo+5oE0/mVAVZ2l0ka6CvbSrOdygDWv2D46PN/dP04qIrTArlJlfCDNEqPbMHk4dhPL+EOWiQy8ELNqRqNCLBT1YVLk1f6qql2/hAnxjrrIlcteR/J8GXsVGg8x/cxWarcUcwpu6uNhZciFds/statESUOOkBGnGtIxyEF1aWX+6aGlG+qhFtRmc301dNa+6H+zC20Rr+tkPvosnLLMejJYomEChbXyjRwlhTzP2hvaNF+HMDLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FYWt+SuVHtDyiAJstNl3YEV+g2+8HcpLkRsNlbUkrY=;
 b=mQnTEBk51L5zc96ws8FAhmVnKWj+hlUZfkQ8PhgB5LbSeAmeYeCZ2n/gsdh3dBOz2QF7YBEkupuTbhxmaLtvs4i1DWQ5ZJuAPVDKaQq+dAzJxb6O9F0gK0JVTm/yYdmD7Qm6bmqIvXIUbQwWGqMvSsICrjWn5Go2T9tpogb8W3E=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB3248.eurprd08.prod.outlook.com (2603:10a6:803:4e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 1 Sep
 2021 11:04:59 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%5]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 11:04:59 +0000
Subject: Re: [PATCH for-6.2 v3 05/12] job: @force parameter for
 job_cancel_sync{,_all}()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-6-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4dab108e-0dd4-955a-7877-73895e388413@virtuozzo.com>
Date: Wed, 1 Sep 2021 14:04:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210806093859.706464-6-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0112.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::29) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM0PR10CA0112.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Wed, 1 Sep 2021 11:04:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82ec1069-925b-4467-f380-08d96d38569b
X-MS-TrafficTypeDiagnostic: VI1PR08MB3248:
X-Microsoft-Antispam-PRVS: <VI1PR08MB3248F8FE3112D9C3B970BAB0C1CD9@VI1PR08MB3248.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:338;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WHeVMceVhCw/TdpoIVR6XxsXjfbrerJEEBvga/pqb+n876461KVYKl6hWbNcJb9nhkVsILi+HTv2ARL3VBxYFacNF30qWdHeXcbUHxDs5i/ryXaYxMJcvu773aWJ7rNZBMk1PbQvRuuOCln8e+05purirrzoT2U8GZ6Rw4UJhTKPqcHKZjyAC772feGZ+YfNhmov+U7WA7nwTMISJ3S5W8aO+A3MtgEbMkqB78nhqDC1B0jlbEOgwW6s0Bu3Z4ozO7im4Zs/bGPdvxUgbL9gQflMj4KIqLxltq04EukhV/vZDAhwiVFFAKk6mbJ5pf/chkhZ8LvxgK79cSqaYab1U4RRS5+sEHsw1qwmhgGg44yIbrd3h5JH9J+JpyiTrNrZxtsj/LU2yoeD1hgEU+pzByzttfqkzkJoiaHYu7JROjaJmxGhMG/FOHCZdwx3gqY3QdxMRObFBpaXV6BTyFg+gPTx86P3ZsO4RbbW2530uVVkRVpHi4K1eMmWG5xSPrHMBw0d2GFqhnVcaiUE5GNaZG9DxzUwZnWGJLTRM8NEy3PXVq1jvSpfvDRKxJ8BudrkvvZMalJWC0rqQeuUlGk96TTBAHHrZ+xXPT8GyhVo1qk8fh9AS/aTV5AUHs1rr6Pkt1BrBhrn2rf3xmLxkKRZmFOIC2NXQ3aH1e48ScXJluS5EL2twNcLPdMIswl3BFUtr05Q9EvQpdp//AC+i7bBqBjqlY3HsZIzgm+p/UdOXpTefLXxFcnWDamRUvl1ppuBez2yV1kBhcfkVsIKXMbcZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(16576012)(478600001)(316002)(52116002)(66476007)(186003)(8936002)(36756003)(5660300002)(86362001)(31686004)(6486002)(4744005)(2906002)(31696002)(4326008)(956004)(2616005)(38100700002)(38350700002)(66556008)(26005)(66946007)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3UyYTRRL0w5eERqK2ZzUVgzbTZ0U21kaDBwNlhaRXhaLzdXTmhZTHFKcXNh?=
 =?utf-8?B?cDlKTW4vRFBCb1Qrd09YMVBoTndtN25wL2RqUC9POE9UTmFGdGVSSElOR3JS?=
 =?utf-8?B?UlQwZWViMm1UNzRoWGpnS0xaaGo2UlNJMkdrTXZuU0Z1em1LbWhTekVxUkgw?=
 =?utf-8?B?V0MzQlhYenY0bm9wSEJQMHIzYXpHRkdSaldLbU10RUkxQ0E0MjNyLzhXN1gx?=
 =?utf-8?B?b0M4QzJldmR6eTRFYnAwNTFoclYyaXJ1QzkwMlV4MFBReDhRM1ArL1JsaENH?=
 =?utf-8?B?M0c1azUvWmI2TVhYZ25UU0VERHd3WWFVMlZYVkJSdUxmSEhScDc0TkVCK2R1?=
 =?utf-8?B?NHlubzhWRU9PenlGQlV2dUdPc1VvQkZRMFcrYTAyMzR4VUwxV0ZVRDlNTDBK?=
 =?utf-8?B?OU53NU5LUzhYWC9aVVN2djFMcDZyOWdCUTI4SEhaZDd2T2MvMTBHQ1hQeW54?=
 =?utf-8?B?MXptSU53WDZPVWhQcFZJb1ptdnVCeXF3d1NWU29nM25QTkx3SENyQmdWTVBQ?=
 =?utf-8?B?SVhtVWlHNGdzMFNxUXg2VUhmSFdlUzJLUDZBUUlqSHR5RUJyM1NXQ0pMRzFS?=
 =?utf-8?B?VndoYUFLSUkwckFwMUxtcHpqbGxMaEhlVmlKOXZDMWFEcVJkdVpEYUlFV1Rv?=
 =?utf-8?B?UjBRUFZDdDBNTm5USjVrZStCbWFRQm9CZ3U5cG9jOFI5bkRYdnlUUDZJVVBU?=
 =?utf-8?B?bEJIWm1QVG1JSHhFcUdSNGMreUF2SUNJaWUrSlQ3dnZuM3BDWFVPTmF4VzI5?=
 =?utf-8?B?WWJrdkdBZk9aV3hEMzVaaFkwNTFQS0lCLzhTeEdaRVY1WExsTDRDNXphR2pN?=
 =?utf-8?B?SXdCeVJQU1h0dnUwOEdnYXpvcEtnSkZwL1pyeC9kYi9hU3drOUw2NFQ4dVhK?=
 =?utf-8?B?NUh2eVN1MWlhUDNtTHJUcENJekRKVmRzKzRVc3duQlhSODRSYjIvaFhXUHA2?=
 =?utf-8?B?SlNpZVNxNWJpYmZ6S3Y1SzBnbTRxWG9Eek5wNC9vMnRlazZnZGZhQlNNSURt?=
 =?utf-8?B?Sk1nRU9mRmV4QVhLM00yQW9QVjJQejhjRGljem9jUUY2Rm5BaXJUY3dSS084?=
 =?utf-8?B?bytNbm9uekZYeVNwWS8rUGNybzJrcHV2eDRMdlFMZDlQaWtlZ1h1VnBLSHlO?=
 =?utf-8?B?TmxLUjVJWU5mUGJ3dXNyNUNoV0hENkdRTnJoa3N2V2dOWWJKNkk4RWFKbklj?=
 =?utf-8?B?b0VYY0RSd0pmVGs2YzdjbGgzSm5ySTlJYmNPaVNBYS8xWHYxSFdGL25GZkJB?=
 =?utf-8?B?dTZBYWtnNHhmYWRyem5vQTZKWWc3U0RyRmdKd1ZNYVhsQVY0T1o3MHorRVBn?=
 =?utf-8?B?VHJmVWp0VDNnb2d3UDlUUDZnNGlUN1VVcTBjS25KYzY0UDdYajRvMXJiMGtw?=
 =?utf-8?B?d1MyNG5KbDZOdUVsRm4wY040a1hXeGMwdjVzWkxRNHNXSlI4bkxDanl4aUxK?=
 =?utf-8?B?YU1ERS9iUDZsRTEvQjZBKzB4N1RVMWU2djVCbWdzL1ZQdHl6VHBOZUhmOWRH?=
 =?utf-8?B?OGo0L3V4ZzRQeTlOTlZiRXI2c01RcDFjcXdFdHZNV3JpZnl3aXA5RUpjKzcz?=
 =?utf-8?B?czJQSkdPeGdYTXpsUnRjamtlRC9RcTFpTXhqWjB3aUowUzd6ZGxsZFRtazZJ?=
 =?utf-8?B?c2NsMlA3SjBnYUpDblFQTW1YS3d2MDdLQUt3WnZJMWdsVVdhcGV1cVpCaTZM?=
 =?utf-8?B?cUNqdkJRdWpIV0dHR1hYd2t3Qkx1ZTRHbFVia0R2MFlIbUlpa0pSc0dGVngy?=
 =?utf-8?Q?rHbElog+s41zeB4hy6bFGtdn/BghZf9cdbkHA1R?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ec1069-925b-4467-f380-08d96d38569b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 11:04:58.9467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHAeJ4JO7md7lfOOm6IleGKAAjihUgU6H0//NLJomKuU5aKaplLGDSgfP2vHDXOxLoBt+OEFhizSKGrcBendZ5RCFA48FpLwdDvwlgcKHMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3248
Received-SPF: pass client-ip=40.107.6.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_NONE=-0.0001,
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

06.08.2021 12:38, Max Reitz wrote:
> @@ -726,7 +726,7 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
>            * disk, secondary disk in backup_job_completed().
>            */
>           if (s->backup_job) {
> -            job_cancel_sync(&s->backup_job->job);
> +            job_cancel_sync(&s->backup_job->job, false);

That's not quite correct, as backup is always force cancelled..

-- 
Best regards,
Vladimir

