Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C4559766B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 21:28:52 +0200 (CEST)
Received: from localhost ([::1]:38994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOOig-0001Ge-Fi
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 15:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oOOhL-0008K6-En; Wed, 17 Aug 2022 15:27:27 -0400
Received: from mail-dbaeur03on2090.outbound.protection.outlook.com
 ([40.107.104.90]:37985 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oOOhI-0006tc-7y; Wed, 17 Aug 2022 15:27:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l96rE279wLB/IjxfFsJDuif9eKdYwVZy+y8LGhe1RbNsTeUrRTdngA+3YYPuQ/Bf4MbTm9G28yLIbAzUoi5v14gkGP/uM3/Apv3et+/Cgf+x1lzbTEENpj/HecnoqF0V8mJZQvdaHBb+GXrht3bCnNtFSo08GgV0HZ9XTRRWXD+6OREk8+mbK/cXjOYRjcJvaaMSQQurxFQ/ZGXNEAQvURATCep3z35G9mLEONGIh56Ogo20mVUYA9IGQtgXywlv+KVBV6Q1puyA1DZ6/YarKrS3sBmomh7VulJxaHOZpOI/pNnLt2w6eo6JvDcH1IXLPvFsfke9FnPdTaCE9CjcyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiFUk3HzGoGf77mhJAT8J7UPBNqU44j0AWNEFQ1/TA4=;
 b=I0FWX7ap+bpVcT8GkkiGXP7AmNHP29JP3xdEA1V6dez1MRZsknkxGcFK3GDr6hyKQaKGlSlKmuvffWtDJBQRMi9Py3HEzSyDjLNzPbdxZNjzNh4wX9DaNuD4oMZ9Ng1NXBDRKY7xCSQnpt2fgnpAndXtQB/cww28h9tTgCpKp8X26w6Jh83Y898figlyYYhVYBA13OxuZZ1FvDK1VnMdt3wAYB+LE21YQdJKu9Z1c79eO2kU3rQHUK0KMbdPcaYWKh/6d1dTYfi9Fy1RH0P4FhDCvoc8b+STJtNA+JtP/qDSs/5yttkVBwgcfyS2PP4oYpvVmIkaiUf65q8MWU+rwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiFUk3HzGoGf77mhJAT8J7UPBNqU44j0AWNEFQ1/TA4=;
 b=AttT//iR2xS+cmezFrd/ST3vpL4Hku83G4mLo1YmmeOTjCFuLdlf3Ux+lSd7jIyMdYwhUHSdSozxDeiq+vJu9OFL+/+dafiCK1LVQA+Fu2TRVgitxIqA54+mc16iDLGPo9Jp8XUBmLQEBksW+bPIYGprLefydiWwgymidHDh6b1W4X6dWKa4JSUJXS9aw3f5dt0zrxDlck4I4AeEKIRepm+GgfpGWZv68tY8L3jGC7WwA2R+jrkf9Yg9bpU0Z+uwoT8r5TElep34Y+zyQ76BYhAuP7I7ZD/JRCP9k9WpS8ljq0Z7fphPjcQ3H1/4kx4FQXTEPmZuuB/cMILKl0daXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM0PR08MB4244.eurprd08.prod.outlook.com (2603:10a6:208:13b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Wed, 17 Aug
 2022 19:27:18 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 19:27:18 +0000
Message-ID: <30d44555-cb86-ae29-e781-959d6f12f0d2@virtuozzo.com>
Date: Wed, 17 Aug 2022 21:27:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/8] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
 <20220815090216.1818622-2-alexander.ivanov@virtuozzo.com>
 <f0f1cee6-1409-c94e-d9c1-68cb4c848d0a@yandex-team.ru>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <f0f1cee6-1409-c94e-d9c1-68cb4c848d0a@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0014.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::26) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b12dc50e-90e5-43be-2351-08da80867f87
