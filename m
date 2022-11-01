Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90A6615046
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:14:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1optNd-0006pW-Ly; Tue, 01 Nov 2022 11:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1optNU-0006pJ-MV
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:40:36 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1optNN-00052n-T9
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:40:35 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A1F4gfG021515; Tue, 1 Nov 2022 08:40:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=njJ11SQTSw5pgH1xI0J4F+XrcnVqB7rFriJ66r+6m2Y=;
 b=vMWIV6kSExWPSgJyQftYp+pePvhtLWKRX9u2AjcPW/nlp3yTQ7+aCgQn+/6IRAg/tPIr
 8WEk2ZwqJVsKcVnh9WmYxb94guEIFJGvUM/z2RlohvfEFbH8eQzUpFxcigwP3t0pd8BY
 yxYho+mvGsvz3ahePNQwBdmzv0h2MbSEqBhLNLWcsyRfkajBLVZlkTc6KhQaIu9A/S02
 HID2R/cSpcsw+vsgaA6HUSpgj/4fRl0s1Tfi5bagViw1Jxt92yw1xt9XL5YA3oaI8kaK
 jvdXITuPM6/076EVtKhAovPHjngsjZ1oHtEh81jUzFdAnNmoSHcFGJ/cZRggKwyLZyK6 4g== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kjq1f21kf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 08:40:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mt4pwM7uoKJr9XrLhK0Awar0VuKNtO7m0a/guUMOO2EgiNl7yUJKzqebUqsHwY5v3CYQWmwSpU4YFJBRk1eyPzsM8QlHQ2M+bV8tOIUXUr0Hczd0qkcDR666YIHA55Lm0sBEIFnkBcSCCGtkghEf5zivjBnLqVcOqmIiQvRh4R9e27DHmRHC92qAyOsoUUtIVCgEjgd2CpQp2ae33uEdYw9xjwfyRqNkYevZB6cVEqvTxKED4A9KYGaZOrll3S0wW4P6pGe5VGDLUedY0FQOKx/9Mb4/yw/LPz1uBnVAe8U//TrX2yoI9r1ZuWPYznaCvQ9wTZWRupEjdQuHkgE7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njJ11SQTSw5pgH1xI0J4F+XrcnVqB7rFriJ66r+6m2Y=;
 b=nhvdSopZsg7Hnfdi3QYGUtZV/0pKlKnh08NKwaF4JWekBvWxWM3kYLeRCSXu/b3KEdW9hldu/HRiQSJaCmtcPn4aK/WP3mL0XPcnK3Dm9+CkLdVyai8GzhLS//bCsFxhtMRi26jj58O6HaLERXbewYG5KnmxunXSGWt9nuvUyuLVrFEIdPgOYYYHIqEdAqugYigel6K4TmDq5NoS3zXpbSdGLNoHiJtXcGdn1SLe8OTC4jFRFTGebIaYFnwuEEIqTP8a4sriRy0IdZz/S5O3Dz4c4imKLRohT0T0Mf2nKaM5BS1ofil9dhPedddnDKPaECsqRJkAW9GrkyDMN7QmeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njJ11SQTSw5pgH1xI0J4F+XrcnVqB7rFriJ66r+6m2Y=;
 b=VaDvkBP67PWCJ0W9ylYp7n5VANbbvg4aHnvdnc0ALpbuzMPCNGDp2MDO4GO5HaSl46buWm1Jxa9Oo9Li03RFp/BiG5JEBigb0yQt+gqJzMFPFVc3Xc9JhH2qwHKZPvcm9jw5Zoqb86KcAJ7lCXtAvBYzvzVGkglwCCugQc77aQaZlYdNpR6p1V5eqbYEhRcrZ2RcEmYN89f2sQnMG87dPepDxSdAnq103lesx4NJHtE1I1DtmeczsT6XlNwHxrkwtVPyiB3sOfi4XoADrqDQVQNl9Y0/At23ZA73tK95y7c9xAvlfjVpIK378yAPPjAlNoSSILcfzQokWKDrB7bWhA==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DM6PR02MB7019.namprd02.prod.outlook.com (2603:10b6:5:22d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Tue, 1 Nov
 2022 15:40:24 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82%5]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 15:40:24 +0000
