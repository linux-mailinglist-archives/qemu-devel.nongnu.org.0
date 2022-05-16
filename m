Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACB1528903
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:37:22 +0200 (CEST)
Received: from localhost ([::1]:58062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcmf-00062a-9h
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nqc5v-0006rf-Dz
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:53:12 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:59420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nqc4n-0000PY-1c
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:53:10 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24G91u7u002283;
 Mon, 16 May 2022 07:51:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=koY20SK8TCI92KnQJY09cjcH2RROeVaDO0+5ChCAt3E=;
 b=0pUlmVtLwT02pEy+++qLKhrmBUq5ll8B9KaHvsZVACtpnjh4rVq1SjsqdxFESH4aLW5V
 ai/cRtOL3GljGwnqxOM1MovN8XP+IYswTD8UojkhWhIt7VKT0xjT8NCdyFg/+z+0yjlT
 6oU9ATNlSgbT3mOw+b5dZvCe5Fjvig4djsP2BADpxrkR1iDBnCRq3nDYqFhDbalLSnX1
 gMpfjViwOA41kpEg0oRJ7N0GD8sOnRX7UypLtHtkNq8uTbWKD7j/FJ0wTqczN+6c7Zt6
 tc7imTV3XrWCExeHn8tohzIFg/mNB+pcDN6UflJ0xXghYtzm0iZPTgRA4lic2BNFPuya LA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3g29y93njm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 May 2022 07:51:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ix3l1zOoOxluy+QcK4augDL4CeRQ7XiuEuJZfnka1moJrIeoB3KoidLQOx7Ci2ecJI1Mk2jRqrGPY2LL8GzCLiv+1OqhW/R8hUIGpbKlaZAXYEhkMFeHW5kPfUOi4ItpAQ3rWj6vI4r5S7Mu/DFOglTs3rgzb5loquretvOVC1FzO4Qe2vklPugvO9eomK02c7rxQmGl9TMASNh0NK5f9iVBbdyZZm+8IGQAoDndTfcSoTFtB3VKqBJQ69ahG3NV//YQQM2iE11o+9LMyuhHBaQgyB7FJrkKc/R/BAh7FgmZSFL/Ro4mHn9lvYqND331GgGM5M/xPGzSJpNI79Of8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koY20SK8TCI92KnQJY09cjcH2RROeVaDO0+5ChCAt3E=;
 b=DlU/45A9Mgn4MjUJMqQW+AT//xgkPErpv+jw0eDgm9DEosJ/GAWbufMe/EZlBdtwbC+B9hNyl7zSHLIhBVembk5Q5MFCHG4HtsbnejzQWfWAiOnDgnbz8Wo8i4gjBp3zg0JdOqozSlgU+LKj/qR9lZXZrLcDIwu2C4o4PGXqS5PD1vqZ3beQ9eLZ0kBluzJQBgcqSX0WO4pM++XO/uyOu7O6CHKMy9oCYf0nTsxbKPbckkjqSqeBKH6y4qsDBUlVvL40uhO/kbjdpDg4Zum4rSeWzvbI53q8iAp8yxJOEjdC8BKCpiBdOmnZWgyqe8CUDsx6QcHtTRLEk4uoJ/1ZIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by SJ0PR02MB8562.namprd02.prod.outlook.com (2603:10b6:a03:3f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.17; Mon, 16 May
 2022 14:51:36 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 14:51:36 +0000
Content-Type: multipart/alternative;
 boundary="------------2u6jBoA0cQWOowGoeKoCNYqg"
Message-ID: <85b85303-e4e8-77be-c65d-76018ac7704c@nutanix.com>
Date: Mon, 16 May 2022 20:21:23 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v5 13/21] migration: Postcopy recover with preempt enabled
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>, 
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
 <20220425233847.10393-14-peterx@redhat.com>
 <922cf9fc-e15d-ad86-ba95-05aabbb00f5f@nutanix.com>
 <YoJboZoJdPwWpeFe@xz-m1.local>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <YoJboZoJdPwWpeFe@xz-m1.local>
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2812120-69e7-4c6d-c9f9-08da374b9363
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8562:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR02MB8562C9D944C0F483487A9110F6CF9@SJ0PR02MB8562.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fTqUShcdLO1bwdoXnmOeEd9NqgpDudot1DS/YUPPylrutU5+px9wB6JxunN/fdhWORl8PIcQhSGSEaROjbDPq9paeI/rttItRX2hpZL0nXop6wsGkB1tku9fuyBu172l6vUhQGlvLmn+uYmNeKBlNSZjYHNvah79EUneM23QAEe/m+WzQrih4udnEUZMRPaUoE+BEYWocv6QsR/HpFRxN/1+ZZuYlnn2DvEt9qXak5fMODuSGGyti7Dl+eCKd54hIvEKYeouR3CqU0gq7Jdl7vq/m3331gx0czyR+ztkLGaQztZcY0f0D8zCn9MqiOJROcGz9yBxgLj9pF6fjgmyUHqPtrKi2RQeCMKxK3sLhpPEbB75ht9AXpD8jfE+fd+iSHyMd6wr5xd9masIplVcwvlhdzfNC8AmmaeIQ+q6I5aZbR+FM/r5NsUcx8UJkGMX9oSLoaMYsq2oN3XIjTUCEdrSONbs7qOeycxsyGS1qUbqbuQqMM/nGrOZ7lwgl/Rh4i2JkYIieO1Ahdpynu6mFTrGfFYO7IffaghIL3ktUddj1jaIgWME6xBy9MkaG7DTajdHQJuy/URb1iLnxoejH7w2OxFFUadNHKFozsb39CpEXSlCUq7JE0k3AjIgOGPIhfapyDssUdw5ZN4mEt3xg6FwyrK3incs1q3eNS8SC/hukaaU9gJMCpNLrANVV84a0EB7DwQ8DpWOfOmL1mVRa4iavuP0SYNR58CWD8Eo3TV83Je4grjSL/JTuUIqc4A1V+ybVkkjfOZTF8DUPIphF22jgv8cRQgygqZAHIyvR1ScP+YsRK1nmBr3bX+6rnWh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(66476007)(86362001)(31696002)(4326008)(66556008)(8676002)(6916009)(6486002)(8936002)(508600001)(53546011)(186003)(5660300002)(38100700002)(966005)(33964004)(2906002)(54906003)(6666004)(6512007)(2616005)(316002)(36756003)(31686004)(83380400001)(166002)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZyswMXF2UjU3aEdiaDBkRkFNdnpmaFdqNElFSVR3L3VLbEJuK3Q4ajdMSUll?=
 =?utf-8?B?WWhiYWFqejRtK1g4c2t3OUtJaDl3WnVHNGhGSHU2UVZpd01HdCtoUldVK2Vs?=
 =?utf-8?B?cG9GVzA1TlZ3YTFEdUhHOFhHZWZLNVZFQm51QzU4ZEN4NFJ5dXVpdHJmRFhO?=
 =?utf-8?B?R3pmWGJSaFVtY3JUOHRZTENpOUJoV1k4NzFneWdoQmZFSTZEMUxRd29YYk1R?=
 =?utf-8?B?aEg4R2NYWVpZdytxcERvcTNGU3V5OVVqbGpTWVJyZUVhWGdUUW5oZmJKR3Ex?=
 =?utf-8?B?ZFgrVjJOcitPZVVPSzFwRUZ0Tkx3bEtJUG9YTmN2UEpSTU9jR3NiZlg1QUNm?=
 =?utf-8?B?Lys3TVpYSjBJcEoxZTJpN2NiL3dXTDdBNXJOZC9XcHlkVmZwVjMzY205TXNo?=
 =?utf-8?B?WEtOa2EwRWhxL2F6d2tNZVEydTBEMUtUcWU2cFFaMWRDTEEzQnVhZEYrZnlH?=
 =?utf-8?B?c3BYRlFObzVPa2JpYjNPUjQxTDR2bTJWZXRJeG9Qc0JhSzk1ZFozcVQxQTBK?=
 =?utf-8?B?VHVINnFsc3JOL3Arc3BEU2tlNHVSdVpBKzI5UG8zSnRIMUlFdzdqMG5XNitR?=
 =?utf-8?B?bkhBNDY4aUpBaFFsdjA1c21ZSlVSZTBlYVVFU3NqbkxTUzNDOVNTL0VsbU5r?=
 =?utf-8?B?L2RyNzhXUTFqRGZNN2xZcldEaVQ4QzYvSytzSHhHZTZEdWNSUTUyK0l0UDlw?=
 =?utf-8?B?UWFxZ1g1aE4xR1NTaDJ5VjRzdE9xOTdyVEM4NCtEeGdCWEkxUXd0RXdUTm1X?=
 =?utf-8?B?dGNPN2kxbndQVU1sbHM5VWdCTzl4SnVkRWVsWHhkbWtzRHRMajM5WFNmZUF3?=
 =?utf-8?B?L1UrV0xNeHdWQmFRLzZPeU1pRFg5cUlYV1dGb2d3Y3AwbnZyU2xydnJQaE5u?=
 =?utf-8?B?ZkJGczkzQ0lDc0NYb1N1Szk5K2R6SklxQ3BaRVV5bzJrYm1qc001L1VCaGd3?=
 =?utf-8?B?WlgrM3kvRHN0QTdXcFM3akM3NFQ0dXFWZENRVXdwSVp4TWNjRGwzaEEwWjAr?=
 =?utf-8?B?MGJONjZYVmovV3dXMm5nVXF5WEJkZEVMSkxOaHNMaUc1NFd0V2VyV0xrcXI4?=
 =?utf-8?B?aE90dUF4SFgyWk1VWnFXMHczMFBZQ09VNG5XcllDMG84dkJwKzNqU0pXSzdB?=
 =?utf-8?B?V0Z4L05wMjYrblN3RmkzNVFQSHdmTndIVWE4d0NwMHRoeUtxK1B1aUwvcith?=
 =?utf-8?B?eWQ4anMwcVQ3NW9iVFB4ZUhnaWppRW0zeGM1VkZMQW5CTGVuMFA1bDduSUV0?=
 =?utf-8?B?OUp2S1NmeXpxN0YyaXZIT1dXcGF5NCs5NGdCSHBkbmxzKzFQcHZrdFRudGxB?=
 =?utf-8?B?ajd5c1A2eUNFMVRvNEtCTlprTS9KOG9uSmVHQWxqZ1NPS2h5dEViTHBRM3U4?=
 =?utf-8?B?SDRvSTRDcC9WTytoSUxxdHpyQ2xJSjZrUXRzS1VxOVVDc1dlM1V6RUg4VVVo?=
 =?utf-8?B?T2VxZldjVThUVDcvczZYd1NYaThvam9oK2R5QmlxU1ZFY3drNDJBNHhZYkJo?=
 =?utf-8?B?eE1RRWVkRk9JSjkvNHJCVU5BcWdMMXFIMXlueCtkajRDaU5BNmhmTUg5NGZL?=
 =?utf-8?B?dGZrckR1YVdxMHdBNUR1VCtIQk0wVURYOUY4L0JUNEhjOUhaUDlJSnMzQ0l2?=
 =?utf-8?B?TzQwUmtiTy9YMzFqYlVtWVVPTmZHdHN2YVBQbUY3TEdVQ2t6VXVSTmRYU0xR?=
 =?utf-8?B?dUxsb0FzNnUzSVFTQnBHRzRoSXBQNk9MTWRkTERBaVB5RHFXaFVSNE9EVGRn?=
 =?utf-8?B?TE5uN3l5S1pSeEIzamZUcElvVEVBMVdLeng2b2xBQ2ZLZUZTUzBFVXdjZE00?=
 =?utf-8?B?eDNaclJ6eG1MK3k0cVoyRitUTVV2blZlWjdBeDFydC9EQ0MvOXpFTnJCV2cy?=
 =?utf-8?B?MjZQeWhkOVN0L3RtZFdITTY0YjJid0trbVQ2bk5pR3E3ck1xR2FlaVlrQXF1?=
 =?utf-8?B?K0IwNEgxVU9OTEx0STh5a2FDeG1EeEtrVUtPM1JZdXpxMGN5Sk4raXYzVG5E?=
 =?utf-8?B?U3lKdnFSVzdQNEx6U3BzWnYwbkZDRGVML0xTa0xXd2FmKzh6NFIrZ2Q0TnFC?=
 =?utf-8?B?UjFFTnBYb3lqT1BOSEdlQlhRdFBmVDRQV3RaVG9jSGJpQ1VyTGxBMEVYdUdu?=
 =?utf-8?B?clQ2YTBNOXYvY0pPM3lNSjFhRVd5SkNlQ20rVlNsNW5hZTZUbnlhVlBXd01l?=
 =?utf-8?B?akxjNElpUmRuNGVrVUV2Z1Nld0FJTEZCYnRBTVluVGVJM3lDZDZLYW16ZGU1?=
 =?utf-8?B?WTY5UHJRN1lPTkNKQXJYUFRIVXdDRjE5MFNtMGZmWkZ2QjNwZlhhcndqVWVr?=
 =?utf-8?B?UUU4dHB0M05QWDFoUWZob0hDV09Td1JoelFIQ2s3ck1HVUY5U3JGZEpydlgx?=
 =?utf-8?Q?GlFYZ4TFAjBdntF4bKo8xLc60ExepqR/Al2qaXoTAT3sm?=
