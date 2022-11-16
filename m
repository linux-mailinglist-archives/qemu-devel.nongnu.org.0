Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550F962BB5F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 12:20:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovGSC-0006fs-MU; Wed, 16 Nov 2022 06:19:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1ovGSA-0006fi-CQ
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 06:19:38 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1ovGS7-00070b-DS
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 06:19:38 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AGAsK5l020101; Wed, 16 Nov 2022 03:19:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=1JYoLSZ6EYJ+MRMfIV5Cvos/ik+FDxu1nLPSr+kokRE=;
 b=UNSuaabNibqRi1TSMZC0H/80CaBlyIsFvmcRUZyS5jt+LADToZBExi91ewOZAJFOLNm/
 m60FnX520PwousQup4e40WZB5/yPQ1ErdzutHZmkz32MSOhDEzi4LML3zepzKq657itc
 Q+HPoHbYXyoYEF8LF22jG7WW5LSAUqIoaSkOjhU0E3YOlLFnnC3rqSe/cWem6m+f2Yuy
 0pXoJ4lBaef6ZL8qBNNiQp1XV84GAGm1Tq5l0l8nk16RlW+016gELG55c+V23Is7llf6
 M2PSH6jrwDi0wt6CMS8JFJpb1t9ezNTM+Lue0b16JSRhbsigujOMTnleT/SSGvGxImXo cw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kuw9ac8ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 03:19:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIbQUPb/TOpp2MTW4elXJu8s0aBAKVqjCIKFgyG3aeyTWYvwiF2IqotLXn/KGHeO36CUejNrlO5u+r/x71brKvjra9yUCVEv4Q0tBwL6dvYS3rR4KW8DtyYV+I8oGjQ5pF+Gf8rU2hQ655sTZP0BIDejgvY7uBCzE9ogKWbRMGwAWLbGP73/dKBXO/zJTq6e9M8LU4E0Mgp/Ujft6PLRuUglycgi7d9gl7CrQhCP7yJROHp2dssVC9m5V8uiGec8gaEVS+YI5uD9ZDoRLoZ0R67+NTLoGpFbV6dtdRODttct4oXrLKRMRSWMdU70ydA9rd3ETx4yAz/G5/doOcCB3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JYoLSZ6EYJ+MRMfIV5Cvos/ik+FDxu1nLPSr+kokRE=;
 b=EwxN5H0vbxD9pLxf/CP+gr2DUg7wJV2M1E6dZRJU0gpI4OXdHwvlKvV9CJdEg8dSH/FSjx8KQrotwUDUyOklr9rNJ+59ErzSc8oUCRxV8E1bH4XUuqqDv1qytbE0E88rPfg2ANhlHjBXjjfX4degCC156oj7bJKJZGDXImY2/iGZvHdwo/MEkkuIVcuyLlrbF9buyG7YfJjU8xJ3hNAlMhnj4FLUXQSJmRwIOBN3Z9SoFJogqXanUTmXCThQh33tI3vLgfnU5roMVoNejrPnk21gtXOU3peeGRdZiQyW6upjvHqVD6tmGJbOvJaFRJKVFXFjjiPp5m1c81guKF6tww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JYoLSZ6EYJ+MRMfIV5Cvos/ik+FDxu1nLPSr+kokRE=;
 b=k+URLZ+pfhqjSyxumU3Yn/xruzSVS69K40KgOi6N95vGMbd8SX26DUFokd7TDoj3+bEzg14KOkK1gny4+AcHEF+IEsVZhxfSmaXtVu5P/zRTyspkQBOUtr9XrPeTcRMs4cqYnmiZNoQG3XNxSpv10LYf7nYlGOYSMtkqtts2L0wmsfs0PdY6xlbQm21Jjd6H/cSjF/uqJHixUqcC8tY4pYa4F19lMEZl4xhYJ+bWwHI7Ux3XsIeSeYVyS9Cs5GU0uAMO9d7PnTzR21r9fkKbdk7i0Wz+weJxJcR+hde3vXhElX5Y++QHibsJ2NQ/qdeUwtfx+OO0mi489lqWjorWhw==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by MN2PR02MB6733.namprd02.prod.outlook.com (2603:10b6:208:1de::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 11:19:29 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5813.016; Wed, 16 Nov 2022
 11:19:28 +0000
Content-Type: multipart/alternative;
 boundary="------------B0aobo9paxgiWSVmMVxtVass"
Message-ID: <7a01e23c-3148-4a7d-4fa8-85ca9c0be6d3@nutanix.com>
Date: Wed, 16 Nov 2022 16:49:18 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v2] migration: check magic value for deciding the mapping
 of channels
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com
References: <20221107165159.49534-1-manish.mishra@nutanix.com>
 <Y3PWUoHxcswxTrF8@redhat.com> <Y3Pffa0WD+xgFPCI@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y3Pffa0WD+xgFPCI@redhat.com>
