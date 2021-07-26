Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CFF3D67DC
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 22:05:52 +0200 (CEST)
Received: from localhost ([::1]:60520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86rH-0004Qx-1e
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 16:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m86p9-0002ZT-Rc
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 16:03:41 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:10034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m86p6-0003Y0-JK
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 16:03:39 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16QK1s6P014337; Mon, 26 Jul 2021 20:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=hvjAsGmP8Cd/SoFrO43JNmMPe/LSho78nLBVVRKh/oc=;
 b=U2anjo6ltxMgSVN1NGen66W+Z+AfUonfOr0Fz7KdqEEJIMaf+briG6X2KXNNmgm7Qd0M
 TiME019VlZi6gGTs/MzydjQbXWfjGKJ9lAyiPdBHVs+E05NE7WhbgRzyT8zR3vAUzvvE
 zG1dUCC/vVFP39V04a5++mhjNxK6cEzVByDeJVdm4DJajaNNLyMym2kSZOyB0++5q+SH
 lKIkhSzvWzlFYUHrmULDTtHpUCkNQK/eUAgzjY/yAe/NgNb/CXQaHRIs9QY9TVQgIkDW
 POtmwQIaScjOG2Tp5R3c9F6E0B7DYl88s9baGD3KotkHrwx0Kp3P/u9hd2zJEY0AsvBn GQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=hvjAsGmP8Cd/SoFrO43JNmMPe/LSho78nLBVVRKh/oc=;
 b=c2VU25xy4YZJWmcSXSY5QtbkLSkAGj9bUl6+vr+aaFPL8S1YrQ0Ks6MxCTM9RlCeGH1p
 a/iMKa/6dzUKvBr0nwjk4vl2ZHnBZ9ohhDNuuBQjbugqPSfGbvyp4DHBM34QtOMhDaAp
 05Igcumb6r8z7jKwteTfrijX6GAhHfFOsI8h/Su7zOD2JGzEV9dyUXrMq6Z9xqoxnYeR
 DnIDh5A/AE6ApG161uRMLCehS04QVGuWmdoZTyrHdFz/aMEdh1MX/GqhDh6v6OamSgPt
 desxbAjZI114OqJSFi2iAKqJUwbbpEO1vI/AJqekxnyoIHkYsl+qnoyYf+1NJ/MttkhJ Fg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a235dr34t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 20:03:34 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16QK1dKa066578;
 Mon, 26 Jul 2021 20:03:34 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by aserp3030.oracle.com with ESMTP id 3a234920b7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 20:03:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOpjkq2UmVW308IW/0i4fJ+cIOPAyWb0ErZVZCdKLBeY4QenH0PwiLUfki1UjKYxjDV1+VtmsPddUylY4uFv2CjuZBpgXA5W2E3Ck0g1D9VGSMQMP2honreAhZaEgI0t6fg2rzlLL62OFzxSLzkRcyyaSmTxHAE+2tPuP3I76+4srdLUjz5WpeOrc7v90oyq+xl2SQTV2U0P2jRf42pOUBEg2A2FwTr8u41P8s+RbhlAcP/DGb3W744PmPoXqIwE7Xa09bR2NgIQ04Bg7JisipCPQgTUBEAjTTW3V0kfU1BSjzDJ+Yl3sETrNkgSuDdyVz8oW6OFneGjd68nh4zyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvjAsGmP8Cd/SoFrO43JNmMPe/LSho78nLBVVRKh/oc=;
 b=K6i6i7YPtQ1lcbRCeKeOc3Jr3n9prdP1bJhQwqACP1+Zd+3NxpgIYdZDxoewxKRo/ABlzfNlPDthHPc0ThlD83cI6TE+D2cXH561mQRfRm01ucMQqyPWE91gjxdoULgp6YHxs3Mtb3pJUmCqS9CVb5NBFdXyhmU7rhcwZYaujZ7rpTSXcL2TxfEuwPHURp4SHKauoEGsVaLLXy08wpZjnxG/GzZ+eSCiDG0HJH1XpbVTohFqRLTy2lWggXbm9FRwQxyMZ+qtnPlZynzi8Qg4num+CoxwQRcoTFgbBjeaKDMy7/0QqUVVHOY920DusHTjgv8AvJMrRjv1lmIhER1SYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvjAsGmP8Cd/SoFrO43JNmMPe/LSho78nLBVVRKh/oc=;
 b=I1JthtJp8DC2eeoHEAKBn59S8Nqbo8KBFtW2ZAQV4g0JkMT1fYfu7Jh4Xdnx0Mv1N06+7oIPXlMdfa3+StLAizx8qaKhdJq4xq3mx7Cz/9isIDnwdbBkdjZzplpGAJo9ZaMeQMiEDsgzJPzGila/jmWGIrL/Otl7yJ9Mz6luUfs=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1758.namprd10.prod.outlook.com (2603:10b6:301:9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Mon, 26 Jul
 2021 20:03:32 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5%4]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 20:03:32 +0000
Subject: Re: [PATCH v5 07/10] ACPI ERST: trace support
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-8-git-send-email-eric.devolder@oracle.com>
 <20210720151509.7fd47f31@redhat.com>
 <00e755de-0435-9eab-e447-e199f40e328c@oracle.com>
 <20210726130801.73ba7899@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <433f0842-b5ac-b002-d132-6c90ecb95717@oracle.com>
Date: Mon, 26 Jul 2021 15:03:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210726130801.73ba7899@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:806:d0::35) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SA0PR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:806:d0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Mon, 26 Jul 2021 20:03:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b32a196-c094-4e43-22c6-08d950707197
X-MS-TrafficTypeDiagnostic: MWHPR10MB1758:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB17583D5C78BC07EFD30C243897E89@MWHPR10MB1758.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MFqFiBqTHOWJs+80UGxrwCMcMrr4cNx40bCvLpD7SNYTchkCkf1Mw9/GJtsYTZEsJVJHZ4m7taPwpY11Bvt17sACiiSbhhWUP12VgTgHnR1Jf9eIBE6DpzCt43ZwkyDoaDncPBeavKiWmqKq62W7e6v5NV/1SQeuoYg5yQksAFAwOw30wOnYrUrXESBcXP3MdWa9twyCx0xqX/XYTmLN4cIRByGXHBFJKaVHrdvn4ql05Pv7F0kvDTsLV9pbTr8c2iRiuERZ8KVc1ydc12pwH25Cfg01JmoeEEP4x599JgSnpQcNKKzs1H0K6L6yuNwVo4JRiSA0uEo6iEr+0lS4+gvbkMbMOlkBE8eg2PO2S2nEjBuZlWij0eikLFfqrqu71DX8XdXfOUHjTdIu1gGgemJNH1blJPdnnbQgUltsxFv53QZ6by7a4Wo3AG0zhVq8WhvTbcf/4GEr9+HgAlr/h6r64t/QaaObp8xEYojX4TuC0lwOg5eC4hDB9QqpSOIsaDveAtvJHKV5ijqsa5n9elH/JUt+ZoDCfliGMYgqDTVT67VikcmwGFm8fOco1QI2LJ3B2hu719QNmg5jy1dv5pOxNgfwdV9WnDLrwNRRx5/mywzlv8WqX4wY/rm63f59VlZuXRcO4lip2fsab6w2Y3yeEvsdzTobYk6rRez5MGNp5A78983dGfGp+YinkLYiBUvYJ69Yd1zRH4NAPtIvbASmZD5iOrirRzXOhJXPsGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(107886003)(186003)(31696002)(86362001)(4326008)(83380400001)(53546011)(6916009)(31686004)(6486002)(8676002)(2616005)(316002)(66476007)(66946007)(508600001)(5660300002)(8936002)(66556008)(2906002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFlSSGFPdmVJUzR2L012RHgrbUVWNFRBajZ5L0QwWTlaemgvRVhFZmp3UkJB?=
 =?utf-8?B?WDhZRmhxR0Y4TnkwVHpSM0VDTHBqckxnRHRmVFY3Yk9ucTM4UGd2Mk1aUU4w?=
 =?utf-8?B?elp4RHppRUdOS29hRGRBemhNeGxDcjN4N0ZRejlxVWNVNEhrSmZBSXlHUnNj?=
 =?utf-8?B?c3R6ZUp2a1VNNlN2NHdDWk1SZVkxQ2lsbGJ2d1VQREpGVFVzM0w0MXRvNkEr?=
 =?utf-8?B?K0c5ME9mZk5odkRncVNBYkdJeENRVHBscDlsWlFwcjE4ZUxybkdodlVuTVRi?=
 =?utf-8?B?WWd1RjJKN3VZT0ZCYTJHcjNEQjdzaGp1ZDhLVEVXUkc0bmFKVnM1NEJYUUJs?=
 =?utf-8?B?Rk1hM1VQcCt1R2xodTFDd2p1QzRLdzRXSmJVdFp5MVZOelR6YW4zU2o1SHds?=
 =?utf-8?B?MWdxeThNbk5UTHYrN1FLcGZlVkt5WE9yejNLYkQ0anhlNDRtRTNzbFFGNmZS?=
 =?utf-8?B?VzBHTDROVEx3LzlOOUQvdm1Va2RLWGRUV0Y4eTFRNnlBT1MwczVUTUdEd21h?=
 =?utf-8?B?cEZzR0FxWFVLcW0xeXZpWGh1dmZIU04wdWkzSnhzRnNqZk00YUxHbDlLMis2?=
 =?utf-8?B?NE1YbGNWK0l2enRZRmdiUWl3Y2FIQktEMDhKL2g3YmJJZmVORDUwVjl3b1Q3?=
 =?utf-8?B?Vm5aVVdzc3doKzFDZVVWMTI0cy9INndVSzIrWDRaZDZwL21NdUtFVFNLaGpM?=
 =?utf-8?B?MVZKUURTczZpb3FvamNsQzRneTZzVmFUTzJMOC9WZTQwZ3FyM2E0ai9jNlpN?=
 =?utf-8?B?cGFnUHUzbXFsT1hQTkxqWW02V3hLOUVKaFp4c2ZMZEZFbXBXSXYwVGI2NHdw?=
 =?utf-8?B?YVBqTTlHall3ZVlzR3pCeTRjVVdFL0dQdDFQelN5WTJSZXBnbW9zOXJ5VXU5?=
 =?utf-8?B?VS8xZXdIT0djQS8veXF5UVptWk1qdmJwVk44eWR5ZnBMd2VkdDgrRktjM1Bq?=
 =?utf-8?B?RUhvcFU4S3c3MjZsaTl6dVVGdEQrYTBPNGNGbGFldmlNMFo5L1I4di9FSWZS?=
 =?utf-8?B?aDh4YkNTbk1WQ0FmYk90WklaMFdPekd4cTNTcDlTMW9ZaGJ6ODlHQVhBUUho?=
 =?utf-8?B?QkdJU0lVdnF1RFQvYXpOb0E1Q1V5V08zVUhuajQ3U211dDNzS2YrdEdjQXBF?=
 =?utf-8?B?SDNXTmMxUG9SUlJBMk5zTk1YR2dhNEUvb3NWbTN5cHNiOUJpcTJzSzlwZ1cw?=
 =?utf-8?B?N1NnS0hDZ2dQVU1TQWNJQ3ZZYzA3VU1rWExDQ1o1blNBbW4wZC8vZWI0ZU1D?=
 =?utf-8?B?eFBsSnloRUQ2UmtJYmdGenhZNkEwbjdRdmN6c2ZqRnRvRjViUnZKNzRIVjN4?=
 =?utf-8?B?ODdrMGpDcXhsWk54eWg5TFQxZ1JmeFZnQkpJVWFCYnNmdGxFWWNXOEJoRzR2?=
 =?utf-8?B?SExWNWZHNEtaVkRWWU9DWno2UUxlTzRqSmdDQ1VaMEVHSld1dFF5VzdHWkhG?=
 =?utf-8?B?eGhMdDVOaG9UN2UveE1aUVdEa2k4aVRMYnZEaTYwN0FHN1RPZmhWWjhvSkhV?=
 =?utf-8?B?UTN2UldLdVRpeUFFd0dTOXVIRktXM3QrWTJYOWxTeHNTMWphVWk4Z3VUa01T?=
 =?utf-8?B?dGFMZGNtRGhySGtUeGQ1ZjlQbXQ0UDdtWHVVRndCODRhSDRiUXV1eFBkU0tG?=
 =?utf-8?B?ZG11QjJkNEVNdmhBV1dsUTNPY0plTTdETldjM3dhL2laWGRGbHVCVUo4V1R4?=
 =?utf-8?B?TGdneWNDWm05dzVPTG5YYkVncDlvb0FBNjFFc29qZTNjSy9aUDB4ei9vUUFN?=
 =?utf-8?B?c2N2blVwWUwvbk8wTUhQdnV4c3JJYmU0b09XYWdUa09uV0ZyVThlTG4rU1hh?=
 =?utf-8?B?Z0VhbytFVWpuTGp5bHUwZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b32a196-c094-4e43-22c6-08d950707197
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 20:03:32.2821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2STA5XASFM0wWA9diftnqPXjUpluVNeLT1zzwZ1VwJAp5MjkPftYUaa4yQQq7AcRtw5skW/heuZAvQTRUhsln5NDjyYPk1M3Di1imajYPZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1758
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10057
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107260118
X-Proofpoint-GUID: aqeVahQi9JiediSd-Ifu5lN03XByhjbw
X-Proofpoint-ORIG-GUID: aqeVahQi9JiediSd-Ifu5lN03XByhjbw
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/26/21 6:08 AM, Igor Mammedov wrote:
> On Wed, 21 Jul 2021 11:14:37 -0500
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> On 7/20/21 8:15 AM, Igor Mammedov wrote:
>>> On Wed, 30 Jun 2021 15:07:18 -0400
>>> Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>    
>>>> Provide the definitions needed to support tracing in ACPI ERST.
>>> trace points should be introduced in patches that use them for the first time,
>>> as it stands now series breaks bisection.
>>
>> Are you asking to move this patch before the patch that introduces erst.c (which
>> uses these trace points)?
>> Or are you asking to include this patch with the patch that introduces erst.c?
> 
> I'd squash it into patch that introduces corresponding functions.
Done

> 
>> Also, you requested I separate the building of ERST table from the implemenation
>> of the erst device as separate patches. Doesn't that also break bisection?
> 
> it should be possible to compile series patch by patch and not break 'make check'
> after each patch.
> 
> ACPI table is not part of device, it's separate part that describes to OSPM
> how to work with device. So if code split correctly between patches
> it shouldn't break bisection.
<nods>

> 
>>
>>>    
>>>>
>>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>>> ---
>>>>    hw/acpi/trace-events | 14 ++++++++++++++
>>>>    1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
>>>> index dcc1438..a5c2755 100644
>>>> --- a/hw/acpi/trace-events
>>>> +++ b/hw/acpi/trace-events
>>>> @@ -55,3 +55,17 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
>>>>    # tco.c
>>>>    tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
>>>>    tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
>>>> +
>>>> +# erst.c
>>>> +acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%04" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
>>>> +acpi_erst_reg_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%04" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
>>>> +acpi_erst_mem_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%06" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
>>>> +acpi_erst_mem_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%06" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
>>>> +acpi_erst_pci_bar_0(uint64_t addr) "BAR0: 0x%016" PRIx64
>>>> +acpi_erst_pci_bar_1(uint64_t addr) "BAR1: 0x%016" PRIx64
>>>> +acpi_erst_realizefn_in(void)
>>>> +acpi_erst_realizefn_out(unsigned size) "total nvram size %u bytes"
>>>> +acpi_erst_reset_in(unsigned record_count) "record_count %u"
>>>> +acpi_erst_reset_out(unsigned record_count) "record_count %u"
>>>> +acpi_erst_class_init_in(void)
>>>> +acpi_erst_class_init_out(void)
>>>    
>>
> 

