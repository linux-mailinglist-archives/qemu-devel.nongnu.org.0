Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BC46340AA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 16:58:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxVf4-0006ET-SC; Tue, 22 Nov 2022 10:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxVf1-0006Da-AH
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:58:11 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxVev-0004Hx-UM
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:58:09 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AMA2Xi6032618; Tue, 22 Nov 2022 07:58:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=mbXE+gtHivNbBOpv2a661coteSrsfViBB47w+CIK53g=;
 b=YXFYcSyWRzL7F7gAVX+WCxCR0zTV3qOvuohrKNjI3jFY0U+RbVjbdkDANaacnQjXO3Z1
 7tDxC8rZHwTCpdLCVSALfT6SwF9NFYLof7ZoYJ8AXgSmN1WXQXWgC7h080MxM9NjY8rN
 69NShX7kv/dCgWfSO3YTKWCVGIcnGDcf6Vin0nGfzJo7vJF+tPMMSeBhtYa4KwJQaxrp
 RzQmuyTVUH/+VoxUJI50+cx4QcYwnbP8vfjvlp8fIQ7N55wpJKkhSG2/xQAPw3WImMJ/
 4bUjAunnCR+ZEzujxss57N6XV3+Q6JtD8wRs0S1U7ERlhNcQlmEKG8N7BtltbNOKterA 7w== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxvbxqy9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Nov 2022 07:58:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyJtZxuizh3hWF9l2V51WjAB0n5ave7Nvqaexv4AavFm7EW0BmdV6istppCioLUtNv+C4ry1xkSRKFlJXIU6Jwqp4idrE3fpbCdD05oqvkQ4Y9FwoIyHBiLtmU74eR7wsDpjFv9nYvsHpMC8gVCMrKU1DZePx03NWTVy8rUmVpTuzcjbs04uS1pi0AuhTr44GbhF/F/mPyJJ0LihndZEKJcU5DzUwIyasbSFx1k3r1lLLexOlnU7ugMPBg36k4+zrjnWn5EOO0cl1qg2zpb8O2rKdIOphBxw71vZux/SdKVB7U7jEMPbf/eAuwsLFQ9rtMsMAej3pYlSkfbzNFAPcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbXE+gtHivNbBOpv2a661coteSrsfViBB47w+CIK53g=;
 b=e/aCdzRSh2Om8ebtUlGG7ZSZXYR08eA5uBz1LA+19QsgcRECKwqlYqWQn1hfg8pbMeuwpBhMmXEyV1bv99p8nPznnQ8DAL/WO8f9XDY9zetndOVEgVQ7aPHLiefA2TQhbN6Au19w0TZpZFXQNdkYJLXhtNv2VC9SPE2uJibScETeNsHUUb3Olj8N1cUMqzeX2H+5lzKuKWPSDN9b8EBpKUSGh7A/C3qYlDNiHG1ICDg+5B4W+ktEqaftaAZKsVxMqkW5dpdZKJNll/axxuTn/tI6pZHJNl70ISBSaKiP/ZacHBAYyBLCfP8XjpUicewny060msvuvCRk8W9qCq1l0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbXE+gtHivNbBOpv2a661coteSrsfViBB47w+CIK53g=;
 b=XNT6jPb8gW3WrZv/3c1tTn8Xs3DAjKZF4FBjQ4AGuPPd8509ZSPDWEe7pZFC9VM6oLjSKSu7+ok9c0omppkutc3AvPEGQTa3o7gQpcdSqL2Z3xcHhLqxVbEJFns79JiDB2h80m1/7mblRkpYkf0zjih/KAWnFNRlWlS3sl8RFuWUBewN5A9PRc4+BFpkKy1G/82CXXTTG9ak+ojl1Ofb0Ey1/i8oYCRbRUSTvP3viCmacNYLEkMd70YY1/SS+w+qwJidYLiPxO6uC8BCd68lr1CeW21PPhQcmlFCL5nGgk9j0qzwnjVlT8nc3xb9L3K7Es9ZmDAN53UaaW01K1W0KA==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DM6PR02MB6511.namprd02.prod.outlook.com (2603:10b6:5:20c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 15:58:01 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 15:58:01 +0000
Message-ID: <132c1dbf-e953-0736-fb3a-169baebd7e75@nutanix.com>
Date: Tue, 22 Nov 2022 21:27:52 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] multifd: Updated QAPI format for 'migrate' qemu monitor
 command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Cc: Het Gala <het.gala@nutanix.com>, qemu-devel@nongnu.org,
 prerna.saxena@nutanix.com, dgilbert@redhat.com, pbonzini@redhat.com,
 armbru@redhat.com, eblake@redhat.com,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
