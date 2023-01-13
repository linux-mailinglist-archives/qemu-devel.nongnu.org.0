Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D614266901F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 09:09:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGF6W-0002hl-Mq; Fri, 13 Jan 2023 03:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pGF6N-0002hR-DP
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:07:51 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pGF6L-0006SN-0I
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:07:51 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30D6VGx0011427; Fri, 13 Jan 2023 00:07:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=KmRhiVdp9zmNrKBlAq4d6EglzJ3Xry47n4hLZwSENz8=;
 b=uEO4d0Ro4eeGIvxvRWeyOJNdpOpIFM7P1+Oppqfcg2zxTAOQY124h/KurKSwF6gbEsfT
 t3imu0+aMlLAaU+zRz12Palg2SQavknHOj0NjHjH3X0bhk+oNtkqSLZfXDGEXxPFljxl
 PidtLlU3hfq5wW3rfFogb7RCBKNPo6XGR/iHspSXwsA6U49zHCJVxiTJZ8YpfKxjc+1m
 F1O+eb9NsplFgFc9snQShHtrqXs4MrTRVgsIVJaV01ecCSh1Ejq6QyhevAp+S/eaub3a
 IsBE7dWtPCd7qgqdfrwx3FhDbRWFS2ZSM7JnZab1yFfRenIqwucWOzh2vpLv6za4fS4A wg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3n1kqaq065-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 00:07:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKitrkWdCBOqC49ZYs1Vb7RiVKgERn8414ugZAqPvGV5llODQdi8CSqCryXBDlYY6/pQT1v5JQ3bomgTLjRqOAzZeQmTUzQ4DC1KWi2gaNnfxwWEhlBGL+OQdzVdfd2kom8P21fwPQGWhj0HtHxgi+lfoB1QJd3riuNkzeMrVui9nh6qlGi98qBKjoFI/6cKyJs/U3xz0lyTQXaqsx0N6F0p0VpDyBYWtfWwixEtsiRwtkcxv9DrCurXzcMR3+OW5PfIwidKmyGcxK5kyVeOKdBiTr4G6F8tNLqRqyzLDf7tGewIO119ZDtyY9xjU5re1Qoh30GXp3rn3bg3vrtvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmRhiVdp9zmNrKBlAq4d6EglzJ3Xry47n4hLZwSENz8=;
 b=I1r0re2WitGLzOqwrhrrBxJ5iwswBUbzhkUKKsqHvdAC+hOono0jjTRAPab51o3B/+FIs3B96MFw1Hbjmy0OOwXLL17Ir9y6SASSIByopaxZf7+pynQV/ssGGnxE26lb6EMpjWMyoochpcp1+yvliXqQEwNDrZnLa0GN/roTSIunIqiNwE2M05pcv/vlh3zsx6dEFI+jZmwc48wCVwQMTNxN8Yex/YFDW8byyguXwmJner4f+Y5Tar+ynkBpZFDYYY4e9eeboxjjLn1d6NdQd4mPdGr9huwrUPyGH7GjINslz/XcJ92Zbu1m+XulbYix6AcMovGWuAoZiJ6JL12j5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmRhiVdp9zmNrKBlAq4d6EglzJ3Xry47n4hLZwSENz8=;
 b=u+ZARw11blisBlV/Yfy2eDpsPSc0cd9srrkEZh3bE537/Kf2RG8a2cSmgnvcQTxrDILUygYwJEhVR9sIdCVkkq4RbAw7NpEWNURMwqWDjRT/21T5px/lpQ99K1YwCRhjr0GDXPhdhciLpdqD7Wly+uYDImGZtRgfpBkCEADbUFgam9jphJAtQ3DP+wZgBy+Qyq86TkNGvwpJbJQT8nHB0XIst+JBMM53nFpz2YiB8FemfUcE4I0DjH5XxBy/vREPE1ZbyBhzec5EF9LWASwOBMW/zRWUaeCd/xCVh2Gnu9QlvKx2LgkfPbaAEn3onn1+6m3G5e6yI9TRA3P5q3XqDQ==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by CH2PR02MB6984.namprd02.prod.outlook.com (2603:10b6:610:8d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 08:07:41 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%7]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 08:07:41 +0000
