Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1460325DEB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 08:06:28 +0100 (CET)
Received: from localhost ([::1]:58274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFXCl-0002wc-Te
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 02:06:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFXAl-0001Ej-Mv; Fri, 26 Feb 2021 02:04:23 -0500
Received: from mail-eopbgr50121.outbound.protection.outlook.com
 ([40.107.5.121]:63131 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFXAi-0002j7-NX; Fri, 26 Feb 2021 02:04:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKtJw/aZE3XALYa1J2AoakcC2qpLYmQyef9prhwpmf+CsJmZVWjFJIAClzWTz+UpH0X/PAr/QdyfileP/4hVUJ3Hqqh/DwDW6F2c8xJPGIAnX8mQkBTVLPTn3VhB5ZbCpCwLtavX2pUrFkD3nu/limqAcEXs4fTbp812UH9B0g3lnVDjRDxSzOIZZVF1mFIkS/Xfr/O84wL9134agh0I1XZl4t0+bqc4Ea+8c5yyRwIr7FHIqkr4oyNemRf4BhdrvUcDyD9F6xCJE20+eTgQzLFKZ3W3D4KNN5a65QP+CTelv2bPEW5c0EGO801oeEbsLHqu2aNFm/acEBhe49C6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYjnavW4HdWfvygeivDKUvM9JRdEaCUl4xQSYgceKXE=;
 b=RulIuTkReyqYPdD82ouPF4NVjxPvxUStfLmFrhPkqq3137uMtvMPBEHgZqTncVTmK0J2m2BcJwaNTuV4z2EGRL8KF06j9kZEmtb/zYIo2EyvFBMvvYuVAHdHmLE6UUw8BJho4xyj3fYaxfiAZhqkYDopSTFE0/5EbEHiv839cdeBc9VUpBGJE+vFCx9pYjgPPa/EKGGVhsBSm70eEMvWpQ2U53I4qMAZPuQxyO7La2RX3Pu3rbev1aJKMi4Z4Ijok7BwbVDFvMxpQalyOS4pDLhDa6So1/Z2YNGlkn8lVpHazw4rheHJ9cj2RMFPcCqjcr27m15rQWjrUnYxWvqQHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYjnavW4HdWfvygeivDKUvM9JRdEaCUl4xQSYgceKXE=;
 b=N8DqnfgPGqMBIJcDGDro6QnJxMCtWowxNM3K0AJfBxzyVF+IG1J7v+78pcwEaprSMkMre0r4RrTGFRx+gD7cnzoA+8yBJ8595BXsLlukWpys9NmHOrVjWYYDa9AlfgUoPUtuvrAiVn7W3L3T35rJ45OnvRs2JaweEJb05sWKpvM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4071.eurprd08.prod.outlook.com (2603:10a6:20b:a7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Fri, 26 Feb
 2021 07:04:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Fri, 26 Feb 2021
 07:04:17 +0000
Subject: Re: [PATCH] iotests: Fix up python style in 300
To: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Cc: kwolf@redhat.com, pkrempa@redhat.com, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
References: <20210215220518.1745469-1-eblake@redhat.com>
 <39d5d446-3271-a8fd-0755-6a0fbfe24c09@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <82a77c1b-95b4-5d94-d5f9-db025422caf4@virtuozzo.com>
Date: Fri, 26 Feb 2021 10:04:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <39d5d446-3271-a8fd-0755-6a0fbfe24c09@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR0202CA0031.eurprd02.prod.outlook.com
 (2603:10a6:3:e4::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 HE1PR0202CA0031.eurprd02.prod.outlook.com (2603:10a6:3:e4::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Fri, 26 Feb 2021 07:04:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c02945d-ccdc-4353-eee7-08d8da24bba0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4071:
X-Microsoft-Antispam-PRVS: <AM6PR08MB40711D4DE60D43B6C1F4A245C19D9@AM6PR08MB4071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +4tkX89W4//6tLVmZmeILiYHlI2uBs8ueQCy7Ad46zC8zGXlSk7c2xNyZTLMaZP+9F710vNYE3WrvSwxXdJ3Ra3cwUfsiyw/475/IfAi1Hf7f8YxatRbofGwQGcvIsU3oLOoSI1QArz4Wsv9DWAk1yiorStRAj+MyMxJD4d5hxFIuz8JgvY9u2mStoFNmAJFs6go3T/om7ZVEWyPNaqN32ew+xis2szKumw0w68qtrKMUb3+k3wJ3AU4VuauLErZLGewj2OCTVWx2TW6LWc+b3J5CI+mJ9K7r4jI2QVn9Wydg3l0VYuPExGLnlEt+SDTcZs8x6CompjUoYcd+FARM4ZBWj8S9twa8BWbK7LJi3pTtCQlVljzBAzGznUmErnEk0mBEISIqtg46R1EcyuBnXGHApfAL3GHWvCHINp9iZdX86svA46uk8Xb6o+SkmgUknPPAI1MZf8ur7VvKtQcqMlCWAFwAmbzWNVLpqkgceYmh5dHmkH3B0ukwNzqPANYt1+Rscqy10/N9D67ADoCFTN0gSDyRdGmseaMMxFvMe8qH8EpyoTd0YUm5EAcodRMGpHlNiCzd6+9Qveh97j2nohmJcQY5Afs4zxSDH2Elkw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39840400004)(16576012)(66556008)(66476007)(31686004)(83380400001)(956004)(66946007)(8676002)(2616005)(478600001)(5660300002)(8936002)(6486002)(4326008)(110136005)(2906002)(186003)(53546011)(86362001)(52116002)(316002)(36756003)(16526019)(31696002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SUZ0OUtlRGNNMlVVZWpzRXZYaURhV3BMQmxrU0tpbDBta0NxejZQZ1pHc05Y?=
 =?utf-8?B?TnZmVDBuY3A3dTBQYTJEUjlyWVZ0WmtNeFZjZTRLemVPQkpJYTM1RW1LNFRK?=
 =?utf-8?B?bGdIQ1h5cm9XLy9nOHJPSWNJc2ZTWFVPbDBBOGovNi9BaTZaQ0o2SnRTOU5M?=
 =?utf-8?B?ZjZLc0gvc3Y0ckNrSXd5VHlNUS90U0FXR2pUYm1kQ0dHb1lOUHNOY0lHTitS?=
 =?utf-8?B?eGwwUmoxTTloR1Y3b1ljN2Nza2MxSnJKUkhoeFdUWldDOGtXRjRrRlNoRnBH?=
 =?utf-8?B?Nzh5S0hGOGgrbjhkTE05YW1ZTGs1MTdmNjdDdEdUMzJITTc3RmdERGJVbDAv?=
 =?utf-8?B?eklwaGRycGozM1FqUHJNME0xMmpLVEdLRzg2YzZkdU54ZkhyTnlBVEFMSVRL?=
 =?utf-8?B?L2VJTUlXVlRVS0RtV1h4Q2x4bFFFSlU2WmlOcjdKY3VpNmRqK2xmOGZpeG9m?=
 =?utf-8?B?WFcyRzVianlrSWovUlBKbjdUMHZ4UkhzbjNvc3pna3NCOCtkMWhLV2prSHZK?=
 =?utf-8?B?Z0ExYS83VmkwSXNVVzFhbldyT3BGSmRpQW56bXNQd2hIdHhIdzFXSkhiZ08r?=
 =?utf-8?B?S2R6ZzIzVGh5WStMZnNyVUhibGhrRk5iTS9YTHg1NU5MTVRhblcwZHNMRS9P?=
 =?utf-8?B?ZCtOS3lCOS9tckp2eG5sT3Badmh5S0FqdHNxTjVuK2lIV3E5WG14dkdKdkUx?=
 =?utf-8?B?RVE1eUx4UE45RGYzRWJ2TGJDRjJNcHZDR0FDRC85RGthZlFwWjBsNXFmRlRR?=
 =?utf-8?B?ditnZzFNdnFQa3I3YkJsWml6NnBDZFlmeTFnWHdMRHpBVklmcS9jZ1o0RlRE?=
 =?utf-8?B?QmVmanN1b3pGQmtMSEVzWlBWdUxBbk5LcXZTaFNWWi9mR1JDeHY1azBPbHVT?=
 =?utf-8?B?TVFmcWtQYThIOWVLZkUwTEozOU12MDIvK01HbHVXS05qVG9OU2sybWY2cEUz?=
 =?utf-8?B?MjlPd2hBUmdSVXBsM0EvajBmekd0QlZZTDZRMmdBWE1PRzBGeDJYeWg2TnRl?=
 =?utf-8?B?bjAwMmVvVktQQXR4VGVpQTlySWxJNGJBVHE5UTY3OVQ4Z2NYeHlqR0E1RWMy?=
 =?utf-8?B?ZURNR3pVQ08yVVZDUjVlN2N6b1pZWXZYRll1V0J1K2FLbXVoRHFZL0QwQjFa?=
 =?utf-8?B?OU11YXRvSEpTc1lLamRKWWZ0a3NRNktWbDRZaTNldlF3bDRyWkhHbzFzVTY0?=
 =?utf-8?B?amJhMUI1QVI0V2tiSFArRWJqMU1HZlNwbEZnalFUSW54aXdhUXZ5ajVXdW1i?=
 =?utf-8?B?Tlcva3psMDFydTJUTDZ2dlJIWTljdkhndWR1UkwzK2U1TWE3bnhLWi80VVBj?=
 =?utf-8?B?TFM1bGZOcExrK0ovS3NCNmxpNkVNa0Uvb0phbWpxcjc3UU5jRUkzZ0JpeXk1?=
 =?utf-8?B?MFJaUUZJL292eGVZYko5QWZ3WVIvb1J5bElJRDl4a3BrZk1FcWNWWHB1YWNm?=
 =?utf-8?B?QmcvdkhnQjhCa3Rmc3JCSUpMdlVhTHhDMHJiOEVWTVVudEhlaHhQMkV4MHNZ?=
 =?utf-8?B?VU5kZmk5b09Ga2lVWVFBaks0OVpqSmk3NHlBNEZHNWdZOXpZdFBLdzVCckky?=
 =?utf-8?B?cFM4YmlKa3NiNFgxTjVXNXd6K3JFOFMwZmRRemlseUl6bjZUNVM2SmVYb1lw?=
 =?utf-8?B?ejczS1A5eWkrNlF4NzdleTA4M2Z3N0Q3QnpEa2pBMVJRc0IrdXBPRVA3M2Jp?=
 =?utf-8?B?a1hvSTZBZFpRdVZEYmg0TE81TUhXcGhaZndBOW15TDVKTkI3MDlxMUJGbDN6?=
 =?utf-8?Q?qdqBdRRRbLqm++E7YHBxBLXufCNuwYLeWEyWbMA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c02945d-ccdc-4353-eee7-08d8da24bba0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 07:04:17.6092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: New+hXcmh95T3R/MwZsF35rBjzniOim1v0FereI7sbaT+r+1oscAMwJibo+DGwUdd77a6/B2XfyTh76pCPoouSvZfTTog8sBIlVza58Y/Go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4071
Received-SPF: pass client-ip=40.107.5.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_NONE=-0.0001,
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

16.02.2021 02:21, John Snow wrote:
> On 2/15/21 5:05 PM, Eric Blake wrote:
>> Break some long lines, and relax our type hints to be more generic to
>> any JSON, in order to more easily permit the additional JSON depth now
>> possible in migration parameters.  Detected by iotest 297.
>>
>> Fixes: ca4bfec41d56
>>   (qemu-iotests: 300: Add test case for modifying persistence of bitmap)
>> Reported-by: Kevin Wolf <kwolf@redhat.com>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> Reviewed-by: John Snow <jsnow@redhat.com>
> 
>> ---
>>   tests/qemu-iotests/300 | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
>> index 63036f6a6e13..adb927629747 100755
>> --- a/tests/qemu-iotests/300
>> +++ b/tests/qemu-iotests/300
>> @@ -22,7 +22,7 @@
>>   import os
>>   import random
>>   import re
>> -from typing import Dict, List, Optional, Union
>> +from typing import Dict, List, Optional
>>
>>   import iotests
>>
>> @@ -30,7 +30,7 @@ import iotests
>>   # pylint: disable=wrong-import-order
>>   import qemu
>>
>> -BlockBitmapMapping = List[Dict[str, Union[str, List[Dict[str, str]]]]]
>> +BlockBitmapMapping = List[Dict[str, object]]
>>
> 
> Assuming iotest 297 didn't yap about this, I think this has the necessary power for this file and we don't have to work any harder.
> 
> If in the future you try to treat e.g. bmap['persistent'] as a particular kind of value (string? bool? int?) mypy will likely complain about that a little, saying it has no insight into the type beyond "object".
> 
> If *that* becomes annoying, you can degrade this type to use 'Any' instead of 'object' and even those checks will cease.

Probably at some future moment we'll have generated python types for QAPI structures ? :)

> 
>>   mig_sock = os.path.join(iotests.sock_dir, 'mig_sock')
>>
>> @@ -602,7 +602,8 @@ class TestCrossAliasMigration(TestDirtyBitmapMigration):
>>
>>   class TestAliasTransformMigration(TestDirtyBitmapMigration):
>>       """
>> -    Tests the 'transform' option which modifies bitmap persistence on migration.
>> +    Tests the 'transform' option which modifies bitmap persistence on
>> +    migration.
>>       """
>>
>>       src_node_name = 'node-a'
>> @@ -674,7 +675,8 @@ class TestAliasTransformMigration(TestDirtyBitmapMigration):
>>           bitmaps = self.vm_b.query_bitmaps()
>>
>>           for node in bitmaps:
>> -            bitmaps[node] = sorted(((bmap['name'], bmap['persistent']) for bmap in bitmaps[node]))
>> +            bitmaps[node] = sorted(((bmap['name'], bmap['persistent'])
>> +                                    for bmap in bitmaps[node]))
>>
>>           self.assertEqual(bitmaps,
>>                            {'node-a': [('bmap-a', True), ('bmap-b', False)],
>>
> 
> 


-- 
Best regards,
Vladimir

