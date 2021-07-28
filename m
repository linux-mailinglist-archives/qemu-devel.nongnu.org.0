Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F063D91C1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 17:21:55 +0200 (CEST)
Received: from localhost ([::1]:45886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8lNa-00046f-KS
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 11:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m8lLl-00031h-6M
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 11:20:01 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:19978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m8lLj-00025U-H8
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 11:20:00 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16SFB1si010276; Wed, 28 Jul 2021 15:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ITXlmRbEqgF54nWzyGddSRAzKg+ajN+NqJNP5x9UfMI=;
 b=Rlo3a/rI1R36dHLtRy4O/rCjOPl5kd62UmfGS+lZCD8PVbRCUn5Af//XoJ/SmRQPQJag
 1vSt9ugtdd3GcS2dYeqX14UZLbDVLMY5rfxV9I60wlQ0ntC1bWszv36CIAHDQ17qz8oA
 q4zfqXYri8k3tWD4XmcX9KKSxAt3kdukuyyfE25D1R5tXiFTEGsLMFD6J4VrnYd4OBND
 KPMXebOjs2FeQu9SxVIRqFatutujoxkr/fXqluVqwTspTnaT4cf8FxNDoFPY/EqOfs6a
 VEDMlTxTABFn3FHppS24kpH1K2FTQtIehAtZUuOHEQxgJPTmz5E2JAeKVzYqO0twUeYc Gw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=ITXlmRbEqgF54nWzyGddSRAzKg+ajN+NqJNP5x9UfMI=;
 b=Pb+scMdpwptdxy2HiyyPKry2wF9mNC4XXmJtALitaXFbKOkEOIcQnyIwFkqKGWeBDF+A
 tEslAeLQuRTE/RY/g3xtq2Fi6HtsQ7gDSjE8/fV5mH/aythByL5KiE91ZSJebE6OOLf1
 YXPu+xOkK9lA43Xy7CJyY0aa2h8jfzUHzldH841GagkLkT6EkCcNGsaLzJAQAam95DUR
 MIdc8C1ahOtJhgDKsE7xtOTkzMzdOiM6Q7Y2VJXUVd9GdYJWkqjQDQK2BydE46xGHDLo
 L7ehdQ/v6xd9YCWVZZB2HXodY16krmOO//FqFOuLBP3+MeXrrJfBFkTdwY1fkp6cGHzp gA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a234n4ny4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 15:19:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16SFBjLU022260;
 Wed, 28 Jul 2021 15:19:57 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by aserp3030.oracle.com with ESMTP id 3a234cpckt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 15:19:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftEtCt+tVtEKOyVl72IwNzKNBUWYiwWbHqkMbpXlkWhmHPAKVVjTzCxXz5SiMHT+N7Ig3C1DB+Qdoo3QSJ1A4HXoZnpXaBU5z34RXJTOveksaZq88tsPKpp/OC+w2TDr3B4p1/t752YRUNAYuGhpd6/TxznzgxVSSqG0W60MHtjXC17LTjxxrbPOU9qsygCBKADUSIQKTrH/v5UQff0Ia9W1ug+AvGsFu3n5d/YqTUg9+Hg6UpHQTzObcySeR4206EKAfK03PgBxF9c/A0IJAQSl3WeYy21sext0ltzUgY6BHB60GMg2HtZ70P+veItZeAGpPMXzfhz2t/hUkMquCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITXlmRbEqgF54nWzyGddSRAzKg+ajN+NqJNP5x9UfMI=;
 b=Ipu+IMu8MNNAT7/todY3o/ZXmpm6io1Iz4q8R1EgtHA5WfcxiyVbZvCUE/Ti+q6e24ohv+uHEpsuepxaJTnJCG/RFnNHhn4TzrqpK2CG1DyRRhjk1bbegBC4wyFSuB+4N0bj4W6lMsZF/QPfJIdxMcb5JDVVkXrm9XeyzXqcC42NQjSZx1vlnBT9tCQvPmqvss8wk6N6JbopWOYazdBfaoMtVDn4EvHSiLE6/b7J780PdnddnFsh5l+sJLxsBn29xlfW1LtjA9xLjZ0bUzhzR3XnT2OzCmfmwmiSwLP8LOTQ1C3bgOuBrAWipM8qsZ3HTkjd0A7Rze9sszhWB7RMbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITXlmRbEqgF54nWzyGddSRAzKg+ajN+NqJNP5x9UfMI=;
 b=BnR0sAtg4RaGLlzzVFasPtcxFPltQy0WBV4HUkgfpXjIOw02eMrMT0KVo0qJyWon4XLw/4YkVnfXgyER8xIbEOV2Swd+Np2EsEebc1S1U0liZKe9ABEpL1NM+BXYNO8rZnka4ww0bu7Hurr8BQDoZ8/YHCfC5x+RuukN9erYil0=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1453.namprd10.prod.outlook.com (2603:10b6:300:22::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 15:19:55 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::cd0a:e210:15eb:dc5%5]) with mapi id 15.20.4373.020; Wed, 28 Jul 2021
 15:19:55 +0000
