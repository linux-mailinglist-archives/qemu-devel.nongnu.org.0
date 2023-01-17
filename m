Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F52670BF0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:45:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHuhv-0004CX-0z; Tue, 17 Jan 2023 17:45:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=438116b86b=dreiss@meta.com>)
 id 1pHuht-0004CK-ER; Tue, 17 Jan 2023 17:45:29 -0500
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=438116b86b=dreiss@meta.com>)
 id 1pHuhr-0005UU-JM; Tue, 17 Jan 2023 17:45:29 -0500
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30HLULF0030318; Tue, 17 Jan 2023 14:45:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=s2048-2021-q4;
 bh=wCuTcPoNeR7Qjny+ikG7c3PkyPBsrNLnRg9Q6ta3kvU=;
 b=PnpdIkKNsOSejvAhgNccSRUuIYGTpEO4gbHevmXDV33rJdQrrmbxQEHzVt3qobf+ssfX
 Djg5XSFi71I2X+culgg23V3kQCDLT/NJ7+iVjW2BJ+COUJ/ffCYP+FH5+wjPPfPatmaP
 2feU/g0j8ZOivKK/EQuTQiEgRcuHdknVMV0+JmAMpC8nWzuaGV5phPVbfN68qF+TpjLV
 FihVs/MuKxndjVnVWvs3zCkMUOPni1mDIFRRVW54/mQm3G8vQX1IOO1/H/uqf8MZp+mG
 N1v5gDtf/xPCmM3Yt8XkvJCZjCVRInftWpocG7pazaSrkc/QdESiFlGVgZ0WC7fKZsxj Ww== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3n5x0eb2ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 14:45:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2wfFoK/PGEudI+RZzboXb+mI9Wrg4mSvWP4eL2S4PBHlSIAaQoj6185cBn6094ozoDqqpjhvbvx0cJaTotk7QR8G9TRVbc0op4rOo6J72k1Yxufs970mdKNblSL8VcSlcukMIgdy0IygiWGPMHh/vOw3bGoAUqgexqLn91ny9odCF+9uPuxqO6u5RweVjCwCh2LZR/5Lhtn+lCGWrDI2RIOQBW1bbaldxcFriBsdsum9vakkbNcdeFLp8TcYIe/nbQxdC2XMxPU6oO+4frsyeUowz2D1tP1rI5HhkZvQGxXlxsCFB32Wc8iv2f+H4P5jkqbS/6oR4W8Us1oqZGLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCuTcPoNeR7Qjny+ikG7c3PkyPBsrNLnRg9Q6ta3kvU=;
 b=k5TBa+GcXvbgUQcdwD/uQmLu6m7qeaoDkw9yNdCvn5cb2n/RRp6TWOmzxDZOOvlIkYi028smnidz2MQ0rfX2xOfQ6IjtVNLD/LJeqkQcArYWMl/F6yUNZlbWjWYJp/n7fIjs8EBbrGY1cYwMy5JukPo+padxqlHp6lmtl0oYy3+RWc/mC7JdNUzvXtoZXtddNdcwg2sWxosZ9d4uvlPWQv2nxzLKzzJiob5EI256w2sOdEC6shHr3lLs6jHOWrXB3VjXaoOL+ufoHPqa6q7+LfodIrVkFajsn2lmc7HQRAj3vCMUo1PmsHHbGZA4XRcL0JZ6oOHwSrADxn0dL4+knw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SJ0PR15MB4680.namprd15.prod.outlook.com (2603:10b6:a03:37d::9)
 by SJ0PR15MB4234.namprd15.prod.outlook.com (2603:10b6:a03:2c9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 22:45:22 +0000
Received: from SJ0PR15MB4680.namprd15.prod.outlook.com
 ([fe80::818f:54b8:f837:9f9c]) by SJ0PR15MB4680.namprd15.prod.outlook.com
 ([fe80::818f:54b8:f837:9f9c%5]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 22:45:22 +0000
Message-ID: <fa222dbf-29cf-219c-95bc-c5c54a87cb79@meta.com>
Date: Tue, 17 Jan 2023 14:45:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH qemu v2 2/3] target/arm/gdbstub: Support reading M system
 registers from GDB
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <167398464577.10345.18365355650640365165-2@git.sr.ht>
 <cb9cdb62-5c5a-c7de-9fa7-99f5438af332@linaro.org>
From: David Reiss <dreiss@meta.com>
In-Reply-To: <cb9cdb62-5c5a-c7de-9fa7-99f5438af332@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0041.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::18) To SJ0PR15MB4680.namprd15.prod.outlook.com
 (2603:10b6:a03:37d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR15MB4680:EE_|SJ0PR15MB4234:EE_
X-MS-Office365-Filtering-Correlation-Id: a80636f1-9994-4446-e197-08daf8dc844e
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JnxrtEoURYC8DhEs7N2jpg2LG2XZ+HHKiu4rP9KwLnEwP2cJgogGExhs68rJuwwT+Ly0BOrzAb7wjrJZK3zLbe8xFIQ97YB4fGce35b6ctjX4s42+NqeVtGERJomkBu7Y72pDbxZWSCj8SleBszyIBX+YwNbIO5o6a83QioGZLUBbat6HoBVQKcEjXVrl+vepTJW6+RP4zbN0jY/ugWKuiysUkw7h+XhG1oaq4tLm40gUTm0zMQDwNCm9QZ+JurNwAzfDT63RXfax7iPRR3wxGzfZsRpHESPBe1C9iDlAvsbYobFWX8P+8OQPz8brCodJRHYytob2AKAs2eraKMpjT/wOOSsfOV2O8h7Cze5GPcvMeERvxQNeIvQBkAf16CKNCoFTVltXnLq6oFGsBY9fHbupb42dgPlj0jJTI4tukvI8Hd5VkzvqMz/aaMsm6EUx0knCGHIV08eRQwKuBwglFZQhBpuFkXbY/I50YnHxtygmp/kS+JwLXDceo23dEHxXEtDBVEPNphNerrKFYZCwJYKaKkAEBz1iUyKZxKIRGHw8dApv5f1ZtzkbvXVjuXzF//PDLiEHfcp+xasdhAKwqoAJcHMLEY3RSynjA8779mNbQfdaRnEv9qsempWChgw8TDhBjsilJ/+GJ1cXPLTkoxw2k7+QFi8kSKhuMDbbdcgP+QHG3ox9O2BpYTZZR0O7BUxFj8cfK17Wt+2fnlSHa0IhxWbNCtMs5cIjCErpss=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR15MB4680.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199015)(86362001)(38100700002)(2906002)(4326008)(4744005)(8676002)(5660300002)(8936002)(66556008)(31696002)(66946007)(66476007)(41300700001)(186003)(6512007)(6506007)(2616005)(53546011)(6486002)(316002)(478600001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czNhblFQZzBZaVR1NGhSU3pKMy9MbGEyMHpLV0Y2WG44b3N2blNOdWlDeXd2?=
 =?utf-8?B?bXdkQ3RnVFBhUWIwNEJzKzNpUnhOU01rUVU0QlM5c3BoSFA0K0VvdE80MXpO?=
 =?utf-8?B?WFpULyttbkpIMTE4VlYyK3dUZko1R0lpZkZtVFB2QmxnVWNiMUllelFOOXJZ?=
 =?utf-8?B?eDliZWd1ZzE4ckFDRmc1a2t5Z00va2Z4MXAwZkM3eURTOEhkTFpTUjBzdU9K?=
 =?utf-8?B?UkVWTlYrUXZpb1g5bThRRndKdnpENFJSdVRRY0RUbE5lVTREVU9GZzQ5dW9R?=
 =?utf-8?B?M1d3aDYrRzBKSnk0UjhwV2M1OE4rbmJRYmZtODlLN3dxbDFYci9FM0hPcUVY?=
 =?utf-8?B?WEl3MVJiczBIRm5ZMDlHL2g1aTdCcWFaY25xY0JrMG4wTHFobjVPcVFVK2JI?=
 =?utf-8?B?MDgvR28zNkdYalVOby9ZdmxYSENnUFBmMTFJOElaSWV2WlpsMEZGbEhGaWZX?=
 =?utf-8?B?NE1ld0I4SXkvdWF2QnlqaFJJS0s5NnBJam1HVjBPWEN5dlg2ZlZsdTdpSUxU?=
 =?utf-8?B?ck5DeWREUzc0aVdMaitVTUhXUFY4OS9kREhLRFhVY3FoTXFhSzRFTTdiQ0Ji?=
 =?utf-8?B?VE5xT1pzYTJreEpMSGJTTXl1M0JNUGJNWFFjczB2Z2RPeHVnT1hkNkJ3WUFl?=
 =?utf-8?B?KytaVHZIbnl3ckRFeHFLTTNBczVnUzBNaDltRVpLcTMrQmJpMmI4QXpSQTNO?=
 =?utf-8?B?bFg2S2FVT2RraEcwMWppajRrRmJqSGtaVFJyNmhYSWs1RldTam1EeDZVb2pH?=
 =?utf-8?B?NDhKbWo1NVNTbElDUWNyTmI1cVJ4dGFoQi9ON1lKREF5V3h5NHhNTUU5THN3?=
 =?utf-8?B?ZGVwMGlqWUhpVnQ0bnVaV1lrVmF4L2FHSkl4R1I1UkZ1WXlzRDZEODNoc2or?=
 =?utf-8?B?Wm1RcXBVd3YvVEtxZzR1ZmN5QTZZc1pxOUN5eXhRVW5nTFl5VnpHbDdZcE9s?=
 =?utf-8?B?enN0YzJYQzJwRkErdXpxeHNTaXhYUU5INUMzcGh2VU43UUZxRko0MnlveXd4?=
 =?utf-8?B?V3RISU1PVkxyMi9ocmQyWVV4YjVMY3JwUXQzMEJpalZQVDN6ellaYXZzMFlN?=
 =?utf-8?B?MW1Wc2RrYjJORFVESHFaQitkUXZmaFYxa1hEeFArNEJsQTdXYjZNdkFRM2ta?=
 =?utf-8?B?eUlaTnJPVnFhSDBrT29xbm1zcnRWd0YxYXloTzZraGUrUU1keVVOa3JMZzFQ?=
 =?utf-8?B?UE1RZmVmYmhHbkE4TXVsNFhEKzBlLzZLYmNOTnBqbTgvVk1nU1FEYmxYeTZ4?=
 =?utf-8?B?bUFVVlZSSzNhVWlqNXZaRnAxbi9wRGFOOFl4bXRKMWpwY0lnVmE4MzVHQzgx?=
 =?utf-8?B?MXBaZnpFdXRkcUd2QUFoMEFyTTcvUzNkcnJqNWZnZHNHMUtFdmt4dWxYMmtZ?=
 =?utf-8?B?cGhZMzBYVzlRU2dQRkJKRThBbGM1dEpXTXRKMDkyTTkwV3MyMElxNHJieHNt?=
 =?utf-8?B?akxZbm9KZ3NPRlVHNnNFMlFsdWxHTXNKc1lQeWR0bk5OSmh4N2xUOENBUGRa?=
 =?utf-8?B?VTV6S3FYWU9wdkNrWnE0RWRycGJuKzFEb2hTVmZtQVlMajNXeFAxa2Vidm9J?=
 =?utf-8?B?Q0FiZlJuVjRMT0RWWlhtOEJoSHduY3ZjaURJUy9JTEx6VFFabzk4NFNYM0Jz?=
 =?utf-8?B?QjVmbGNNWFBRZkszKzRmNFo5U1pHVkl1aEdCU25jemZvbTJBVGoyM1MzeHlj?=
 =?utf-8?B?NndlSDIwWWJoaWthNDJZdVZ3L201SHEyQ3p0Z2V2SElPRmJMNlBjSEJ0Z291?=
 =?utf-8?B?cEV6NTlDQUlUL0swRllmcnRickRUaEg5N1JXRCtkcHBYMUlqOTVmbjdjNlVN?=
 =?utf-8?B?eFF6VE5MdzZTdVJzcXhVRzduYkdjRGtibW52UmZaaGdJYXpRV1FEQmpwWUUw?=
 =?utf-8?B?L25SdS9JS1NpTlhKNjNGYnUyaUd5ZmNFUy95c3ZQQUJEN1pDUyszcVJXRHhW?=
 =?utf-8?B?MjJwcTlqRXg2dzRmM3JNdS81bVZuOXhVRUlkdGlZS0hjUERaQitka1lVVElF?=
 =?utf-8?B?VTB3cGFwK1Fhay9KYnJXM0FvVW9iTFd1Q0tvS082MnlKWkEvSVUxZFFqVW44?=
 =?utf-8?B?V3J5WHFJdWZJcHEwdHlGZ3QxM1l0dmRLL2lCcnlPNVpNUkxjMXh2UXlwNmxT?=
 =?utf-8?B?YWJUWU9qbXRxZ3ZrZUZwamZyandvampzcnhzaUFOcWV5eWFmQUliajJmODFk?=
 =?utf-8?B?M0E9PQ==?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80636f1-9994-4446-e197-08daf8dc844e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR15MB4680.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 22:45:22.4476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9L2D9L0NyRk8qJBrogWqPi1xHmrvYR8FfJXTJWDQr/xPJhBHMW/B4nPgguD4IJva
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4234
X-Proofpoint-GUID: PIPyqwHnSrFVw3VZzOoBsXEYhrtc8HEW
X-Proofpoint-ORIG-GUID: PIPyqwHnSrFVw3VZzOoBsXEYhrtc8HEW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_10,2023-01-17_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=438116b86b=dreiss@meta.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 1/17/23 1:40 PM, Richard Henderson wrote:
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index bf2bce046d..fdbb0d9107 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -856,6 +856,7 @@ struct ArchCPU {
>>         DynamicGDBXMLInfo dyn_sysreg_xml;
>>       DynamicGDBXMLInfo dyn_svereg_xml;
>> +    DynamicGDBXMLInfo dyn_m_systemreg_xml;
> 
> You don't need a new variable here, because a given cpu cannot be both a-profile and m-profile -- dyn_sysreg_xml can hold the xml for the current set of system registers.

Maybe I'm missing something?  It looks like arm_cpu_register_gdb_regs_for_features
unconditionally calls

gdb_register_coprocessor(..., arm_gen_dynamic_sysreg_xml(...), ...);

which would cause a collision.

