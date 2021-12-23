Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8775A47E519
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 15:47:33 +0100 (CET)
Received: from localhost ([::1]:43658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0PNU-0006C7-2H
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 09:47:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0PKW-0004S6-Cv; Thu, 23 Dec 2021 09:44:28 -0500
Received: from mail-eopbgr130094.outbound.protection.outlook.com
 ([40.107.13.94]:7041 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0PKT-00054f-GV; Thu, 23 Dec 2021 09:44:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIow34IjGbNar2BhWrIw3nUHMBH9xZiUMnII9ikMNaJImIIwBH7uLRDHMYKT7fWw+LhcRKwt6Lt/nXMMZ81wb+GcY5SwNR2ZtBzWLCKsbr5EDCqHA8z6jQsbpvBZnEUiQWV99XILfkSst8dGfW+Ky+LEUir7hh0irM4y/oJirUkuDGjPr8x1mSgNNqqblGq6CFd4mvlM0pwkLPU2q1dKvMgxkh2H+2EWR8s9xqG0E56GRAdEeOQpwja7Op1PnBlB2udjO8I6CqgzKcAhkO4H2mdd/TUZjH3W1/+ymFXnbrvZYFWQNIakKV06VEMH+iMc27IOXNnH/8N/QBearljSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJJAcX+sPucjKaYkH5KiNWGyrYuMc15HTzEqbWKsV60=;
 b=eaAHesB/uhg8fdpVnEUN8UCxlR3kjx5r0JDxbDFyEWJX3Qx7NOiKoHGjWRqhlOwdGmbtS7cH6dpBOCDt6pocojTEnhsnHxibE3mUarEyz3j3J7ntZLLBQuY3XHqLeZ+14Kt+QI18qQ0ShFa1YJqsJwebbH8HhFPWMajqvWakNgVox9Rgh3xZ/syTRYCC04pTNWjAXI/dsVza4C5xVw45r/RD86RgMpr+5/4kbNr1Mmjv6pM9ws9FltJL4VzzGS+RHgbrc/d4lJAPj0HJMxfjuAKQXZv9gy346xIPDSrZJcDBLsRHCCAvOL6pr7oRbAXJJ05xDXOleRLCBwovtsdsaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJJAcX+sPucjKaYkH5KiNWGyrYuMc15HTzEqbWKsV60=;
 b=C47dgtCdwDYyXLn0f7bk4eFY6m271lZBNIfEY5EwpjlP4FwlURhL8lpqBgIqeIdf56xS9GNV8nga2VwJieW6HwmwYDSVwX8rn5Gk8fhSvwvFPNfeZZQUlaWc1qmW3O+xQOsCv4MQEKDq0vJFsBSONfI3fMvmGPRJvJZ7xe/4IRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB5395.eurprd08.prod.outlook.com (2603:10a6:208:188::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 14:44:21 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 14:44:20 +0000
Message-ID: <96899f9f-88ee-bea2-0839-a1e3b10222c2@virtuozzo.com>
Date: Thu, 23 Dec 2021 17:44:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 19/19] iotests: specify some unsupported_imgopts for
 python iotests
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, jsnow@redhat.com
References: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
 <20211203130737.2924594-20-vsementsov@virtuozzo.com>
 <d7f70d12-7fe3-ed2f-9959-79a86cf1d4e6@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <d7f70d12-7fe3-ed2f-9959-79a86cf1d4e6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91d5b5ac-44e4-41bf-cdc0-08d9c622b445
X-MS-TrafficTypeDiagnostic: AM0PR08MB5395:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB539587EC016A6E8101A7FCF2C17E9@AM0PR08MB5395.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OXp5gPu4oZEQVZZG5VGi6a0WOptCwgM51bQbSq0A0+hhycSLyX11LaGulj7tWsBh4h5sNRP13dHF1ma9N5bmJpsHcy2a8nJRczDV4yhJKb8HnFvcbtvdP2tXgnj7qP1ucD/A83CPJ9GIQdFen+wDcauQdQbeHN47xUrIWqZDKfGBYzJO1Uk2fM1YjKYpuNuEFQnLBSzfHsjw8A2allBrSdmUyrGZcxcthWxwMX03RAUkRzaxdLq9+6507lShcg3pbVYIsKf6pGSiSxo5s8IgAQppmGBomfScPZtJvi28sI7I4k/jybFTdGM44PATpfnUvkQ5MxwReOiNFkD9MD7UcmTMphrPJWJOhfg+wCUc3Jnzbwazk1qXZPFHdv6pksh0z9XsvpuMbW0wLkyoNPkxcl9cGbfwJZtkH8ZnwAnFFuwEZ3+qcp3J02yFLPVxzgll7m0nsaSBOzGUZilc8dLxVTA6v0YRHUHyv0lb0FNZVymRptgHTgd3m+jnAt27bF0SZXQMY80O+KExhe8TP22jk2pyU39if6MejIseaSNMTTgrzLmPl8WNaagLPQ6sS6tdylbyehVOYxCrrLX3YYEb5Vna5JzWqRdKxhJqfNbMbDj0Htxi3ciV+CtThTuSr2xXV95qIqN9mSYTWYB9hZab4JDUF0qBi/7dbQtZeGiGn74OHzQ2herFvBYvQ9CRGD+p3UMNwRPOGxU7DabLUg76A/hqgFPkXf/MHMOzNTCXU+7gRU+owTnHFb4ni38Q/NWhlp0YNRbjMMuwswOUCnPdYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(31686004)(53546011)(316002)(2616005)(66476007)(4326008)(86362001)(186003)(8936002)(66556008)(6506007)(26005)(52116002)(8676002)(31696002)(6512007)(83380400001)(38350700002)(5660300002)(2906002)(36756003)(6486002)(38100700002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk9zQkZlQ09NTmdpOWdpaGtaRU94ckpvS3lUOEdYLzd1ejRzdVFvOUVmMXZ4?=
 =?utf-8?B?ZU1mL0NBdHZacHo4eU85cExJODBUUFhDeHJlRWl3Zm9yOTlzeVFpVEVlQzNK?=
 =?utf-8?B?RzNOV0VPbGhmVGY5Yjg4STQ2Vmp0QnVmWE1JTFRxUERTODdxUUVaZ1Z0MFlP?=
 =?utf-8?B?L1B0b0JSMkkxVzlQNFJWZUV2bC9YZUpTTjRkNWl4V05hT0d5bjY2dm96YVd2?=
 =?utf-8?B?ZUN0eThFd2xKdUFEQnRPbXBnZWFDdE8vdWY3THF3RVcwVWFUN3djaEU2YlJK?=
 =?utf-8?B?d01zV2dwY0NGMGdkZTFoZ2xIdVVMRVhDbitjUGVwWkx6Qml2VU94dXJBenBu?=
 =?utf-8?B?bDh0UkVqTEZtRW1ReU5oUGJhTCtBT0ZZS0ZHbXlhMnFBb2dnT1NFWi95SHRx?=
 =?utf-8?B?a2hiYkpITW9OOGhESkllMlM0NEwzZndqKzdMNUNJaVBndG9tbHdHbkNjQlAr?=
 =?utf-8?B?NEIxdzVWUmZ5QkRaeFIzN1B1d2FsU2gvSE9ObUVndGtNV29YbjM5djBzT09r?=
 =?utf-8?B?TCttNW1MT1VNT2dVWmhQTkUraVA0OUdlKzBzb2ZBRlRLcm8zaTI2TDVyZzBT?=
 =?utf-8?B?R3BXUDA1K2hjK2ZPeWI5Q09GMTFSZzg3K3N5aStWNjkyQ2tJaEQyK0tia1k1?=
 =?utf-8?B?bnJ1MlRrbFNEaGdpVzJiUGJ1NG5ZUVZuY2NXNWVLK1ViamtiVm4ydzVHeVgw?=
 =?utf-8?B?QzhnekdNTjVVbVFhUzlvUGRISVRzWFdRbkF1NmtMeWEwSHE1SU1MVU4xYzJS?=
 =?utf-8?B?c3ViSGdVa2pNWDhEbkMwaHYrTHNjaG1Nc0xQU0tUTElQT0l3SU1EYmdBYlNH?=
 =?utf-8?B?Yy9YUVRKNDMzY3MzUVJBTXUyS2VHN2h1azhrdi9wZm5sTmFnTHkxRDdTbU9U?=
 =?utf-8?B?NERZVnFWZmN0T2J3ZDhjRlVzSG1KajkrVjNsVkthSk9PU0xkd3YwZUtHd2pC?=
 =?utf-8?B?NENsSG5xT0tQRXNYNE5aYjB3K0hSamxWODFZRzI4VE9PN05uVW9YUGYzRFd5?=
 =?utf-8?B?VGlGWFdBT2NrYzltQTAvbjBFMXhFWWgwYmNBOUN0NVBTTTgxRGRGRmZrRGJi?=
 =?utf-8?B?WTZ2dkNaZGdiZFlPU2k2QnNyT09xSWo0WTh2MnFrM0R2eWx4RFhQQnFFT3J5?=
 =?utf-8?B?cklPMWFwcEtJMko4NlQ4aFZuVGxTK2VpaHhadmgwems3Rm41ZG85MTBXdG1q?=
 =?utf-8?B?UVV3NGdsZUNTZ3BaYVNnS0J3TzdSUXA5U3dRMk1NMy8rWFYvbmJSZHhkRHJh?=
 =?utf-8?B?QnphY0hWS3VDc3NSVjExd3lsWndJMmRjQ3VCSWZPZGVnQ2tJeUk4UktIU0l6?=
 =?utf-8?B?RDFGbDEwNTh1NThxR0ZTc053Umd0eStQZ2JGQVpCY2RCQWFhckhKQzhmK0hU?=
 =?utf-8?B?SVJMQ1IzMExZaTUwdjZmMFZtYkVkR2xFRXE2aFFaUThJNTh1UVUxeGNLSTkz?=
 =?utf-8?B?M0p6SE9BdmxidE53L01BV0JVMXpoV0RPS0dqdEZYY3cwRzdKMGVZY2ZYOHVB?=
 =?utf-8?B?eFVyckw0UDhQZEs4ZFgrS04xYnZvWlhvMnlSaUcvcWkrb3lFdDhmQ2FSM29l?=
 =?utf-8?B?YmFzcCtRVDRkUFVpbmNjOWZnUm96RTdqV1EyUDFKdG41cWgrNEVBV0ptTmQy?=
 =?utf-8?B?RmhTcHUxZkYwZVgyK1ZXTU5JNXZ2ZDdqOXBsdkJJSkhLc0EwVWNoSUhQVjZI?=
 =?utf-8?B?WUcrRk1mM1JHc3Nrb0VNMC9DbG4vVTNFbWhpVkw4aFZucmp3S1VaSUVGanNm?=
 =?utf-8?B?K0M5clVUM0Y2R0lnWWRtWlY5MTJ5TUU4WG4waDhSTzBvRGU2MlplMTNzQ3BN?=
 =?utf-8?B?K2M4eUJvUjFBakpQbmFtN0M5L0tCWEVuZ09HcHpoZG9hajcxN1RDam5yM1ZD?=
 =?utf-8?B?K1cwTmg3RUhtK29hN25kNERVSUhKaEgxZGZJU01Fb29pNlJha0dkdUxkbEVY?=
 =?utf-8?B?eEU1TFFyVVpLbkJSb21UenhnRXJlVkY3SVc5SUVUdGdOSk5teWpLYjdscmxo?=
 =?utf-8?B?M2sxalJRcnptRFZndFY3cXBHTC9YM3c4MnlGVFRSaERsNHRvNXlORE5BU1hD?=
 =?utf-8?B?MDBUb0JSTTgxbnN5WWNkWFQvTEYwQWRDajkxK3JUUGpYaC9wd3U5ZFQxelBx?=
 =?utf-8?B?OXVtM3N5V1ExSEhoZ0lUcHVqWFdCdVZtL2dkWlA0ZS9GM1VhRWNwdVlSL3Bv?=
 =?utf-8?B?SlZpbFora0k3UVNTT01lbkhHc3RjUXNqMlp5REJYOXRzU3BxZzY1UlFGeVli?=
 =?utf-8?B?ci95Nk5MMUNjR1EvZ2RzWUo0dlJBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d5b5ac-44e4-41bf-cdc0-08d9c622b445
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 14:44:20.8100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGSAW0WMS5QxK0RAye0DgT1nAfTYuPp7ZW1HPCl+xgfIBwNu3CqvOvBl+gdODdV5pQRiN3CDW6gtX+0OBTQALoInZXjpqHEuofDJAVWhgQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5395
Received-SPF: pass client-ip=40.107.13.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

23.12.2021 15:44, Hanna Reitz wrote:
> On 03.12.21 14:07, Vladimir Sementsov-Ogievskiy wrote:
>> We support IMGOPTS for python iotests now. Still a lot of tests are
>> unprepared to common IMGOPTS that are used with bash iotests. So we
>> should define corresponding unsupported_imgopts.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/044                                 | 3 ++-
>>   tests/qemu-iotests/065                                 | 3 ++-
>>   tests/qemu-iotests/163                                 | 3 ++-
>>   tests/qemu-iotests/165                                 | 3 ++-
>>   tests/qemu-iotests/196                                 | 3 ++-
>>   tests/qemu-iotests/242                                 | 3 ++-
>>   tests/qemu-iotests/246                                 | 3 ++-
>>   tests/qemu-iotests/254                                 | 3 ++-
>>   tests/qemu-iotests/260                                 | 4 ++--
>>   tests/qemu-iotests/274                                 | 3 ++-
>>   tests/qemu-iotests/281                                 | 3 ++-
>>   tests/qemu-iotests/303                                 | 3 ++-
>>   tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 3 ++-
>>   tests/qemu-iotests/tests/migrate-bitmaps-test          | 3 ++-
>>   tests/qemu-iotests/tests/migrate-during-backup         | 3 ++-
>>   tests/qemu-iotests/tests/remove-bitmap-from-backing    | 3 ++-
>>   16 files changed, 32 insertions(+), 17 deletions(-)
> 
> Few of these tests look like they could be made to support refcount_bits if we filtered qemu-img info output accordingly, but I don’t mind just marking the option as unsupported, so I’m good with your approach.
> 
>> diff --git a/tests/qemu-iotests/044 b/tests/qemu-iotests/044
>> index 714329eb16..a5ee9a7ded 100755
>> --- a/tests/qemu-iotests/044
>> +++ b/tests/qemu-iotests/044
>> @@ -118,4 +118,5 @@ class TestRefcountTableGrowth(iotests.QMPTestCase):
>>   if __name__ == '__main__':
>>       iotests.activate_logging()
>>       iotests.main(supported_fmts=['qcow2'],
>> -                 supported_protocols=['file'])
>> +                 supported_protocols=['file'],
>> +                 unsupported_imgopts=['refcount_bits'])
>> diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
>> index 4b3c5c6c8c..f7c1b68dad 100755
>> --- a/tests/qemu-iotests/065
>> +++ b/tests/qemu-iotests/065
>> @@ -139,4 +139,5 @@ TestQMP = None
>>   if __name__ == '__main__':
>>       iotests.main(supported_fmts=['qcow2'],
>> -                 supported_protocols=['file'])
>> +                 supported_protocols=['file'],
>> +                 unsupported_imgopts=['refcount_bits'])
>> diff --git a/tests/qemu-iotests/163 b/tests/qemu-iotests/163
>> index dedce8ef43..0b00df519c 100755
>> --- a/tests/qemu-iotests/163
>> +++ b/tests/qemu-iotests/163
>> @@ -169,4 +169,5 @@ ShrinkBaseClass = None
>>   if __name__ == '__main__':
>>       iotests.main(supported_fmts=['raw', 'qcow2'],
>> -                 supported_protocols=['file'])
>> +                 supported_protocols=['file'],
>> +                 unsupported_imgopts=['compat=0.10'])
> 
> Works for my case (I use -o compat=0.10), but compat=v2 is also allowed.
> 
> For cases that don’t support anything but refcount_bits=16, you already disallow specifying any refcount_bits value, even refcount_bits=16 (which would work fine in most cases, I believe). Perhaps we should then also just disallow any compat option instead of compat=0.10 specifically?
> 
> [...]
> 
>> diff --git a/tests/qemu-iotests/tests/migrate-during-backup b/tests/qemu-iotests/tests/migrate-during-backup
>> index 34103229ee..12cc4dde2e 100755
>> --- a/tests/qemu-iotests/tests/migrate-during-backup
>> +++ b/tests/qemu-iotests/tests/migrate-during-backup
>> @@ -94,4 +94,5 @@ class TestMigrateDuringBackup(iotests.QMPTestCase):
>>   if __name__ == '__main__':
>>       iotests.main(supported_fmts=['qcow2'],
>> -                 supported_protocols=['file'])
>> +                 supported_protocols=['file'],
>> +                 unsupported_imgopts=['compat=0.10'])
> 
> It seems to me like this test can handle compat=0.10 just fine, though.
> 

Hmm, right, it works.


-- 
Best regards,
Vladimir

