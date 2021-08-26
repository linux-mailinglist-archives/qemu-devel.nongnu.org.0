Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FAF3F825B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 08:20:11 +0200 (CEST)
Received: from localhost ([::1]:38886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ8kE-0006Mf-AB
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 02:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mJ8is-00059e-3E; Thu, 26 Aug 2021 02:18:46 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:55732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mJ8io-0005fz-PO; Thu, 26 Aug 2021 02:18:45 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17Q12KSp001424;
 Thu, 26 Aug 2021 06:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=WJhht0WtBqjftnpObAJELQ/b1yTHKJAzpDmQzj1EKAg=;
 b=du2FdA/E0IeJs0RbRGpBSDbiJIiEd3KU3itybEEX8IhdyThYDNMB0go7gQtTeGuwOrHH
 5g1pHDLbkEQRJ+QfkkN970duKgjY5urU4BJyinrFUbPdRNSgcNpqvft7AsuX2/Ms7E9l
 As39jBd+rHlIpYBnTiZw8dqJmtkRbm4gLJH45gEAsIA7lIXody2gN63cQ+jyDIQvv4JS
 U4olaG760MbrIp7L9poA5RKoPSDh85F7IcqyhWtxDICIvGUP++R1SBVu2/aFEUfUFOKc
 2vFbbl/B2p1ggDUijgc00itibca1T1lrnNCQm26YzL9Nkz3vIlOOM1EjnAb4H1hXIt61 eA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=WJhht0WtBqjftnpObAJELQ/b1yTHKJAzpDmQzj1EKAg=;
 b=Fyp0BY2fQ2LcX5P34dCW7R35dop7rB1FMXH5vxl48QALeMWhURg5IXb2/N/TYiCqsgXd
 olwoN5XT2pKCZnn2aRKgb6n/tnYUscQnqg5oJ/DGVgbf/TNQonRKijqXIvwqwlCIIvnm
 LYx5Z5YlNWyQ8jn/plQO9WdRNjpTILEwYqPhPPnNJbqKQGb5nhrpChhGMoOnNBA0fvzq
 trh03LmhPEYIuC/YTOfDJkQOAZlG8qLIeuHvD0MB/rV/x7eawAEDPFPKFDapDm1Z9wH1
 Am/11AWkjDGSqFSyZYsiCVcWHyaCNVS/R36nSHzW2Av/5VMVGtA3p1pt2y+yQm2kKC0b EA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ap0xp8cy9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Aug 2021 06:18:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17Q69fjt060288;
 Thu, 26 Aug 2021 06:18:15 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2042.outbound.protection.outlook.com [104.47.74.42])
 by userp3030.oracle.com with ESMTP id 3ajpm1y8k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Aug 2021 06:18:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCIOExtrCLNfQbNEiAUUZGjnf0QZQD1kQCjGRo6xQ+lzC4KtqmYQ0dG/gDqOpsFRQr6kd0nLe7+5dG6ko83Q9Kv0Bk/8qVXXLeF4UZbrSY14fny5EYxFcmnvoBbI1oIKnkAmaQCjMrU7+n7P/zyqfE89GYXEbwuyOCoe3q2ll/X5y8XiHsxzHuhcBzM7+lqqgLrTVhM0dnbqfa1YAoRQy3BHmKyC5RxCScdxhnJKQknIPaQFGBkJS1QPrUnYAvHO7BfrJQ/IJ+PSnRlMqiAFpJ3931J+yAWM5FfIIuZ6lCZEOF2z3BGFQNof9n9+Rk3Rt2nIRhWzlu+GostVShOo2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJhht0WtBqjftnpObAJELQ/b1yTHKJAzpDmQzj1EKAg=;
 b=n/LxrP9zI4VNjP5pyd4dwaY1qcQjbkOmM7rb5a9W+/2urejKFQ/FJnqRMjja8+RiW09K35VLcjPsc2KAeKgBgx5mrM2SfQ9p3s2nGPTQPRdJC1Mywtw3mzgV8tZ5t7BBGLq6NK5/lG8UghDJA2GKtiQqGxooMXgmwEW5njyYB++zcWO+1bvwJvH7hSvzlfvrTHCDTwbSlzWOSwsGWTGf15CanfxJwudD3QBMU01UdqBLX8XmpxtIHEGEMXfspsdR9LjudAlvLDJwErWHwM6zpwz5ya82NAujNXFc6em0BVi4deMJwj01siwuvEIEJmyH9nHFlmoTYyozdo+Inp1vKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJhht0WtBqjftnpObAJELQ/b1yTHKJAzpDmQzj1EKAg=;
 b=px9yYr30jeUwcPj/1TZ8Xdu2avf01Jz+6B9hTeJTD+mspLlsiWEchuKqoDDnpvngg6bbJQCGy0g178Qide8cNU1YZ/Cfj35Uv6gOwHM69cIrKq7SQh2YXwEIkOUiJVU3Mwno566fKuPhXwT4FJqW6Darn3iZR/J+CVbe3K7wdAs=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4726.namprd10.prod.outlook.com (2603:10b6:510:3d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 06:18:12 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%7]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 06:18:12 +0000
