Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07E949F614
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 10:14:09 +0100 (CET)
Received: from localhost ([::1]:59166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDNKa-0003AJ-VV
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 04:14:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktkhai@virtuozzo.com>)
 id 1nDN8l-0000Dj-AI; Fri, 28 Jan 2022 04:02:02 -0500
Received: from mail-vi1eur05on2119.outbound.protection.outlook.com
 ([40.107.21.119]:26561 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktkhai@virtuozzo.com>)
 id 1nDN8h-0003LW-JO; Fri, 28 Jan 2022 04:01:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpzomnSvGTHeORoH4iPDvnMQo0Axg/XZm9ljP8FbHvHhGx7vWQuancmOZurl30rav9fQBpPZcRtLRztA7PvtNE2bc4LXpLR8ABN4SJoKh12e/oCvzwqtwCe6mg1j3FY1099eYWwRfUFlSaW5vEiwtJEqShH+hEyORj+QquZsK16iABT0BHmdJTSBa3im1ZvPQsptB7iT+7k+35P4GnmXJjXk9YdRtvEQoTqqOA/2y6AkLE/ACGy9PqJUB3VwShBeV1iQMwMk8CT6UFqcVp5y3ogJywPFfrNixznfGAO+cxcWDtx0rE0lWL7xv2ksU9LbFOfTIFsEBpailTgiMXlbDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3bMTb2l10fQlxJemZB3kJq/swnG3oeYntOXOV+rH6c=;
 b=I+5d7hYoFGgiaARVUBpfqkk/5YmYGh6xc9URaZcLpoO5Pmhtku5NDzaF2MY4wc7Rb8QJgljcHBntyH8BVIDP6ysWael5UkUKtNkwFCCzSlOeV3Ys58grMjXTJIURpNGqMGQvo0BJntlmkHlMgURjfwnt2Y+UC9WrIUGxTBAk6fG/oAYM1uDy1rsY0OYqrhNS+PBfvKJoXFhAWQMzkdt7XfFfQYQBnOFJrYAm0CW2zTdxn4khqTCre1jJx75POEa4gOreQ4vsvlofPu516+Dlcl8uE33x8fP4mW4/6cL/F5Dm2Gr5e0/NdCoaO2FBWY0LfKkZiDyIr3soEJSruVaUDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3bMTb2l10fQlxJemZB3kJq/swnG3oeYntOXOV+rH6c=;
 b=fWlw5CcHuzmWCK/xv04cIw4VQhGWm2LtO5J9l0rg02c8hvBfKTw/MPEKn0nTKJmlOBz83q/+IZ3PPnoDALwZjJORTmAJIEvlIrSiweNiSaMeDyBiqra+1FfkI18PctWDh05tbFpev7n2rYJtv+GwVRAdG53uBTyJF16grDh4P7o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB6PR0802MB2374.eurprd08.prod.outlook.com (2603:10a6:4:8a::21)
 by VI1PR08MB4381.eurprd08.prod.outlook.com (2603:10a6:803:f8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 28 Jan
 2022 08:27:12 +0000
Received: from DB6PR0802MB2374.eurprd08.prod.outlook.com
 ([fe80::fc34:de47:7888:2b4c]) by DB6PR0802MB2374.eurprd08.prod.outlook.com
 ([fe80::fc34:de47:7888:2b4c%10]) with mapi id 15.20.4909.019; Fri, 28 Jan
 2022 08:27:12 +0000
Message-ID: <1f9438f5-5201-dacd-79b0-f2b33423585c@virtuozzo.com>
Date: Fri, 28 Jan 2022 11:27:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 1/2] qcow2: add keep-dirty open option
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, den@openvz.org, igor@virtuozzo.com
References: <20220127170019.3292051-1-vsementsov@virtuozzo.com>
 <20220127170019.3292051-2-vsementsov@virtuozzo.com>
