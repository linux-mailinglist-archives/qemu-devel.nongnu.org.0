Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7D5424F52
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 10:34:17 +0200 (CEST)
Received: from localhost ([::1]:47562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYOr2-0004Bm-2D
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 04:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYOoH-0001HQ-Vc; Thu, 07 Oct 2021 04:31:26 -0400
Received: from mail-eopbgr10111.outbound.protection.outlook.com
 ([40.107.1.111]:59481 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYOoF-0004Cn-Ax; Thu, 07 Oct 2021 04:31:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAfEZJRuUNFESVtwdw7HzRCDLxZAwsGUcKAV/JOHUOs4y/gxuWBEH9gEtvuzGQ7wrusdoFBlRHw1cntrTUE70rQ1W+E8cbWEkmy45d+DHYQKpCKsyEvc4jWeVz4DaJRtfouzu4b7VEkQf2PON9Q28E7QHey0rntaHmgxD4DQJ0jE7OhpcJEAhKeVCH8q5lFaCYiTgojbjBc35iUgPfDNzBRh8kM+cQDniyG1aPcZf8VkSWmloPmigvKup+pIm8IZw9WDaUh1xTfZaGe4BcgwOwVOnhfjVPkYmm41nIVDqyDB/X2IhvRYG+9QoYqNCGrkiWNT70DCcOkN78q+pnjS6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xngLUritRJy7PPVowOfylUEg9ifw1Ue9FNO7PJMVxCg=;
 b=XxyePFoXcyLeGj9TbBr0niCRP3ZBQCY1Yv6TM8f3nddHy6iqRY+DVZOEZ4Cvwf99uP7PvlnFjMUg2LvF9Qt1gzHEhX56Ihld4DC7NJeGqfMLJnX1JgKO8V1si1Ap95xwNrJPmaFZ544RoXgqq7bhU2C60bh07XQa1Q2B/BO8HFDAlhJpihL4O1zBkXbJ9NXxRhMwLC+mry5erP4Vf1xfgGy4jB5GDTOpLuKDIZHeC+90lAHd/gTQ9/Iscoqd6ZP9aDmqUklH754/u4yEma67Q0EEsz8DP0Oo/dDTk5PQMGEP6QsTVBAG3mr5Xe3gfyD8Xzk/wyagTfASjK2f72xOpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xngLUritRJy7PPVowOfylUEg9ifw1Ue9FNO7PJMVxCg=;
 b=u185U3iSXGvCROlsC9bn9+mKv7qsuUVHCt8+GG5qnCzuXxwwSyliG2B+btavNZ2JoXjA7VV708BTNEpZz4hNkAUHTRcJALDCEzQpylThcawmmLVH6Ks9K3vejf1KgLJ3RPaVVn0Ibw7TUYEiJG/6KAzS5n54fvU039VaeOxy8T4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4341.eurprd08.prod.outlook.com (2603:10a6:20b:b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 08:31:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 08:31:18 +0000
Message-ID: <39243314-09d6-f972-2a4a-61beb707726c@virtuozzo.com>
Date: Thu, 7 Oct 2021 11:31:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 07/13] job: Do not soft-cancel after a job is done
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20211006151940.214590-1-hreitz@redhat.com>
 <20211006151940.214590-8-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211006151940.214590-8-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.15] (185.215.60.207) by
 FR3P281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.4 via Frontend Transport; Thu, 7 Oct 2021 08:31:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e6e74a4-796f-43b9-0138-08d9896cd501
X-MS-TrafficTypeDiagnostic: AM6PR08MB4341:
X-Microsoft-Antispam-PRVS: <AM6PR08MB43419A24C5CD04720E0F1C6FC1B19@AM6PR08MB4341.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FOXR0WZVPXd2jCki2x+X7vUegh693M8/MLrsIbk0op/oOdkwPW4fgFkZ/As7p8FlDGYPL11XIq8f02qPwYj0d+K4ZabNFkq80Cpi6B/bt6Ij5DWbovuwSt0WvFulpusKlnT/5MbGxYzsEvl3YGoq4Uli7OrAZBjK+UtjpoQDsqgU54ZS4qR70L7OLWkyDpIZWdH1KofedtDM+eSxplmF7rp8lZQ2UqbzI8+AKIoZPFOf23juLfGd8SsrFBeuBLY/6VdWDji+8jleBpVUrgqrAsQotP5klkGhxFmhkWLzSgXQ/I6UFKuCbF/dGbOzqyr/vQZmrIO1DkrJJsWNkqeBEUOFwDiwWMXA9OOS4kLZQ1poSxAN/4flu3V8QUskHDT8Y7JMxWwgalqmXivuwTlhYJDBSKKNFV8aJmTgViH+JOvLW5EUCdots88vwvnF0kwU4M+qo37m5F3wiDSq3lM8ZeIu9hi9b0LKZkiUfaH+yLYUUKvwloSp9oV53rxiUcos/EBPUHveBXLYsPrpfDjvTLhczs8be/Jpn5DmvprcExjM8iJ3OFQkRNHPTHhGH/MhBSq1SDUZZzkOLD80AuYXjdc6mqsM1fkqonLTfvh62s4Qr/8VvAW2YYTf5Pd1vYIFy1Ib6X9Ri4gzRKqRhoxh5ZQX8JUjgrOX5JRvIz1/pAygpKGwIE43uBSh1F3TZlgrHnFDcBsamPV98TgnJW11mNXCCdDQ/Zcs8quDS3djvI1eBeaEPB7zbpKygB/erJ4x6VVvzPCNbgIatD3Hw4OykQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(86362001)(316002)(52116002)(31686004)(54906003)(66476007)(66556008)(16576012)(6486002)(8676002)(66946007)(508600001)(4744005)(36756003)(38100700002)(31696002)(26005)(5660300002)(2906002)(2616005)(186003)(956004)(4326008)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlBVVGNLb2pzVUNId3pjR2pPdjRXWWoxc2NFRDkvNkxiMkthckxwQUcyc2hO?=
 =?utf-8?B?SCtYdW1qcTBzbFlGRVZNYWxFd3pFb3JFK0hnb2xWQ3d3S29IaXRQZ2dXQ2dp?=
 =?utf-8?B?Q21VRWtVdWhsNW85em9kaUxlZEttT3docW5ZVE5Da3BKZmZTdDFuZWFndDg4?=
 =?utf-8?B?eVZqU3Q4WXdpNFJBRDcrSE9OTTlyTEZETlVZd2dIVFd1bVBMR0N1NkJhZWJS?=
 =?utf-8?B?OE1DWGJIdHJNSDJmUUFDLzltcjBSeEtPMHVLb3FMSUxWMFA1V280WTV0UXF0?=
 =?utf-8?B?Z2VlU2MvMC84RERWZ0NsNFpueHBvUzNra1ZYQUtBWCtVOE9lcHBieDZQeFRp?=
 =?utf-8?B?ZkcxR3BmeWhWVFFPbkpBbzFPZWwyYzR3KzFkWDlMdjFoTFFtZ04xSHRuRHdm?=
 =?utf-8?B?THNVbE5SeGNkM1NmZmJ2SUNINnVIVU15ZE50WXNMV2s2eE0xTW5qRnJxQTJx?=
 =?utf-8?B?cEMzWTRZY1Bmb2tNUHowaFRnMUM0QXNvVGQyNllxOU1raWVnV1cwa0ZrM2FL?=
 =?utf-8?B?bHR0OVQyNmREWk9MazJjWnB6OTJjMEVhdXBockV2Z0d4TWdldEhXRnVFYkFZ?=
 =?utf-8?B?S0VBK3Z4WkY2aWFxSWx5NzhRenZiL0VLelF4WkFRWjJiVUJJZktTalVYRUtR?=
 =?utf-8?B?QzVERVQ4Z2N0dkEwdno0VWR5RzE5UkhpS3JrWDQwVE5NK2VNZHloQ1BXQkUx?=
 =?utf-8?B?ZEhqOS9sSTNaTDBocHVnZFBVbHE4ZFRJSTNObzBaOEN5K0tnRUFhNkc2U0JN?=
 =?utf-8?B?V2hyUmRuWXdIdGRLSFF6clpIU3JMMUpoT1ZPaStqQ2VDclhJcXZRWElUdVJ0?=
 =?utf-8?B?N0pNanBmUkl0MjhOSEphV0t0MklNOTBwbHVGSHl0RU5nZlQvK3NiaUJNSmpO?=
 =?utf-8?B?aFYzem56bGtRbEk4Wkk3RWVDZ3RRT2VJS3hKMng2bU5CZTZHNE5wR0pSYlVG?=
 =?utf-8?B?aHU5RWtJVmJUU0NTUWlJYkk2MWhlMFY2MHg1NytBdmtFc3pmOVhhQllRaW1L?=
 =?utf-8?B?RjRPdXNadWMvUXdWWlNiWC9CT2owVERpcFpkNmxHOWZWOS95RkhTZ1hySWFV?=
 =?utf-8?B?ZEFKcHZ0RGdkV0lRdnorYjVISGMvSWdzbUsyQ3lvUFVpUFpVangzSFBlUCsw?=
 =?utf-8?B?RTdlcW94Wk1TMEdKQ1MrNDZmN2hxSVg3QmxvUlU1WXJPUTdleXhMOGh2Q3RT?=
 =?utf-8?B?LzJTbjYyQUs4MUVjME52NkJsbmFXZkNDay9RNzUzOXpWL3VHeWZVT0hZS3o4?=
 =?utf-8?B?UXJNTXhpWnZXTktuaDV3UzFpZjdpK25ZMFZWR0RJZGUvMGRSZzlEVHVYa2Fm?=
 =?utf-8?B?OXlJcVhiNmptaVdSaVAzYzBLNFFaWGQ3TnNPclBxRzhOMzBsYjUyMWp5ckhU?=
 =?utf-8?B?MmFhM2tvY084Tk1qV2lEaG81akx1T25icndLeXU3T2IyRDA2d2FGU3VlNnhH?=
 =?utf-8?B?SUZaank1V3JETERHMFUxcU1EMXc4VU8zWit4RGVlTmd3TVJHQ09OaStRTmRS?=
 =?utf-8?B?cG5haHlUcXAya3VUek5nMHhzOVVQbU9FZ0VpNDR5TkRxVWRFUGxRZm04U1VF?=
 =?utf-8?B?S0EyLzYzNGdBd2NYSVltOG9UZzBSSlMrcjEvMDFaaFY0UVltRm9CODJ0cFJE?=
 =?utf-8?B?VU4va3RrK0MxYy84U0xmVi9EenNRMlFFQnljTjFGNk1UQkM0NExkMStTQUlK?=
 =?utf-8?B?R29EajB1dUJWdW9GRWRZUm1nMVJhVlpRd1VVVEdWN2R3dUhwV2tZMis5MnY2?=
 =?utf-8?Q?1U+hUDZNeKHZk0cZSW5fXVMuffy+n9/Y0YbPdga?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6e74a4-796f-43b9-0138-08d9896cd501
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 08:31:18.7288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o9vn7evI37n8lVfUCJX0wWp62gZbX8SFGFw1r+ho5anpy9QAw6s0GzdJOQrxQJ4WebAvyKj+d6RzvzBK9gMxbSvTYqI7UiwHMZk6mcxyc54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4341
Received-SPF: pass client-ip=40.107.1.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_NONE=-0.0001,
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

10/6/21 18:19, Hanna Reitz wrote:
> The only job that supports a soft cancel mode is the mirror job, and in
> such a case it resets its .cancelled field before it leaves its .run()
> function, so it does not really count as cancelled.
> 
> However, it is possible to cancel the job after .run() returns and
> before job_exit() (which is run in the main loop) is executed.  Then,
> .cancelled would still be true and the job would count as cancelled.
> This does not seem to be in the interest of the mirror job, so adjust
> job_cancel_async() to not set .cancelled in such a case, and
> job_cancel() to not invoke job_completed_txn_abort().
> 
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