X-ClientProxiedBy: MAXP287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::14) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|MN2PR02MB6733:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f9b3d1-3ddb-4f0a-c22a-08dac7c46cf9
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ADd8y9EzASG7jGNzGefGPUgy+m4altvO1Jr6i5RkcgVptGzmarAiJ9J4ACgRFhrYSGK5k7OJ9VbNw+2a3xg4nBxEjLYOw4jDzZm92uQB5z8HSj3I0r+a4bJRlT50q1owXAJjXZ/8EZGYwGHiKPq+BZtXf0D3mxBov6tboLfjfipgeQvQBVvvwnD+sgiMcDrmt9XVtNKUNozfV3lrwfJnICj958gtPr77Ji429nrTBNOH+R7QH+ij4GLGuCEuNxM6iJ3SbNkQFdN0oeyXI/ujEdMfyHj26vPYpdRRRYvmfaskqKP1IOd0azGBTzmO4WSmzELeFdBLy2K1u3rumJwhTMl6Utb56Twd3ntx4rZxjpPTQf46BVhQgt3sYC08TXsLI3fvKH/7qB9EOFq36zX5p5d2Y5kNoewlWhtFGwAy+jfWzJfHIcUr2XOWeDL/pMApBDjcv+PKzT39jmeZVAkAGvCdE/fABR7chKJzkgDG2HWhh2Od+zDAbJNUpZCU9Ku4ordmj6XCq1Y1E/GFfvMB5Rb104INg3bdkyUDQW/9I5oS23fBVkY+37/OoES1cPO+B9yx6YJMxuFOU7iFXigjULwbFdMgMUllFMRkN1Ou21WR5e95fHWHHY5zsWw8aLJ/XNZQHrGWmZehdYtnw5YlDtAN8OneapHxLlMrbqgo7NFxgV9p12t73fwrZRZQT+tweCNpbMDV9r+PN1YEmUr/FciQOqH+F1Eko5dzhTaoGVztqN4z/bJamuFc/odK5fjKlCqh1xHcDwiftIxNtpTvy+8gXGK7hhUr+dXbs5NsZk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199015)(31696002)(83380400001)(86362001)(8676002)(66476007)(66556008)(66946007)(5660300002)(36756003)(8936002)(41300700001)(6512007)(38100700002)(26005)(6486002)(2616005)(186003)(478600001)(33964004)(6506007)(53546011)(316002)(6666004)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVZsMlNLOXhCeGVKVjBydHZxNHFmZDVmSWppMmhuMW1aa2NCY1BCUnFUS1B1?=
 =?utf-8?B?TnR1a0dOcTJNQUNzeENaN1d2cDJPM0hVOU5CSVkvZ2g0cE5DOU9BcGExMGRK?=
 =?utf-8?B?ZWNMTzFPN0ZHMSs0V0hBLzdDdXJJa25vdDlsMEVIRnhQbVNFUkZ3ZDJjZnpK?=
 =?utf-8?B?QVJEOVdZVWhQT0NDTWlvRm1wNlg1b3RiNGpKb0I0amNzTkpaL1ZhMHdSTXVw?=
 =?utf-8?B?Z0Y2ZXZuVkxzMmtKenhORzNBdnpKVkVGS3FhNk15cEhOUzQ5bmFYb0FvcEdX?=
 =?utf-8?B?U2Vkak9wVU5weGVTZ3ZXR0lPRmsrYjNzdE9tQS9XbWtVRFExa1Byc0VjRUN1?=
 =?utf-8?B?L0xBMVN2OFhNekd2bmg4WjhBWkNPeG5EbFhkTDNNeHd2cXlvWHU1S28rK1ZV?=
 =?utf-8?B?SGdMZHVCdHo1NUdFcEJIWVZnMXppLzk2dmtKTWdwZUVFRzV0ODRwcW1DYkta?=
 =?utf-8?B?UGJGVXExRmFiN3ZRTkZlK0Z4N3R1SGJyQlJrZURkTTFZQmdsVDhFc0p3U1Fa?=
 =?utf-8?B?L3dGZ0czUCtRcEt5b3pITjNiK2RZb2thbUYvVWdialVtRC9UMU1LQWtpNWI5?=
 =?utf-8?B?U01pR283cVcwU2cyblBnMGkxL01FbEFScEhCdTRwT0pyMTFidDRYZ1E0SUlj?=
 =?utf-8?B?Q081Ry8xb0JnVG9YUDROY1BPc1FzeEpGN1QvWHZCbGUwMFpFcW1pbEdGTXdW?=
 =?utf-8?B?b3lYVWVwSWpXVkdmUU9VMjAzK2pmeU9GaitETUJVMnR4L0FScm9BTmxnQmxC?=
 =?utf-8?B?MG9rWFdRTmFaV0kvVUV1ZmtTUVRmdzgzKytjcUtOYVpHejBmVnRGOGlwUmll?=
 =?utf-8?B?NlVYZkFBb2lweXRiaFJtYy8xWGtWblJ3ZXVNaDhZQXdVWWVwTGZPOGNsTUNP?=
 =?utf-8?B?akQ3eE00NnJORk41dW04MzFiRmZZR3c4VXNPSmRsaFcvcmQwQk1TZTlGcHc2?=
 =?utf-8?B?RDUzUWkzTnBQTm8wc1huaWFaM2JyK0xQdjZDTEhqNDNzR0tLQlZXbnFHVDEx?=
 =?utf-8?B?SG8zUEcwc3VxV05Id3c0alprTkJWZzlsYmFIdVBBSk5scVlmbHNyMVNKaU9m?=
 =?utf-8?B?azFYdFc5ZjFnVmorYXZ6WFJ6SU1lREF0Tm82bzd6SmVpcExsYUh1M2YrUjBB?=
 =?utf-8?B?UXZ3MzNLcURDVmtjdFl1U2RKK0s4a0FYUEhWT1FYUWU2YXIxTU5tZ2Y2ZGFG?=
 =?utf-8?B?Nkg3OFFNYWN0akFXWUNKK1JIVjNaN2tZTGV5a1ZHRytKRmxZcXljQWxGSkVE?=
 =?utf-8?B?MkpvaXhUUUxBM0JBSEFqZHg1Ukx5Y0VlNW1NVFRXQUQyaWI2M1pYRWtaYm9o?=
 =?utf-8?B?KzNhNmtpVWZiRlFLRUNxdWp5dnV4NkRSVG5XZzNZdUpxdGhmOVNLVmZoc25Y?=
 =?utf-8?B?Y2ZVL3V6NTYxQ1prblVxWGZBMzZFMEFRc1UvcjRhR29rRTR1Q2JNLzJVNnNR?=
 =?utf-8?B?Q2VDVWkxVmlLRUl6L3VnK1lCSE83dlNYY1FWeWNFZkVXcUhzOFh4VFBnSHk1?=
 =?utf-8?B?YTF3L1pKUVpBcnBORHc3a2U4SEZKN2xXblZNMmU0eDhrM0QxR1NFVkhRd3lS?=
 =?utf-8?B?NDIzeTA0dkFVc2ppZTJ3NklvQUkwZGo4dUw3czZnc2VGeDZBZklpVE4wcDl3?=
 =?utf-8?B?REdpL0ZHS094SnFFcG1tMFo3OC8xYjE0dW00cDk5TW11Rjd5aldGTXNJemd2?=
 =?utf-8?B?RlZXb29jSitENVRBcnJNWlY0MzN0NFhldjFWdWJUQ01BZWRqNHFIZHFYa0w5?=
 =?utf-8?B?M0FmYTFrUVk3RStCaUVvVHpqUFRyRWRkZUF0a1ZGQ0JFY2dwczEraUxiMmw4?=
 =?utf-8?B?eDA0YlZLZVFWV0UzZG45TVZldEZVYkt6OFpFYTdNaENuc25vUGJHWnl6Yk1C?=
 =?utf-8?B?Yzg4ZkNRZUh5emNPNjEyeGtwN0ZDVXdhMGJoNkJhZkE1aSs5cFhsNzQ1aEcw?=
 =?utf-8?B?UGh4U1ltN0o3MlgxR2lpZ1p0bUE1Z3hUekdwd1lyRmJlVDh2UFR1NXN1N3R0?=
 =?utf-8?B?Y1ZIRG1qcGYrMmppWG5ZWHZPZnl6cTZONlltUGNRTnRxOUdBMzQ3MHZTWHMr?=
 =?utf-8?B?enZxYy83Q1lQdFptQXd3UjVmREl5S281clF2WlJxK0NSMTliZUtQWFlQUFo4?=
 =?utf-8?B?cmh4Z1o0aVJpbk9nUUdCL2IrY01hRGtZYy9HMWYvbEs4Z0VORFVPOEFwY1ZG?=
 =?utf-8?B?MWc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f9b3d1-3ddb-4f0a-c22a-08dac7c46cf9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 11:19:28.6701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcwBwWhclLpeQIvIYpJbamRrBO1oPUSlV/9FXaAZVzLrnkzoiQ5URwLAaJbG8kyNiEXe3PGbZyd0LYMm97kfyn0DlhnymQzgrc2975+nIhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6733
