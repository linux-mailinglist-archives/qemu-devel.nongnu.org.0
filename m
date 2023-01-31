Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F59683025
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:00:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMs6l-0001yG-Vp; Tue, 31 Jan 2023 09:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1pMs6d-0001YK-SI
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:59:32 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1pMs6Z-0000Nr-0P
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:59:30 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30VCqLNX026251; Tue, 31 Jan 2023 06:59:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=UC1R+bb5Wqicfbp2sRDGCkPmNx8WD9M2+FH42fhxpq8=;
 b=aupvkPXUdyyBICKM60bRSaRuar3LA9Z9pPQisXb4NpPmPC5q11QXDy4g++9184t+VnQL
 MbLvvPrpK7AdMybUngKTpWrg3nPYj4lj/SSZEzy6j/iPohgwBY1j8z0i9tlkioq1tSLQ
 xWm8oQ2LV3t6/iuKQd5ckSvwhVXS7ufZr6kKroIpMZukq5+GVizez8dBLDNS4Bf0ZHQs
 9r5zZD98dZx1+f6nUKbUh0Bl/WoRO4diIru1kNcXomSVQZ3cS8xQBKm28wPCcKFllfnh
 C+jKRsFD/SS5IftWT/7Q/7X6drXiUMSi9wOElV/4F3dduyZRR/19BLgNdBc4ZLC0LKDT Mw== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3nd3wkn9d2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 06:59:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOZGQsbFOeP7qKCc+NyiLh96IlludbB1cd+ZU4eWaql2/9Tuo7kY4+7Wf3eT++lXYU4K5Zz7WFqhl/VjfankEdmaXBUvqj6oWEnKTQR0wOt6TH37nJcF77Tls/E/xTN392hw9MJaqsC3qxiPVSAithqIFidVT4OyCl29rG0QM1vQsdsBpPlogJdQ73VZ7Sg38nm5I3g55b3EiNRc7YIkowpBAh1ax9hTOsv8tn/YgoIaqq4GErivginIhcvo7TUe6yE5t1VB1CzfnktpF1UHF5E83AXw6GvWiB0tYhiOk5t5NiewbE86bWBjw64z3+049ear47tRd4pI5UDRP8Vjww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UC1R+bb5Wqicfbp2sRDGCkPmNx8WD9M2+FH42fhxpq8=;
 b=K03kpu0NkicMI1btkDgjwalywJS/X2S/TYu1i3/n8k76Qh+GfCIt6nXBv585KeoF/fzE1bxO10f0Zb3Puieaf5aZczdT494ZlyGRlD4e4RzgQsOr/mJC0BLlZRF1jFwNuK6FN1czJ7BW4/ErPdi7RbOLwCx1KT1cz2EhdeISa7xxH82st3DOpqVU5BWLW6mJodLl8WOcWxPn+v22AQifmdprdnMU8fiU056UPJL7xYnj4AfGLmDa5t3tu5AY7mH/0Zb+3qaNLCfE6IU0OeHYh2z4ZlNCtvADHaZUrJSSz5AcVxn7Sfjfn6RP7oyFOynVp2xzuYc7sd8T7PctouTjXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UC1R+bb5Wqicfbp2sRDGCkPmNx8WD9M2+FH42fhxpq8=;
 b=s2iFaK6ZQni7jgxfAu7Lb6OIA8ByZLsDs0tJR6SpFkwKv+4RGRYRcgz8NFRiF0RzT903lS4vZ+b/JtGN+77jRmuQaB16k0dylJs+mRR3JYjvAqW8hR2RpFME7Gap3L0h51+f9/auXR4wVG7RNzkytohAkkGAT2WSwMw/dtcmp97eBdcqe38oQtpOtq/AiEVqUHglGzFin+ubsokwiJF2jsyYw9Kut6gbOtlpCnd6jAXNM9UXgdTasTuKr9mhHajRRfzeAGoCazaV7kAP/IQD1Z9729oKvjx5yBywIF443uQ+DF/2XB+C7kv5RWE/FKJ+017MsgHDDTwyE28TNERSZg==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by CO1PR02MB8649.namprd02.prod.outlook.com (2603:10b6:303:15c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 14:59:22 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 14:59:22 +0000
Content-Type: multipart/alternative;
 boundary="------------87dew8m5SoFKc0zmTQYG7uwU"
Message-ID: <f50993b5-716f-ffef-1d0d-2ce1bdd086fd@nutanix.com>
Date: Tue, 31 Jan 2023 20:29:08 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 0/2] check magic value for deciding the mapping of
 channels
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com,
 Peter Xu <peterx@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>
