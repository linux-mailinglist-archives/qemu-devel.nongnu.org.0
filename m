Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E055269A4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:56:17 +0200 (CEST)
Received: from localhost ([::1]:33970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npaSW-0004Rs-2U
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1npaQP-0002Jk-Ni
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:54:05 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:64272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1npaQN-0005dL-0T
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:54:04 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24DBxFW4031831;
 Fri, 13 May 2022 11:53:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=BRh35nDwwsZn29Tvb+bvcZvnzvpNNfeOrACPO1BFet4=;
 b=Sq/nTN2nRvSBPz6DeaTxd9QyRyStw35YlbbHHmkIGRlOuBZNd2+k5f9xyC/a1Sl/7fuK
 XrM4gLeuiOsLpK+AR2rzaFCPkdMp8ugrz8oAvSqMi7+grcg8TGijMOdECvr0qb9cYUnz
 KJ57Z6DsB/K8KZuMOx60Vqkm/biv7ZcBYO+17Rlt6tMRKKZ/oI/8p2ad7CE+jfsUf3U9
 +uaf8WMfS+5Xa+XyQZOIhq+WqP7fhQ3CxuTb0j8P/k6q9T1KRivTPo+ImVhAwJmN7cFv
 PT+7eQ7oH5Y8D90a7FValLq95icidIK+ejfuB7D946OIYINz2h+wln662oZu3XRiXMf1 IA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3fwraxnwh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 11:53:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DygiE5espg1HsxYe+tfco1FS61MQ7/k0qnmDuIIU8HZB0eytTPBVcEKQ+uqDgTma9UPjF+AmEaNNy0W27bn4gNh1ebbA3t9I6erQNCQpicJcddZtdu9drdvH5fA8gcdS8goS35NHd9hYUeMEGEX9RWfGK+P5XvofiQjZgufc00PzpjJqBWustsY/kljf123UZp5M9stsqs2z06X7dfUgxuUr1u2QFZJIAUz/hPr7gkQq8fRBCsuKwfcQ/Ea/xFgG0r0mGDCNgCTQwoNXct0jvuZKEPlRSBkXFg0Cs40qTNB5obtMT3pNDKe2fCDB+AfE9KZaULPROMuTeY2yPGKWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRh35nDwwsZn29Tvb+bvcZvnzvpNNfeOrACPO1BFet4=;
 b=jghfyjc2Vj6PihzTANzmEwJtmY2ElpxAxtS9ROaF4zfuweW3/PnWWIuU7NYUtMWPuqYUQHdjujJ4N64Ib2LJOs0YgMsQjyAEQE84TCYJfkd9F1k6WEhOqaFwGIDoQlBdwngYcMTW2ZgQDahGcpVPdW4HjgONPawR4n/59pZeI6LXkicd+mKaXYdDTgjkspwjxunnL3kNwJA58palNzbSMMsOgpRR4cEBGioAGHjLOMhvD3wkhn8ALhubc/1FAyxXYDpjxGsDX386Y3fwR4RZHf+eV9tHS1RZjdtVhNP6ecWnsmBORjEChJRg5mL6VZNSiAbSwus1r9Y4EREjaTIIYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by BYAPR02MB4919.namprd02.prod.outlook.com (2603:10b6:a03:51::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Fri, 13 May
 2022 18:53:55 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b%5]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 18:53:55 +0000
Message-ID: <734316b2-df50-83e5-7b5d-b2fae8f871a1@nutanix.com>
Date: Sat, 14 May 2022 00:23:44 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v4 10/19] migration: Postcopy preemption enablement
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>, 
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-11-peterx@redhat.com>
 <b42e7619-7ba7-6933-b4d7-b67b06704d15@nutanix.com>
 <Yn00O5Ag2nPLZEyq@xz-m1.local>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Yn00O5Ag2nPLZEyq@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0091.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::31)
 To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71c03556-028b-41ae-1996-08da3511ee1c
