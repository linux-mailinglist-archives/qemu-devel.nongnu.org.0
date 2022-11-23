Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A8C6365E3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 17:33:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxsgp-0004Kd-77; Wed, 23 Nov 2022 11:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxsgk-0004KT-TI
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:33:30 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxsgd-0000lR-WF
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:33:30 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANBoKAs001436; Wed, 23 Nov 2022 08:33:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=SFS8Luzt8OVnpAlLrjy0Ja0nHqG2UBUgi4D9UdHAg9U=;
 b=Xykk9j9f5yCBiYL8VeOFVfum2xgTNos0bg2P4aaApJMrLCBW91EJIuzKVbeiuFHCdm+D
 AuBY+L9qckSzL829vKpAEe/+C6OiJPLcz7m5Vc61CMjrGURvzcr5kxSvKw6YUAZTQvPi
 S+nhATMHzE1YDMgHhna2eK7HEewoGG/lavsln3FFhefdPj9BK8e13f4VjPxslwvr95nH
 9jTP3DBMvyMqEZNY2fCJd2p3aP8xTERW1r5Z4zeeIICTjipdZRHJ/90sWoX65YPdMl++
 SZqhX5PnT/uMNhajXs3j/NP4Arj5Q6SeH8gUYYsIRLv5ocucEl9EAIv/q2cZ4oZs1qqi EA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxy3mtm08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 08:33:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMblhWgIoQFaMPg5yPfMbkUfNSTTBuEa/UEvxGJ/VSA2zdJOYJboS8H6ApQ86m8on/JxcSh66a3LVhZCOvg7pehk1+m+xE3NPRsafwC566QqEPVaSgEzVtjy1+XSkCkeaneFoLPVR9CkWyzV7yJEahG4b+7fcGBs9z8MLdd5K5ZnuYeBMfbDRITPy5brU3T3hAgVvVy1VoFrGyGQhLp2Yn28B2yBfKTtz3mF3jPE78poxedsmx1+qL3x0UGAe7BUPL97VlKDFYL12+PRUYQi0N2eF5FVxLx9C90i1koeUVTLa4bC4F/OnlUOWobkywi4btEhuPdenf91vL9agdYQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFS8Luzt8OVnpAlLrjy0Ja0nHqG2UBUgi4D9UdHAg9U=;
 b=hjJX1Cc2TDqFamIae22Z8BbFHQcZ7/b0PY/dwy8EBSLbILm0vxCk0O93sEKi6vA+Q95S1EPBO6NPu/TjE/HBcsOqO4X33EOs0MMYNTK2D3J9kCcgqdBfSRRNUBFRpErI2SHShEvTrfoNGwLtbIx3NQUagJFWlQPsw0y6Tg2ToRB5lzC0yTYHq6Me4RsM6Rjl+QTE+iXRG4W5FeCW4MISwF039YPYCHjf87aFPqDsJXsAhB3nv2h3797YGqTuaNd3zf4iKzho1GtdsIlgGCpQFuWvjY0tpB1FRpYIu3MXX2hF79+uf+P4cvmhkoMhxdLpQsfYLqzOoBnoCq+MmjVKiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFS8Luzt8OVnpAlLrjy0Ja0nHqG2UBUgi4D9UdHAg9U=;
 b=iorNSoj3S7LwB8yhTVCmzl1ZqJ/b4Il7ddgWkyrowBFdIO435gBinkwgVYyxlBIpHRqxrd0YRFntrvGg6KViudA3yeUkFMuXzmRKEqjQ2cYgoaekDnS+BW+w+u/diIGetEwsvvvnGV30zni0+wmNpM/xmB7Go2rnOIdP3N+SPCuoRuPp3iW3PRLMXN3AQdH43cQpDD+H+a5EfefreLHb1U1LSkMeW8XX8Smb8oNwA5kvZU44UYweBfqh+Y3kCPLpG3szNYwTZOyxWFcrq/kBmrslrM2GIaSbmP6O0aryb5lklCLxal+dL1+Rc+9POqo3R+9u5k3DxtIx5lOgwmvfvg==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by BY5PR02MB6534.namprd02.prod.outlook.com (2603:10b6:a03:1d1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 16:33:17 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5857.017; Wed, 23 Nov 2022
 16:33:17 +0000
Message-ID: <94466179-dc5c-6fd3-c7f5-0aae610c754e@nutanix.com>
Date: Wed, 23 Nov 2022 22:03:10 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v4 2/2] migration: check magic value for deciding the
 mapping of channels
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
References: <20221123150527.24608-1-manish.mishra@nutanix.com>
 <20221123150527.24608-3-manish.mishra@nutanix.com> <Y35BoSi9NUmbFoCk@x1n>
 <a1711169-fa57-ac54-33c8-4a30631f0486@nutanix.com> <Y35J7QC4YYj2bSyl@x1n>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y35J7QC4YYj2bSyl@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::11) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|BY5PR02MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 8974b1b4-6f44-4ad4-b26e-08dacd706cd6
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iDN75IPW2Gzo/SnUgdASgLCkyajEZ1D9QXDNF03K0w4ro0GUt+pwxJY1nmEP9derxKwcb3E7nqsn2sxJsFdOn8t72gSjIFZevKghyR9BFfsCTWCFSW1S4wjU9bk1Sgr6kZ414QKf3YyhQFEsK0H382AmhBC+5tzBjqa+/hudAHOT5dqf7hLUBKb1A0CTpgGV6Hju1w/iB4AO7A6Xr4R/DkvTsWR2//2ZiYBTyaaK3c4yhR4KnY2x6470yA/piMyuI74PUwA/dpC2LsEbga3D3GYSVHisvUgJraZnV0/uTcuYBJkRasR8YdRBteYJd5wkySA3wwve+11iBGshTiOqCsKRpzGlNiGZWXWT1w9Y2tTX+ZE96WBJ8qLY3nZ7SAUT+VFpTVpSjr9nqvNOWwxuYbnyuBjr57qix88K1XcZS35tjdARgNZLa69yiiv18XWyk9cGujWztFnhlLs6+/98mjSY9E+zlZetAYpIXgYhgOWNyhvtvAgp6eGCZhy6tYwDN0Kxh1Z5r6/gISPkM3wVh+VJlxaWpGgocE6CRCdrixsJvZh6DrgYBiDjpOnjS2NJ8muXQGFvj5nJbwjyL4HO1ETS01JL9Bj6AeDXrq3hRV3X1Wtri5PlH9JZsAW5l+v8M+NxDloEvzWRZ83sdGT7VxGN3wdb5Ei5A5LE7J2t+uWKIeHcCN+drzX9DyKdq5Gss1wzO6Nru/j3hf5qTjSUph4A+wOP5zyhsXiD5X2ens0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(39850400004)(396003)(346002)(376002)(451199015)(31696002)(8676002)(53546011)(6916009)(8936002)(36756003)(66946007)(6512007)(66476007)(26005)(6506007)(478600001)(66556008)(6666004)(316002)(38100700002)(5660300002)(4326008)(86362001)(83380400001)(6486002)(41300700001)(31686004)(186003)(2616005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEtPVjdiTWZ6ZFhYMFhkb3NvRWhHL3RseHRYTU9QQXZ6aEFoL1Nad0lFalRk?=
 =?utf-8?B?UDdrRWlha3c5T1lIUENic0xhdmpjeER3N3lHL1FjbWhHczdBSlQrVDVhNytX?=
 =?utf-8?B?RXFxOFpGTU94UmhhQ1pkZDZmL0UvaTFOeURCOGNXd2RmY1JwbmpoR0VwV1FU?=
 =?utf-8?B?ZUx3djF2aWJYOUdPZUh6NUswbXRzcnNIY3pMV0xtOUVuQm8xSWJudUtBOUYv?=
 =?utf-8?B?M0l6VzYxbjVnV05TaHJ6ZE1ScDN6blhYZE1WeDg1L21LczhkRUppUkVyLzY4?=
 =?utf-8?B?bVlNS05UNlZ0dUdtYnhreG9pMFVvNk8vc3JITkxkYmI0KzQ0VVllWkR5aDRq?=
 =?utf-8?B?eE5IdWs5UFBLV3VBYXprV3NIallZNDB5Zk41N3h0SXhySkxvS0FFTlRTd1RF?=
 =?utf-8?B?bXQwVkFCN3ZGWnFPdlFmOGZTaHFsVm8rZVJDcnRvdWt5L2Uxa3BqUloxR1Zh?=
 =?utf-8?B?YUJySG5LSEE5eTR6TXFEbVdpMXBWZ3BlQ3UvYW5rd3pza1VidVhjVW83WVpw?=
 =?utf-8?B?N01QcDgzaGdXUVQyL0UxQjgrV3RKd1hFeUNyY1VBRkJOL1FYWXRQZWpRdmdS?=
 =?utf-8?B?d0F1YmE0M3J5enl4aVhXTVlCb0RKKzlWUk9yeHNGODg5VitRK1dxS043Q3p3?=
 =?utf-8?B?K3ZtL3Z3UHF6MlpJaTdnTm90eU83OXZkT1U0ZVRMTjRSR29tRUNNblBTcXpO?=
 =?utf-8?B?am5KVmV6ZDNlcE40ajdsbWlrUmdWL1pDazFqbjhRVlljY1ZGRm9sZmtZcEp3?=
 =?utf-8?B?OHlkZGUwWU9NU00rMytZVG1PVjJsNHZDR1QweE1UTkNaZkZUL3F3SE5TNEVr?=
 =?utf-8?B?eDEzbGpuUDh6eUgrelkrcVdaNTRuck5JcG9nY3diZkR6bXdhOUo1WkkzdTk5?=
 =?utf-8?B?bGlRc2xVY3FGdWNoUWNCaWVmdVFIUjNzQ21FcTlJL1h4MWh0dDhmOU1qSXY2?=
 =?utf-8?B?NFl2TFkxZGNMdGYvcDYwZjQzZ3lnLzRTM0JYVEtUTUNGWGRPTE5NZVQ4Z0dT?=
 =?utf-8?B?Z3J1Ykpmd0g4R0dQREdmUG03TTI5b1hEVDlPTWkvaHlxcVc5cnFjak5uMm9t?=
 =?utf-8?B?TXBQc0s1WmxmY09FVUdvL1JpTzBua2svMUFid3ZxeDNNZ05zRVZta2ZmRW0z?=
 =?utf-8?B?NTdqNlkrREFqOFNlNGxEWUxlTW5NQmJSMFlHcUFqTDZxQytubi9wN3gzRGVi?=
 =?utf-8?B?N0o2cFF6Y21SQWtyeVZOeVdESTYyekFQQjNXQ1NuNkVvMDNGaVl2ZWluSi9k?=
 =?utf-8?B?azZjQ3BGQmpVNytLbUdXNDhjcU1wcDJCb3F3MUZZeFUrTkN6N2MzdXltTzlK?=
 =?utf-8?B?L3ZDMWV3eDkyaTdUdWZUWjdtWWZ0NjVLNGhRQ2x0dC9HL3pEb0tFdGdMVGI5?=
 =?utf-8?B?TlErdDJmZ3JaTHRXWCtETThmeWRxeFgxV2xZV3dNU0RvVTBvNGM1dWVqVWh1?=
 =?utf-8?B?ZTNYQTVReVhYNTV6S2VCUUVEUUpqdHd0TWk5OXJXSHpnY0toOGhxamNnemR6?=
 =?utf-8?B?UXBqVGtQemdyN3JKOW52OHJ2aUppUThWNGVjSkh1WXdLQmJKZmViWnRKSm5M?=
 =?utf-8?B?dGpKUzkzbUhkQ0JDY0JINCtNN2R1VDFvMm9uUmNlRndaRlQwMUxVU0pyNUdi?=
 =?utf-8?B?OGxJbTFnRnl6RHhnNWJIaVVQU1YzSFVjRjlwQmoydit4Szg0SU5kMXpYNGZl?=
 =?utf-8?B?S0tJckUrV1RLTUxGY1V5alhpQVFoay80VVhmRUZFSUdma0lTVHdVYXhiQUFh?=
 =?utf-8?B?MzhsMXBidUlhby9URXBGL1JWYzFhR3hHbFNsRjI1QVJNQmdmU0c1MkoyMFl4?=
 =?utf-8?B?MVp6QkZEV090UzFRWjhJeldxTEY2UDJ1WE5OSEY4djZUYnJaQy9NbVZGM28w?=
 =?utf-8?B?WVoyTzN0Yml6U3R3YnNFUElIaDNTODlxa2xvdXA0OGpDMnI4eGRqcWRaNzMr?=
 =?utf-8?B?UmdESHlLcGlKM2I5cUhIbjZSbUNDYUFHczgrbmNSM3AyRVlqd2Q2dVFwRWhq?=
 =?utf-8?B?aWFCd0h5UUtSSlRmMFRuTnZOSkgzMnNUcU9VMGNCeGUrYkVISDY5c0lCaDVQ?=
 =?utf-8?B?dnFaWDJPUjY2cG01RzhHbTc2UE5icjNDYVZiUVU2UEkwMVFOUGtTK3VwblNP?=
 =?utf-8?B?eG00SS9wbEF1THBQaElRNm9JSC9KZEtsQ3JsZldCb0kyL3JrL2toREhPQ2or?=
 =?utf-8?B?WWc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8974b1b4-6f44-4ad4-b26e-08dacd706cd6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 16:33:17.3949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfxGyIHso5+5t6UKHwiJSoMAn80MK3bRzcd/peyJHJ0Wvi2WDNzw2knb501Veo2JXxiD6cJV8/Qoaz1YQuKbBJFZIWWIrrfhldDp0mOSA8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6534
