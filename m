Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689A34EA85A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 09:11:24 +0200 (CEST)
Received: from localhost ([::1]:60312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ60h-0003Qc-8U
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 03:11:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZ5wl-0001di-7N
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 03:07:19 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:15140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZ5wj-0001NS-7l
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 03:07:18 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22SMp75e011100;
 Tue, 29 Mar 2022 00:07:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=hyiATV/d53VZZntrcYISu6NxpyeKyQU2L0M7HTxo8vA=;
 b=ue4fnIMtjzmrlx+313Ga4p+XmPaq64pDDK8scVxLNW1b9Bx30M3vWqUzK8VtWjm0GLaZ
 iXRjHP37DvEA1ZXIHsByn9+JJ0TeN/qH45//PbRqpdhKy0TKXd4Wi/2UZfYA1VbRE5m/
 rjDN4pXUae4rQtxhfPQAuOAkA8wg2CrqC++hCTIEoVxv9QGtYkFKROBO36mbdLTV/Oq1
 hYKJRysDn0ER7xHtIDPInDWS2gn8lHBpni160vE7lfYvFX3fTJi6w39AD7XWJSoC5DY8
 DhPXeYOl7kBDnE7QHAzzpkIWywglScspnKPcWSZk16f9JSc3xYYBkvZsHCe0wZJHYlC1 bA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3f22c0d6qj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 00:07:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvRA5GvbtWC/+CewgwCXvDKsVHRKexgBGyuLfuc6FPMyMj5ycS/hA+aFhiC5Tx1hphPENYs/bkApGR4uokcRa9E+U/W50488T7P8VyDiPpvKrF0BlWKtpg1xIr+7/KLVV2/1bRYiVQ8TJux+zXoYbGqO9q2w3uHdC0DmHkGfBs8Bo5SBt7if8VGgMrq5dpIuSC7VWQ6EPQvzBhs76MjxoTmuGudVZO6zE1pq/mWghiixz6kGtrJgonHDJIPkBbLAgu4J37dVJTj0NYgj1ie3pYIR7Tonl7+I207MazTMJYKhILma2XXvSBF+8qur9DZ0OoHnhDipiVhjo7XKGsnCDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyiATV/d53VZZntrcYISu6NxpyeKyQU2L0M7HTxo8vA=;
 b=mDRP99G1/BubFXdWVUUMnxZ0r2UNvK6nPYFqHUtv3oVR8x8ComYPYIq5O3YftpKv0QKHUrIqRAT6cSAk4r/XZLAqn9drVfvE1Hr1MAA+p5gYKQj0RP55tyeS99SYAyqVvFJ10aewefp5Qyy3u18RjH0eK37rr63SL5T6w1vy2aKCBnmdlUPp82IE5BvivW8K5amJvmDfVA7o4eLYWSH/hpqd9kUwfSoiOYwxPtxG6q6XAXqoSwOvdCX+fIab72Ys/3vp3aPqABTwUXhhgSR1SMIggzn7tr9UzTN6V0VChXt4z75gPl/W9eQzQUPWUKhGmwYR9KOJfpI8/zbWRc1vBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by MW4PR02MB7491.namprd02.prod.outlook.com (2603:10b6:303:7e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Tue, 29 Mar
 2022 07:07:12 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 07:07:11 +0000
Message-ID: <0705b49a-d4f6-f670-e26e-84d637c8071e@nutanix.com>
Date: Tue, 29 Mar 2022 12:36:57 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with screendump
 as PNG
To: Markus Armbruster <armbru@redhat.com>
References: <20220328165415.2102-1-kshitij.suri@nutanix.com>
 <20220328165415.2102-2-kshitij.suri@nutanix.com>
 <87bkxp5kfo.fsf@pond.sub.org>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <87bkxp5kfo.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR0101CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::32) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 659a2b0e-07c2-436b-6b6e-08da1152beaa
X-MS-TrafficTypeDiagnostic: MW4PR02MB7491:EE_
X-Microsoft-Antispam-PRVS: <MW4PR02MB7491C7A6775D4307C0464DCB991E9@MW4PR02MB7491.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BZ62EGCCa/FSvKWLAW1rir11ht/uXoIN+5wrJ47IJ3rpqaBN6PwSxJHg2Z1E2gYvMtuUFZPFbyMGXVPnyfgIdk5PSySeqMWRt6Xb/s59OKAgvod4icWovWT2NhYYHgtxGJngBat+9MbdR8X6s74Z8MGIg+Lp2yd2HHFpH2H3pSybPXZKBR3ukiNB/t69MhbejpavRXld0mdTKp4mPjHC7HcuaXURDkECS3BAKa7CXxK12ciuaboqovRuNSQvKqxNuquyud8GUdQtGK/Fpo6lS/Lb23lDR1Zqi/ESOaAdvEYgaUSc+t8YLAb0B/HrgJXJJWwT1rolkQpAeh62bgukFbXu1WTTpUUJEAE2lbuYA8aRVlhzOdcOBULRp3RWssiwJcPFnBHXC2by18yNQ7rCRozHVgPM02PHVIL08j0Bi1+OoWGxOy7+UdlzuR//QbE6knmgZEofVPuaZVe1Xl1mRGp1pyc0xSW4TwUM8WLGpagEWZPQwCICaEQ2egouP+6bZS/9/LFM5f8vnm4XvdkAiK1JOnq4bPs7ZAdfvmwxTGcx1UDuBU9w0+Q1358ovjiyryZBaVTs4kluyQxz2ccRZayAmZaT9hMSKXNnJPRxglJesUlT0dhkkfQZ5sh6MG9Svubt9b76CWRBvD0scMuQBmBNKOPi6VTrtPbizin2ybGBdcI1V1VPy+U6d5p+D+qQSuA3nzAwpN+3LZV7SvYAmlMSMI4ZaG4XMIwRmTBIWO/zeESbyWk1iXcI+YgTDUZU7XGyA7nTk1K5sIs20qPWcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4744005)(6486002)(508600001)(31686004)(52116002)(53546011)(44832011)(8936002)(5660300002)(36756003)(6666004)(6512007)(6506007)(186003)(26005)(38350700002)(6916009)(2616005)(2906002)(38100700002)(4326008)(66556008)(66946007)(86362001)(83380400001)(8676002)(316002)(31696002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnFlMkVHbXh0aEI5ZWpqcVkzVnlWdlFDVUdLT0daSHVvRXVnUFlhQlhoU1U2?=
 =?utf-8?B?dTNtNXZXQWRNV2JKNzdzcTU3WGo3ZmNzYXA5UUp0eFFCclBXMy9YYnNRSXdH?=
 =?utf-8?B?dlB6bTN5NTdjSHhpT3hKRDRNcUFRV3N1WVJXL2VLcUdHV3poSVUvQ0FJamtE?=
 =?utf-8?B?eXNHSkx6M2RZd21HY3lTTlFmMTU1U1Q4S3laMTJPK0Zzby95dWo0eVVjZndV?=
 =?utf-8?B?RXc0QTN0MTYwSmVuS3pMSThOZ2hTQk9aaTJxbzEyQlV4Q3QwRVpGVi9lN2d6?=
 =?utf-8?B?Z21QbmFFaVQrdTVtYmNRTFQwUFRPTGFjYWE5THduVTBoanM0dHNLTmZhUDQ5?=
 =?utf-8?B?VUxMakFwOVFBdjd4MFBFMmZkeGhXcDF1ZzVtVjg5NFh2SExiWEI3Wlgrd1V3?=
 =?utf-8?B?RWdEelVJL0hPVkZpbTFzeHdiV2ZRdC81NmpDWFo4RmE5Z1NHWkFIeXlYR2lU?=
 =?utf-8?B?ZzZnSS9lN0c5UU56Wk5kM0Z2YUNlZTZ4VjlrRW9SZmRWQkEzbGdSbVA5WENv?=
 =?utf-8?B?KzJlWG9KdzdkTGVaaEgrMjZ4blFNZnVHR3lxVTk3ak5yaXkvQytncGJ1YWdI?=
 =?utf-8?B?UGJHTHNrcGZFTkNnR01IUmdjL0gyYUcrS3ZuOTg4Q3g2T0ZNV3lTRW5mRlRs?=
 =?utf-8?B?QjBKTnE4akVhQitUQXFyYmxlLzNWU04wckkwaytoL3pyK0hibWkzUmoyNjU0?=
 =?utf-8?B?bSt0Y0JaMkVnV2w2bXJ1L01GNnJXL1JXUm1IWWZrWDJZbWdvYjFXMUNoZWFJ?=
 =?utf-8?B?Q2JSWkpBb09ab3hhalBreThGdmIxbGtZQlMxUWJjUjN3bDRzMGZCVW9qTkJL?=
 =?utf-8?B?SUIwcy9HV2phVWZ1U1B4NHRNM0FUMnFuek9jMFJuaWhGVit2VnJPalh5eG01?=
 =?utf-8?B?K1BPZ3MrTHhDa09uMjQ5T0VvazZTOGZJRm9nMDJYdlhBY0Yra2Y1elVjaUoz?=
 =?utf-8?B?ZFpRZ3lPbExHcnBGV09JbEtXZXhEVnhRUGw1T1NhSHRsK3JTUElpYk9sM0Fq?=
 =?utf-8?B?Kzl2bVN2YlpPaE9jWlltQ1dyNXRCR0srcVBYVGNWenBSVGtYd0NQdDEyWDh4?=
 =?utf-8?B?cEJtK0lZVFlpK1d4RWxxRkRWWFl6YlhTRHFMOUVIVVdQbEszL01FY2JvbHdX?=
 =?utf-8?B?WG5YeHNaL3hEM2NSMnVyOUVvcENQNlZGOW9OV2JoZmt3ZDBteFpzNzNJdVFs?=
 =?utf-8?B?V1dVOEhCWmsvdFhMUmxEV1ZISDI4TTZHL3Z0MzFSZTVCL1BZSEdtMzdGSzFQ?=
 =?utf-8?B?THhXSU9BcEZROVhGT0NwclU4UG5pS2JoRmpFV3loZ01nVmNWT2szM3EwU3Nq?=
 =?utf-8?B?dC9rWjVmQjZ4amZ1SzFIVm5yK3puSVhsUExRQmZlOUpiNzhoeXdOMXd2QXg4?=
 =?utf-8?B?M29VeUFIbjJMNmxiYjUxZHRnK1ppczlDczltSklwY0lBaGFJOUp6V0ZXVVBL?=
 =?utf-8?B?ZlNsQURIMlJkSmNINHFxQSt2TkVVMnZWTmxKTEFBMlVCSDRPaXBCUTBKN3dn?=
 =?utf-8?B?dmhza0c4NVN4eXdCZTN1VEVaMkFQb1g3VFp1OGNEM1g3MWxOT3Vlb1ZNUHhv?=
 =?utf-8?B?RGI4djdXODN5dVBkSEhGdWF2NXAxa1JFTVIvQU1CZGV6MlFQM1NMSWNENUxT?=
 =?utf-8?B?VE14bHBWZlphY0kxbUhKME1FMCtlQzMwc1MxSFlVek8yTU5wSDRKbkprMWJv?=
 =?utf-8?B?Rk5vQ01HS3BmOE5ldklnMEM1VllrZVJDbklZN3VseU9kTTRyQkRTQ0lLYURh?=
 =?utf-8?B?ZzZWOGN5elZjSitWMExGa3djanRhalZ5bmdBZk9NVFJCL2p0OTlvN2YyUWg5?=
 =?utf-8?B?VmFrUitFM2R4SUFTNzNwbUN1MTVVdlVaTExWMjFlR0Q4bkE2OVVoeWJ6aUo2?=
 =?utf-8?B?NDVFUzh3OVF4Q29ZaWZhZm0wZnBveWpyZGxuUzkzeHBLTitURzhjVEVteWc1?=
 =?utf-8?B?Vko4bm9DZWRXMjdhU1U5OEhRZElXTUI3RHpxVTNqeTcwQmRSeXkrRHl6Y1l6?=
 =?utf-8?B?bHdEdHB5RlhDSlNoSVBPUW9qcjVYQmcxYTVDWGxUa3dkdXIzNXdJMjdXZ0FM?=
 =?utf-8?B?b3hxSTcyWkxGYVJob1d2aWg0dE40bGVsbkFOU2xaTzBZelRiZFFzdmJMRFE1?=
 =?utf-8?B?QmRqM1MzUXVRZ3J4KzczUlRKZDVjMmhpSFZ0RHFwaXIxdkhOYzlzK1Z0eTF2?=
 =?utf-8?B?OXZqbHBidlhndFZnTjNFSFEySEFSZ2VrMi9JYTRUUzMrT0RpdHkzQm9WeGx0?=
 =?utf-8?B?SkhPMDZwRnZOa24rU3l4T01WaExnUHZGaEJ0dzRvV3lzWllvTlpNeStRYXZm?=
 =?utf-8?B?TFZGV2xHaGlBbVdTUy96OXJpTWNHUlJsSlU4SWl6VC90WVJaSUkzS0ZxalVM?=
 =?utf-8?Q?S5vlzzIZvS4rYmLw=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 659a2b0e-07c2-436b-6b6e-08da1152beaa
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 07:07:11.3613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFPsUzhrXSvmGl5gKik607soy9wnjQVhyYVHnqR0nFNmkJ6VfvGYzh8ijhkLW4dfJnTFiFJIq8ZNvJnzGoo+pf2a0BhN6u10ScOldJQSQ1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7491
X-Proofpoint-GUID: wlwBJmLJ1sGeT3JoMVgVJCjZcK64v-RV
X-Proofpoint-ORIG-GUID: wlwBJmLJ1sGeT3JoMVgVJCjZcK64v-RV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_02,2022-03-28_01,2022-02-23_01
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 29/03/22 12:12 pm, Markus Armbruster wrote:
> If I count correctly, this is the fifth posting tagged "v2".  Don't do
> that, please, as it's quite confusing.
>
Thank you for your review and I apologise for that since I am fairly new 
to upstreaming. As per what I read version updates should be done only 
when there are significant design changes to the patch which didn't 
happen in the v2 version. Will update it to v3 and send the patch.


Regards,

Kshitij Suri


