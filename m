Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A22670C11
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:49:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHulF-0005YN-5k; Tue, 17 Jan 2023 17:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=438116b86b=dreiss@meta.com>)
 id 1pHulC-0005XY-VB; Tue, 17 Jan 2023 17:48:54 -0500
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=438116b86b=dreiss@meta.com>)
 id 1pHulB-0005vE-F7; Tue, 17 Jan 2023 17:48:54 -0500
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30HLJiA4021407; Tue, 17 Jan 2023 14:48:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=s2048-2021-q4;
 bh=KVMm2wrcrtpfoPqKk5VRdp7o7hPv1bCtDSVSn2NWVXk=;
 b=kCxnOaBuw5cPM9d2O0bEbQMsGJfAM19t+LV7aNY4jbfNawN9lOlf4nQbusX4aoSZW8pQ
 cUhhc0/Ou9BOIcoLGvoKa2kEYUDut7c8N5xH4jRA0/n+NgxSpMECDIJ0lgNS9H1sI9Ai
 eC7wexKTy5Aj9BJheAZ5ZCYxI+Nc/Ag6kbyBNKw5PKmPqRbwdXL01T1d3U9OWM1PtppX
 R3+JCyy0bA4m490ddc9Yf05/wkd4EMC9PVzhqPj1hpSJRandaEKpVNlb5++/Qe6aLtHU
 ol+mFNUbCjk/cSq9esMPS08pKTdYMdaGdggdPU9prR2xRBb61WS1S/aUb7OXoC436GWN 0w== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3n5jdx6bkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 14:48:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtlKX330GRed8GPz9iGOw7+wLLzC3uf7ybMcrGibUyjlVNdGUnJ+d/SYsx8Ph+ALTfd2foMmcCWacMdJfJvC4C++vGu/TFkL1EqB4DOk37hZD8c2X2F71/MgN6SciwYPBrR23yyAnxfiQKUI+mgOi7UocfVqCANjJ/n2PzDFB71MqQjvzJ/DWyWxBOgM84TRCUxW74nMprlrLogqtlvQvgfeA/UUXBQ7FVu/sIXPqsyv/vh+Vo4XhV1jmDbtmxQA+h6+PpDoWIswtNbohpE9p4dJ07PNKC75kIK3CK3YClW2Ay4u5c7wRnNjfkXUtR83Ukuq+Hfghf2WSupPWBlV+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVMm2wrcrtpfoPqKk5VRdp7o7hPv1bCtDSVSn2NWVXk=;
 b=nL1P4Hq5ggl+stqbzCCoR+PGxkZFk6CjyYWHATwxxH2AozMRFBSH7i2l3fkmxSeSFXzZyTfxYbiYXtQlj2iv2fIHuHO0dUSYsp63DHAL3l3B2W2aGf3Zz68+PpfHyWYLaoX8vHpNAh1mTZL2+kEcDsUuVNUSzYADbdrknQSzXnGYk/mdoBdVhv76DMispGjYhbIOFy5bPkvGrZNrm1izDm/DWNWe+2O1CWcaB/8Ik5C5AzBkZ0VXMV2ExnLyNhBJLOuCIcbHh6QFy/5uMskIKhlQS8gk7GoOh3tyPoCWikcEDLh1zo/AYjiIzBAIoz2XWbSRsT6U3u703tOt9gAh6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SJ0PR15MB4680.namprd15.prod.outlook.com (2603:10b6:a03:37d::9)
 by CY5PR15MB5440.namprd15.prod.outlook.com (2603:10b6:930:38::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Tue, 17 Jan
 2023 22:48:48 +0000
Received: from SJ0PR15MB4680.namprd15.prod.outlook.com
 ([fe80::818f:54b8:f837:9f9c]) by SJ0PR15MB4680.namprd15.prod.outlook.com
 ([fe80::818f:54b8:f837:9f9c%5]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 22:48:48 +0000
Message-ID: <1a029d9c-92a8-2866-d1ec-7fdab4356fb6@meta.com>
Date: Tue, 17 Jan 2023 14:48:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH qemu v2 3/3] target/arm/gdbstub: Support reading M
 security extension registers from GDB
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <167398464577.10345.18365355650640365165-3@git.sr.ht>
 <be662a38-c0fd-daf4-88e6-4adcde57fd57@linaro.org>
From: David Reiss <dreiss@meta.com>
In-Reply-To: <be662a38-c0fd-daf4-88e6-4adcde57fd57@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:a03:180::43) To SJ0PR15MB4680.namprd15.prod.outlook.com
 (2603:10b6:a03:37d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR15MB4680:EE_|CY5PR15MB5440:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d628f6-8f43-4f07-dfce-08daf8dcfecf
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zIOydyAAClfO8gLjxlsZopmi7+/r/V8CfbI6VI5LBAR3n9E9fnI/bIXj6fV17ivddJXtKTnysNVLJwJh7Mequ3WuYafFHdeiDm+rbT20quvoIF537kBnbtVs6+DIohvZNRKGfDk/vQizQ3LPuWUzVk9qILa3E+B1k+s6IBOrSILOuJC945pqQhtxxmbuCWw26JjefZ4cjwHVdut8kicdD87B/x5yHSTn/MhleotFexH9L7XhMAQuoAZRQ0KxbuG1pZeN6pDMZ3B4/OkjxtoGKx7XF+i6xe4VFbQJgNI0YAmWu3+UnY/ALE1+I4SYViERT6+1JbyyrFm/ycVeKGjLRMNhyx/Bc0saN483//HoeEtoD+9f08G0Zh1iKERl2aPCHSLRKuJ+PB20hjT66xCzYkXCSNskgenknJ56XwIg1sjJLcaUxPZ66EjhjgLt3msB4sLVAF5AvTuClvBSrhMP1860Psjr7lGABua6P+Pbg2qn6kFCuEBma5gAhIHcKN8Nl4gx98aVVUuicHeba9MnPwach5n1S96kZsnFcmVUi3SIviMH3HA8BPf3qUoLlog+V7Z96RHEXyx6YtZI+Mi8eq24lvRumcs/ioHOFpuk6hEeBuNhBdBxbwMbzPMf0CXs7UinLKD5/jLpgY1P+aUk7eL3YX81MKcciifsWoJnGWyPysN/VCkhP6jeX46vjvY1Hv5ocxjuEkFgwczDUn5/YRV703RaJrLCOjV4vSEIOY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR15MB4680.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199015)(31686004)(66556008)(5660300002)(8936002)(41300700001)(2906002)(4326008)(66946007)(8676002)(316002)(66476007)(6486002)(38100700002)(478600001)(6512007)(6506007)(36756003)(186003)(53546011)(4744005)(31696002)(86362001)(2616005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckY3a1FORzdIVERhU0hTSlBtaktla3ZFc1FoM3hMVkRzZlBOSFdNVXY4NVhN?=
 =?utf-8?B?Ujd2eUFFR1kyVGxJc2YyU0RXNEY0U1FMS3BEZmtWV004S2ZrcDF0TmxWS1lE?=
 =?utf-8?B?eTdRaUdjTjR1OXAzNVd6N1MrVWkrNlZkcGhlT1BzcmZiTzVQQjlJOSt5NHFo?=
 =?utf-8?B?MkZUcnhodE5jOHBWeVRHQjZhczB5Zy8vL3pPcGgrR3ZkKzdFSXdOTkpSZHBK?=
 =?utf-8?B?OC8wMjRCUE5LSEZKRUlPdWxXdklpbWZZNkV3WVVRSUdTOVk1ZGEzUEdFQ3ox?=
 =?utf-8?B?WGZxSm1DUHQzK3hJRjA2clNsektJUi9pQlA5ejdSMlRmSDBHTFl4ZCsvaGlG?=
 =?utf-8?B?enM3bmhzWEZYbTMxSDkzU3dlZEdNRHZGOVljSnlCdC95dkZHQ1Vub1VieEww?=
 =?utf-8?B?R0ZlNjRqMDhvTElqUEErMUM4UzlXNmoxMmtlaGxFRHVkeVpDUkovK0t0VmNO?=
 =?utf-8?B?dnlmZE5lK3VBNXhxeEZoU05IMUpzOEVIZjRTcHA2VTdXaGRNckV0RzhtM0o1?=
 =?utf-8?B?cS95clVMRFpvQjFZaFV6TE5xOXJURk4xVXMySDVKR3YxaWM5YWNQbUM5eE16?=
 =?utf-8?B?cjBLRktqUFZKK1hjRUsvM0ZHaklBb0FNRG5rOVcyZDlITFhYaUlaOThyT2px?=
 =?utf-8?B?MkwwK0gyaUp0MWcwYnczUlRDWUx3bG13dnlxTFBYeS9KR1ZoUGUwYW43dUI0?=
 =?utf-8?B?RDVoV3I4ektoQmpBY3crQzdFNzhnbzJJVG9JbUFnUWtkOWwyVjZnWWRBdDc5?=
 =?utf-8?B?bjh6N1ExdFY2dm4xVDVjUVY3VE1wNDZzZFJ0RStyU2N5OWV6bnVXZlp6b3dM?=
 =?utf-8?B?ZDJHNW1kR3d4WC9iMlRJQzBSTm1qdWFacVdNRUJncnVjd2lhM0VQVU1QTnIv?=
 =?utf-8?B?MlBISjhON2RBeGJ5eWc3WHMwM2pGZTVqY21NVVpQVEtFWmJYTkM0bnpaaWpU?=
 =?utf-8?B?RjAxNkxobmI0V3lOckVvb0d5N1dUOVJQTU9XRGF6akdWWUhpT3AydWZpdDdT?=
 =?utf-8?B?ZUFlYjB3VTRYcHVxRjJlSUlST0hwVDNIQWxZcjVMU2xMNHFZSDZ1UUNPdTdt?=
 =?utf-8?B?SEFIWlFHOC94dWl0LzB4UXh2ZmMwLzJmM3FVWHdaNDRTNERJTUlJTlZMM21t?=
 =?utf-8?B?RWQ1RFpNTlRVMFF4T1M5MnMvcUtKRG04ZXYrSzM5YjJvcUIzQjMwTnlFb1ZG?=
 =?utf-8?B?UmMzcDkxWkRaZUtRK1ZTWDMrWFpqQTd0aXNBM1lwM2xDeVAzVjZLVGNIeUtJ?=
 =?utf-8?B?SytUUy9jTTh5dXM0dG40MDZmVW5VZjR2TGc0QTllMlpidGdDSnBWNUJ2SkxW?=
 =?utf-8?B?MFJPNjJrazFoYTlORThyb2Zxd2xSQUVjTWswZXhTVDJtQzB0UUUrd0RObVhN?=
 =?utf-8?B?QTNhQzZrVjBsZWo2cHJXMVNYNURUaS9vV0F4VGNLb2M1RWhzMi9PZFMrSGV3?=
 =?utf-8?B?NzRwejhKOUxmTmxWVkR4dzF5UmpMUW05ZVkwc3pHR1p6OGgzaC9kRjlEaHRE?=
 =?utf-8?B?V1FTSWlTdjc0VFdiMkoyOTNBaXd3WXZmZGM3YnNxL1JDZWVrR0JsZHVmWk1v?=
 =?utf-8?B?WDVWWkRybXFycVhvM05keGVlU3hBWHFMdEpzNFVzdGdQb2o5MkhoY3A0ZDFD?=
 =?utf-8?B?UEhLTGhhT0NVMm9abHM1RzRYMDBzMVVrM2dKYitZLzhZQkJUbFYrTXRYZjhS?=
 =?utf-8?B?cXFHbzVQRWFteFhERGprM1dVb0VLTll2Ui8yb2NOdTNoSnRMdUVrNjNkeGpq?=
 =?utf-8?B?d0pSOWh0MTV4V3B6UGw0aG9ORExvOWdNdVhmWEcvdEJUQ2VRUWNrYUk1bmFC?=
 =?utf-8?B?N014ZDRla2Z6MjJzcHJpN2M1ZHc5eTJ2Z25rc0x0TEZOYlhVVnZHTEhZTy9P?=
 =?utf-8?B?RUxRRlRvZis1WEphbi8zaXJ2cFFFUWk5MDBJSmFPVExBYUVrYXdTMjEwTUIy?=
 =?utf-8?B?dW1WcDBwTTlkbS9QNFpPd280TzNkVjRteFR2NUt3ZWxCWEd5S0c1QkxLRlBt?=
 =?utf-8?B?NXZmR25HZGdBNllEV1NObzRMM1NDOE5xWUd3OS9NS1pxQTNpNkl1WjNLaXd3?=
 =?utf-8?B?MEQ0SzJ1SThMTkYxOGhMMHJiRXFzYjYvbUltMUE1Y05WR3JFd29CcGl1aDM3?=
 =?utf-8?B?SjA1YnREWHpkSW1mTjNwVHE5WGppMjFOZFNiN0JZSlMyM013dGRJSHQ4bWd6?=
 =?utf-8?B?bmc9PQ==?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d628f6-8f43-4f07-dfce-08daf8dcfecf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR15MB4680.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 22:48:47.9438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QNMTUIslcDpu9gQlUDvyOaKt1EYT0h2fDEoQSzEh4JzFJTMuRPvdefDL6J8I8zK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR15MB5440
X-Proofpoint-ORIG-GUID: _xESzMZEP-9HEIPsta3wY66mtVQszErB
X-Proofpoint-GUID: _xESzMZEP-9HEIPsta3wY66mtVQszErB
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

On 1/17/23 1:42 PM, Richard Henderson wrote:
> Is there a reason why these are separate from m_systemreg?

GDB puts these in a separate file, and J-Link puts them in a separate feature block.
In general, I think it's nice to separate stuff related to the secure extension
so folks not working with it can ignore it more easily.