From: Kirill Tkhai <ktkhai@virtuozzo.com>
In-Reply-To: <20220127170019.3292051-2-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To DB6PR0802MB2374.eurprd08.prod.outlook.com
 (2603:10a6:4:8a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e558de0-99e7-48e7-6f11-08d9e237fb9a
X-MS-TrafficTypeDiagnostic: VI1PR08MB4381:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB438191EE4B61C3007A5DD1BFCD229@VI1PR08MB4381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:121;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lYms3+hg97j+q1Qs2RTn0lR6DeXW2R/8ATO+JvwnzjemNmkQnisfw+nYpGjj11IwsETCKfij8YXG4G7UapEDEw2qf3AXg8OOZCs64JF2KAulm9OYv/0Vw5DVeb+2GHcG+9EfdHkwiFWITEDWc0cQgf90P9c4MASqcoMtxXsQRTkZL/fCAOWb70iQvMrKGNGOTV+f4nKL0wIyavfEOmxCb3vzx+31C6JBj5PXIm/Vbpwq32mCz/phGehQeP71NMXz4dtqTtFep5lyrXJmIgHcB/QxgBMbRSlcIpzbQ3wbG/vyrCdK/VBvhFX7J09Jc6ogNjEfm7cAH/C8j4cbWPiuKvdy6QlLFFrXDy4My49xv0O5kK4gU+LKpmeVw0w/Ls8FgoIWBubivjmLtqlEpX2IsMVnCXoi8rQDeFEcyRsmfC/vmgATNqlsUYpQk6DckaHDLgalW7LZ2bQYAmj01n6XmTz9WaG8IHaYBfCEkpYGS6pGNVGbr40qI0NBczfIMrOWmbD7Lv5twkQaJ/fDY38FXr18BecIdJjWyhUZT9uqkFo7oLSj6cuHSsXyxsmWyDuo+kgn84MQdLfTAROVhQPc9MTeaOs+muXZDNlvmNHsxA4Mdkj886rAHADMOp7xEUjwmJ8oBMle9EYv/jDNvksaDMchz9O+vsRR+6yIvbbdkZJLSPOpGC87JbptLW5cUYt09x2M7TX/hDai1/AgxO5NoIn4UJ6YBcf6nmEUTXRWa8qknrp5o4elUalP9jDkO5d1cSWSo49d/8XABDYf+e25RGl9jqk4O/caqVNQ78Zm1lA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0802MB2374.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(2616005)(19627235002)(508600001)(83380400001)(8936002)(2906002)(316002)(6512007)(66476007)(4326008)(36756003)(52116002)(8676002)(38100700002)(38350700002)(5660300002)(6486002)(66946007)(26005)(31696002)(6666004)(53546011)(186003)(6506007)(31686004)(66556008)(107886003)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmRZR1g2QnR5UHdHaWFUUDZuTE5KTzhtQ2hmNzJabHBMMlF1ai8xY01ieSs4?=
 =?utf-8?B?NFMrVCswcFZ5SkZSbnJsUGhCNS8wdUlzSVFQK1dZSUhFeS9RME0wSkVSR1BB?=
 =?utf-8?B?UHpyMm9xS0IyK1FadVpGNFlLczJMVXBteEJaRnByTGNtTkR5TlFiWGhyL3Fl?=
 =?utf-8?B?Nk83RWlKUS9LdjV1bnZBQ05kRThaK0hDenpxQStkQ1V5bFdxbHk2VFV3OGs1?=
 =?utf-8?B?aUx2VXZLQXd6eWc0SXR6eTFKcVRHRlEwbFVHTDFRMEhqUFNJaDJGOXQ5OU5z?=
 =?utf-8?B?WlM4R01IQ0hnOWlOUWdNSWhIcnFwRm5jQk8zNngvUnJzSy9LT3dIbExFRHpu?=
 =?utf-8?B?WVNueE5rVlNSMFphWGFpMUdrS2pQQkRqRFd4bHZKUXZmYk5WVmRQOHRhWVlS?=
 =?utf-8?B?bHozbmM1VGcvNm9LejdPODhWTlhhSDRTV1crVE50eHVYbmY3Uk1hdURlZThi?=
 =?utf-8?B?U3ZIVUlTd0hTRDk2M3BaV0ZoUE5xelVUdEVUODRva2ZObWpRWFlpTGdLZElh?=
 =?utf-8?B?VU12YXJjY1BNTlhQUXNDRFd1Wi91S3pqaEJWc1l1azZ4cnZrZlRGNFpNQXBO?=
 =?utf-8?B?cE9tejFleTdScnkrRTludlczbkJlb0tvZzYzd0t3aUhnQW9LTVo3UE8rVWs0?=
 =?utf-8?B?eitSZjdiMVE0MVdJZldpU0pKNndFdEVzZW9OWWdRam9ZNlVZcGxBd1Zxb1hR?=
 =?utf-8?B?N3NXZE9lcTF5V1hQZE9GTk1QWWpRak84UzVtUW9UNGNxeTV0c2xPZkNXZGh2?=
 =?utf-8?B?TjNtQ0poeHR4TlNwcVZVcHdXU1B6TTAyMmtsRFhhNHRlcmFNbzZMWDBBSUFN?=
 =?utf-8?B?b0p5QXpPdFBjR3NIbFJVYzR2Z2sydnVWMlAyZGNiYmplQXNzeVlkMzBHSmJ6?=
 =?utf-8?B?UWFPaVJOVjNEUHd2dFQrL0ZUdDRSekdLTmwvUm5nR0lQUDc5SEZ5Wld4dVFW?=
 =?utf-8?B?S3ZPdDZRUFBnT0pHbExkTGJ0cnVscWpTSnhESk5MUlEwM3YxYjlVWGpqYkRD?=
 =?utf-8?B?Mm9UbmR3VUUzMWNYU2tCaCtOM3R0N25Fd2VBTkluSGZxY041Y3Rtc3lhRTBP?=
 =?utf-8?B?VnI5STZrelc3ZS9lMWtBMGhtd05jdWgyR2FoaldxVzIwSGFOeHNMRitWcEVy?=
 =?utf-8?B?dHFlSDhIMHM0Z3RaQWpMYkh4bDRNNVpIdjZtYkZuSTVHTWpVbkYvMndFNzl1?=
 =?utf-8?B?bWlsc2VxbG94WUdYNEx5Z0tnZm9PK0pmbktGVUtwOVVyTDV6MWo3QnJnS1pp?=
 =?utf-8?B?SE1DZW8vbTc2OEdac2VNNW03anZUNHFscWVKTlQ1SU9uV3JFd3pvTVpEeS9D?=
 =?utf-8?B?bGdON0I3NUI2UmpBU2NJaHNCZUlVMGRBVmc5U1VPbUlobm1nd3NGQzlYOWJx?=
 =?utf-8?B?NHdiY2JhYTZ2Rm8wVHhhS1kvN2drUm9oWHZhcThmRWFTMlJaSmsvNnRPNm9t?=
 =?utf-8?B?ZVVRdC81UWpUUzZoYUYzRHJQQTZzRzNaQ0YrSU1hRlBoekJ4QUNWUFV0d1R4?=
 =?utf-8?B?VVNYcGdlN3Y3Q2VCZTlyV1l1VkZUV1ZzSkdrNUtiVjZJYVRTWUZ5cFBwN0FV?=
 =?utf-8?B?dDFJbHhTUUpoaEE3czRCc0U4SXdwRlF3ellBSEd4UTdONVVNK0JSUGloZmNX?=
 =?utf-8?B?WGFYYTBuaGtpWEhBRXFvUDRkZDlENGxIREw2Ym1XWHBRY1p0dVNQQXBpdUZ6?=
 =?utf-8?B?UVpkNmRxWkxyWXF0VjB2UzFUb0FqTmlEeDJvZjVSa3Rta2wxblFkcXZJVUxw?=
 =?utf-8?B?eTJUc2lVR2hpRzdDYlhyaXlWUTVaaWxPQnBUVC9laWpkRW9MdWxOVnZhNWxJ?=
 =?utf-8?B?bXZKa0ZqT1prUmJrc0F3aC9mMDV4VTJCcHNETkZWZVRmN1hhME1CV0dXaER3?=
 =?utf-8?B?NU1zbWNDb2hNU2hvc3lqelJnSmo5S0Z0M2FrQjZzbjA0VzlWc25CMjBYdTRr?=
 =?utf-8?B?dWhKNm5La3JGT0w0bVYzTitOMU5LeGFSUHpwdmZxRktpdVZtMzU2Y2tCdDZy?=
 =?utf-8?B?WnhzclJOcm5iQk9VQlNNRTFwVU1QdFFYOTMzc0Y4M2dhZ0E5SERCU1VnS3Rw?=
 =?utf-8?B?dG1oY1N2UUswVklxWDZyVWdKQVQ4SVlxZWd4c0pXSmUvUGp5dkxIVjREWlJB?=
 =?utf-8?B?K1NiVjdUL1crMUsrMGJNSk9tNDdpUktXeHAxNnVkUWVLbXNZYnJnRS8rVjMy?=
 =?utf-8?Q?BHpw6rRYsoHEavxOUDB5/ls=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e558de0-99e7-48e7-6f11-08d9e237fb9a
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0802MB2374.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 08:27:12.5510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJNelPC9SQJsQIoM9sv6JVociPTomGu2ogwnCu4ccDkDvIYonGFWYYp+jyzUrKO4TGNdPVeK8BISwKFkGEYxnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4381
Received-SPF: pass client-ip=40.107.21.119; envelope-from=ktkhai@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

On 27.01.2022 20:00, Vladimir Sementsov-Ogievskiy wrote:
> Consider the case:
> 
> Thirdparty component works with qcow2 image, and dirty bit is set.
> 
> Thirdparty component want to start qemu-img to do some manipulation.
> Ofcourse, third party component flushes refcounts and other metadata
> before starting QEMU.
> 
> But the component don't want to clear dirty bit, as this breaks
> transactionability of the operation: we'll have to set it again but it
> may fail. Clearing the dirty bit is unrecoverable action and can't be
> transactional. That's a problem.
> 
> The solution is a new qcow2 open option: keep-dirty. When set:
> 1. On qcow2 open, ignore dirty bit and don't do check: caller is
>    responsible for refcounts being valid.
> 2. Never clear dirty bit during QEMU execution, including close.
> 
> Details:
> 
> 1. For simplicity let's just not allow keep-dirty without lazy
>    refcounts.
> 
> 2. Don't allow to open with keep-dirty when dirty bit is unset. This
>    may mean some error in user logic.
> 
> 3. For implementation do the following: dirty flag
>    in s->incompatible_features behaves same way as without keep-dirty
>    option: it actually designate status of refcounts dirtiness. But we
>    never clear the flag in the image, and we remember that it is always
>    set.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>

> ---
>  qapi/block-core.json |  8 ++++++
>  block/qcow2.h        |  2 ++
>  block/qcow2.c        | 61 +++++++++++++++++++++++++++++++++++---------
>  3 files changed, 59 insertions(+), 12 deletions(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 9a5a3641d0..4b5c6d7935 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -3228,6 +3228,13 @@
>  # @lazy-refcounts: whether to enable the lazy refcounts
>  #                  feature (default is taken from the image file)
>  #
> +# @keep-dirty: whether to not touch dirty bit. When set, QEMU doesn't
> +#              check refcounts on qcow2 open (ignoring dirty bit) and doesn't
> +#              clear dirty bit on qcow2 close. When true dirty bit must
> +#              be already set in the image on open, otherwise open fails.
> +#              When true user guarantees that refcounts are consistent on
> +#              open, so the check is omitted. (since 7.0)
> +#
>  # @pass-discard-request: whether discard requests to the qcow2
>  #                        device should be forwarded to the data source
>  #
> @@ -3276,6 +3283,7 @@
>  { 'struct': 'BlockdevOptionsQcow2',
>    'base': 'BlockdevOptionsGenericCOWFormat',
>    'data': { '*lazy-refcounts': 'bool',
> +            '*keep-dirty': 'bool',
>              '*pass-discard-request': 'bool',
>              '*pass-discard-snapshot': 'bool',
>              '*pass-discard-other': 'bool',
> diff --git a/block/qcow2.h b/block/qcow2.h
> index fd48a89d45..696e13377a 100644
> --- a/block/qcow2.h
> +++ b/block/qcow2.h
> @@ -130,6 +130,7 @@
>  
>  #define QCOW2_OPT_DATA_FILE "data-file"
>  #define QCOW2_OPT_LAZY_REFCOUNTS "lazy-refcounts"
> +#define QCOW2_OPT_KEEP_DIRTY "keep-dirty"
>  #define QCOW2_OPT_DISCARD_REQUEST "pass-discard-request"
>  #define QCOW2_OPT_DISCARD_SNAPSHOT "pass-discard-snapshot"
>  #define QCOW2_OPT_DISCARD_OTHER "pass-discard-other"
> @@ -376,6 +377,7 @@ typedef struct BDRVQcow2State {
>      int flags;
>      int qcow_version;
>      bool use_lazy_refcounts;
> +    bool keep_dirty;
>      int refcount_order;
>      int refcount_bits;
>      uint64_t refcount_max;
> diff --git a/block/qcow2.c b/block/qcow2.c
> index d509016756..ee82ef2a8f 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -514,15 +514,17 @@ int qcow2_mark_dirty(BlockDriverState *bs)
>          return 0; /* already dirty */
>      }
>  
> -    val = cpu_to_be64(s->incompatible_features | QCOW2_INCOMPAT_DIRTY);
> -    ret = bdrv_pwrite(bs->file, offsetof(QCowHeader, incompatible_features),
> -                      &val, sizeof(val));
> -    if (ret < 0) {
> -        return ret;
> -    }
> -    ret = bdrv_flush(bs->file->bs);
> -    if (ret < 0) {
> -        return ret;
> +    if (!s->keep_dirty) {
> +        val = cpu_to_be64(s->incompatible_features | QCOW2_INCOMPAT_DIRTY);
> +        ret = bdrv_pwrite(bs->file, offsetof(QCowHeader, incompatible_features),
> +                          &val, sizeof(val));
> +        if (ret < 0) {
> +            return ret;
> +        }
> +        ret = bdrv_flush(bs->file->bs);
> +        if (ret < 0) {
> +            return ret;
> +        }
>      }
>  
>      /* Only treat image as dirty if the header was updated successfully */
> @@ -549,7 +551,13 @@ static int qcow2_mark_clean(BlockDriverState *bs)
>              return ret;
>          }
>  
> -        return qcow2_update_header(bs);
> +        if (!s->keep_dirty) {
> +            /*
> +             * No reason to update the header if we don't want to clear dirty
> +             * bit.
> +             */
> +            return qcow2_update_header(bs);
> +        }
>      }
>      return 0;
>  }
> @@ -709,6 +717,11 @@ static QemuOptsList qcow2_runtime_opts = {
>              .type = QEMU_OPT_BOOL,
>              .help = "Postpone refcount updates",
>          },
> +        {
> +            .name = QCOW2_OPT_KEEP_DIRTY,
> +            .type = QEMU_OPT_BOOL,
> +            .help = "Keep dirty bit set",
> +        },
>          {
>              .name = QCOW2_OPT_DISCARD_REQUEST,
>              .type = QEMU_OPT_BOOL,
> @@ -966,6 +979,7 @@ typedef struct Qcow2ReopenState {
>      Qcow2Cache *refcount_block_cache;
>      int l2_slice_size; /* Number of entries in a slice of the L2 table */
>      bool use_lazy_refcounts;
> +    bool keep_dirty;
>      int overlap_check;
>      bool discard_passthrough[QCOW2_DISCARD_MAX];
>      uint64_t cache_clean_interval;
> @@ -1088,6 +1102,8 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
>          }
>      }
>  
> +    r->keep_dirty = qemu_opt_get_bool(opts, QCOW2_OPT_KEEP_DIRTY, false);
> +
>      /* Overlap check options */
>      opt_overlap_check = qemu_opt_get(opts, QCOW2_OPT_OVERLAP);
>      opt_overlap_check_template = qemu_opt_get(opts, QCOW2_OPT_OVERLAP_TEMPLATE);
> @@ -1214,6 +1230,7 @@ static void qcow2_update_options_commit(BlockDriverState *bs,
>  
>      s->overlap_check = r->overlap_check;
>      s->use_lazy_refcounts = r->use_lazy_refcounts;
> +    s->keep_dirty = r->keep_dirty;
>  
>      for (i = 0; i < QCOW2_DISCARD_MAX; i++) {
>          s->discard_passthrough[i] = r->discard_passthrough[i];
> @@ -1810,7 +1827,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
>      bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
>  
>      /* Repair image if dirty */
> -    if (!(flags & BDRV_O_CHECK) && bdrv_is_writable(bs) &&
> +    if (!s->keep_dirty && !(flags & BDRV_O_CHECK) && bdrv_is_writable(bs) &&
>          (s->incompatible_features & QCOW2_INCOMPAT_DIRTY)) {
>          BdrvCheckResult result = {0};
>  
> @@ -1825,6 +1842,20 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
>          }
>      }
>  
> +    if (s->keep_dirty) {
> +        if (!(s->incompatible_features & QCOW2_INCOMPAT_DIRTY)) {
> +            error_setg(errp, "keep-dirty behaviour is requested but image "
> +                       "is not dirty");
> +            ret = -EINVAL;
> +            goto fail;
> +        }
> +        /*
> +         * User guarantees that refcounts are valid. So, consider them valid,
> +         * keeping dirty bit set in the header.
> +         */
> +        s->incompatible_features &= ~QCOW2_INCOMPAT_DIRTY;
> +    }
> +
>  #ifdef DEBUG_ALLOC
>      {
>          BdrvCheckResult result = {0};
> @@ -2826,6 +2857,7 @@ int qcow2_update_header(BlockDriverState *bs)
>      uint32_t refcount_table_clusters;
>      size_t header_length;
>      Qcow2UnknownHeaderExtension *uext;
> +    uint64_t incompatible_features;
>  
>      buf = qemu_blockalign(bs, buflen);
>  
> @@ -2846,6 +2878,11 @@ int qcow2_update_header(BlockDriverState *bs)
>          goto fail;
>      }
>  
> +    incompatible_features = s->incompatible_features;
> +    if (s->keep_dirty) {
> +        incompatible_features |= QCOW2_INCOMPAT_DIRTY;
> +    }
> +
>      *header = (QCowHeader) {
>          /* Version 2 fields */
>          .magic                  = cpu_to_be32(QCOW_MAGIC),
> @@ -2863,7 +2900,7 @@ int qcow2_update_header(BlockDriverState *bs)
>          .snapshots_offset       = cpu_to_be64(s->snapshots_offset),
>  
>          /* Version 3 fields */
> -        .incompatible_features  = cpu_to_be64(s->incompatible_features),
> +        .incompatible_features  = cpu_to_be64(incompatible_features),
>          .compatible_features    = cpu_to_be64(s->compatible_features),
>          .autoclear_features     = cpu_to_be64(s->autoclear_features),
>          .refcount_order         = cpu_to_be32(s->refcount_order),