Subject: Re: [PATCH v5 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <20210720165751.52805aed@redhat.com> <20210727145518.2691c7c7@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <fa873c6b-feaf-ea86-08f2-f27382632aae@oracle.com>
Date: Wed, 28 Jul 2021 10:19:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210727145518.2691c7c7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0013.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::26) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by BY5PR20CA0013.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend
 Transport; Wed, 28 Jul 2021 15:19:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a84a51f8-fc7f-4193-6d67-08d951db2780
X-MS-TrafficTypeDiagnostic: MWHPR10MB1453:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB145339FB054EAA1F6E86C4D297EA9@MWHPR10MB1453.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DvvfRaVV/Nx/A7LL9ABB1D77vEMf2vA71YAP+/pVpwJIOK5eCNsVidS9Doa0WlQtFc7czfFxCytawy+AouJkUGzXK5RhZk+6rQrdJhUIcBGR6bvkmO36eMV3vG0TrVQQVQZtl+Kc8x0nFupKCAFSYQ8UOvxEfepWgywj3vHJ2zuWdPfZvW3pCGvLzbU8XuYlOho6Z6lSme7ye24KhXTkzbU6f50BMFWRQqZNTbEIz0YYUALAkbpCOlip1CosC5vENFl0cWsu2rQAAP97agHwYhv8AmoKm1VWUlALe8Z+mXmH0lrGmH0Cxw9+kW+FT4L7IJ4rWzNBmoXuGNBeHov9MRPaFdYPd3gqGfS2R47/slsrxhXGHLfAfWs3cFzYZnsNy5A89FoPTgEAtzqjJ3eTHUrWaWB7/XPy2mJYD2rMHDjsnDv8NiN7Ub2BlS7GFClmIlSfcfEGKUZhD5GZOVPfKuQmMQpiFU5Z/0LP8U1749jH9OMUZRa+wdm+PqVbC0YcpHGuUYe8kKF+u2DZfFmIPxGBknSnQH0FYBGiTnFWAnv2TeCov8yQpdR7uptGoSmEl5rkso0pd7SQ5f2hZFnzpPcaDcurFOeQEN3ekFdowjH9keaQgdR/UjhclQ/iDZnUxXWMOyOyMJPg5wRaCEnk5YkCoATDv84UTzyRONgYLgBE8YljYvNSYEJ5afxoky94iIPn/HD+7y/+PskNTkiVVtCQvlv05hOKWLpYAM/vWZU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(346002)(366004)(136003)(376002)(558084003)(31696002)(8676002)(186003)(66946007)(6486002)(83380400001)(2616005)(478600001)(5660300002)(6916009)(2906002)(38100700002)(107886003)(316002)(31686004)(8936002)(86362001)(4326008)(53546011)(36756003)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXZrWGZMeXRrWUZXT3kxQVJlSmg0cjZGNE5UdjNtMndLUFNLYUlnSDZsNHZ3?=
 =?utf-8?B?RWpaNU5WcTJkOTRLeFVyNnFDUTlvTEswTWVSelQwYTN5VE1ZbjEvUzUxWC9l?=
 =?utf-8?B?cml6SXAxVUdpZk53OW5wR241Zkx4MmludDNHYkNSRlN1KzVaYVd3bk1Nb3Bv?=
 =?utf-8?B?eDRIWWt5UTdwcTVlNmsvQVoreGpBa053L1FsdW5PL3dKV2FXM0JNWmVEL3dz?=
 =?utf-8?B?NkcrMTVFQ0lIQlQyQmI1eDBJM1Nud2RLN2JEQzhzM1dqaEZMeFJkdm41L08z?=
 =?utf-8?B?QllaMnVZcCtOcFlWWitkRHVzK1pnZklmSnVSdml2UXJxdzEzd0FqNmY5YlVx?=
 =?utf-8?B?MTRJb044Nll2ZU5xcXVsYnNYeHRaNFN0MTNqNEdIMDZMQVZkd3UzeHFUcGs5?=
 =?utf-8?B?OGRzVXNHbUFmMm1iMnJpcEtNdlZaSDFzM0pyck1ZbzlLTGI5UXN6OER0VFVw?=
 =?utf-8?B?MHIvZ2RMUlErNXRIV2NqS2lnZ2dWV3RYbnBneDcwMW1wUjM1ZmJETVNENWNl?=
 =?utf-8?B?OTVZeEk4dDJYbDUzRmQ2RjFyZC8yaG1rRUtLMEFZb2Y3K0tPME1IMVdHaHVp?=
 =?utf-8?B?aHBaL0poY2MrSHRTVzNaMytGSnFhU2p4NUZ0SUhnNUp2T2FudGtUWnRQR01h?=
 =?utf-8?B?c0k1a2w1alY1VDhoS3B4dGw5NEU2Ulo4K05UNUpvTjZqK2gwWEFyK25Qd0tj?=
 =?utf-8?B?eUQxZVlqeVZKY3pXc0xKVXUycVppeC8rTDQ0RjZuS3pXYTlXd1YveEdKWVF5?=
 =?utf-8?B?a1dJU2RzajJNcFNUNXFuOWlqUkI3MS9hR3pvNXFMMnFKOFdmUytVaVlJVjZj?=
 =?utf-8?B?bCtwVGNqZ0wyVlMvQkhFa2dYemhtanRCWXlENDhGbXNMQmpxQjFnUVUrNVFW?=
 =?utf-8?B?aFhxeTlzTzlWdDlkUm54UFgvWGcvNVBFc01OME1jL2NBMmtnT3NYWTdERUZX?=
 =?utf-8?B?WWdEa1ZEZVdUeEtXaTZWZEkxZzRmc0YreDl3MWJrRklIRUpDMVc0LzhSY1VK?=
 =?utf-8?B?cTdpbmtSQUNsU0hCLzUrS0hVQzR4QkZtUjlFSnU0cjduYk1kNVRFQW9JRWZD?=
 =?utf-8?B?VDNtUlN4Ung1ZmM2VGN0aU1SVUFWRWM0c1FpZ3U4cENoUjdXeGdOcEs5cjlU?=
 =?utf-8?B?cUJWYlE2RmtkdXBTZUxxM0VEbDZOV0drRWJNeHUycWpHczlkSTQ2NFNEaGlz?=
 =?utf-8?B?U3RYSGpRa1BVeWRBc21qREpyN2RpWUYrSGtLTnhEWlFrWE92U0o0ZEQ2a0ZS?=
 =?utf-8?B?b01Zc0hMZzBiTE1PdktaM29VaVI4MDBxMzhGdzl4ZzQ5YTBibVY2dlBGNC93?=
 =?utf-8?B?Rk10MkNBenlLYkhnTGlvc3A1Nm5kZmd3ZnZUd0Znb2h2eW5DZnRhKzQ1M1ZL?=
 =?utf-8?B?ZlZUT1ZPb2dmWnRRK2t5dEFiZWRiOUl4VTl0d1RDRWc4amIwNHQ4b0tpMjhL?=
 =?utf-8?B?Und6aUlCalhWQW5xTndlanR6QjQvZGw0Z3oxeVJxK0Q1MWdxeWozVGxHV1lx?=
 =?utf-8?B?ZGp5bDFqVmZNbm9tbGYvd2xBc1dzR1EzSTFxbUR6UkI0SU5yVVdreEljdnFV?=
 =?utf-8?B?V0hZNVViUEFZbnRvVjdvb2N3a1FoamE1dEpTMHUzcVhCU0ZVV2w3YzN1S1VU?=
 =?utf-8?B?WCtyZm1uTEJmKzhKZWFaYy9kS08yajZSb3gwUStCc2pHWlBTc0NrbGRTMWV2?=
 =?utf-8?B?SXlwMnBNMDZtemNIdWd0MmllRENpVWRnWTVQMVk5d2Jpc3JRelZKTUVZb1V1?=
 =?utf-8?B?OVhYU3ovREgxNFpmQUx1TXJhL3lkZ2Y1Wm1FMVB1UjR2elR0azZtWmEvU3po?=
 =?utf-8?B?czdYWFpIeVZiM0dXOFNWZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a84a51f8-fc7f-4193-6d67-08d951db2780
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 15:19:55.3206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FrQDBWBBQ/wHCJXcy1+dHr9cWeGpSYVpp6JLwOWPrR6eAqFgLVQ9aYirzM84vy8fi1130x1YiYBm8OvuDfFjC/EgFWC03RH3d2c50WI++U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1453
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10059
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280085
X-Proofpoint-ORIG-GUID: 6SjDgwcIS-ik8KdbXJvd3mQbMMumTHve
X-Proofpoint-GUID: 6SjDgwcIS-ik8KdbXJvd3mQbMMumTHve
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/27/21 7:55 AM, Igor Mammedov wrote:
> PS:
> If I haven't said it already, use checkpatch script before posting patches.
> 

I do run checkpatch. On occasion I allow a warning about a line too long. And
there is the MAINTAINERs message due to the new files. Is there something else
that I'm missing?

