Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C59B3FCF03
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 23:17:54 +0200 (CEST)
Received: from localhost ([::1]:32786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLB8e-0000xJ-8Y
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 17:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mLB7K-0008Qh-0N
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 17:16:27 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:30938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mLB7F-000620-Pi
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 17:16:25 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17VIiRbm012460; 
 Tue, 31 Aug 2021 21:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=EyWp9DQSmLPnIOJJkVg+UkMl2uRykeYu/8vA/biMYnA=;
 b=CWMxOoZyrlVxsNoN8uC/i8ug7xt0B77LecP6kDl0F6d+WARU5Y7qaAjvQYl35YZxgefj
 o29T1A3W+WfLtZvcyFqusfSzmPWtPLB196UG4muZEXuXRQz5NGfRBCKdytUacRcnlV1q
 RDfiP3SWGU8WAA5KMC497COuYmLssj9R8Ojwj4XqRxjUt2Y6QJoJpcQB4uXTHTCWRzbc
 4OV2NxS+Jni2fTAYfl8fnwT0MHgzJXWF1/B2P6ig3ym7q2oXm6HGyEkNKKxhkxwU+3CA
 MujZtGDLc1Aocz+tsqPaQ5FMq0fBp2CdsyzVLiTXE9ACm7Yvm1owntNRahK2c3qlesoD PA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=EyWp9DQSmLPnIOJJkVg+UkMl2uRykeYu/8vA/biMYnA=;
 b=drOQNA48vitmt6WISyR3LEtK4aZAp0stAY02BagrFMDrtN/eUnTd78myHYZ5VWBJfSsh
 2dGwPWNa/5tg2BBx28Ow1IbyYBhAHzQs7Gidm8yjcKXdt9S92niURlss/ulAhzFtAQi0
 xwrnuq3yPkG0lGp5zSul45bcM5OIYDrhuNKN/En6rCqEjTzyGPHQjyJUGhngOw9L/aUR
 gHRg458CRudKwYyI1P1riRalkQmVPFUTX7FKevBHqSRpyidXhiE2LGm8SBLIpdJmCpCX
 5bHHhub8Z75GAgk58ZJp21xTrAz18oKXNef1K3EVLglxefqYSLFx0iHT4uElwVoFV2pM Nw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3asdn1tk84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Aug 2021 21:15:11 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17VL9pOH107287;
 Tue, 31 Aug 2021 21:15:10 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2043.outbound.protection.outlook.com [104.47.56.43])
 by userp3020.oracle.com with ESMTP id 3aqxwua06b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Aug 2021 21:15:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxWwBSsdF9Tpk9G2OsgAg8Stec753GwyOfI7AY+QrEWI1BWNGSeGs81nhKF5Pvst7Z6HcdTIgkKrwy4rfa1AOguWevGkVcTlFgwLZexQLJyEGoeco3NvEgTlmiCxaBXXfKDRiC6ch9p9RMIeVzJ2/CDMz3q55/vq4FPRMFqyszATL0cHVK0l1KE8/wM3cQaDrv3h3KmP6VQMKeFyL078anoJNFAHP7E9AehDfbutWZCAPnKXx1T/L+Rif8x9UZwz2UBKBQd3z6DNCQ5MSRnyyLykq55qSZFmo4he6mkn6rFuSZXCs2e5Sp2+mLlP2TJyuUHXHJQHMpzlq78TfQdstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EyWp9DQSmLPnIOJJkVg+UkMl2uRykeYu/8vA/biMYnA=;
 b=hbkOZuUbEkSTgHKYFqlPRV2JyEiwDp92Fb2EeK35ajbhMki6mEZx3nNR/8UKrMolxraMnmX7BDZVsWLRxt9YsGkE9KgAEKMf656HA2CFDf5m2wmOs+S4nOvHzMeAgq7cdWKpvotwmRgVlnmAYgh+kWuhI54Jp1nimh6JvjhpKxlXGwpRgs2l3hN/Wn6GSv41UDkeR5YhiEFVzDOZEmas3psgrkuwmC9vPpCjydgLx2bd+6HHwcHJAHxMtFbY3FJxt4ZWzVeV47srZWpbSGRJPDTJ1QOf5dSWdoaHtnS4FR3ZvLLZa/8ldJxgvpgBadICL6sp6vYhnwKwi9u6WeolcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EyWp9DQSmLPnIOJJkVg+UkMl2uRykeYu/8vA/biMYnA=;
 b=GRfzrgquwv5jXR5OVEfn98G5P+yiUOgkpycGiQrJqOBO6pk/STQxYaet/NzhqBtIQ9ALRyOQX+WeKRylcOmYMI8nireqZeNj/QTe7ub+xMnb0hNyncFR4l2r29VDaPdmoykia9VsABHGikq1p4PT0+XWR9L1Vj2cSzV0KAFWjlM=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2678.namprd10.prod.outlook.com (2603:10b6:a02:a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 21:15:07 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::5cdb:a037:dbd1:dcac]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::5cdb:a037:dbd1:dcac%6]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 21:15:07 +0000
