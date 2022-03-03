Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B494CC3E8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:32:03 +0100 (CET)
Received: from localhost ([::1]:39062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpJ4-0004a4-41
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:32:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPpDZ-00054G-M9; Thu, 03 Mar 2022 12:26:22 -0500
Received: from [2a01:111:f400:fe0c::70f] (port=7616
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPpDX-0000MU-8F; Thu, 03 Mar 2022 12:26:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Omi3plMJE8C2/lFD8Vt3SuwBFYr6WmwoR/oahyxBi4XfZBNjJJQUcRg38fUTco+NZ/VrSdRtRU1e3rfLMJd9ZHANPT95Hnr66H1xWWlxwZMFZXjlVUp6JkACq2iWBOtEBO81TqgEnPIGpbQFCNQg+RGLFlpArO7WNuxxnpR+56mUNN63zdePEzjpq1u6gTq4pr4uwePPxbJC2N57kVrdWRy77RQupRRh3spHwaLg8n1kVPwJHGzP6V/qWuC93888jqvlVbxO6H8aLdzcHoUdlQQ9eY3K9ixZK9hMJOS8JAvKxKbmtOLN6ZcIX3PgwFFlQm5/C+ySXS57vof6pawTUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agCo9WZEqN8Jw9F1N47OpGk1WZLKYXIIbkYWhcbziQA=;
 b=IGy7Iqcy6/WqW2nMrlRYxM4Z6WR94gv/ZAuTBPywIHYtGG2TpC1FO0fLelmDCeE1YODPzSPrPdymDTG8Ua0p3VYn+ygNbsRKFRYQJWiLiJA+YfQpJOsOgQMDjLrGkdYcGgRc0Z9+YX9TJHpNvNuejFe/lEGZ4ugMmeyIS0NbrGHZusi+bMd7Yd0doMWDLXxKa19g2fZHBcQd2KNFCaSp93Al9ojjQaINwdnIQHhdftdEYT5REt/PMS7YQ8WBNl+7qmRRiDJybH2rCBkevaUAU7tAepTzJkq/6aXFMVW/Pur9OpNbtP6DLyxSOuurE0Cdneebwhn9ykhBHUpqnpoC6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agCo9WZEqN8Jw9F1N47OpGk1WZLKYXIIbkYWhcbziQA=;
 b=tc7IC0cwXKkNvyNQNr3vq6y8KTGP7mW/nUb6FwfPS+g7c0hdszoualYZDNDa/cFQyGxFgDISpDADN9m27Sc1htsmVbB/Ees4Iq5Hw0Zw7OMW45A7Nnz9/h6UPfy3kVLIJoaM7AI991Fk46XirH2vPedfteJo8cWYIoZm3gbWrro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PR2PR08MB4652.eurprd08.prod.outlook.com (2603:10a6:101:18::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Thu, 3 Mar
 2022 17:26:13 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 17:26:13 +0000
Message-ID: <ed5c7033-1d2d-5f53-43c5-42cf3f4b166d@virtuozzo.com>
Date: Thu, 3 Mar 2022 20:26:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 11/16] block: introduce snapshot-access block driver
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
 <20220228113927.1852146-12-vsementsov@virtuozzo.com>
 <6ac72250-00c9-d998-fbe7-4c8d958476d7@redhat.com>
 <53c0edcf-7250-36e3-788b-8db122752428@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <53c0edcf-7250-36e3-788b-8db122752428@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::22) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b56dfbb6-7ec8-4088-af66-08d9fd3aea4e
X-MS-TrafficTypeDiagnostic: PR2PR08MB4652:EE_
X-Microsoft-Antispam-PRVS: <PR2PR08MB4652E61D497BF50EFA3F8648C1049@PR2PR08MB4652.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i3Qt2GZJKLbR8szg8d4Ay0FsspFLiIR5FCZtiOnZI1jFzdE5EhMGX2M51LNFBXlev0j9oTrByqmhNz4tFC1D6gHzCOpGH72rhYp3UXNvq4Z6EAiTSIjpRZe7sFDYxtD928sOILARKgyTL27JK9VY/d8TjVsOUEHDv20L9l3gYZdggC3o8Bivm2b9RD5XN7+3crH0hBU37qtl89vZZ2CGEHN4GNrk0h6T0n3r/XIOkodM0MfcE6VDNxSJeewibCRf5BdR3TtMImMcuVV0kSH0auiUD2Gykh3UoAfs4AmP3tH5E6WlsYHhD9GcTAwq5teerf3iR8LUm3KA1R+BnaxIcw1wer74tNStJ5wdhiHYMnxCgWlMaRwOp4CU59VavND0xnoxx4WdUl4wAmeFBAC/TBGNSz+Sx8JNlZSTek3U4nfISNck9Z7JTYNHaNOuDMYdgFoREJhZpUeSaVbdbGrVEZ15hcple/Fx53ZB/GA0WTcOcDLObOCwQUrSjhOe8y8rKo6eafRCRS8Z1FPj5hkwd13mHEu1WiNrPYO+le21forY8BkqQFA9/K8J8aqPrnGfWpJJusIxL8ChXHIthddM5u9X774vv2kY/3I1TDCKCQQOilULrzaGkBkw6DbK6FpgTPyFLR6GFYWuoEFgPNupFI4kYQyPKDcVxXD5CCQCiecKU+7FzIIP/c0/K6+b3YDPU9WJVVf/PxoNDdk9/+2bPcirvlormCPO5BoXSjvzow9krhojiK2mmZZfuwFuSAQPxvah5Z9Zjx+l3NvMpG/jxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(316002)(31686004)(2616005)(31696002)(36756003)(186003)(26005)(107886003)(8936002)(6486002)(66556008)(38350700002)(38100700002)(508600001)(6512007)(86362001)(53546011)(52116002)(4326008)(6506007)(5660300002)(66946007)(8676002)(2906002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEY2c0wzWVFHdEF3OVdrNjMzMWVRODFhei9LM1RndTZlM08vaHV6QnpHdkdo?=
 =?utf-8?B?Ny8rZ2krMFZuem9aMXdpbzR6TWxXL08zamJKUnR6OXBBVG1DYkxpc09MdUZT?=
 =?utf-8?B?dEFzQTZoTFlxSVlRSHhEQXRHeTZHRlJZWmxjNm9QQ1NrQ0g3Ym1YblRSeE0w?=
 =?utf-8?B?dTRRbUdVay9PMElEMWxMbDliRDdKWVUybTdPejFYWDdva01KTGE1aUpPMk1T?=
 =?utf-8?B?NDFKaTFNeE41cWtGOHhCYXA5cUoxUE9hc1pGbks3WHBBUUhjZWJYWjR2WmFu?=
 =?utf-8?B?UjhjNkRIa0h3eng4TloxMTlVMUYxbCtjZHlreTJrYU9jZUFydTlYWkVEaGpa?=
 =?utf-8?B?THMwbHVoNGZydjZIaHhzYmJBYUNkdWVkUDZIcHJjZjRva2RqSnV2bmNobjdl?=
 =?utf-8?B?dm84RHMyNElDRjd1ZGxFd1VId1IyWkZmSXI4MmMzMTYyZWQ5L0ZsdXp1cmdG?=
 =?utf-8?B?SHZzSjJsRnVIdFpHbDMvRktvZ2o5WitaQmtqMkV0QldTa0EraTIyNFBMUjJs?=
 =?utf-8?B?dUkwV2VFT2R3RnVyMlJUdWI5cHprSUpMa0Nzb0JKYlUxTDdEUnhsOUMrczlh?=
 =?utf-8?B?bXVRUjZWV1ZDZk92azZuTmQ4T0F2elJmK25tRFQ2T3VDODN5MmI1aEQvNzZu?=
 =?utf-8?B?ak1rRFhaYVYrcHI1RmJscmFYL3VVcDBsVFJEM0RVWmYvcHoxZWtiekdyT1R3?=
 =?utf-8?B?K2lQUHdKZEt1STd5T3Znd01sVmtvd28yeTJjOXN2RDVMT3RWa0g4U2t3M1kr?=
 =?utf-8?B?ZEtOL2l3VjlGVkt1cHVwTGU3d1lGUXY0Sm1OS2FqMzhZWXpSV005Y2dUWU42?=
 =?utf-8?B?NVpxQ0g4d2FrQzh2ZERkb2dMMmdkSzJNMHN1bG1JQTdPdDNKQ3diZ2MwYkFT?=
 =?utf-8?B?S3FLUlY1UjFwRFpld1UyNUxEZmlaS1k4bnU5b2xRcGp5Y0FZbWpDbU11dXhi?=
 =?utf-8?B?a2hsMU1BV2pGY1ZPZVFITVdUcEs3Sjk1VDkveUtEdXlnNHU2MlZ5OWRUK2pm?=
 =?utf-8?B?OWJQWURvUFgxTjZGZVlnZDNzU0RqWTMrNXNRZVMvYmJXeTJueC9qRStmUHE5?=
 =?utf-8?B?dmlOS0wwSVQyaWdUL2JBS0xkZGZtWExhaE9US3BMU2pHbnR5SjBDTkczUmJN?=
 =?utf-8?B?bW9LWmxlMDhFSFRBVkhQM0V4ZFd3c1NNQ0JxMHlmYWxNQzlSZDYrc01Vall6?=
 =?utf-8?B?MzVGQWw2UU9yNFEzVmI5SmR3ajgvWDBLZFF0SU11RVhzanM4ckdhbFFDeEJI?=
 =?utf-8?B?Sy9JaHF4dHVPR2pqbUxtaklnZXNuVjQ2SHRKSmJhdmtOK2NNbVcxM0R1dEll?=
 =?utf-8?B?Wmd3Z3VONE5tQmJ2SThZRURlTm1rb1RBZmJjcHNVN3JYUHpsSnUrYzkxTGha?=
 =?utf-8?B?OFFoVHROMVBRTGJlYW9OTWIvZkYzOFFMcnVqU2l0S2ZtdFhadjV4K3lNeTlU?=
 =?utf-8?B?aUpoZkdaem0xWURuYUhTOFFKWm5SWWMvcTVNVzBHdnZXVnIwVHFiSU05T0tZ?=
 =?utf-8?B?MVpZN2xaWStITFZXUjNqc2tjaXIrK3RST2U5SkZmcjB2VkdqWWlPaStQOStS?=
 =?utf-8?B?V0d2WnpKQm9GQllLOWVTQ1N0a1dSQ3VaZERsK1ZjNHNMWHdkTUROREQrL3h4?=
 =?utf-8?B?bDlKL0J2TW14OEpueWVHRWc4NCtTaWlLY0dQVktEOGY2c1A0cTlJckJMMkV1?=
 =?utf-8?B?ZkJuMHR6aFRhUXhWM0F3OURjMmxZci91KzloQXdZV21UTTBYZDk4aEJzd1cv?=
 =?utf-8?B?VG5TdWtYL0w2a2VLSFVhOVBLYU56ZkRtdXdLWFRIS3g0cERDVG1SYURYRDlo?=
 =?utf-8?B?eXNoYVpXRDMxT0hlUUw4dEVQa1c5TEl2bisySTh1MXpuaVRENTJ0dUJCSnRL?=
 =?utf-8?B?R3VQWTRCRTRVbHdGdEowS2tFdHhzNm9NaGlVdHBoQzV6RGhOUEliS0JhKzRY?=
 =?utf-8?B?ZUN5UDZmSldRY0FPVjNzNk1nZXFpWit4SXdtQmVnUVUwVXJVWVFYSkJDaytS?=
 =?utf-8?B?aEFLM1FBeElXaW5pRjkwU3drV1hua3dIUTk5ckhoc3cycW9qUHMrOVcvYWgy?=
 =?utf-8?B?TEIrb1ZqcHVSa0xKM0Vkcm9vTUIvOFhsVDF6c0xQMDhxVCtaYmZRQ2tqckQ1?=
 =?utf-8?B?VWNhZVh6ci9XdUxsd05iZndBL3o5dmMzdVNNck5RbjkwanVoR0RDMWVySTVh?=
 =?utf-8?B?TFRnclR0VzlzVk0zT01sYVNVc2RLUUxTT2hIaEFnUXR3TmxaUmdxbUR0Wm5r?=
 =?utf-8?B?R2QxSHlkMGJUWmxsaTd0RTN6VHR3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b56dfbb6-7ec8-4088-af66-08d9fd3aea4e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 17:26:13.3091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYiEiM8mvvz7tqQNICkGutYir1G/9DTLliHuexMRmnnurDEzg04NlvyiI91yALRyUKx3Bio1M921IgqslX7k6C2cAePGwYufUT3AXRHrIyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4652
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::70f
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::70f;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

03.03.2022 14:11, Hanna Reitz wrote:
> On 03.03.22 12:05, Hanna Reitz wrote:
>> On 28.02.22 12:39, Vladimir Sementsov-Ogievskiy wrote:
>>> The new block driver simply utilizes snapshot-access API of underlying
>>> block node.
>>>
>>> In further patches we want to use it like this:
>>>
>>> [guest]                   [NBD export]
>>>     |                            |
>>>     | root                       | root
>>>     v                 file       v
>>> [copy-before-write]<------[snapshot-access]
>>>     |           |
>>>     | file      | target
>>>     v           v
>>> [active-disk] [temp.img]
>>>
>>> This way, NBD client will be able to read snapshotted state of active
>>> disk, when active disk is continued to be written by guest. This is
>>> known as "fleecing", and currently uses another scheme based on qcow2
>>> temporary image which backing file is active-disk. New scheme comes
>>> with benefits - see next commit.
>>>
>>> The other possible application is exporting internal snapshots of
>>> qcow2, like this:
>>>
>>> [guest]          [NBD export]
>>>     |                  |
>>>     | root             | root
>>>     v       file       v
>>> [qcow2]<---------[snapshot-access]
>>>
>>> For this, we'll need to implement snapshot-access API handlers in
>>> qcow2 driver, and improve snapshot-access block driver (and API) to
>>> make it possible to select snapshot by name. Another thing to improve
>>> is size of snapshot. Now for simplicity we just use size of bs->file,
>>> which is OK for backup, but for qcow2 snapshots export we'll need to
>>> imporve snapshot-access API to get size of snapshot.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   qapi/block-core.json    |   4 +-
>>>   block/snapshot-access.c | 132 ++++++++++++++++++++++++++++++++++++++++
>>>   MAINTAINERS             |   1 +
>>>   block/meson.build       |   1 +
>>>   4 files changed, 137 insertions(+), 1 deletion(-)
>>>   create mode 100644 block/snapshot-access.c
>>
>> [...]
>>
>>> diff --git a/block/snapshot-access.c b/block/snapshot-access.c
>>> new file mode 100644
>>> index 0000000000..77b87c1946
>>> --- /dev/null
>>> +++ b/block/snapshot-access.c
>>
>> [...]
>>
>>> +static int snapshot_access_open(BlockDriverState *bs, QDict *options, int flags,
>>> +                                Error **errp)
>>> +{
>>> +    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
>>> +                               BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
>>> +                               false, errp);
>>> +    if (!bs->file) {
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    bs->total_sectors = bs->file->bs->total_sectors;
>>
>> (If I hadn’t commented on patch 16, I wouldn’t’ve here, but now I might as well...)
>>
>> Instead of just a comment in the commit message (which noone will really read later on), I prefer a TODO or FIXME comment directly here in the code, or even better in the API added in the previous patch (i.e. as part of the comment in the BlockDriver struct), that this will not work for qcow2, i.e. that we will need to inquire the snapshot size from the snapshot-providing node.
>>
>> It’s OK not to implement that now, but I don’t think having a note just in the commit message will help us remember.
> 
> Considering softfreeze is next week, I’d propose I just add the following the patch 10, would that be OK for you?
> 
> (In case it is, I’ll hold off on applying patch 16 for now; it’s a test, so we can easily add it during freeze)
> 
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index c43315ae6e..5c8ad9ed78 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -385,6 +385,12 @@ struct BlockDriver {
>        * in generic block-layer: no serializing, no alignment, no tracked
>        * requests. So, block-driver that realizes these APIs is fully responsible
>        * for synchronization between snapshot-access API and normal IO requests.
> +     *
> +     * TODO: To be able to support qcow2's internal snapshots, this API will
> +     * need to be extended to:
> +     * - be able to select a specific snapshot
> +     * - receive the snapshot's actual length (which may differ from bs's
> +     *   length)

Yes, that sounds good

>        */
>       int coroutine_fn (*bdrv_co_preadv_snapshot)(BlockDriverState *bs,
>           int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset);
> 


-- 
Best regards,
Vladimir