Message-ID: <9faf2604-f0b9-f3c3-5ac8-e4deeeebc424@nutanix.com>
Date: Tue, 1 Nov 2022 21:10:14 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH] migration: check magic value for deciding the mapping of
 channels
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com
References: <20221101143029.14246-1-manish.mishra@nutanix.com>
 <Y2EyVkdLMln7CX15@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y2EyVkdLMln7CX15@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::8) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|DM6PR02MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e4ce4e-58af-45b4-7797-08dabc1f643c
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YWqw1K07Uo8LDLVo+yfO1IhCSdtY8lK2llYhhuv4mdwwMDbKpfLzvmF3NACFKB+dSbNCc1VN7IbrDm7/LBKIH6nklR7DiXsEirgMtDRwG3tV8uY7CgcTAO8ID1WT+yVy13iBZhg6MJ9T6UsFhJ2UD2TiJb9UwnZgVGrHpICTv07ArCo5ARJq+MPIiB+B356GEHKft2DsgtVe3lVeZTnVmZ/tvdGqv56tPowrou815rMzEGdzMwcndek3GUJQ0z+IiYMshgur678j5NXx/+Skas1g77xvGmqa7dI7SGKh2oFDZe2Zk+nw6q8hV+7XVZp5Ccs/bLoTa7hMmRdmttdxW5hXz4VtrrYKXYuQ5YoeqvPytdi9KpAqEMDqYL/B5X2QRwsJSfSAM8X9xPd+gyQqsQQOxhAobE0Okhd2fLMuLS/VgYyO7ZLxZW/4ntt72Gejr19I9iAwVORBCHk+m2DZFcsTdSDnd9E8P9yZQSiSoaK7ign8VmS1LOqk24G/QzXVpPMmgRHKJyjeqmIBj1avPvfAfSIqZ4sshcJMxHn2kjoiUibqUXn44G+kfFg15mDgtowummiSqhIsKMFANApxB8ZQRVi7j8R/PtRnWZkD7Upx7Pbz5deiX2fL5iRSwH41W3boVL3vpgrgRJw75rbGJVjYuuUHvahnWNZvtX+CZ48iIQMzlntYFJN2tmGcRoQuXg4QPMVQoA+Ux3R0SrIaOZCQ5GG8Z+DbNNaQdaYjFfoftkXPCwSyVtlJrKeB4j13MuhKFS41+vX3eQshR8Dn8fywLmBkxktReJfUfIq/Gho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199015)(26005)(36756003)(41300700001)(31686004)(31696002)(4326008)(6666004)(8676002)(38100700002)(86362001)(6506007)(2906002)(8936002)(5660300002)(55236004)(83380400001)(186003)(6512007)(2616005)(6916009)(66476007)(53546011)(478600001)(6486002)(316002)(66946007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjBqcEd1VTFrSXJab1UrYnNNS1FxMVFLaHJ5MHNseGdiUFJ3cTNIOHY1RzBM?=
 =?utf-8?B?ZVdwWW1JTUNLVVdla2tBK0JzU0JIa2NOV1RUbmVlRHgzQkNqYlNrV216RGZJ?=
 =?utf-8?B?ZEhxVjFLWHF1d0FjNWlRWmlEcDRZYXlUTXZVNkRKN2p3ZVphM0l0Z29QMHl0?=
 =?utf-8?B?ZWs2QVV5ak1PcU9qZ25wNXhsTk9HbTgzNlA2eHJ3WE9SQ3QycklBaWZJaUxw?=
 =?utf-8?B?cHNtaFVXN2xGc1lZRXpjakVQSmRaZWxFUVhkSFhrSCtRbng5clNPUGhhT1Vy?=
 =?utf-8?B?alNOZEIzM0QxK0VaVFRvTTFockNVT1FCalpkSnNUUFdaRGVvdGRpK2V3NGVX?=
 =?utf-8?B?RG5IZDFSWlhMT202YVBHT1ovY0lPMStoQjZYd2MrT1F6RVlXVlBTeGFvTDdN?=
 =?utf-8?B?b09ER1BoRjI2RnhsQzdMNXRlTmZhUWRFRkViQ0UzS1hYa2lsMHEva2lhemFX?=
 =?utf-8?B?K1k4VVRHbG5mTWVKZ1RSeUE3MFU1OEhFVVFjeXY0ZXRkRC9oWXlqblNyclNp?=
 =?utf-8?B?UHBCWXZFZWV6VDY4RFlGcEV2YldiWVpHWDdYNC96SnpodU81OHlMZmRxYkVN?=
 =?utf-8?B?ZUM2UEoxc1lhbVIybUErdnFzeXZsV1VjRDJmeVhHT2JIdzQ3V3JzSDVKM3Nm?=
 =?utf-8?B?aGRoejRudStnQnJXcUl0RzJSRjEzZGZCaWdITDh2emF5aUNrb1EyL2dVQVJT?=
 =?utf-8?B?L2JVT1kvZG81enlLakxLOFoxYktnQ2Y5NWpKOXVCcmIvQXMvUno5RXBOQnBz?=
 =?utf-8?B?VWtvN0NadXdxMjVWMStveGZJWWcydnlKdjFrSHljczkvcGxrTWluN09qM0RE?=
 =?utf-8?B?ZVVENWZjMUFzSkdrbG5LaUNIOFlBSmZWSXA4QjZDODdLdHJZaFZCTVRrbGdM?=
 =?utf-8?B?SWlNSFp1RW1HUWxtR0pIcXNiL0EzN3J5K3RUU0pFV0RHdGMzbG0xNGlMYytE?=
 =?utf-8?B?NTlWUStQeUs1dzBkWjJSUWcydEMydmszTG8vZEFrd2RlSCtwckkxWGsrelRw?=
 =?utf-8?B?MVN0Ujd6d0crQm1kM081NmxBSG5ZRGZFS2dEN2k4TTVwdmJzTFowejk4b2ph?=
 =?utf-8?B?T1hCSm9zS3Z2MDFMc2srcjdCNzVxMzEvQUNNYkNKS1NSVmdVbDVBOEhuZEMv?=
 =?utf-8?B?WklQQjBpVVA4NGFvTXV1WE5vTWJHdVBZS2JaOWJvN1NCL1ArdXBYbU0vdkQr?=
 =?utf-8?B?UUFpVDlOdTZvelg3QjhqTVpTYS95ZXpuanFCUFA4ZmsxSnVBVnAxcWo1aUJx?=
 =?utf-8?B?bWpMWkFGbGJycGczY1BnRzRweVhhczVMeXExSm5JcUNJUEtxRzFmWlljcDJ2?=
 =?utf-8?B?dXhNREg3bnRsVXVsS0E0bXRqT1pVZmFKdXRqNHFlUnBPSXBsZGZBQjJtYld1?=
 =?utf-8?B?a0E4NE5lOGVjQ2ZpTkpQMFdHQ3ZVdXI3R0lGWTRoVFVCcFhMTVVvMlZEYng1?=
 =?utf-8?B?OFNzVm5BTkFSOEh1aVZkRVZOdGpUdXU0bFR0WFBZdWs3YkJ4aVplUnNmQ3Vx?=
 =?utf-8?B?T2YyYXJhYTkzVDg3dm1kdzFOWm9iMVBmbkFhSUhXempTRUxYUFFDenRGcjhM?=
 =?utf-8?B?TFZ6R2JUdGZ4dVdOUjRKbFR3K0FNbEwvenZyYnVRMTlHaXphOXhEaytxLzZK?=
 =?utf-8?B?YTRNdVF6UXBSUEFJRG9pVExneGpUeFQ2ekVxRFd3ZFZSTk4ydzZHVjRpcW55?=
 =?utf-8?B?TlhWMnhMVzB5TmRZSlc1ais5U2UwQWhMVFBDMXBiWEc3RE5iWnZLOCswdEhv?=
 =?utf-8?B?amEwN2g0ZmVNTU1FQUt0elVjaERCWTlqWFZBR1BHLzIvMXkxSXJyNTc1RDRG?=
 =?utf-8?B?Zy9DU3QrdkNtK1VRcTBwZVNnT2FOUlFNUGRObTVyV1Iza1ptcTdkVU05bTNX?=
 =?utf-8?B?Y29jZFlUeUt2K21tRUk5TVZLSXJYOVJJZnZZd1R5c0w1bGZ2VXhIaVR6UXBu?=
 =?utf-8?B?NlRWSDYrUjNBTnViZU1iUzJKVUVjMlVaZkMvSDJzOWZ2dnhDemJiZFZDT2ZJ?=
 =?utf-8?B?cExmMTBUZUdOWldzZ3JJbjVoSzlKR0MzWHo0bFlFMm10RGpLeEJlMVVtK2s0?=
 =?utf-8?B?d0c2eVk0blFmZllQcjYwY2hzeEhVNHJIRDE0QWJISGZWOW13RjFycXk2UWFo?=
 =?utf-8?B?cmkxbFVUVkRoSFprQ0Jsb3o1YnhnSzh6Uk9VZE9lcHIzSUx1MXFjTlJzVWsw?=
 =?utf-8?B?Ync9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e4ce4e-58af-45b4-7797-08dabc1f643c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 15:40:23.9757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kxUMVzc1BZtLxYM8N8Bpih8BoNtzIqjKeRZMzw8Zy4wTf9kSP011g2wwbU7V6SxSrOE8ptb90MrupgXOFKfRdwFNvvadzx0QJGwWwCx+1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB7019
X-Proofpoint-ORIG-GUID: WDMovycrw2gaUG0tkcD__gOPIJ8ne2w-
X-Proofpoint-GUID: WDMovycrw2gaUG0tkcD__gOPIJ8ne2w-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_07,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 01/11/22 8:21 pm, Daniel P. Berrangé wrote:
> On Tue, Nov 01, 2022 at 02:30:29PM +0000, manish.mishra wrote:
>> Current logic assumes that channel connections on the destination side are
>> always established in the same order as the source and the first one will
>> always be the default channel followed by the multifid or post-copy
>> preemption channel. This may not be always true, as even if a channel has a
>> connection established on the source side it can be in the pending state on
>> the destination side and a newer connection can be established first.
>> Basically causing out of order mapping of channels on the destination side.
>> Currently, all channels except post-copy preempt send a magic number, this
>> patch uses that magic number to decide the type of channel. This logic is
>> applicable only for precopy(multifd) live migration, as mentioned, the
>> post-copy preempt channel does not send any magic number. Also, this patch
>> uses MSG_PEEK to check the magic number of channels so that current
>> data/control stream management remains un-effected.
>>
>> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
>> ---
>>   include/io/channel.h     | 25 +++++++++++++++++++++++++
>>   io/channel-socket.c      | 27 +++++++++++++++++++++++++++
>>   io/channel.c             | 39 +++++++++++++++++++++++++++++++++++++++
>>   migration/migration.c    | 33 +++++++++++++++++++++------------
>>   migration/multifd.c      | 12 ++++--------
>>   migration/multifd.h      |  2 +-
>>   migration/postcopy-ram.c |  5 +----
>>   migration/postcopy-ram.h |  2 +-
>>   8 files changed, 119 insertions(+), 26 deletions(-)
>>
>> diff --git a/include/io/channel.h b/include/io/channel.h
>> index c680ee7480..74177aeeea 100644
>> --- a/include/io/channel.h
>> +++ b/include/io/channel.h
>> @@ -115,6 +115,10 @@ struct QIOChannelClass {
>>                           int **fds,
>>                           size_t *nfds,
>>                           Error **errp);
>> +    ssize_t (*io_read_peek)(QIOChannel *ioc,
>> +                            void *buf,
>> +                            size_t nbytes,
>> +                            Error **errp);
>>       int (*io_close)(QIOChannel *ioc,
>>                       Error **errp);
>>       GSource * (*io_create_watch)(QIOChannel *ioc,
>> @@ -475,6 +479,27 @@ int qio_channel_write_all(QIOChannel *ioc,
>>                             size_t buflen,
>>                             Error **errp);
>>   
>> +/**
>> + * qio_channel_read_peek_all:
>> + * @ioc: the channel object
>> + * @buf: the memory region to read in data
>> + * @nbytes: the number of bytes to read
>> + * @errp: pointer to a NULL-initialized error object
>> + *
>> + * Read given @nbytes data from peek of channel into
>> + * memory region @buf.
>> + *
>> + * The function will be blocked until read size is
>> + * equal to requested size.
>> + *
>> + * Returns: 1 if all bytes were read, 0 if end-of-file
>> + *          occurs without data, or -1 on error
>> + */
>> +int qio_channel_read_peek_all(QIOChannel *ioc,
>> +                              void* buf,
>> +                              size_t nbytes,
>> +                              Error **errp);
>> +
>>   /**
>>    * qio_channel_set_blocking:
>>    * @ioc: the channel object
>> diff --git a/io/channel-socket.c b/io/channel-socket.c
>> index b76dca9cc1..b99f5dfda6 100644
>> --- a/io/channel-socket.c
>> +++ b/io/channel-socket.c
>> @@ -705,6 +705,32 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>>   }
>>   #endif /* WIN32 */
>>   
>> +static ssize_t qio_channel_socket_read_peek(QIOChannel *ioc,
>> +                                            void *buf,
>> +                                            size_t nbytes,
>> +                                            Error **errp)
>> +{
>> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
>> +    ssize_t bytes = 0;
>> +
>> +retry:
>> +    bytes = recv(sioc->fd, buf, nbytes, MSG_PEEK);
>> +
>> +    if (bytes < 0) {
>> +        if (errno == EINTR) {
>> +            goto retry;
>> +        }
>> +        if (errno == EAGAIN) {
>> +            return QIO_CHANNEL_ERR_BLOCK;
>> +        }
>> +
>> +        error_setg_errno(errp, errno,
>> +                         "Unable to read from peek of socket");
>> +        return -1;
>> +    }
>> +
>> +    return bytes;
>> +}
>>   
>>   #ifdef QEMU_MSG_ZEROCOPY
>>   static int qio_channel_socket_flush(QIOChannel *ioc,
>> @@ -902,6 +928,7 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
>>   
>>       ioc_klass->io_writev = qio_channel_socket_writev;
>>       ioc_klass->io_readv = qio_channel_socket_readv;
>> +    ioc_klass->io_read_peek = qio_channel_socket_read_peek;
>>       ioc_klass->io_set_blocking = qio_channel_socket_set_blocking;
>>       ioc_klass->io_close = qio_channel_socket_close;
>>       ioc_klass->io_shutdown = qio_channel_socket_shutdown;
>> diff --git a/io/channel.c b/io/channel.c
>> index 0640941ac5..a2d9b96f3f 100644
>> --- a/io/channel.c
>> +++ b/io/channel.c
>> @@ -346,6 +346,45 @@ int qio_channel_write_all(QIOChannel *ioc,
>>       return qio_channel_writev_all(ioc, &iov, 1, errp);
>>   }
>>   
>> +int qio_channel_read_peek_all(QIOChannel *ioc,
>> +                              void* buf,
>> +                              size_t nbytes,
>> +                              Error **errp)
>> +{
>> +   QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
>> +   ssize_t bytes = 0;
>> +
>> +   if (!klass->io_read_peek) {
>> +       error_setg(errp, "Channel does not support read peek");
>> +       return -1;
>> +   }
> There's no io_read_peek for  QIOChannelTLS, so we'll hit this
> error...
>
>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 739bb683f3..f4b6f278a9 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -733,31 +733,40 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>>   {
>>       MigrationIncomingState *mis = migration_incoming_get_current();
>>       Error *local_err = NULL;
>> -    bool start_migration;
>>       QEMUFile *f;
>> +    bool default_channel = true;
>> +    uint32_t channel_magic = 0;
>> +    int ret = 0;
>>   
>> -    if (!mis->from_src_file) {
>> -        /* The first connection (multifd may have multiple) */
>> +    if (migrate_use_multifd() && !migration_in_postcopy()) {
>> +        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
>> +                                        sizeof(channel_magic), &local_err);
>> +
>> +        if (ret != 1) {
>> +            error_propagate(errp, local_err);
>> +            return;
>> +        }
> ....and thus this will fail for TLS channels AFAICT.

Yes, thanks for quick review Daniel. You pointed this earlier too, sorry missed it, will put another check !migrate_use_tls() in V2.

thanks

Manish Mishra

>
>> +
>> +        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
>> +    } else {
>> +        default_channel = !mis->from_src_file;
>> +    }
> With regards,
> Daniel

