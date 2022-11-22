Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFD8633981
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 11:15:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQIE-0005pq-TK; Tue, 22 Nov 2022 05:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxQIC-0005oO-6p
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:14:16 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxQI9-0008OT-7i
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:14:15 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AM9ULIO019851; Tue, 22 Nov 2022 02:14:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=PJLJAP3f/Ju1wKLm4dOMS+BHglbLUWfJtwmOvHbrUdI=;
 b=gqrHXfLsqHtdiNm95fs3+6qpyvOsxoLIS1GcZSkQorthQAQdu2K6SFKy345DNt6S0vLa
 vQvMfw2fNftih7JbzLo2Z3FvBMA5dRw1yCiMwJ7MwFe92qLOvQvAgANvyo9+LiMDPhSC
 Dxo5LhFaNpC+0wq6uJlysN992PH1gpYKNIGS+qaiXJoSw0Km8xRhMmX3+KwFpzZd8F3b
 QNbqwndBDs/27HscWqfqkZOx56cPUKHZ/TEKZ1Tg/35BApoTvY2GtR74fr4FLEc5yr6R
 WyBtvQ1xiNFMvgwfsXvha6TV7NLReJlCqAQR49BQRVrUHjymVTSgSftbxHFAAIzZ/tJQ 3Q== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxybkqb57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Nov 2022 02:14:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkTVeEaW2+W4dFqipFjZUXbzb4EiXcq/oIZn13gpjU8G7lhkV/lQvFfLkJSNkln4SoR1secoi9Q0SJbnIqaSpxmbYGweTVIPHYJv7HywmYTIW139fVFnDVoM6BmLO1CgjBzSq8f3FV0Kz2RnRZDL+i5J46GVY1w6iGwp7q3jJ3auE5QDfRlhZMsS0hCuMpBFtoDeJrEC7XmHZJqo8bLJ0hAZKsn5htHgAFv6WFgK/JAJm3xfg+Y6aVga8LzjDkKPXMfgc6DquoOypf/RTowNvnbbQWWOom1eHMH5bo6Y1ykT9JW/9lKgHYVviDRWyna+KliQWGp/WndOYJ77ERc+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJLJAP3f/Ju1wKLm4dOMS+BHglbLUWfJtwmOvHbrUdI=;
 b=UTvwJO4nwLm+8/9UpVUpenyw/my+E50QT/Mmn6pIXgvkPWrTjIu0Qq0ymu8gEZhy9wXLE2w5G4idWjtzUT+IrXHUQ/Yey4Ngjcz1Z4Zl+WG459PXR4ABT7VXdz88hNnRcUmWcr0gjmOrKjgCSkbtsKDOyhPCBvjsKpfcVW5NQis1lQLbzfVqxqetZyoK2qqWWbhEIJmg7yNSCTmgZldObr7H9kHIINKAKbtBrssqjRZhDyNCY6oSykYTqh6HlnnDJ582dNr3Q3QLyI5h/JGu7c6+FTtE7bSt2AFkpnuSeg27UGa5ULu8g2HIYfs2jkbHP/uR8itLGD9QFAdp43/xaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJLJAP3f/Ju1wKLm4dOMS+BHglbLUWfJtwmOvHbrUdI=;
 b=v5hCPKaGDiIWByEW8kH9rnx1jUMoNMYTvSqlNjwZrrxIV857Mgia9ADPFvwNuONpDvmgKHXGVn6abyabTeFxNpQ0K/dDlfUsh4sCfB3P3NOUNV9FYcdMyG1vL5X7Yq/9qoGIgyLRHtUZNdh+VodYhr6HLzRNlrdUouwIs/YILJYfypm6ndIG0yCMqIR1y9KaMgvMMW2My3F9Bn4YE8ydZDlTMG6nC5vIHe2jDE6y6RupzBxfZuq8euyAbbFpsntkOSSmjDp6Ym3CMIuBTVhfcpDpeUz3Lc+GzHko/yzKNZQeqLOlcTPNF2/LEuXUU3uaEvyhe2lWWOuaiX7HbETvQA==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DM8PR02MB8123.namprd02.prod.outlook.com (2603:10b6:8:1c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.15; Tue, 22 Nov 2022 10:14:08 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 10:14:07 +0000
Message-ID: <f03d5744-8369-ed73-49f8-9a53a9507afb@nutanix.com>
Date: Tue, 22 Nov 2022 15:43:55 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/2] io: Add support for MSG_PEEK for socket channel
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
References: <20221119093615.158072-1-manish.mishra@nutanix.com>
 <20221119093615.158072-4-manish.mishra@nutanix.com>
 <Y3yPoFAo5l/vmB/y@redhat.com>
 <d240734d-8301-ac4f-63de-89e9d2c2174c@nutanix.com>
 <Y3yWkWfyLZXw+dwd@redhat.com>
 <9dc0d121-b808-a6fa-c626-9bd634e61a18@nutanix.com>
 <Y3ycJY/CRFsYfBam@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y3ycJY/CRFsYfBam@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::18) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|DM8PR02MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bbc7442-c610-4412-1b9c-08dacc724a71
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H1neK++slgG8nQXA8cWbYMzJZPbzJWZElC+ETdoT2xqKLEE9midgvX8Ixxb2ywU/j+thYkSn/1GCKIfaf4YyQ5Li8CEN/1Loe6xsElUv6YkrzWl1mDA389qctW0AuDXce4nddAeagkaZEpkJY+X4vpoUD9Rg2bVAFJ4VdHt4OHtBGRWrrZ5H4Hffr1P6lKx+fOzMMkPHueZursP/HOHfNCTwblZWnr+/fj16UQ4OhQ8gs+6OvG9NgwpSYSrIljW8vqiyYrVw7Y+AmixWzhkDl8edak6ZjYMZunqLKyhpgxLMTSx1X1kTyFuIaRRU8ID9CXsa3HnfDX72/nXD1NZFSEuGD/19IOaTUcdxzU8f7cu/h0zpjtnhcKLLyT7anW+fHVNZoAyy++8aIySAOYDNjj+ipY0QSldSlLX8hOvXxahmw+SfRY9gkzjJGNIn+YaXAkC3+fDu4WXs89ZMimWmSjroTcGmUHtueiEDqD/2DriRYbQ6Rx0pjr3CHHeWCaGBrYpA8rg6mf5aJSygQ60zjQWtQj93grkPMlgZZtD9dgZP+l62tf/w/KZnd/fXgKqwvqIdK1w1+pakS6FJwJQptqGbY8kQEiMXYHrN7/LPcsqCePYDaT8imjAkHKtMk8c/dw5HtE9vaNM80X52onpb55iiLWGCrcZtVr6VTS+LVobTP24nCn4RVDKnfE6WaDzeS66Rozh1/5xhyfE3nuqxAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(136003)(396003)(39860400002)(346002)(451199015)(31686004)(2906002)(83380400001)(86362001)(478600001)(186003)(31696002)(55236004)(6506007)(316002)(6512007)(8936002)(5660300002)(6486002)(53546011)(26005)(2616005)(4326008)(8676002)(66476007)(66946007)(66556008)(36756003)(38100700002)(6916009)(6666004)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0JIZWs4VlpBeDk5S3oycTZBdGdpSGtGTmk1NjJBS0RrdThhT05JSVpZRk9Q?=
 =?utf-8?B?cG1VNHlzU0FydVAwazB6TzlqMmlSUUdkeElVbDdEbDAxTU0ySG1EMXhTc2hr?=
 =?utf-8?B?Y1Nkbk0yNHdZTnQyV29PSlhaYVJNdFBWNDk5U3NpYXYrV3A5YzkrbmhCUEdv?=
 =?utf-8?B?MXcrbEU0V2VOL3Y3Z2V2VlB2bFMvV3VMU2ttTDNPcXRsSUxUbWE4L08reUcr?=
 =?utf-8?B?QWRDaEk1YXRaczNsZ1F0UGVLNXFvcUtIZnlVY2VTL05DTmFMQ0lXSFFpanFt?=
 =?utf-8?B?aG80MlZNNHRPS0JaZjBhTkdUSkRCM0VMR1ZsWjhOV2h1dGYzNFFUVzg1akJL?=
 =?utf-8?B?ektwVDJvaGVIY0hUTVRQT1M0VjhFdTUvVTQwYUZZd0F5bHdzVlJKZkZoZ09X?=
 =?utf-8?B?dHdzb3VJNklXZ2tMN29JZlYxNmlubURSN0NFWjBZR3hvL3dYUk9pZGVHZ0Nl?=
 =?utf-8?B?WTNnQitEdzlGZkxwTlE3OUtlSkw0dG5qaUlhdGxSWDhzNFIxejJ0bVhLdVFN?=
 =?utf-8?B?U3cwTlRIUTdHbzQ4blBOcjNyY1NQaDk3Qi9lM0d2c3B5N205blh2OGRsUFEr?=
 =?utf-8?B?Sk9JSW8yYzA1VFRNZ0Rjbm8yZFU3VmdyZ2tsK1R6cW54Y1NVc0V6d1g2Rk9j?=
 =?utf-8?B?WVU1bTZCS1UzVnlKck5TSm5LajA4QS9IMURSMW1KT3hXSDBaMXkxc3VyeDZR?=
 =?utf-8?B?UlprbUc1ZWhMTy8wMzJHYzhJeFJKTi9hSHVsejV3OUlOa3pxM2pETGcwU0xO?=
 =?utf-8?B?ZndTLy9BN3AvaHp1d01IKzh5TkZrYW14RkNiNExqc3lXVUFJcVRmYzhIK1VT?=
 =?utf-8?B?M25tNGVkRVA4aXhOY1RWdXlJclY1YXVtNlBXUUZWWUgvdnUzSkpOUThWa05l?=
 =?utf-8?B?S0NDZW1CSVVaeFdqSnVlb2ptNnNESisydWVhZmg2RDNzY3NmRHF2VnVmR24y?=
 =?utf-8?B?NU9iY2pndC9DVktaa0huUUVPWXdON0V5VDdxZTk5YlcvdlJzdXBQaTNwM0Nm?=
 =?utf-8?B?RlQzeVdCL0EvaUg5UFVoUmVTQnhlY3pablRvdGNoMzNzRWJ3eGQycEdqb2xo?=
 =?utf-8?B?K2FhUG9rYTRYTHo2eXVZYUJKeU5LTmFOd2duQUI4VW1xWEx0b0VYUUxDUWdq?=
 =?utf-8?B?NS9mS2lmL29iUGdKRnBCK1A3WmZtSzc3Z2ZPNkZqUlJJMERhK1ZCRUpsTUtt?=
 =?utf-8?B?SDVDKzI1Y3lZalA0enphdkJJK1VGUGJuREVRby9wNWZ2dW5jVWc0QnE1YXNR?=
 =?utf-8?B?dWVxTTYvM29sZk9aRmU4VFNRVzBva0U0S2s1U29NSmg3L3lHc2lNeE9LM1VM?=
 =?utf-8?B?MnNDM0NrS1QxcGxEcEZZSHBLN3dhdWkrNm4reFA4anJENTZOWlRsTnVvM2lZ?=
 =?utf-8?B?ZGRrVUpiUW4rbnFiR1ZDU0R5MC9ZOHZFeTVJb25TcDlBUmVwVFpKQnRWTG91?=
 =?utf-8?B?WU5iZEozT2ZiK3MrbWR6VHpGVStzQ2RPRDZZM1JwSFdWY0tKNjg4cldLRlR3?=
 =?utf-8?B?OG4ySlRaV0R0RWoyTTZjcHRCUHF3OHJ5RnRnRysyTGpRR2xBRUwwU0FiQTk0?=
 =?utf-8?B?dU1tMDRRVDRZbDVyM1hMSHQ0NXR0bndVOTdlMENKOEx0NXJvb0ticEVMZVFh?=
 =?utf-8?B?aFgrc0xNS056UUlUczdRekxHalhSYk1ISU1zaHQ2OXZmTEx1cjgvT2l5ZHRC?=
 =?utf-8?B?cmxqR3hwaHFmTDZ2OWV6UWdDTlVWdmFraWp1TU44ZVlURDYvV1p3L1VnYnp3?=
 =?utf-8?B?SWRZaVBLTHB0S2RjYnprVFBtVWVmQldveHBBWk53WHdRbTlXZHlGZVFZY1la?=
 =?utf-8?B?dUhSdjRqdHZIbTVpV0lnOHNHWFFjU1E4ZDZQYllKdHFSdjk3SzJOdFJCcmt3?=
 =?utf-8?B?QmhIYWx1Sk1DWkRXMGFGMW44RlNBNmJzdGxhNUxKS2Rsa3dlUnNkK1RoK2Z2?=
 =?utf-8?B?YURSdWNkZG1SY0E0UnhndGJDZzIxZjdaMi9RUnlia3R1MzNFU0VwL0lqZWNx?=
 =?utf-8?B?QzhBNzNoVTJRTVVJalh5WTNwT08zeVJ6dHFyeG1mVm1SM2RXcWMrT1dKMXpL?=
 =?utf-8?B?YXBReWNyNkR5VWMwckM4NncwRVFtVjdEU0toMVYzMTlpNWhEV0lRVStMbHY1?=
 =?utf-8?B?bk5tS1MyMkJ0WXNpa2dVNGwvaG5ud015OC92S2Z6dzg0dFJEWUVwOHRnakVR?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bbc7442-c610-4412-1b9c-08dacc724a71
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 10:14:07.7047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lX1hBWh2V6ESNAv9PnE4IJy/OZVius/c8lXSgUiZN+WL+AwU9x8DSRAWryGerQCfRXKuTkxJRhv04k5DZnCwh26nwWDiVYniDCZYw4JzFic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8123
X-Proofpoint-ORIG-GUID: QiqhpuCtWm83TYISRB0_q1FBfTKNwQVL
X-Proofpoint-GUID: QiqhpuCtWm83TYISRB0_q1FBfTKNwQVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_04,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 22/11/22 3:23 pm, Daniel P. Berrangé wrote:
> On Tue, Nov 22, 2022 at 03:10:53PM +0530, manish.mishra wrote:
>> On 22/11/22 2:59 pm, Daniel P. Berrangé wrote:
>>> On Tue, Nov 22, 2022 at 02:38:53PM +0530, manish.mishra wrote:
>>>> On 22/11/22 2:30 pm, Daniel P. Berrangé wrote:
>>>>> On Sat, Nov 19, 2022 at 09:36:14AM +0000, manish.mishra wrote:
>>>>>> MSG_PEEK reads from the peek of channel, The data is treated as
>>>>>> unread and the next read shall still return this data. This
>>>>>> support is currently added only for socket class. Extra parameter
>>>>>> 'flags' is added to io_readv calls to pass extra read flags like
>>>>>> MSG_PEEK.
>>>>>>
>>>>>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com
>>>>>> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
>>>>>> ---
>>>>>>     chardev/char-socket.c               |  4 +-
>>>>>>     include/io/channel.h                | 83 +++++++++++++++++++++++++++++
>>>>>>     io/channel-buffer.c                 |  1 +
>>>>>>     io/channel-command.c                |  1 +
>>>>>>     io/channel-file.c                   |  1 +
>>>>>>     io/channel-null.c                   |  1 +
>>>>>>     io/channel-socket.c                 | 16 +++++-
>>>>>>     io/channel-tls.c                    |  1 +
>>>>>>     io/channel-websock.c                |  1 +
>>>>>>     io/channel.c                        | 73 +++++++++++++++++++++++--
>>>>>>     migration/channel-block.c           |  1 +
>>>>>>     scsi/qemu-pr-helper.c               |  2 +-
>>>>>>     tests/qtest/tpm-emu.c               |  2 +-
>>>>>>     tests/unit/test-io-channel-socket.c |  1 +
>>>>>>     util/vhost-user-server.c            |  2 +-
>>>>>>     15 files changed, 179 insertions(+), 11 deletions(-)
>>>>>> diff --git a/io/channel-socket.c b/io/channel-socket.c
>>>>>> index b76dca9cc1..a06b24766d 100644
>>>>>> --- a/io/channel-socket.c
>>>>>> +++ b/io/channel-socket.c
>>>>>> @@ -406,6 +406,8 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
>>>>>>         }
>>>>>>     #endif /* WIN32 */
>>>>>> +    qio_channel_set_feature(QIO_CHANNEL(cioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
>>>>>> +
>>>>> This covers the incoming server side socket.
>>>>>
>>>>> This also needs to be set in outgoing client side socket in
>>>>> qio_channel_socket_connect_async
>>>> Yes sorry, i considered only current use-case, but as it is generic one both should be there. Thanks will update it.
>>>>
>>>>>> @@ -705,7 +718,6 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>>>>>>     }
>>>>>>     #endif /* WIN32 */
>>>>>> -
>>>>>>     #ifdef QEMU_MSG_ZEROCOPY
>>>>>>     static int qio_channel_socket_flush(QIOChannel *ioc,
>>>>>>                                         Error **errp)
>>>>> Please remove this unrelated whitespace change.
>>>>>
>>>>>
>>>>>> @@ -109,6 +117,37 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>>>>>>         return qio_channel_readv_full_all_eof(ioc, iov, niov, NULL, NULL, errp);
>>>>>>     }
>>>>>> +int qio_channel_readv_peek_all_eof(QIOChannel *ioc,
>>>>>> +                                   const struct iovec *iov,
>>>>>> +                                   size_t niov,
>>>>>> +                                   Error **errp)
>>>>>> +{
>>>>>> +   ssize_t len = 0;
>>>>>> +   ssize_t total = iov_size(iov, niov);
>>>>>> +
>>>>>> +   while (len < total) {
>>>>>> +       len = qio_channel_readv_full(ioc, iov, niov, NULL,
>>>>>> +                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
>>>>>> +
>>>>>> +       if (len == QIO_CHANNEL_ERR_BLOCK) {
>>>>>> +            if (qemu_in_coroutine()) {
>>>>>> +                qio_channel_yield(ioc, G_IO_IN);
>>>>>> +            } else {
>>>>>> +                qio_channel_wait(ioc, G_IO_IN);
>>>>>> +            }
>>>>>> +            continue;
>>>>>> +       }
>>>>>> +       if (len == 0) {
>>>>>> +           return 0;
>>>>>> +       }
>>>>>> +       if (len < 0) {
>>>>>> +           return -1;
>>>>>> +       }
>>>>>> +   }
>>>>> This will busy wait burning CPU where there is a read > 0 and < total.
>>>>>
>>>> Daniel, i could use MSG_WAITALL too if that works but then we will
>>>> lose opportunity to yield. Or if you have some other idea.
>>> I fear this is an inherant problem with the idea of using PEEK to
>>> look at the magic data.
>>>
>>> If we actually read the magic bytes off the wire, then we could have
>>> the same code path for TLS and non-TLS. We would have to modify the
>>> existing later code paths though to take account of fact that the
>>> magic was already read by an earlier codepath.
>>>
>>> With regards,
>>> Daniel
>>
>> sure Daniel, I am happy to drop use of MSG_PEEK, but that way also we
>> have issue with tls for reason we discussed in V2. Is it okay to send
>> a patch with actual read ahead but not for tls case? tls anyway does
>> not have this bug as it does handshake.
> I've re-read the previous threads, but I don't see what the problem
> with TLS is.  We already decided that TLS is not affected by the
> race condition. So there should be no problem in reading the magic
> bytes early on the TLS channels, while reading the bytes early on
> a non-TLS channel will fix the race condition.


Actually with tls all channels requires handshake to be assumed established, and from source side we do initial qemu_flush only when all channels are established. But on destination side we will stuck on reading magic for main channel itself which never comes because source has not flushed data, so no new connections can be established(e.g. multiFD). So basically destination can not accept any new channel until we read from main channel and source is not putting any data on main channel until all channels are established. So if we read ahread in ioc_process_incoming_channel there is this deadlock with tls. This issue is not there with non-tls case, because there on source side we assume a connection established once connect() call is successful.


Thanks

Manish Mishra

>
> With regards,
> Daniel

