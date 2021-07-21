Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032123D125A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 17:26:21 +0200 (CEST)
Received: from localhost ([::1]:42672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6E71-0005KH-IB
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 11:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6E51-0003No-E9
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:24:15 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:42382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6E4x-00022g-Em
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:24:14 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LFCKg9010916; Wed, 21 Jul 2021 15:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=kGeC/KnTvWHw/3qk1d62js7iNqPWQwR/ClH1kPtUDpY=;
 b=V6QZ9gtaSFA/SNzdlk0gyCowvBDdQCyqX9PJuHlIWXY1oBOQkKI79yGZ6GJdyvkoXmCi
 QqHxaIabfvlJ3KlxiVuj2nJe99esQYJ8sk/p99C3m4sXZ840AI/8TykuKQPUOsAbze+F
 6p7dSl0i5AK6LxsHCdA8MNsBp55/j5n1qajXbwTOJAFJ1mONm0YSP78N6BBbSVMptmOK
 nPUoMVIji59tP8wpQFYO/NM0h4QvGKdAkYQMC8vVwIfmUFdu7Gw05M8TZmPDheFjIoez
 82YMOUuNfNbEr0QutY8ieGgU6WaErnJxJpT7AUvjVSZfq7+fJczcs2ltPNo9QfBX8fNQ ZQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=kGeC/KnTvWHw/3qk1d62js7iNqPWQwR/ClH1kPtUDpY=;
 b=z2qAoBABrq7Bb3+VU6U+wYWXnEQCngTQnt8CFxaeBLI6KDb3T8TAGeJ2jTm0b6dGKwek
 KtEDXhsrQNCdmWLfzWFmwrsMzhuaVOn34u7KUo1YSn0DxZ4JyrhmlvN3l9rraWUhXd40
 OjivFKPOMH+myaMa/by0non9bT1EZZka1L2b5fNOrtCUEn8G8vvuS/+8s+NQ0JqE3YFA
 2gLbhNBpDxakmJ4PkQNA99I0wYujfr0SPk088niAtCgdBsy3RXnNFexQtWN1OkvtREPs
 kaPPPDyM8noIPXOrFuJyukFqI2AwNrIr2vk/2nXHuFfT+cl571MLj0bBUVWzmgDGIzyI Ow== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39w9hfwkxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 15:24:05 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16LFAWaV131009;
 Wed, 21 Jul 2021 15:24:04 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by userp3030.oracle.com with ESMTP id 39umb2xbsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 15:24:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXcOR4ZSeXc3+hoH1wYdz3hi8rdQINlhf9dnb6sPhcHruLkzWGewLtWjAK5OH6Ix9imoxxfvwfkOVYRyZ/iSqUQfRQgc2mGaFCmxt0zHhPrhXBBCSo5+HKNDuMCaJvq7DfsdCpPu8MYna6Au/mgHS8Iv9cDsHFiQB8W66uGv5oTeCWbVunWvS+ImWccW4D+olpqO6pNuznBub9wASS2RpYQVSuDC5N7P0fjeHOYS2JTIiRJj3UH1dFUkHgnmZQaoRcE31x4CEX09Ggfg6UJjTksf0+IzKtEt1/ZngbOlJSNk5k47ObCV+d5xgrlHSmi6hICinDviNh9mcwuxFzoUmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGeC/KnTvWHw/3qk1d62js7iNqPWQwR/ClH1kPtUDpY=;
 b=L9oGwSb80NVmFNJSxcxIKmyjrFmq9HvvLyLHdd8igM4LmdJ4+bh9am6ATMp4jr3H4L0/JC1ssBlLQPC2Pqes5vaszB8qOgR2/v+R46yk6/DT3rxiHdH0Aeop98A7gU6pe+gi9P5U/kpwo0xP2Hj3a3ChYFYh3FSCKoi0nv4M2QMxrllpVRuKq6Yq0gTxejCQaG83rk7pUguOV1QFXbz/+f1I7VONeLVhd/gdDt/YUhOS7gTsBbnMPPcrs7Rh5QuHtYN+cf3N6qmyUt2jm+XH9S+prcIkS1falASiAVDFNHKTjFVDKzzUZl8VOGnomfW+4o+v2HdUUWZUR1ZENuPv4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGeC/KnTvWHw/3qk1d62js7iNqPWQwR/ClH1kPtUDpY=;
 b=VN8RUbhwO4Y+wBwKswSPuqHQa6Q7IsxQbyBBjEmv3/FcnbFOLSHASsvTGPOnP2APmRg6wiZjLZ2OEWhOGle4psTHcxI7bCp7FSctaSBN6x/4qIeZw7Fp7/M9kVf8XI+vtlI/sDSDAR48pD4CWxgVHipNGaYTy4UElD6IXCRPEfA=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by BYAPR10MB2629.namprd10.prod.outlook.com (2603:10b6:a02:b7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Wed, 21 Jul
 2021 15:24:00 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5%9]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 15:24:00 +0000
Subject: Re: [PATCH v5 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <20210713163734-mutt-send-email-mst@kernel.org>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <1e2b8024-e683-d64c-2c93-54fb26ab422c@oracle.com>
Date: Wed, 21 Jul 2021 10:23:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210713163734-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY4PR06CA0034.namprd06.prod.outlook.com
 (2603:10b6:903:77::20) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by CY4PR06CA0034.namprd06.prod.outlook.com
 (2603:10b6:903:77::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Wed, 21 Jul 2021 15:23:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c29f2d58-9d57-49b1-776f-08d94c5b90dc
X-MS-TrafficTypeDiagnostic: BYAPR10MB2629:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2629225510EFEE0BDAB16E2C97E39@BYAPR10MB2629.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9HsSzsxOaiAydIhRoDh7OWf5RW/L2zqVUmV/UWiVQ8yf+LryZU5epM7vt1MlDYnp9gm7K9rq8k5z3oUJLVSLrqNSUdDQ1lJl2IraWl+9QiC9aQKw7qmUmGGXne9789jt1iDNL9UcOdACypAst2mypdDcZePHTKsrr+EyFc4MtD5ndzgexIuXdCnxktnyPmBgHAOyY6mvisKDWxwr7F5ObdPLympQgT/etsP4ZPmWX5IeOVMOefhdTZASs2mRxl477QpFcWOWV4HOFIfz1cWvUib/clfQrMZCXREG2Qgi0eLqNCOU0oo6wDzy98bFRy6mXfd8iDhgBvDkmBizz1nmuMgG6g/KFLQEJBVNHVZ3bYJJrFfeVYwaBCXI7QQtIZr45fWgdVM+UGiFKzTQyTKcg9upuKKK8fSjYf/YUA3SvGjBlxIyaqoFgMLHGk0+HGVhOhpqydvAFujDdclwSbO/F4aqqklFjaRBLLqRuDE7eM0+SPt8kzffjNCjEPzWBYyK7Xnw5HLr6RF48ik7HhYFf3GuhQPKtgisyUEhnrhcHqBGt3pCbBZc72ZzV7/Ys2HZkA4ZeVgKYJ1gBxQlnD+6X/IMM3FPU+FaX62jsT/TZLhfKB1JCExG0Rs57Ma/xTDuiIEHKyi8GL3XFVVJ7COaHf2w+JisaDBu9fFUgsMxytdKBQIeFonxWnvlFPqqzhpFXK9QiUaq/H8YP6+tHC5tr7aAkEnGAgPXS83b9aPAmQo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(8936002)(2906002)(186003)(86362001)(6486002)(2616005)(31686004)(508600001)(316002)(31696002)(83380400001)(38100700002)(36756003)(6916009)(107886003)(4326008)(5660300002)(66946007)(66556008)(66476007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTAwaEhjZXcxSmpwMC9Rc2I0ZGt4ZklFYnVVTlhTVGtqNHhVQTM0YWtxaGlq?=
 =?utf-8?B?VHhsaktRM2hDZnhkQ0VNZitNRFg2S1A2d3BQdHhZSW5YUFdOSEQzTDdiSnoz?=
 =?utf-8?B?WTFBVlF3MVI4ZHk4WFo5WFdpQTNNenRYQzNQM1h5RHBCdlZGa25nZ0Vodlky?=
 =?utf-8?B?aXNNWnQxaFhCdC81cTliOHdlK25YNm41cXEyZVFTalowTWU0cmpFQStkb2Rh?=
 =?utf-8?B?NmczQ2xidlpmYjJtTDhtbGRYWkhaWTZ6V20xWFVJNkNxc3pUT21tMTEwc2VO?=
 =?utf-8?B?dS9RcXpiR28zdk04Q2hTVEN1UTFxUXV0NzRCb016K3d3bXZIRkg2Y1VZbG5D?=
 =?utf-8?B?RG9VYTZnUVQ2T2JsYUsza0ZKcE9VV2o3WUZCTWVEbGJFcHlsMUVvWis2K1FN?=
 =?utf-8?B?N1lkNDdhWXhKTGRwdHNjWmxJNFRvRWNvN0l3My8xMzdQVDNjMExXZHZ4RXpV?=
 =?utf-8?B?T0YrKzZ0Sk9XSSs1bkNFdUxTNHluSklTLzRxbExLK3FBam9ha0FSRm5ERW53?=
 =?utf-8?B?TGJGejNOWDNhVXV0d2RNYTVPU3Y2L215Ri9BNmtUOVcvSXhtbUhvZGJQWTdl?=
 =?utf-8?B?dEZNc201VS9DK3p1c01rVkhlNG9WaFo2K1lGVklqdXRDbUtQcUx3N0Rsa0hF?=
 =?utf-8?B?bTV0SzFWU1ROYVQ3NkNwM2pvZHlJaDFmUnRmT0pITjE1U3pjMlg0dTFOK3pp?=
 =?utf-8?B?MU1ObDJCZXN4TlM3RXkyYW5keTFaUFB3YXdEUGVuQlFFVzcyVE1JUm82WE1X?=
 =?utf-8?B?SFBwMFJNREhsSzNSU0M3NmpCRXQ2Q2JDK3V6OFVYWVRpWDRhOTNudHNuTmo2?=
 =?utf-8?B?U1BKdXozeGpmRk5JR2p2WWZOU2ovb2NqTnV3bEtDb2VxZVkzdzhyK2cveUth?=
 =?utf-8?B?LzZrR01IT1kzYzhiQ0JsK1ByR3VEcVkyS2dla29Dd0hPQUhwTmg3WGZuK3NC?=
 =?utf-8?B?QnhzeEN3VUp0MGRESE1mUFZzMU15MnFpRS85VEg5dnVoQm84VFk1ak1TUkhr?=
 =?utf-8?B?ZGFuaW8vaitMS2Vtdk1CcXhnVjN6VW9OdEpiTnJCQ2NrR0kydjJCSndrSXNP?=
 =?utf-8?B?cGpEQjJoUVlCOWk1SkJVUlFoWDlZVGZXanVDSUJsUDliOTBDTXNpZlhYVTI2?=
 =?utf-8?B?SkpBMUlab1FPWEdueHlQQU1pejRHbk1kNnM5ZHhmNERLcFVJZmlycnRGZW1w?=
 =?utf-8?B?UHJNL0x2TWZQV3pKTW0rRzhpNFNBaXJTZWs4TDNuZ1ZncElDNnZhcy9hS0hI?=
 =?utf-8?B?L3hxQ3ZRZ1BhK2l4NTBFVktVSDRMTXZjM29VSm1NdkkrK05lRnY3TFFpUzdX?=
 =?utf-8?B?Qk93MkFzSlU0c05BS2xCZWNmM0V1QmVMY1NCTXV2bWdTanZITU51djF4UTdr?=
 =?utf-8?B?WitWS21FSVhpb3FVN1dXSXp2alUzZFhEanFXZEd5OUpTRUVYZk1RVFVJcmFo?=
 =?utf-8?B?VUZzNk5YdFRwS05rR1VTSFpCdzlaSWwveFFmR29EcmNlbGN4c2tBU0sxNVFu?=
 =?utf-8?B?VDEyemZRem1JLyt5UURwQUJvQlZ1QWtndUJEblhGcGlNdHM2eFNmZkpmb2JW?=
 =?utf-8?B?VjJGRkQ0U2pPd0VYK0Q5TXVtaHRJUWUxM1M0MDFIWHZ3SVdvS1ZNNEZveEUy?=
 =?utf-8?B?eWZnak9RSnFKeWp0QS9jRGJ1eXhCOGhkdzlUWWlXS09YRE51VlFnalNwWmU3?=
 =?utf-8?B?VkdxRFFlVGVxbm4xb2pPUFZWbExWMWszMGtaNXdQTm1jVHlOYVQvNXZQTFMz?=
 =?utf-8?B?dmpZUlcvZnhHekE2bkNQUWtINVB4UjFCeEdXTWo3UngwV2RUUlptTVlNYWZw?=
 =?utf-8?B?b1NhdGNCYmZDUzRRZ2tUQT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c29f2d58-9d57-49b1-776f-08d94c5b90dc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 15:24:00.7470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPYad3bTXGyeDZNymse17VHm05Ij4YcMi8WVnAyzvJTOJBuW1g/yC/inyQcbUVjZZtexYvMkGFAcPzRs5HU/EJ4HvUfWk0CxRTXE22nuDBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2629
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10052
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210089
X-Proofpoint-GUID: 1Eq_KEdXMfbr7gF2ubv4aVd2i15ZbPIk
X-Proofpoint-ORIG-GUID: 1Eq_KEdXMfbr7gF2ubv4aVd2i15ZbPIk
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, konrad.wilk@oracle.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/13/21 3:38 PM, Michael S. Tsirkin wrote:
> On Wed, Jun 30, 2021 at 03:07:11PM -0400, Eric DeVolder wrote:
>> =============================
>> I believe I have corrected for all feedback on v4, but with
>> responses to certain feedback below.
>>
>> In patch 1/6, Igor asks:
>> "you are adding empty template files here
>> but the later matching bios-tables-test is nowhere to be found
>> Was testcase lost somewhere along the way?
>>
>> also it seems you add ERST only to pc/q35,
>> so why tests/data/acpi/microvm/ERST is here?"
>>
>> I did miss setting up microvm. That has been corrected.
>>
>> As for the question about lost test cases, if you are referring
>> to the new binary blobs for pc,q35, those were in patch
>> 6/6. There is a qtest in patch 5/6. If I don't understand the
>> question, please indicate as such.
>>
>>
>> In patch 3/6, Igor asks:
>> "Also spec (ERST) is rather (maybe intentionally) vague on specifics,
>> so it would be better that before a patch that implements hw part
>> were a doc patch describing concrete implementation. As model
>> you can use docs/specs/acpi_hest_ghes.rst or other docs/specs/acpi_* files.
>> I'd start posting/discussing that spec within these thread
>> to avoid spamming list until doc is settled up."
>>
>> I'm thinking that this cover letter is the bulk of the spec? But as
>> you say, to avoid spamming the group, we can use this thread to make
>> suggested changes to this cover letter which I will then convert
>> into a spec, for v6.
>>
>>
>> In patch 3/6, in many places Igor mentions utilizing the hostmem
>> mapped directly in the guest in order to avoid need-less copying.
>>
>> It is true that the ERST has an "NVRAM" mode that would allow for
>> all the simplifications Igor points out, however, Linux does not
>> support this mode. This mode puts the burden of managing the NVRAM
>> space on the OS. So this implementation, like BIOS, is the non-NVRAM
>> mode.
>>
>> I did go ahead and separate the registers from the exchange buffer,
>> which would facilitate the support of NVRAM mode.
>>
>>   linux/drivers/acpi/apei/erst.c:
>>   /* NVRAM ERST Error Log Address Range is not supported yet */
>>   static void pr_unimpl_nvram(void)
>>   {
>>      if (printk_ratelimit())
>>          pr_warn("NVRAM ERST Log Address Range not implemented yet.\n");
>>   }
>>
>>   static int __erst_write_to_nvram(const struct cper_record_header *record)
>>   {
>>      /* do not print message, because printk is not safe for NMI */
>>      return -ENOSYS;
>>   }
>>
>>   static int __erst_read_to_erange_from_nvram(u64 record_id, u64 *offset)
>>   {
>>      pr_unimpl_nvram();
>>      return -ENOSYS;
>>   }
>>
>>   static int __erst_clear_from_nvram(u64 record_id)
>>   {
>>      pr_unimpl_nvram();
>>      return -ENOSYS;
>>   }
>>
>> =============================
>>
>> This patchset introduces support for the ACPI Error Record
>> Serialization Table, ERST.
>>
>> For background and implementation information, please see
>> docs/specs/acpi_erst.txt, which is patch 2/10.
>>
>> Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> 
> 
> ../hw/acpi/erst.c: In function ‘build_erst’:
> ../hw/acpi/erst.c:754:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
>    754 |             build_serialization_instruction_entry(table_data, action,
>        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    755 |                 ACPI_ERST_INST_READ_REGISTER       , 0, 64,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    756 |                 s->bar0 + ERST_CSR_VALUE, 0, MASK64);
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../hw/acpi/erst.c:757:9: note: here
>    757 |         default:
>        |         ^~~~~~~
> cc1: all warnings being treated as errors
> 
> 
> Pls correct.
> mingw32 build also failed. Pls take a look.

I've corrected the above build error.
I've also corrected the mingw32 build error.
eric

> 
> 
> Thanks!
> 
> 
>> ---
>> v5: 30jun2021
>>   - Create docs/specs/acpi_erst.txt, per Igor
>>   - Separate PCI BARs for registers and memory, per Igor
>>   - Convert debugging to use trace infrastructure, per Igor
>>   - Various other fixups, per Igor
>>
>> v4: 11jun2021
>>   - Converted to a PCI device, per Igor.
>>   - Updated qtest.
>>   - Rearranged patches, per Igor.
>>
>> v3: 28may2021
>>   - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather than
>>     internal array with explicit file operations, per Igor.
>>   - Changed the way the qdev and base address are handled, allowing
>>     ERST to be disabled at run-time. Also aligns better with other
>>     existing code.
>>
>> v2: 8feb2021
>>   - Added qtest/smoke test per Paolo Bonzini
>>   - Split patch into smaller chunks, per Igor Mammedov
>>   - Did away with use of ACPI packed structures, per Igor Mammedov
>>
>> v1: 26oct2020
>>   - initial post
>>
>> ---
>>
>> Eric DeVolder (10):
>>    ACPI ERST: bios-tables-test.c steps 1 and 2
>>    ACPI ERST: specification for ERST support
>>    ACPI ERST: PCI device_id for ERST
>>    ACPI ERST: header file for ERST
>>    ACPI ERST: support for ACPI ERST feature
>>    ACPI ERST: build the ACPI ERST table
>>    ACPI ERST: trace support
>>    ACPI ERST: create ACPI ERST table for pc/x86 machines.
>>    ACPI ERST: qtest for ERST
>>    ACPI ERST: step 6 of bios-tables-test.c
>>
>>   docs/specs/acpi_erst.txt     | 152 +++++++
>>   hw/acpi/erst.c               | 918 +++++++++++++++++++++++++++++++++++++++++++
>>   hw/acpi/meson.build          |   1 +
>>   hw/acpi/trace-events         |  14 +
>>   hw/i386/acpi-build.c         |   9 +
>>   hw/i386/acpi-microvm.c       |   9 +
>>   include/hw/acpi/erst.h       |  84 ++++
>>   include/hw/pci/pci.h         |   1 +
>>   tests/data/acpi/microvm/ERST | Bin 0 -> 976 bytes
>>   tests/data/acpi/pc/ERST      | Bin 0 -> 976 bytes
>>   tests/data/acpi/q35/ERST     | Bin 0 -> 976 bytes
>>   tests/qtest/erst-test.c      | 129 ++++++
>>   tests/qtest/meson.build      |   2 +
>>   13 files changed, 1319 insertions(+)
>>   create mode 100644 docs/specs/acpi_erst.txt
>>   create mode 100644 hw/acpi/erst.c
>>   create mode 100644 include/hw/acpi/erst.h
>>   create mode 100644 tests/data/acpi/microvm/ERST
>>   create mode 100644 tests/data/acpi/pc/ERST
>>   create mode 100644 tests/data/acpi/q35/ERST
>>   create mode 100644 tests/qtest/erst-test.c
>>
>> -- 
>> 1.8.3.1
> 

