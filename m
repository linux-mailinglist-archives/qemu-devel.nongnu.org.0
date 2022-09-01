Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7FA5A9E02
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 19:32:12 +0200 (CEST)
Received: from localhost ([::1]:44776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTo30-0000jb-NB
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 13:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oTnLA-0005j9-3V; Thu, 01 Sep 2022 12:47:00 -0400
Received: from mail-eopbgr20123.outbound.protection.outlook.com
 ([40.107.2.123]:8216 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oTnL3-0004ti-Sz; Thu, 01 Sep 2022 12:46:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Onn9+qeXyMb7+XREm+Hy4oTdjD3AgbD6QABYOL4xNTvCIa7x/oT32iH0bR2SPeqMg3FIJFQZgsUFNHWL83NKstnm1Kx6cKm5+zVPCZevrjNoEHfD6WoiCfMKEUnpLYC3/ie85BZCjdI7msiospS1wQab92pECmxv9BvzJbDt1Oa8B65Cbyhck+Gy/7syTeGjlCuF2WnuhfqISra5ADUmdc+0mam+abNWeNa0HlVAnCiuN/mbUQNzeKzIMX3nkC7WZFZhpmnKsZtN767AM7GH9C/+mN5qg6FwUpG548U+s8EgJ1GvgLY/B/zGShyRw00fjmzbjve5RnDRtojWLtebiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVdcjfNdbRAXBph/wuR6ec4n7HIN2V6b/YXlD+MNg8k=;
 b=BkGwKGDCsaaAiJqhAz2qGEhVG23zAt6H+JEPaXvLxYh0wRjYsm4G9UO6PPtOQPMixyaiLMEjxQZdccNVzSnUqZQn7fhABVH+MhmKgy1P7x7JufD8FM9Is2FCce4cfhXfc5w2PKGrG3xJnHG3ugHTL/S+51rIkievSGaZicTbiL2SIuyynj18qgxOiXa2AMyDpIijc51rD9O7pGp96luBCc0E2T489n+na+Ke14RDkzvtoxDmRqrEwsnoKiwzzT7vcgAzaZ2qT8JQDa+Jj5bHgS9QhulgDPQvygfxYfzfH9e4Y1jJLyI6V4yNURHmFvMJZnkgK21n3V2dBcF1CozslQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVdcjfNdbRAXBph/wuR6ec4n7HIN2V6b/YXlD+MNg8k=;
 b=ScO4hNoRfa4zE7X2+QL2lpPbe3KbwOxBUQ0LFaTfw7TE8GO/LPLu3UaaeiqaBn88ahdacncH8CRXYFX+XR0DDZ5nnUJy1Ph+M8TweqmUWviEc2cugsFk7Cy1AZk/8eQ0FMshxJlRiPcyO9qrVSkCngeMakqX1prGGhD1A2xT58XKuU+2R6D8QwjT0aOxyDKz8MeNRkG6ucmpIvKA8ovpaTOnncLYhHRW5bK5ACqexo9Cwh5NkHvNK1RJBZ1s/6V5RAWVKVBxVx1CMiqp8tFN3e1M0XdeiYBgnOkczSPfYXqNoTe3QkGxIB9GHMG3dzr3tU27vTLY8WjcVyjOSYVYJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM0PR08MB5474.eurprd08.prod.outlook.com (2603:10a6:208:187::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 16:46:40 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6%4]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 16:46:40 +0000
Message-ID: <0b56f015-57c8-31ad-5a31-0dcde6dfa0a4@virtuozzo.com>
Date: Thu, 1 Sep 2022 18:46:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 00/10] parallels: Refactor the code of images checks
 and fix a bug
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0188.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::45) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a017d6f7-63de-4d53-68bc-08da8c398aed
X-MS-TrafficTypeDiagnostic: AM0PR08MB5474:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bWAusPUCC3ChakBga2Bq72T00nykfrxHHmVdMisR6A3kCtwVLgPoOd/D9rOctj4GXjk7vNeVQGyg2CIHkm9VI/+q8KfroHyQOkAF1I3uq3HEiRCk5dC55Pm3JXOz3b0GWr/zjJZMuv4lDq/PSVcnnMpGK0qlBnjt1M8ax0rmn9eR7BNA+uzrs90MQum5Kc2Qv2T3u8b5HuIrNvzhkC2mo5QpWgaB6eQSu3Vm+XKaQUEyk1pYSC3TcHE7DKqV4AI88BHY2YD9NbFfc/2+YjykfsQ0q7k+PFqRdhM8jysWAWIYkQE/VSimwH63t/izCLpTQytncGr2ildPgM2WNQCKIOOxMLZ842QGTe2Qnt59pqsKrHfi4eWovB2dyjEGNuj9nT5VgxSAXFt0vO8NU5KVOCb4bod1KV6sAhkpI+oba8xGf8qAvp3VJczqQyt8YIplVS6ZSoNa3PNs4Fpb38YMaqayoJi6BrnFG35MWh05mLnNqy5Y7nDAda+5C+9XKcHOfAaoQ5nVEq3bBWKuT3gN8C79A+5OEOL4EdnKcrAn+lummiNec5qRNXPxvx1lbOwqENlRrwG0wvdHVFS4R2bFiy5XjjtFzZHY5m1qmPq3bgyHIul6Q8CczPC16n3m/NaFEX4zJYNRETYxfl0APpmFBc7ylyDypZg3YHxk1aL/qu9gX/P2f3blvBYvh7pRpv+cOtmWXlSoXXN8/lEIrAYJBmSVS1yIMODpsBpj4xGdJeceBDRBNkE+pwHHVUvGBDEfBuQ0tXtInegpKZHSQXK/vACfukZ8CrH7nq1SxU3g9BzMT7REU1V35SWb4xmeVNjW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(39850400004)(376002)(346002)(136003)(186003)(2616005)(316002)(66946007)(66476007)(8676002)(66556008)(4326008)(6506007)(26005)(53546011)(31686004)(52116002)(36756003)(6512007)(2906002)(41300700001)(83380400001)(86362001)(31696002)(38350700002)(38100700002)(6486002)(478600001)(5660300002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXZ5OEpvKzNyamQxRm5OZmdzQk1acHFOOE1DMzVza1haWVFRU2pmcDc0dFVK?=
 =?utf-8?B?RVJwa1ZlZCs4NUlWSE4za243eCthT0s3NFliZlNreGF6M3BjeFoyNVVHeG5z?=
 =?utf-8?B?UmxkaUpYUHhMSHR5NUw3S2dmOXUwOUNlMTB5MDRwQUNIcU1BbkxBR3hKWVpI?=
 =?utf-8?B?Rnh5WE5LNndic0VUTXVJWTNCUjRxM29vTE1hekhjZXROT1JxVlRhMktNWEh3?=
 =?utf-8?B?TmUrZVdWbWZvWlE2Zm9vUHNwbnNMemU3ZUxGRzRySTJDdXFjdkc2K1gvemRF?=
 =?utf-8?B?NHIrVXhKSll1ZDd3NnI0MXN5ZExsYjFxa2lObWs2V3l0cEFRVzdoNThaT2do?=
 =?utf-8?B?bXBLVEY3blowTVRxbCt0dllKL2pmOW5Ka2h3aFdqZnVXdWdVajVFTFZuSTBY?=
 =?utf-8?B?ejFCQS9VdjhJUndpdUQyQnV3ZDZDNDk5bGtIM1BQT1dkcnVDOXZYaVNvR0gz?=
 =?utf-8?B?WVVRd2JHWHpMT3c5Z1ZCa1pPWWJPTFhYcEJXNjFualVzcmQwZmtjZ1NQZGtH?=
 =?utf-8?B?ZURoNXpwU1E2TkE1WXFqcWJqZUFGbFZTWDRWdVBQeHNxc09pQk5vemUwazk5?=
 =?utf-8?B?OGV1WlA4bHp0VVlnN01sMC9qV0s4OXhLM2t0QXlFa05ZRGgvaVlQeEU1WUdY?=
 =?utf-8?B?Y1k3WWU5N1ZPVUJpQ09nbGpVUVFmYkdoc0E5Y21WRlMzeG5hQUE1M0tSRjdl?=
 =?utf-8?B?L3AycCtCRGM5VlFRL0h3cHEzQTJFQlRuajJ2TTVXdlBYTUswdExNSHgyWXlM?=
 =?utf-8?B?NTVIUmZsKzJQK2ZQd1hhN3N6UmhBemYxaXZINXRtaDYrTWQ3SkFFNFl4aUE2?=
 =?utf-8?B?ei90aE5XMm9iWlVadTF6ZmFkc2VlNVlJWnpsMW1ENTVjRW42M01kZitDTytk?=
 =?utf-8?B?Tzd4azJwMk1iRlU2Z1R1YWVxKyt1eDVWY0VkTzNWaFNjdnZpR0VpV0YyOXV1?=
 =?utf-8?B?dFAwUWJJN3dkSnc2QTdoS3VaaC9QUjllLy9OdnBzWDJobkNNMXNLNXdLS1gv?=
 =?utf-8?B?QXM1OUtHZXhWc3JsK0R6eVdoZ3c0QXZzWDVocjBiRDZnK3pSZDZ3M3F4Z2hX?=
 =?utf-8?B?UUptQmRyUlZHVk1OeUNISmhaZDQydlZ4U2o2SjFmT1JjTVBadjBFQUlUZURr?=
 =?utf-8?B?aDZicWJ5bEJmVmllcTVwYXJjZzRiMWRjdkh2eTVSMGEyc0FDU1dQMUVXWCtq?=
 =?utf-8?B?N0dHNTJOSTJLaEM1REI0L2UrUjV5Y2FlVnFUOTg0UWo2WTJ2dzc4VXRvYzlN?=
 =?utf-8?B?M0w1eUpQbFZhQXNGSEJHNUMrZ2lpSVJpRXo0SnExTkVMQ2ZlRWFZUUpxdTM0?=
 =?utf-8?B?OFZNVGZ5QUdqeGtEamhXMjhkZnYzZ3Y5bUEySk9ScGdJdlJtN28xNitsNHl4?=
 =?utf-8?B?cmZuTUdoNzYxMXgvVVlQR1lDb3pyOFhNUUwvcUVZcXBSbUVTaGNFVUFlcnp5?=
 =?utf-8?B?eTNoZHkrb3pkRGdyYm5BTEFoTkUyU1pvTU80V3BwNWtFaTRheVp4TUFpWEpW?=
 =?utf-8?B?U3UyQjRaOHNRd2NRTWRNUjFxVzJpbW5SSlNpaFRoamRpVGdSeVBOaHZjZFFs?=
 =?utf-8?B?Q0xhM2hZcWh1dnlKWTQ5MWJ4elhab1daOStmcStIdzVEQjV3OFh1cXN5aEpO?=
 =?utf-8?B?UHI5c3p5UGlZVy9BclY4Nm5TeHlqbzMvNmhZSnhrTDdyck5XYm5KQ2ViK1Vu?=
 =?utf-8?B?VUdHUU1jMnRXakNKQlh5M3BHN01PYnRGZ0xzZEJRZ2ZKN2gvdXBvUFRKSlNN?=
 =?utf-8?B?WjYyRWpQcm10UjBGbExmRGZsUG5TTlAvenFFbnI5dm1EZlFGT0xncDQ1VzRr?=
 =?utf-8?B?VzdzV0JQNERuTmhwVGRXcTQ2a2trYm1BcjVDQm9qWVF5eFhzWjNraTFLVjhk?=
 =?utf-8?B?aHo0bDFqdU1JRnZRb1d1blBRaE1kL3Qrbnp2S3BwbXJBL1ltL1lTZE9kZ0d1?=
 =?utf-8?B?OU10Qi9VSjlLb0ZQYVlCSTlRVDNML29UU2Ira3piSkp2SW9tYmFHRnlmNzBu?=
 =?utf-8?B?ZmFHN1h2TXJaODlSNndReUpBbFVCSnRiNk95Ym04b3F3ek5rcE5mNUF3VUhi?=
 =?utf-8?B?MGN0S2pqS0tWVHdIVEdHTU9WcWt2cW81Z1NqTHZzSG5rdjhLQWtTeHk3SjBm?=
 =?utf-8?Q?pFSfpG2I2LtFHt/qb8jYg5V6V?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a017d6f7-63de-4d53-68bc-08da8c398aed
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 16:46:39.9435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: liKCpIoaSd1fcUL7sXnhzS329sSetpPBzDgHmCLIomCKdSezJlMwfeNkY/Vdm8oDxMSn7+T6LNxhGzLpTaB5eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5474
Received-SPF: pass client-ip=40.107.2.123; envelope-from=den@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 29.08.2022 12:12, Alexander Ivanov wrote:
> Fix image inflation when offset in BAT is out of image.
>
> Replace whole BAT syncing by flushing only dirty blocks.
>
> Move all the checks outside the main check function in
> separate functions
>
> Use WITH_QEMU_LOCK_GUARD for simplier code.
>
> v7:
> 1,2: Fix string lengths in the commit messages.
> 3: Fix a typo in the commit message.
>
> v6:
> 1: Move the error check inside the loop. Move file size getting
>     to the function beginning. Skip out-of-image offsets.
> 2: A new patch - don't let high_off be more than the end of the last cluster.
> 3: Set data_end without any condition.
> 7: Move data_end setting to parallels_check_outside_image().
> 8: Remove s->data_end setting from parallels_check_leak().
>     Fix 'i' type.
>
> v5:
> 2: Change the way of data_end fixing.
> 6,7: Move data_end check to parallels_check_leak().
>
> v4:
> 1: Move s->data_end fix to parallels_co_check(). Split the check
>     in parallels_open() and the fix in parallels_co_check() to two patches.
> 2: A new patch - a part of the patch 1.
>     Add a fix for data_end to parallels_co_check().
> 3: Move offset convertation to parallels_set_bat_entry().
> 4: Fix 'ret' rewriting by bdrv_co_flush() results.
> 7: Keep 'i' as uint32_t.
>
> v3:
>
> 1-8: Fix commit message.
>
> v2:
>
> 2: A new patch - a part of the splitted patch 2.
> 3: Patch order was changed so the replacement is done in parallels_co_check.
>     Now we use a helper to set BAT entry and mark the block dirty.
> 4: Revert the condition with s->header_unclean.
> 5: Move unrelated helper parallels_set_bat_entry creation to a separate patch.
> 7: Move fragmentation counting code to this function too.
> 8: Fix an incorrect usage of WITH_QEMU_LOCK_GUARD.
>
>
> Alexander Ivanov (10):
>    parallels: Out of image offset in BAT leads to image inflation
>    parallels: Fix high_off calculation in parallels_co_check()
>    parallels: Fix data_end after out-of-image check
>    parallels: create parallels_set_bat_entry_helper() to assign BAT value
>    parallels: Use generic infrastructure for BAT writing in
>      parallels_co_check()
>    parallels: Move check of unclean image to a separate function
>    parallels: Move check of cluster outside image to a separate function
>    parallels: Move check of leaks to a separate function
>    parallels: Move statistic collection to a separate function
>    parallels: Replace qemu_co_mutex_lock by WITH_QEMU_LOCK_GUARD
>
>   block/parallels.c | 193 +++++++++++++++++++++++++++++++++-------------
>   1 file changed, 138 insertions(+), 55 deletions(-)
>
queued, thanks

