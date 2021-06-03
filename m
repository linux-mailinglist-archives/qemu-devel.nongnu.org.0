Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E527239A07B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 14:01:55 +0200 (CEST)
Received: from localhost ([::1]:49086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lom2s-00016t-Ts
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 08:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lom0K-0006mw-6Y; Thu, 03 Jun 2021 07:59:16 -0400
Received: from mail-eopbgr50098.outbound.protection.outlook.com
 ([40.107.5.98]:57415 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lom0H-0000UQ-5G; Thu, 03 Jun 2021 07:59:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glq8Qg2IGfJjUOGAo92X7lgyOjViDfrjq39ggXZeHOEzxkJ9HxCxvDvtEa7RSqFaVnYj47rmngHsOCbtdWMowM6stL/TIRQxZCIigPgMlNaHWkpbxBl89Ooa31ygMatiPnx6adqgTOlG/02+f9m4oOotzMvqha9sog/WJYZlFIvWKhLvBiFO8vLqFAEYUl1korEw/k+2fT0/Fnqtxv8si1TTxBrQVccyHVoHRQI/jFb9Tm49kbE3/51P0ddQ2eSeKeoIw9obL0H9BWYZAxuJYospQNyJYy4+26Ert8/AsiVvyskvr3RrjUe8xurPFVgxCzzcG73U7j6PWLoDyI14mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x39PPpM+CdTqo2CEKd/Gj6DdqS7VjA8IhQp803SPdKQ=;
 b=PMETKe36okPN11Pv17bmSKzErMIUENsIPyvdqEyYXpWCubwu8/bdhDmAmIeI//s/cA2bS1M/Q0mu/0uZdoX7OZrxOFdAICNW9RyfoRGgNerDK14/TloBLNFzC1KguMzPKVpeSiFBmmz6/9p6oFTF8QgIAAZb/K0v/vGZrUefQBjOrrFW5ajWY7OjFBaAcLkn0UBoCEqyC0+JG2sqNoXIqtnlTkkTcvVduzolwjtkYwZ+cGmHpTDoLYgXf9dGZMwTActrU4RbmW07Ss5HCgF4vMg7AvkJoh6bBvlQRLDGAydsfEKFXv1gmutcyTYiQjI+QDrqzPP41yr3n8wzVdOtNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x39PPpM+CdTqo2CEKd/Gj6DdqS7VjA8IhQp803SPdKQ=;
 b=o9SV1xfIp8ZLWd87Hl5NbEMkoqXwwIMe0pZvorGtVGTqrS86WShnxjvK2ODtruyDi5HkR0rwTaokJ3WIhvgjP5z6GuMcSbNm0oExelC2QhBibOcoZTnImGnTOlDxPojJRnHGdYvytbz1EUY4pa2utNFk/MoVoXi8ndPZ/hm34s8=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Thu, 3 Jun
 2021 11:59:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 11:59:07 +0000
Subject: Re: [PATCH v3 13/33] block/nbd: introduce
 nbd_client_connection_release()
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-14-vsementsov@virtuozzo.com>
 <20210602212714.qqduut7ifmoconfo@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6120a448-0b32-4a36-6b74-909b52d50025@virtuozzo.com>
Date: Thu, 3 Jun 2021 14:59:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210602212714.qqduut7ifmoconfo@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.243]
X-ClientProxiedBy: PR0P264CA0090.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.243) by
 PR0P264CA0090.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Thu, 3 Jun 2021 11:59:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67a0c625-84cc-46a1-d1db-08d92686fdbe
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB171384E8BF8CC6A209AD19F3C13C9@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gfq58XW1j2eDE6/mQsPuUG6/nytfdRkFYcVJj+0q8LSGP4EX3/eLtv1xlZXsTGoH+ic74Mlpa4POPkv3yI3tohilxZm6EOptbXPLBvozRgYhN8yFbiSB8/pAhl6y701wAJXpfTRpHuFrgN+c9cY+RijPEgYG5+ZkJj5JXYa3Ni9fDnhOskCpgxm+UP3AzDQUMNYxJTjlcfVPIluUs5SaqdZ/JtcuqXAXOCRBEZkA2TtEcsnDuc4We63l6xY/L5yUG5bj6TJYE4HywWhqKp9KsOzLOJVhhEthjisV/bCIfW6rAI2I2eoPRogsy7bNWVEZZRu9ZN4eoc16BanCfJS0DRrdRX+5HjzVqoea95KI3euhHTWi7C4F6wCImJWys9HSa8fWehFtJ0+TEiK9m87yjlxqoEa5Drk5ahWy07fi3binWpBLr3QM8cBz0uituwFXsOUej1Jv4DI+rh04HePvhaXFYqBVWYLlNDQfXoVyW1aVtXVbpQPNSvaQCwz4NBiIFQDQ4zYHWVohMRpYbwEAweM7scBqGDfZ4yIUsTfRHDgulZ5DCWCYAFmC1mz+WdNCajA7nQtvSEbN8fvvGQ0EDk8r6ffQ378mgVGPFw+VIXEamtyHYV4KroYgmF4ABCAaYpODpQEdWBkuMGU3V+qT/wy5M4wkYEdXl9/mrzxjDpesu6khVQ6juYshuEAq34OATy2tXNQenrv82wnGOSIpCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39830400003)(136003)(376002)(86362001)(83380400001)(8936002)(2906002)(4326008)(8676002)(107886003)(16526019)(316002)(186003)(66946007)(5660300002)(36756003)(2616005)(6916009)(26005)(52116002)(6486002)(956004)(31686004)(66476007)(38350700002)(66556008)(38100700002)(16576012)(31696002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bEFVdTBHZXdTNklYQjFUTmZrQUJ5YVZnS0tLOFhDUHpFaWQ4NmZ5a3UwK1N0?=
 =?utf-8?B?L09od3dZNXNyMi9zeFRYL2FCVjJ4cmIxRkxFSUNuL0RoSVFONURjazFQYXlh?=
 =?utf-8?B?SCt1RlAvUFFTT0JPUmllQ09TejdzQmNjS3NvQUdSSGtzTmd4NXdBR3Z2UE9C?=
 =?utf-8?B?YXNzMlk2R1dDZC94YXlGeVY3ZDI2bDM3RENSa25Pczd4MFJGWFlhc0d4UURU?=
 =?utf-8?B?Tm15d0wwZXdJZDZZK2R5V25kdlhjbDlVdnRHa0dmUHdkWCtZM1BFRW9Pd1VD?=
 =?utf-8?B?a09sUHRtaDNRRVVycXhKNHZEbnZPYUYraSt5eGM0MExPeVlyR2pPZi9Oekhm?=
 =?utf-8?B?WG5BeXhiZWhGTEVsV3NoVDV6ZnB0Q2tMMm1lei9pMUNKQ2ZTU2VrWFZacEZ6?=
 =?utf-8?B?THpOeTRFTjgrazVsbThXVWo4ekVDMUFEa1VERE44YTdFM0hWL3h3RGF0aVdw?=
 =?utf-8?B?VFNqemdDdGZhb0c0MXp4K2JodzV3K1IwSEZ4RDk1cytYbFZLQWtGQktRNGNG?=
 =?utf-8?B?RjF2MHlSV2FXM25MR2hZTkk0MkRZUU1hNDdXMU1GQWJScjNnUVVtcTY3bVdr?=
 =?utf-8?B?d0E4cEU5Y0xtSFc5RHF0ck1GRG11TTR1MW04VUY1cDBMMW9wUjJ2VVhUbkVs?=
 =?utf-8?B?R0RzR0tVd1J4WmVJdUV5MXRnSVErMDVUUGdrWm8yTHc2M0x3djNOamRDelNW?=
 =?utf-8?B?Kzkvdm5WVnpoWkx1TFN2M1VkOFBTR0JXaXpmT1NzUVVWMnhCbjZSSHFZRjdj?=
 =?utf-8?B?ZDNSejRJVStSdDBEU3RkREZZSk01ZGw3b1IxT0kzNUFnZ0JRZHF3SE8wYmlt?=
 =?utf-8?B?MVNsQTZ0cEZMZnRhWVRpY2VxSHBCSkJnT3Q2ak5obERlVnV2d2ZQTGJmZVhm?=
 =?utf-8?B?TTFWY2t4anVvekx6UEg5UjhYa1haNHJBeE5wbG1BM3VjdmQ2MFg0Y01JZTRl?=
 =?utf-8?B?QmJ6RFEyMmhGQ1gyZTdFb0R3QzdJeUNiYzU5djExWlV2VFVKNi9MVm1nRkFV?=
 =?utf-8?B?OElEOFQyU0pDVU11ZlZhWTBYOWZwYkMwWHZUQ1h4Y2FJMTg3dGpsdzJNdkhv?=
 =?utf-8?B?Y2ZxL2hyTm5VN2hyOGpZRmhXVDJYSlVVd1RuQ0RYamJqalo4b2hzdFpaTXdN?=
 =?utf-8?B?MUNEQ3k5TzRvSXl3NlJlak9GRUhrK1B4RVQxQ2tTaXQ3aFU5bHRhQzRJMDJW?=
 =?utf-8?B?SWllcGNqbFV6alVtOGFNTGNZWFlwMGdVeEZpcW9pN3lBOFlTb1FzREdQL0FB?=
 =?utf-8?B?UXh6V1NkTEpIUXRESjh1M0Rid2R1YmtoV3c5RzEvOFM0UXlzVnNJOG9vbnV3?=
 =?utf-8?B?S0FlOEVPUHlzSDd5QVRFNTNzalFQTEh4MGlhMFMrR1pOdVNzUzI1MFZPcU5Y?=
 =?utf-8?B?NWlROFhvVUt4aCsveWFhYzQ0aWRLZ1cvdW94S09XM3ZJY01zTmVDTnRkb0lm?=
 =?utf-8?B?Y3ZiRmZpWkdMV1BoKzVlSkRxcEhYVC9Bd0tTanRWMUNHSEI5YUtOTkNoSkRz?=
 =?utf-8?B?SmE0dXdZTFBKNzMyamV6YTJFWHpTcU0vaDU2TlE1MVBPbFlDQ3J0VlRyNjNY?=
 =?utf-8?B?Y3F2YzJ5ZVBIOEFRaEoyeC9iNHFnSWF5V0RsalVFZFZWTC9ibHlSL0JFV0dC?=
 =?utf-8?B?ZzNFeFpKUHRBcnRLQko0ODZseG0yV3VDZWlxRnNZNDJIMlJYZjdyTEIzZ1Fw?=
 =?utf-8?B?OXVkbWVvMUNlSi9KV2k0Y3pHcU04WklST25lL0cyNk9TRDBqaE5RODdrT2Iv?=
 =?utf-8?Q?mjQHLNhV6tw/deA5eeAK1tydcv2/6OMEcnupkrX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a0c625-84cc-46a1-d1db-08d92686fdbe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 11:59:07.6868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isIa9w7ltEh95xyXHt501c0loG98uYHfVQ/bEoBn+WWpAV+DvzfBjd4FtyypMxRga+GC3NY4+pecOd3pGm5HmLY5B5ApcY2Tb1KaDpexOII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
Received-SPF: pass client-ip=40.107.5.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_NONE=-0.0001,
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

03.06.2021 00:27, Eric Blake wrote:
> On Fri, Apr 16, 2021 at 11:08:51AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/nbd.c | 43 ++++++++++++++++++++++++++-----------------
>>   1 file changed, 26 insertions(+), 17 deletions(-)
> 
> Commit message said what, but not why.  Presumably this is one more
> bit of refactoring to make the upcoming file split in a later patch
> easier.  But patch 12/33 said it was the last step before a new file,
> and this patch isn't yet at a new file.  Missing some continuity in
> your commit messages?

Seems like one more small additional step after last step )

> 
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index 21a4039359..8531d019b2 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -118,7 +118,7 @@ typedef struct BDRVNBDState {
>>       NBDClientConnection *conn;
>>   } BDRVNBDState;
>>   
>> -static void nbd_free_connect_thread(NBDClientConnection *conn);
>> +static void nbd_client_connection_release(NBDClientConnection *conn);
> 
> Is it necessary for a forward declaration, or can you just implement
> the new function prior to its users?

Hmm, seems it could be easily moved.

> 
> At any rate, the refactoring looks sane.
> 


-- 
Best regards,
Vladimir