X-MS-TrafficTypeDiagnostic: AM0PR08MB4244:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k0Etn+gI5zyAM5kSjPBgNXC7bFns3Vanwb/wq859foEpW/aKUtu3/Fc2Z3TAD/tIgDzj11YBorBz/w0leI9MjMakp9hfUohoSt7DSkwcwUJN1gHyTOeejV7NIFiJw3oJIHtTLhOUJAOEGf/RvME/kO6G29Zjv6Im4xXiv2c8ezPPoomDRGmFH4cQdr7QcF2d8dRvZa64/nnY6NHjg8BKZxilte7kaU+pE7ba0JZ4kwjc5avW3udGhbgqVsEPJeeBZpZ4lDeuA49ILdgbFg4+ySk/z9ykteVXrv5ahMy5jm4gIBl3O8I4KQ9pt4HZTxXGmdPKJrpxe5teO/1gZlFbkVKACvipCpTKpXJleea9MUP56J+awfmfhgdp458Qf/L3kIxwewxQ9OISjPa6rvtmkpxpjS1Qm86TVHaVsyPKPOmNPhJVu1xGh1Bcz7JlfBge+i45TEDLbzR3R94w5jkOOzsxDlAtxU/VgRjlLE914gXfRRiBjgohcQS6SlW6t9Q/lBuKqmVF37kbp+y/e8dEluuWfJhykE9x2bjoxdSiK5TirBzIjB4vD6y2kmR1wxBXl2wamnIeoH6M+HenvrzC0JCov5kay8v0b0Bmtg3UK8AHWcADBoA6037exN+GrKkPsPucOamxhn5Z6SovIEilBZCof8D9+AVwaXM0YtfloiEKKwX00xq1bxgruXvm7467Oy5xWqTCQuLpmKf1ElFzME6t36wY4BBE8DEc0xuyjVuM4b4bbIGf+OqmMmt5tQGsLtc6ndhoG8iPeOg+Z2nS4MaLRfCOZqsF2WvtS1livx4fVYAdYJWQU5daNyvoNSeQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(396003)(376002)(366004)(346002)(136003)(38100700002)(38350700002)(5660300002)(8936002)(2906002)(36756003)(86362001)(31696002)(186003)(26005)(2616005)(6506007)(6512007)(52116002)(53546011)(83380400001)(8676002)(316002)(66476007)(66556008)(478600001)(66946007)(4326008)(110136005)(6486002)(41300700001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amJDUU85TzRick82L1ZoSE5jYUE4MURQTXBBZG5CY0p3aFZiYnl5K01EZE1j?=
 =?utf-8?B?bVR5UVBNandUcU9PUXgxbVZBc285NmJ0WWo0alk5MHdPcGJYZ05MZGNicTUy?=
 =?utf-8?B?RzJ0SWZWakJQUTBEN0NYUTRSNkMwR05kd3Vvb0dvRnBqSUFOcVJZVVZscTA5?=
 =?utf-8?B?QmdDZm04d2hINURTdkpLU2V4MldTb1FZMWJPeERrQzNXMjVYK0pnRXlHM01j?=
 =?utf-8?B?cDVJVmtTYzA4TGpReDRBN3l6a3E3R3pGaEtkMkhYY01xTlZJcFZwWjlTcXli?=
 =?utf-8?B?TWlveHpzc2ZTQU5FNjFrTURxeEp0S3Q1VkdtOFBHV1JrWTdMSWZuam9OQUE5?=
 =?utf-8?B?QlBTV1pETVpSclNMcVFOSHMxeWkrZlc5M2s1OWRmT0hFa2ZzM25kbHlDR0Z5?=
 =?utf-8?B?ZndRUnE0TVMxZGZxYmVRajA1NUJBRGl1NTdPZHFIZnB3RjVOeUxCNUhWdVh2?=
 =?utf-8?B?OU02eFE5UTBvOTJMN2N5azNEYU82QkRySC83OHVNTVFvNWNPL0hKZVJsdW9Q?=
 =?utf-8?B?ckp5QjhGRm9TK00zaUVGc3g0cGVodG1kc2c4eGtRWkcyeVp2OWVvbStHUHdE?=
 =?utf-8?B?SDU5YlFsQ0diNGVvUlB1Vll5OHo2UmZXUDNRWHV0ZTVIUEk3STJZZ3FkZ2VW?=
 =?utf-8?B?SFJiYndoZ0pWU1FLUC9lMkthaWNmZTBRS2V6elNPYkdnRE9hcGdMQW1UL21n?=
 =?utf-8?B?K3pkK2JNSlVHZ05uY1NZdmNiTmpIRWdHSlZEUkNacytqZUZpQXpnY1h3M2Qx?=
 =?utf-8?B?Ry93dkdZMVN4OUNFeW5qazVBUzVib0V3cFo2cnMzUDZKMzZJUnRBaC9OWmta?=
 =?utf-8?B?YTE3MDJoNHcrSWZGNC84QnI5VnA5VVlONTNid3oyRTFsNVdMd2hSVGlUaU9m?=
 =?utf-8?B?ZnYzZW1KbkJhdjRWOXVLQlFNcmhNa2YrVGNIZHA2REtJeElyRHpybVpzSEpi?=
 =?utf-8?B?ay9hOTI4TnpLSlBGNjFmN3R6SEZTZStrTmc2WnZrS01tYTVTZmVuclRTajda?=
 =?utf-8?B?RnpQeXVxaWxocVZDUXJRTXhtcnZuVHdtd2tyVlN2b2JDbFBSZzNsdmJsMWdE?=
 =?utf-8?B?eHlLYU15SFVVNWNvWE1rMERvcU9KNWNhNVVyRlpua2dvajJ6KytpMHl5cjhI?=
 =?utf-8?B?b3N0cnA3ME5QWXc3U2ZCM3RZUXdXNVNObFREcG9pMm9QVW1PVW1TdzVwWTMv?=
 =?utf-8?B?TTM0MktmaUZOZGJndW92TnZDVDdDYVFUWFB4K1BvTGlUS1RBandGN0xQd1Br?=
 =?utf-8?B?dms4Q1NNTUZxUFpTVldqTjQ3T1NVUXc3UEVIbTkwdVlscHlyK3hWbEtJNGVH?=
 =?utf-8?B?eHlxUVllSnE3WjJCT1N2NkVldmllaDlnVzBLYmpidnd0bmhXTHBOWWQ0dCtr?=
 =?utf-8?B?ci81L09POWVjUW5Kc25hTDB3NC9oSm1wdHFXcVdOMUx2ZE1xT3g1SFBEelBo?=
 =?utf-8?B?ZjdaTXpPZWcrUEpteE1uV0tieThLdC9ES3JBMnVZUWpaZiswY0JHMzVxR0hV?=
 =?utf-8?B?VEVYZDdLRnpIMUtFdVBCcmUvTmQwMkV1eDV3MENyclF1UFh3RzNxNjhyemI5?=
 =?utf-8?B?d1YzTWp5UHZ6dzh5aHVYMGo4KzFTNi9xMVptcm1nZ0paWklFdEhoOCtjZVpF?=
 =?utf-8?B?dE9OR0x0aDIvbE5kYzhwd3lqaVE0cCs5Mmd3QWZWaUhYRmlaOW5Pa0Z3ZWhE?=
 =?utf-8?B?aU9lSGp2bFhmaHppY3VKR0FJV1BEUFF1b2tCcS9PdG96VGl1SXZMTzFZcng5?=
 =?utf-8?B?NjBBbitSUzN4ZGtPMWVjWFNSaUdvaU9OTEhtckNleDhEVXd1Qk9UNkhPRzhY?=
 =?utf-8?B?UUQyb0l6NlIvS2E0VWxDMThNdlNILzduNisybWxFRjhpeEtlWVFNMU9Lc0hx?=
 =?utf-8?B?NVdXWkN3Rm9hamxoMXpzd3hIVWIwVkgvRVZhR2Y0YXJtR1BwcEFKZHdlQnpx?=
 =?utf-8?B?MWFyajFJNWdDVmxDVW9CUyttOGUza3llSnpySTM2VnNid3hJYVg4RXYrS3B3?=
 =?utf-8?B?MWUvYXF3L21lZ1c1YzYrOFN5V3Y4Ty9SSzdaUW1neXRWWndKbThxNkFldmpG?=
 =?utf-8?B?VFVVWVNBZDF2QXpoemJlY3NtUC9rajFrZmcvQXl6STJaOHNIcUVDeEVJQmIr?=
 =?utf-8?Q?YvEUZ74Ey7u8q8LLNcTDmLIgt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b12dc50e-90e5-43be-2351-08da80867f87
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 19:27:18.0975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkXRiuHjTTVY7e9IBvdIh3yFO6BcQm3ZViDxrkJQfb4SO4wlq5tmPsvJAKS3YIOOkeWsuk6mbKdnt4+2EgQEKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4244
Received-SPF: pass client-ip=40.107.104.90; envelope-from=den@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 17.08.2022 21:13, Vladimir Sementsov-Ogievskiy wrote:
> On 8/15/22 12:02, Alexander Ivanov wrote:
>> data_end field in BDRVParallelsState is set to the biggest offset 
>> present
>> in BAT. If this offset is outside of the image, any further write 
>> will create
>> the cluster at this offset and/or the image will be truncated to this
>> offset on close. This is definitely not correct and should be fixed.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> ---
>> v2: No change.
>> v3: Fix commit message.
>>
>>   block/parallels.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index a229c06f25..a76cf9d993 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, 
>> QDict *options, int flags,
>>       BDRVParallelsState *s = bs->opaque;
>>       ParallelsHeader ph;
>>       int ret, size, i;
>> +    int64_t file_size;
>>       QemuOpts *opts = NULL;
>>       Error *local_err = NULL;
>>       char *buf;
>> @@ -811,6 +812,22 @@ static int parallels_open(BlockDriverState *bs, 
>> QDict *options, int flags,
>>           }
>>       }
>>   +    file_size = bdrv_getlength(bs->file->bs);
>> +    if (file_size < 0) {
>> +        goto fail;
>> +    }
>> +
>> +    file_size >>= BDRV_SECTOR_BITS;
>> +    if (s->data_end > file_size) {
>> +        if (flags & BDRV_O_CHECK) {
>> +            s->data_end = file_size;
>
> Hm. but with this, any further allocation may lead to twice-allocted 
> clusters, as you just modify s->data_end, but havn't yet fixed the BAT 
> entry.. It seems unsafe. Or what I miss?
>
if O_CHECK is specified, we are going to execute parallels_co_check which
will correctly handle this. In the other case (normal open) we will
face the error, which is pretty much correct under this logic.

>> +        } else {
>> +            error_setg(errp, "parallels: Offset in BAT is out of 
>> image");
>> +            ret = -EINVAL;
>> +            goto fail;
>> +        }
>> +    }
>> +
>>       if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
>>           /* Image was not closed correctly. The check is mandatory */
>>           s->header_unclean = true;
>
>


