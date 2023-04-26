Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA1B6EF36A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 13:28:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prdIv-0000Xz-Vk; Wed, 26 Apr 2023 07:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1prdIs-0000V4-23
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 07:27:18 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1prdIo-0004eP-FE
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 07:27:17 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33Q5Ytj9013428; Wed, 26 Apr 2023 04:27:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=FrzWrJj3VBUYifhhgMFplbof7X89FBHRf1NxD9KXF84=;
 b=C8QdQ9g+l74+jXAfrHPCYFJE4h7Kduhnb5I2Wm7EVcrPfqt0iJFto7ZIlI02l0a5t7rO
 WNVIDnCEU4qf4NmWze0SZX02amHH25+ki0jEUAnettU9V+QITO9+f4b4OZY752g3alBo
 qRZa2rSR/Cpz4ni0PSmw71h0JmhUqCJTL7+WTe7MI/dHTaQMKhGP+swzU8vXljY1r26w
 77GPi/PSUjqyKZRCnH2Mc5Y8xxJC0N+RLNvqUb6PJFIf3LF15fZzKXIMnIdwQ05eW1do
 1jDAyvILfOaDwGdZb1ZbaKbol3YhEzQFkf2jeMgXeyQvA/yK2rbyB2moGm3d9WbBo4e+ yA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3q4bwv1692-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 04:27:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUozjmpgob3Gw3fMHI71JRAa2Yv7pqD+rjh33jml0K/ga5IJhj3RsBlrwF+PTykG8xqzO3pEJtiQAejoqmVPtPhCRrATw+CyRCADiBmUZgoqxEMrya4E4GZ0rT5SK+suh99SaNnBjV0aOKrZFwidBcYdmjqnhQYEpN1ZDiG8QP0apzoxjMZa4WcivCMicXUS4RmOp0Fe8jSNQ/yLfmrdXWjDMTvCEdoecadwcjp9MzhFBTFo6gktOycdlQj0g9REGq+3Ibbx/dFB26lzLANWj7LiJhhHpoemfusn1WVUzjgLWXmhG39nzzuk4F4I0/iBzPOoKwWWNF8Np+HOOQYjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrzWrJj3VBUYifhhgMFplbof7X89FBHRf1NxD9KXF84=;
 b=nK5gsb3HTsxn4U/qG0wNHB7n1C+Ic1fbvfLkQssYSgQFQxDV+e75yFNIe7KfWL0+Av5Z8/rW4AKSuQ2u59be9EF24MreLrYvu87BVwbcNHpIbinN/Vt6Ai8wKJAvaOG/SQlhyC8b9FQPUp+b2+0M4WCTJ7iW7g2XC8HKhdSPuYN9mgVtR7ae9s09kmXIgh8vfeiLKldECQer8z5q9SeVhRz7TTuILACMhDWPcxERistKVKhTP5uB4GsN3ig3qcHtmPqbwSINa2t0FyilTowYRJwFDsp4jqnFxpotumZVRZHt4vpRTxitfU67YmM3C3E5fxM6dLpleIk05M0yPDaRIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrzWrJj3VBUYifhhgMFplbof7X89FBHRf1NxD9KXF84=;
 b=LdbNKAsruFy1gZ/elLcY9EpIfcbZTnQAZMFLuXrx8m8NgUhX9NYaDcdhduG2vEfaxuldt+jaZ4WTLU1lMkZyIl7AmYVrRRPpqCL5+QDQb9OctqeWRifP2HxmKpvHsLMH7oBep9QccNypwSqzrDCst75C0pa6xTFKQG2S5N+fesL3OERDL/wnSQoqFRxDyfHX1ZobgFGBzVLj8OnINc9pF+EKbYBhr0SYw6fj1aLNJB58t2VWmkMgQ2kwwUzo6HH3YcsjFHMGPNAFv2a5WWOnqBpFsKOyLPNypLC9f/3u/5a4KoICRlY6GK5A0RjfGLYtz0rKO1PIXP+kvpR6MACIMQ==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by BY5PR02MB6627.namprd02.prod.outlook.com (2603:10b6:a03:203::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 11:27:09 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::f2fb:d9ab:6983:b2be]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::f2fb:d9ab:6983:b2be%7]) with mapi id 15.20.6340.020; Wed, 26 Apr 2023
 11:27:08 +0000
