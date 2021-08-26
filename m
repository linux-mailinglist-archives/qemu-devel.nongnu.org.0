Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D113F8270
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 08:27:29 +0200 (CEST)
Received: from localhost ([::1]:42372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ8rI-0000ex-NE
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 02:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mJ8ps-0008HH-QG; Thu, 26 Aug 2021 02:26:00 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:52068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mJ8pp-00036W-Ii; Thu, 26 Aug 2021 02:26:00 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17Q5nT4T029926;
 Thu, 26 Aug 2021 06:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=s0CvY1izClE4OED4ed9HWm31r+pdqzIZJEH/F2oogr8=;
 b=xve7KN1tb1FowPNWOSNy7oMX2NNbPDmu5ZQKu7JFefW43jyVqzPiwokvhzbAslghkxdf
 KyjEMOia1metO3K8ruWyTbOmbuC492EbAz+P72bVw6sFruDB3QPcgI4f74yt5q6S7Xo/
 CsJnC5Oi8cr1MPu+IyBT7VcEKEi1PXNoHQgS32VHk0e+VCHktXj/7J/m6y6oxjnabYMU
 n91L7TvaAIRDeYJ/95C0L2+SDA/h/1EjIzsIL6XKKExRh1DEhnwrJpgUgGeNnBz6KAfk
 MUrGPwl8s5vT6auUmxRVzBerqeKJygCy/F0HE1siP8BKsQ9hBq+1iQwBCyWiOpAvmzQD Xw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=s0CvY1izClE4OED4ed9HWm31r+pdqzIZJEH/F2oogr8=;
 b=e0/PygtC3bcqo3q7X1srv6NAp/AbkejAcE6C56GbpA5zGcQeN8rCuwHusPF+j/Rl0MLy
 EyjcOTFAey3ISR+HOVQyKaLNjjLEbPZdE3NLYuof6zHeGfCJBT7PUNZh34rRuXQNKsoR
 gEZdKdt7sqZI7eeHXtUAVonX0m8WRFtJLG4Gs4sKvaoCQteLdVvjgQs8n2d9ux55wUkC
 V/cVOAMqHtunMPAlgX8x7dzmfeOKixinkJ0YL0+kHldYqgTUlyLNoc3WgavbwIWzd5wk
 F3cHIsSytQoULQpUfycrB/YGwNv518JhCkfhsPndo2hABNCyK7CKTJB37O0vMwTyZVnU YA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ap552834h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Aug 2021 06:25:43 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17Q6PXw5136796;
 Thu, 26 Aug 2021 06:25:42 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by userp3020.oracle.com with ESMTP id 3akb8ydd0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Aug 2021 06:25:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6ycdlmPsizCVNZ/EaVVibZiuYdLIqHS9aukvNPtnhLAfuAaHLZuW+J9FSwzvb3QjtQTxX0mThT4YswiESFQhZfWqgO/fjpN2Jz+UE11RnDzj2BUbhwdAFx6P+fjXzJhJksCpC0bka1AEGNncoTiTLkR11Xm4c1rFv8HzwcNnE351bCkx3ySH/afWM51LQ1MPmBbKyKCUyn7axjl8WWCdbH6/xCls+ixUFmx1dXr5kLcFY932l0YFYyk0tCZneseQHCjRV9kk708C1Enf9D+1TXdNlqSI5ZC6etPXL4y2uTuhEHi7Et8Ewik5cs1vmDZzKyYHLH5dIE4bkwS07yiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0CvY1izClE4OED4ed9HWm31r+pdqzIZJEH/F2oogr8=;
 b=UeaiwH4kf09sqwMpuZtmrHH+V1Q4QVeCqExBj17aF2BmM/LaQi/sEj+MsKCx47EqRZCM1Ni84LBavvEc3ZdLNakF2c2PjWKRVd17HZv1raMHZi0Ks1Mv8id79Cql7i65w5jEGPspEGgfuEApjqpM2qovHMZGp/gAjDeltKxPsb0CbjWAJsIMUMGnBG7SQQH9fqzVIJHU/joe+X7Vyls95NcXhZ3IPcWGW2lLAeItHsI/ScdDE3e/ej3p5NLtI8GOejwafV71jsjbJiyf8jHS2JJSkxyWnTgadXPZ24kcV1OL1yTmtN/xcQAO9abNg9BbwGLGArYgpBqF8u3uK/qawA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0CvY1izClE4OED4ed9HWm31r+pdqzIZJEH/F2oogr8=;
 b=qTADu5gC+h+VD1GG76MLzwqI5rR4Oj2y/mSRyTUMbk/3V8hdhusoKIrUPz9FFlvMqgJxcK27apkyrwKrldWXsYoymIOFSRwcOAAtpYuP97UdgnTyk7/+1g+an0ca6VyoLOrtAnQU1/IcIde3EURAtO8MNyZGXAWnQLPMbFYhGBU=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB5404.namprd10.prod.outlook.com (2603:10b6:510:eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Thu, 26 Aug
 2021 06:25:39 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%7]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 06:25:38 +0000
Subject: Re: [PATCH v6 4/6] qmp: add QMP command x-debug-virtio-queue-status
From: Jonah Palmer <jonah.palmer@oracle.com>
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-5-git-send-email-jonah.palmer@oracle.com>
 <b0c11f6c-31dd-121d-ab27-e83e5afa8596@redhat.com>
 <82c4ad5d-c866-9b25-42b0-d1c3a731ed3a@oracle.com>
 <11a89103-dd0c-26ca-37e1-7e1b0aeac1f3@redhat.com>
 <4e1c3a57-8360-2618-8c74-62e26c1c7aee@oracle.com>
Message-ID: <d6234a95-4035-8e7a-2def-fd891ee15409@oracle.com>
Date: Thu, 26 Aug 2021 02:25:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <4e1c3a57-8360-2618-8c74-62e26c1c7aee@oracle.com>
Content-Type: multipart/alternative;
 boundary="------------69D375018D8EE0862991CFA1"
Content-Language: en-US
X-ClientProxiedBy: SA0PR11CA0207.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::32) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (209.17.40.36) by
 SA0PR11CA0207.namprd11.prod.outlook.com (2603:10b6:806:1bc::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 26 Aug 2021 06:25:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd2243cf-f92b-4014-fc24-08d9685a5233
X-MS-TrafficTypeDiagnostic: PH0PR10MB5404:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB540465886FD8CF19BEB2194EE8C79@PH0PR10MB5404.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hKcCPKiD+jtnZWgv+Sth3l4LgY5qkHfpC1XMQh+vMhgOZbl2GesUbHwOvwlrH2OXXLtq5VvJ49ipo9v0DhzzGP10gykgdaz0ypYwzwOwCo026iM+Xz1KA1FOKtIK91dCEJU6wXWu2QrNEfUx8ivtYEFAa+sb/0lfvlLQmKgBm+BjyFY3ZO2fzuq9v3ZygfPKBSJaBtYwYe1++WNusp3J7GSPqSozA35lEOHMuHKa41f5vS9ZTr690LwKWOcDDpkOmSS+NzBkm4goU/QWwhZMKDqg5G7NvWq99VLC1z6Wo8hYHjhmo1FX3UC618mVDSwmh9brx/44qRAx85mHedL0HOJDwj/v1QDsTZOzFrgbdpBpy2oyhFoGnYFjgEn4OSsI2sh2CG+QuDPyNVtaMMWlZqyuyvJCd0Si0uvxlKoR+vF7yd1X/lbpDYb4lAoqBTlO2c3iuWDVYLqhdYTGTlXtl8Nzmh64ELs2WxLr2XMd4U1Xo0I40c54URvCLwT6n+4MQKsPYJXC/P2UP0DbU/b1GzxGppsrPqVE+jx/GTIVvNgQkde/QI3Fja5d6+EXGk/rJ7h3N2r6R1g1XWGilYVtC+8stG7YPxXdaBNs56b2ZWU8MzFJnV99cqqmxj/WSjHWF/PwyDdunElnRBhD7xMgs0qaSBXnYC6AkeOBXye8JJdMbKCdusNVdf5RDtyQEMsaVvIIjMWaUKSGLhXFMx3gQnyFu7I2c6dUkvhEJdYe8rA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(136003)(39860400002)(376002)(346002)(36756003)(8936002)(2616005)(5660300002)(53546011)(31696002)(6486002)(8676002)(4326008)(33964004)(86362001)(7416002)(107886003)(38100700002)(31686004)(66476007)(44832011)(7696005)(26005)(66556008)(478600001)(186003)(956004)(2906002)(66946007)(30864003)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmtscDJINzNqaE45bTJReFRJWlNXbXg1VG1sblJHd3R5dmUrSmRKQ2xPVnU4?=
 =?utf-8?B?bTBmS3laMkNXMDh5RUVYRkg5eXczM2hWbXVKUjh0eDl5SnFkYjJoUVVVS3R0?=
 =?utf-8?B?RTFDNFkyNkt3SlBkc2dHclZzUHlISHFlZ2xSL0ZyL1B0T0EzamtqZDFvRmZ0?=
 =?utf-8?B?dWFsRGtLY1k4bUMzVHV5czhpMmZ4V0k5NjZHMFphQ3h0NzJqNC9sWVdIREpF?=
 =?utf-8?B?ZnJwUnExZVNtU3VYOC9QWHFrR0tNbE01RFBPaVFWZE9rbzdjSjZaN3FSMWR1?=
 =?utf-8?B?a2xZRGh6Y3ZLYnFqNG50bHByb0xtS3lrNUM1M3pJTDZoNHNySjhuNm5MUCtX?=
 =?utf-8?B?OHJYVDFHT21ZMGFvN0traUVnTmUyOVRwbEtQS2hLbVJ1KytsTHNPSiswMEph?=
 =?utf-8?B?K0x4azZuMks2UnR5WXpzZXcvNmw1T3dKQVJtbW50Z0VGbExKTDk5U2RQN2NQ?=
 =?utf-8?B?bVpZT1EwWDNHSHVCTVhhSFVpOFdEOUExS3RoalZ4TVVsdUxvWTE3U2xhdGVj?=
 =?utf-8?B?TmR6OHZzSStMQVdsS2pSQU4zWm5FWjdQc0dyWjhRR0pVTXJSTUd5WWsxVjhN?=
 =?utf-8?B?T0RPU3VZU0dXbVdMOFF6czJuK2xubS92UTZ0NG1sTWoxMXNHU0h1bzlyaTEw?=
 =?utf-8?B?azc5K3pMcFNiMjZxSUxQdTF2citQYjhFS1JkWnd0aUZGNWFuUXVjZmxaMmUv?=
 =?utf-8?B?U1BZYzFJV1V1V283VTdNOUlicWRmL0dWejE0WXZ2aEoweW5KbHZWUERrZmlq?=
 =?utf-8?B?bjZSUnZkV3ZSVjZGZTl0RlNMak43d1U5QitYaGNJanAxSCt1YnRBM0RKd3dG?=
 =?utf-8?B?TWhKa2JJNFFhT1RscEVZQkswaFo0MTRLYmR3V0dNaitxN0hlZ0VrcXlUeXdX?=
 =?utf-8?B?amw2YmhVVDN2ZUY0Z0x2UUp5NlJuTndtd0tHRnp6T0tzWFFYSTNtSjUyemRt?=
 =?utf-8?B?SG9ENG1MN1VCVmROQzBVbU1SeTUrdFFxSUMraVVwZmNFM3ZEbGNTanJtSVRa?=
 =?utf-8?B?V0puWmxQQWNVVVZGcmRsM1JYaVlDelBhYmhQWHVkRTBNVWFvcEpsajJuQi9I?=
 =?utf-8?B?UkFMZXdBTVdScjBxdW9MS2RubEFDNEw1cm9PdGxVLzFFVCtNdUNGZkR2VnNs?=
 =?utf-8?B?eWhBT20zNHExSjVKeTBobnpiLzIwQ0lGRXFob01MQmNTRm1WcU8wQXF2R2ky?=
 =?utf-8?B?cCtNWU9Yak52cGROWXE5SnBzVXVQOHlodlNlc1VtRlFnbGpkMmFGS2FuRVdU?=
 =?utf-8?B?ZkpZS0JCV29uUlorOEFCYXc0VXhRTkFMS0FWNEZzNVlzTmhDVHg4TkN0YVV5?=
 =?utf-8?B?aTE5SStadlVVMUlSSXZFVHU0NFQvaERGUlo4L2VCUnRGckhESW5UeC84a2Vl?=
 =?utf-8?B?dEpuMWtmMVcvTEVZN1V6NVpuMlo1SGZ6UEtueTVocGpJL2hQZW5jOGpmRGtP?=
 =?utf-8?B?ZFlzQWVadmlnN1ZTdWt0QVQxMlBra2Nwc2ZJeC9EVlFLdUFONDFIdzlmQ1JD?=
 =?utf-8?B?WFFzVUFNNDFjTGlkRndzR2psRytzWDFsNHcwVzdyOU5ndTNBM1hWYmM5VWgz?=
 =?utf-8?B?T0NyYTRNLzVZUHBxNFZINlVCK2wzRTNZWkxCTnQra3pzeVVrSVNWNUJEWWRt?=
 =?utf-8?B?TlJYMHl4OGhlbXFCV1hNNVJrV1MxeXlTRWZXN2tWa0sxWkpUN1paQXRHVWRx?=
 =?utf-8?B?eDNhWXBwQ1M0ZHhkTkNFc1FzdHhsUUcxaUtnQnRtUzRWM3VIaEVGelJpc2NK?=
 =?utf-8?Q?lLfAKS57qAiAIB+70devvdPaJLYEVVaRVt3khq7?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2243cf-f92b-4014-fc24-08d9685a5233
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 06:25:38.7937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbJdZYINt1dhL3A39oquDqH96Q16x+yZLK/3d3Keb0EJCytml5w4LHNNm+d2cAawvLIbftz4yUZrLRosQ88Jrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5404
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10087
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108260038
X-Proofpoint-GUID: L7a5o3QKiqlHDmI6l756oEtHrktuDb7a
X-Proofpoint-ORIG-GUID: L7a5o3QKiqlHDmI6l756oEtHrktuDb7a
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
Cc: fam@euphon.net, kwolf@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, michael.roth@amd.com, david@redhat.com, armbru@redhat.com,
 amit@kernel.org, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, si-wei.liu@oracle.com, marcandre.lureau@redhat.com,
 joao.m.martins@oracle.com, mreitz@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------69D375018D8EE0862991CFA1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jason, could I get your thoughts on this implementation question below?

I'm not too sure on how I should proceed determining if vhost is active 
or not.

Thank you!


Jonah

On 7/26/21 5:33 AM, Jonah Palmer wrote:
>
>
> On 7/22/21 5:22 AM, Jason Wang wrote:
>>
>> 在 2021/7/21 下午4:59, Jonah Palmer 写道:
>>>
>>>
>>> On 7/13/21 10:37 PM, Jason Wang wrote:
>>>>
>>>> 在 2021/7/12 下午6:35, Jonah Palmer 写道:
>>>>> From: Laurent Vivier <lvivier@redhat.com>
>>>>>
>>>>> This new command shows internal status of a VirtQueue.
>>>>> (vrings and indexes).
>>>>>
>>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
>>>>> ---
>>>>>   hw/virtio/virtio-stub.c |   6 +++
>>>>>   hw/virtio/virtio.c      |  37 ++++++++++++++++++
>>>>>   qapi/virtio.json        | 102 
>>>>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>   3 files changed, 145 insertions(+)
>>>>>
>>>>>   [Jonah: Added 'device-type' field to VirtQueueStatus and
>>>>>   qmp command x-debug-virtio-queue-status.]
>>>>>
>>>>> diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
>>>>> index ddb592f..3c1bf17 100644
>>>>> --- a/hw/virtio/virtio-stub.c
>>>>> +++ b/hw/virtio/virtio-stub.c
>>>>> @@ -17,3 +17,9 @@ VirtioStatus *qmp_x_debug_virtio_status(const 
>>>>> char* path, Error **errp)
>>>>>   {
>>>>>       return qmp_virtio_unsupported(errp);
>>>>>   }
>>>>> +
>>>>> +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
>>>>> +                                                 uint16_t queue, 
>>>>> Error **errp)
>>>>> +{
>>>>> +    return qmp_virtio_unsupported(errp);
>>>>> +}
>>>>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>>>>> index 81a0ee8..ccd4371 100644
>>>>> --- a/hw/virtio/virtio.c
>>>>> +++ b/hw/virtio/virtio.c
>>>>> @@ -3935,6 +3935,43 @@ static VirtIODevice 
>>>>> *virtio_device_find(const char *path)
>>>>>       return NULL;
>>>>>   }
>>>>>   +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
>>>>> +                                                 uint16_t queue, 
>>>>> Error **errp)
>>>>> +{
>>>>> +    VirtIODevice *vdev;
>>>>> +    VirtQueueStatus *status;
>>>>> +
>>>>> +    vdev = virtio_device_find(path);
>>>>> +    if (vdev == NULL) {
>>>>> +        error_setg(errp, "Path %s is not a VirtIO device", path);
>>>>> +        return NULL;
>>>>> +    }
>>>>> +
>>>>> +    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, 
>>>>> queue)) {
>>>>> +        error_setg(errp, "Invalid virtqueue number %d", queue);
>>>>> +        return NULL;
>>>>> +    }
>>>>> +
>>>>> +    status = g_new0(VirtQueueStatus, 1);
>>>>> +    status->device_type = qapi_enum_parse(&VirtioType_lookup, 
>>>>> vdev->name,
>>>>> + VIRTIO_TYPE_UNKNOWN, NULL);
>>>>> +    status->queue_index = vdev->vq[queue].queue_index;
>>>>> +    status->inuse = vdev->vq[queue].inuse;
>>>>> +    status->vring_num = vdev->vq[queue].vring.num;
>>>>> +    status->vring_num_default = vdev->vq[queue].vring.num_default;
>>>>> +    status->vring_align = vdev->vq[queue].vring.align;
>>>>> +    status->vring_desc = vdev->vq[queue].vring.desc;
>>>>> +    status->vring_avail = vdev->vq[queue].vring.avail;
>>>>> +    status->vring_used = vdev->vq[queue].vring.used;
>>>>> +    status->last_avail_idx = vdev->vq[queue].last_avail_idx;
>>>>
>>>>
>>>> As mentioned in previous versions. We need add vhost support 
>>>> otherwise the value here is wrong.
>>> Got it. I'll add a case to determine if vhost is active for a given 
>>> device.
>>> So, in the case that vhost is active, should I just not print out 
>>> the value or would I substitute it with
>>> another value (whatever that might be)?
>>
>>
>> You can query the vhost for those index.
>>
>> (vhost_get_vring_base())
>>
>>
>>>   Same question for shadow_avail_idx below as well.
>>
>>
>> It's an implementation specific. I think we can simply not show it if 
>> vhost is enabled.
>>
>> Thanks
>
> Ah I see, thank you!
>
> So, it appears to me that it's not very easy to get the struct 
> vhost_dev pointer from struct VirtIODevice to indicate whether or not 
> vhost is active, e.g. there's no virtio class-independent way to get 
> struct vhost_dev.
>
> I was thinking of adding an op/callback function to struct 
> VirtioDeviceClass, e.g. bool has_vhost(VirtIODevice *vdev), and 
> implement it for each virtio class (net, scsi, blk, etc.).
>
> For example, for virtio-net, maybe it'd be something like:
>
> bool has_vhost(VirtIODevice *vdev) {
>    VirtIONet *n = VIRTIO_NET(vdev);
>    NetClientState *nc = qemu_get_queue(n->nic);
>    return nc->peer ? get_vhost_net(nc->peer) : false;
> }
>
> Also, for getting the last_avail_idx, I was also thinking of adding 
> another op/callback to struct VirtioDeviceClass, e.g. unsigned int 
> get_last_avail_idx(VirtIODevice *vdev, unsigned int vq_idx) that finds 
> if vhost is active or not and either gets last_avail_idx from virtio 
> directly or through vhost (e.g. 
> vhost_dev->vhost_ops->vhost_get_vring_base()).
>
> I wanted to run this by you and get your opinion on this before I 
> started implementing it in code. Let me know what you think about this.
>
>
> Jonah
>
>>
>>
>>>
>>> Jonah
>>>>
>>>>
>>>>> +    status->shadow_avail_idx = vdev->vq[queue].shadow_avail_idx;
>>>>
>>>>
>>>> The shadow index is something that is implementation specific e.g 
>>>> in the case of vhost it's kind of meaningless.
>>>>
>>>> Thanks
>>>>
>>>>
>>>>> +    status->used_idx = vdev->vq[queue].used_idx;
>>>>> +    status->signalled_used = vdev->vq[queue].signalled_used;
>>>>> +    status->signalled_used_valid = 
>>>>> vdev->vq[queue].signalled_used_valid;
>>>>> +
>>>>> +    return status;
>>>>> +}
>>>>> +
>>>>>   #define CONVERT_FEATURES(type, map)                \
>>>>>       ({                                           \
>>>>>           type *list = NULL;                         \
>>>>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>>>>> index 78873cd..7007e0c 100644
>>>>> --- a/qapi/virtio.json
>>>>> +++ b/qapi/virtio.json
>>>>> @@ -406,3 +406,105 @@
>>>>>     'data': { 'path': 'str' },
>>>>>     'returns': 'VirtioStatus'
>>>>>   }
>>>>> +
>>>>> +##
>>>>> +# @VirtQueueStatus:
>>>>> +#
>>>>> +# Status of a VirtQueue
>>>>> +#
>>>>> +# @device-type: VirtIO device type
>>>>> +#
>>>>> +# @queue-index: VirtQueue queue_index
>>>>> +#
>>>>> +# @inuse: VirtQueue inuse
>>>>> +#
>>>>> +# @vring-num: VirtQueue vring.num
>>>>> +#
>>>>> +# @vring-num-default: VirtQueue vring.num_default
>>>>> +#
>>>>> +# @vring-align: VirtQueue vring.align
>>>>> +#
>>>>> +# @vring-desc: VirtQueue vring.desc
>>>>> +#
>>>>> +# @vring-avail: VirtQueue vring.avail
>>>>> +#
>>>>> +# @vring-used: VirtQueue vring.used
>>>>> +#
>>>>> +# @last-avail-idx: VirtQueue last_avail_idx
>>>>> +#
>>>>> +# @shadow-avail-idx: VirtQueue shadow_avail_idx
>>>>> +#
>>>>> +# @used-idx: VirtQueue used_idx
>>>>> +#
>>>>> +# @signalled-used: VirtQueue signalled_used
>>>>> +#
>>>>> +# @signalled-used-valid: VirtQueue signalled_used_valid
>>>>> +#
>>>>> +# Since: 6.1
>>>>> +#
>>>>> +##
>>>>> +
>>>>> +{ 'struct': 'VirtQueueStatus',
>>>>> +  'data': {
>>>>> +    'device-type': 'VirtioType',
>>>>> +    'queue-index': 'uint16',
>>>>> +    'inuse': 'uint32',
>>>>> +    'vring-num': 'int',
>>>>> +    'vring-num-default': 'int',
>>>>> +    'vring-align': 'int',
>>>>> +    'vring-desc': 'uint64',
>>>>> +    'vring-avail': 'uint64',
>>>>> +    'vring-used': 'uint64',
>>>>> +    'last-avail-idx': 'uint16',
>>>>> +    'shadow-avail-idx': 'uint16',
>>>>> +    'used-idx': 'uint16',
>>>>> +    'signalled-used': 'uint16',
>>>>> +    'signalled-used-valid': 'uint16'
>>>>> +  }
>>>>> +}
>>>>> +
>>>>> +##
>>>>> +# @x-debug-virtio-queue-status:
>>>>> +#
>>>>> +# Return the status of a given VirtQueue
>>>>> +#
>>>>> +# @path: QOBject path of the VirtIODevice
>>>>> +#
>>>>> +# @queue: queue number to examine
>>>>> +#
>>>>> +# Returns: Status of the VirtQueue
>>>>> +#
>>>>> +# Since: 6.1
>>>>> +#
>>>>> +# Example:
>>>>> +#
>>>>> +# -> { "execute": "x-debug-virtio-queue-status",
>>>>> +#      "arguments": {
>>>>> +#          "path": 
>>>>> "/machine/peripheral-anon/device[3]/virtio-backend",
>>>>> +#          "queue": 0
>>>>> +#      }
>>>>> +#   }
>>>>> +# <- { "return": {
>>>>> +#      "signalled-used": 373,
>>>>> +#      "inuse": 0,
>>>>> +#      "vring-align": 4096,
>>>>> +#      "vring-desc": 864411648,
>>>>> +#      "signalled-used-valid": 0,
>>>>> +#      "vring-num-default": 256,
>>>>> +#      "vring-avail": 864415744,
>>>>> +#      "queue-index": 0,
>>>>> +#      "last-avail-idx": 373,
>>>>> +#      "vring-used": 864416320,
>>>>> +#      "used-idx": 373,
>>>>> +#      "device-type": "virtio-net",
>>>>> +#      "shadow-avail-idx": 619,
>>>>> +#      "vring-num": 256
>>>>> +#      }
>>>>> +#    }
>>>>> +#
>>>>> +##
>>>>> +
>>>>> +{ 'command': 'x-debug-virtio-queue-status',
>>>>> +  'data': { 'path': 'str', 'queue': 'uint16' },
>>>>> +  'returns': 'VirtQueueStatus'
>>>>> +}
>>>>
>>

--------------69D375018D8EE0862991CFA1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jason, could I get your thoughts on this implementation
      question below?</p>
    <p>I'm not too sure on how I should proceed determining if vhost is
      active or not.</p>
    <p>Thank you!</p>
    <p><br>
    </p>
    <p>Jonah<br>
    </p>
    <div class="moz-cite-prefix">On 7/26/21 5:33 AM, Jonah Palmer wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:4e1c3a57-8360-2618-8c74-62e26c1c7aee@oracle.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 7/22/21 5:22 AM, Jason Wang wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:11a89103-dd0c-26ca-37e1-7e1b0aeac1f3@redhat.com"> <br>
        在 2021/7/21 下午4:59, Jonah Palmer 写道: <br>
        <blockquote type="cite"> <br>
          <br>
          On 7/13/21 10:37 PM, Jason Wang wrote: <br>
          <blockquote type="cite"> <br>
            在 2021/7/12 下午6:35, Jonah Palmer 写道: <br>
            <blockquote type="cite">From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com" moz-do-not-send="true">&lt;lvivier@redhat.com&gt;</a>
              <br>
              <br>
              This new command shows internal status of a VirtQueue. <br>
              (vrings and indexes). <br>
              <br>
              Signed-off-by: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com" moz-do-not-send="true">&lt;lvivier@redhat.com&gt;</a>
              <br>
              Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com" moz-do-not-send="true">&lt;jonah.palmer@oracle.com&gt;</a>
              <br>
              --- <br>
              &nbsp; hw/virtio/virtio-stub.c |&nbsp;&nbsp; 6 +++ <br>
              &nbsp; hw/virtio/virtio.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 37 ++++++++++++++++++ <br>
              &nbsp; qapi/virtio.json&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 102
              ++++++++++++++++++++++++++++++++++++++++++++++++ <br>
              &nbsp; 3 files changed, 145 insertions(+) <br>
              <br>
              &nbsp; [Jonah: Added 'device-type' field to VirtQueueStatus and
              <br>
              &nbsp; qmp command x-debug-virtio-queue-status.] <br>
              <br>
              diff --git a/hw/virtio/virtio-stub.c
              b/hw/virtio/virtio-stub.c <br>
              index ddb592f..3c1bf17 100644 <br>
              --- a/hw/virtio/virtio-stub.c <br>
              +++ b/hw/virtio/virtio-stub.c <br>
              @@ -17,3 +17,9 @@ VirtioStatus
              *qmp_x_debug_virtio_status(const char* path, Error **errp)
              <br>
              &nbsp; { <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return qmp_virtio_unsupported(errp); <br>
              &nbsp; } <br>
              + <br>
              +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const
              char *path, <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint16_t
              queue, Error **errp) <br>
              +{ <br>
              +&nbsp;&nbsp;&nbsp; return qmp_virtio_unsupported(errp); <br>
              +} <br>
              diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c <br>
              index 81a0ee8..ccd4371 100644 <br>
              --- a/hw/virtio/virtio.c <br>
              +++ b/hw/virtio/virtio.c <br>
              @@ -3935,6 +3935,43 @@ static VirtIODevice
              *virtio_device_find(const char *path) <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL; <br>
              &nbsp; } <br>
              &nbsp; +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const
              char *path, <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint16_t
              queue, Error **errp) <br>
              +{ <br>
              +&nbsp;&nbsp;&nbsp; VirtIODevice *vdev; <br>
              +&nbsp;&nbsp;&nbsp; VirtQueueStatus *status; <br>
              + <br>
              +&nbsp;&nbsp;&nbsp; vdev = virtio_device_find(path); <br>
              +&nbsp;&nbsp;&nbsp; if (vdev == NULL) { <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_setg(errp, &quot;Path %s is not a VirtIO
              device&quot;, path); <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL; <br>
              +&nbsp;&nbsp;&nbsp; } <br>
              + <br>
              +&nbsp;&nbsp;&nbsp; if (queue &gt;= VIRTIO_QUEUE_MAX ||
              !virtio_queue_get_num(vdev, queue)) { <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_setg(errp, &quot;Invalid virtqueue number %d&quot;,
              queue); <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL; <br>
              +&nbsp;&nbsp;&nbsp; } <br>
              + <br>
              +&nbsp;&nbsp;&nbsp; status = g_new0(VirtQueueStatus, 1); <br>
              +&nbsp;&nbsp;&nbsp; status-&gt;device_type =
              qapi_enum_parse(&amp;VirtioType_lookup, vdev-&gt;name, <br>
              + VIRTIO_TYPE_UNKNOWN, NULL); <br>
              +&nbsp;&nbsp;&nbsp; status-&gt;queue_index =
              vdev-&gt;vq[queue].queue_index; <br>
              +&nbsp;&nbsp;&nbsp; status-&gt;inuse = vdev-&gt;vq[queue].inuse; <br>
              +&nbsp;&nbsp;&nbsp; status-&gt;vring_num = vdev-&gt;vq[queue].vring.num;
              <br>
              +&nbsp;&nbsp;&nbsp; status-&gt;vring_num_default =
              vdev-&gt;vq[queue].vring.num_default; <br>
              +&nbsp;&nbsp;&nbsp; status-&gt;vring_align =
              vdev-&gt;vq[queue].vring.align; <br>
              +&nbsp;&nbsp;&nbsp; status-&gt;vring_desc =
              vdev-&gt;vq[queue].vring.desc; <br>
              +&nbsp;&nbsp;&nbsp; status-&gt;vring_avail =
              vdev-&gt;vq[queue].vring.avail; <br>
              +&nbsp;&nbsp;&nbsp; status-&gt;vring_used =
              vdev-&gt;vq[queue].vring.used; <br>
              +&nbsp;&nbsp;&nbsp; status-&gt;last_avail_idx =
              vdev-&gt;vq[queue].last_avail_idx; <br>
            </blockquote>
            <br>
            <br>
            As mentioned in previous versions. We need add vhost support
            otherwise the value here is wrong. <br>
          </blockquote>
          Got it. I'll add a case to determine if vhost is active for a
          given device. <br>
          So, in the case that vhost is active, should I just not print
          out the value or would I substitute it with <br>
          another value (whatever that might be)? <br>
        </blockquote>
        <br>
        <br>
        You can query the vhost for those index. <br>
        <br>
        (vhost_get_vring_base()) <br>
        <br>
        <br>
        <blockquote type="cite">&nbsp; Same question for shadow_avail_idx
          below as well. <br>
        </blockquote>
        <br>
        <br>
        It's an implementation specific. I think we can simply not show
        it if vhost is enabled. <br>
        <br>
        Thanks <br>
      </blockquote>
      <p>Ah I see, thank you!</p>
      <p>So, it appears to me that it's not very easy to get the struct
        vhost_dev pointer from struct VirtIODevice to indicate whether
        or not vhost is active, e.g. there's no virtio class-independent
        way to get struct vhost_dev. <br>
      </p>
      <p>I was thinking of adding an op/callback function to struct
        VirtioDeviceClass, e.g. bool has_vhost(VirtIODevice *vdev), and
        implement it for each virtio class (net, scsi, blk, etc.).</p>
      <p>For example, for virtio-net, maybe it'd be something like:</p>
      <pre>bool has_vhost(VirtIODevice *vdev) {
  VirtIONet *n = VIRTIO_NET(vdev);
  NetClientState *nc = qemu_get_queue(n-&gt;nic);
  return nc-&gt;peer ? get_vhost_net(nc-&gt;peer) : false;
}</pre>
      <p>Also, for getting the last_avail_idx, I was also thinking of
        adding another op/callback to struct VirtioDeviceClass, e.g.
        unsigned int get_last_avail_idx(VirtIODevice *vdev, unsigned int
        vq_idx) that finds if vhost is active or not and either gets
        last_avail_idx from virtio directly or through vhost (e.g.
        vhost_dev-&gt;vhost_ops-&gt;vhost_get_vring_base()).</p>
      <p>I wanted to run this by you and get your opinion on this before
        I started implementing it in code. Let me know what you think
        about this.</p>
      <p><br>
      </p>
      <p>Jonah<br>
      </p>
      <blockquote type="cite" cite="mid:11a89103-dd0c-26ca-37e1-7e1b0aeac1f3@redhat.com"> <br>
        <br>
        <blockquote type="cite"> <br>
          Jonah <br>
          <blockquote type="cite"> <br>
            <br>
            <blockquote type="cite">+&nbsp;&nbsp;&nbsp; status-&gt;shadow_avail_idx =
              vdev-&gt;vq[queue].shadow_avail_idx; <br>
            </blockquote>
            <br>
            <br>
            The shadow index is something that is implementation
            specific e.g in the case of vhost it's kind of meaningless.
            <br>
            <br>
            Thanks <br>
            <br>
            <br>
            <blockquote type="cite">+&nbsp;&nbsp;&nbsp; status-&gt;used_idx =
              vdev-&gt;vq[queue].used_idx; <br>
              +&nbsp;&nbsp;&nbsp; status-&gt;signalled_used =
              vdev-&gt;vq[queue].signalled_used; <br>
              +&nbsp;&nbsp;&nbsp; status-&gt;signalled_used_valid =
              vdev-&gt;vq[queue].signalled_used_valid; <br>
              + <br>
              +&nbsp;&nbsp;&nbsp; return status; <br>
              +} <br>
              + <br>
              &nbsp; #define CONVERT_FEATURES(type, map)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \ <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ({&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \ <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; type *list = NULL;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \ <br>
              diff --git a/qapi/virtio.json b/qapi/virtio.json <br>
              index 78873cd..7007e0c 100644 <br>
              --- a/qapi/virtio.json <br>
              +++ b/qapi/virtio.json <br>
              @@ -406,3 +406,105 @@ <br>
              &nbsp;&nbsp;&nbsp; 'data': { 'path': 'str' }, <br>
              &nbsp;&nbsp;&nbsp; 'returns': 'VirtioStatus' <br>
              &nbsp; } <br>
              + <br>
              +## <br>
              +# @VirtQueueStatus: <br>
              +# <br>
              +# Status of a VirtQueue <br>
              +# <br>
              +# @device-type: VirtIO device type <br>
              +# <br>
              +# @queue-index: VirtQueue queue_index <br>
              +# <br>
              +# @inuse: VirtQueue inuse <br>
              +# <br>
              +# @vring-num: VirtQueue vring.num <br>
              +# <br>
              +# @vring-num-default: VirtQueue vring.num_default <br>
              +# <br>
              +# @vring-align: VirtQueue vring.align <br>
              +# <br>
              +# @vring-desc: VirtQueue vring.desc <br>
              +# <br>
              +# @vring-avail: VirtQueue vring.avail <br>
              +# <br>
              +# @vring-used: VirtQueue vring.used <br>
              +# <br>
              +# @last-avail-idx: VirtQueue last_avail_idx <br>
              +# <br>
              +# @shadow-avail-idx: VirtQueue shadow_avail_idx <br>
              +# <br>
              +# @used-idx: VirtQueue used_idx <br>
              +# <br>
              +# @signalled-used: VirtQueue signalled_used <br>
              +# <br>
              +# @signalled-used-valid: VirtQueue signalled_used_valid <br>
              +# <br>
              +# Since: 6.1 <br>
              +# <br>
              +## <br>
              + <br>
              +{ 'struct': 'VirtQueueStatus', <br>
              +&nbsp; 'data': { <br>
              +&nbsp;&nbsp;&nbsp; 'device-type': 'VirtioType', <br>
              +&nbsp;&nbsp;&nbsp; 'queue-index': 'uint16', <br>
              +&nbsp;&nbsp;&nbsp; 'inuse': 'uint32', <br>
              +&nbsp;&nbsp;&nbsp; 'vring-num': 'int', <br>
              +&nbsp;&nbsp;&nbsp; 'vring-num-default': 'int', <br>
              +&nbsp;&nbsp;&nbsp; 'vring-align': 'int', <br>
              +&nbsp;&nbsp;&nbsp; 'vring-desc': 'uint64', <br>
              +&nbsp;&nbsp;&nbsp; 'vring-avail': 'uint64', <br>
              +&nbsp;&nbsp;&nbsp; 'vring-used': 'uint64', <br>
              +&nbsp;&nbsp;&nbsp; 'last-avail-idx': 'uint16', <br>
              +&nbsp;&nbsp;&nbsp; 'shadow-avail-idx': 'uint16', <br>
              +&nbsp;&nbsp;&nbsp; 'used-idx': 'uint16', <br>
              +&nbsp;&nbsp;&nbsp; 'signalled-used': 'uint16', <br>
              +&nbsp;&nbsp;&nbsp; 'signalled-used-valid': 'uint16' <br>
              +&nbsp; } <br>
              +} <br>
              + <br>
              +## <br>
              +# @x-debug-virtio-queue-status: <br>
              +# <br>
              +# Return the status of a given VirtQueue <br>
              +# <br>
              +# @path: QOBject path of the VirtIODevice <br>
              +# <br>
              +# @queue: queue number to examine <br>
              +# <br>
              +# Returns: Status of the VirtQueue <br>
              +# <br>
              +# Since: 6.1 <br>
              +# <br>
              +# Example: <br>
              +# <br>
              +# -&gt; { &quot;execute&quot;: &quot;x-debug-virtio-queue-status&quot;, <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;arguments&quot;: { <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;:
              &quot;/machine/peripheral-anon/device[3]/virtio-backend&quot;, <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;queue&quot;: 0 <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
              +#&nbsp;&nbsp; } <br>
              +# &lt;- { &quot;return&quot;: { <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;signalled-used&quot;: 373, <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;inuse&quot;: 0, <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-align&quot;: 4096, <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-desc&quot;: 864411648, <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;signalled-used-valid&quot;: 0, <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-num-default&quot;: 256, <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-avail&quot;: 864415744, <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;queue-index&quot;: 0, <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;last-avail-idx&quot;: 373, <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-used&quot;: 864416320, <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;used-idx&quot;: 373, <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;device-type&quot;: &quot;virtio-net&quot;, <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;shadow-avail-idx&quot;: 619, <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-num&quot;: 256 <br>
              +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
              +#&nbsp;&nbsp;&nbsp; } <br>
              +# <br>
              +## <br>
              + <br>
              +{ 'command': 'x-debug-virtio-queue-status', <br>
              +&nbsp; 'data': { 'path': 'str', 'queue': 'uint16' }, <br>
              +&nbsp; 'returns': 'VirtQueueStatus' <br>
              +} <br>
            </blockquote>
            <br>
          </blockquote>
        </blockquote>
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------69D375018D8EE0862991CFA1--

