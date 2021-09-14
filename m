Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9BA40B1E3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:47:05 +0200 (CEST)
Received: from localhost ([::1]:46370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9iC-0002gK-0f
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ9O3-0008D7-28; Tue, 14 Sep 2021 10:26:16 -0400
Received: from mail-eopbgr140123.outbound.protection.outlook.com
 ([40.107.14.123]:55297 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ9O1-0006ed-Ho; Tue, 14 Sep 2021 10:26:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=baO+R5wgRSHnc3lc0PpMuVtPa13fFJYPfHN3jNfNtyJmRM6ewlMkPQa+QZgCCTCB4/DqHCokwqk7+PN0JZXfdX6cxcoO3uqLBXzPUYQRwvYnN0gQ16J78Kjj6Qcr+YnZToGB6ipnXsU0yHXwolsih3Rg8OX+1hjYEttEeJLLnQFbuZ29yGxYs3IUV41avK8kC4+LHGTWFRxyaAC0h50P3x+bKHeprdwlTtkKFO6HDqjEEXDFbKL26FzY60kmqVm5nrXVibrY6jZWLkZXki1AwGdleJXG14DqPfq/oHWZsYpWCvlBm1es2CLsAZosp4HJnJ3arvr0MmtVFDcf5KP0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=rwuufwa49+TKBiPzzC3UuEI8ukE4VdfHDTzSxJE0IGc=;
 b=FwaPKISToHkpO0085xLe2DkC6Ba4nNNaSny4yUXQo9RKrijhtajODZmeRoaRZmr7A6WfieF77mzPrTf+ftSWvWRiZFyNp2M4HkGynb/l1p9skgzYFe/Bzwbv/n7rr3tPLy/JO/JA+SboIxck0TtxCR3AK985bpvclbCOq1EUThrpM2IVE5JGGR8nIYhsyfS7HTD/iwdX/uSmY8US1Aw3ZeO8qM1eSG7hPHZOiKSo3sIn4LoH2Uh2hEcNfsJmn2FSS6xjRbVfXLXmcv57xKSEKga6f3fjXm5GerRh7BtP5+ImNGOkl7OeTJK1fpHMGZnFGvcXoS9lcOvGZqfdp9KeWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwuufwa49+TKBiPzzC3UuEI8ukE4VdfHDTzSxJE0IGc=;
 b=MkKAsU2WkWKaKOLVc7x3Y1DavxRewXYcdryNu63J0SLsEaJrqWwGvHeI7o6VVwEPe9EGhSXgF2kJ1Z/+UpiSvmC4BcvOtw7+YCAx++4FfrGXOlh+PBznnTJNnREIgMRIPevn0nWC/R88oSDpEvkG4xIiNA4V8cJbGnG3mz8adaw=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4916.eurprd08.prod.outlook.com (2603:10a6:20b:ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 14:26:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 14:26:09 +0000
Subject: Re: [PATCH v4 06/10] qcow2-refcount: check_refcounts_l2(): check
 l2_bitmap
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com, berto@igalia.com
References: <20210914122454.141075-1-vsementsov@virtuozzo.com>
 <20210914122454.141075-7-vsementsov@virtuozzo.com>
 <20210914142500.iq4pwvkt3rl2hddb@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2f147a31-57c2-5988-46a9-30aed15932bf@virtuozzo.com>
Date: Tue, 14 Sep 2021 17:26:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210914142500.iq4pwvkt3rl2hddb@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR1P264CA0017.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 14:26:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4fdc530-8b7f-4c7d-5fc9-08d9778b98af
X-MS-TrafficTypeDiagnostic: AM6PR08MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4916ABF7ACDF1DF99117CEA8C1DA9@AM6PR08MB4916.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZrK5k+lDcjXu0VYS0Kd0IK3SXEneKiZS+KTYdLcoemc1EA0YUe4IfRbFh4zdbpUr6H5+FRZBcZ6SiPC6V2WQuuHlO8J05X1WFKjIF1OADyrxbOO52ANXGPYI0G6QkHVvAi6BTa1i3tMp4m5IhI7Paz1sqPYnyaKlg0jQoYHyHGBNqp1eivXGkLT770LpPaVNN9cB6RCojudmef4Rz5hBLdQJZhz978Unrj4xmVPT7PIbpjasn68nqkTt3MoD7vaBlJsc/6nNGWujWN2O0IAFMfNR8N7xTNKol8kyE3Xtdo4s2V+PRsKtYqRruQCuuuq1Pej0yx2f6AqMJ4ojepFzgFzegz1qYd0nVRJ42E+36aAoEB0rEj7b0fEhYuvpa3RCwnsnyThKIBXRRhfi+RoZXYuhsyzH9z8zQWGS++EsZkAYp8LygLfVlCZwPMi+NRj7ZGfxXdaDhr5XeGw8TQnUKgPcnGJEYpxr3XFQmfjxePqYWacFItBdsV7Y2xaGHGRJzJsOBO7sWa4J22fTmisRfBcvSvR9ayfLt5eBi2Z/YMLl3uK835TJbFvlUgFiY+R0ztRx6bs2nLnxZiBjCvIbp+sdwV802WbJeEAu2OvfhmzKENKpSKE2wehEDxDhoLeiKHD/dmIuAsojtoJMNiikmD7spo5rpNDhJme3cupbxCuAuVc0PpU/8kSLO9axiu3ddwsAG6hplj23SIBsVEZUNjup4V2KCFSufM/5vgytbyvfqOuex9oK409hWVwUpRHkU+MsFhtTU+Fnn40iD4UOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(366004)(346002)(396003)(376002)(52116002)(8936002)(31686004)(66476007)(4326008)(66946007)(4744005)(36756003)(2616005)(956004)(66556008)(478600001)(2906002)(8676002)(6486002)(86362001)(83380400001)(26005)(5660300002)(6916009)(38100700002)(38350700002)(31696002)(16576012)(186003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1RoMHFQbXRXT3I0SlBidWVIdU4va1doMm96aURUVWEraU8xaHVWeXBpZm1D?=
 =?utf-8?B?WmJkOEptVGM3YmhIb3VqM1BKZ1BmV3h4OHRFeDFiV0Z6QURoODBHUGxGc2dH?=
 =?utf-8?B?S2l1NnlVT0RHWUZtcWlCQ0xKTzZITkdLT2pDWlpxU2xXdUlrNUNKbldudklR?=
 =?utf-8?B?ZG50bCtxeWNDZnN5azVZVWlPOFRVZ0tMcGZyejJvb1pCZk5ybU5uZXpvYW1p?=
 =?utf-8?B?TFNWUXdza2VKWmQ1dU9pSUNhS3N1SkZqU1VaVjAwVFpkQ0tOdEh3akNaY01L?=
 =?utf-8?B?MHpoU1c1aG9Ia1ZKUVI1N2lkc2dPZlNmTTZlb3QyaUZMMmFjY0cxUnV0ajBn?=
 =?utf-8?B?Y2ZmWVpqYld1THN5N1lXdlpNOWw5OGNpNGs4d1BtQ1ZpR2lGdFowNWRyRnNG?=
 =?utf-8?B?T3RUWUx2QmdVMktCZTFBU3ZDNUZUK1AvZElYUDYxT1JjOTVlT0MvdkM1MmV2?=
 =?utf-8?B?L1RVdjZuMjBSY0g2emo0ZmhMY01aaVhmemZkVUhmL2phWURRR3BrOTI0UDgr?=
 =?utf-8?B?TzdjdFR6ejNYRE12WU8xNlBXNjlrV21oaTZJRW1tOWd2dUhob216WE4zLzhC?=
 =?utf-8?B?Skd3NjlUZ1c3YW0renJ3YngzeE5jQWx5am1sSWJYTVlNUGl2aWZIZE4rYlMw?=
 =?utf-8?B?YktnS3hqTFdNcG1pYzEvek1yKzhXNjViWkkyS0Q2TUtwWlV4S0M5aUJyenNF?=
 =?utf-8?B?MGwrVW52a1NHNlBLZFphMkwxNThnOTRpaHRrWmxyNnM0WkxMa216RmpiOGxH?=
 =?utf-8?B?VDBGV2ZKOEg4Y0dpZDYxQzZXWEgyejZNbGkrMys0R3NSbUl5Rm1TcmgyUTFI?=
 =?utf-8?B?ZGVzZkFuWmFpMW90aUhqYjZSVVNobjBrTHdVRFZMMkd6eEFsS2pLT29DZCtz?=
 =?utf-8?B?a3RUOUx2bG0rVHVpRlJEdmRvMExNbUpDdGxzeVlXdHpSNmEzRFVLL2NDWW1R?=
 =?utf-8?B?WFNCb05YbGF4VTQ3SFRxSHF2a1cxZmdveFZxRXZXZ0t3ZUtlVThHMW5uYUhs?=
 =?utf-8?B?ejB3MnN4dXBuNWx1RHFYcGhrM09ZU2xPRDlWNEExbm9XRGtvOXV4NmQ1bHdD?=
 =?utf-8?B?RzZqZUpQaVlscjFkcFJxWktlVjhqYmdDRktsdDZaRWc5N2JDNXhZQmM5UytL?=
 =?utf-8?B?WjZ0ZWw3VFZmVWV6Y0VaNmljN0U5MVRPMndUZ2RrTzdwbG1Ma2xGZk1NUXpr?=
 =?utf-8?B?eU45WEZmRElEL2JLOFFOWU5Vd2pJTzREaWhSWU0ycWRRY3h0VFJLOGt0K2w5?=
 =?utf-8?B?NjgzSU4va0tZWjhYaGxVbVg3QlhKN0czVjJsdmZLVCs3TG9vZlcrQklOb1E0?=
 =?utf-8?B?b0xOenhjT05lZy9sSG5ubVZ5ZHdQQjJLcVdBcTJBZld5NTVsZGxDckxhT254?=
 =?utf-8?B?MVYzcGduT1hYTUFoYWR3bmJ2ZXZIaVplQUQ1TWtjT0RZVjczeEtEWHpoRkl6?=
 =?utf-8?B?NHFyM2F5dC9PNE5CbEhiN29yQ2Z1L0dtZDFnUzZlbG9xTlBKQmxSdHNFT21S?=
 =?utf-8?B?N0dpVEtDcUt5R3ljVzZBckNvRm1pTURTNTc1ZDhudVNjQ09xdVgyZ3ZpcThi?=
 =?utf-8?B?dHZZOU95TTZ3aVJCbzUrNkUrZ1pZOFM5VFZENW0rZ0tVTFRaSElIV2RPQjZp?=
 =?utf-8?B?ZVZGVE1qTmZsR1FLTmZvbzlsK0Y3eDlIN1IxYk93ZVVOQ255ODhUM1g5Nmpk?=
 =?utf-8?B?b3RUd3YzNHlTY05HdGs3eXVQZ0c1VEpVZlVXQXY0OGh3K2ZwNko2Tk8zY0pv?=
 =?utf-8?Q?LcQeIf1i621SMFKHY4WT21CEaIqFDBAGip2sNPI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4fdc530-8b7f-4c7d-5fc9-08d9778b98af
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 14:26:09.6729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bc+eiDnrt4SflolsmhlG2gSuRH3X7k2/J6wbz4qL97KN2xzvPTGhx4O6Z9V4csm007PqNk42ZsvYn+tUkcAX02tJPs3bsytuqSAa9IW4nYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4916
Received-SPF: pass client-ip=40.107.14.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_NONE=-0.0001,
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

14.09.2021 17:25, Eric Blake wrote:
> On Tue, Sep 14, 2021 at 03:24:50PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Check subcluster bitmap of the l2 entry for different types of
>> clusters:
>>
>>   - for compressed it must be zero
>>   - for allocated check consistency of two parts of the bitmap
>>   - for unallocated all subclusters should be unallocated
>>     (or zero-plain)
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
>> ---
>>   block/qcow2-refcount.c | 28 ++++++++++++++++++++++++++--
>>   1 file changed, 26 insertions(+), 2 deletions(-)
>>
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 

Thanks!

-- 
Best regards,
Vladimir