X-Proofpoint-GUID: Ge5DxGzJMFqB82FC_rBf_fBzdRRN3rpP
X-Proofpoint-ORIG-GUID: Ge5DxGzJMFqB82FC_rBf_fBzdRRN3rpP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_08,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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


On 23/11/22 9:57 pm, Peter Xu wrote:
> On Wed, Nov 23, 2022 at 09:28:14PM +0530, manish.mishra wrote:
>> On 23/11/22 9:22 pm, Peter Xu wrote:
>>> On Wed, Nov 23, 2022 at 03:05:27PM +0000, manish.mishra wrote:
>>>> +int migration_channel_read_peek(QIOChannel *ioc,
>>>> +                                const char *buf,
>>>> +                                const size_t buflen,
>>>> +                                Error **errp)
>>>> +{
>>>> +   ssize_t len = 0;
>>>> +   struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
>>>> +
>>>> +   while (len < buflen) {
>>>> +       len = qio_channel_readv_full(ioc, &iov, 1, NULL,
>>>> +                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
>>>> +
>>>> +       if (len == QIO_CHANNEL_ERR_BLOCK) {
>>> This needs to take care of partial len too?
>>
>> sorry Peter, I did not quite understand it. Can you please give some more details.
> As Daniel pointed out, I think if we peek partially it'll go into a loop.
> Since we shouldn't read 0 anyway here, maybe you can directly write it as:
>
> while (true) {
>    len = read();
>    if (len <= 0 && len != QIO_CHANNEL_ERR_BLOCK) {
>        error_setg(...);
>        return -1;
>    }
>    if (len == buflen) {
>        break;
>    }
>    /* For either partial peek or QIO_CHANNEL_ERR_BLOCK, retry with timeout */
>    sleep();
> }


Yes, got it, sorry, will update it.

Thanks

Manish Mishra

>>>> +            if (qemu_in_coroutine()) {
>>>> +                /* 1ms sleep. */
>>>> +                qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 1000000);
>>>> +            } else {
>>>> +                qio_channel_wait(ioc, G_IO_IN);
>>>> +            }
>>>> +            continue;
>>>> +       }
>>>> +       if (len == 0) {
>>>> +           error_setg(errp,
>>>> +                      "Unexpected end-of-file on channel");
>>>> +           return -1;
>>>> +       }
>>>> +       if (len < 0) {
>>>> +           return -1;
>>>> +       }
>>>> +   }
>>>> +
>>>> +   return 0;
>>>> +}
>> Thanks
>>
>> Manish Mishra
>>