References: <20221220183616.228621-1-manish.mishra@nutanix.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <20221220183616.228621-1-manish.mishra@nutanix.com>
X-ClientProxiedBy: MA1PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::21) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|CO1PR02MB8649:EE_
X-MS-Office365-Filtering-Correlation-Id: f96f708b-877f-4141-05c0-08db039bbc2c
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TYrnXeZsTMHOgdbFM7pa3cG+wSDP7mPnmCOF3TGSUUWJ4dOkh2DGjYASTrHHxt9EW+oEWPvwfZeQCrlAyXVRLIzRDAk3PJlcG/UWwSXXu49iGDoQehnHkgK2saTO95IR8xwRFjlqNUSKY8hXdjYVccX9qe4WdHERz6ZzRYR45cGU26WEO+blnpbX1NqU8l1ZzkLX7we2+4Ycf24Qmr29usaL9O1JpTVqqGmcQJPjpcnp95c1lP6LXpSGDrkAzkKsfXoCVQqNprhkjzTih2zddFCqNXw5kaQ+Qtygw1bX9zPIobrVBVqrNebc3DiQFwFeYbK5dVUGWq7tTj0hwLVHB+hDY1tERW9M0KrSgEcf3SCgwKh/be0EUXQ/w6JLaUxj/Pc1ieMl23k+LL7DIUV57ChGF/JPkVJCnrnWB887dgo98e4AfmQ+dB2BO47HBCPNS0Q3jNZWcKvosflZNoE/YepQwKzb2rxvHXcJ05kT12wO6Gng+JqoHYHjFYShNozpuIs3G/Jvivl96TB3YkzZzRdVc0ZtceuJDogMWcrSw+Xbd3PUG/C/lziJTCMV9qIJOJ76XzlLlGQZNqZUaArGBAUEx7KZI1ZDtZmFyXb4rbhSK7/niVVFo7Hhr8zK4tJalWKZNuZ6yWmlgOYgXq1Ld+qJpmSWK1FZgPfmRz9zCg7zr6IZfK4VGl4xN/HTF64kY6wBx81+eJgz8sdm+FAXvoeoUj1Ef/uUwTKHz3m4H8g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199018)(31686004)(54906003)(316002)(8936002)(4326008)(8676002)(41300700001)(66946007)(66556008)(6916009)(66476007)(31696002)(86362001)(36756003)(38100700002)(53546011)(26005)(6512007)(6506007)(6486002)(33964004)(186003)(2906002)(478600001)(5660300002)(83380400001)(6666004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3IrbzROMUdqaEo2MkxRYTR3MmtrOEszL050TXIwZEw3T042QUlXT2dReHpy?=
 =?utf-8?B?WDdKUGpKdjJHME95S0lqb3V5a21yQ2x5Z3p2bTF0SlhiQkJsU2lHUkgyNkkw?=
 =?utf-8?B?UWNaaFhzMC82S3NCNU5HdWlPZ1FJL3Rha2l2RW5JVStpVVZKenlMVk15SW1o?=
 =?utf-8?B?aXBlT3pNSHJEYU94ZDJnd3MvOFNIeS9PamlGanFQdDNPVXRyL2RKMCtBMkdT?=
 =?utf-8?B?c21EVEIrQXByZGFCVWRBaTVLV2Vmd0w5MmtFSTZHVnJCTlVmUUkrZEJvNk1Y?=
 =?utf-8?B?eFRNWGJQeEQvd01KdXVVaGFsNFBGK0FxNXNhc1duOE9DNmN3ZE9tS24rd3FP?=
 =?utf-8?B?c3dFZzUxQ3hvTllCdHkwVHA2U2txNWVlZ1huWGRKcWxjdDl0TFIyVWlJV01G?=
 =?utf-8?B?K1VNeVlYa3lsQ0ZOV2hKeFdJNk41RDZKSTB3c1RGTVdwYnIwYlNlclhxc2tx?=
 =?utf-8?B?cGRHVWQvaXlkUVM3SnMwMDNBY3F4SGdsNXRVekRiOXB1VE9HSUJaazZlSlBF?=
 =?utf-8?B?NnVZUkF0aDdOb2lGdHAxeXJmeDBmTllRd2I3MG95Z0EvalpIMngrK0kvY3Rp?=
 =?utf-8?B?RkgvbUppKzJTdGhUWG1kVEY2TUVFanBQYTNveXl0WjNMZkdxSFdERmFUWTNW?=
 =?utf-8?B?RjlROGhHcUkxOERONXBISU5EbWNDUDhPRkc4dFEvRmJ6TTlUZ0RkZDFIWnZM?=
 =?utf-8?B?a1JaN0RuZHVHdFZTeVNkc1lXeTNpOEszMXlmbTBwdFNnZCtSMWFRMmd4emZr?=
 =?utf-8?B?VVZ5VDYrZDFCcUdwbmJ2aWRJcG9IazVKODdrZFVJWFR5ZUoxTXk3U0VJY05Z?=
 =?utf-8?B?a21rSzRuNjY3TXg1Y1U3WlFWZTA2MnVkSlFCUEZMUW8rQ24xYkFBUHhWVEhr?=
 =?utf-8?B?R0ZqMmdnakNDZVZaQTZZbWwxRWJ6SHpKUFZGMXBxMjViWWhlbVhPYUV3YWh4?=
 =?utf-8?B?Vnc0cEVkeXo4d3htbVVFMmh6WXJYSzJpS3BOK2ZVckxNeEJYRmJYTWppT3N4?=
 =?utf-8?B?bk9NQ0xQYXAvcG9aNVR1cGRmbWt3SlpPV3F0b2IxYmFVVUg3TmxpYnlYZ1NU?=
 =?utf-8?B?TVM0VmltMTQ4MHJrRmNXL2MwYXJqTjZqSVNCRmxKOThBSGNqT1ppdE8zeHU0?=
 =?utf-8?B?V2RzTkpZdkpmd3pqeDZZQUx4RmRYamY1R040MC9QSE9iM0E1YWtOWlljVGRX?=
 =?utf-8?B?ZzJ4OHg5V0tsN0pXb1pNSXlvNUtFZlhqTjc1ckxMbUc3STEvT1ZVcFJwV0pE?=
 =?utf-8?B?a2Z5L2hoMGtiWDhCK1BRcGJESUxicjlNTUZ4MUlyRUpoVWhISGNSbDUvRVov?=
 =?utf-8?B?ZGZlY3VDSmtKZng2WUR6ei8zZEtSU0o1bzh0QXJEcVc3aVphNlYrWTl4UUNq?=
 =?utf-8?B?ZUVJWHRUblhqMk5KdnhjM2hzSVY4ejU1K0JXeW4yT2lOMDJtUWZtWldiNGJQ?=
 =?utf-8?B?L1FLcjgvNWJKeWo5L2xVWVJDWXROVFZ1N21ZWHZyM3VicXlRMG9aQTY1Q3Ri?=
 =?utf-8?B?M29adzFvYUphUVV0Z3lIZC9ZZTRmMnRqd3hBclg1TllhaE0wd0FPWHZyMlFy?=
 =?utf-8?B?bXNnalJQWHVYcnh0S2J2SHdzUXovTVRyTnZhVkFaS0I1N2wwanovYkpzZnNB?=
 =?utf-8?B?WUd0VlRJbDNDSlNxS0lmYi9sbzZldzh5eUNFNm4yUWNxYWdSUGdoQ3hrVm9K?=
 =?utf-8?B?eFVnVzRHMEdGNUZLQ1h5ams3Z0RlNlhFeTd4WDRYTXNUd2xLelRwblFxUDds?=
 =?utf-8?B?b0tiU2VneHlZbU1Hb0M1b2U3VDZ6VXJTK1EydEhvNDRiRG1Wd1VHcmtGSktM?=
 =?utf-8?B?QktLa3RhOWxLdjRlZTAycmZjYWc0SnNCRWxybzA0Q21RbDQwZllDYzgreGZm?=
 =?utf-8?B?VnVtY0V3aFRFSU5ibDgxNDIzQ1FBdWVETitNWWpiNVdmVUd3TXFYaDNYS1R0?=
 =?utf-8?B?UmpBdjh0QVFxZG0xd1ZGWUNaRVhLZHp0SFZ0QXV6aGRLbXVNN2hHcjRhdll3?=
 =?utf-8?B?OWkzOHh2VFVabDg0V1VlemhscE1xckVXbDJ3SzNRRXpLT2NqWFNlUTBYdldp?=
 =?utf-8?B?RXhJTGIxYzhVTlRlTTFQYVZNSGhEL0dnYzRLc1RGS1BCa1gxdlMvOXc1Znhj?=
 =?utf-8?B?dWZ1SVZJMi9rY3VjNFBaTlZBWkhBT3R6Unp4MmIxRGtPc2JTdjJhc1hRR2ZS?=
 =?utf-8?B?ZEE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f96f708b-877f-4141-05c0-08db039bbc2c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 14:59:21.9103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+/M3KMkng9+MnIPGMrNhiVMWg9tXyqtN8SZhE9reUSgZWb/EYAHzkhy20be3YtTU4mPnnY56Pj36rDMjrofnfrPtf+G96uclrQWSahQYWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8649
X-Proofpoint-GUID: OiYrs-Ae4OfNRFAAKMGuOpKO_Eb3Hkst
X-Proofpoint-ORIG-GUID: OiYrs-Ae4OfNRFAAKMGuOpKO_Eb3Hkst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.09, SPF_HELO_NONE=0.001,
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

--------------87dew8m5SoFKc0zmTQYG7uwU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Peter, Daniel,

Just a gentle reminder on this patch if it can be merged, and really sorry i see now earlier reminders i sent were on v6[0/2] and somehow you were not CCed on that earlier. You were CCed just on v6[1/2] and v6[2,2] so that's why probably missed it.

Thanks

Manish Mishra

On 21/12/22 12:06 am, manish.mishra wrote:
> Current logic assumes that channel connections on the destination side are
> always established in the same order as the source and the first one will
> always be the main channel followed by the multifid or post-copy
> preemption channel. This may not be always true, as even if a channel has a
> connection established on the source side it can be in the pending state on
> the destination side and a newer connection can be established first.
> Basically causing out of order mapping of channels on the destination side.
> Currently, all channels except post-copy preempt send a magic number, this
> patch uses that magic number to decide the type of channel. This logic is
> applicable only for precopy(multifd) live migration, as mentioned, the
> post-copy preempt channel does not send any magic number. Also, tls live
> migrations already does tls handshake before creating other channels, so
> this issue is not possible with tls, hence this logic is avoided for tls
> live migrations. This patch uses MSG_PEEK to check the magic number of
> channels so that current data/control stream management remains
> un-effected.
>
> v2:
>    TLS does not support MSG_PEEK, so V1 was broken for tls live
>    migrations. For tls live migration, while initializing main channel
>    tls handshake is done before we can create other channels, so this
>    issue is not possible for tls live migrations. In V2 added a check
>    to avoid checking magic number for tls live migration and fallback
>    to older method to decide mapping of channels on destination side.
>
> v3:
>    1. Split change in two patches, io patch for read_peek routines,
>       migration patch for migration related changes.
>    2. Add flags to io_readv calls to get extra read flags like
>       MSG_PEEK.
>    3. Some other minor fixes.
>
> v4:
>    1. Removed common *all_eof routines for read peek and added one
>       specific to live migration.
>    2. Updated to use qemu_co_sleep_ns instead of qio_channel_yield.
>    3. Some other minor fixes.
>
> v5:
>    1. Handle busy-wait in migration_channel_read_peek due partial reads.
>
> v6:
>    With earlier patch, multifd_load_setup was done only in
>    migration_incoming_setup but if multifd channel is received before
>    default channel, multifd channels will be uninitialized. Moved
>    multifd_load_setup to migration_ioc_process_incoming.
>    
>
> manish.mishra (2):
>    io: Add support for MSG_PEEK for socket channel
>    migration: check magic value for deciding the mapping of channels
>
>   chardev/char-socket.c               |  4 +--
>   include/io/channel.h                |  6 ++++
>   io/channel-buffer.c                 |  1 +
>   io/channel-command.c                |  1 +
>   io/channel-file.c                   |  1 +
>   io/channel-null.c                   |  1 +
>   io/channel-socket.c                 | 17 ++++++++-
>   io/channel-tls.c                    |  1 +
>   io/channel-websock.c                |  1 +
>   io/channel.c                        | 16 ++++++---
>   migration/channel-block.c           |  1 +
>   migration/channel.c                 | 45 ++++++++++++++++++++++++
>   migration/channel.h                 |  5 +++
>   migration/migration.c               | 54 ++++++++++++++++++++---------
>   migration/multifd.c                 | 19 +++++-----
>   migration/multifd.h                 |  2 +-
>   migration/postcopy-ram.c            |  5 +--
>   migration/postcopy-ram.h            |  2 +-
>   scsi/qemu-pr-helper.c               |  2 +-
>   tests/qtest/tpm-emu.c               |  2 +-
>   tests/unit/test-io-channel-socket.c |  1 +
>   util/vhost-user-server.c            |  2 +-
>   22 files changed, 148 insertions(+), 41 deletions(-)
>
--------------87dew8m5SoFKc0zmTQYG7uwU
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font size="2">Hi Peter, Daniel,</font></p>
    <p><font size="2">Just a gentle reminder on this patch if it can be
        merged, and really sorry i see now earlier reminders i sent were
        on v6[0/2] and somehow you were not CCed on that earlier. You
        were CCed just on v6[1/2] and v6[2,2] so that's why probably
        missed it.</font></p>
    <p><font size="2">Thanks</font></p>
    <p><font size="2">Manish Mishra</font><br>
    </p>
    <div class="moz-cite-prefix">On 21/12/22 12:06 am, manish.mishra
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20221220183616.228621-1-manish.mishra@nutanix.com">
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

v2:
  TLS does not support MSG_PEEK, so V1 was broken for tls live
  migrations. For tls live migration, while initializing main channel
  tls handshake is done before we can create other channels, so this
  issue is not possible for tls live migrations. In V2 added a check
  to avoid checking magic number for tls live migration and fallback
  to older method to decide mapping of channels on destination side.

v3:
  1. Split change in two patches, io patch for read_peek routines,
     migration patch for migration related changes.
  2. Add flags to io_readv calls to get extra read flags like
     MSG_PEEK.
  3. Some other minor fixes.

v4:
  1. Removed common *all_eof routines for read peek and added one
     specific to live migration.
  2. Updated to use qemu_co_sleep_ns instead of qio_channel_yield.
  3. Some other minor fixes.

v5:
  1. Handle busy-wait in migration_channel_read_peek due partial reads.

v6:
  With earlier patch, multifd_load_setup was done only in
  migration_incoming_setup but if multifd channel is received before
  default channel, multifd channels will be uninitialized. Moved
  multifd_load_setup to migration_ioc_process_incoming.
  

manish.mishra (2):
  io: Add support for MSG_PEEK for socket channel
  migration: check magic value for deciding the mapping of channels

 chardev/char-socket.c               |  4 +--
 include/io/channel.h                |  6 ++++
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-null.c                   |  1 +
 io/channel-socket.c                 | 17 ++++++++-
 io/channel-tls.c                    |  1 +
 io/channel-websock.c                |  1 +
 io/channel.c                        | 16 ++++++---
 migration/channel-block.c           |  1 +
 migration/channel.c                 | 45 ++++++++++++++++++++++++
 migration/channel.h                 |  5 +++
 migration/migration.c               | 54 ++++++++++++++++++++---------
 migration/multifd.c                 | 19 +++++-----
 migration/multifd.h                 |  2 +-
 migration/postcopy-ram.c            |  5 +--
 migration/postcopy-ram.h            |  2 +-
 scsi/qemu-pr-helper.c               |  2 +-
 tests/qtest/tpm-emu.c               |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 util/vhost-user-server.c            |  2 +-
 22 files changed, 148 insertions(+), 41 deletions(-)

</pre>
    </blockquote>
  </body>
</html>

--------------87dew8m5SoFKc0zmTQYG7uwU--

