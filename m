Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F03D344EB55
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 17:27:12 +0100 (CET)
Received: from localhost ([::1]:50514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlZOQ-0007GA-Hi
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 11:27:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mlZN3-0006IK-2p; Fri, 12 Nov 2021 11:25:45 -0500
Received: from mail-eopbgr80095.outbound.protection.outlook.com
 ([40.107.8.95]:57109 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mlZN1-0000Wz-1r; Fri, 12 Nov 2021 11:25:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXrYAwGhoiXnQ7aUqFJz/WuyBveO//8JOv6gT3Wn7mjzSI3YPR+oZOO05i63B8T2u8C8PMq1hXfCwevSbawc59Kb7fTbKQgO3c89yYOSVP5LjQi6rDSDC//BsTR3E2dj5KmcBywcTrEj2iM1jZmJ8QQuplRMurl7aA12/tM6MGshGFUdQLAcTkvCiD1a/0SOWkIVisnFuyCjivtGaqw8SFpqNsXoCeew0P/URphkU+NlLE2xGZ1QYNos68HURn5hPX42xopk44kmyPmWCPmDv/v7pS0Lhcp3PT6KyERzUJ7N0Xw4h2/NYxKecrPltoRwQDgNFpuO17Aw3gUv33c+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpoHT/fyxBtLzIyMDQl4N3whXLf8Za5K+uq0KFb960M=;
 b=lqpvk2PDFJ8hzJ1f3w/a2AqHsy89Mc1hjpCG9c2NxGUdyeubx5RsnvwEsYrUoOAe/iCq85qSAqvSi4TiQKqwF7JCpSrTTWEZP4e6aobMxaTlYWzGcVIR2sYxJD7JeFqDHajSMIpehMuAj+eoToXlNt7R4uT1XuOIsAUj+XBAu8SL7XwzuSwknt5rUHucMabKX11YKuDJeDnFjYz9TDOXNGi6HYD4s/hDR3zD0WxfVTJdIP3jTVCp/SIL/022mt1vNW9CjC9vxu2h3I/dAnT63HB8rFDc7R0IZEn+n7qwU5lpdQXo0wfX3fD39Hj3AqPjt8vf61a0dlUn6oFkXDsvCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpoHT/fyxBtLzIyMDQl4N3whXLf8Za5K+uq0KFb960M=;
 b=QhV6THaFGSrOYK8SjgxcD1G2rAqC/JLpdE+F2PDaEpGj1OSC8VNHvVl47VzWEoFNXXZZdvP05hpkyXbfNF0t7Rpf/+sWdEInclWLRf42S/w97Hk/xLUKYB/2/h5eUarWzWMwTgWcd9jesmXqchb67wEIfc209OtGw9JgmYltaLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4600.eurprd08.prod.outlook.com (2603:10a6:20b:84::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 12 Nov
 2021 16:25:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4690.018; Fri, 12 Nov 2021
 16:25:38 +0000
Message-ID: <243c7e9a-88e4-ded3-721a-5f040aee36d5@virtuozzo.com>
Date: Fri, 12 Nov 2021 19:25:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 10/10] iotests/030: Unthrottle parallel jobs in reverse
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20211111120829.81329-1-hreitz@redhat.com>
 <20211111120829.81329-11-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211111120829.81329-11-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0072.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::7) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.229) by
 AS9PR04CA0072.eurprd04.prod.outlook.com (2603:10a6:20b:48b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.25 via Frontend Transport; Fri, 12 Nov 2021 16:25:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a59d827-f78d-4b5f-12b1-08d9a5f9102a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4600:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4600036569DAF8346B9DF3DFC1959@AM6PR08MB4600.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5q7LF3xTE98dO6J2+yVqpXVdQh55we4SnRQf5mkSleqAof9ZQEsJWyRUUzzMxjSrtfMZwakmlJBqzim0kjEFRQJpKCyR4oPOYdWI7js6fjXIYe5Cxfos079d16IEv1Taa0HSo1D6pDvq/qOmUOz9tJowuPpbdxdznDosdNwo69gjb14I0u5ICtzQlBga6dXC7ZZDagfp+L3z7RqoojWHYdn/e3uw3LIRe2bSbmfTQEZB6/e/nLdBnA2V4sJjJKJF3NhXzn1Xh0wZxeBND0TPQJ4GG6zvnK4plge9BKe+uFTVGLpWC9DSy7VsOWVETUBMEcWqYy9+14qFI/SY4yqyYmxOi5IQtqhjdovo46n86WcHP3u1sc6DuQX+oxhQlfNIVg+JCQyv3SEZOIxt4vUBTMA1nhgj8wVqoK8mlhZdIrLpvzFlYEmSQCg2oI/jrmEfkKsE9c5S9qJj3H2mU9V8K0Ws160dYV7Hr+C2iQmFW726Ey7FhWg5CQwKGqKy0sQrZSZkY+Sp0xSUxQjaoH6vtzCCTHJhXWR88V3EbPOkptKPB+2BEIBIUZZt5uWkmUxwLahdVyNbAyf00r44kN4z/6uaQKTEN18glefq/7Yg9PRZSt03WLRxqanXUDIZrrn2KkUFGopTrswIEt1DJVMz6A1cyjwvNQuGe7J8iNAIkNNcUmvKeR/CYQTVHdzIdpyTNVTKcbEOe8Z79SbypQ8NhLFjXVOw3pwuag/4ATwLvGu2QiuNNU7Bbg0MN4bzEVlTuQ1oKtz8s+lK3Rj5sZLdlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(5660300002)(16576012)(956004)(508600001)(36756003)(31686004)(316002)(186003)(38350700002)(38100700002)(31696002)(86362001)(66476007)(6486002)(2906002)(66946007)(66556008)(26005)(83380400001)(52116002)(8676002)(4326008)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFRDdXV5OFZ2K0tiTlA3OWpMRGpINURiSTl5NmhKRUo4eEppTXVHbk1XTUxh?=
 =?utf-8?B?Q0gySWxKeFcxUWp6NXZvY3lPMmszaVFmSWhvSnk5NjhyNzZYakhaYjR5WjRq?=
 =?utf-8?B?WHBGOHJocU1WOEhYWE0wUERUK3IvQ1ZhbkcwSjlLUy8vYk1Md2VadnJ5RUNY?=
 =?utf-8?B?bHppYktHbXJtZjlSb3d2NTlMNXg4Nmt3eEVRMWVtN3gxSEpxTi90UUVOTi9N?=
 =?utf-8?B?a1UvN2JDN1FVRUV0QVFiamlkKzliQUpHdlZVSTdLSEgyb2ZIcCttWmVjRnVO?=
 =?utf-8?B?eklRcVR1Y0hKMU5XUDdOLzdKNGk0ZkdoSU9jTTNkTTQ2SEVxWUNXRmxEYjla?=
 =?utf-8?B?d0RkcHlQa1U1T1MzVm4ySnA2dm5vYlZzbUo4blFtUWNVZCsrclNCVFlUU1Fh?=
 =?utf-8?B?aVpraDVIQlBHSzE2RHRLbVk0K3FwWE5rbkdQNjlRWERvRzZpeUliUEJaYldv?=
 =?utf-8?B?cFlxMDhlVXJFeGJFVkZRQ3c2RzREaDRiR3NuYzFpdjdUR25yb01PcDRPdXp0?=
 =?utf-8?B?OTN0SlpxYStIK1dhb24zT3lLZnNZcFVrZUxEWkNQM3gzbzVjYXpQZHJ2NGR1?=
 =?utf-8?B?ekJpaE1vdi8wZFdhMG5lVE5waTE2M0k3VWE4U1dQZVo5VnoyTHAyclpkZmtD?=
 =?utf-8?B?SllwNGtSYWRobitqbmQ1eVI3V1ROUHBRN21MWEhIY254OHdiRTA1bmZTdFNI?=
 =?utf-8?B?bjg2K1YxK1M3aDdQSitqYVdna2hMK0R1SkQwVjFsMGYrNU1rckxDOWZnUkZi?=
 =?utf-8?B?Zklvb0pmNTVkK1dqZ0hqTDF5T01KVkttakFDTmNuVWpWZVJjYUlUZnZhWFF1?=
 =?utf-8?B?T1RSaEt6dENwUm9MWDBrTU5oZlROVFRQcUw1eW5ZQ1BXQ09VQXlDSjYzMlgy?=
 =?utf-8?B?RzVuWlQ1VStKQkYya1NkUnkxd3FyYjRWR3R5T1JxZXEzc3g2NG5UWjhqa2JE?=
 =?utf-8?B?SXhLNXBndmp1MENrOUI2b2ZxK0FUcDVmOVVuUFZrdHl2TzRnaVdNeE13VklH?=
 =?utf-8?B?QW5HajZjUmFZcitPdWNmTmhUOXpyUHAvaHpBdEZTdWp4cTVsdFRMVjRRN3Y1?=
 =?utf-8?B?ZXJ3RldTWEhRMDZ6aFY3aTd4VWFsQnUxbklNMkdUbDQvM3pISm01V3BWdTRN?=
 =?utf-8?B?NXRsN2xHSU1vRk1KOCtaZGpXMW5yWEVIdW1LTGxPNllrUHVybElCWitreWJz?=
 =?utf-8?B?TDBtVEdUL0VxUmhHNUUyQXo1aGFzU1Y1R0FScmJ0WmFHS1did3F2Qk5HMXFV?=
 =?utf-8?B?YnRiTkkzRFd6b1luMGNab0ZSRXlDbC9ndlY5VElIVzFQeHRyNW9VV3dFQjZM?=
 =?utf-8?B?bzVhWUw1N0JZSEpaUU5FRXhtbVNHamdiV2xUS0FEb1RvN2lYUTZxQnRFZzdF?=
 =?utf-8?B?cGxrWmw2T3N6N284VEtIemRMT0F2OEdyRCtzSXd6MHBBZysrbUs3UGZNTmpS?=
 =?utf-8?B?TGszTUplMjIzMUNQSTJKWDlXN1JySFM1YitJNG9OdUNRNWNoMHJmZVFTRzVq?=
 =?utf-8?B?TWdRVzMwVUJDVFFXZW9ySFcwT2VzNE1aM3dPQmlZTWFPL0J6YXNQakIwUGtI?=
 =?utf-8?B?eGpENkNpTTM2eUk5aDBDZFh6N3FTeW9Wa0VpTEdxOXgrZkJVTk5RVDBoVXg0?=
 =?utf-8?B?QnFTdDVCWW0zN25ScXA5Zm0yYVFsUVlwNTJrb2tZWTVpK09zOVJlN05lV1dv?=
 =?utf-8?B?N3lON2NaWUhSS2FSVWVrbHQ1akFNcVRickZNK0NqbkpIeVRRbERJNnZEU2Nj?=
 =?utf-8?B?Z0txR0NNcEVuNW9xTnVWVHY3RDJqSk1wQXArSVNVOWlDeExLa3VyalhYbmJQ?=
 =?utf-8?B?bll3anRDRVZ3ZlJNQ2NyU1J1U2Y0NEFkdjZrMjhaN2JadEl1dmV4bFFpeW1E?=
 =?utf-8?B?MHF3U01ERWJISnVES2ZGa05ydlBaWmNYa0lXdy9XemRhZGk5YzhJM2k2NTI3?=
 =?utf-8?B?VCtBc1hoSGhMS1hzODlVU3F1elNocGFiUnljMDlBTDhjVm14YjBBT3pvS0Nq?=
 =?utf-8?B?U2dVSEw1K25YQXRPMXlqenRsUnFxQWxTMHZNRU1wNEs1Rnp1a1pUUkhMVTUy?=
 =?utf-8?B?c1habHlGYVdPeEFFUkNZWlNOUXpaaUY0STRIZGpWcThQR08zSzZ0RVlKdXl5?=
 =?utf-8?B?OXJ5NWcvQklMRVhaOGFNNFRkZkQvekUwa0Z0c3VkZ0FjUUtqSjBCRUpEM0ZN?=
 =?utf-8?B?bG5ZL01nTWNEVHlWbHdWeFhWRS9vdzIyQWxYb2lNY3R1cVJtTTBpckdqdFFX?=
 =?utf-8?Q?glzwO/lhEgTyPlHdQ7LZris/SdSiC2ll7QiQrKA8Q4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a59d827-f78d-4b5f-12b1-08d9a5f9102a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 16:25:38.6975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9tt9AQJv1TZ2mig3F/D4DCLvI1AdWbs0/3PlVFy/WASxVSy4x0vXX8w26RvC24v/iy8B5PHyDNc2i9n4uIPVb8MVLaBg9eaymjzSk3/a2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4600
Received-SPF: pass client-ip=40.107.8.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

11.11.2021 15:08, Hanna Reitz wrote:
> See the comment for why this is necessary.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   tests/qemu-iotests/030 | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
> index 5fb65b4bef..567bf1da67 100755
> --- a/tests/qemu-iotests/030
> +++ b/tests/qemu-iotests/030
> @@ -251,7 +251,16 @@ class TestParallelOps(iotests.QMPTestCase):
>                                    speed=1024)
>               self.assert_qmp(result, 'return', {})
>   
> -        for job in pending_jobs:
> +        # Do this in reverse: After unthrottling them, some jobs may finish
> +        # before we have unthrottled all of them.  This will drain their
> +        # subgraph, and this will make jobs above them advance (despite those
> +        # jobs on top being throttled).  In the worst case, all jobs below the
> +        # top one are finished before we can unthrottle it, and this makes it
> +        # advance so far that it completes before we can unthrottle it - which
> +        # results in an error.
> +        # Starting from the top (i.e. in reverse) does not have this problem:
> +        # When a job finishes, the ones below it are not advanced.

Hmm, interesting why only jobs above the finished job may advance in the situation..

Looks like something may change and this workaround will stop working.

Isn't it better just handle the error, and don't care if job was just finished?

Something like

if result['return'] != {}:
    # Job was finished during drain caused by finish of already unthrottled job
    self.assert_qmp(result, 'error/class', 'DeviceNotActive')

Next thing in the test case is checking for completion events, so we'll get all events anyway.


> +        for job in reversed(pending_jobs):
>               result = self.vm.qmp('block-job-set-speed', device=job, speed=0)
>               self.assert_qmp(result, 'return', {})
>   
> 


-- 
Best regards,
Vladimir

