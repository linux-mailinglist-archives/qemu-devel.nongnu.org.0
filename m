Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E33A44153F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:24:06 +0100 (CET)
Received: from localhost ([::1]:35268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhSbt-0004mR-6o
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mhSah-0003y9-8s; Mon, 01 Nov 2021 04:22:51 -0400
Received: from mail-vi1eur05on2097.outbound.protection.outlook.com
 ([40.107.21.97]:5216 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mhSae-0007Rg-PP; Mon, 01 Nov 2021 04:22:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajl73rldoSauyJiuPAA2CKPnk3BPdq488pJD7sVAw/Duu8t9pDYibdBhNWbLBdWBOTX9a2yZR8SOuT+bgXjej2Ds0n1WnZGRhgPcaxt6REKrYTOTbHEenAveeC2CmfHwbInHJH+ZFrEYf/r+IdMg1q9PCht/xsefbCZBuYSWW73VUINm9WX3HFeN4UxE+dr6LI16AZ1k8Ptzz1NqT01Hqhy8sWI1hRrVZNhRueWmgiJPjB41Ukdb6yW8dpLLahGmC2T8o4XlP612CnjGEMlcFUMdD4UgBfbK8kyx9DDkfDzDoj0fI3b4/GUwcyC1dyOmgVz2SeUKUVod6CH3NvDtCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bRteGU6EzaHT9QAw/hxFbpxxtTvPJxjq5v/ENUAcWs=;
 b=VzwuyjKzw8ZvQmCdlefjfKaUNQ5/U3ZqcJ63HdNHsTKLz3vd+CKfFu0Sa/cCQfRjg1l6ouxC4V2iwoxMpHjthHKiY+wTYuBtNiaGCNcZltdu6cXeGA8kZFK7Y6Pab1BvHMaOEqeumuMFaRpvZkVcSl/Jo2g3MXkOad/xpOr6aDwuG5GZPtExaVv5YJ+ajkcsiF7MxYdXQJh5sHlUXDFtSi3zh/NhkltSldJdSutwWjkI85MPrCDoi/CC25bNZvXooR/qYGvJFZB6V7R/AOIUcJassV1AXSSv6zryyWhIkFbzxSW0O4FldqHQctLInznTPJduZ5B66lKzVGbkX0Xmfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bRteGU6EzaHT9QAw/hxFbpxxtTvPJxjq5v/ENUAcWs=;
 b=qjshuNQhCqgwdzdTTfLx6t1VerremEmc27DlRb0Eycp5J9vtDssJ7IFvJen4mrAsjg80AbyNAkEmuj/3iJCLH65QJouNke+fRuAS0oPaTvxvNHRlZMxIc7osE1DU5f5QKPGFoAuHsCcgFOLWEBMx/vMEq/PYIoKE4lRzTY6V52I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1905.eurprd08.prod.outlook.com (2603:10a6:203:43::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 08:22:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 08:22:43 +0000
Message-ID: <2762c44e-9a18-bcb2-8333-83ea2d1ff68d@virtuozzo.com>
Date: Mon, 1 Nov 2021 11:22:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 3/4] qemu-img: add --shallow option for qemu-img compare
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 kwolf@redhat.com, nsoffer@redhat.com, jsnow@redhat.com, den@openvz.org,
 nikita.lapshin@virtuozzo.com
References: <20211028102441.1878668-1-vsementsov@virtuozzo.com>
 <20211028102441.1878668-4-vsementsov@virtuozzo.com>
 <20211029204402.flo6xeps4pexlujg@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211029204402.flo6xeps4pexlujg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0116.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.243) by
 AS9PR06CA0116.eurprd06.prod.outlook.com (2603:10a6:20b:465::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Mon, 1 Nov 2021 08:22:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56742d87-73d6-461b-f1a4-08d99d10c736
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1905:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1905D9CF25DF194758571B33C18A9@AM5PR0801MB1905.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KJ3/tQ6pOIMobd/TORo6k0BFxTNbMheeNEHAgTS5q01fOSy/zzhVEjazwo7BWOXp00Fqrqwnq8nwPCMN/DfHkjJ2PQTrjVfF1R6bOUva1pxjSUVnbwhN5rYt8gOJ2dgV2BQpExlj3ETeo56b0N4BT4FxKAGG3l6JYo63jlBqEgbN55iVL9yB1SsKuW1dxN0FjHiKk/XPUoBWzO3wJWoT8P5BD9gs0vjz+zEiCUjViTFrK5AwFjcnzhhfHhrmcbXk8baV/TxAHSldyuM0h+XxmOkoBhdTDIGfeZQ5MzHAi8pY4WRLWbs6LJaw5kXFqf2pGexAni/w21IqDKV9MApdAIpJS0M7LKrcPz/ZBxn6Q42yDv4P6XDXm9QiCQg5MQwE6mJYQMKRZD0XEmpHgPHUFWGdG1Qv22SLHUsgIyvF3F0vI7n+uNGlB7JB2LcbnhqptOmVnfJxHI7YZ50RQSZpYUUHKKKO+KPDToX2RIgdLk1qM8MlP7pf/YKOiRhg/L0jG9eizI/zsjiRiymD4U8rCgJ9mxSMgy2mjkwVoS1UovXwt42lBYjaqgWASm/8J3apjO2aFPZnvJNfaWjJJ+Fy8AcrjtvGXRyRnp9L8TdW5PwZe6LHgr5xlhbGczZa1aALAsIsnyxLLoy6z97WyGEz1IXK9rsLY1UjL9jBH9D9odk6ZF1ME5dPrtFPBrbSJRnOHrK7iNYPqKQjxNnCENJv9vBTb0Q7PFpx/c8yxU6MExBPQhqKJS8n5BCd9RyjjYCbEiI/ESp71TQ6r2uFfWum6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(31686004)(38100700002)(38350700002)(508600001)(52116002)(36756003)(83380400001)(31696002)(956004)(8676002)(2616005)(186003)(6486002)(66556008)(86362001)(26005)(5660300002)(66946007)(2906002)(6916009)(316002)(4326008)(66476007)(16576012)(107886003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3VlcGJUSXBNSEpYaTN2ZkFFazlhZWpBZzROcUNDTEh5dGhuTzR2c3U5ai90?=
 =?utf-8?B?YzJ5cTk3NmM2eW5DY2F4UjAyRWx0Z0grR3JpTEtDcXdYVG9YcUx0WlJBTGx3?=
 =?utf-8?B?UWxjckFXd2pOUVdSdkJPOGNjSUtpVmthV3NoVXRXVCtYV045bkpaVGtFRC9T?=
 =?utf-8?B?Yk1nQjZQRmFOdkd1N3dDTWVlUUR4UktORlNUWi9QcHAwMlAxYVcyL1kxWkFo?=
 =?utf-8?B?QjBJdFBUTU9wdDBVMDhZU2NxNUZnWlNjMEFLOXJmZ05nRE9RQ2N4SEZyTGdl?=
 =?utf-8?B?VnhxMmdNbEtrTC95NEl6K1Zqa1VvWGZZcXFoK25tWFMvaHpjN3NxakswZ3RD?=
 =?utf-8?B?cERYZXV4UEdqWmNtYlFuYWNpNmZ2L0t3ei9IM2JtVFpHN0RGV3huNzFQV29U?=
 =?utf-8?B?ZC9GL0VkMzNUdUxUVTdLVG1TckdYU3VlQ3NoaXBpdFZvTkVrbnRIc1ZYbzRR?=
 =?utf-8?B?L2tTUDNJS2lrbFpFaWhZUnUvY1N6ajFGaTF1TmhXeVB2R3JZK0xrcUp5MGh6?=
 =?utf-8?B?dmhEajd5UUJPSFl3d2c2WnZaelRLZlpocE1MZXdaTmx6NU5wRUVMb25NTHMx?=
 =?utf-8?B?c2VoclM3bWpYNWFWL3ZyVDQwTllsUFE2VlZ6cnBOUTNHbW5DL1VPaUU0Mmxa?=
 =?utf-8?B?TnN4SVFHNEZLZDFKbFUyYkxoOCtoWDNBVXJkQVYyc28vZ0hoaFp0MTROMm5y?=
 =?utf-8?B?eGtqVmZ0VENybDF0UllOU3U1Z0k0ZFA5Y2l5TExQQWFqU2JyWERFdHpCZ2xN?=
 =?utf-8?B?UlovSldOWmZuY3hLVFVJZ2JHVnFGbk05SEdMSFFpSXVOYSsraVF5NS9Vay9a?=
 =?utf-8?B?MVFlUlc2UkYzOTI2UzdTcCtGbUJhZjE2VUx4alVPd2lzVktjNThzRmQxOWd4?=
 =?utf-8?B?bHQvSXBzdEVkSTJnMi9zOEgxOXlzdVc2bGY4UE8wN240UnVld3FFbVJjQ3Jh?=
 =?utf-8?B?enJlTytKcGloWEt3SThyTWhBTW9ucDVuKzErTEE1clJPSmFJdTNUVGl4VmlQ?=
 =?utf-8?B?NmVJb1NQWjZRbklzYTEzSk5vc3FQRkd5ekFvM1o0WFBpa2NuaVBvMWVCTFRF?=
 =?utf-8?B?QjBuaWFrYXhZQURGNDR6RWU0WTBRZ0x2VWNDdGVWYmF2OHJHeTI5Ym9OVGUw?=
 =?utf-8?B?NHZGM0gxd254VFJIQ1V5ZENuTHZLTGFyUFRhVW1oa1NxRjhLZGpnUEh3OGFW?=
 =?utf-8?B?aHNwa1h5MDlBWnZubmliVVM3aTFaMC9VYjVtZ1ZQQnNVMXZUeHhoR3lzZTFM?=
 =?utf-8?B?aVI1UzJrME8wQ0pSNDNEb2JXSXNWcllhQ1pTZ1d1Sm1wUGJ5UlRBSWJraUky?=
 =?utf-8?B?NitzL1dUVG9naDJoekFvc0xaTHN2ekMwME5PS3loSzNlazJhRzlNd3B1akt2?=
 =?utf-8?B?bElkaWhFZGYvM2EwR214TlJUWnM0MndsdzZoQldtaGN5Zk5vbmpVRXc3ZVlG?=
 =?utf-8?B?cWtHUTlMKzNYYkx3a054L3hnVEkzMXNmeGNZMHVFY3VPeVNUVGRScmdKS1ZD?=
 =?utf-8?B?dCtrYklMeGNNRXNkdEVOS0RiS1ZYajAxMlB5VzVJUGxXWm9tUHFtb2EwTHlX?=
 =?utf-8?B?azlhSHFPVllWbUp6M21iY2d0MjR6Z2pVeEFrTlJDb1RsZDMrYVM1T0Q1Mzdp?=
 =?utf-8?B?bUNvbDNoZ09QR0luN2xZb0x5ZFhPTzh0RGtNRXNTTzBWemRmM0pQeTZoZnFX?=
 =?utf-8?B?Nm93NVBqWGJwbnN2U3d6aVlJZnlxcVFJN3BnVisrR1V3YlU1Z3FaYVdKaFFG?=
 =?utf-8?B?MTUwWUswdVFqa01zR1pXaWxDbUJtcHU4bzFZMkRRKzFGYmhJV002T3NKTFFJ?=
 =?utf-8?B?cUF1Smt4d2I4blBrcXNyOHI0eGIrMUlMemdDY1A1dG5PNUdNc2FNM2tJb3NM?=
 =?utf-8?B?Z2FPc3QxMUw0QjJ0WDhUMklvc3dpeWdBNDRGQ0J0YXdlNllXRGU0ekVEaUFa?=
 =?utf-8?B?dVpIb1BRd2ZDODBoVzNLT3Y1bHgvc2x4SjlvRnZnQ0M2cDdUejNlVzVoTVAx?=
 =?utf-8?B?akZiUGx2VHAvOVhvT2lna0FscmNIV1E3S3hoUEZvSjE3L04rSGVPWUNxL2li?=
 =?utf-8?B?bVVTUktEWmh3Tlg2UnN5ZmcyODArY2lrTXlhM2ZmTWJGSmpqcFViRTFLLzda?=
 =?utf-8?B?aDk3SVdobVJwb2JiaVFvbDlDaStpMFo2RUIzdWdCejcxejQzbTRSU2RGbCtP?=
 =?utf-8?B?aXlxZVRQMVhYZDZaQXVzTzNnWU1ybSs5dTF0UThPOUwrd3VCa2hDNkVFMlZ5?=
 =?utf-8?Q?jrbKy2r10fv+47UVruECVwCNPvz36DhzEGHlaJ7K1o=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56742d87-73d6-461b-f1a4-08d99d10c736
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 08:22:43.7896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMtjR5aSAi4tvtQa6M7HSLY4ThoQPxo/oimtuFVnm274GRs7NZ1TFr45PTDzt2QU1sb3TF3El/RSZ2KSdH/HZi68fEev4jHPibWzqE9Ec6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1905
Received-SPF: pass client-ip=40.107.21.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.592, RCVD_IN_DNSWL_NONE=-0.0001,
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

29.10.2021 23:44, Eric Blake wrote:
> On Thu, Oct 28, 2021 at 12:24:40PM +0200, Vladimir Sementsov-Ogievskiy wrote:
>> Allow compare only top images of backing chains. This is useful to
> 
> Allow the comparison of only the top image of backing chains.
> 
>> compare images with same backing file or to compare incremental images
>> from the chain of incremental backups with "--stat" option.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   docs/tools/qemu-img.rst | 9 ++++++++-
>>   qemu-img.c              | 8 ++++++--
>>   qemu-img-cmds.hx        | 4 ++--
>>   3 files changed, 16 insertions(+), 5 deletions(-)
>>
>> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
>> index 9bfdd93d6c..c6e9306c70 100644
>> --- a/docs/tools/qemu-img.rst
>> +++ b/docs/tools/qemu-img.rst
>> @@ -176,6 +176,13 @@ Parameters to compare subcommand:
>>       - If both files don't specify cluster-size, use default of 64K
>>       - If only one file specifies cluster-size, just use that.
>>   
>> +.. option:: --shallow
>> +
>> +  This option prevents opening and comparing any backing files.
>> +  This is useful to compare images with same backing file or to compare
>> +  incremental images from the chain of incremental backups with
>> +  ``--stat`` option.
> 
> If I understand correctly, your implementation makes --shallow an
> all-or-none option (either both images are compared shallow, or
> neither is).  Does it make sense to make it a per-image option
> (--shallow-source, --shallow-dest), where --shallow is a synonym for
> the more verbose --shallow-source --shallow-dest?
> 

Usable, to compare incremental image with "everything below it".

But I'm not sure about source/dest terms in context of compare, where image roles are symmetrical.

I even start to thing, that it should be an option, used together with --image-opts, applied to image in person.. And actually we already have it, like

--image-opts ... driver=qcow2,file.filename=file.qcow2,backing=

At least this works with qemu-io. But prints warning:

>> qemu-io: warning: Use of "backing": "" is deprecated; use "backing": null instead

And of course, "null" doesn't work here.

May be we should drop the warning, keeping backing= syntax at least for --image-opts of qemu utilities. Or, another way, support json for --image-opts.

What do you think? driver=qcow2,file.filename=a.qcow2,backing=  doesn't look better than --shallow. But if we want to make shallow option per-image, we can't ignore the fact that we already have a way to specify per-image options.


-- 
Best regards,
Vladimir

