Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB0C589ECA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 17:38:08 +0200 (CEST)
Received: from localhost ([::1]:54972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJcvH-0005HB-Jx
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 11:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oJcpO-0000RG-1S
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:32:02 -0400
Received: from mail-eopbgr140103.outbound.protection.outlook.com
 ([40.107.14.103]:8887 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oJcpL-00006v-OV
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:32:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNtKsgMgFrBGN43ndS/gvERn2KZTWaXgVyG9w2JNMKCAWiVPOG+95GElr7SS2Uo4x8IlRcPQXSy+gOO5JI1kmj3CGLNf4qfied/45plm+Sb+IUtrATxq88XXPzqfdQLUv5UBew7l/RzVUM+WlWYi6mu/i+3P8PSGHjCfByIspHonRw/Njn64iKBBEZJxHIlogCumXSXCQEliOieLgVQfQ1A/d15pLpUBcYRyWPRoFz6+Yu4+OSAvsITVoDtUNxwmtpal5jUO+hNaU3iB9qnYlfFX/0Vb+SbPLzQgHYdoogXvhConZiIwiypiAAXMgaiAU/Olq2wVDTm4+N9QqYC/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0a3GAxciPT7T10pMRKe7Cb8glPbwJ2J8PtfAn4n8aI=;
 b=bPT7jGcSOM7exBCpX8uvIGehKm3x9aWL1RDbaEcNJTaMz9U1THEjPE6ogPRKu6yzD7UNy/t5WqlHmwqY+vRVdndx/0tTqdVLD1r7NKJ+t1nJmyMMXxtngD4v6eCycNrlMxSsuBqjMMXT3UOHOOwovjyljfYlw3JOnv5giv/1y9+n9Myk57TqGJlDno2B+mQR4L/abFDmTtKEHgiVGR74dccmgmkBrj4upLpYUEDVObHfdzQ2TbCLKgwdN5KNcVy50GOpii0fVVRdjjUriwtr225A8QffDC7IOGJps3CTRhFEgBmeUNePuK1YgD9yAoC/g3VTdoxnqm7m0an7aZIBRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0a3GAxciPT7T10pMRKe7Cb8glPbwJ2J8PtfAn4n8aI=;
 b=BL3muKrWTbH0gqCqiVkZz/hYqfpr++yAvuv5zSlC1C7ewUfPaucqJVa2bMdFBj+Pz+WF0kmDhK042U7077vbUPf/iCdFuxFyqN397/ov2p2mfDdvqmuMYDGnka9aPBlbQCLBRow6Q/PVk9AaTpQ9+wnSmbibYFmch8VvX3wimniqn6jVPvjjyfUILfTwwaCYk/xQ9ZsrBX2QLLmzvmYAAsvFTrLvrwqwAt3WHlkCmQDsldNLmVHznuqfKGtFzgeJ86TNqR3hxHf/2BmqH4Jg/8OvgPf/DMsfiA/mH0cDPcK8QvpOipI2ufx/FbaBFd9VeGCHzvKa0NUQkM3XlYk9YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB6PR0802MB2581.eurprd08.prod.outlook.com (2603:10a6:4:a1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Thu, 4 Aug
 2022 15:31:54 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 15:31:54 +0000
Message-ID: <9677756a-8a26-442a-3222-3d547afea797@virtuozzo.com>
Date: Thu, 4 Aug 2022 17:31:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] Check and repair duplicated clusters in parallels
 images
Content-Language: en-US
From: "Denis V. Lunev" <den@virtuozzo.com>
To: alexander.ivanov@virtuozzo.com, qemu-devel@nongnu.org
References: <20220804145200.564072-1-alexander.ivanov@virtuozzo.com>
 <ee4ed965-74a2-97af-bb60-91c1f97ab361@virtuozzo.com>
In-Reply-To: <ee4ed965-74a2-97af-bb60-91c1f97ab361@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0501CA0041.eurprd05.prod.outlook.com
 (2603:10a6:800:60::27) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecfa03b2-f7ba-4823-ed8b-08da762e75d3
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2581:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nKoPFTd0/aT82YnPacMllpI1PDZF/xTgxStBDD6HQmDV7qAEP2H/LeeDjSKs0E/qrGT9QPh2FG1Sn3Hwr3BMagyYCAfRMsJuH3Xk/Pdn+0q3MubEX68ZcqQfo6fX4nS3g0Qx/X0rAWVuzkkQLa6rIuvA2b0u/2R4tXp38dY6Ql38soG6rlfLAWhHfQmnu8FHtf86wtZSMz4iwHEDWFpdfaKJ3jyxlET1cTBg2fINihScC5yNUYlsG7bXhDY4SCBtqYoTDMOBU86VACYSCPTHI+7DB9cF77dpj1iSUN1vducw41XKAyeq3xk79MpiDsvrdbNPJ2inH6MhzMHCdCyVQ4mCp3J+5J/X+IDLOQuh66BBnd/kacbSsUnnQguIcDq5bDgq/awUCd9UHUkZdV0pT1SMrk34TRDrnsk4pTkdK1Ss67CFdhnUAECbf+IHPvSQg0fLJBEE3z2VtpB9ou36Vz7h5ajbTuY5CRrWaFBN2tasAnyjcBKIMxD8AkSQqlXHhzYqziilkCFom8WaeJYqnrdKiyUT2h7So94YQwmMjqfh9NDv2y6GNOhEVzem3qeTXLFuDoewiz5EK/nw70H5drhVRG96h7UkafTFnSkjJtjCwhUUlAFeYAhpJoUPgJ2RkuIEmHdNFVCvJwbRFVet1s1ERO4TzK7pf2H/n/o0Vj/GGmSuhJxJWwhz4BhfXduw1hqFFZYetjHIooD6uzagbA/d/60Lt36p+Y0m3ytm10gNAvdiCBm0x5MOmIJsMoZOOvGy4coFCRKjOTBhSXWve/Vw7Q6sT6tUAVrHCcmJF2oYODspt4QA6KzaF3QLcA1JbaWUZxswXHKEHlFzJND4OO1dzn7Xmt/46/AFN6SbvVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(376002)(396003)(346002)(136003)(366004)(38350700002)(36756003)(31686004)(83380400001)(316002)(38100700002)(66476007)(2616005)(8936002)(478600001)(53546011)(8676002)(6486002)(5660300002)(186003)(52116002)(2906002)(86362001)(31696002)(6506007)(6512007)(66946007)(66556008)(26005)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVFrUk5MSER6V3N6RGtFcHk5Tk5KVHI1QjJvZ0NDcVZ5NVdRekM4M0ZyKy93?=
 =?utf-8?B?UW5DVU5UOWRuWUpPdGFULzlJWmhyWmphd01kUks0bERBa25FSE5pb05QcHhi?=
 =?utf-8?B?dkRPR1VyazRPNkhTQnl2NzJnbGxOaEp3R3QreGhOakw5UzFoRFBxZGFaOHdB?=
 =?utf-8?B?V1hHNDhlakpadGQ0WEF6TG1CcXpDQkdLRzRNN1ZNbjlNUlkydVlsRVRYNGVt?=
 =?utf-8?B?ZjhMaUZkQ092N1Y2RDlOeE1FWnJNY1J3S09aZGxEWlNJZ0hFV0F4bEVsTmpq?=
 =?utf-8?B?cXBCYmVEOXVvTnRCbVFMbzhMczI1dTN0TFlzejdza0o5eUhvYmJtWlF3N1N1?=
 =?utf-8?B?Z1Q2WVNPMWJpZlc3azhrZHZJRDUxWE55aGJCazdGYS9rRm5EUHNHKytCbElq?=
 =?utf-8?B?RUNaeW1XQmRaSXFGc1dTN0pBQ0I5enBQbkNub1c1WUJxUzhOQ1ZkcFpZUHIz?=
 =?utf-8?B?TGpGK0tmUSs3bTJTU0hMZUNMRUtrY0RWR3hiM0RWQ09hcEdjRmNxYkMwNDhN?=
 =?utf-8?B?eDdvblFlY0hWN3REN2JZR2VQUjlPSWlLalpJcyt2em1TbTE1U3BWWS9YazF0?=
 =?utf-8?B?WXVvVmhxNGJWZnliK0pvUHFTampYQjB4blhhQXFrM0pyVFBWeVg1VGtJUWpL?=
 =?utf-8?B?RmpXNFpGVmE0Rm4yWVdzcGt3azIvQjdKL01qVGlESk45WDZmSlR5anQ2Rkwr?=
 =?utf-8?B?Nlp1R0lzZzlCVGJUT0duMUJwYnMwaThHOElNNjFabGNBZys3aHZtVlNIWTV4?=
 =?utf-8?B?OFJsZWptQ1duNVFBUUR0a1psTDkySXR6Zjk0K0M4NEM3QzFpSnFpcE14NnJm?=
 =?utf-8?B?Z2NZWDYrSjFNZmRHQlhVNmhJdzY4YzBPKzRVM1RwblI5Z2Y4UHl4QlFLT0dL?=
 =?utf-8?B?UitYWTRNN3kwY2FvSHRINDBXOU5xRnJLaXhIdFBhTzBZOUNmOFJ5bEhUQlhB?=
 =?utf-8?B?RmkweTdyUUdNaWlGaHE0NzJkT1lvNDZYR3lGM2ZuRkpLU1k4TXNubTZXanI2?=
 =?utf-8?B?eWthcm5sT3pDSm5NYW5pU2RMVU4vOWVZUHFWa0FUclU4R1JRck5JR1htbitN?=
 =?utf-8?B?Q2VQTy91aENmblFEZElJcTNQaHpJK2Fad0QvK2tEU3kwaFArMkhZNkN6eWFx?=
 =?utf-8?B?WkRXM2haNkkyUEtBR21qVjkvVGpWMTdzRXREVWlibk0xZ3VicXVWa3FtQld3?=
 =?utf-8?B?bFB4eXV6NVJDYllvRFhMeUl6RzJNdWphWXUvcmk3TVg0YnhycmM0ODl1Yk9m?=
 =?utf-8?B?YnVVdU9zTmVSK2RRcmgrNVBIbTlGWEU5dWZRSnR5YVN1SWlueDFEUzBMU2ln?=
 =?utf-8?B?RHZDNnVyUW1QNmxMVFgvR3VSQWdkb01hWlNwWTI3eXNIeVBZNndRYUFjR1Rt?=
 =?utf-8?B?SisyKzFGOFVlTWxhOG1WSTdQNElxekxtSW4wcVBtN3pKRVBsWFRCSy9CQUxK?=
 =?utf-8?B?NS9RSmV3aXBJVWdKbFNyMlozNEhlRUQ5UEdUTEYyckNqbHZjcTA3NUxVaTVp?=
 =?utf-8?B?azA3T3pzVXJUaUlKOWptZWRkR3ExeW85QTloL0piRUw1eEFXNWRtYlE1WkV1?=
 =?utf-8?B?bERuVFdHMkttS1MzbThHRkpQdEtOZW80Zmx3bUpMdkl5RFdhMy8wRWJGTHdE?=
 =?utf-8?B?WStOMHdmY0VxMHVONkxzR1JPclorcmtzMWhOSkwxNDBQYnJwN2FERzFhVTQ3?=
 =?utf-8?B?U3JObGNwYmluYk9WUDFXQWJzZEt1ajZrVnMyUVk0OHlJSXJhQjFWOE1vV0lk?=
 =?utf-8?B?MitHYTc0RXljQjI5ZEZPa3J5dllxYmI4dEx5R3JURlVSVDl3eFFkbFh6bEJk?=
 =?utf-8?B?ZlJsRi95aDZBSDBEMUlpeFFVeHhPNFV2OGV3MHlvUm0wY0h6RHRabE5aYXdL?=
 =?utf-8?B?bE12NkJ2WVI0Sngzd0FWOU52MG9pM0J1MW5zYm9FejVmb0ZDSDBUSHpkeWEy?=
 =?utf-8?B?blR3RktOT1hkSDd1WXZzYTlibldOUHc3SE5uMVlCR1lOV0V6MWlJSjJvTlZ5?=
 =?utf-8?B?ZG9YOHV3SmErajBEcnQzQmJQOHZhNG9PNDIzVDJ1UVRvNEZaT2Zza3dqVFhU?=
 =?utf-8?B?YzBNK1BpdjVoZW5xTjdReXp0em9waG12UjcvYlE1Y3cxejFoZERPK2hPSmdM?=
 =?utf-8?Q?vFCgrCZufRdoRVctftP8tHim6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecfa03b2-f7ba-4823-ed8b-08da762e75d3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 15:31:54.5148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnuyBtswYFocmyIFvQDcKGiQN7D1fGjz5p77XaHJAcXzDg9wlpSBRV0A4r+C3fxKqAoBorPE5xLc0foqpki6+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2581
Received-SPF: pass client-ip=40.107.14.103; envelope-from=den@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

On 04.08.2022 17:01, Denis V. Lunev wrote:
> On 04.08.2022 16:51, alexander.ivanov@virtuozzo.com wrote:
>> From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>
>> Parallels image file can be corrupted this way: two guest memory areas
>> refer to the same host memory area (duplicated offsets in BAT).
>> qemu-img check copies data from duplicated cluster to the new cluster 
>> and
>> writes new corresponding offset to BAT instead of duplicated one.
>>
>> Test 314 uses sample corrupted image parallels-2-duplicated-cluster.bz2.
>> Reading from duplicated offset and from original offset returns the same
>> data. After repairing changing either of these blocks of data
>> does not affect another one.
>>
>> Alexander Ivanov (3):
>>    parallels: Add checking and repairing duplicate offsets in BAT
>>    parallels: Let duplicates repairing pass without unwanted messages
>>    iotests, parallels: Add a test for duplicated clusters
>>
>>   block/parallels.c                             | 112 ++++++++++++++++--
>>   tests/qemu-iotests/314                        |  88 ++++++++++++++
>>   tests/qemu-iotests/314.out                    |  36 ++++++
>>   .../parallels-2-duplicated-cluster.bz2        | Bin 0 -> 148 bytes
>>   4 files changed, 227 insertions(+), 9 deletions(-)
>>   create mode 100755 tests/qemu-iotests/314
>>   create mode 100644 tests/qemu-iotests/314.out
>>   create mode 100644 
>> tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2
>>
> the series itself should be marked as v2 indicating that this is based on
> the original work of Natalia. Natalia should be in CC list.
>
> Also list of CC persons is too small, pls run
>
> iris ~/src/qemu $ ./scripts/get_maintainer.pl 
> 0001-parallels-Add-checking-and-repairing-duplicate-offse.patch
> Stefan Hajnoczi <stefanha@redhat.com> (supporter:parallels)
> "Denis V. Lunev" <den@openvz.org> (supporter:parallels)
> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> 
> (supporter:parallels)
> Kevin Wolf <kwolf@redhat.com> (supporter:Block layer core)
> Hanna Reitz <hreitz@redhat.com> (supporter:Block layer core)
> qemu-block@nongnu.org (open list:parallels)
> qemu-devel@nongnu.org (open list:All patches CC here)
> iris ~/src/qemu $
>
> Additionally, you should list of changes from previous version
> at least in the main message.
and generic note, to think.

We will add more and more checks. Should we start thinking on a better
code structure in parallels_co_check, f.e. we could performs each
check in a separate loop in separate helper and calculate statisctics
once all checks were done.

This is just a quick note, but I think it worth to keep this in mind.

Den