X-MS-TrafficTypeDiagnostic: BYAPR02MB4919:EE_
X-Microsoft-Antispam-PRVS: <BYAPR02MB49191D960CCC634F6F9D46B8F6CA9@BYAPR02MB4919.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pFJwqxj4IGZYVBvktL76UL2NojHUZgaVw+SyAPyGNCXJLldzM4b1ZHCctz084y13VLkKDIYKJxZ4UzjLcdjkLou+a8mRtulRCKoe/jdY99Ni7dW3l0KVt8VlYdkWJVobFu936xCNudRcxn8CgF64ui4is9HEjehXFwyD9X/7lpQiys1cHfHHPYW+x9RokeOqdaya4Egl+xVRRBasIsACEZ5O4YopSqOlhafwuSHJfhZmppXofhmJbrjoZPTz0VUgBS8bYBCLzFDKk7r7ZDTHC5nGSM3dXiU8awOSJlcLT6P3vOJyIINatgAgJ5BWzYzs5gW753CE0XFsMgAmL5JGO2KVlxPfbKKlQyJ5xP1OANY0qs2/kJj1DROEb0V4gzzFFU1TiPqpWg/kqBCmF2FHxEo9bIXjN+nuyikDeNtiOsRvNq7YbhsGyoAoScVzV0NaPHZ8IXfoKuT7Q8a+q+luxuGo/RbtjCJO4pOaB7KrDIgwG3RREcdY72hf1SGxaTBRJYp5mGF+SWWrNbgKnMGXpEcYh6xccBrDy1DTF36LOcVCQkXsygeNdFkBjQmVx5h0RsodxtLR5V3eSW8ibPc8Iy1rFM1sJSFiq159cySEsmmrTAXsq5oPcWC35kWWFDtNlm9d1Q7Ua5/jh6aMkoMC6hfsPp6JwA0vdfoJjv09bPYvi/ZKhOUI6K6qZFQhUwALcyHLf4rFVwB8g7Q0LxS99qmxFkHXS0gLcoQelCrhXLc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(5660300002)(316002)(186003)(6666004)(36756003)(2906002)(26005)(83380400001)(31686004)(2616005)(8936002)(38100700002)(53546011)(6512007)(4326008)(8676002)(6486002)(6916009)(54906003)(508600001)(66556008)(66946007)(66476007)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXlSM3hkMW15ZnZIWmh6L1RNTmdtaGpQelY4b2xCWEdwZS8wVjFra3VQbE0w?=
 =?utf-8?B?a2MvSnQ4NjRKUGYzUHdxZHp5OU5ISjFEMW5sTlFnd3lZVG9wRWlUVk1sRlN5?=
 =?utf-8?B?bFJOb2pBd0k5dXRWbkNoRjkzU0cxbWtKYUlRZkFKUVQzZDJ3aFVSS3FUTlE4?=
 =?utf-8?B?SGczNnNaMUYvcXZFWEZXT2JrMHdRNXgraTBJZHAya1hIMGQ0VnJ3VWlIS0Jp?=
 =?utf-8?B?UXhHSU1sUzZ1MUdjNWRvSEp6czYxR3U2NXlLcC9zd3E2YU5KZEdSM2ZtSGZN?=
 =?utf-8?B?VU5KNzZoY0xSZS9jSUxhbU01aXpGUCtTZE03dVRJclFTSndqV3dKWkxuMHcy?=
 =?utf-8?B?TmZFb28rK0pJY2tQMXRKWWNjVG9JM1F3SUt3aFFJdndvdDdrOUhJeFNaWVdV?=
 =?utf-8?B?TGhDSlB6SURhR2N4TE4zZDJyVEI0T1g0cXVnNTUrOHBJWG12SnlBUStQT2ly?=
 =?utf-8?B?STl4VDQwMjB4eUhNbWV3czJWRzI1eXp4Y1ZXZEpQZDdIS1A4MjdOTE1CeXZp?=
 =?utf-8?B?YWI1THE1UU84b2RNSmZJMytJZ0FBME9uNHpDUzd0emFQZk9QUE4zMGt4eS9p?=
 =?utf-8?B?TG5iaTRwK3g5eU4xQW10SGFSMG1jNytkNndaSndrNGNzVzBEd3lNWXJRTUtz?=
 =?utf-8?B?dHpHUXRaQnluRUtlZGxGc3lrT3pONGdtd1dSbzNBY2I0cG9pYWNDVkNtaVJx?=
 =?utf-8?B?c1lEcHlTbldVcTVuTndLWWJQdVpNdU5IM1ZQeEVMV3JUdVRtSDdxTmJUMHhB?=
 =?utf-8?B?MEtjcHI4Zm4zNGQ3SEJwYUlFWXpQbjIycFR5RlV4UzJldG82ZkpJdW5SNHBy?=
 =?utf-8?B?WVBNZU1DbGx5cGV1NHJ0QlhwMEtOeEZTQzBkcTZjOS9yR3ZZWVVOQWVHU0hY?=
 =?utf-8?B?WWZ0TXpkOGFjVEEyc1JYamFZeXo1eWo0UVdGaXMyZldrb2d3UGxOMnd4ZWJI?=
 =?utf-8?B?cUJGNEVsd1YzV1A3dkFuYTAvQ1QxVmJ4ck1vbGt1RzNGSy9JMWJLVHpnd2hJ?=
 =?utf-8?B?eVBGMG5SLzVEVGZ0bVFlTTR3K3BHTDkxZ05jUmQ4eVNad3VGelMyaTl5M0pO?=
 =?utf-8?B?bVN3bktWV1Jyek0zenZBdytsS2lGTmJTeExLeGdHSDdsYWFjT0dzZWpOU0Z0?=
 =?utf-8?B?bjhFMlZPMEpsZE52TzRHM1JPMU1wSHJ6amx0Q2M2YlI3RFJ1WDA4Y3prMzln?=
 =?utf-8?B?RDEwcG5hV2VTUTgxb0s5ZU04SGh3bGVRT0dRQ1JNUUk4WmZyU1hJUEtBNGZE?=
 =?utf-8?B?NzhOaDhxYXlVU1crR0ptaFg2cjFRWER5Y3BtWXk4ZWpsaDdQMm1iUzRLb0Ew?=
 =?utf-8?B?bGMyQUN0Uk0vYWJVcExVR3gybXJnaVVaWlVNSmVPU0ZxZnYwZXFnWWJjWDhh?=
 =?utf-8?B?cVp5WkhmTEVBV09rZDA3ZjMzanhPdDJVc3lRQzBSN2tGOE1EdkhpN2dLQUZx?=
 =?utf-8?B?VnI1UnRzU24yWUxpbFpaS0hIaGxOOVJLRkxQaytFZEIvQURiZ0M0Zmd6VlVG?=
 =?utf-8?B?K29EY3hIbnlIK3hyV1lsZTB0UlFIR0hZS2hpWWZaYWlPZEd6c0Y5eEpuekhz?=
 =?utf-8?B?dVg1aHdrVzRIWUpvTDN5ZFBTR0owbGdZakJpMVRhM3dCM1l1MFA0c3pZNmJK?=
 =?utf-8?B?SW5aZ1A1Y2lZRHExU2hTcDV4YU5EUzhmWThJSWFabmVwNWFaaHdVaEpnY05S?=
 =?utf-8?B?WGpUTHhwemdmb21wUlJIRTFwMmlWRURyblhWcEVuSzFDdmFFemdCeU42OUxJ?=
 =?utf-8?B?bjc1aEczZldvZ0o2K01vRTE2NlNxUmc5Y3RmTGU5R203eXVJc0FocDZ4NllB?=
 =?utf-8?B?cnNyWDRybFlPdUFPK2N2cmZFUzNBUUg2TWRnQTE4OXVWaitCWGQwT0I1R0tE?=
 =?utf-8?B?eHRzZ2wvaUZNRDNwWWJydjA1eHZMQUJWNUxsY1o2d01YVlNhMXU3U3FscUUv?=
 =?utf-8?B?VnlIWUIzM1QzNVB0QlRYN3hRblpuU2I2VXZEMS92T01qd24rT24weGQvblZD?=
 =?utf-8?B?WFBxMGdrM0NPZVdjNmZOcmtUNXZNaEZHakl6K1NYNFhRVGc3Ykx3MjE2V2hW?=
 =?utf-8?B?YkRGanhmMVdIU1g2TzVRZVQxUGNBNmphTFB4WXJ4QkpVSndZV2xPMk1peFFl?=
 =?utf-8?B?NGlIWjlkbVFBSjNQVjFIUURWK2pWVG1TYzVkbi9sbGIyT0k5QnVKdXJqU2p2?=
 =?utf-8?B?dWtKUzZ5OEZJY0o4azFPK1d5eStOTis1Mi9FbE4yQ3E0RnFPLzF4ZXR5Lysr?=
 =?utf-8?B?RjlBUlZzMTc4VnV2TUZmRld2K3Y4YUJSNUU4N3VoWnU4ajk3Ti9QbGNYZFFP?=
 =?utf-8?B?MUw0MXlEVTdPUk9WKzJKekdwUzJBRnBYTUNWdTMyQmgxMGdERVo5YlhKU282?=
 =?utf-8?Q?Qgq0sy506CNfHUWE=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c03556-028b-41ae-1996-08da3511ee1c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 18:53:55.5330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJkFI8ts8J7etcDCrx0wByZK5tNMLzVi1h0IGibCvZNFXpnHKknT1Z+I26hOD5wIYJZQz+NOTM+/1aY00tTXeiFbEpoE5kDG8cVVQLpKcWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4919