X-Proofpoint-GUID: N2-2nZUIElcr9C3-2J8fI-WLEaJJPAsc
X-Proofpoint-ORIG-GUID: N2-2nZUIElcr9C3-2J8fI-WLEaJJPAsc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_02,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--------------B0aobo9paxgiWSVmMVxtVass
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 16/11/22 12:20 am, Daniel P. Berrangé wrote:
> On Tue, Nov 15, 2022 at 06:11:30PM +0000, Daniel P. Berrangé wrote:
>> On Mon, Nov 07, 2022 at 04:51:59PM +0000, manish.mishra wrote:
>>> Current logic assumes that channel connections on the destination side are
>>> always established in the same order as the source and the first one will
>>> always be the main channel followed by the multifid or post-copy
>>> preemption channel. This may not be always true, as even if a channel has a
>>> connection established on the source side it can be in the pending state on
>>> the destination side and a newer connection can be established first.
>>> Basically causing out of order mapping of channels on the destination side.
>>> Currently, all channels except post-copy preempt send a magic number, this
>>> patch uses that magic number to decide the type of channel. This logic is
>>> applicable only for precopy(multifd) live migration, as mentioned, the
>>> post-copy preempt channel does not send any magic number. Also, tls live
>>> migrations already does tls handshake before creating other channels, so
>>> this issue is not possible with tls, hence this logic is avoided for tls
>>> live migrations. This patch uses MSG_PEEK to check the magic number of
>>> channels so that current data/control stream management remains
>>> un-effected.
>>>
>>> Suggested-by: Daniel P. Berrangé<berrange@redhat.com>
>>> Signed-off-by: manish.mishra<manish.mishra@nutanix.com>
>>>
>>> v2:
>>>    TLS does not support MSG_PEEK, so V1 was broken for tls live
>>>    migrations. For tls live migration, while initializing main channel
>>>    tls handshake is done before we can create other channels, so this
>>>    issue is not possible for tls live migrations. In V2 added a check
>>>    to avoid checking magic number for tls live migration and fallback
>>>    to older method to decide mapping of channels on destination side.
>>> ---
>>>   include/io/channel.h     | 25 +++++++++++++++++++++++
>>>   io/channel-socket.c      | 27 ++++++++++++++++++++++++
>>>   io/channel.c             | 39 +++++++++++++++++++++++++++++++++++
>>>   migration/migration.c    | 44 +++++++++++++++++++++++++++++-----------
>>>   migration/multifd.c      | 12 ++++-------
>>>   migration/multifd.h      |  2 +-
>>>   migration/postcopy-ram.c |  5 +----
>>>   migration/postcopy-ram.h |  2 +-
>>>   8 files changed, 130 insertions(+), 26 deletions(-)
>> This should be two commits, because the 'io' and 'migration'
>> code are two separate subsystems in QEMU.
>>
>>> diff --git a/include/io/channel.h b/include/io/channel.h
>>> index c680ee7480..74177aeeea 100644
>>> --- a/include/io/channel.h
>>> +++ b/include/io/channel.h
>>> @@ -115,6 +115,10 @@ struct QIOChannelClass {
>>>                           int **fds,
>>>                           size_t *nfds,
>>>                           Error **errp);
>>> +    ssize_t (*io_read_peek)(QIOChannel *ioc,
>>> +                            void *buf,
>>> +                            size_t nbytes,
>>> +                            Error **errp);
>> This API should be called "io_read_peekv" and use
>> "const struct iovec *iov", such that is matches the
>> design of 'io_readv'.
>>
>> There should also be a QIOChannelFeature flag
>> registered to indicate whether a given channel
>> impl supports peeking at data.
>>
>>
>>> @@ -475,6 +479,27 @@ int qio_channel_write_all(QIOChannel *ioc,
>>>                             size_t buflen,
>>>                             Error **errp);
>>>   
>>> +/**
>>> + * qio_channel_read_peek_all:
>>> + * @ioc: the channel object
>>> + * @buf: the memory region to read in data
>>> + * @nbytes: the number of bytes to read
>>> + * @errp: pointer to a NULL-initialized error object
>>> + *
>>> + * Read given @nbytes data from peek of channel into
>>> + * memory region @buf.
>>> + *
>>> + * The function will be blocked until read size is
>>> + * equal to requested size.
>>> + *
>>> + * Returns: 1 if all bytes were read, 0 if end-of-file
>>> + *          occurs without data, or -1 on error
>>> + */
>>> +int qio_channel_read_peek_all(QIOChannel *ioc,
>>> +                              void* buf,
>>> +                              size_t nbytes,
>>> +                              Error **errp);
>> There should be qio_channel_read_peek, qio_channel_read_peekv,
>> qio_channel_read_peek_all and qio_channel_read_peekv_all.
> Actually ignore that.  We should not add any new APIs at
> all.  Instead the io_readv callback, and the qio_channel_read*all()
> methods should gain a 'int flags' parameter, in the same way that
> the write methods have one. Then there should be as
> QIO_CHANNEL_READ_FLAG_PEEK constant defined.

