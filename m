Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738DC40C0C3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 09:47:22 +0200 (CEST)
Received: from localhost ([::1]:57014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQPdZ-0004BM-IV
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 03:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQPcJ-0003LO-77; Wed, 15 Sep 2021 03:46:03 -0400
Received: from mail-am6eur05on2103.outbound.protection.outlook.com
 ([40.107.22.103]:7681 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQPcD-00059i-Ar; Wed, 15 Sep 2021 03:46:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUE6IENbTILHEGVz32l7OYqHHHq6yWxP7fDtMDNooei497Rpe3s9CxAS11O3SamQK0/lTBVRcicdWwldLk/uV2oS7NU42ImrdTk2buDEInC9uCmmoFWJb4hEewV78R0Pp8Dp9mTFnn7jhUfA0LJqPVpgX9om9FgD3JeZRjjCvoHmdHDRUcKVuCn2QHnLu4QWyYw+5NFSqUBhUv8NBecjOxIhaw0nxGUR8KphqVQ37EQl4qS1zFMe+6CjFyewvJzq9fePm+ihaeO4qCvlErYWKJmlsMGULQXnsWDZizFhvkK+cTcMUZzPhtXI3KLsIr2cRfd0DGu84V+Faob2TtdCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=loPOk/goRVPQAfJRotBuLIGNf9MEMHZta6EXB3P4jBQ=;
 b=WuIEX5az32fKVOYIaGKk/wkqbC2dlkLo6ylAU33uO4DsKcMmXg59eE6FO7NxtRlDjKt+tpq41coTVonG2iZAaJrI2Ysg1iJNWOjZ9OdbyUkWuYDf/5BQVaWHjWgBFF59fP6m8L/D6dW5uOGveZ3asv44U7N/ixfqDRFU7ee6zoogTn2iqvRgf+L0C61gzUZLfhR4gnyEoU/AK4aX/6GWTjwou+aqS56gmvVreOdk3bLICyd9G708v2jkq0Nau9f4wE6Got4Y1BQ80f9ZiNHbTw5iVpPBA1a5zErIp+I7RNe076A3hUZjRiTWQzEBhN1qnoNGG/5Q6WbeWBiR5MiaUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loPOk/goRVPQAfJRotBuLIGNf9MEMHZta6EXB3P4jBQ=;
 b=l8nzGnpR6SrdcR9ObQj4slgk/3AnW+fpXmPfuUmDInkC7cOl5lwNmDILF9XEkh7c0sbr8C7bPWLlpWV1N/e55laY/7AH3joeUev64BWpXwyqpK7J06jnPZZawDZg8ixfqvP2nm8Y2TrNgltRd5CtjwZZOhddj4MxM2qt0Wz/s9c=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3894.eurprd08.prod.outlook.com (2603:10a6:20b:90::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Wed, 15 Sep
 2021 07:45:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 07:45:53 +0000
Subject: Re: [PATCH v4 00/12] mirror: Handle errors after READY cancel
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20210907124245.143492-1-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f8d1a624-c83a-d8b6-61b5-002d57500096@virtuozzo.com>
Date: Wed, 15 Sep 2021 10:45:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210907124245.143492-1-hreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Wed, 15 Sep 2021 07:45:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c83e1d0-de64-4210-f48e-08d9781cd81f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3894:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3894F8D0EF1AF9E213AB3C3BC1DB9@AM6PR08MB3894.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /kT36gVuy91vTR/pnF2cfptPz1XfL/qeQbq0IEGFFpqvqWlUmfSiDboyvfErxTJFlehg97kvr/oVhNkI3b2u2wTeHQU2ULfeoHbcn5Vrf8FW3+ct87m3UK/TjUf31yx5wggdnTXf6h96YuaN/c5CDCxcmX/yITOVZbfdoYl/WxwidxB7C1ErJjb3VsKN+Re3rwbd9IlUcXYHlZMDIu3kIVblPQGDrxT6iuWKY+CXkd66IyOqIa808PWwaJV3ti8QVMeQFfvV3WtXZ0bJzOLCfDEhgbu3piFinajLyjNc/jv+U2rAsKRUI1iEFSC1UFiUd9GEEZRgjuJfBVsT+xlgjKbM4mACOpSoTLTyxG/vLzKKwR32Ejut1iZxzBUiKg2ucf+RMYSy+VwQVzrlQpY3niUoJP3kRRkWDu8BtYHF70toNuAAQwr5B0AwZciJvL1xd+MikgnU8g5QfBL7euuhgwx84lGe2pe8SynQx0ZxY42xwX1KpzyERxMaE8TdrQpKmIZxem1UAosQi6zOq70Vg3E2T+EMBMJzVLV9i3WwXta2wTl454Ki7QA3q/NdN4PlBEwBoBE5vXBniW1HIfmpzAecRrCxB5+DvUP580zS3tTRJzzBKmwlHZLFWOCpfH2Z0fpqL6+5/Rb+rMZghKgq8ZXFHRaTLLRTmuC5dNglm5d4+17+wSceTQcTvJiXtot1HdEyofGoKkgoEgHUYgwpAaBrwPatHmu9ujQUUq0JQtEAhBSP+lrYVeaT05uHh0nBmWJnMkCKlnXU1vbe2zASsv+68d6IwRV9TIVDXwkOBSCp/YhcGkH/ftFX+813TjbEg/gwK9YmqxvWu7xmeQ5iu6KTBu8mpcS9pT4F/mJ+kdAKWTWQXazaOrV4KEaoGfeD6YHrE5tYhZyPBlIrPgRebA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39850400004)(396003)(376002)(16576012)(31696002)(26005)(31686004)(4326008)(83380400001)(38350700002)(38100700002)(52116002)(8936002)(54906003)(316002)(5660300002)(2906002)(6486002)(186003)(966005)(478600001)(66946007)(66476007)(66556008)(8676002)(36756003)(2616005)(956004)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnFYcUtVL1lpZU8rRjl1aTJjOVEzOEN3UjlQV1V1RlV2RVd3Q2VyNlgwQVIz?=
 =?utf-8?B?WHNCK1hhTEdtcHJVQ3YwTUgxaUw1YXQ1UnVSWFQ0Qkp4M0NvN1hYQUk4QjM0?=
 =?utf-8?B?YWdVVmNWeVE5azI2dHdhcGlERUR5T1A0T3JmMHhiRXpnM1UzRk1rM1Z0UHRN?=
 =?utf-8?B?Q3l3dTVaU1ZVeStDdURNanhIY0wvY1VwNkthVm9XdTM3ZzV0QUxSRlRGN1o3?=
 =?utf-8?B?S1VRaG56bmY5RG1YQkM1RW4vbjJFVFJSQ01uUk80SlNoUzVuSGZncFVCakZR?=
 =?utf-8?B?bmlZbzdKaCtJajB2RndSL0w0dVBsaktOTW0rVTFaZmswZEFWVGY5dzJrRzVh?=
 =?utf-8?B?c0RwMXRZVEF3aThEd2FNS2h2S0FmNmtjb1F5Q3p1eVFaNi9UTTVZY3M4K3ZD?=
 =?utf-8?B?MDF6MFY3NWpQV2pyTCtlS01ORGlYUTRJYStIUmk5NlZWTFZPYTkyUnRUelpi?=
 =?utf-8?B?MFAxSkJDejJITzQ3djlkZXM1VVhCMlM2djRNQ213MExteDQ4YlA0Wmh6MTBR?=
 =?utf-8?B?UUNhUWFQM25jd0E0L2RQM2FERVVKSTBHZEZDZEZsR0FObFZZaEI3THYyRmFv?=
 =?utf-8?B?a05QQ1NncFk4NnZjejZkS25Bam1QRkU0Nmk4aWVURGpudEhKWjM0WXorZmpH?=
 =?utf-8?B?eHlsWGp6QjhVa1duLzB0RDVQWXl3RXJ2aVFiWWRTd0JiNFprQ2h4SzNRMHhT?=
 =?utf-8?B?TUdmbG8yTjUxbTVCOXVGZHBKc0h1MU5IL0R3QlliUjQ2alB1ZC9qV1RUY3dM?=
 =?utf-8?B?RFl1VjUyOG53TFh1NStJWm1jcUtxN0x6Vm1IdXhmSE1BbkQyVUNlWTJ3bmdx?=
 =?utf-8?B?U2RtUk1PK241YWNiRmlKZzlBb2VpWnBEemY2UmRQYWJhSmw0ZnR1NlVvK2ZF?=
 =?utf-8?B?QmxYRnAvY2VVek9rR0NRaEZDa0dtRktDU2dsQTVLSHllejBhdmJPajZRaVlH?=
 =?utf-8?B?eGNuUVg1STNVTERqOFBYckJnQ2NyaGRrQW9KcTdWaUpyVWJlbVRvd1lyRTN4?=
 =?utf-8?B?Y3JoQUJ2am16UjFOenlGaEszTjc3bi96TjUrR2JYU2FMOVd3aXhZMENublN4?=
 =?utf-8?B?NUpMTUdDRXVhajBqaWV4TVhuTk5sbXZsQUJkenRjQ3FFMU92TUpudjNsekhr?=
 =?utf-8?B?M2VhUnNSZzBZUzJtZzFPazFFVDRUQmRxSUxtWUJraDBBWlB4ZnpOSHZ4b0w4?=
 =?utf-8?B?K1NCeDdHNkU2N0pFQTJYNS9IVXR2R1hlemhjTmtDc1pBSHpMVHZDbmtZeW1J?=
 =?utf-8?B?VWsrMVRkUG1TN3NBc1RVd1o3TE5sTHZyU291N3NUbk9jbGhZUFJwVnU1VFV5?=
 =?utf-8?B?czlRTHhQYTFpSUk2aE1UYnFHc0V0dTE4MzdCcUhmYXFQR3VXcTZHQUs5RWdk?=
 =?utf-8?B?UXJ4bUxOVVlOaDhlMWlibklyVC9xc1ArVVlJNmxWMXZqakN4TlhUQmJBVmlv?=
 =?utf-8?B?NHlmRTFjY1dhbGhwbmRSdnJDOXR0a2IwbExtN2haaEFFNHY3dndKSE5sNXln?=
 =?utf-8?B?UVRwS0lsZnl6UnpMdHRwTTE3OEhSYTZGZTFQUVdISlgwZ0ZNVklibnQ3NzdS?=
 =?utf-8?B?a3JId3ordzJNN3MyUG43NnFYNEUvOXcrbm5vM29uMzV3WHFCWHl5ZVEvWlB4?=
 =?utf-8?B?VzZiS3BmRzBEbHAzbHlCZjR6OEdtZ3BGOVozRmRkZ2JwVTdsVnZNVWNhVzBl?=
 =?utf-8?B?eUMrenpRdHBuejRBQVlWU3ZPY3BlVitVN3dVd2Nwc1RyYW1VQ0ZnMy9KRDBY?=
 =?utf-8?Q?1sTG95T6YeFCGWwFMmJZN6SH9gCgZXPEo7oPuWc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c83e1d0-de64-4210-f48e-08d9781cd81f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 07:45:53.0991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfNVO+GY3Uzh10UIL4VYjkuEdzfL7ZNNiLuB0F+KAlE5Gibxcthzs6DbJoKuTfNDNiRet1Pcc9vFnJ0cLLZeqA1Kr1KOwUU2VmxyWJK7UmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3894
Received-SPF: pass client-ip=40.107.22.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

07.09.2021 15:42, Hanna Reitz wrote:
> Hi,
> 
> v1 cover letter:
> https://lists.nongnu.org/archive/html/qemu-block/2021-07/msg00705.html
> 
> v2 cover letter:
> https://lists.nongnu.org/archive/html/qemu-block/2021-07/msg00747.html
> 
> v3 cover letter:
> https://lists.nongnu.org/archive/html/qemu-block/2021-08/msg00127.html
> 
> 
> Changes in v4:
> - Patch 1: Swap the order of aio_context_acquire() and job_unref() to
>    save ourselves from using a local variable here (i.e. do it the same
>    way as job_txn_apply())
> 
> - Patch 5:
>    - Do not add a @force parameter to job_cancel_sync_all(): All callers
>      want to force-cancel all jobs when they use this function, because
>      what else would you want to do when you want to “cancel all jobs”.
>      So we don’t need a @force parameter here, and can unconditionally
>      invoke job_cancel_sync() with force=true.
> 
>    - Let the replication block driver force-cancel its backup job
>      (because it doesn’t make a difference, but it’s cleaner to
>      force-cancel jobs that don’t support any other cancellation
>      method).
> 
> 
> git-backport-diff against v3:
> 
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream patch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
> 
> 001/12:[0003] [FC] 'job: Context changes in job_completed_txn_abort()'
> 002/12:[----] [--] 'mirror: Keep s->synced on error'
> 003/12:[----] [--] 'mirror: Drop s->synced'
> 004/12:[----] [--] 'job: Force-cancel jobs in a failed transaction'
> 005/12:[0022] [FC] 'job: @force parameter for job_cancel_sync()'
> 006/12:[----] [--] 'jobs: Give Job.force_cancel more meaning'
> 007/12:[----] [--] 'job: Add job_cancel_requested()'
> 008/12:[----] [--] 'mirror: Use job_is_cancelled()'
> 009/12:[----] [--] 'mirror: Check job_is_cancelled() earlier'
> 010/12:[----] [--] 'mirror: Stop active mirroring after force-cancel'
> 011/12:[----] [--] 'mirror: Do not clear .cancelled'
> 012/12:[----] [--] 'iotests: Add mirror-ready-cancel-error test'
> 
> 
> Hanna Reitz (12):
>    job: Context changes in job_completed_txn_abort()
>    mirror: Keep s->synced on error
>    mirror: Drop s->synced
>    job: Force-cancel jobs in a failed transaction
>    job: @force parameter for job_cancel_sync()
>    jobs: Give Job.force_cancel more meaning
>    job: Add job_cancel_requested()
>    mirror: Use job_is_cancelled()
>    mirror: Check job_is_cancelled() earlier
>    mirror: Stop active mirroring after force-cancel
>    mirror: Do not clear .cancelled
>    iotests: Add mirror-ready-cancel-error test


Thanks, applied to my jobs branch.

git clone: https://src.openvz.org/scm/~vsementsov/qemu.git
web: https://src.openvz.org/users/vsementsov/repos/qemu/commits?until=jobs

-- 
Best regards,
Vladimir