X-Proofpoint-ORIG-GUID: LUpZa-JSSN9eoznJjbHNyBV3-ENpgGHM
X-Proofpoint-GUID: LUpZa-JSSN9eoznJjbHNyBV3-ENpgGHM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-13_11,2022-05-13_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/05/22 9:52 pm, Peter Xu wrote:
> Hi, Manish,
>
> On Wed, May 11, 2022 at 09:24:28PM +0530, manish.mishra wrote:
>>> @@ -1962,9 +2038,17 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
>>>        RAMBlock  *block;
>>>        ram_addr_t offset;
>>> +again:
>>>        block = unqueue_page(rs, &offset);
>>> -    if (!block) {
>>> +    if (block) {
>>> +        /* See comment above postcopy_preempted_contains() */
>>> +        if (postcopy_preempted_contains(rs, block, offset)) {
>>> +            trace_postcopy_preempt_hit(block->idstr, offset);
>>> +            /* This request is dropped */
>>> +            goto again;
>>> +        }
>> If we continuosly keep on getting new post-copy request. Is it possible this
>> case can starve post-copy request which is in precopy preemtion?
> I didn't fully get your thoughts, could you elaborate?
>
> Here we're checking against the case where the postcopy requested page is
> exactly the one that we have preempted in previous precopy sessions.  If
> true, we drop this postcopy page and continue with the rest.
>
> When there'll be no postcopy requests pending then we'll continue with the
> precopy page, which is exactly the request we've dropped.
>
> Why we did this is actually in comment above postcopy_preempted_contains(),
> and quotting from there:
>
> /*
>   * This should really happen very rarely, because it means when we were sending
>   * during background migration for postcopy we're sending exactly the page that
>   * some vcpu got faulted on on dest node.  When it happens, we probably don't
>   * need to do much but drop the request, because we know right after we restore
>   * the precopy stream it'll be serviced.  It'll slightly affect the order of
>   * postcopy requests to be serviced (e.g. it'll be the same as we move current
>   * request to the end of the queue) but it shouldn't be a big deal.  The most
>   * imporant thing is we can _never_ try to send a partial-sent huge page on the
>   * POSTCOPY channel again, otherwise that huge page will got "split brain" on
>   * two channels (PRECOPY, POSTCOPY).
>   */
>
> [...]

Hi Peter, what i meant here is that as we go to precopy sending only 
when there is

no post-copy request left so if there is some workload which is 
continuosly generating

new post-copy fault request, It may take very long before we resume on 
precopy channel.

So basically precopy channel may have a post-copy request pending for 
very long in

this case? Earlier as it was FCFS there was a guarantee a post-copy 
request will be

served after a fixed amount of time.

>>> @@ -2211,7 +2406,16 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
>>>            return 0;
>>>        }
>>> +    if (migrate_postcopy_preempt() && migration_in_postcopy()) {
>> I see why there is only one extra channel, multiFD is not supported for
>> postcopy. Peter, Any particular reason for that.
> We used one channel not because multifd is not enabled - if you read into
> the series the channels are separately managed because they're servicing
> different goals.  It's because I don't really know whether multiple
> channels would be necessary, because postcopy requests should not be the
> major channel that pages will be sent, kind of a fast-path.
>
> One of the major goal of this series is to avoid interruptions made to
> postcopy urgent pages due to sending of precopy pages.  One extra channel
> already serviced it well, so I just stopped there as the initial version.
> I actually raised that question myself too in the cover letter in the todo
> section, I think we can always evaluate the possibility of that in the
> future without major reworks (but we may need another parameter to specify
> the num of threads just like multifd).

 >because postcopy requests should not be the major channel that pages 
will be sent, kind of a fast-path.

Yes, agree Peter, but in worst case scenario it is possible we may have 
to transfer full memory of VM

by post-copy requests? So in that case we may require higher number of 
threads. But agree there can not be

be binding with number of mutliFD channels as multiFD uses 256KB buffer 
size but here we may have to 4k

in small page case so there can be big diff in throughput limits. Also 
smaller the buffer size much higher will

be cpu usage so it needs to be decided carefully.

>> As it must be very bad without multiFD, we have seen we can not utilise NIC
>> higher than 10 Gbps without multiFD. If it
>>
>> is something in TODO can we help with that?
> Yes, that should be on Juan's todo list (in the cc list as well), and
> AFAICT he'll be happy if anyone would like to take items out of the list.
> We can further discuss it somewhere.
>
> One thing to mention is that I suspect the thread models will still need to
> be separate even if multifd joins the equation.  I mean, IMHO multifd
> threads take chunks of pages and send things in bulk, while if you read
> into this series postcopy preempt threads send page one by one and asap.
> The former cares on throughput and latter cares latency.  When we design
> the mix of postcopy+multifd it'll be great we also keep this in mind so
> hopefully it'll make postcopy+multifd+preempt easier at last.
yes, got it, thanks
>
> Thanks,
>

