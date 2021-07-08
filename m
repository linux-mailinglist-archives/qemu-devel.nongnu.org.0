Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699373C14AD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:53:31 +0200 (CEST)
Received: from localhost ([::1]:60664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1UT4-0005lh-GD
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1URt-0004xC-35; Thu, 08 Jul 2021 09:52:17 -0400
Received: from mail-eopbgr130104.outbound.protection.outlook.com
 ([40.107.13.104]:20047 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1URp-0004Hd-Ft; Thu, 08 Jul 2021 09:52:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HW/7L+QzrTccoG8mpyI6ebEcgmsXCCzJzVODOEVhsRwtErRxFlpFa2HZpUpf4FqJw2V7VBk/p8MnwwQQQrhgEBROiU2nsILJvk/v3F/HFVu9RTGJCJfpN2LKmTD/PpgOYzJ92eHswEQVMCnG31oGFyirdHM4aqLA97686NCZ5860KodJh7l6LApy6GGI7N4sI/BBAGBP/EjAPyLJTH5mGLdSd8lsLQUlrHYWpBx7IadpKULOJH5iLrhRy0G1DajKqm5iJyAJZ5PM4HVqn206lp2CZAkWgUPyuj7k9HTBoTdZM8MsP+nKhppkjw7a5r4ROOvWlZ3UEzCmSqvaR1FiXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8tVXj3AzdQqpgySw7ZSQZg09n5U86EmS7jdXbb8CqQ=;
 b=V/Xqu4YfshI/V3t4JZ+fmikiIiPAnb3HnOXLwWH49eq+G+akJTBHlyEPR2NXXhF+uvgUIIs4F41yyTHk5DnvwtVy8yEgvHtXOsjfpQOh+Cjd6g8r7rtcB5enuzAZ0CGwadf7RofwF4RgW+xR3ZJ0A1hT9ROLHsZ0WGwHRuKKYh6v5iie+S8jQpSGfM0ozup8xG0e6MfyD+QDT3aoL6m/VXiQLXgo6Y4qfQLjw+mJYkHnd/MzK7NUXtPLafReLeP2qBFjVTMKByslnYfRiIupDn+XC4bGqkmhQ9QR/sgVqjxtrKhPwDDhCut5ac/nAcJajXfPOPJzdEdGevPrelGX7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8tVXj3AzdQqpgySw7ZSQZg09n5U86EmS7jdXbb8CqQ=;
 b=WUIR4HUpKTfaT+zlSs2V76G/Aqfx8HywZLIeiCAnceyqIONzVtkiikJBbbHk+BZ7rvPkLlF8tF/fHPc1IxOeovIzyXzC0qmJYB/aZrmKU0n6KqjNlfamKCWaf796MFM8VHvFQh3xHvSceL8DbshGkL+G9M/ZMz7TOuV2/9Fi9rI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5384.eurprd08.prod.outlook.com (2603:10a6:20b:10c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 8 Jul
 2021 13:52:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Thu, 8 Jul 2021
 13:52:08 +0000
Subject: Re: [PATCH v6 1/6] qcow2: Fix dangling pointer after reopen for 'file'
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: mreitz@redhat.com, berto@igalia.com, qemu-devel@nongnu.org
References: <20210708114709.206487-1-kwolf@redhat.com>
 <20210708114709.206487-2-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4ff7e5ea-15c7-dab8-a754-386669a4fcf7@virtuozzo.com>
Date: Thu, 8 Jul 2021 16:52:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210708114709.206487-2-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM8P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Thu, 8 Jul 2021 13:52:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fec7f42-2152-4d75-8f03-08d9421793c2
X-MS-TrafficTypeDiagnostic: AM7PR08MB5384:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5384F03D98062A4E2C42F3F5C1199@AM7PR08MB5384.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:270;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N8o/RLuyPBPAbe0zdmlNP3Qi0Fp7iRC98cpI3qbeI4O8vuznL8awTFT8727nibRyt/Po5JgY+NM87PyILqXj//v8VOGiDIZhOUWI/gBfva8B1Jv7YBeQZ7bsO+Xx5BWDLh2fFLLFJSD73IVqTsUkHE/dXPVaUml6kUwtuZdmX1Hi1DvSprg+qh+uEcOHp/L/cvVTAryRegjGu7n8+x3sJcnXwzZ26n+9qTD5JpFdBWwLk5+WG8FsRtfkz/mLWMk5cFRnpM8Fhn8KVTG7cvVhBoIV/yCh+2y+tiCgD9tlb/Q7Xl5rRhnIrhGoag0wmMC6ASKmtfXugJe7dFaQ2aKJqscqiSI3lHqujTe3rosKa6kQHuT8KuZ+X+yLj4mKz2alzTC4LMlbymGuS7QahUoIpW8AZlQMekxMt2beUi4KWsE04DfH1/HroFbR/MDKDoCXzoXbCIutcF0wvw7GlRflTHgINHsGViYR0R5B+uz0FQHwcLksU1yTQbaWQ0ROcydsY+uNsuKRU0Z/M8d9aN2964/5ooAvxzQYoWEVVkKHnIEUKPCl99XRxvCXar5ikHjJ4iTF2m50eePb2JpT8BTqjKBFVzBLntF2vDhlouGW2aLbMya0DGJTT/H0AKLOudp4ikDRuNrVzymb4SepC3GPDhZnVqy5uNLsMrHDG7O3DcQbpYRmj7FPhIxORi1M4wpCLh9WzfzB3KN7CbKdGsYd3Hawx+M9TIFh/tg6UHV7nZPNw4ceMp6mcaiXdnxs7j9f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(346002)(136003)(376002)(366004)(396003)(66946007)(956004)(478600001)(5660300002)(186003)(8936002)(26005)(31686004)(2616005)(8676002)(83380400001)(38100700002)(38350700002)(2906002)(4744005)(66556008)(4326008)(66476007)(86362001)(6486002)(31696002)(52116002)(316002)(16576012)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFM2WjVmVGFpM2pOOXg3RTRHZWIvZEd0eWRNaW9QanJ0Z2g0TDBETTNwQys4?=
 =?utf-8?B?MFU2Qndrd1VzcVlwc1BXRk9vZFppMllCWFlZMzlqNWtRV2hHMTJrQXRRdnJP?=
 =?utf-8?B?WUZYRDREOHRCamVqN1YrT2M1N21FVHFZNnpMRG9QNXg4TUcwQ1VIZmZ1YmxF?=
 =?utf-8?B?V3YzQXB5TEkyR3ZnNWgvSGtNWkNzS3NqaGUvWlgycVB2WE9qdVNhaEJvOENh?=
 =?utf-8?B?bWxDRVBEaXlYOGtKYmhGc3JneTNOWnN4SEgrYW1Senk4R1djYVVZV3BiVnFU?=
 =?utf-8?B?ZnY4K1NNT0Q1OE9kY1FRejhIWCtJdHYvbXIyQnJWWmdlcEx0SzhvbzNKdnht?=
 =?utf-8?B?ejc5aW1uNGtpZEl0MWRMU0YvcW9DeVcybkFVNGoxUG9Ldy9PcUdZRTYydjlt?=
 =?utf-8?B?Nmd0ZGxtOE5zenUzZU9Uenl6SmFHK1ViWmZQVmVFOVNMOW92Z3lwNFdPcjVD?=
 =?utf-8?B?RkRpRDJHWFREOW9iblBOdDhTY241K015TjN3U0RTSEJhaUF1Z29uVUxEWEVh?=
 =?utf-8?B?SmZWSVBuN3lnV0hKZzEwRWVBZW94VkxPMWpDZWNJd3B3MHdXTFlMcTRkam9n?=
 =?utf-8?B?SHhBTG5HM0ozcFhvcEYxMDAyZ0llQjBsNTd5NGkxdDJuM2J4VzlQWjdSMUFr?=
 =?utf-8?B?aEJJS1h0WHJjWWw2ZThGTURIN251VzJXK1lHVDZxUmtIU2ptaUNSNmRmYUhP?=
 =?utf-8?B?TXdnUmh2ZGFpNUFIT3o1dmtoWnFxOTJjVUxNMTJsMTk2SnNvcEhURk04K1pk?=
 =?utf-8?B?NGlmczJWcUNCd0dIajBOZzhCeGNadHBuTGh3a2wwaXJURE8ySXdJa3ZjZVNq?=
 =?utf-8?B?dUdVVjc3VU1PRHVUKzVsNjJMdm5KYVUrZno1T3pGTVNQazQ0UTBjcHorMXhS?=
 =?utf-8?B?Q1MvZ1lVNHBpZDdyOTRVT081SHdSaHliV3VVVUIyRkxDNHpxN25oMllldG5r?=
 =?utf-8?B?ZkRvYXZxSjgrSkJKNkR2UTFPOVBFY1Q3UHFCMm1LMTRFZjFXRGFRTHprMVlC?=
 =?utf-8?B?TXEwdUxDZFNRT3UwWGJLaFN5dTJtb09ibG5sUnhpUktYUVBhUkVNMktuUzhV?=
 =?utf-8?B?ZG1iOGxnYTQ2SzJYbU94SGR1Ymp1ZDQxZmhVaHZVNThDeDI1SjNKRVhrdGF1?=
 =?utf-8?B?VGdNNWlETlVUY2VFNnNsS1oybkRFSkU0ajVsb2xUT2o4UEg3U09hRHRTWUFv?=
 =?utf-8?B?NGs4dFlscFNrSUN5TlY1SjlPbjRVMHBzOFZTczdsaTFLMkpIY25GdVBVVjht?=
 =?utf-8?B?MHMrZVpaYkpUV0VwR3hudUc1cWtoaHRhRUFkR1FLQUpReENNT3JtbHdQY1Ro?=
 =?utf-8?B?SEd4a0ZqNUo3cTE0Zngzc3pYWnNuRnBOS0FZSVB1VEFvcmo3d2hYMFZDSHM0?=
 =?utf-8?B?M3g0em9Sb2xwVE9nZnFMYWF1eWRKWHJOYVVnSVBqSzU4ckdhT2JwbVp2WVVV?=
 =?utf-8?B?ak1uUWRWQkhkeWRwOWErZ3lnUTBtSnc1QTdHOVV3WldMNWNQRFc3L2FUbHB0?=
 =?utf-8?B?WVRxRlFTdzRIUFRLWXJ1enNkT01mVTJFd2pVd2pCNGVUd0t5OTBtbnNhR2NK?=
 =?utf-8?B?L0dQSXhUTS9WWXJTTDk3dUNDZUJ0LzhFdGhMQ09zenQ1UGVBeHVjdXZsa241?=
 =?utf-8?B?YUlUSHF3Zk9hUWlTa3gyTUJ6aVZHaitSbXJWc29UU05VNDVpZW1RNDI5NWhk?=
 =?utf-8?B?QUdzL2RSdG5ZRXoyemozamh5bkFjQkJIcEd6bkR0dW5Nc2t4MVY1K3BDRnha?=
 =?utf-8?Q?wAPWqeJuk+knOC7ZHy1wV4zkogLlscmOZUR4nhr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fec7f42-2152-4d75-8f03-08d9421793c2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 13:52:08.1821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ih4V/5pQoSZBxn0MzF9eYaDhyqNOKtbSKKmeAGJ4QopcafHRElspkkVApzvJ5VNOT9vdrhkl75XgsEx/imZIPBCp35AnGZRoVzAghaE/3o0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5384
Received-SPF: pass client-ip=40.107.13.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

08.07.2021 14:47, Kevin Wolf wrote:
> Without an external data file, s->data_file is a second pointer with the
> same value as bs->file. When changing bs->file to a different BdrvChild
> and freeing the old BdrvChild, s->data_file must also be updated,
> otherwise it points to freed memory and causes crashes.
> 
> This problem was caught by iotests case 245.
> 
> Fixes: df2b7086f169239ebad5d150efa29c9bb6d4f820
> Signed-off-by: Kevin Wolf<kwolf@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