Message-ID: <e8d413c9-d030-fbf1-16a3-4a4e2116df0f@nutanix.com>
Date: Fri, 13 Jan 2023 13:37:26 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/5] migration: Updated QAPI format for 'migrate' qemu
 monitor command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Manish Mishra <manish.mishra@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
References: <20221226053329.157905-1-het.gala@nutanix.com>
 <20221226053329.157905-2-het.gala@nutanix.com> <Y7wfoGpM6iwzy8L1@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y7wfoGpM6iwzy8L1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::7) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|CH2PR02MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c07f011-13bb-4a42-a7ce-08daf53d3e2a
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AylqzHHdHtv7P993yz8amiEf9O5HpL3mGOEpyAwmilvFqlqlUKpPjt4iy9Qtd3O7W1VFqyeIwQP2CuMm7KVBKaVB2lE0+EugAMFseuHRzLqF6ctfr6Dcsn5nmxg6vdV18UmUWU6ggWM7Cr9nnIYpI4TvTiwBQTMI4d4gSunnpgN6yYhkJ9OMZZPVJOAzyqHO4XXJFtdRuV6YmLrSsmBNN/IFNwDBkxhjsTgec/ICJqjado2E7o8F2eOGMipbhrf/xbuoMiQ7hl70aF3CyKbn1RImDU3KzRHmEmgGOztkxJ5nPs7ljRDu7tAEQRuW/aoR4WPTuk9kuqzMeYkx0v+1kGXktUwcBCSWorQLbqZTaa0RsYCSvvW3yWgQgeJK2DMX+/PHE5i+ImkEoq5EF3FoxXL0YqsHfygkudFn9vI1//VhAG7ULbsdk447hF2mhV7oOhdg31DWzWu6kOsnqSN74MUFMbmOE+YjmkQc3tHD6Oj5lHxVc4BHV/ktGhQ8zFwYeScn4WIFwNEdNhuMeLnNPK6BptsuxOa33KsHCZ/voy2hLGYJn9Hv+aCATSAaoe/b0LuBvO2FcrmfTdWQNhHR2DZs9PDsN2MbfQM6nnaOr1mzwPsmdwjN0JrnchaTCYhrWpuRjSwl/Z5zKCseDqEX57AmJy6xkUEDwa6DnRWJtDTIxcbQBmEFc6v5USEQa30cPA8mYDKcO3V0PXdincgNiR2W+2ldQ/4et1nywutP/zYGGTsKqsBDBNGm2MQoSYTVravAiCErwRiKa1CjaBu6YVx9653zxbiyJ+cSLCN2QJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199015)(6506007)(107886003)(6666004)(2906002)(36756003)(5660300002)(53546011)(83380400001)(8936002)(44832011)(31686004)(6916009)(4326008)(8676002)(38100700002)(6512007)(38350700002)(966005)(41300700001)(6486002)(478600001)(66946007)(26005)(66556008)(66476007)(52116002)(186003)(86362001)(31696002)(2616005)(316002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDNxek8xZEtjelUvVHBGSk9jdDBGalNNRkhOYTh4d1hsdWhRSnpuSnVHdmxN?=
 =?utf-8?B?K3FBUTcwaFpUOWI3NkhFVnBkcHdGdXNHNTd1ZzZyUlArbVFtWXB0MnJ5eVBG?=
 =?utf-8?B?MnRHY3VJNjJwblZRd0tHK0RaNGZXMUxHZUh4TE43KzRqN2FTeWl0TDh3Zk1B?=
 =?utf-8?B?MXZyQWpPQUt4aDJBd3hFeDhkTGhHTnM0V05pcnAxcnhDSVJFZnB2WWRTbHZK?=
 =?utf-8?B?MU9hektTVHowMVpYUkthVlBwZVYxSnV5RUl3NE5vZzRjOVlFaEJ4WXh2RDJr?=
 =?utf-8?B?UjV4Tmkvam9hZnJUSitCdTUwNW1CYjM3UTNNbmpKNTNDSnpFNmVrOWJBem5j?=
 =?utf-8?B?QmEwWHRlTmV4c21tdDEzeXdUYm1pMGRBK3l0emNDSjBQUVFIRGZlTXplR1ZH?=
 =?utf-8?B?blU3SUthSE5haWpDRW5ONDQ0Z25UYW1sY2lwUVBtNHdWYmE4SXg4YWtPL1Zl?=
 =?utf-8?B?WE96ZUpLYVJZN0FzTkJsclFHK2NWb1p5Z3FaRWpwVUtxVW1ESGJ3VzQxK2gy?=
 =?utf-8?B?MUtqT2t4L3VjaE1zYU55NVdSQUZESmZGVGNNMnp4S3RIeURROTg2d0wwdHRN?=
 =?utf-8?B?UmpsVnZJQkpqcnVCQTBGRTFVaDZZdXF2M01rUWRpTTNxSEszekxPNy9VbjNj?=
 =?utf-8?B?bmxpVEtZc3h4VUZZSHRnd3owQ1RaRUtwWHFzaUY4R0F0eFc0RWFUVHFSOWdR?=
 =?utf-8?B?N3VlWE4vMExTMEJxQURuQnJXZTJMaDFYaEtuaStOY1kvcUtuWFBFRDFtaGd0?=
 =?utf-8?B?a3BtSjBhdE9BSGZJR2lhVnY0UE40ejlMWTlKMmYzTzdZV1FjMlZ1aDg2b0ZQ?=
 =?utf-8?B?KzhjOHpqYkdqLzg2bHhtdk1jR2NSclVaR0FJYjlNdFdCM0M4RFVQVjNZc2ZY?=
 =?utf-8?B?Tm1xNS9lV2tZaDljYUZ6MkhZTkpoU3pWVXpoWGxjN3JlZU5FaTdSNkRuNVJm?=
 =?utf-8?B?eC9aOFNlbTJHQzJDcmtmOGF1NFhGeXRidDNVUzVqOUdoSEZHdTU2YjVOU3hq?=
 =?utf-8?B?SUgvN2pyY25YMGsxTGtTayt1aHNQMWhVS1JYZ3JRVkhhV1Jmbm1XZXBuK3VE?=
 =?utf-8?B?dUhiaXRkV3UxbXRLZjAzM2h3MXdhWUhTQWp6cXU5YUEzbFN5S3dFb3I4bnJw?=
 =?utf-8?B?R1RNamFDWTNIdDRMVitTWnZMcXRwT1poR0h6eVVMKytLQlRwazR2Q1NvUzNx?=
 =?utf-8?B?V3NycWhCYlVVOXY3ZzNqVmdsNzZDbi9tVytGcnltbW9jdkZFTUs2U25KZTl6?=
 =?utf-8?B?TEpqZDN5aTVHR2wyalBGOXdwTkd5QVJ5VURRajVZT3IrZncxYzdhOWQzMmRQ?=
 =?utf-8?B?dGliTGdPVjRZZG1GK0pWY2Q3M1VBMnV5d0dnbVIvdDk4ZG9pMzFXUUN2UVVS?=
 =?utf-8?B?MTFaVXZTNm5waktPQ2g3RkdkclA1cjhqMEMrVkh5cnZUclJuRndiUUIwcjdX?=
 =?utf-8?B?cTRkYnRFZmFGbC9BaE9rZ01vQUtaSVNTQ3QwU2JWZ3B4enJTYlpHZnhxSnR2?=
 =?utf-8?B?aFNXNTN2aE8rNTB5MHJhWWo2czRUUFhxWEIwY1M2c3Z3MlloRm1lRDdYQldi?=
 =?utf-8?B?WEYyUVpJTmNwZU5MZ000b3JZQnFhQjNnOGJ6OFdSb0x5Z0tmM0RYam5EUHdz?=
 =?utf-8?B?RXhjYXJYTEN5TlFZT1lxVG8wbEovNXdTNVlMOUxITTdHU3lnbjRkZHBaRlBj?=
 =?utf-8?B?eVgrKzl3eUZxOWRkUkwvc01YYlB6b2twNWRwZWxkbStDMFlTNHY4cXlCN2h3?=
 =?utf-8?B?a3BoLzF2cS9qRk9OY0lQdjI2S01OK2NmMFA5TEpVbWREOHE3d2lKZnd6dHRk?=
 =?utf-8?B?ckduM0hRMEFHWnpVYUdtL1hrdnBoNTZDTWhVdExUTXBEZlg3QURSc2xROGs4?=
 =?utf-8?B?Sm9Ed2NETHN5WGtlOWFEcjFQOEdpb1FlRk1kaCtWVWUxODY3a2VsbmRiUnJR?=
 =?utf-8?B?R25kbkRnZ0hKQ0RWWkYvUEF3bTgyNHpwSzE2WExSRC84M2RPWmlvTjFiZXZo?=
 =?utf-8?B?Uk0rQkk0SERnaEgwMlU5SjE1Z3ROVCs1TVNreTVzb2JpU1pzYmRFbHJGbXI3?=
 =?utf-8?B?c0RSY3RuSThOeXZaRHg4QytQbFpBcnhDZGxJSVEyWHNxL0J4bFlhZTRXUVdV?=
 =?utf-8?Q?QbT0XTMpoSkYxiVE8odtJmMLq?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c07f011-13bb-4a42-a7ce-08daf53d3e2a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 08:07:41.4889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6wmhfcxhtx/v8+uuToxgVxSsOFX1BT115X7mG8g4v7MesOWAOW+6h66qpsH8wtFLku+E7f5HIvhzz+6+3fT8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6984