Hi Daniel, As MSG_PEEK always reads from top even if there were previos partial reads, so current |qio_channel_readv_all_eofmay not work? I can keep things upto ||qio_channel_readv as common for both with flags parameters but have separate ||qio_channel_readv_peek_all_eof? Does something like that works.|||

thanks

Manish Mishra

>
> With regards,
> Daniel
--------------B0aobo9paxgiWSVmMVxtVass
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 16/11/22 12:20 am, Daniel P.
      Berrangé wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Y3Pffa0WD+xgFPCI@redhat.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Nov 15, 2022 at 06:11:30PM +0000, Daniel P. Berrangé wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Mon, Nov 07, 2022 at 04:51:59PM +0000, manish.mishra wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Current logic assumes that channel connections on the destination side are
always established in the same order as the source and the first one will
always be the main channel followed by the multifid or post-copy
preemption channel. This may not be always true, as even if a channel has a
connection established on the source side it can be in the pending state on
the destination side and a newer connection can be established first.
Basically causing out of order mapping of channels on the destination side.
Currently, all channels except post-copy preempt send a magic number, this
patch uses that magic number to decide the type of channel. This logic is
applicable only for precopy(multifd) live migration, as mentioned, the
post-copy preempt channel does not send any magic number. Also, tls live
migrations already does tls handshake before creating other channels, so
this issue is not possible with tls, hence this logic is avoided for tls
live migrations. This patch uses MSG_PEEK to check the magic number of
channels so that current data/control stream management remains
un-effected.

