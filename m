Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED20C39688E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 21:52:18 +0200 (CEST)
Received: from localhost ([::1]:52204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnnxR-0002hW-HY
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 15:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnnvz-0001pz-GE; Mon, 31 May 2021 15:50:47 -0400
Received: from mail-eopbgr30105.outbound.protection.outlook.com
 ([40.107.3.105]:43374 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnnvw-0006rO-DX; Mon, 31 May 2021 15:50:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYL3fxkg+u249NP2p0fueTDUCr9ycNukOs3Lmk828+F2I+gWP9sGzRM52wfz2DmjhopdFdR6aZIyK8WaNtzpeId0qWY6rAoYopc3hD37DoivgN/Qkos2foOXPuZ5211A78gHnK7l+wip8Bhz4iQ29oqfKTWRUmINxFGEaaq7hEqU3HxerXO2csymugQwcZAwCnVR76yYTobs2z7GEL5TbcWix4x9diNs7+fWB+TKRxgyKWyghwScdd5p7XR0RftkIbmPItWDxFs1OxtyprsFABOUOO1Nbg4psnSc96SHaK3xQODWFHV0gCmT3TclqNRwoACfHhEcnf9aDTXAhcJ8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qH0YXUnk+3e0dVSHwnf4QbUdU7UDJHMvW1laaedvgKo=;
 b=OZTCFl8IKtI1qSlKeu5MbZ7sFrMfzX2kt1rPXs54G+SNrhQxnOW+PV2BGNt0knFQj9na6gWDTl1FlW9ED8+gtFqy5uw81F3MbXrbb6+OqHr/+di5YNJsxgSxkLqbY76Lp93znRVXmRy2gN6l/4rUeWmzCb3gzNJlQLu48KLyMVIQ9+hm/q6Ibdt8lj+9BTzlVmbXQYlbV9kqFBBo8U2XEZ0hFsE89XmJmB40CziAwpFuN9EFVY80DH0AfGxhpRyPjvIxO5D0ocWkybM6M5DvPupvm/HAVPu0TR0aW1WPJ62KUKoNfnnjr2bvkqQYyz66xoYpugdpjKi+T1TofxgSnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qH0YXUnk+3e0dVSHwnf4QbUdU7UDJHMvW1laaedvgKo=;
 b=AqBFM3HdSrI4UMFsh/1sbULTYiiykzhyQlxBP+t0agvQ8UNpxZ8TziRFGVpv7hThaSZQffIvie05F6JSUedAX3B988Qh+yS/OCW3/88jwsPAOYt/as76FFlOkCLDv1Y8N8p5M2/RqSH0c46imjPTyNlPG6mQlVa72ujHTMiAY4w=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3224.eurprd08.prod.outlook.com (2603:10a6:209:47::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 19:50:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 19:50:41 +0000
Subject: Re: [PATCH v3 2/5] blkdebug: move post-resume handling to
 resume_req_by_tag
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210517145049.55268-1-eesposit@redhat.com>
 <20210517145049.55268-3-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4bbc70d3-2862-db73-9286-34d969a41a54@virtuozzo.com>
Date: Mon, 31 May 2021 22:50:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210517145049.55268-3-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: FR2P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 FR2P281CA0032.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.9 via Frontend Transport; Mon, 31 May 2021 19:50:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b920c7d1-6828-4c82-009a-08d9246d5ece
X-MS-TrafficTypeDiagnostic: AM6PR08MB3224:
X-Microsoft-Antispam-PRVS: <AM6PR08MB32247BDD14EC411CDD693588C13F9@AM6PR08MB3224.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sXHZIohex6eN4pPiDOHvW185YGxFXvGDMvdD7WwxjRQCDQ8HD928JijUnc919/uLgOZkvUpEy9TXRdGKCeTafXWFyzGo7ol2fSALE5SzAhkvZV8xqgBMl7v1z75uEpaucpFy0dGzleG8Xwg1D9/0pCbcLRJEInP166rpP08+YEkdkRvOOIIBpz30SIfHEYEAHnF54qqQIvpM5ffQW/3vZFSsXlSpE4ULlNv/glkCgg2FH9tOquZswDovw/cZpe22l+ysPeF9HND4wbpudIc+opv7XsqE3VUbizmkR7gfgxpszMcy19KPpdGCLL/9T1WUsz9gjvKaAc0PKkmW31PR6TxYLSWoDEiuNcbk1iReI49E8c+NXDuhNVGD7FDRHur6t8D19hOK4HErvMBZxWxaQDNy3MTZE0kwJo6mBeIOVZQDRYt+WZBUWiKbPSMQ3r/airgrWgunMxvK425IRHpW1PZzpobBtGfG4jXHVyzsozeqbmErt8Xjd2ANnmikrgSQloJO1NQqgbi1O/p1ko2cX2cnwaAEskGtRtapwEKPcbxjjtk0dUQwQOMIWVbrLvGO4y4a1BcmOJlNS3EmgW/vasuMTRDnFpLpr0q03zYAvcYlanWG+jkWlgAEQaa1m2sEwd1K+/GShkmTGonXLg3ECtB1dKVUXLykzVGlKkvf4PLwtC3ZkoCAVdnnOa4bAe3/3mLb3+PjjE4FfLyjcvP9hA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(136003)(396003)(376002)(346002)(5660300002)(66476007)(16576012)(316002)(66556008)(38350700002)(8936002)(31696002)(54906003)(38100700002)(66946007)(52116002)(2906002)(26005)(6486002)(36756003)(956004)(2616005)(31686004)(4744005)(186003)(478600001)(8676002)(86362001)(16526019)(83380400001)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QzVSRXlCN3cvWmp6ZXJnYS9lNDdSRDE3SE14YmhxbmJpSnRxSmFtT3dmWm9W?=
 =?utf-8?B?bk1ZSHRRNVgxVVJJbWh6ZW5QY1k2LzUwTllFRzNNbUpqcW5yQmV0KytQN1Bh?=
 =?utf-8?B?aWhYbG9UWnNlcFpiQmRGT201b0tzRXVmM0VRdloyT3BhVHlKcGdoWk13emdZ?=
 =?utf-8?B?QzhqaDRxYkRCOUlvYmsxcHJlMmNPclVSNE5zMkR1Z2ZZZjZwd0RNT3JqSFhY?=
 =?utf-8?B?M1RXcE9ENDNjQ0VRRXg5dnVranhQaVRtVENyS0RJeno5cEE4WmNUcTBnbnJm?=
 =?utf-8?B?ZlQ4QzNINExlSmQ2QWhuMnJwaVUyKzFKOHhhSjIrdzFyaitCQXRTZThDUTRi?=
 =?utf-8?B?ZTd3N0VFNmZkOVR3UWZ3eTRYamNVdXU5VHduRWNBMC84SXgrUnBxR2R3bXM1?=
 =?utf-8?B?bnJmK1pqZExKSE1MSHg4dlkraC9yNG9mZmxVbmRyMit1bEI5ekRXZlFUM0ZR?=
 =?utf-8?B?WU1FWWRWSlkveFVjREZzWityUTZNNFcvRUdWZ3pOanpkVDI3dWhKL3pZTmkv?=
 =?utf-8?B?djJGSk5VbVd0TUg1OTFmOVpNTnNIYjNhV0pzanZCM04wSVFqc0lLNElXajFj?=
 =?utf-8?B?eWhHOVN5NjdJdEpOZ0U3WkROR3IzbVRjeXhPMkpkUmRxekJKOCtiR2lrNDNF?=
 =?utf-8?B?OXNOckloamNaK2ViSTViZ3NMaE1UY1Z4djkxU09LY052eE1CRVIreDUyanlJ?=
 =?utf-8?B?YytZZ3JpemFwbWVqZFByNWQvaGNxeEdiSGlXakhWTmRxYmJGZ3FJVzRrTHps?=
 =?utf-8?B?ZUhkRk0vY3M0cWhjUSsyVVh1eG5HMDh2V3NYbEZjeENCRzVYOXlCd0ZHVWFI?=
 =?utf-8?B?RXVweUtrd2FobzkvcHhjRURYSjMyeCtsbUxrcE5ocTFiV0s4dXJYbjVieUNs?=
 =?utf-8?B?L095NEF3SExtVlYyQ0hLMWU3c2RXS1pacU5YOEZDMlNPaU9uY25BSUlpZExj?=
 =?utf-8?B?bExUVHFibFVXNVpNby8vM2dJeC91M1o1cUU5QzU5RkthNWI1QUx5ZW1XYlp6?=
 =?utf-8?B?UUZEQlJWL3p5dE90dVB3amJKMDczeFZBMWRtMUw3VlZtdzZkcHdqbHZBYno3?=
 =?utf-8?B?RTdBeStpMEJDaEFjb3p5am5pK0h5cmhkQ1hKb0JnZHcwdVVtYVNUUjZIMnNL?=
 =?utf-8?B?UTdOUDZoeWlrdmV1L3JoU0RRbjJZTEdjaDFFQlJCcVREU3N6d3dSUjJZeHQ2?=
 =?utf-8?B?cEppZXpSQXVSdjNVSUdMS3RIRElJWWNNNU9NM1NrOXJMd2pZQnhidUNBS1NG?=
 =?utf-8?B?TnN3aUhwZHcxVHBCUlE1ZTJIVUxXZzhMdHp0WUltelp2QUxXempTYTAwckNn?=
 =?utf-8?B?RHIzLzZSY3padUJpSi9VSlE2Y1RmMjhBcGhaM3g4RWJSRUh5eE52TXRtYmtO?=
 =?utf-8?B?NnBrVHJVaFZBYkwzdTBCTmFIa3kxR0RLLzU0TTEraVlsbEJWZllCUFY3TmJJ?=
 =?utf-8?B?alJER0xvYnZwZGZ3WlhtRTVxTkVKSTlidTJLNk05ZGwwVGN1UGNlWWFFK2M1?=
 =?utf-8?B?VWE3YzB4T0t3SGZKNnFaRmhYSkdkS3I2ejhaMGczNmNIem1rd3ZtbmJQVDhZ?=
 =?utf-8?B?Zk00WVhwTnFzNE9iUkZDT0ZyakFNc0N0b3J6Qjg2ZDlwZlBFa0pUVEJ5cWFx?=
 =?utf-8?B?dmdtS2lxSnYzVDFwRVd5VWM4RmltZVhTTWpWVVlZb1FOVTVYZlpPdkNIVDRX?=
 =?utf-8?B?M1gzZWV0bEtjQlloNDVRTVVEOW9xZll5QVZQc2RycDNoNXpzbkNBWGNNbDV2?=
 =?utf-8?Q?NC98kMtkR/1b1LH6bLD+UlDP46dcVBSSjuud8Ub?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b920c7d1-6828-4c82-009a-08d9246d5ece
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 19:50:41.1972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkM/1Fy5j+7jlcIMZcANq2XBr4qld8n6zEp1Hh0XsCLucUtkLd0fkMJXmbNOtOhQMi6KmZxmcUJ2hGl5fMxcwII6LCmxzaUBzWHp1IATNz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3224
Received-SPF: pass client-ip=40.107.3.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_NONE=-0.0001,
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

17.05.2021 17:50, Emanuele Giuseppe Esposito wrote:
> We want to move qemu_coroutine_yield() after the loop on rules,
> because QLIST_FOREACH_SAFE is wrong if the rule list is modified
> while the coroutine has yielded.  Therefore move the suspended
> request to the heap and clean it up from the remove side.
> All that is left is for blkdebug_debug_event to handle the
> yielding.
> 
> Co-developed-by: Paolo Bonzini<pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