X-MS-Exchange-AntiSpam-MessageData-1: ssEHQuClDh7bVN4pvsn9x2tbZHVf5FxDeeQ=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2812120-69e7-4c6d-c9f9-08da374b9363
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 14:51:36.2148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOIW85vjXhKTDpvpyv0FEBDbJ/YssqCVZN+5ap/ryu7hYD6dEvSXBM+kKkASRXw6r/tK4TNaOYPZNUbRPilDDzj8cmFW2AUhJ35nA7SjMOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8562
X-Proofpoint-GUID: 8gPGxJ8TiEe_UopKVwejK8IDHXQP5pzO
X-Proofpoint-ORIG-GUID: 8gPGxJ8TiEe_UopKVwejK8IDHXQP5pzO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_14,2022-05-16_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001,
 NO_DNS_FOR_FROM=0.001, T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

--------------2u6jBoA0cQWOowGoeKoCNYqg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 16/05/22 7:41 pm, Peter Xu wrote:
> Hi, Manish,
>
> On Mon, May 16, 2022 at 07:01:35PM +0530, manish.mishra wrote:
>> On 26/04/22 5:08 am, Peter Xu wrote:
>> LGTM,
>> Peter, I wanted to give review-tag for this and ealier patch too. I am new
>> to qemu
>> review process so not sure how give review-tag, did not find any reference
>> on
>> google too. So if you please let me know how to do it.
> It's here:
>
> https://urldefense.proofpoint.com/v2/url?u=https-3A__git.qemu.org_-3Fp-3Dqemu.git-3Ba-3Dblob-3Bf-3Ddocs_devel_submitting-2Da-2Dpatch.rst-3Bhb-3DHEAD-23l492&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=8LU6rphEJ5GMSXEpSxe8JZ_hpn6TQDUXfjWM6Vt7DdShxnU3X5zYXbAMBLPYchdK&s=TUNUCtdl7LWhrdlfnIx1F08kC0d9IMvArl6cNMpfXkc&e=  
>
> Since afaict QEMU is mostly following what Linux does, you can also
> reference to this one with more context:
>
> https://urldefense.proofpoint.com/v2/url?u=https-3A__www.kernel.org_doc_html_v4.17_process_submitting-2Dpatches.html-23using-2Dreported-2Dby-2Dtested-2Dby-2Dreviewed-2Dby-2Dsuggested-2Dby-2Dand-2Dfixes&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=8LU6rphEJ5GMSXEpSxe8JZ_hpn6TQDUXfjWM6Vt7DdShxnU3X5zYXbAMBLPYchdK&s=TJmr_eC4LAccVY1EqgkLleXfJhUgtIjTJmLc3cedYr0&e=  
>
> But since you're still having question regarding this patch, no rush on
> providing your R-bs; let's finish the discussion first.
>
> [...]
>
>>> +static void postcopy_pause_ram_fast_load(MigrationIncomingState *mis)
>>> +{
>>> +    trace_postcopy_pause_fast_load();
>>> +    qemu_mutex_unlock(&mis->postcopy_prio_thread_mutex);
>> I may have misunderstood synchronisation here but very very rare chance,
>>
>> as both threads are working independently is it possible qemu_sem_post on
>>
>> postcopy_pause_sem_fast_load is called by main thread even before we go
>>
>> to qemu_sem_wait in next line, causing some kind of deadlock. That's should
>>
>> not be possible as i understand it requires manually calling
>> qmp_migration_recover
>>
>> so chances are almost impossible. Just wanted to confirm it.
> Sorry I don't quite get the question, could you elaborate?  E.g., when the
> described deadlock happened, what is both main thread and preempt load
> thread doing?  What are they waiting at?
>
> Note: we have already released mutex before waiting on sem.

What i meant here is deadlock could be due the reason that we infinately wait

on qemu_sem_wait(&mis->postcopy_pause_sem_fast_load), because main

thread already called post on postcopy_pause_sem_fast_load after recovery

even before we moved to qemu_sem_wait(&mis->postcopy_pause_sem_fast_load)

in next line. Basically if we miss a post on postcopy_pause_sem_fast_load.

This is nearly impossibily case becuase it requires full recovery path to be completed

before this thread executes just next line. Also as recovery needs to be called manually,

So please ignore this.

Basically i wanted to check if we should use something like

int pthread_cond_wait(pthread_cond_t *restrict cond,
                    pthread_mutex_t *restrict mutex);

so that there is no race between releasing mutex and calling wait.

>
>>> +    qemu_sem_wait(&mis->postcopy_pause_sem_fast_load);
>> Just wanted to confirm why postcopy_pause_incoming is not called here
>> itself.
> postcopy_pause_incoming() is only used in the main ram load thread, while
> this function (postcopy_pause_ram_fast_load) is only called by the preempt
> load thread.
>
ok got it, thanks Peter, i meant if we should close both the channels as soon

as we relise there is some failure instead of main thread waiting for error event

and then closing and pausing post-copy. But agree current approach is good.

>> Is it based on assumption that if there is error in any of the channel it
>> will
>>
>> eventually be paused on source side, closing both channels, resulting
>>
>> postcopy_pause_incoming will be called from main thread on destination?
> Yes.
>
>> Usually it should be good to call as early as possible. It is left to main
>>
>> thread default path so that we do not have any synchronisation overhead?
> What's the sync overhead you mentioned? What we want to do here is simply
> to put all the dest QEMU migration threads into a halted state rather than
> quitting, so that they can be continued when necessary.
>
>> Also Peter, i was trying to understand postcopy recovery model so is use
>> case
>>
>> of qmp_migrate_pause just for debugging purpose?
> Yes.  It's also a way to cleanly stop using the network (comparing to force
> unplug the nic ports?) for whatever reason with a shutdown() syscall upon
> the socket.  I just don't know whether there's any real use case of that in
> reality.
>
> Thanks,
>
--------------2u6jBoA0cQWOowGoeKoCNYqg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 16/05/22 7:41 pm, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YoJboZoJdPwWpeFe@xz-m1.local">
      <pre class="moz-quote-pre" wrap="">Hi, Manish,