References: <20221121110427.198431-1-het.gala@nutanix.com>
 <87pmdgtr9g.fsf@secure.mitica> <Y3yVHpH2080Dm9eM@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y3yVHpH2080Dm9eM@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|DM6PR02MB6511:EE_
X-MS-Office365-Filtering-Correlation-Id: 0305325c-30db-4652-857c-08dacca254fb
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3BqLffMTAw2ieGBEiaW+XvD/GpJJ6yyQ68ZbnCJpR45WJGpTzr8NCNVHjckbCl1u0NFLr4rLcVogEzlkIWJwdAw5cEBY2RAkR0aCBx/LMbz/MX1qU4BjNz0xQSdlkxxtCTtWsVlknWcQALyu/NQwkMYkUrOmIb8glvT03Lgly4IRtkO5wq/bqQWHn1Zwcs8rdt91jOPcH9I32NXJUftkQ55kQOq9QB8bWs/yv+06yVhRdvPi2kKxLd6jZj2Z1npFnv9w5DdTLRgqlbKG6x3aGbo9g1NR+EBuS/JKaPsCud3kl7JcrBbW4stE1doN4hdoa54F4eZ1bPhVEGAslWiIuKFJnKTGm2y/za/L98gWBjRdPdjiVx0KPSbmNOkwDov3Ov3Qf1zC3ZpMAhWdpSs9jhO4sJPRKfdQdUcVFyYbTs9gWmlL4Kt2rb3EHZQUkOzAwHbBg0zmG50cLu3rjWdMtxlTA1f0t6XnvM/obX3WN+5Ige/AOxAzqGz8/zyDzmt1rzcpyF17ymm7AF4wSXLX36QBm8mwg4pOEfRpvsKFcQFsiM8H3+hd7a8dyz+fIhZ/cjwxrsfsGR9RGg6wVHY9nmyCrNGhOdczfqiw8k/YTfUbY+H33tkx8FafSJKOu60H8Oh355CYOui+9b99TY1gWdlvtuehm96dLqURAjWYnnTrcUaNJmGgR1PJ1gAywMgPGAuL2Ow5vow+8kb9ruFbi3QNZj80xlKB/EIcxk3jQuGwD4PvE1NZqEhYBlUgQruc1Hvo89XWQB+dFgKg85SA+kE9gRXrh8/ycr2epR3R+50=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199015)(5660300002)(54906003)(83380400001)(55236004)(6506007)(316002)(36756003)(8676002)(66476007)(110136005)(41300700001)(4326008)(26005)(66946007)(2616005)(66556008)(8936002)(53546011)(186003)(38100700002)(2906002)(15650500001)(31696002)(86362001)(6512007)(6666004)(107886003)(31686004)(966005)(6486002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ays4Z1hrd0p1RFpLTW5OOUhuQXNqR0pOM1o5ZXQzRzJzV0NNbjJmSFR4NzVK?=
 =?utf-8?B?MWpyS0U4RXp0SVRsMGNOR0c0Z1dtTkE4Q1Q5ZlhENXdIWjNJMlpjTE45TDlt?=
 =?utf-8?B?TVkzcy9ZeE5UZ2hKdjUra2VqbS9uVDNYVnZ2cW5tcTJWb2E0RGl1V2RPcWV0?=
 =?utf-8?B?WHFnN2Uwa0JjcXNkLzRyZXJ3ek42d2ZMYll4U0NVWUw4enZ3ak1yYnUrQk14?=
 =?utf-8?B?Q3EyOW13aTBpeFROL0NtWENUbHhLZTZHVEx0UzFLSGNxcml5R0llQ2JlOUpw?=
 =?utf-8?B?ODdsdjZNTGlTRnl6RzN2THdrN0dnUEFKc202T1Fkc1Zhd3NRSDdwTldrVjVu?=
 =?utf-8?B?eVlLMkRXOHIya3FzbE4vVEsvbUovZm5XSW03UldkdGRXMWlkZG9KQU1ESzlR?=
 =?utf-8?B?YTQrUkNDZ3hEeUdUWFFTdFZ4SkxiNWlsdkxreFBPTHhyQ1N0c0g3TjVwWWFO?=
 =?utf-8?B?MWgvdzJCUFZOTU5rajYyZlZJZEFOanlGaW4wbVFNSlI0cTJBbHFwOWhxS0Qy?=
 =?utf-8?B?SWdQd211N0NjaXV6MnY2VFdPUlhYWHBBb0R1eGxCd0kwNnplQWJtR0ZRdW8x?=
 =?utf-8?B?Q3Z0eTVHaE11N1JsbHdoQlIzVE0rOTVpV2s1SFY3WE4yc0t4NW9JekFiTjIv?=
 =?utf-8?B?WjFsWEFUSkgxNmR4Zzd5Q1Bwa3c0QlVjSjB5bDNaeVRwYlFFSVQxbnZ4eUg5?=
 =?utf-8?B?Qzg3YldNclpwNnhSNzZDajdKSVhrR0hhTTNyKzF6bktwZVJDL0RsaGZoZ2lT?=
 =?utf-8?B?bU83Q0x4NHBsRkVnNVRNWHZlYWtHK0IzR1RtTitqdFNZeWpiRHdBQnZ3QnU1?=
 =?utf-8?B?WjYrbnNxbDBPdlNVLzU3a1pRY2VXRVl2ZlN3RVhGa1ZMUjJESk9ieThxbTYz?=
 =?utf-8?B?MjkzZ0tVQ25qcElOM3FoN2RNT0lLMVBsbSt4YndiQnNoZXpaSFJ1NHNncmxS?=
 =?utf-8?B?NW1DSHJPZkdUUTByL3hCYnFwNkc5QTNBbzRBMFhlakpwR1FJN1ZPOCtUb2pw?=
 =?utf-8?B?Q29yVjFFWkdMZHZLYVZTaG5TdzlBN01vMUIzbGU2MEc1RDh2N1lJQ0creHg2?=
 =?utf-8?B?ejBneHNLa2FVbmc1cnFSY09uN3hUNjdINE1OOEd4VllvTVFTN3lOcTZid0VV?=
 =?utf-8?B?K0EvdTdwTFhITnpHVU9pYVFETVN3OXBqUzVXaGZXTmNaS0pxeDJ6ZU1aT3dC?=
 =?utf-8?B?bDF3WU5aWmt6UHI1bHV0R09OeElLZGp2eHFOU1Y1OHF1TzhUVkk2NWMrMEw4?=
 =?utf-8?B?YVY3S0syaDhBeVQxaklQRVJYTkF0bHZaZUNQUHhLUnU5WjlRMGtlNEJpZ0Qw?=
 =?utf-8?B?d1BVMExLNjhlVFV5TTlPR0NENU12bXN0elloN2JpbGZxeGFaR09UcDdldjVT?=
 =?utf-8?B?OHFBRjBjMVR0TWRQRk5OQTFOUS9wbWlQNUpwaEhSY0tRTG1IUnNGckE0MFlV?=
 =?utf-8?B?U0VzVytaZ3ltMEErRjlKOXc5bEZmRHEzM3JMbVJORStVQ2hMOEJMOTYrbUl0?=
 =?utf-8?B?bmY0eUFYTTZPRVhyNVZwcTBiSXVEZ1BZVk5KeUU4MkVyREVJVmcwWisvVWlO?=
 =?utf-8?B?cHdpZEE2a2ZtNUgrV2txVzV1eHRIY3ZFTytMck1yVFNIUWhMQituRDZ6MlNo?=
 =?utf-8?B?aW5vVDNTQlNOZytwaHdNcE40VFRxanNIV1FtQmplUTAzQkVxSXBPTjM2a3Vz?=
 =?utf-8?B?anE5Q3BGM25oSU1BZWRLeGJrb0l6aXFWUHk5OStOejc3NTB0SEhkeE9TVWhp?=
 =?utf-8?B?cE1Kb3BJdmJwQ0lJY0tHbnh3d2YxQ2VOVUViMVVQUUhHOFN0aVdEWVdIQkRj?=
 =?utf-8?B?QmpSY2xWME5SeEtaMWZncXpRTlNSWXRtd2VOSTc5eHNFTGNlaGRoMS9xV2Zp?=
 =?utf-8?B?aFVZQ1Z3RldFSXpQcUJGOVhybmtTVFExMENETGZTM2FHZWdvcDZmekxBWjFU?=
 =?utf-8?B?WkM0VXVrcEk4U3hZeUVPVjU5ZUpheUdRM09jcnB3elVLbVFCOWtFcy9GdkZn?=
 =?utf-8?B?MTliN3JWQ2pJYWwrTURTamlKL25zRE5WbTllOGp0QTVPV0I0VU8vaFJtMmtH?=
 =?utf-8?B?TGE1RGt1Vmp2dkJzd3d4bUkzRjVwZVdlZVVzUnQralI5NjQ3a3prellzaDZY?=
 =?utf-8?B?YjMySVlxMzJhYUk5emMrOHdOMkdWcXU1TWx1eURYUWpNYzk4SHBwN0xDUmJx?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0305325c-30db-4652-857c-08dacca254fb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 15:58:01.0446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QttJ9FIPfl+F/v6DH1kOagHzu/Dw2VwQVSL2YDaLidusJ7OTJGFRR3uK9OfZYeA3u63s2hQiawniI1mYc5VNGGf8czHwe2cj7WF0/PQyzi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6511
X-Proofpoint-GUID: LNvmyD140DQpFbCIFRayexmHoB30qY4u
X-Proofpoint-ORIG-GUID: LNvmyD140DQpFbCIFRayexmHoB30qY4u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_09,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 22/11/22 2:53 pm, Daniel P. Berrangé wrote:
> On Mon, Nov 21, 2022 at 01:40:27PM +0100, Juan Quintela wrote:
>> Het Gala <het.gala@nutanix.com> wrote:
>>> To prevent double data encoding of uris, instead of passing transport
>>> mechanisms, host address and port all together in form of a single string
>>> and writing different parsing functions, we intend the user to explicitly
>>> mention most of the parameters through the medium of qmp command itself.
>>>
>>> The current patch is continuation of patchset series
>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__www.mail-2Darchive.com_qemu-2Ddevel-40nongnu.org_msg901274.html&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=htOVZmDRCu27EhvYDu-28snN6GV0a6-ffX34joSwBkELLLVGHzRqD0LicZed3Xtw&s=xvzrWRBN4S5l3orPqu6di0MRq-gSGWZZU6-e7wpn8w4&e=
>>> and reply to the ongoing discussion for better QAPI design here
>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__www.mail-2Darchive.com_qemu-2Ddevel-40nongnu.org_msg903753.html&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=htOVZmDRCu27EhvYDu-28snN6GV0a6-ffX34joSwBkELLLVGHzRqD0LicZed3Xtw&s=anLqZbhqa73P9SyPUaGk5q8R0SYR6IUtH_FWFML3lZY&e= .
>>>
>>> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>>> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
>>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>
>
>
>>> +{ 'struct': 'MigrateChannel',
>>> +  'data' : {
>>> +    'channeltype' : 'MigrateChannelType',
>>> +    '*src-addr' : 'MigrateAddress',
>>> +    'dest-addr' : 'MigrateAddress',
>> Why do we want *both* addresses?
> This is part of their goal to have source based routing, so that
> traffic exits the src host via a particular NIC.
>
> I think this patch would be better if we split it into two parts.
>
> First introduce "MigrateChannel" struct with *only* the 'dest-addr'
> field, and only allow one element in the list, making 'uri' optional.
>
> Basically the first patch would *only* be about switching the
> 'migrate' command from using a plain string to a MigrateAddress
> structure.
>
> A second patch would then extend it to allow multiple MigrateChannel
> elements, to support different destinations for each channel.
>
> A third patch would then  extend it to add src-addr to attain the
> source based routing.
>
> A fourth patch can then deprecate the existing 'uri' field.
>
>>> +    '*multifd-count' : 'int' } }
>> And if we are passing a list, why do we want to pass the real number?
> Yeah, technically I think this field is redundant, as you can just
> add many entires to the 'channels' list, using the same addresses.
> All this field does is allow a more compact JSON arg list. I'm
> not sure this is neccessary, unless we're expecting huge numbers
> of 'channels', and even then this isn't likely to be a performance
> issue.
>
>>>   # -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>>>   # <- { "return": {} }
>>>   #
>>> +# -> { "execute": "migrate",
>>> +#      "arguments": {
>>> +#          "channels": [ { 'channeltype': 'control',
>>> +#                          'dest-addr': {'transport': 'socket',
>>> +#                                        'type': 'inet',
>>> +#                                        'host': '10.12.34.9', 'port': '1050'}},
>>> +#                        { 'channeltype': 'data',
>>> +#                          'src-addr': {'transport': 'socket',
>>> +#                                        'type': 'inet',
>>> +#                                        'host': '10.12.34.9',
>>> +#                                        'port': '4000', 'ipv4': 'true'},
>>> +#                          'dest-addr': { 'transport': 'socket',
>>> +#                                          'type': 'inet',
>>> +#                                          'host': '10.12.34.92',
>>> +#                                          'port': '1234', 'ipv4': 'true'},
>>> +#                          'multifd-count': 5 },
>>> +#                        { 'channeltype': 'data',
>>> +#                          'src-addr': {'transport': 'socket',
>>> +#                                        'type': 'inet',
>>> +#                                        'host': '10.2.3.4', 'port': '1000'},
>>> +#                          'dest-addr': {'transport': 'socket',
>>> +#                                         'type': 'inet',
>>> +#                                         'host': '0.0.0.4', 'port': '3000'},
>>> +#                          'multifd-count': 3 } ] } }
>>> +# <- { "return": {} }
>>> +#
>>>   ##
>>>   { 'command': 'migrate',
>>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>>> -           '*detach': 'bool', '*resume': 'bool' } }
>>> +  'data': {'*uri': 'str', '*channels': ['MigrateChannel'], '*blk': 'bool',
>> I think that "uri" bit should be dropped, right?
> No, it is required for back compatibility with existing clients.
> It should be marked deprecated, and removed several releases later,
> at which point 'chanels' can become mandatory instead of optional.
>
>>> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>>>   
>>>   ##
>>>   # @migrate-incoming:
>> I can't see how to make the old one to work on top of this one (i.e. we
>> would have to create strings from lists on QAPI, I think that is just
>> too much).
> All we need is a piece of code that parses the 'uri' parameter and
> creates a MigrateAddress address from it. This can be called in
> the qmp_migrate() handler, and thereafter, everything else in the
> migration code can work with the MigrateAddress structs. SHould
> be pretty easy.
>
>> So I think that the best way (I know I am contradicting myself) is to
>> create a new migrate command and just let the old one alone.  That way:
>> - you can drop blk and blk
> blk & inc
>
>> - you can do anything that you want with the uris, as assuming that they
>>    are always sockets.
> Regardless of whether we use the existing or new QMP command, we still
> have to convert the code to use the MigrateAddress struct, so I don't
> think it makes any difference. Both cases will require that we write
> code to convert from the legacy 'string' URI, to the new MigrateAddress
> struct.
>
>> - I would not care at all about the "exec" protocol, just leave that
>>    alone in the deprecated command.  Right now:
>>    * we can't move it to multifd without a lot of PAIN
>>    * there are patches on the list suggesting that what we really want is
>>      to create a file that is the size of RAM and just write all the RAM
>>      at the right place.
>>    * that would make the way to create snapshots (I don't know if anyones
>>      still wants them, much easier).
>>    * I think that the only real use of exec migration was to create
>>      snapshots, for real migration, using a socket is much, much saner.
>>    * I.e. what I mean here is that for exec migration, we need to think
>>      if we want to continue supporting it for normal migration, or only
>>      as a way to create snapshots.
> The main challenge with 'exec' protocol is that it only sets up a
> uni-directional data channel. The main migration channel protocol
> has always been unidirectional, and that's responsible for alot of
> our pain in migration. There's no way todo a protocol handshake to
> negotiate features between client&server during connection. As such
> we've invented a ridiculous number of migration parameters that
> libvirt and other mgmt apps need to set on both sides - basically
> we have punted negotiation out of band to the mgmt app which is
> crazy.
>
> For our future sanity I think we need to define a brand new migration
> protocol which is bidirectional from the start. A large number of the
> MigrateParameters would become obsolete immediately, as QEMU could
> negotiate them automatically. This would let QEMU introduce new
> migration features without requiring any work in libvirt in many
> cases. Libvirt should only be required when there are performance
> tunables that need exposing, never for protocol feature negotiation.
>
> I think introducing a new QMP command, without introducing a fully
> new protocol would be a big mistake as the QMP command is not the
> problem we have.
>
> I've written much more detail about this here:
>
>    https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.gnu.org_archive_html_qemu-2Ddevel_2022-2D03_msg03655.html&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=htOVZmDRCu27EhvYDu-28snN6GV0a6-ffX34joSwBkELLLVGHzRqD0LicZed3Xtw&s=56T0bqIyHaHqZRDImrEfhvQHlsiPZXX-dCpX0Bm98wE&e=

Daniel, Totally agree on above mentioned discussion. Does this account for verifying other things too along with migration capabilities e.g. if qemu machine type, vm config or cpu features are excatly same of both side. Currently libvirt takes that responsibility, but as you mentioned libvirt may take some time to get to level where qemu is so causing potential issues till then. Similar to this discussion we had on libvirt list https://www.mail-archive.com/libvir-list@redhat.com/msg233725.html. If these things too were managed by qemu indepenedelty things could have been much better. I mean those too are kind of related to live migration. :)

Thanks

Manish Mishra



> I don't think this should be a dependancy for this patch proposal
> though. This is purely about making the 'migrate' command follow
> QMP best practice, by using a struct instead of encoding data in
> a string URI, and can be retrofitted to the existing command without
> difficulty.
>
>
>
> With regards,
> Daniel