Subject: Re: [PATCH V6 00/27] Live Update
To: Zheng Chuan <zhengchuan@huawei.com>, qemu-devel@nongnu.org
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
 <6d048286-eef4-0f6a-58da-7fc7369dccf7@huawei.com>
 <5e5821eb-ce92-f429-0ec8-985e714a171a@oracle.com>
 <83231acb-bbb5-f590-d58b-e664880c41f8@huawei.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <24e53925-ea78-b31e-2c73-0c52943c1106@oracle.com>
Date: Tue, 31 Aug 2021 17:15:03 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <83231acb-bbb5-f590-d58b-e664880c41f8@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::9) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.39.225.180] (138.3.201.52) by
 SJ0PR05CA0034.namprd05.prod.outlook.com (2603:10b6:a03:33f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.10 via Frontend Transport; Tue, 31 Aug 2021 21:15:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab9a9d43-2adb-4632-fd9a-08d96cc46843
X-MS-TrafficTypeDiagnostic: BYAPR10MB2678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB26782AF6F75958724FC8576BF9CC9@BYAPR10MB2678.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gPTXULg3qsmY8JOi685XNEsANnKLwSieOFTgSG6F+JNF8aZuRIB+p3G5rngLW0EAqthHxAxeRZcxsNkVDL9rr5rL8sJvLLN8clmW81UNWrwG0vNvk1A7JL4VJARl3r7TSFiVNwi2bCtSUmdqKS7donnkmNx1jC0CTHrsvNpoWVtcxyZJki5E/YhFpkq8/mkLzMX0CJquwO4nfcqSXmY4ghK7il0LP9jM6xAER4tLE6TXHLc8v+MEt4Bhm1llcoA2ds/i/OJ6IShD2Pktvedmwa0ZJ7JczBOKcE1nleFnAxDaTGUzOYXtM+AztagST6IhkuXt9SO6Yz/w1doOoXWGrUsQ1uiyxXiHLFK24Xf6qARMiBH/Y9V56YxdPTkfnPZBjBtZaqPYH6IzFItH5R6BOajNlVR2Jq9gH99gpxHlUKJ2t7HQT5x3zzJd+wC62fUWDYar0O4XVOHb18GJckQguCgB29oDC7dH9V4D7vD1x9xe0yzWgNv13Xko2KmtFgTQ21S1cJW8mwzSTEPvDdzMCiKlge/OB9FO8KIqRu2W3jgwcw7dpvd60DaLE1yMmAR7RB792q8qUaNAYwvGyXYVWE7bqxczSHV34/SdwLSiyzllutqQ2f5oatJ4/956bCZ4nA1qz6EwZ9kvjDb7OOvKN03Er7pYe+SZrnSUYawdQvAa1xf4XphteOSq+s+wFkGmFMBpXL7QHgawgyVs0PCGlZfVLrHHNnzFfarhTUHesgQqdW//GvYu/JW6J2Jste9OPoFOPrX9kND0aeZ2cOr+moH8zcttrZYaUnANo912sr3UNftsnSdWo10ZUp00h9OEHmqmxrMTFXRVA590WaW7VmA18/fbvjqY46XJjvNSHhw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(346002)(136003)(39860400002)(316002)(2616005)(38100700002)(8676002)(26005)(30864003)(44832011)(31696002)(186003)(2906002)(16576012)(4326008)(54906003)(966005)(66946007)(53546011)(8936002)(7416002)(107886003)(478600001)(86362001)(36756003)(956004)(66476007)(5660300002)(6486002)(15650500001)(36916002)(83380400001)(66556008)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlloUEtlQXhDMHFMSFV6S2VSQVhOVmV5Uit3bWZNaWhGazBiZmlwL0UyejAr?=
 =?utf-8?B?NnhKbWpGdWxQOWtEb3V1NWIwQXZ4c1F4RWpUQS9nOHh4dHduWlcya0hHbWdM?=
 =?utf-8?B?Y1BIY2RnSktkZmxaRUk5Y21vWlRUMUIzTnhKNnF6eDM3ZW5oM3FIZjJGSjVP?=
 =?utf-8?B?NEJJVmlSTXF0VFBFZHcrUVdUWngwSlIrSUcvQUIzR1lqZ1laTTU3YVREOE9D?=
 =?utf-8?B?UEJmb0lpT1NiZVdrTTlhMFRKR2U2S0lCVnV0SFllSE53NGlWLzhkMDRUZnNZ?=
 =?utf-8?B?OUFOQUovemtjS0syL2w3RzVma0dlUXJUZzJiWnV4OUo0SGptVUtubk9PcUR6?=
 =?utf-8?B?NG1HMFN5ZnV0dFVyaVcwMVZ5TVQrNFZGZlh1NnFuVVBwdkxGb1VxUHhjTEZB?=
 =?utf-8?B?d3FwSTNOSkRBandmYmozdDdyVDhqcmFWSkhHS20reERPZ3lUY2RkTmE0QWJv?=
 =?utf-8?B?N3VCOTl4NVQ1WThjR3BPdjZzQWd5RStEbUY4YlFRTEQ5bGkvNFRhd1llYU0v?=
 =?utf-8?B?a2RmSm9HQnI2cG0zbkJ6bzM2dHBEaDhWNkJEc2ttZnRMdnF0MDNOUkU0aEF1?=
 =?utf-8?B?MWl1NGo2b0M3NEorZjNjQUNnTkNTdHBkZ0Y0RW92bWJmalRiV0xkRExnM0p0?=
 =?utf-8?B?V1l1Vy9JMC9IeEk3emJGNnFuL1k1M2VQR081d09ZcHB5bExiamtTWDdKdGY3?=
 =?utf-8?B?MDA3dGpiLzU5UjFuaDg4Z2UyUGhsdS96c0R1M3VwRml2c2wxdEMxWG5DaHBi?=
 =?utf-8?B?VTRaZWdxLzF2czd3Z2N4cDlZZWVITnVkdHNaTXhDNFF4dElsZmp2MmROZGJ3?=
 =?utf-8?B?N3lIWnBKNENJMXFOaHEyQ3o4VWNITms2ZjluZFltTlo0UWhFdUR1b0dHbzRI?=
 =?utf-8?B?VS9IcksrdjVOTitJTEZ2bVhSMFNia3lweVZ5RTR4NEEyOFFYOGNXcUMzempy?=
 =?utf-8?B?Wk1vWkhCcis5ME5GWnpoT2k4eituRUZOU3MrazZ4NFpXMXUvd3RRR3h4MXJy?=
 =?utf-8?B?eC95N1hQSSs1T2FxR1RuQ2UzVFY2ei92cUZIMzlQWDFxNkdoQ0hjUy9ZZkxD?=
 =?utf-8?B?QWM4VGJDckloaFhMTkI2L0VBNDVSN05kcjZaajl1T29wSTdydVl1UytidTVE?=
 =?utf-8?B?K0VJU1E2NjJsWjRyS2VvM0s1ZExTY3ZJTWZyUlE4bDJoY3JCejkyMzRMa0dE?=
 =?utf-8?B?bFlIRVdoNFRrSEYvejhMMHI0K1lKYm15dnJNSmFoR3MvempoM1ZKMEJmQWk3?=
 =?utf-8?B?NmJBbHRFeVNWRU5xaGxJUWpLc28rcDhZa1NLRHFqV3dmS0k4V21kNE40aGx4?=
 =?utf-8?B?eXZWQ014ckhyMjRkb0cwRnR0UEM4YnRpZ0s2eEJ6M2dabW5ta1E1MmFKRzZo?=
 =?utf-8?B?dEJlRE9sVHZPLzBIYUpCZDZDV3VCM2FKS1dGV0JZL1E4cGV0NVplZjVzd3B3?=
 =?utf-8?B?VURYaUsxMXNzSlkzMGhSQlE5eVZJVzB5cC9DbmR4T2xNSkhWR2tCT3ZmZXZ5?=
 =?utf-8?B?UUZoYTZKYjEvZHZVb0xLV3EzaldHR1ZLdEQ5UUlkT1QvMWlSQVBYcVhMWUJp?=
 =?utf-8?B?OWpvM1FlL0VaUmdmc09HMy90cllBUW4vUlBsd3NkcVcvSkd5ZkR4MmhNdzBT?=
 =?utf-8?B?MHM4dlhpMjZYMkdyWGFSaGFBVy9BdG4wK0FQZEI1U2xoTjNWSk93UVBEbVdY?=
 =?utf-8?B?TWlqaHZWdWFCSTAyd1oyL0wzWWI4VUJabi9nMmpiSVN1ZDhMVnUyUXNEcXJl?=
 =?utf-8?Q?T0mmxBENz8HIDEQcWzqQLVBb2730eUZsPqxXqLL?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9a9d43-2adb-4632-fd9a-08d96cc46843
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 21:15:07.1440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OeB/YFVCF4tanS0Wj/c3wKe4Yr0SRIiaLk/Zx7zVAwwOMYLX62DdbUWBFjIZ/YraawDfGi78Z+1seLXW2qEfR8Gl/jCc4eIieQC1dHFQgks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2678
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10093
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108310116
X-Proofpoint-ORIG-GUID: z-JPxKoKzI9SQ37HbgPo8eWL58Z7uv7L
X-Proofpoint-GUID: z-JPxKoKzI9SQ37HbgPo8eWL58Z7uv7L
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/2021 5:36 AM, Zheng Chuan wrote:
> Hi, Steve.
> 
> I think I have found the problem, it is because the rom_reset() during the cpr_exec will write dtb into the mach-virt.ram which cause the memory corruption.
> Also I found in x86 the memoryregion of acpi also changed during rom_rest. Maybe we should keep it consistent and skip the rom_reset() like migration does.
> Here is the patch drafted(Also fix the cpr state missing saving problem):

Hi Chuan, thank-you very much for debugging the problem.  rom_reset() is a great find.
I also noticed and have a fix ready for the mode bug. I will add similar fixes to patch V7.

- Steve

> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 5b34869a5417..1dcf0be1492f 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -50,6 +50,7 @@
>  #include "hw/hw.h"
>  #include "disas/disas.h"
>  #include "migration/vmstate.h"
> +#include "migration/cpr.h"
>  #include "monitor/monitor.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/sysemu.h"
> @@ -1128,7 +1129,7 @@ static void rom_reset(void *unused)
>           * the data in during the next incoming migration in all cases.  Note
>           * that some of those RAMs can actually be modified by the guest.
>           */
> -        if (runstate_check(RUN_STATE_INMIGRATE)) {
> +        if (runstate_check(RUN_STATE_INMIGRATE) || cpr_is_active()) {
>              if (rom->data && rom->isrom) {
>                  /*
>                   * Free it so that a rom_reset after migration doesn't
> diff --git a/include/migration/cpr.h b/include/migration/cpr.h
> index e9b987f54319..0b7d7e9f6bf0 100644
> --- a/include/migration/cpr.h
> +++ b/include/migration/cpr.h
> @@ -20,9 +20,11 @@ void cpr_save_fd(const char *name, int id, int fd);
>  void cpr_delete_fd(const char *name, int id);
>  int cpr_find_fd(const char *name, int id);
>  int cpr_walk_fd(cpr_walk_fd_cb cb, void *handle);
> -int cpr_state_save(Error **errp);
> +int cpr_state_save(CprMode mode, Error **errp);
>  int cpr_state_load(Error **errp);
>  CprMode cpr_state_mode(void);
> +void cpr_state_clear(void);
> +bool cpr_is_active(void);
>  void cpr_state_print(void);
> 
>  int cpr_vfio_save(Error **errp);
> diff --git a/migration/cpr-state.c b/migration/cpr-state.c
> index 003b449bbcf8..4ac08539d932 100644
> --- a/migration/cpr-state.c
> +++ b/migration/cpr-state.c
> @@ -19,7 +19,7 @@ typedef struct CprState {
>      CprNameList fds;            /* list of CprFd */
>  } CprState;
> 
> -static CprState cpr_state;
> +static CprState cpr_state = { .mode = CPR_MODE_NONE };
> 
>  /*************************************************************************/
>  /* Generic list of names. */
> @@ -149,7 +149,7 @@ static const VMStateDescription vmstate_cpr_state = {
>      }
>  };
> 
> -int cpr_state_save(Error **errp)
> +int cpr_state_save(CprMode mode, Error **errp)
>  {
>      int ret, mfd;
>      QEMUFile *f;
> @@ -163,9 +163,11 @@ int cpr_state_save(Error **errp)
>      qemu_clear_cloexec(mfd);
>      f = qemu_fd_open(mfd, true, CPR_STATE_NAME);
> 
> +    cpr_state.mode = mode;
>      ret = vmstate_save_state(f, &vmstate_cpr_state, &cpr_state, 0);
>      if (ret) {
>          error_setg(errp, "vmstate_save_state error %d", ret);
> +        cpr_state.mode = CPR_MODE_NONE;
>          return ret;
>      }
> 
> @@ -205,6 +207,16 @@ CprMode cpr_state_mode(void)
>      return cpr_state.mode;
>  }
> 
> +void cpr_state_clear(void)
> +{
> +    cpr_state.mode = CPR_MODE_NONE;
> +}
> +
> +bool cpr_is_active(void)
> +{
> +    return cpr_state.mode != CPR_MODE_NONE;
> +}
> +
>  void cpr_state_print(void)
>  {
>      CprName *elem;
> diff --git a/migration/cpr.c b/migration/cpr.c
> index d14bc5ad2678..97b2293c01e8 100644
> --- a/migration/cpr.c
> +++ b/migration/cpr.c
> @@ -115,7 +115,7 @@ void qmp_cpr_exec(strList *args, Error **errp)
>          return;
>      }
>      cpr_walk_fd(preserve_fd, 0);
> -    if (cpr_state_save(errp)) {
> +    if (cpr_state_save(cpr_active_mode, errp)) {
>          return;
>      }
>      vhost_dev_reset_all();
> @@ -173,4 +173,5 @@ void qmp_cpr_load(const char *filename, Error **errp)
> 
>  out:
>      cpr_active_mode = CPR_MODE_NONE;
> +    cpr_state_clear();
>  }
> 
> 
> On 2021/8/24 5:36, Steven Sistare wrote:
>> Hi Zheng, testing aarch64 is on our todo list. We will run this case and try to 
>> reproduce the failure.  Thanks for the report.
>>
>> - Steve
>>
>> On 8/21/2021 4:54 AM, Zheng Chuan wrote:
>>> Hi, steve
>>>
>>> It seems the VM will stuck after cpr-load on AArch64 environment？
>>>
>>> My AArch64 environment and test steps:
>>> 1. linux kernel: 5.14-rc6
>>> 2. QEMU version: v6.1.0-rc2 (patch your patchset), and configure with `../configure --target-list=aarch64-softmmu --disable-werror --enable-kvm` 4. Steps to live update:
>>> # ./build/aarch64-softmmu/qemu-system-aarch64 -machine virt,accel=kvm,gic-version=3,memfd-alloc=on -nodefaults -cpu host -m 2G -smp 1 -drive file=/usr/share/edk2/aarch64/QEMU_EFI-pflash.raw,if=pflash,format=raw,readonly=on
>>> -drive file=<path/to/vm.qcow2>,format=qcow2,if=none,id=drive_image1
>>> -device virtio-blk-pci,id=image1,drive=drive_image1 -vnc :10 -device
>>> virtio-gpu,id=video0 -device piix3-usb-uhci,id=usb -device
>>> usb-tablet,id=input0,bus=usb.0,port=1 -device
>>> usb-kbd,id=input1,bus=usb.0,port=2 -monitor stdio
>>> (qemu) cpr-save /tmp/qemu.save restart
>>> (qemu) cpr-exec ./build/aarch64-softmmu/qemu-system-aarch64 -machine virt,accel=kvm,gic-version=3,memfd-alloc=on -nodefaults -cpu host -m 2G -smp 1 -drive file=/usr/share/edk2/aarch64/QEMU_EFI-pflash.raw,if=pflash,format=raw,readonly=on
>>> -drive file=<path/to/vm.qcow2>,format=qcow2,if=none,id=drive_image1
>>> -device virtio-blk-pci,id=image1,drive=drive_image1 -vnc :10 -device
>>> virtio-gpu,id=video0 -device piix3-usb-uhci,id=usb -device
>>> usb-tablet,id=input0,bus=usb.0,port=1 -device
>>> usb-kbd,id=input1,bus=usb.0,port=2 -monitor stdio -S
>>> (qemu) QEMU 6.0.92 monitor - type 'help' for more information
>>> (qemu) cpr-load /tmp/qemu.save
>>>
>>> Does I miss something?
>>>
>>> On 2021/8/7 5:43, Steve Sistare wrote:
>>>> Provide the cpr-save, cpr-exec, and cpr-load commands for live update.
>>>> These save and restore VM state, with minimal guest pause time, so that
>>>> qemu may be updated to a new version in between.
>>>>
>>>> cpr-save stops the VM and saves vmstate to an ordinary file.  It supports
>>>> any type of guest image and block device, but the caller must not modify
>>>> guest block devices between cpr-save and cpr-load.  It supports two modes:
>>>> reboot and restart.
>>>>
>>>> In reboot mode, the caller invokes cpr-save and then terminates qemu.
>>>> The caller may then update the host kernel and system software and reboot.
>>>> The caller resumes the guest by running qemu with the same arguments as the
>>>> original process and invoking cpr-load.  To use this mode, guest ram must be
>>>> mapped to a persistent shared memory file such as /dev/dax0.0, or /dev/shm
>>>> PKRAM as proposed in https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com.
>>>>
>>>> The reboot mode supports vfio devices if the caller first suspends the
>>>> guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
>>>> guest drivers' suspend methods flush outstanding requests and re-initialize
>>>> the devices, and thus there is no device state to save and restore.
>>>>
>>>> Restart mode preserves the guest VM across a restart of the qemu process.
>>>> After cpr-save, the caller passes qemu command-line arguments to cpr-exec,
>>>> which directly exec's the new qemu binary.  The arguments must include -S
>>>> so new qemu starts in a paused state and waits for the cpr-load command.
>>>> The restart mode supports vfio devices by preserving the vfio container,
>>>> group, device, and event descriptors across the qemu re-exec, and by
>>>> updating DMA mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR and
>>>> VFIO_DMA_MAP_FLAG_VADDR as defined in https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sistare@oracle.com/
>>>> and integrated in Linux kernel 5.12.
>>>>
>>>> To use the restart mode, qemu must be started with the memfd-alloc option,
>>>> which allocates guest ram using memfd_create.  The memfd's are saved to
>>>> the environment and kept open across exec, after which they are found from
>>>> the environment and re-mmap'd.  Hence guest ram is preserved in place,
>>>> albeit with new virtual addresses in the qemu process.
>>>>
>>>> The caller resumes the guest by invoking cpr-load, which loads state from
>>>> the file. If the VM was running at cpr-save time, then VM execution resumes.
>>>> If the VM was suspended at cpr-save time (reboot mode), then the caller must
>>>> issue a system_wakeup command to resume.
>>>>
>>>> The first patches add reboot mode:
>>>>   - memory: qemu_check_ram_volatile
>>>>   - migration: fix populate_vfio_info
>>>>   - migration: qemu file wrappers
>>>>   - migration: simplify savevm
>>>>   - vl: start on wakeup request
>>>>   - cpr: reboot mode
>>>>   - cpr: reboot HMP interfaces
>>>>
>>>> The next patches add restart mode:
>>>>   - memory: flat section iterator
>>>>   - oslib: qemu_clear_cloexec
>>>>   - machine: memfd-alloc option
>>>>   - qapi: list utility functions
>>>>   - vl: helper to request re-exec
>>>>   - cpr: preserve extra state
>>>>   - cpr: restart mode
>>>>   - cpr: restart HMP interfaces
>>>>   - hostmem-memfd: cpr for memory-backend-memfd
>>>>
>>>> The next patches add vfio support for restart mode:
>>>>   - pci: export functions for cpr
>>>>   - vfio-pci: refactor for cpr
>>>>   - vfio-pci: cpr part 1 (fd and dma)
>>>>   - vfio-pci: cpr part 2 (msi)
>>>>   - vfio-pci: cpr part 3 (intx)
>>>>
>>>> The next patches preserve various descriptor-based backend devices across
>>>> cprexec:
>>>>   - vhost: reset vhost devices for cpr
>>>>   - chardev: cpr framework
>>>>   - chardev: cpr for simple devices
>>>>   - chardev: cpr for pty
>>>>   - chardev: cpr for sockets
>>>>   - cpr: only-cpr-capable option
>>>>
>>>> Here is an example of updating qemu from v4.2.0 to v4.2.1 using
>>>> restart mode.  The software update is performed while the guest is
>>>> running to minimize downtime.
>>>>
>>>> window 1                                        | window 2
>>>>                                                 |
>>>> # qemu-system-x86_64 ...                        |
>>>> QEMU 4.2.0 monitor - type 'help' ...            |
>>>> (qemu) info status                              |
>>>> VM status: running                              |
>>>>                                                 | # yum update qemu
>>>> (qemu) cpr-save /tmp/qemu.sav restart           |
>>>> (qemu) cpr-exec qemu-system-x86_64 -S ...       |
>>>> QEMU 4.2.1 monitor - type 'help' ...            |
>>>> (qemu) info status                              |
>>>> VM status: paused (prelaunch)                   |
>>>> (qemu) cpr-load /tmp/qemu.sav                   |
>>>> (qemu) info status                              |
>>>> VM status: running                              |
>>>>
>>>>
>>>> Here is an example of updating the host kernel using reboot mode.
>>>>
>>>> window 1                                        | window 2
>>>>                                                 |
>>>> # qemu-system-x86_64 ...mem-path=/dev/dax0.0 ...|
>>>> QEMU 4.2.1 monitor - type 'help' ...            |
>>>> (qemu) info status                              |
>>>> VM status: running                              |
>>>>                                                 | # yum update kernel-uek
>>>> (qemu) cpr-save /tmp/qemu.sav restart           |
>>>> (qemu) quit                                     |
>>>>                                                 |
>>>> # systemctl kexec                               |
>>>> kexec_core: Starting new kernel                 |
>>>> ...                                             |
>>>>                                                 |
>>>> # qemu-system-x86_64 -S mem-path=/dev/dax0.0 ...|
>>>> QEMU 4.2.1 monitor - type 'help' ...            |
>>>> (qemu) info status                              |
>>>> VM status: paused (prelaunch)                   |
>>>> (qemu) cpr-load /tmp/qemu.sav                   |
>>>> (qemu) info status                              |
>>>> VM status: running                              |
>>>>
>>>> Changes from V1 to V2:
>>>>   - revert vmstate infrastructure changes
>>>>   - refactor cpr functions into new files
>>>>   - delete MADV_DOEXEC and use memfd + VFIO_DMA_UNMAP_FLAG_SUSPEND to
>>>>     preserve memory.
>>>>   - add framework to filter chardev's that support cpr
>>>>   - save and restore vfio eventfd's
>>>>   - modify cprinfo QMP interface
>>>>   - incorporate misc review feedback
>>>>   - remove unrelated and unneeded patches
>>>>   - refactor all patches into a shorter and easier to review series
>>>>
>>>> Changes from V2 to V3:
>>>>   - rebase to qemu 6.0.0
>>>>   - use final definition of vfio ioctls (VFIO_DMA_UNMAP_FLAG_VADDR etc)
>>>>   - change memfd-alloc to a machine option
>>>>   - Use qio_channel_socket_new_fd instead of adding qio_channel_socket_new_fd
>>>>   - close monitor socket during cpr
>>>>   - fix a few unreported bugs
>>>>   - support memory-backend-memfd
>>>>
>>>> Changes from V3 to V4:
>>>>   - split reboot mode into separate patches
>>>>   - add cprexec command
>>>>   - delete QEMU_START_FREEZE, argv_main, and /usr/bin/qemu-exec
>>>>   - add more checks for vfio and cpr compatibility, and recover after errors
>>>>   - save vfio pci config in vmstate
>>>>   - rename {setenv,getenv}_event_fd to {save,load}_event_fd
>>>>   - use qemu_strtol
>>>>   - change 6.0 references to 6.1
>>>>   - use strerror(), use EXIT_FAILURE, remove period from error messages
>>>>   - distribute MAINTAINERS additions to each patch
>>>>
>>>> Changes from V4 to V5:
>>>>   - rebase to master
>>>>
>>>> Changes from V5 to V6:
>>>>   vfio:
>>>>   - delete redundant bus_master_enable_region in vfio_pci_post_load
>>>>   - delete unmap.size warning
>>>>   - fix phys_config memory leak
>>>>   - add INTX support
>>>>   - add vfio_named_notifier_init() helper
>>>>   Other:
>>>>   - 6.1 -> 6.2
>>>>   - rename file -> filename in qapi
>>>>   - delete cprinfo.  qapi introspection serves the same purpose.
>>>>   - rename cprsave, cprexec, cprload -> cpr-save, cpr-exec, cpr-load
>>>>   - improve documentation in qapi/cpr.json
>>>>   - rename qemu_ram_volatile -> qemu_ram_check_volatile, and use
>>>>     qemu_ram_foreach_block
>>>>   - rename handle -> opaque
>>>>   - use ERRP_GUARD
>>>>   - use g_autoptr and g_autofree, and glib allocation functions
>>>>   - conform to error conventions for bool and int function return values
>>>>     and function names.
>>>>   - remove word "error" in error messages
>>>>   - rename as_flat_walk and its callback, and add comments.
>>>>   - rename qemu_clr_cloexec -> qemu_clear_cloexec
>>>>   - rename close-on-cpr -> reopen-on-cpr
>>>>   - add strList utility functions
>>>>   - factor out start on wakeup request to a separate patch
>>>>   - deleted unnecessary layer (cprsave etc) and squashed QMP patches
>>>>   - conditionally compile for CONFIG_VFIO
>>>>
>>>> Steve Sistare (24):
>>>>   memory: qemu_check_ram_volatile
>>>>   migration: fix populate_vfio_info
>>>>   migration: qemu file wrappers
>>>>   migration: simplify savevm
>>>>   vl: start on wakeup request
>>>>   cpr: reboot mode
>>>>   memory: flat section iterator
>>>>   oslib: qemu_clear_cloexec
>>>>   machine: memfd-alloc option
>>>>   qapi: list utility functions
>>>>   vl: helper to request re-exec
>>>>   cpr: preserve extra state
>>>>   cpr: restart mode
>>>>   cpr: restart HMP interfaces
>>>>   hostmem-memfd: cpr for memory-backend-memfd
>>>>   pci: export functions for cpr
>>>>   vfio-pci: refactor for cpr
>>>>   vfio-pci: cpr part 1 (fd and dma)
>>>>   vfio-pci: cpr part 2 (msi)
>>>>   vfio-pci: cpr part 3 (intx)
>>>>   chardev: cpr framework
>>>>   chardev: cpr for simple devices
>>>>   chardev: cpr for pty
>>>>   cpr: only-cpr-capable option
>>>>
>>>> Mark Kanda, Steve Sistare (3):
>>>>   cpr: reboot HMP interfaces
>>>>   vhost: reset vhost devices for cpr
>>>>   chardev: cpr for sockets
>>>>
>>>>  MAINTAINERS                   |  12 ++
>>>>  backends/hostmem-memfd.c      |  21 +--
>>>>  chardev/char-mux.c            |   1 +
>>>>  chardev/char-null.c           |   1 +
>>>>  chardev/char-pty.c            |  14 +-
>>>>  chardev/char-serial.c         |   1 +
>>>>  chardev/char-socket.c         |  36 +++++
>>>>  chardev/char-stdio.c          |   8 ++
>>>>  chardev/char.c                |  43 +++++-
>>>>  gdbstub.c                     |   1 +
>>>>  hmp-commands.hx               |  50 +++++++
>>>>  hw/core/machine.c             |  19 +++
>>>>  hw/pci/msix.c                 |  20 ++-
>>>>  hw/pci/pci.c                  |   7 +-
>>>>  hw/vfio/common.c              |  79 +++++++++--
>>>>  hw/vfio/cpr.c                 | 160 ++++++++++++++++++++++
>>>>  hw/vfio/meson.build           |   1 +
>>>>  hw/vfio/pci.c                 | 301 +++++++++++++++++++++++++++++++++++++++---
>>>>  hw/vfio/trace-events          |   1 +
>>>>  hw/virtio/vhost.c             |  11 ++
>>>>  include/chardev/char.h        |   6 +
>>>>  include/exec/memory.h         |  39 ++++++
>>>>  include/hw/boards.h           |   1 +
>>>>  include/hw/pci/msix.h         |   5 +
>>>>  include/hw/pci/pci.h          |   2 +
>>>>  include/hw/vfio/vfio-common.h |   8 ++
>>>>  include/hw/virtio/vhost.h     |   1 +
>>>>  include/migration/cpr.h       |  31 +++++
>>>>  include/monitor/hmp.h         |   3 +
>>>>  include/qapi/util.h           |  28 ++++
>>>>  include/qemu/osdep.h          |   1 +
>>>>  include/sysemu/runstate.h     |   2 +
>>>>  include/sysemu/sysemu.h       |   1 +
>>>>  linux-headers/linux/vfio.h    |   6 +
>>>>  migration/cpr-state.c         | 215 ++++++++++++++++++++++++++++++
>>>>  migration/cpr.c               | 176 ++++++++++++++++++++++++
>>>>  migration/meson.build         |   2 +
>>>>  migration/migration.c         |   5 +
>>>>  migration/qemu-file-channel.c |  36 +++++
>>>>  migration/qemu-file-channel.h |   6 +
>>>>  migration/savevm.c            |  21 +--
>>>>  migration/target.c            |  24 +++-
>>>>  migration/trace-events        |   5 +
>>>>  monitor/hmp-cmds.c            |  68 ++++++----
>>>>  monitor/hmp.c                 |   3 +
>>>>  monitor/qmp.c                 |   3 +
>>>>  qapi/char.json                |   7 +-
>>>>  qapi/cpr.json                 |  76 +++++++++++
>>>>  qapi/meson.build              |   1 +
>>>>  qapi/qapi-schema.json         |   1 +
>>>>  qapi/qapi-util.c              |  37 ++++++
>>>>  qemu-options.hx               |  40 +++++-
>>>>  softmmu/globals.c             |   1 +
>>>>  softmmu/memory.c              |  46 +++++++
>>>>  softmmu/physmem.c             |  55 ++++++--
>>>>  softmmu/runstate.c            |  38 +++++-
>>>>  softmmu/vl.c                  |  18 ++-
>>>>  stubs/cpr-state.c             |  15 +++
>>>>  stubs/cpr.c                   |   3 +
>>>>  stubs/meson.build             |   2 +
>>>>  trace-events                  |   1 +
>>>>  util/oslib-posix.c            |   9 ++
>>>>  util/oslib-win32.c            |   4 +
>>>>  util/qemu-config.c            |   4 +
>>>>  64 files changed, 1732 insertions(+), 111 deletions(-)
>>>>  create mode 100644 hw/vfio/cpr.c
>>>>  create mode 100644 include/migration/cpr.h
>>>>  create mode 100644 migration/cpr-state.c
>>>>  create mode 100644 migration/cpr.c
>>>>  create mode 100644 qapi/cpr.json
>>>>  create mode 100644 stubs/cpr-state.c
>>>>  create mode 100644 stubs/cpr.c
>>>>
>>>
>> .
>>
> 