Suggested-by: Daniel P. Berrangé <a class="moz-txt-link-rfc2396E" href="mailto:berrange@redhat.com">&lt;berrange@redhat.com&gt;</a>
Signed-off-by: manish.mishra <a class="moz-txt-link-rfc2396E" href="mailto:manish.mishra@nutanix.com">&lt;manish.mishra@nutanix.com&gt;</a>

v2:
  TLS does not support MSG_PEEK, so V1 was broken for tls live
  migrations. For tls live migration, while initializing main channel
  tls handshake is done before we can create other channels, so this
  issue is not possible for tls live migrations. In V2 added a check
  to avoid checking magic number for tls live migration and fallback
  to older method to decide mapping of channels on destination side.
---
 include/io/channel.h     | 25 +++++++++++++++++++++++
 io/channel-socket.c      | 27 ++++++++++++++++++++++++
 io/channel.c             | 39 +++++++++++++++++++++++++++++++++++
 migration/migration.c    | 44 +++++++++++++++++++++++++++++-----------
 migration/multifd.c      | 12 ++++-------
 migration/multifd.h      |  2 +-
 migration/postcopy-ram.c |  5 +----
 migration/postcopy-ram.h |  2 +-
 8 files changed, 130 insertions(+), 26 deletions(-)
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
This should be two commits, because the 'io' and 'migration'
code are two separate subsystems in QEMU.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
diff --git a/include/io/channel.h b/include/io/channel.h
index c680ee7480..74177aeeea 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -115,6 +115,10 @@ struct QIOChannelClass {
                         int **fds,
                         size_t *nfds,
                         Error **errp);