X-Proofpoint-GUID: C2jbGJlRdahtQb0WdW8uYWx-Q80eR-mW
X-Proofpoint-ORIG-GUID: C2jbGJlRdahtQb0WdW8uYWx-Q80eR-mW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-13_03,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
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


On 09/01/23 7:37 pm, Daniel P. Berrangé wrote:
> On Mon, Dec 26, 2022 at 05:33:25AM +0000, Het Gala wrote:
>> From: Author Het Gala <het.gala@nutanix.com>
>>
>> Existing 'migrate' QAPI design enforces transport mechanism, ip address
>> of destination interface and corresponding port number in the form
>> of a unified string 'uri' parameter. This scheme does seem to have an issue
>> in it, i.e. double-level encoding of URIs.
>>
>> The current patch maps existing QAPI design into a well-defined data
>> structure - 'MigrateChannel' only from the design perspective. Please note that
>> the existing 'uri' parameter is kept untouched for backward compatibility.
>>
>> +##
>> +# @MigrateRdmaAddr:
>> +#
>> +# Since 8.0
>> +##
>> +{ 'struct': 'MigrateRdmaAddr',
>> +   'data' : {'rdma-str': 'str' } }
> Loooking at the RDMA code it takes the str, and treats it
> as an IPv4 address:
>
>
>          addr = g_new(InetSocketAddress, 1);
>          if (!inet_parse(addr, host_port, NULL)) {
>              rdma->port = atoi(addr->port);
>              rdma->host = g_strdup(addr->host);
>              rdma->host_port = g_strdup(host_port);
>          }
>
> so we really ought to accept an InetSocketAddress struct
> directly
>
>   { 'struct': 'MigrateRdmaAddr',
>      'data' : {'rdma-str': 'InetSocketAddress' } }
>
Hi Daniel. I was going through the rdma code, and I think we also need 
'host_port' for rdma_return_path context 
https://github.com/qemu/qemu/commit/44bcfd45e9806c78d9d526d69b0590227d215a78. 
I dont have much understanding but If you have any suggestion or a 
workaround for this, please suggest :)
>
>> +
>> +##
>> +# @MigrateAddress:
>> +#
>> +# The options available for communication transport mechanisms for migration
>> +#
>> +# Since 8.0
>> +##
>>
> With regards,
> Daniel
Regards,
Het Gala