On Mon, May 16, 2022 at 07:01:35PM +0530, manish.mishra wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 26/04/22 5:08 am, Peter Xu wrote:
LGTM,
Peter, I wanted to give review-tag for this and ealier patch too. I am new
to qemu
review process so not sure how give review-tag, did not find any reference
on
google too. So if you please let me know how to do it.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It's here:

<a class="moz-txt-link-freetext" href="https://urldefense.proofpoint.com/v2/url?u=https-3A__git.qemu.org_-3Fp-3Dqemu.git-3Ba-3Dblob-3Bf-3Ddocs_devel_submitting-2Da-2Dpatch.rst-3Bhb-3DHEAD-23l492&amp;d=DwIBaQ&amp;c=s883GpUCOChKOHiocYtGcg&amp;r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&amp;m=8LU6rphEJ5GMSXEpSxe8JZ_hpn6TQDUXfjWM6Vt7DdShxnU3X5zYXbAMBLPYchdK&amp;s=TUNUCtdl7LWhrdlfnIx1F08kC0d9IMvArl6cNMpfXkc&amp;e=">https://urldefense.proofpoint.com/v2/url?u=https-3A__git.qemu.org_-3Fp-3Dqemu.git-3Ba-3Dblob-3Bf-3Ddocs_devel_submitting-2Da-2Dpatch.rst-3Bhb-3DHEAD-23l492&amp;d=DwIBaQ&amp;c=s883GpUCOChKOHiocYtGcg&amp;r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&amp;m=8LU6rphEJ5GMSXEpSxe8JZ_hpn6TQDUXfjWM6Vt7DdShxnU3X5zYXbAMBLPYchdK&amp;s=TUNUCtdl7LWhrdlfnIx1F08kC0d9IMvArl6cNMpfXkc&amp;e=</a> 

