Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602BE4A6102
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 17:09:36 +0100 (CET)
Received: from localhost ([::1]:59612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvip-0007B3-GU
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 11:09:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nEuRn-0002sL-IU
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:48:02 -0500
Received: from [2a01:111:f400:fe0e::730] (port=7438
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nEuRL-0003i1-7O
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7aa5ZsdYz7AuPVZr/uUn/9Y3FjSbvqEX71DRUbr0EOpJ7SyVyZ2O6qipWOf36xMb7kWCZ+hdcFF1jO/UKPV6jlWT18Z4xUmxOcpiRfcQWiRNAHzihNPIUW4Bjb3CUCp8GduC7Q8UENivaJvkhAGunyK6ZBUe+yhD3WKWJq3LGUpM+mMu0gVuq7XdEX5j3Ir7zLnYzts9ZTAnkczsJD6QMNIj0naj8twGluWjKv7qz3vfQubco/I1Un4YQTIgr77DVHzug0aJ8KAXonmf1ao9oeXkDstZCDFJ8DxW7YZJJlvQqwQhKkRF/njbQQBYsfTAufvdWiBXKDCp/QDR+86sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XceZ+JZzZYResrzyHkYiykqdu2zZt84KqbKNtYABkAA=;
 b=cqqjvd5zH4yjsplfX9MF2jpZ7mFNnwBKQevNBH/6FEqGvukPSbyVxTZ2ZATaQq4biVDX0HACWUTgCh2rTmxX//RGu/+iymgrPEjLWhyGv8fFt2Sh0BAhgKP6phc/dfozT3aK104Ij2Upx8NBnxOnGnzh6m4jpsGPZ7s46/bu5gUsUYtAvGapWSdeCPARCQkri0XxAIIY4rwCYlaW4IU/E4vBownf91zuJeyYOPOU/t6JzkqiHfpOS53xCEWzdsdw4f8rtGbd471z6MRn6guXLpwAJGfpVBbcxFeaYah3bGWN+7aD80pX9RRRGIbYinVbpeeaE/nbgHqD54eUi9GMHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XceZ+JZzZYResrzyHkYiykqdu2zZt84KqbKNtYABkAA=;
 b=tcL7LMXuJ5Sv5zt7gS7lD2aeivJNqTW7k+IsS1lgtYlDpJABhGwYuzA+ofnD/Y1uemyZIQ6ULyteBB53XmxmJQIsY5lfNQkUCIJfSw7HlL6rYXA1DDEOLl0hK6xTM2SGrLXl+KtbDYl+ndAP2RUpvOqpw9HUdjfaw4X717BipfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB5725.eurprd08.prod.outlook.com (2603:10a6:800:1b0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Tue, 1 Feb
 2022 14:13:37 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 14:13:37 +0000
Message-ID: <f15bd3a7-5e06-ffdc-a7d5-c7671727ccb6@virtuozzo.com>
Date: Tue, 1 Feb 2022 17:13:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Block alignment of qcow2 compress driver
Content-Language: en-US
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Cc: kwolf@redhat.com, andrey.shinkevich@virtuozzo.com, hreitz@redhat.com,
 eblake@redhat.com
References: <20220128110732.GA19514@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220128110732.GA19514@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87d455a2-4ada-4ffd-2656-08d9e58d0a14
X-MS-TrafficTypeDiagnostic: VE1PR08MB5725:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB572549FCE31B37862DDD2CB9C1269@VE1PR08MB5725.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7YnKitcNWxN8yUSfhNQtK20UE3BteAtZXx2AsvoiWwHaRaTV03sg87k7FR2B/uyNoImGSdeJCAuixnDD0vpmynwT9w6QlWd76G86oHZkuQq8AAnsI6hVYlDbWpfNZIMalMVotzUCIbMqY1QZPZ14+OFrv6zJuZTNJVAaNc2TeP1VCBxYhc8oOo6PULapUKYvtlPkb+QQxXqLQYUlckZ2vxjuj04MiQY5R94pu9jqExL/jyOSJkxtRlaRBiLmn8Ywd3sqxqu0INrsx2tzMaGYPn6OYapV24mrn7mPjZskGMwqsb28EhBKSbeDdTgiG9NKRPGB1HFQ5lu5hwe9YIm38oekbBjL/qHtP0YWS7khzc1lvMUMpkceqwO6toE9UGFqDrosHhdrd5MDzYdBZJHaykyCGChMXjTWo1by5q4oCuBUDM0fwxrP4eLDXy/vxH12s5JBkJGCKk30haHNcSsHFVQXa0kaLPjFjiyk4BD6NvTs+hUp4ENE9kKq5oETO3P2GxsiveY56s5Hyf7TpCFO8Ub2PY7TGWGxpCvg5wa9d8rWPJ/dD+Qa5ZF1nQZSgwJyt4AmhSUSQop0TH2uPVfALiULkrw/uUN2gHbzLCxoaFUmTYUDI6hnRKxDMddH+dZ7qkeZAOOwEfl0p2dv+E+KZMthIwTdl6ApNqkhnmHflEOHZtTAxEn8AwPli4tI/uQ3R/OIMUZLT8JrXUlwJ+1KFTIw1XNuIx3b8l5sxUFfmxekmmUTPSa/wncRaMBlRiE8AxMFzH9K/yG6T2FqkxhVa2Euz0wpCdQZqfy/xt0cxiN/c1TUTKz1lIyFR1H9IcvYOIdAnvryJQJlL53J6QOFvctAaX728+KjweJHD5QNavc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(6512007)(52116002)(6506007)(83380400001)(186003)(26005)(2616005)(2906002)(508600001)(38350700002)(38100700002)(31686004)(31696002)(86362001)(316002)(966005)(6486002)(36756003)(4326008)(8676002)(8936002)(66476007)(66556008)(66946007)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1lZREFBeGFwOFV0TzdtK2I1a0NHcEFuUjFVdzRScGwwZEY0SnNEeWRnRUVN?=
 =?utf-8?B?OHN5RXZqUVZvYzRFVzRHaEh2N0grMFFxWmZjMU93bkY1RnpPUEl2QmlNTWF5?=
 =?utf-8?B?eGo4RWprVG1iZlZ0dDBZTzV5Ymh3Qm1ZNUFuR3hzVXFMUDQyODRCdExYMFJG?=
 =?utf-8?B?N0pwV2FzOTM5NHZEWDU3Zm5WTWFHVnAvUHlUcmVCZ3IxaTJuZko4ZFNUVkJy?=
 =?utf-8?B?czhwUXFOTDVyR2VQUXhqRWJMa3FDYTJ1NTJXa0xKQ0tITWs1MFFZTGdTM2tB?=
 =?utf-8?B?QUcvU2tIR05EUUFTTUZKWlZmMTl3K2RobzZFRExLN2hoZHNDUUNjZWs4VDhH?=
 =?utf-8?B?cmhuMldnY2I5YWJkYzZFUFBmQXBxMDEwUUp5dlVlZHE0M1Q1K0lVc0dGUFJ6?=
 =?utf-8?B?YUo4dzMzWlFIdE9xVmQzWC9EOG10Z0dTOVNjVTlVQjRXTlF4QnNLOFVIMWFp?=
 =?utf-8?B?dTA2KysvVlF6RjRqYmFiZ1p5R3N5VFNZbzlaUEplTDR4aUExSnZ4NXRGN2N2?=
 =?utf-8?B?WmdURFc5YlRFL2hUdDlRcTREcEVMaTcwOTUvS1dxTTA0SmZNamNBUGMza2hP?=
 =?utf-8?B?Y2QwVjlGK3ZGb25SdVB5TVNIUVQ1ZDNidEhWa3p1djB3Y0NXNFY4TGhQYmRN?=
 =?utf-8?B?bnhpWldFODN2U3ZVVm5JclFDemYwMFRGVHQ3MW00SVFJYThhQU1zb3IvYUV5?=
 =?utf-8?B?Wm5GdG5MME55LzBodkovbkhnakkzaEhjdFgyWkhaak9CUmJNakFZSlkxSlQy?=
 =?utf-8?B?QUd4MkwrQjl1aHlnaVlud21yNWpsNHJIdTNaV2JObWJSeWlUTnhJQ2E2QWF2?=
 =?utf-8?B?L2NUUkpiWlJKVUlMMElXMzRvQXdKZ240MzNYY3F2UUFOclFrQ2dDQXZ6MTA4?=
 =?utf-8?B?aWFVY3ZoZjhmNnlGeXR0VUxTbUxFb3RmczJ0SUVnZHAyMVlrRktHNmUxaXBR?=
 =?utf-8?B?RXFDN25WRnlBQ3lQdnRXcHVEZVdGT1FhYTRJWmJ1OUZxZVdPWHhQSit0TjVn?=
 =?utf-8?B?a0J3TDI3UXNyOHVhT213aUFOWWlIRk9jUDVnNkR3UloyaTNiTTZRVm5DcTNa?=
 =?utf-8?B?Q1lRVUtRQUxHN2xnWjlhcUhEUWhtbzcvcDEwcWgzN01qUEZlVDMrNW1EMXpr?=
 =?utf-8?B?TGtJdGxUdzVWTTE2U2dqeGx4RE5HVTB3bU8xU3oxdXhCTzYrSzhnWUFvNDMr?=
 =?utf-8?B?NmlQWHJWNkNBQ1A5VjFwZVg0THZybUN1OGRzc01WYlM2TFkvekpONThIcURr?=
 =?utf-8?B?SXcyNFJxYTMzZUpNR0NLcVp5ZG10YkJkTlpVdjRmbXhEeEx6dkpJdUd0V2hL?=
 =?utf-8?B?OUl1ZEhsb1Jtc094TStEM2lkWGpyOVMzaHppTUd4VlNmWExVUnRsQnZmT3FZ?=
 =?utf-8?B?RDcyekJ0V1ZRYVBWelJEWG1sUlR6MUIxWHB3Zk4xeHFSME1aaVExTlBzWXBM?=
 =?utf-8?B?S1dtTFBpN3dJMkhQYmRSTDRUZXpxdE9nL28rTlFvcGFOd0t3bW51bjVpMHNt?=
 =?utf-8?B?TDBNd05DeDBYSVk4Sy85ZURVMzE2TzNxQWlhVXR5dENPNTNqcXYrc25tdHFq?=
 =?utf-8?B?ZkpnRDRsbmVVU29pVFlvdkRpaWE1VjMzOUFVaW9vQjQzeFVYYVQ2VzZqV1d4?=
 =?utf-8?B?QkNSYlkwaFNrV1hCcDhGNk1tUis3RUhsNnZDZkkwSWZMM1V1V0ZTZkF3M0l6?=
 =?utf-8?B?VytTSldvR2JkTzdBd2d6eG9jbkdLaDNXNXRpUkxNUWRYRzdPMTI3aFpLemtJ?=
 =?utf-8?B?bC9LZWRPZlVDY0NBSXlKUC81ZTV5T0JyTnpTWmtCanlCMTF2eUgzQ3ZzWGN3?=
 =?utf-8?B?TjVoWHMzc0xhU2h6ZzFIRitUZnFjVWFWd0t4R2ovcXl0S1FRYzNHTUg3NGE2?=
 =?utf-8?B?NUFRQ2Q5NHNFOFdzaW95ZXBWMXBLdllqUTVyODRmTkc3R21aZlBPd1VvcUNz?=
 =?utf-8?B?cGF0V3U1RU04RU8rcjZad1A5QzNSNElVOXJSNk5CUzNtRjhySjE3bG00TXI0?=
 =?utf-8?B?dWtkaDRoUVFzYWtlYk45VUtLTG8wNG5LcEVzYnRmcWNaR2wwdDJsa0tSV0oz?=
 =?utf-8?B?dktCNUFPYllHL0dLOUplRXFoaDJDOUNEaCswb3plelg3djU5QzlPZ29LWWp2?=
 =?utf-8?B?V3QxcS9BemYvT0RtdWRHemtVUXZRUnYwWDJUQ3hFU0wxUlZlTXdSSjVPR0hL?=
 =?utf-8?B?MjJ5eVRZWDQzbXcrQ0xlV0tOQi9rdUpSeDBoQi9CYndjQXQ2ZjJMakE0R2kw?=
 =?utf-8?B?Tmt2Ukd1NjNlL3RnNGlSajZGNSt3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d455a2-4ada-4ffd-2656-08d9e58d0a14
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 14:13:37.3127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5H2BAgi0JsQNWKr1isDvigC1koSY4Hgmb7duPB/smkuRhPXbXVxogHAlNV/3Qq0YhF/aY2/yOGviokDhRthLC6NnOvN9UyJrVOiIlX4MEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5725
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::730
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::730;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

28.01.2022 14:07, Richard W.M. Jones wrote:
> The commands below set up a sparse RAM disk, with an allocated block
> at offset 32K and another one at offset 1M-32K.  Then it tries to copy
> this to a compressed qcow2 file using qemu-nbd + the qemu compress
> filter:
> 
>    $ qemu-img create -f qcow2 output.qcow2 1M
>    $ qemu-nbd -t --image-opts driver=compress,file.driver=qcow2,file.file.driver=file,file.file.filename=output.qcow2 & sleep 1
>    $ nbdkit -U - \
>             data '@32768 1*32768 @1015808 1*32768' \
>             --run 'nbdcopy $uri nbd://localhost -p'
> 
> The nbdcopy command fails when zeroing the first 32K with:
> 
>    nbd://localhost: nbd_aio_zero: request is unaligned: Invalid argument
> 
> This is a bug in nbdcopy because it ignores the minimum block size
> being correctly declared by the compress filter:
> 
>    $ nbdinfo nbd://localhost
>    protocol: newstyle-fixed without TLS
>    export="":
> 	export-size: 1048576 (1M)
> 	uri: nbd://localhost:10809/
> 	contexts:
>    ...
> 		block_size_minimum: 65536          <----
> 		block_size_preferred: 65536
> 		block_size_maximum: 33554432
> 
> The compress filter sets the minimum block size to the the same as the
> qcow2 cluster size here:
> 
>    https://gitlab.com/qemu-project/qemu/-/blob/cfe63e46be0a1f8a7fd2fd5547222f8344a43279/block/filter-compress.c#L117
> 
> I patched qemu to force this to 4K:
> 
> -    bs->bl.request_alignment = bdi.cluster_size;
> +    //bs->bl.request_alignment = bdi.cluster_size;
> +    bs->bl.request_alignment = 4096;
> 
> and the copy above works, and the output file is compressed!
> 
> So my question is, does the compress filter in qemu really need to
> declare the large minimum block size?  I'm not especially concerned
> about efficiency, I'd prefer it just worked, and changing nbdcopy to
> understand block sizes is painful.
> 
> Is it already adjustable at run time?  (I tried using --image-opts
> like compress.request_alignment=4096 but it seems like the filter
> doesn't support anything I could think of, and I don't know how to
> list the supported options.)
> 


Hi!

I didn't read the whole thread, so in case it was not mentioned:

There is a limitation about compressed writes in qcow2 driver in Qemu: you can't do compressed write to the same cluster twice, the second write will fail. So, when we do some copying (or backup) and write cluster by cluster (or at least cluster-aligend) everything works. If you write partial cluster (with compress filter) it may work due to automatic RMW, but when you than try to write second part of same cluster it will fail.


-- 
Best regards,
Vladimir