Subject: Re: [PATCH v6 1/6] qmp: add QMP command x-debug-query-virtio
To: Markus Armbruster <armbru@redhat.com>
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-2-git-send-email-jonah.palmer@oracle.com>
 <87o8a9e8k8.fsf@dusky.pond.sub.org>
 <a018750e-7066-8582-67a9-31584e24338a@oracle.com>
 <87v93wcmva.fsf@dusky.pond.sub.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
Message-ID: <0298fc69-d7f7-ae7a-eb1d-ee553aaf8348@oracle.com>
Date: Thu, 26 Aug 2021 02:18:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <87v93wcmva.fsf@dusky.pond.sub.org>
Content-Type: multipart/alternative;
 boundary="------------7A2E51CC5713EDE99A155431"
Content-Language: en-US
X-ClientProxiedBy: SN7PR04CA0173.namprd04.prod.outlook.com
 (2603:10b6:806:125::28) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (209.17.40.36) by
 SN7PR04CA0173.namprd04.prod.outlook.com (2603:10b6:806:125::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Thu, 26 Aug 2021 06:18:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a0fa0eb-716c-4723-95c4-08d968594849
X-MS-TrafficTypeDiagnostic: PH0PR10MB4726:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4726F043D3358DD9668B6F59E8C79@PH0PR10MB4726.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cqzmgStWRBQNbxYITvqyuACcFre33vLTnzk7/gErsBizPJSuZ49YoUohQdeE4cTIQyrOM0VZx/Y3ZmIpadqVn8xEFCcG4W9t4u33sOwtTHReR3vpS4GZfOTk7qbp4JRI64j0wwoZcigqdtrTLeEvYCeCvTby3bDzkh3ofGZLMWMxWVSMUGgEUzJdv1E3RqKLRL8nxTdVBFgrT+Moc8/VUC6IVENU0B3JhSGfnp8iH8bkiO6aFG+9fPf2kC46i/szZDLmg00HB0yr5D6z1msFg8qadHliAc+ZDlK1B37i0eUAfMuucmHnd3Wvy3fOI/zan0zOEVE6iTQQfbJ3oVpdtBeBETxorD3F7OSS/xqiAvWD0KZNxX7/q780K2nQDqM6UpwO7biKH52F0depVD5go8Kf9oS+BlFOHTwNwG8PtrocIhSlzwO6ztjY1FbQTzINMoJGGGcUAQHbGrgyeE8IpmxuAOOImbgnU59X54UAxrF9VAn4Va+HSfi63WDl8AwqjMgFbLE6PghhqWAkusw4q6kszjRKjTmQjJNVTokiJDvYzHpgJKlw1AUONbqIHP2ShYmWLXjaq4XOUGKBrbtCub/8vyhmAS5kbhpmKlaCVzwIciMFYh93FsYoAw1+Ua4iO2dTOF7CzgkFgK13sQbLmibwcIOFQ8NckaDGBTlpMJuvnY8eUilcryfV+oEL+gCVy0IqgLUqrZH1js7Xj77cMImP4rnPWUTYR86827XllKg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(346002)(376002)(39860400002)(366004)(44832011)(31686004)(2616005)(8936002)(316002)(956004)(7416002)(2906002)(33964004)(107886003)(7696005)(6916009)(38100700002)(8676002)(6666004)(186003)(6486002)(31696002)(66556008)(83380400001)(5660300002)(36756003)(4326008)(30864003)(53546011)(26005)(66946007)(66476007)(478600001)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUNMaHVRY1ZvMEdieURxdUhQQXo1SkRLb2I1bGhpTzhTU0ZBYk5xN09IUVVL?=
 =?utf-8?B?ZmRaUm1RdVE3Q1F4eFhvZWQ2ODVhejFPS1RVdVdzaHVnM3FDT21jaWNNZGxa?=
 =?utf-8?B?R1RBR2VlcVVNTTk2aEFRUExZSHhWNXhKS2xFejJWMittblJNalUwQ1gyZFAv?=
 =?utf-8?B?TkVhZ0N5TzVnK24vNVg0akFOOGFTR0RxZ3hXL2hCSksydXdkVWgvZ3FDaE4r?=
 =?utf-8?B?UkxMUGMwR3ZmMHJITEN6cDZBT1p5eHY0WG5KeUcrb0xBeE1tcUx4dEQ3MDdm?=
 =?utf-8?B?NmMreExtSDFQWDc3YkdacmhmdDVFZjVWL0hSNG9hajlkZzVNbkI5RnNQU2d6?=
 =?utf-8?B?OFJjNGNkeklvbG5XZ0RLbUpYblFXM3lONzhZK1JDbTNLTHVLZEpMVzhScWxY?=
 =?utf-8?B?NkpkdlVHS09OM0lJSWFEQUVadlE1bnpKSCtIR1E2eFVGWGR2S2hRWkpLdHgv?=
 =?utf-8?B?OXhwV09qWUpvd2tUTG1IRTN2anZUMmFqVUNOM2thbVV3anBFV3hHRklKSlJY?=
 =?utf-8?B?UW9TWmlKOU02SnZVNG5UUG5BVExSUXhNTk9NWVBEd3ExWjRPSHZCNU45RU5E?=
 =?utf-8?B?SnlENDdPazlGNTRNd1orWnhmWXFlTGZsM0ZSbWhaUVFrc2ovMVZxejhZNFc1?=
 =?utf-8?B?OWRKSVJYM292NG9FTFk1Ty9LM2NOVmRzQUpDdU9YOE1XeVpSOUZBQjdQRVcy?=
 =?utf-8?B?SzFCMDdweUxNK0VkQmlhKzdhK1cxUUxBajdsL3JpM2syZW5GUDdISWpBdjdj?=
 =?utf-8?B?SGpXV3drbDdDRVJibUVESkR6bERsUEhiMUIwVEFPOGFMVzJiKytyTGJ6dk5a?=
 =?utf-8?B?MEt1L1Z2UjJQNUpNaUI3Vlp1YXYzWEUrL2NyWEh2OFFYTjlpM25nNkc4ME1y?=
 =?utf-8?B?bi96eVRleDZDb2ZkaXozdlhHUmFvbEx5ZlZEcnI5NkFlODZmRHVOblI4cmJq?=
 =?utf-8?B?VGtiVFJXbnpWNEVrWk1McW5Qbjk4RklJSk00aEE4QWRKMTNOcmlmRTRmYy9J?=
 =?utf-8?B?em5penBuMnQ2OWt6RTBoR0tEVGczRnVWdTV1d1VYQ05obUJkSHJMdExqb2cv?=
 =?utf-8?B?RDFUZ0NwYlFsb09PcVNIME56UjMyNzNkNVUwSlo1NlZGTzZCWWplaDlXZFdh?=
 =?utf-8?B?T1NRUng5Tks0a2ZtdE44WVVHUGw1MTNDc3lRaFdzbVpSKzZxamNiRG1yc2Q4?=
 =?utf-8?B?QUpTbU54YnNNemFaRDIwclV0NFRKdXlmRnVCdzFvSHJVTnZKUTR4dnVTZ1Nj?=
 =?utf-8?B?UFhIdjRuUlNBbDh4cGVRWm5yblppU09rREhBNnVYaE41a1JoZElMTGwxTlZ5?=
 =?utf-8?B?Ny85dkVaWmJWSjEvVWlmVGtNY05YbTh5L3BCMGV5WGhEWk94R2U1N1o0R0Va?=
 =?utf-8?B?VWFpZ05wdzFCTzU2K2pmTmhrVjZGem83OW5zWXB2eE8rSW5pMS81ei9rMWZN?=
 =?utf-8?B?MzZwb3I0QmZwZ0ovNDUvbDh2TG1XckVVR1ZNMDhaT1FiZ3c2YkRuOHNTWkt2?=
 =?utf-8?B?d3N0TTliRFdRcnBjTktqT2JqVTd2RktTRGE5MGJ1emxkNjFUUWNZQTlsTmpH?=
 =?utf-8?B?anYxeFVuUGNIVHFkUkw2a3k2cmp4d0RwNFN4ZHFncjlqQUFqUHpQaFNNVFhp?=
 =?utf-8?B?UTduM0Rad243dTRCd2o2SXQ1UllHWmxJNWNDbnBZTG05YVFLdmVmMUk4bDV2?=
 =?utf-8?B?MElyRHlzb2RIcndrcEhRaHkyVFVxRXFYQjY0VHBGVWNIdTF1UEtnNk00NFhG?=
 =?utf-8?Q?QLY5fEK7dIZ78aWejGOYmllBWKmvcV3EA1m5rz9?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0fa0eb-716c-4723-95c4-08d968594849
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 06:18:12.6742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCz51nmStQpYz0OIjSZcy4UD5n/cwcx9yUyRp9nxeKi/XW6S0AnvyDjSp1D/0EH7Y2BK7vgwvW21gUD1j2Xtng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4726
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10087
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108260037
X-Proofpoint-GUID: iMsRNuMDCIuImwkg_BScEbAzoeMO3W0I
X-Proofpoint-ORIG-GUID: iMsRNuMDCIuImwkg_BScEbAzoeMO3W0I
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.24, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 qemu-block@nongnu.org, david@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, amit@kernel.org, michael.roth@amd.com, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------7A2E51CC5713EDE99A155431
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

No problem! Comments below:

On 8/23/21 9:27 AM, Markus Armbruster wrote:
> Back from my summer break, please excuse the delay.
>
> Jonah Palmer <jonah.palmer@oracle.com> writes:
>
>> On 8/7/21 8:35 AM, Markus Armbruster wrote:
>>> QAPI schema review only.
>>>
>>> Jonah Palmer <jonah.palmer@oracle.com> writes:
>>>
>>>> From: Laurent Vivier <lvivier@redhat.com>
>>>>
>>>> This new command lists all the instances of VirtIODevice with
>>>> their path and virtio type.
>>>>
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
>>> [...]
>>>
>>>> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
>>>> index 4912b97..0c89789 100644
>>>> --- a/qapi/qapi-schema.json
>>>> +++ b/qapi/qapi-schema.json
>>>> @@ -91,5 +91,6 @@
>>>>    { 'include': 'misc.json' }
>>>>    { 'include': 'misc-target.json' }
>>>>    { 'include': 'audio.json' }
>>>> +{ 'include': 'virtio.json' }
>>>>    { 'include': 'acpi.json' }
>>>>    { 'include': 'pci.json' }
>>>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>>>> new file mode 100644
>>>> index 0000000..804adbe
>>>> --- /dev/null
>>>> +++ b/qapi/virtio.json
>>>> @@ -0,0 +1,72 @@
>>> Please insert at the beginning
>>>
>>>      # -*- Mode: Python -*-
>>>      # vim: filetype=python
>>>      #
>> Will do.
>>
>>>> +##
>>>> +# = Virtio devices
>>>> +##
>>>> +
>>>> +##
>>>> +# @VirtioType:
>>>> +#
>>>> +# An enumeration of Virtio device types.
>>>> +#
>>>> +# Since: 6.1
>>> 6.2 now, here and below.
>> Okay, will update for entire series.
>>
>>>> +##
>>>> +{ 'enum': 'VirtioType',
>>>> +  'data': [ 'unknown', 'virtio-net', 'virtio-blk', 'virtio-console',
>>>> +            'virtio-rng', 'virtio-balloon', 'virtio-iomem', 'virtio-rpmsg',
>>>> +            'virtio-scsi', 'virtio-9p', 'virtio-mac80211-wlan',
>>>> +            'virtio-serial', 'virtio-caif', 'virtio-memory-balloon',
>>>> +            'unknown-14', 'unknown-15', 'virtio-gpu', 'virtio-clock',
>>>> +            'virtio-input', 'vhost-vsock', 'virtio-crypto', 'virtio-signal-dist',
>>>> +            'virtio-pstore', 'virtio-iommu', 'virtio-mem', 'unknown-25',
>>>> +            'vhost-user-fs', 'virtio-pmem', 'unknown-28', 'virtio-mac80211-hwsim' ]
>>> Please limit line length to approximately 70 characters.
>> Fixed, sorry about that. Also, should I continue this up to 'virtio-bluetooth'? E.g:
>>
>> ...
>> 'virtio-mac80211-hwsim', 'unknown-30', 'unknown-31',
>> 'unknown-32', 'unknown-33', 'unknown-34', 'unknown-35',
>> 'unknown-36', 'unknown-37', 'unknown-38', 'unknown-39',
>> 'virtio-bluetooth' ]
> Hmm...  how is this enum used?  In this patch:
>
>      VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
>      {
>          VirtioInfoList *list = NULL;
>          VirtioInfoList *node;
>          VirtIODevice *vdev;
>
>          QTAILQ_FOREACH(vdev, &virtio_list, next) {
>              DeviceState *dev = DEVICE(vdev);
>              node = g_new0(VirtioInfoList, 1);
>              node->value = g_new(VirtioInfo, 1);
>              node->value->path = g_strdup(dev->canonical_path);
> --->        node->value->type = qapi_enum_parse(&VirtioType_lookup, vdev->name,
> --->                                            VIRTIO_TYPE_UNKNOWN, NULL);
>              QAPI_LIST_PREPEND(list, node->value);
>          }
>
>          return list;
>      }
>
> This maps VirtioDevice member @name (a string) to an enum value.
>
> As far as I can tell, this member is set in virtio_init() only, to its
> argument.  All callers pass string literals.  They also pass a numeric
> device_id, and the two seem to match, e.g. "virtio-blk" and
> VIRTIO_ID_BLOCK.
>
> Thus, the pairs (numeric device ID, string device ID) already exist in
> the code, but not in a way that lets you map between them.  To get that,
> you *duplicate* the pairs in QAPI.
>
> Having two copies means we get to keep them consistent.  Can we avoid
> that?
>
> The enum has a special member 'unknown' that gets used when @name does
> not parse as enum member, i.e. we failed at keeping the copies
> consistent.  I'm afraid this sweeps a programming error under the rug.
>
> The enum has a bunch of dummy members like 'unknown-14' to make QAPI
> generate numeric enum values match the device IDs.  Error prone.  Can't
> see offhand why we need them to match.

Sure, I don't mind doing this instead. Just as an FYI, from the previous
RFC series (RFC v5 1/6), David recommended here that I create a list of
all the types and in the same order as include/standard-headers/linux/virtio_ids.h.

The benefit from this was that we never have to convert between the QAPI number
and the header number.

Let me know if this is still something you'd like me to do!

>
> What about the following.  Define a map from numeric device ID to
> string, like so
>
>      const char *virtio_device_name[] = {
>          [VIRTIO_ID_NET] = "virtio-net",
>          [VIRTIO_ID_BLOCK] = "virtio-blk",
>          ...
>      }

Sorry if this is obvious, but where should I define this mapping?
virtio.c or virtio.h?


Jonah

> This lets you
>
> * map device ID to string by subscripting virtio_device_name[].
>    Guarding with assert(device_id < G_N_ELEMENTS(virtio_device_name)) may
>    be advisable.
>
> * map string to device ID by searching virtio_device_name[].  May want a
>    function for that,
>
> Now you can have virtio_init() map parameter @device_id to string, and
> drop parameter @name.
>
> Then you have two options:
>
> 1. With QAPI enum VirtioType
>
>     Define it without the special and the dummy members.
>
>     To map from string to QAPI enum, use qapi_enum_parse().
>
>     To map from QAPI enum to string, use VirtioType_str().
>
>     To map from QAPI enum to device ID, map through string.
>
> 2. Without QAPI enum VirtioType
>
>     Simply use uint16_t device_id, just like struct VirtioDevice.
>
> The choice between 1. and 2. depends on whether you actually need
> additional functionality provided by QAPI, such as types being visible
> in query-qmp-schema.
>
> [...]
>

--------------7A2E51CC5713EDE99A155431
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>No problem! Comments below:<br>
    </p>
    <div class="moz-cite-prefix">On 8/23/21 9:27 AM, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87v93wcmva.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">Back from my summer break, please excuse the delay.

Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 8/7/21 8:35 AM, Markus Armbruster wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">QAPI schema review only.

Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a> writes:

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

This new command lists all the instances of VirtIODevice with
their path and virtio type.

Signed-off-by: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>
Reviewed-by: Eric Blake <a class="moz-txt-link-rfc2396E" href="mailto:eblake@redhat.com">&lt;eblake@redhat.com&gt;</a>
Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">[...]

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b97..0c89789 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -91,5 +91,6 @@
  { 'include': 'misc.json' }
  { 'include': 'misc-target.json' }
  { 'include': 'audio.json' }
+{ 'include': 'virtio.json' }
  { 'include': 'acpi.json' }
  { 'include': 'pci.json' }
diff --git a/qapi/virtio.json b/qapi/virtio.json
new file mode 100644
index 0000000..804adbe
--- /dev/null
+++ b/qapi/virtio.json
@@ -0,0 +1,72 @@
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Please insert at the beginning

    # -*- Mode: Python -*-
    # vim: filetype=python
    #
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Will do.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+##
+# = Virtio devices
+##
+
+##
+# @VirtioType:
+#
+# An enumeration of Virtio device types.
+#
+# Since: 6.1
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">6.2 now, here and below.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Okay, will update for entire series.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+##
+{ 'enum': 'VirtioType',
+  'data': [ 'unknown', 'virtio-net', 'virtio-blk', 'virtio-console',
+            'virtio-rng', 'virtio-balloon', 'virtio-iomem', 'virtio-rpmsg',
+            'virtio-scsi', 'virtio-9p', 'virtio-mac80211-wlan',
+            'virtio-serial', 'virtio-caif', 'virtio-memory-balloon',
+            'unknown-14', 'unknown-15', 'virtio-gpu', 'virtio-clock',
+            'virtio-input', 'vhost-vsock', 'virtio-crypto', 'virtio-signal-dist',
+            'virtio-pstore', 'virtio-iommu', 'virtio-mem', 'unknown-25',
+            'vhost-user-fs', 'virtio-pmem', 'unknown-28', 'virtio-mac80211-hwsim' ]
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Please limit line length to approximately 70 characters.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Fixed, sorry about that. Also, should I continue this up to 'virtio-bluetooth'? E.g:

...
'virtio-mac80211-hwsim', 'unknown-30', 'unknown-31',
'unknown-32', 'unknown-33', 'unknown-34', 'unknown-35',
'unknown-36', 'unknown-37', 'unknown-38', 'unknown-39',
'virtio-bluetooth' ]
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hmm...  how is this enum used?  In this patch:

    VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
    {
        VirtioInfoList *list = NULL;
        VirtioInfoList *node;
        VirtIODevice *vdev;

        QTAILQ_FOREACH(vdev, &amp;virtio_list, next) {
            DeviceState *dev = DEVICE(vdev);
            node = g_new0(VirtioInfoList, 1);
            node-&gt;value = g_new(VirtioInfo, 1);
            node-&gt;value-&gt;path = g_strdup(dev-&gt;canonical_path);
---&gt;        node-&gt;value-&gt;type = qapi_enum_parse(&amp;VirtioType_lookup, vdev-&gt;name,
---&gt;                                            VIRTIO_TYPE_UNKNOWN, NULL);
            QAPI_LIST_PREPEND(list, node-&gt;value);
        }

        return list;
    }

This maps VirtioDevice member @name (a string) to an enum value.

As far as I can tell, this member is set in virtio_init() only, to its
argument.  All callers pass string literals.  They also pass a numeric
device_id, and the two seem to match, e.g. &quot;virtio-blk&quot; and
VIRTIO_ID_BLOCK.

Thus, the pairs (numeric device ID, string device ID) already exist in
the code, but not in a way that lets you map between them.  To get that,
you *duplicate* the pairs in QAPI.

Having two copies means we get to keep them consistent.  Can we avoid
that?

The enum has a special member 'unknown' that gets used when @name does
not parse as enum member, i.e. we failed at keeping the copies
consistent.  I'm afraid this sweeps a programming error under the rug.

The enum has a bunch of dummy members like 'unknown-14' to make QAPI
generate numeric enum values match the device IDs.  Error prone.  Can't
see offhand why we need them to match.</pre>
    </blockquote>
    <pre>Sure, I don't mind doing this instead. Just as an FYI, from the previous
RFC series (RFC v5 1/6), David recommended here that I create a list of
all the types and in the same order as include/standard-headers/linux/virtio_ids.h.

The benefit from this was that we never have to convert between the QAPI number
and the header number. 

Let me know if this is still something you'd like me to do!</pre>
    <blockquote type="cite" cite="mid:87v93wcmva.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

What about the following.  Define a map from numeric device ID to
string, like so

    const char *virtio_device_name[] = {
        [VIRTIO_ID_NET] = &quot;virtio-net&quot;,
        [VIRTIO_ID_BLOCK] = &quot;virtio-blk&quot;,
        ...
    }
</pre>
    </blockquote>
    <pre>Sorry if this is obvious, but where should I define this mapping?
virtio.c or virtio.h? 


Jonah
</pre>
    <blockquote type="cite" cite="mid:87v93wcmva.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">
This lets you

* map device ID to string by subscripting virtio_device_name[].
  Guarding with assert(device_id &lt; G_N_ELEMENTS(virtio_device_name)) may
  be advisable.

* map string to device ID by searching virtio_device_name[].  May want a
  function for that,

Now you can have virtio_init() map parameter @device_id to string, and
drop parameter @name.

Then you have two options:

1. With QAPI enum VirtioType

   Define it without the special and the dummy members.

   To map from string to QAPI enum, use qapi_enum_parse().

   To map from QAPI enum to string, use VirtioType_str().

   To map from QAPI enum to device ID, map through string.

2. Without QAPI enum VirtioType

   Simply use uint16_t device_id, just like struct VirtioDevice.

The choice between 1. and 2. depends on whether you actually need
additional functionality provided by QAPI, such as types being visible
in query-qmp-schema.

[...]

</pre>
    </blockquote>
  </body>
</html>

--------------7A2E51CC5713EDE99A155431--