Since afaict QEMU is mostly following what Linux does, you can also
reference to this one with more context:

<a class="moz-txt-link-freetext" href="https://urldefense.proofpoint.com/v2/url?u=https-3A__www.kernel.org_doc_html_v4.17_process_submitting-2Dpatches.html-23using-2Dreported-2Dby-2Dtested-2Dby-2Dreviewed-2Dby-2Dsuggested-2Dby-2Dand-2Dfixes&amp;d=DwIBaQ&amp;c=s883GpUCOChKOHiocYtGcg&amp;r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&amp;m=8LU6rphEJ5GMSXEpSxe8JZ_hpn6TQDUXfjWM6Vt7DdShxnU3X5zYXbAMBLPYchdK&amp;s=TJmr_eC4LAccVY1EqgkLleXfJhUgtIjTJmLc3cedYr0&amp;e=">https://urldefense.proofpoint.com/v2/url?u=https-3A__www.kernel.org_doc_html_v4.17_process_submitting-2Dpatches.html-23using-2Dreported-2Dby-2Dtested-2Dby-2Dreviewed-2Dby-2Dsuggested-2Dby-2Dand-2Dfixes&amp;d=DwIBaQ&amp;c=s883GpUCOChKOHiocYtGcg&amp;r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&amp;m=8LU6rphEJ5GMSXEpSxe8JZ_hpn6TQDUXfjWM6Vt7DdShxnU3X5zYXbAMBLPYchdK&amp;s=TJmr_eC4LAccVY1EqgkLleXfJhUgtIjTJmLc3cedYr0&amp;e=</a> 