+    ssize_t (*io_read_peek)(QIOChannel *ioc,
+                            void *buf,
+                            size_t nbytes,
+                            Error **errp);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
This API should be called &quot;io_read_peekv&quot; and use
&quot;const struct iovec *iov&quot;, such that is matches the
design of 'io_readv'.

There should also be a QIOChannelFeature flag
registered to indicate whether a given channel
impl supports peeking at data.


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">@@ -475,6 +479,27 @@ int qio_channel_write_all(QIOChannel *ioc,
                           size_t buflen,
                           Error **errp);
 
+/**
+ * qio_channel_read_peek_all:
+ * @ioc: the channel object
+ * @buf: the memory region to read in data
+ * @nbytes: the number of bytes to read
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Read given @nbytes data from peek of channel into
+ * memory region @buf.
+ *
+ * The function will be blocked until read size is
+ * equal to requested size.
+ *
+ * Returns: 1 if all bytes were read, 0 if end-of-file
+ *          occurs without data, or -1 on error
+ */
+int qio_channel_read_peek_all(QIOChannel *ioc,
+                              void* buf,
+                              size_t nbytes,
+                              Error **errp);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
There should be qio_channel_read_peek, qio_channel_read_peekv,
qio_channel_read_peek_all and qio_channel_read_peekv_all.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Actually ignore that.  We should not add any new APIs at
all.  Instead the io_readv callback, and the qio_channel_read*all()
methods should gain a 'int flags' parameter, in the same way that
the write methods have one. Then there should be as
QIO_CHANNEL_READ_FLAG_PEEK constant defined.
</pre>
    </blockquote>
    <p>Hi Daniel, As MSG_PEEK always reads from top even if there were
      previos partial reads, so current <code class="Code-module__code_1c6VC test-blob
        Blob-module__blob-code_2w-Pp"><span class="hl-source hl-c"><span></span><span class="hl-meta hl-function hl-c"><span class="hl-entity
              hl-name hl-function hl-c"><span class="" style="">qio_channel_readv_all_eof</span></span></span><span class="hl-meta hl-function hl-parameters hl-c"><span class="hl-meta hl-group hl-c"><span class="hl-punctuation
                hl-section hl-group hl-begin hl-c"><span> may not work?
                  I can keep things upto </span></span></span></span></span></code><code class="Code-module__code_1c6VC test-blob
        Blob-module__blob-code_2w-Pp"><span class="hl-source hl-c"><span class="hl-meta hl-function hl-c"><span class="hl-entity
              hl-name hl-function hl-c"><span><span class="" style="">qio_channel_readv</span></span></span></span>
          as common for both with flags parameters but have separate&nbsp; </span></code><code class="Code-module__code_1c6VC test-blob
        Blob-module__blob-code_2w-Pp"><span class="hl-source hl-c"><span></span><span class="hl-meta hl-function hl-c"><span class="hl-entity
              hl-name hl-function hl-c"><span class="" style="">qio_channel_readv_peek_all_eof?
                Does something like that works.</span></span></span><span class="hl-meta hl-function hl-parameters hl-c"><span class="hl-meta hl-group hl-c"><span class="hl-punctuation
                hl-section hl-group hl-begin hl-c"><span></span></span></span></span></span></code><code class="Code-module__code_1c6VC test-blob
        Blob-module__blob-code_2w-Pp"><span class="hl-source hl-c"><span class="hl-meta hl-function hl-parameters hl-c"><span class="hl-meta hl-group hl-c"><span class="hl-punctuation
                hl-section hl-group hl-begin hl-c"><span></span></span></span></span></span></code></p>
    <p>thanks</p>
    <p>Manish Mishra<br>
    </p>
    <blockquote type="cite" cite="mid:Y3Pffa0WD+xgFPCI@redhat.com">
      <pre class="moz-quote-pre" wrap="">

With regards,
Daniel
</pre>
    </blockquote>
  </body>
</html>

--------------B0aobo9paxgiWSVmMVxtVass--