Message-ID: <82cfd4b3-fbea-b147-e84a-d8d160088c14@nutanix.com>
Date: Wed, 26 Apr 2023 16:56:58 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] multifd: Avoid busy-wait in multifd_send_pages()
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, berrange@redhat.com, peterx@redhat.com,
 dgilbert@redhat.com, lsoaresp@redhat.com
References: <20230425160555.67373-1-manish.mishra@nutanix.com>
 <87v8hjey3b.fsf@secure.mitica>
 <b87ce3c6-6426-eab1-95ef-d02eb83ab9ff@nutanix.com>
 <87pm7qgazb.fsf@secure.mitica>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <87pm7qgazb.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::11) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|BY5PR02MB6627:EE_
X-MS-Office365-Filtering-Correlation-Id: 15170fc6-0328-4477-d30b-08db46492bc6
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Bm9s37D2FZfbDvnn250i5ayVXouzS20FV2RtvMLVhQRz1C14j7YWPDHPbh18n3FrRc+lorEES+7hsihfLgt8dYb1hB/Oq1OOVYe37Xpe40FHR8x990Wk69tLS9ecZ5aAuK5EeGF586qGmq4pFvWoWYf0uEwhAJKrko9UBO6sJj2MRo2m8syhbwI0jkAMErX163HgfM7mR8hfzbFB1naCC0Bg2dd8AdaXNzSLG0vpqQ1mRcPR5GPNTf5znxxzuaKQzC/u7a3S88W19Ls0cov2mpQRn63CDikJmWhNgvucT+7qFKqYxb8qvOjFkZXTGvWoaFrZJEjsd9WPx6VSvoEuM3/1ctU3P88CiTX84WuijuOqRprv4+nzFe9gZo6S3WeufjJ0c9/HYivHXta1c7kw/bLY6TotRwMziznnB/c4aWAjGFAJlHoUxUVBs0EOgSTnYRh2KStqmxU8ToW2sKjawqeM+t4zZB4PL0T01FQut9cbTf05HIpkpYFLlqKo3KtmYpi3Dq4Tri7o+PusPOHh1TMSa63O511eVUDOk+9Rx6qjf96Cp7YJ0RWeWOoDULVoHQOY/XMw5lwaPU6EagzkY/E0CMErpzm4sgluDmMc7H7owwY8KrZuliXVN1mJa4KkHeqW6TMrQlGKL4xqUTY9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(366004)(39850400004)(376002)(396003)(451199021)(66946007)(66556008)(66476007)(316002)(4326008)(6916009)(5660300002)(41300700001)(8936002)(8676002)(2906002)(186003)(38100700002)(55236004)(53546011)(31696002)(6512007)(6506007)(26005)(83380400001)(36756003)(31686004)(86362001)(2616005)(478600001)(6486002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUhiNWQvTlRTU3kzb0J5bFhOV0VITVFjdXFMNWFzZHFQNFc0UDdUN2U3eDcv?=
 =?utf-8?B?ckN0bFJWbVdNaVJJN3VCcjdGVW1XMGltN0VoRHZ6T2ZKU2pjWDFlS0czQlhF?=
 =?utf-8?B?YkZRTkpxZDkxZkF6VWx3M2F4SU0zV2dsMFYwOHZHSTFZeUVaVlBzTnl4TmZM?=
 =?utf-8?B?N1hkVEUzc3NrcTgzcWhlWHdmT2toOTFtc2txQ293bWlDcjNQNmRzOHVWNENl?=
 =?utf-8?B?UnpqRElvOGxFTVRQNGtIKzIyaU4rSHlSV3k3a3dGbnowS2JSS09GcXhycEhZ?=
 =?utf-8?B?OE8rbGZSWlhGQUsrbXZVSFJKL3I0a3V0VUhIdkFGSmJEWmxnOXNqekhueUVv?=
 =?utf-8?B?ZmlTRVljZlVYVXd4RGdKUlpXNW1JSndHZE9mRktEUWVLZkpuYytOZjdRbTU5?=
 =?utf-8?B?L1ZMUzNURHFaWjBhcmkvMXhzSW16TDBSeGl2bnQveThGWEJSR2liVFU5UFNm?=
 =?utf-8?B?YXNzVVpSMzV0TUVBMjZnd3h2NC94VVo5NEhNZVlBMzhGakJ4SkFBOWRhaU5U?=
 =?utf-8?B?M1Y1YXVKTzFETWFLNFU2WGpOSWdDMitOWHZiaitTWkZxdjkvb2lUMlRTMkZm?=
 =?utf-8?B?QXg0NTEzSnM4UHROL1RteFIyZU0rakZFZlRTenVTWGwveFJDSm1qTi9SL1F0?=
 =?utf-8?B?L2VtcFdnM2pEVDBVNG94Zk53ejRaSmNHbFVmaEZRNXJIWkdDTUcrUVh0bTBw?=
 =?utf-8?B?WDJndmNldy90V0M4VlViVmlHSDYvUFlTR2RUT3BTQ2JtOUsxWjFhMEZPZVZT?=
 =?utf-8?B?MktBMlc4OW9TbDUwMGlLNERyUGI3MTJoZlEvU2pTT2pFSXdUOTVGeUxPUWhW?=
 =?utf-8?B?eGUyOWw2bjFxdml0aDZlbmFzVVJQVEsxWDFyLzROWFBaSjFaSENvR0FTa0Za?=
 =?utf-8?B?bVZFSnJwMERLOVkvanN3cnVkN2pKc0N3RE0xeG9XWStxdnZXNlRqMnljWVZD?=
 =?utf-8?B?YUJ0OWs3ZjdHMzBTUlZQeTh2MjBJR0QrNVBQTWpZYWdjay9ZNTBudXU4MTJH?=
 =?utf-8?B?bHBFeEk0UGdUTEVqM0tHUml6TVlCbjcvN0pjYmJ3Zk1iZnZ5cGREQ2tqZFJu?=
 =?utf-8?B?dnJHQ0ZrbzJWWFBBRjdHT00vSit2ZnVUc0sySUZuZzh5TzEyL2o3Y3pLWlZH?=
 =?utf-8?B?d2NCTkwvcnNoS0lJTmk2TzdFMUlOYlRoakN1cFFkdzNleTZMdWhuV085L1oz?=
 =?utf-8?B?S3p4M0NEN1hoM1dVcExrRW5naHJjT3Bqc1pYZFlJQWg0YTZrcU5sYVF4bzdM?=
 =?utf-8?B?bjB2dWJxbDFKQnIyN3BaaHgxZ3NIQ3BVaytia3l6Z2dsOHhEbHNZSHA0ZVli?=
 =?utf-8?B?SitkcjdIbWtJSHoxK3BOK3RnbFdSSkd4U2oxeFFQWDVlSDlmRkE4d0VJMUQ1?=
 =?utf-8?B?QTRtY1UyV1JUS2V4ZFFZbWIrdmt0QUVQN0NKbVlPSzF6S1dWR0gxejNFMmJI?=
 =?utf-8?B?eWw2R3FWZDF2ZWVqVythV1ZMV1czZ1Ntdit3YzBJYlc5aDNkRDI5Vi93RWVn?=
 =?utf-8?B?NzB0VFJ3NVFTeStFK2MxQmlPN203MFpkdHRMaklBS09WcVB5MFp4VlRIUWI1?=
 =?utf-8?B?dGp1Wjc4dWxXenRLS1ZyOWdkNnpta1FTd3FrYlRoUHQxYWE0VkFQQTdVKzYy?=
 =?utf-8?B?ajRYOWJlb1JMck9yRld3TUorUDNaelZtL24rZVBYQUdSdGtJRmhKL1BodnRN?=
 =?utf-8?B?RjJyOHFWb2w5U1ZZUDdmSUtHcUplaDN5ZHBlTE1LNVVkWWcwRmZTemxsVHlJ?=
 =?utf-8?B?SzBpUlpraS9RMjZxTzEyMDUrQWtoM1Nrc0pSQlk0cTByazVRZ0FWOTR5U0tR?=
 =?utf-8?B?N0NFbURGV3ZOT1p5OUtwdGN5bUllTFNCWVJXazdwUk1mb1BBVDFLYnlRS0Fp?=
 =?utf-8?B?NmdpRUhoRmd5MXBFN08vZUlEUUZ1TFBjQVcxeXdxbkZpKzI4Zk5zUjh3WSsv?=
 =?utf-8?B?UDU2RVFFS2EwNEp5RFN6b1JjYkxQaytiR3NhaWZRTVBaRGZaWmVGQkd1bDNQ?=
 =?utf-8?B?WVQ5bklqaG40UWxlVW9rWWlRZ29QbmFrUkNZQ1FkaHhWVWdUOUVPb3I0YVpQ?=
 =?utf-8?B?SWhYRGlMcVdEUCtaOXQrcmhVOS9JQm9HUVVEMGoxd3lFdFZQcU1wNFRYZm9W?=
 =?utf-8?B?eXB1VHJ5czFERWcwVEJGMHZSbUExcVpLWVlHdzdicUpoR0dmU1VBT3d4N2M4?=
 =?utf-8?B?anc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15170fc6-0328-4477-d30b-08db46492bc6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 11:27:08.7681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D6uBnzcEKLEg27OLFgMg0gMcuU21VaH4w+WFspmZicAk1bjnZCaNqLRu6cbgSYLCCyBgLdOo/EksVWV63xxsbvpNInC64LmeMpflcNVwCR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6627
X-Proofpoint-GUID: mqh379NJReZ1NkKkVB9j_xYpDSMHVAX-
X-Proofpoint-ORIG-GUID: mqh379NJReZ1NkKkVB9j_xYpDSMHVAX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_04,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 26/04/23 4:35 pm, Juan Quintela wrote:
> "manish.mishra" <manish.mishra@nutanix.com> wrote:
>> On 26/04/23 3:58 pm, Juan Quintela wrote:
>>> "manish.mishra" <manish.mishra@nutanix.com> wrote:
>>>> multifd_send_sync_main() posts request on the multifd channel
>>>> but does not call sem_wait() on channels_ready semaphore, making
>>>> the channels_ready semaphore count keep increasing.
>>>> As a result, sem_wait() on channels_ready in multifd_send_pages()
>>>> is always non-blocking hence multifd_send_pages() keeps searching
>>>> for a free channel in a busy loop until a channel is freed.
>>>>
>>>> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
>>>> ---
>>>>    migration/multifd.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/migration/multifd.c b/migration/multifd.c
>>>> index cce3ad6988..43d26e7012 100644
>>>> --- a/migration/multifd.c
>>>> +++ b/migration/multifd.c
>>>> @@ -615,6 +615,7 @@ int multifd_send_sync_main(QEMUFile *f)
>>>>              trace_multifd_send_sync_main_signal(p->id);
>>>>    +        qemu_sem_wait(&multifd_send_state->channels_ready);
>>>>            qemu_mutex_lock(&p->mutex);
>>>>              if (p->quit) {
>>> We need this, but I think it is better to put it on the second loop.
>>>
>>>> @@ -919,7 +920,7 @@ int multifd_save_setup(Error **errp)
>>>>        multifd_send_state = g_malloc0(sizeof(*multifd_send_state));
>>>>        multifd_send_state->params = g_new0(MultiFDSendParams, thread_count);
>>>>        multifd_send_state->pages = multifd_pages_init(page_count);
>>>> -    qemu_sem_init(&multifd_send_state->channels_ready, 0);
>>>> +    qemu_sem_init(&multifd_send_state->channels_ready, thread_count);
>>>>        qatomic_set(&multifd_send_state->exiting, 0);
>>>>        multifd_send_state->ops = multifd_ops[migrate_multifd_compression()];
>>> I think this bit is wrong.
>>> We should not set the channels ready until the thread is ready and
>>> channel is created.
>>>
>>> What do you think about this patch:
>>>
>>>   From bcb0ef9b97b858458c403d2e4dc9e0dbd96721b3 Mon Sep 17 00:00:00 2001
>>> From: Juan Quintela <quintela@redhat.com>
>>> Date: Wed, 26 Apr 2023 12:20:36 +0200
>>> Subject: [PATCH] multifd: Fix the number of channels ready
>>>
>>> We don't wait in the sem when we are doing a sync_main.  Make it wait
>>> there.  To make things clearer, we mark the channel ready at the
>>> begining of the thread loop.
>>>
>>> This causes a busy loop in multifd_send_page().
>>> Found-by: manish.mishra <manish.mishra@nutanix.com>
>>>
>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>> ---
>>>    migration/multifd.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/migration/multifd.c b/migration/multifd.c
>>> index 903df2117b..e625e8725e 100644
>>> --- a/migration/multifd.c
>>> +++ b/migration/multifd.c
>>> @@ -635,6 +635,7 @@ int multifd_send_sync_main(QEMUFile *f)
>>>        for (i = 0; i < migrate_multifd_channels(); i++) {
>>>            MultiFDSendParams *p = &multifd_send_state->params[i];
>>>    +        qemu_sem_wait(&multifd_send_state->channels_ready);
>>>            trace_multifd_send_sync_main_wait(p->id);
>>>            qemu_sem_wait(&p->sem_sync);
>>>    @@ -668,6 +669,7 @@ static void *multifd_send_thread(void *opaque)
>>>        p->num_packets = 1;
>>>          while (true) {
>>> +        qemu_sem_post(&multifd_send_state->channels_ready);
>>
>> This has one issue though, if we mark channel_ready here itself, channel is actually not ready so we can still busy loop?
> Before:
>
> while (true) {
>      ....
>      sem_post(channels_ready)
> }
>
> And you want to add to the initialization a counter equal to the number
> of channels.
>
> Now:
>
> while (true) {
>      sem_post(channels_ready)
>      ....
> }
>
> It is semantically the same, but when we setup it ready it means that
> when we set it to 1, we now that the channel and thread are ready for
> action.
>
>> May be we can do one thing let the sem_post in while loop at same
>> position itself. But we can do another post just before start
> I can see how this can make any difference.
>
>
>> of this while loop, as that will be called only once it should do work
>> of initialising count equal to multiFD channels?
> Yeap.  But I can see what difference do we have here.
>
> Later, Juan.
>

Thanks Juan,
Just confirming if i misunderstood something :)

I meant your approach makes sense, i was just suggesting a small change. To do something like this.

qemu_sem_init(&multifd_send_state->channels_ready, 0);

static void *multifd_send_thread(void *opaque) {
      ...

      sem_post(channels_ready); // Post once at start of thread and let one in loop as it is.

      while (true) {
         ....
         sem_post(channels_ready)
      }
}


Something like below has issue that we are marking channel_ready even before channel is actually ready, i meant if network is slow it may take some time to update pending_job and hence we can busy loop in send_multifd_page().

static void *multifd_send_thread(void *opaque) {
      ...

      while (true) {
         sem_post(channels_ready);
         ....
      }
}


Not sure if we are already in agreement :) just confirming.


Thanks

Manish Mishra