But since you're still having question regarding this patch, no rush on
providing your R-bs; let's finish the discussion first.

[...]

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+static void postcopy_pause_ram_fast_load(MigrationIncomingState *mis)
+{
+    trace_postcopy_pause_fast_load();
+    qemu_mutex_unlock(&amp;mis-&gt;postcopy_prio_thread_mutex);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I may have misunderstood synchronisation here but very very rare chance,

as both threads are working independently is it possible qemu_sem_post on

postcopy_pause_sem_fast_load is called by main thread even before we go

to qemu_sem_wait in next line, causing some kind of deadlock. That's should

not be possible as i understand it requires manually calling
qmp_migration_recover

so chances are almost impossible. Just wanted to confirm it.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Sorry I don't quite get the question, could you elaborate?  E.g., when the
described deadlock happened, what is both main thread and preempt load
thread doing?  What are they waiting at?

Note: we have already released mutex before waiting on sem.</pre>
    </blockquote>
    <p>What i meant here is deadlock could be due the reason that we
      infinately wait</p>
    <p>on qemu_sem_wait(&amp;mis-&gt;postcopy_pause_sem_fast_load),
      because main</p>
    <p>thread already called post on postcopy_pause_sem_fast_load after
      recovery</p>
    <p>even before we moved to
      qemu_sem_wait(&amp;mis-&gt;postcopy_pause_sem_fast_load)</p>
    <p>in next line. Basically if we miss a post on
      postcopy_pause_sem_fast_load.</p>
    <p>This is nearly impossibily case becuase it requires full recovery
      path to be completed</p>
    <p>before this thread executes just next line. Also as recovery
      needs to be called manually,</p>
    <p> So please ignore this.</p>
    <p>Basically i wanted to check if we should use something like</p>
    <pre style="box-sizing: border-box; margin: 0px 0px 10px; padding: 20px; border: 0px; font-size: 12pt; vertical-align: baseline; background-color: var(--gfg-grey-bg); border-radius: 10px; color: rgb(39, 50, 57); font-family: Consolas, monospace; overflow: auto; white-space: pre; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: 0.162px; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">int pthread_cond_wait(pthread_cond_t *restrict cond, 
                   pthread_mutex_t *restrict mutex);
</pre>
    <p>so that there is no race between releasing mutex and calling
      wait.<br>
    </p>
    <blockquote type="cite" cite="mid:YoJboZoJdPwWpeFe@xz-m1.local">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+    qemu_sem_wait(&amp;mis-&gt;postcopy_pause_sem_fast_load);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Just wanted to confirm why postcopy_pause_incoming is not called here
itself.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
postcopy_pause_incoming() is only used in the main ram load thread, while
this function (postcopy_pause_ram_fast_load) is only called by the preempt
load thread.

</pre>
    </blockquote>
    <p>ok got it, thanks Peter, i meant if we should close both the
      channels as soon</p>
    <p>as we relise there is some failure instead of main thread waiting
      for error event</p>
    <p>and then closing and pausing post-copy. But agree current
      approach is good.<br>
    </p>
    <blockquote type="cite" cite="mid:YoJboZoJdPwWpeFe@xz-m1.local">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Is it based on assumption that if there is error in any of the channel it
will

eventually be paused on source side, closing both channels, resulting

postcopy_pause_incoming will be called from main thread on destination?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Usually it should be good to call as early as possible. It is left to main

thread default path so that we do not have any synchronisation overhead?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What's the sync overhead you mentioned? What we want to do here is simply
to put all the dest QEMU migration threads into a halted state rather than
quitting, so that they can be continued when necessary.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Also Peter, i was trying to understand postcopy recovery model so is use
case

of qmp_migrate_pause just for debugging purpose?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes.  It's also a way to cleanly stop using the network (comparing to force
unplug the nic ports?) for whatever reason with a shutdown() syscall upon
the socket.  I just don't know whether there's any real use case of that in
reality.

Thanks,

</pre>
    </blockquote>
  </body>
</html>

--------------2u6jBoA0cQWOowGoeKoCNYqg--

