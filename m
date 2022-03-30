Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1234EBAD2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 08:31:57 +0200 (CEST)
Received: from localhost ([::1]:50374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZRs4-0005IO-Ff
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 02:31:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZRaf-0005ev-VL
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:13:58 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:34518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZRab-0004ox-V5
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:13:57 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22U4r63N013620;
 Tue, 29 Mar 2022 23:13:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=5IFs7KRnR2SAR+S5kFqDNXNAEf7ebc9RpkdXGl5ekMM=;
 b=0gbYDJaDoxXZuBTat/J0XTSXEXTRD1WGgx4qq0dZFS6eeNwskJYiRcJ5Fg8L4MUPFz8u
 Cy6wla2J3I7ZcsyHzrOFLOvGmOXpXVjuDV4zpR0d5wyegyevbriMiCoVmvcucRfunKYD
 9jmv/8DfnO0yRu3/L5k2vAxf5zqYgbCYBtO3wscAjSAzFF8UP+l7kjhBiRHtWSqYcdxv
 ApwkqyKD5hibFigWE+YaTXgyNurAyWPrql7hHGxxD1uhJIZ4f+RrZsRpFBNAJsGNxcU8
 3jVpceqccCGYKimXMOX67AjG4dUxOWtNpfTSGKnzLMU13cfCKVdRYXU/Djm5PH3bDNvC aA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3f20c9fwag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 23:13:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGQ6jmXD8tOc9OgCkeMzzL/IWl9bKxaks+V/jC/BGWtzPwLCLV6crH1KBxdxXMVeU6H5Cm4IMa99rffDa/vSEJJOgH2YxcLU4P7JgpsWXoQmYIEoXYiehdPHQ//1bX3f8AG20DwyNRd1XaMdPdQ6RM3p2jeNe4XVzLN0OxiJBMmDvfcPli9/coNdKp1fGZs8NCYAHK5lLJ/N20Sf/WRYuUNgSDeL8fk0EVFqwbsRiBENuc1P+UNH7A1I8AZ2CfFEpxpf0yNvM5G8Y9BcNbJVBL6obLcDDUo66el2rIsM1nhptRPppNgaO/FvJg0ahiL7GxZgijZgDqyN+/lac9x2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IFs7KRnR2SAR+S5kFqDNXNAEf7ebc9RpkdXGl5ekMM=;
 b=Q7ulfdOone1J4PTOJ1IYQ/LFla5DhMsoYXftFIAA+qDmF6NlP+nNpqGvSDayB1stxCL1OrkGl81x/rZFww44r1Zw4/Y+hImpepO3aIX8RE+LckRpYG4aalWICM1YHXjrDGSRG8bjnSi85vV+vOep885t5JoD56AInyAqWch/hN3DJs8A1pSeB09Su5yiMLXTaXaxF0wY+uvdB25K9ZXF/2s2CL6t0Iz5YgLMsqUtc1csxNqjqYGkorT+hlqe7lVu+/x4m/RN50xBTtH5ub8gcPhGoYU44sK2UtxrmJ3oy0YaiQn6i8IwVu1oKRY1Sih8OXHLzDewRZ3xduh/ggSErg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by BN6PR02MB2866.namprd02.prod.outlook.com (2603:10b6:404:fe::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Wed, 30 Mar
 2022 06:13:49 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 06:13:49 +0000
Message-ID: <21bac7b4-cfd7-c871-98b7-5379cf460c39@nutanix.com>
Date: Wed, 30 Mar 2022 11:43:35 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220329134235.44298-1-kshitij.suri@nutanix.com>
 <20220329134235.44298-2-kshitij.suri@nutanix.com>
 <28fb5ce8-c62d-deec-4893-ca02fb2d3ff8@redhat.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <28fb5ce8-c62d-deec-4893-ca02fb2d3ff8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::10) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c328b913-bc95-4e2f-5e2d-08da121474ac
X-MS-TrafficTypeDiagnostic: BN6PR02MB2866:EE_
X-Microsoft-Antispam-PRVS: <BN6PR02MB286671019FA3C688CDE541B2991F9@BN6PR02MB2866.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z15BN1SNUAt/YSlZWU08yFp5dhTNrt6GMx7SiUEwo9N7AhjKDBXf8j1ug2aUWbuvauekGCWo1pRWdXdJBruPHu7OkxDbLYy5eq6QMJaKcFkvJAVXyHXi/uRMdoQ2oi6JGi8EKWyYXdZLmZ6AtjIlbsybatYDhLLaUIvfCdijJy24Vw/sWXc+IL2/fmnFYBgYZAS2Kgo5Nr2qaAi4JNB8M3bVWPwgkUOQcRAZ2Qe/IUtmnFOC0ajiWbZZFHtubjlgR8JIsFXAkM8IpsoibXt/zcxVZ1VXlIpFGN/Ybc1rP5P6mTfMvBprscKubW8M07yLxt8Hd5bZnTm7/7/pYx7828dv20WjviypCcoHV0nilBTM2b71QVJDX0jSi6Tis1l/VpYqbT4Yo5ZqpMiZWGa4OU3llhvCAQTONz9wLmcL5G5NZr/dkOL4Tmq9jvqdgdMu0S0D6Y6iYAim4H2MNiDCeSBn9WhA32Hew9rldnm3FXeAwwQHqqP5duqXr+bsJ5PSaXAH1Vsxpe3cOHckVBBl5WVfuieaQZ3aA+NLLcLGZly0G3XXM+OOjtSWxdetVBfkUW8xm5QZrBWywb9RDkSJSWaKcEzAs+ns/Iv3zbFl/lVKQLwy1BhZZE8f7MxsqXcu/HCdfippb8NLkLRvkzgbOcjntqnkX7tkD6Pcp+tqRjonLfji7nV5dPcErQnXu+3gnyFzNVBq09LRQf4ItkQpDa1OyyuNavKJLTtAP/JKKK6Qk8t998eZ7CoWFobLrKMDv7NFeEAtyA/zz0AT/rEdcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(6666004)(53546011)(6512007)(6506007)(31686004)(66476007)(66556008)(36756003)(8676002)(66946007)(86362001)(52116002)(4326008)(6486002)(5660300002)(186003)(7416002)(44832011)(31696002)(83380400001)(316002)(26005)(2906002)(38350700002)(38100700002)(508600001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlhsTVUzRXhjMXhKRWROL0hiNUlxUldZUzgvYVFDSnJSQ1FITldseTRDaWtO?=
 =?utf-8?B?OUNhSUhtS01ZNjNVaUNKVEJJejErNUZhaGF6QzA3R3lURTFLemg3RHlqanhL?=
 =?utf-8?B?Z0dJZzRXd0Z4ZHJ3bGhwZGFGSE12SkgwTEpVWHlpdWkzRzdyS0xESHZ6ZXZM?=
 =?utf-8?B?bk1PS2cxZHpqYjMvQUkyN3ZLNVhmWjdRQXlrRmN6NVNJSFI0MjcrSGpsc1V0?=
 =?utf-8?B?OTArRS9ML0hqSVkvNWZIYWhpSTZwUDdIeENNcTNLT1dYdzF0cm5QTmgwV0Rn?=
 =?utf-8?B?Z3hRU0tTdDdHK1ZFdTdVK1F5dFV3bnZObXd2b0FQQXl2UXBjcnAvL1MvZkpy?=
 =?utf-8?B?NmNWTlBINU52bGdtUXdMcjR5RVJBVWRGYVRlS3ZkalhqdjZBNUQxZkVVbkpG?=
 =?utf-8?B?Rjl4TlE0NWJHWjY0ekZEcFVzR3AvSkwyRmF2M0ZwbXJ6L2xzbUNJUDVqeGhm?=
 =?utf-8?B?cHRHSHNpTFAxVkNObXk2c3VuWmliWS9IR01mamNWUHp0dEppZmNBcFM2UnZo?=
 =?utf-8?B?RytzOERObHF0eXYvMFBNM0U3ZE9pazgrWVRJTjJ0bzgrRnZ1U3NIVWFPN3JC?=
 =?utf-8?B?TmMzbzEvUmVGMGk5SjVCd0ZxZDByeUNNbGRESm1TRTdCcDhsMFVudS93QmVL?=
 =?utf-8?B?V3pXMjJOeXhsUUlnUU9hN3BiTVdpZ0xkWXVZdkRDRlkrM1l2TUlxbllTMng3?=
 =?utf-8?B?ek4xNi9Dd29zM2cyaWJuTzBybVE2aXdBendaTEw4dGY0MGkwQ0QweW9RM0Va?=
 =?utf-8?B?bnZ1K3RmRTBoUWF1aFBGT2c5R09adnRlSEdCbWFyU2E4UkJldytYUlFPL3ht?=
 =?utf-8?B?YzJ0ZC9TUWJXOGlIRU43RHh0YkVURmhwRU1ZKzQ2d21HeHhCUERVOENQYWpi?=
 =?utf-8?B?RVl0Q2RkTmhyeGpHa3NHRWIvZ3ZEUFQxQTNPZjcrcjJWc2p0eTJTYS85c3M0?=
 =?utf-8?B?ZnNuZkhrV2JLeTZvK2Y2UVNWYVdVQXRaeTVvVGpTYm5EU0k2QzR6QTU2ejFt?=
 =?utf-8?B?QzRrTjh4MEUzdllyRGtNR1dVZWFPcWpaeWtQWXRnM3cvakNsM05iMzFsNi9D?=
 =?utf-8?B?QWZZYzBhOFd1TXg0bEhtWjBsSW9ZSjVYaVBIVTBDMG1sUXc3Z3dPWWFiWGlu?=
 =?utf-8?B?VUZKTUQwakcxOWpIb1NEanVyeWVtZUR1aE5ZeXV5VVNVQkRZWlM4bmtMa3FX?=
 =?utf-8?B?ZHNTZWxxSXVhZUF5WkNkTlFYNk9xVU51WER4dnE3VDVxK3NNek9Xd1oxOGFx?=
 =?utf-8?B?eGJibFIxbWZ2Y1JCUzkwKzdyUUl1VitBd25WcVgyNXBnVkI5VTIySWRuZnEz?=
 =?utf-8?B?S00ydnI3ZXpkR09lV2d2TE5SY3dRcEJmYjFzUy84NktlWjErTFhkeUdFWTVw?=
 =?utf-8?B?OTlyTWNveUxIV2NkTjRjdGN5Ui94c0JnbWsvbW42cUZQL0NsN09HbCt5L0VE?=
 =?utf-8?B?UkZyUGYyR3Y4VTZlYm9ycnlIM2czeGlnRHN4MXgrZnYrbGt0RnloSFVpUkpF?=
 =?utf-8?B?RkdzakFiM2lqeWlrVU8rVndaMjNNcWd0WkZkaURtT0xVaEt6akd2bDVFYTZU?=
 =?utf-8?B?NWdtK05pT0YvMU13ZVdocWc3NC9KM3o1eWN4V2s2bUEwYzdDU0V5Y2svUnhG?=
 =?utf-8?B?Q0RVZkhHV3c4MUdvTUkrV1NkS2x1TlZraE9qemw0ZS82QkRiWVMrRU80aTZk?=
 =?utf-8?B?RGRnWDkvdjhXaEc5Njh3bWp2NkNDVTROWmpSYndWcU5UeE1Pd2R1YUJMZy9l?=
 =?utf-8?B?aVFvZnUxWTdtSVNZbkdMVWN0T0hTeWY5SVZaNlQ4MXI1b0tCQmFBSmhFc0h2?=
 =?utf-8?B?MXdCVVVQNWQ0SHBGUmQ1RGxUdEFta2o0QkxQaWhhbno4VWdzWE8wbEZyMDE3?=
 =?utf-8?B?TVRDQWFkTmlEamZEU0hvdlNyYUI3Qlp1ZlI2YUNBWVk0UkkyYkhUUVlleHRz?=
 =?utf-8?B?OWVBWXhhWVN1VVFMajBSZzBNcERGaHlDY3RhYndKN1JMckZrV205R1kyMlN3?=
 =?utf-8?B?OGdxTzN5YThZa01zY1ErWkpjemU1c3phQ25jUVFqdjB4SUVITXdlQ2E0cXQ1?=
 =?utf-8?B?MDVSSkpZRXliM3U1cU1yR1cvdDR3d2RkbEZZdjJjbkhjYzdqMTUvOWV3a0lZ?=
 =?utf-8?B?bmNTZmdwZXJLNG5KZXdZS2xOakZDcU1FR1kxK3BCQ0JDWVFDVkMrazhMcFEx?=
 =?utf-8?B?M0RvNjlGdlFaWWhGYmE4UVJLMjB4R1kxSjRYSlBrcGtwMTlWbWlNNkMvRlUw?=
 =?utf-8?B?WHhRQk5za1dQWXJKTWJsSVorTlhNczZyUmNEUS9LT3RLOGpOdExCSWNQM2Jo?=
 =?utf-8?B?ZTNmaG0ya1RUTWhUSFVIS1BCZEdub2ZYMnljL3M2VDhrUkhSUU5HRHQzcjNl?=
 =?utf-8?Q?MTwbigDEysy6zunw=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c328b913-bc95-4e2f-5e2d-08da121474ac
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:13:49.4008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qFFm9B/L85WLVWxgkhYLhcEzNWUorML5Dbsl+RGFPcyGOwNLuDzdA2J5i3rzw46QnfBGjBbOODJ/S++oKZzoNElft7ymJ/jhF1pqKInsTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2866
X-Proofpoint-GUID: 81Y667tqudc6-m8WKcMHDKcT2DVtNZSn
X-Proofpoint-ORIG-GUID: 81Y667tqudc6-m8WKcMHDKcT2DVtNZSn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_02,2022-03-29_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, soham.ghosh@nutanix.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, armbru@redhat.com, thuth@redhat.com,
 dgilbert@redhat.com, philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 30/03/22 2:39 am, Paolo Bonzini wrote:
> On 3/29/22 15:42, Kshitij Suri wrote:
>> Libpng is only detected if VNC is enabled currently. This patch adds a
>> generalised png option in the meson build which is aimed to replace 
>> use of
>> CONFIG_VNC_PNG with CONFIG_PNG.
>>
>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>   meson.build        |  9 ++++-----
>>   meson_options.txt  |  4 ++--
>>   ui/vnc-enc-tight.c | 18 +++++++++---------
>>   ui/vnc.c           |  4 ++--
>>   ui/vnc.h           |  2 +-
>>   5 files changed, 18 insertions(+), 19 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 282e7c4650..ccb6840a49 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1115,14 +1115,13 @@ if gtkx11.found()
>>     x11 = dependency('x11', method: 'pkg-config', required: 
>> gtkx11.found(),
>>                      kwargs: static_kwargs)
>>   endif
>> +png = dependency('libpng', required: get_option('png'),
>> +                 method: 'pkg-config', kwargs: static_kwargs)
>
> Please use
>
> png = not_found
> if get_option('png').allowed() and have_system
>    png = dependency('libpng', required: get_option('png'),
>                     method: 'pkg-config', kwargs: static_kwargs)
> endif
>
> as suggested in the review of v2.
>
> Paolo
Apologies, I had missed that. Thank you for your review! i have added 
this in the v4 version of patch


Regards,
Kshitij Suri
>
>>   vnc = not_found
>> -png = not_found
>>   jpeg = not_found
>>   sasl = not_found
>>   if get_option('vnc').allowed() and have_system
>>     vnc = declare_dependency() # dummy dependency
>> -  png = dependency('libpng', required: get_option('vnc_png'),
>> -                   method: 'pkg-config', kwargs: static_kwargs)
>>     jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
>>                       method: 'pkg-config', kwargs: static_kwargs)
>>     sasl = cc.find_library('sasl2', has_headers: ['sasl/sasl.h'],
>> @@ -1554,9 +1553,9 @@ config_host_data.set('CONFIG_TPM', have_tpm)
>>   config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
>>   config_host_data.set('CONFIG_VDE', vde.found())
>>   config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', 
>> have_vhost_user_blk_server)
>> +config_host_data.set('CONFIG_PNG', png.found())
>>   config_host_data.set('CONFIG_VNC', vnc.found())
>>   config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
>> -config_host_data.set('CONFIG_VNC_PNG', png.found())
>>   config_host_data.set('CONFIG_VNC_SASL', sasl.found())
>>   config_host_data.set('CONFIG_VIRTFS', have_virtfs)
>>   config_host_data.set('CONFIG_VTE', vte.found())
>> @@ -3638,11 +3637,11 @@ summary_info += {'curses support': curses}
>>   summary_info += {'virgl support':     virgl}
>>   summary_info += {'curl support':      curl}
>>   summary_info += {'Multipath support': mpathpersist}
>> +summary_info += {'PNG support':       png}
>>   summary_info += {'VNC support':       vnc}
>>   if vnc.found()
>>     summary_info += {'VNC SASL support':  sasl}
>>     summary_info += {'VNC JPEG support':  jpeg}
>> -  summary_info += {'VNC PNG support':   png}
>>   endif
>>   if targetos not in ['darwin', 'haiku', 'windows']
>>     summary_info += {'OSS support':     oss}
>> diff --git a/meson_options.txt b/meson_options.txt
>> index 52b11cead4..d85734f8e6 100644
>> --- a/meson_options.txt
>> +++ b/meson_options.txt
>> @@ -177,12 +177,12 @@ option('vde', type : 'feature', value : 'auto',
>>          description: 'vde network backend support')
>>   option('virglrenderer', type : 'feature', value : 'auto',
>>          description: 'virgl rendering support')
>> +option('png', type : 'feature', value : 'auto',
>> +       description: 'PNG support with libpng')
>>   option('vnc', type : 'feature', value : 'auto',
>>          description: 'VNC server')
>>   option('vnc_jpeg', type : 'feature', value : 'auto',
>>          description: 'JPEG lossy compression for VNC server')
>> -option('vnc_png', type : 'feature', value : 'auto',
>> -       description: 'PNG compression for VNC server')
>>   option('vnc_sasl', type : 'feature', value : 'auto',
>>          description: 'SASL authentication for VNC server')
>>   option('vte', type : 'feature', value : 'auto',
>> diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
>> index 7b86a4713d..e879cca7f5 100644
>> --- a/ui/vnc-enc-tight.c
>> +++ b/ui/vnc-enc-tight.c
>> @@ -32,7 +32,7 @@
>>      INT32 definitions between jmorecfg.h (included by jpeglib.h) and
>>      Win32 basetsd.h (included by windows.h). */
>>   -#ifdef CONFIG_VNC_PNG
>> +#ifdef CONFIG_PNG
>>   /* The following define is needed by pngconf.h. Otherwise it won't 
>> compile,
>>      because setjmp.h was already included by qemu-common.h. */
>>   #define PNG_SKIP_SETJMP_CHECK
>> @@ -95,7 +95,7 @@ static const struct {
>>   };
>>   #endif
>>   -#ifdef CONFIG_VNC_PNG
>> +#ifdef CONFIG_PNG
>>   static const struct {
>>       int png_zlib_level, png_filters;
>>   } tight_png_conf[] = {
>> @@ -919,7 +919,7 @@ static int send_full_color_rect(VncState *vs, int 
>> x, int y, int w, int h)
>>       int stream = 0;
>>       ssize_t bytes;
>>   -#ifdef CONFIG_VNC_PNG
>> +#ifdef CONFIG_PNG
>>       if (tight_can_send_png_rect(vs, w, h)) {
>>           return send_png_rect(vs, x, y, w, h, NULL);
>>       }
>> @@ -966,7 +966,7 @@ static int send_mono_rect(VncState *vs, int x, 
>> int y,
>>       int stream = 1;
>>       int level = tight_conf[vs->tight->compression].mono_zlib_level;
>>   -#ifdef CONFIG_VNC_PNG
>> +#ifdef CONFIG_PNG
>>       if (tight_can_send_png_rect(vs, w, h)) {
>>           int ret;
>>           int bpp = vs->client_pf.bytes_per_pixel * 8;
>> @@ -1020,7 +1020,7 @@ static int send_mono_rect(VncState *vs, int x, 
>> int y,
>>   struct palette_cb_priv {
>>       VncState *vs;
>>       uint8_t *header;
>> -#ifdef CONFIG_VNC_PNG
>> +#ifdef CONFIG_PNG
>>       png_colorp png_palette;
>>   #endif
>>   };
>> @@ -1082,7 +1082,7 @@ static int send_palette_rect(VncState *vs, int 
>> x, int y,
>>       int colors;
>>       ssize_t bytes;
>>   -#ifdef CONFIG_VNC_PNG
>> +#ifdef CONFIG_PNG
>>       if (tight_can_send_png_rect(vs, w, h)) {
>>           return send_png_rect(vs, x, y, w, h, palette);
>>       }
>> @@ -1233,7 +1233,7 @@ static int send_jpeg_rect(VncState *vs, int x, 
>> int y, int w, int h, int quality)
>>   /*
>>    * PNG compression stuff.
>>    */
>> -#ifdef CONFIG_VNC_PNG
>> +#ifdef CONFIG_PNG
>>   static void write_png_palette(int idx, uint32_t pix, void *opaque)
>>   {
>>       struct palette_cb_priv *priv = opaque;
>> @@ -1379,7 +1379,7 @@ static int send_png_rect(VncState *vs, int x, 
>> int y, int w, int h,
>>       buffer_reset(&vs->tight->png);
>>       return 1;
>>   }
>> -#endif /* CONFIG_VNC_PNG */
>> +#endif /* CONFIG_PNG */
>>     static void vnc_tight_start(VncState *vs)
>>   {
>> @@ -1706,7 +1706,7 @@ void vnc_tight_clear(VncState *vs)
>>   #ifdef CONFIG_VNC_JPEG
>>       buffer_free(&vs->tight->jpeg);
>>   #endif
>> -#ifdef CONFIG_VNC_PNG
>> +#ifdef CONFIG_PNG
>>       buffer_free(&vs->tight->png);
>>   #endif
>>   }
>> diff --git a/ui/vnc.c b/ui/vnc.c
>> index 310a873c21..8376291b47 100644
>> --- a/ui/vnc.c
>> +++ b/ui/vnc.c
>> @@ -2165,7 +2165,7 @@ static void set_encodings(VncState *vs, int32_t 
>> *encodings, size_t n_encodings)
>>               vs->features |= VNC_FEATURE_TIGHT_MASK;
>>               vs->vnc_encoding = enc;
>>               break;
>> -#ifdef CONFIG_VNC_PNG
>> +#ifdef CONFIG_PNG
>>           case VNC_ENCODING_TIGHT_PNG:
>>               vs->features |= VNC_FEATURE_TIGHT_PNG_MASK;
>>               vs->vnc_encoding = enc;
>> @@ -3256,7 +3256,7 @@ static void vnc_connect(VncDisplay *vd, 
>> QIOChannelSocket *sioc,
>>   #ifdef CONFIG_VNC_JPEG
>>       buffer_init(&vs->tight->jpeg, "vnc-tight-jpeg/%p", sioc);
>>   #endif
>> -#ifdef CONFIG_VNC_PNG
>> +#ifdef CONFIG_PNG
>>       buffer_init(&vs->tight->png, "vnc-tight-png/%p", sioc);
>>   #endif
>>       buffer_init(&vs->zlib.zlib,      "vnc-zlib/%p", sioc);
>> diff --git a/ui/vnc.h b/ui/vnc.h
>> index a7149831f9..a60fb13115 100644
>> --- a/ui/vnc.h
>> +++ b/ui/vnc.h
>> @@ -201,7 +201,7 @@ typedef struct VncTight {
>>   #ifdef CONFIG_VNC_JPEG
>>       Buffer jpeg;
>>   #endif
>> -#ifdef CONFIG_VNC_PNG
>> +#ifdef CONFIG_PNG
>>       Buffer png;
>>   #endif
>>       int levels[4];
>

