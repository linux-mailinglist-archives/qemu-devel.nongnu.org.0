Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF12834C8F8
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 10:27:34 +0200 (CEST)
Received: from localhost ([::1]:56498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQnFF-0008He-Eu
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 04:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lQnE4-0007UU-3N
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 04:26:20 -0400
Received: from mail-eopbgr130134.outbound.protection.outlook.com
 ([40.107.13.134]:9247 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lQnE0-00056n-FL
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 04:26:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYwbZYveoMums8EVX6VBj+4cEW2pIBZqJ1ZrB7BWqgkLSptVwshQxYSPf7zIxfO5S1D8WKgwPFWDBbQnRMz/bcX6M9jsEWP62F0KCYAduksxmgqpIGrBgO8UfoPoo9canmdEGt+UurdjHXYOBREVqTxOIvwG2cN9Ms9Aq0/34yjLEKkILOXg1+AeQYBUxG7Pall50A+bx5FJk0aOtYs2/SM36lXKfuPNfq/rZZgE7y2DScWF4+rs9rTe2H2d+KIu/NOEvkWoxbdwoeZ0bVQ3vpP9Vdqf5iD1vvZs+1wB6BxXEQ/tdKl8uTCNaxJL2k5PLTUAit1FqOgaLGrOR4+Jnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zbepvAiE/AKe2k/45TFwTjq/bEVLZPYeGja2Fh+Q3E=;
 b=WQhs371IGrhKKfdtsjnYKkRDd4AJxsWHzVle7aYAUO5A+oeJD9M7K+afe1rErjkx/vynAQ4b66btCilRyT+/9i+qUwkXHwlZlUrJtqSV73EMQEy7v4oTSJnp89lFJvkjRFQDCstpWVLH9jZdPstTLMlZDCniB2OI3U2Zj91BdZ+wxV+ts8NPxVOZDXn3whf10S7kskrLOKmyjkvR0zW9tvleeP3vnx6RR/ZmkJLkvKwAlMIhIGMcHzmfvebb5cLKLD30sDfClkL9W/J/eoc6PPqfKb1bSNf3W3xQ/g5yP86cWdC4cm9oj46zhWGALN5nVxFmam2ujqAj9ozLX7qLAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zbepvAiE/AKe2k/45TFwTjq/bEVLZPYeGja2Fh+Q3E=;
 b=hbUNLC6+B/L9reh2qQiyzbSwdR98lIvuUuRaKgvltIH2oTkKHzb5u4AnUQXeO5Ub04Y2gGAvTmQpAFLvUVlayDOwi7Tuz2oV4TPQkj+Bg0rFTdLUg9uqmKSwko+dFdQ5Hl46y1GdDFCzji+qc7AOp131R1vT11SMjSm7J2HMzoI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB3811.eurprd08.prod.outlook.com (2603:10a6:208:107::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Mon, 29 Mar
 2021 08:11:05 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 08:11:05 +0000
Subject: Re: [RFC PATCH 0/9] migration/snap-tool: External snapshot utility
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20210317163222.182609-1-andrey.gruzdev@virtuozzo.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <ab6a3613-4d01-0133-9d57-400d80a488d8@virtuozzo.com>
Date: Mon, 29 Mar 2021 11:11:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
In-Reply-To: <20210317163222.182609-1-andrey.gruzdev@virtuozzo.com>
Content-Type: multipart/alternative;
 boundary="------------B25E66DE7F11BC42FD60FF59"
Content-Language: en-US
X-Originating-IP: [91.76.237.194]
X-ClientProxiedBy: AM0PR10CA0107.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::24) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (91.76.237.194) by
 AM0PR10CA0107.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 08:11:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38930f1d-2ebe-4feb-e9b6-08d8f28a3364
X-MS-TrafficTypeDiagnostic: AM0PR08MB3811:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3811F21EE4113AEB5AB7C44A9F7E9@AM0PR08MB3811.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bfBDaawJDTN5e+pUTsO8KrxjLoMyVQnwqr8tsbeSavtN6RShijQPK/cwtwlm8q1ZMretwtVB3Z/Q4cJla7rZSomYIaHx5vJuk5i/5IaYlw0A11V0qhJmIhyPWvna8EqL8fhYit0PlG6J6GXjfw0tkj4goOPAboTCsw85srQc/dSGyf5NXsbss6+QGWDP9Nq4YPNt47bQp74zVTCnkUK2A23Ut8MiIwC7r/QxaTaaGjOD2gEFaqhQD0bnU+bA1iDUsK21Wu5D5bt9nNEDgh48IR4iYe8N9XG2gf7ZdsfSqvEVd4JnbrZ6arJkEGOIXmLSUv3KjdtIgZ/AYPu8SWAL8cFTNM6wfFMUX2lmpiVbQpA2CM3KWvgyHVZI1DtDShwLSgknJ5YMfZb6DxqA+zFotOP+27EAWddlnQAo/kLWH82cHz7VuODiXc28X22BrlVvMR9o6768bPW12frsTVlyxPLYLQvYUgg0mBz32EMpG90lqZJxYnK457F3U/5Gk9UrknxPXzkLqq8QKu9KKXxL24l4JBgYhU2UzZizxlmWH1lMVVnUDCgne0LRqUNU10d9Kct2OJl3mUzWXmw7stEIIJd48rOIclo6W/47fXHqMqesoj/FRQYXBrKLHmKTqR6vdLS6Q/+f485nHEuZ4mxWUMc3p/l46Efyi/3vul/hiM//JWw8jdRj3k7uhi2Tof+5WbgVP2N33Y3ul/W0E22AU01MXyVe6UU1P/ulZouhgDk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39830400003)(16526019)(478600001)(186003)(66556008)(83380400001)(26005)(86362001)(316002)(31686004)(6916009)(16576012)(31696002)(53546011)(956004)(2616005)(8676002)(8936002)(6486002)(52116002)(36756003)(66946007)(4326008)(5660300002)(33964004)(2906002)(38100700001)(44832011)(54906003)(66476007)(30864003)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d1lQeVlFRHF1eDVCRzROOUd5TzlLYjFneGtoN0sxbm1wakRNd1FtcmFKTEdK?=
 =?utf-8?B?Z2wyUEJGSTRrcHltNWQxTms3eTk5a1ZsMzJ2TG82eVBSYzR4ZU8rcmdENENj?=
 =?utf-8?B?NnA0aFhtS3I1VjVQREFVS1d3QnJHblU1WVFER1NlWUNTV2FrZjJ4emxpd1RI?=
 =?utf-8?B?NzVGVFhVWW8rUUI2S2J1VEY1d28xUGtrOVg2RWdINVIzd1pvK1ZvWnZiUU9s?=
 =?utf-8?B?ZmRwK2Zubkpwd29jbmllNXpYOW9FRUYyeGJnOUZqZ1V1eE42OStjc0JpZUNG?=
 =?utf-8?B?TTdTSU85NXdrcDFpZ2krU1Ira2ZKQjVPR1I1MzVncWYza25RMm1yNFhBK2E5?=
 =?utf-8?B?bGJCR096YVpJQk5WQWF3QTZZRVBWem9aWUV0VHdRdUdGb3c0cnZON0o4L0Zn?=
 =?utf-8?B?ZmoyY2lsVTF4bnJ5aEdnN09vYjNZOENvWHh2b21XSzlHM3l3c0theEZHOTVR?=
 =?utf-8?B?dlJWSDYyUFlKdG9vVlhCU01nanZuYUJHSDQ3YXlUaUpqV1AwZy9lU3JLd3p6?=
 =?utf-8?B?SHJ0a1pZT3R5NkNjbk1ZUEFiZ1Fzenh2MGRQZHdONXVWV2pET01SV1BRem1a?=
 =?utf-8?B?MngwVHZ1d2hnZnVzNWNNU0pZa1RpOU11NFR1VWRpTFVpR1FGY2FTaEhuWUo3?=
 =?utf-8?B?RzJ0VTdPTDJRc1JrR0ZRa1d5ZDhTYTYwdHJ2SVlzeURGVlNRWGpNWm5GS1Ir?=
 =?utf-8?B?WXRWRk1zaElQdVhlZTlnOFpMSmxVd2pWdk5LcS9kczNkbnQ2dFQ5NVAzTW41?=
 =?utf-8?B?M3BKYStZSHNqWmRERUJydStQZVh4eTVHMEtYdVU3Zm1PenJXSWNReE5OcTJO?=
 =?utf-8?B?ZEtiME8zcEIzOWNwYkdRSWFzYkZGRi8xMmd5TjQ1dVoxditJMGJENnp6SWhj?=
 =?utf-8?B?L0VMYVRnZ0RENjhuTG55ZnFPOFh4aiszY0xuVHE4QkhmTW1VbktsemVFcTlT?=
 =?utf-8?B?eXBvU2x1UmlvZ1ErNHNYc21GUmFXKzUrUCtVZDFxWHl3V3F2bkdWZ1Q5cXFi?=
 =?utf-8?B?czBtTnh3djV6MmwybXJuUndLZVc1ME9lYkh0djVrVUNlUm9wNXk2NXc1TS9N?=
 =?utf-8?B?VjE3eHdkZUtJbVFQbmdvS2xiMTZ4eENwV3ZtZENBaW1ZV2pnMzYvS0lNb1VG?=
 =?utf-8?B?YlBDRUJ4R21YTndhUlVQb0tNQVgvTDFCR3NwNnRnN0JsUCtkR3ViT1F6a2dh?=
 =?utf-8?B?ckF3UDFiYnRrSHJwRTVWNWxrcHFvRDloMFhtVXdtNm5VWXdUdDU0RXN6d0pY?=
 =?utf-8?B?R2RkR3V3SGNqZGpIakJ5MkQ1dmN6R0JpV3B4S0JHaE9WVTA5VDNoMmVpekhW?=
 =?utf-8?B?REJaM21jQ2xMS043VjB3cWUzRXNjZ1dkb05YemlXY2I4SU1kdkg2UUV3Vk1J?=
 =?utf-8?B?WFE5eHY1b3lhb0wrSXA5RUlaSWlMcG1xdzlDNDc2YittQW9HYW9HUmExbzlG?=
 =?utf-8?B?TWJ0eDM5NHpNOW93WDFXSXkwNnAwNURYQWl1S1pZOGdRSENOaVRmR2dTQURw?=
 =?utf-8?B?NjFET01kSS92dXFKVWpDZ2pQMUxodTZmZk9aOXJFQnVrVk5rOTkzemh6Qncx?=
 =?utf-8?B?UUFYbVJ4QkRqWUFDcTB2blRrWW9IUFhlSE1wZ2tESVlyQ2puQmRBSXhZZm9B?=
 =?utf-8?B?NHEvcWFtaU5GV0hsU3pFajcyWXc5Nit2amljNGFnRWkzRUFCUFd2dGsvRGwx?=
 =?utf-8?B?M0o4RUhocUlzVnE2RUdHSWxVaXdYRXFJbWhDb2V0bGtTVkRkTnhScjdhdG1K?=
 =?utf-8?Q?vh0cncgefCY0SKBO/cRNMX5M5Ey8xB6QVWr96Uw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38930f1d-2ebe-4feb-e9b6-08d8f28a3364
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 08:11:05.7223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FE3U36ZFbhxePtwDIJ5Dedo6tll9gHos/IV0SeimHCJx28mdjeWo3ZBVa2bxx7djzyO992KzL83/JmRThzAsFNdB0mz2qvbtGqKZulAmnr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3811
Received-SPF: pass client-ip=40.107.13.134;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--------------B25E66DE7F11BC42FD60FF59
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Ping


On 17.03.2021 19:32, Andrey Gruzdev wrote:

> This series is a kind of PoC for asynchronous snapshot reverting. This is
> about external snapshots only and doesn't involve block devices. Thus, it's
> mainly intended to be used with the new 'background-snapshot' migration
> capability and otherwise standard QEMU migration mechanism.
>
> The major ideas behind this first version were:
>    * Make it compatible with 'exec:'-style migration - options can be create
>      some separate tool or integrate into qemu-system.
>    * Support asynchronous revert stage by using unaltered postcopy logic
>      at destination. To do this, we should be capable of saving RAM pages
>      so that any particular page can be directly addressed by it's block ID
>      and page offset. Possible solutions here seem to be:
>        use separate index (and storing it somewhere)
>        create sparse file on host FS and address pages with file offset
>        use QCOW2 (or other) image container with inherent sparsity support
>    * Make snapshot image file dense on the host FS so we don't depend on
>      copy/backup tools and how they deal with sparse files. Off course,
>      there's some performance cost for this choice.
>    * Make the code which is parsing unstructered format of migration stream,
>      at least, not very sophisticated. Also, try to have minimum dependencies
>      on QEMU migration code, both RAM and device.
>    * Try to keep page save latencies small while not degrading migration
>      bandwidth too much.
>
> For this first version I decided not to integrate into main QEMU code but
> create a separate tool. The main reason is that there's not too much migration
> code that is target-specific and can be used in it's unmodified form. Also,
> it's still not very clear how to make 'qemu-system' integration in terms of
> command-line (or monitor/QMP?) interface extension.
>
> For the storage format, QCOW2 as a container and large (1MB) cluster size seem
> to be an optimal choice. Larger cluster is beneficial for performance particularly
> in the case when image preallocation is disabled. Such cluster size does not result
> in too high internal fragmentation level (~10% of space waste in most cases) yet
> allows to reduce significantly the number of expensive cluster allocations.
>
> A bit tricky part is dispatching QEMU migration stream cause it is mostly
> unstructered and depends on configuration parameters like 'send-configuration'
> and 'send-section-footer'. But, for the case with default values in migration
> globals it seems that implemented dispatching code works well and won't have
> compatibility issues in a reasonably long time frame.
>
> I decided to keep RAM save path synchronous, anyhow it's better to use writeback
> cache mode for the live snapshots cause of it's interleaving page address pattern.
> Page coalescing buffer is used to merge contiguous pages to optimize block layer
> writes.
>
> Since for snapshot loading opening image file in cached mode would not do any good,
> it implies that Linux native AIO and O_DIRECT mode is used in a common scenario.
> AIO support in RAM loading path is implemented by using a ring of preallocated
> fixed-sized buffers in such a way that there's always a number of outstanding block
> requests anytime. It also ensures in-order request completion.
>
> How to use:
>
> **Save:**
> * qemu> migrate_set_capability background-snapshot on
> * qemu> migrate "exec:<qemu-bin-path>/qemu-snap -s <virtual-size>
>             --cache=writeback --aio=threads save <image-file.qcow2>"
>
> **Load:**
> * Use 'qemu-system-* -incoming defer'
> * qemu> migrate_incoming "exec:<qemu-bin-path>/qemu-snap
>            --cache=none --aio=native load <image-file.qcow2>"
>
> **Load with postcopy:**
> * Use 'qemu-system-* -incoming defer'
> * qemu> migrate_set_capability postcopy-ram on
> * qemu> migrate_incoming "exec:<qemu-bin-path>/qemu-snap --postcopy=60
>            --cache=none --aio=native load <image-file.qcow2>"
>
> And yes, asynchronous revert works well only with SSD, not with rotational disk..
>
> Some performance stats:
> * SATA SSD drive with ~500/450 MB/s sequantial read/write and ~60K IOPS max.
> * 220 MB/s average save rate (depends on workload)
> * 440 MB/s average load rate in precopy
> * 260 MB/s average load rate in postcopy
>
> Andrey Gruzdev (9):
>    migration/snap-tool: Introduce qemu-snap tool
>    migration/snap-tool: Snapshot image create/open routines for qemu-snap
>      tool
>    migration/snap-tool: Preparations to run code in main loop context
>    migration/snap-tool: Introduce qemu_ftell2() routine to qemu-file.c
>    migration/snap-tool: Block layer AIO support and file utility routines
>    migration/snap-tool: Move RAM_SAVE_FLAG_xxx defines to migration/ram.h
>    migration/snap-tool: Complete implementation of snapshot saving
>    migration/snap-tool: Implementation of snapshot loading in precopy
>    migration/snap-tool: Implementation of snapshot loading in postcopy
>
>   include/qemu-snap.h   |  163 ++++
>   meson.build           |    2 +
>   migration/qemu-file.c |    6 +
>   migration/qemu-file.h |    1 +
>   migration/ram.c       |   16 -
>   migration/ram.h       |   16 +
>   qemu-snap-handlers.c  | 1801 +++++++++++++++++++++++++++++++++++++++++
>   qemu-snap-io.c        |  325 ++++++++
>   qemu-snap.c           |  673 +++++++++++++++
>   9 files changed, 2987 insertions(+), 16 deletions(-)
>   create mode 100644 include/qemu-snap.h
>   create mode 100644 qemu-snap-handlers.c
>   create mode 100644 qemu-snap-io.c
>   create mode 100644 qemu-snap.c
>


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------B25E66DE7F11BC42FD60FF59
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre>Ping</pre>
      <br>
      On 17.03.2021 19:32, Andrey Gruzdev wrote:<br>
    </div>
    <br>
    <blockquote type="cite" cite="mid:20210317163222.182609-1-andrey.gruzdev@virtuozzo.com">
      <pre class="moz-quote-pre" wrap="">This series is a kind of PoC for asynchronous snapshot reverting. This is
about external snapshots only and doesn't involve block devices. Thus, it's
mainly intended to be used with the new 'background-snapshot' migration
capability and otherwise standard QEMU migration mechanism.

The major ideas behind this first version were:
  * Make it compatible with 'exec:'-style migration - options can be create
    some separate tool or integrate into qemu-system.
  * Support asynchronous revert stage by using unaltered postcopy logic
    at destination. To do this, we should be capable of saving RAM pages
    so that any particular page can be directly addressed by it's block ID
    and page offset. Possible solutions here seem to be:
      use separate index (and storing it somewhere)
      create sparse file on host FS and address pages with file offset
      use QCOW2 (or other) image container with inherent sparsity support
  * Make snapshot image file dense on the host FS so we don't depend on
    copy/backup tools and how they deal with sparse files. Off course,
    there's some performance cost for this choice.
  * Make the code which is parsing unstructered format of migration stream,
    at least, not very sophisticated. Also, try to have minimum dependencies
    on QEMU migration code, both RAM and device.
  * Try to keep page save latencies small while not degrading migration
    bandwidth too much.

For this first version I decided not to integrate into main QEMU code but
create a separate tool. The main reason is that there's not too much migration
code that is target-specific and can be used in it's unmodified form. Also,
it's still not very clear how to make 'qemu-system' integration in terms of
command-line (or monitor/QMP?) interface extension.

For the storage format, QCOW2 as a container and large (1MB) cluster size seem
to be an optimal choice. Larger cluster is beneficial for performance particularly
in the case when image preallocation is disabled. Such cluster size does not result
in too high internal fragmentation level (~10% of space waste in most cases) yet
allows to reduce significantly the number of expensive cluster allocations.

A bit tricky part is dispatching QEMU migration stream cause it is mostly
unstructered and depends on configuration parameters like 'send-configuration'
and 'send-section-footer'. But, for the case with default values in migration
globals it seems that implemented dispatching code works well and won't have
compatibility issues in a reasonably long time frame.

I decided to keep RAM save path synchronous, anyhow it's better to use writeback
cache mode for the live snapshots cause of it's interleaving page address pattern.
Page coalescing buffer is used to merge contiguous pages to optimize block layer
writes.

Since for snapshot loading opening image file in cached mode would not do any good,
it implies that Linux native AIO and O_DIRECT mode is used in a common scenario.
AIO support in RAM loading path is implemented by using a ring of preallocated
fixed-sized buffers in such a way that there's always a number of outstanding block
requests anytime. It also ensures in-order request completion.

How to use:

**Save:**
* qemu&gt; migrate_set_capability background-snapshot on
* qemu&gt; migrate &quot;exec:&lt;qemu-bin-path&gt;/qemu-snap -s &lt;virtual-size&gt;
           --cache=writeback --aio=threads save &lt;image-file.qcow2&gt;&quot;

**Load:**
* Use 'qemu-system-* -incoming defer'
* qemu&gt; migrate_incoming &quot;exec:&lt;qemu-bin-path&gt;/qemu-snap
          --cache=none --aio=native load &lt;image-file.qcow2&gt;&quot;

**Load with postcopy:**
* Use 'qemu-system-* -incoming defer'
* qemu&gt; migrate_set_capability postcopy-ram on
* qemu&gt; migrate_incoming &quot;exec:&lt;qemu-bin-path&gt;/qemu-snap --postcopy=60
          --cache=none --aio=native load &lt;image-file.qcow2&gt;&quot;

And yes, asynchronous revert works well only with SSD, not with rotational disk..

Some performance stats:
* SATA SSD drive with ~500/450 MB/s sequantial read/write and ~60K IOPS max.
* 220 MB/s average save rate (depends on workload)
* 440 MB/s average load rate in precopy
* 260 MB/s average load rate in postcopy

Andrey Gruzdev (9):
  migration/snap-tool: Introduce qemu-snap tool
  migration/snap-tool: Snapshot image create/open routines for qemu-snap
    tool
  migration/snap-tool: Preparations to run code in main loop context
  migration/snap-tool: Introduce qemu_ftell2() routine to qemu-file.c
  migration/snap-tool: Block layer AIO support and file utility routines
  migration/snap-tool: Move RAM_SAVE_FLAG_xxx defines to migration/ram.h
  migration/snap-tool: Complete implementation of snapshot saving
  migration/snap-tool: Implementation of snapshot loading in precopy
  migration/snap-tool: Implementation of snapshot loading in postcopy

 include/qemu-snap.h   |  163 ++++
 meson.build           |    2 +
 migration/qemu-file.c |    6 +
 migration/qemu-file.h |    1 +
 migration/ram.c       |   16 -
 migration/ram.h       |   16 +
 qemu-snap-handlers.c  | 1801 +++++++++++++++++++++++++++++++++++++++++
 qemu-snap-io.c        |  325 ++++++++
 qemu-snap.c           |  673 +++++++++++++++
 9 files changed, 2987 insertions(+), 16 deletions(-)
 create mode 100644 include/qemu-snap.h
 create mode 100644 qemu-snap-handlers.c
 create mode 100644 qemu-snap-io.c
 create mode 100644 qemu-snap.c

</pre>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------B25E66DE7F11BC42FD60FF59--

