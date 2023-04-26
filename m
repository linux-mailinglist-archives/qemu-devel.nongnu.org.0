Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F5A6EF47A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 14:40:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1preQP-000309-BR; Wed, 26 Apr 2023 08:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1preQD-0002yG-2x
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 08:38:57 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1preQ9-0001Vm-MA
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 08:38:55 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33QA3S0K021002; Wed, 26 Apr 2023 05:38:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=ByPrj6X7VpEAlCg+JvGI7s8JR1whkjmdOFuHSgucfII=;
 b=P7USqEeuIDdG1ouh6HazkBJYxPb647ETavFOTo0LET97M5dcjfc7FL101RopBzpAXOb8
 hzewD7P5BxBLAslufL470+g6Hv9yZuwZb9+EBVdJ5sG2VgXU1YCNoFoDE6pL/VGnGgJK
 s/zvRfhWRLRx/w//ZnWFQXQtIZssfj6PIra3DAgoYk1/nYFP27DW7Mp4Gco7zUQAvL8J
 Nr2lIwtAiwUdtW7qWb83Ja/goI+36o6GOuIOijLcyUVoGQ937M5hXtiJmun4CXwyNq0W
 H2J2trZRvB/Iopm0cCRtjTIQvsKKkFW7hP9Vk+Jq16TJs/BC1ZLdv+ogSvhqzv9Ri7+S 1g== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3q4dpkahr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 05:38:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMWK9EC7XWVljR4ddwqUDuF47CcrDhfa2UFfcw2JWEi4mszt9JgNtFs72d+ijcQgH6bojVzx8m54XAP2xshSykBzMlnX0a/gC8qXgOJ/jBypQQ4MFR1YLxhfutRjDU7ACMuWQOG1rZmfeCVtTr6+yLpzqoEoXhGQeVqwD6exASYyzE+Eu5JcaQwUGnb8qG/PvmXCc2Dl9UfSBeIXvUuPpUe5sUW0/hfqgwnsddX6uMsLDYxIDiY9uPIac5XjoOe5nkMdpgJd9wIPnuHupJvkPWANxNPLN9NiZQdt9tOMHzWVCETop6O5aY+oEREmJYsKOKT1ET/Vyna/FPDmiwnEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByPrj6X7VpEAlCg+JvGI7s8JR1whkjmdOFuHSgucfII=;
 b=Mg1hYKt30abvXNsyWaFwruSm6Yfc6GQhUaQ4fKq3yscJDHGZWJk9+O6CPWUbYSUZKFpGmsYkqPKw6y5Losc7qBk08JNLhapUWbZimET1z1Cv/djaq01eJe8cHKXzK6R9K7AawTXzORDVBADsqIGC+1FtjJqMKrI1CHiHHcZMgmwxHNffxJC6pRLnLq5hhWcFaU33HEy6nvalIhPBQuV3ksTIqWBQpz/jjhoKGYRuWZb0a6y8YJcWUPI/dxnenXAhUkbCzrXKEfgPq+ZGkjhdhRAPoq+C9ZQcg0s52Ef+Wj+js+kKKISseVVy9HsEKqJS1IdgWJV247cIZX5tx7Mzyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByPrj6X7VpEAlCg+JvGI7s8JR1whkjmdOFuHSgucfII=;
 b=k0q+26wFIrm9hQY3dYCHfAz914kV2BzOb+BeJ33CSN4XcXHOzZrjNJmDWmpzjP7GbeO607dUI9fPyfP5O7Ycl4qyEAkghnOtIB3jtWQnx6FbsjuA7vNn9zDCXieGLkpxpFDgIzQuTt4rtBtaha4BFM+QqoSsJChdem+mskhbhZZJDqGCeLE8Qgi1u9dIoHS92nFsybUXlZn1oXe6PXpNdWNhvT2eULze+wf4RM+hj5dFxK2YpMfFYo/W4NbCcghehlMBCHUKES3Q1VFRO8GPvnIsQZSwh4rVTRmpuiKpISQcHNH9L3Fxi/oAcVgmwl+vRNDhyRspXz6/aLFfuVG7yw==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by IA0PR02MB9918.namprd02.prod.outlook.com (2603:10b6:208:488::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20; Wed, 26 Apr
 2023 12:38:48 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::f2fb:d9ab:6983:b2be]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::f2fb:d9ab:6983:b2be%7]) with mapi id 15.20.6340.020; Wed, 26 Apr 2023
 12:38:47 +0000
Message-ID: <dad15baa-794b-bdb4-fc7b-1916056cae2d@nutanix.com>
Date: Wed, 26 Apr 2023 18:08:36 +0530
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
 <82cfd4b3-fbea-b147-e84a-d8d160088c14@nutanix.com>
 <87leieg86a.fsf@secure.mitica>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <87leieg86a.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::30) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|IA0PR02MB9918:EE_
X-MS-Office365-Filtering-Correlation-Id: 549193ab-02c2-48c7-01ae-08db46532dbd
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R1tEhDLGxo97Bfp+gbERZeX5PK3h1joaRhqc8ijcN7zgCdm70I0toQjF9uTbcF1Qb4LO7L1NaW6URPRxsgJxVu9nmfU3qrdocY5LeaZEfIvCEJOZYIzSrY9FmSgpBZI8CHp3jmIKTsB+jADSsRdtpbf64Zlfn+OCxDYXNFiriSL6LuCnRas0YRhb50LFS7Px6cDR1PzhvgXcF+XNtaEqcDOXZsv1M2BWeGM7zlhqh9aUeF0HvtS+IVQw2O4u4gfjyK2YfSNwUEGxVQ2bhBpcyb9VoWQGc4+V7zhKGmZ2BW6mZK2/Ow/2ugBArfpZXbA6L/8KfAv6WRilXl33ABYzAuZ3pQkjodLKJz14HvfiFmyEFyV8tODKOwV6JGSCBUIOI5LLXLBUtuxnr3qAm2wiPVnrPGLusR1eWOVbuiwCidwhlSSoDLEWD4p6DOvSyIBLPl8TRDu9yqs9PYPynZY1GIJg6kmDlS77JdGSVue01QtYU4AMsu54YjUX+X9c8kYXUqwZc2H8+sciq8H1RzdKTBGulBs/ralUEV/AqTl/6HayhAqOHBkFLswHdn7cxv9Km5AidHXHFudG253Ph3Ethx5fvqPWj+93YvOI95iEaKyT72WJ08pMwOzDm7FRpHQtXPOE/EoRuQQIdzSY5hgJww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199021)(53546011)(55236004)(6506007)(6512007)(186003)(26005)(66556008)(4326008)(6916009)(66476007)(5660300002)(316002)(66946007)(6666004)(6486002)(31686004)(83380400001)(2616005)(41300700001)(31696002)(36756003)(8676002)(8936002)(2906002)(478600001)(86362001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWdKSHJvRHRmaGZkTHhreDZtUkU2OHNlNHFWdFJreE1BMWVDSFRQWG5FTjBw?=
 =?utf-8?B?VUFXQVgvdVVkdFBEak9HbHR6TEc5QXRLZXpsQkVpaHFmMjhkQUZtTzdLeko5?=
 =?utf-8?B?TWxHRTdwQS91ZFhYbDJZcWFHdlMxcjFFbTdFTG1YVyt2bXBEMWU1NjZZVGJO?=
 =?utf-8?B?ZGRTM1FybXNVcVE1Z25FRUFDR1M3eXFyTC8yY05LL0JxRTM0cEZicG5uajEy?=
 =?utf-8?B?Z2FMTC84MnJ0dHlVVG1BekU0enNoNlRKcUtjblJsM3dPc0FJY1RvZjFzeWI3?=
 =?utf-8?B?NHJEcDVtYUtRbko2K3NaRkVtYXg3NmJNeS96Uk1xRDYxWVI2MjhoZmhFRXlC?=
 =?utf-8?B?UFp1QUhtT1RZZ0xWaDVJK0RmZ0F6cUFhYk00TjVmbGx2SjZkMWRpSFp5eHRS?=
 =?utf-8?B?Q214VE1kbFlXTmFOZlBKMkUzSDMrZ1lvUmo4dHlDQlVVL0hvOEZZMjVlY052?=
 =?utf-8?B?NGp1UmVQYUJjSlpFeGZDZk5ETE5QRDdCV3NwbzNndWpUSW40c0czbXpIU2c1?=
 =?utf-8?B?aUJlWkJpbXNCRWs3Sy9CWnkyM2JqZ3NQT1NzQmo4UFhLSGE1K3ZXV2JFVHdS?=
 =?utf-8?B?QnNnM2ViRGs5SGVzS1NjSVZYMEhDQUlYTFFEMXdMUnIxT3N5QWVLempSNitC?=
 =?utf-8?B?YlhLT01qWUcrb1ZoYVVhRUUwNE1UZXlYd0dCVDE0S0V2TXllblIyN1l3ays0?=
 =?utf-8?B?YnNJMTBLb2dmdnloU210WDdZdzhOSzViMkNkK2V6YTVqS3lLSHhSYW1xcWpM?=
 =?utf-8?B?WW5NS2pJYmkzVUVsZWRETEsrZG9XVFQyUGpRbURNY3JjeWk0SEpheDM5anRr?=
 =?utf-8?B?Vmh5OWFwNUl2bzRjbFhsUzZXTi9PSUZnaUEwV3JtaXRzK2lnWEN6QTQ4YTg0?=
 =?utf-8?B?NWwwSW1LQXpNS3R4K0RSSXJlKzd1NHRGSGFvVktOVHFtVG9ZalNLaFRIdGp1?=
 =?utf-8?B?S0RlOHJpd09wazJ4QW96YU1XRkYzdzllb24xcVFJeG1uL3NkTUdySWExcGpt?=
 =?utf-8?B?NUhmYWFzV1RlQWxMd3d5dGllSlNNbEgyT01QWlpiemo2cjl4d0UrYm96SndR?=
 =?utf-8?B?VW9wV09HaElteElGSHhERmJ2T1FHdE01bXZ5UW11d09ZVjJERUpGbWhaNG54?=
 =?utf-8?B?RnJpUXJEbWh4cFZWSi9kcjhMWlJtRExxSUZJWWY2eG14dDZMMk5ZcmNiNTNZ?=
 =?utf-8?B?N0t5N2NQekFub244ais5Z0tFUUFCNkU2ZjBtNFRnSjF3RmVOME5iNnlKeWtN?=
 =?utf-8?B?T2M3cnF5dkNiNzNpVGRmWjBpRExVQzJKMXROS2U1bnRqMS9BeFpYSE5lR05m?=
 =?utf-8?B?VU1FMmF3bjhYQklxNThVcjVKTXpqZklxM21ZNG5BblFUN25iTHdNaUIwazNX?=
 =?utf-8?B?SmxHYThybnR1UmJuOG1lZGFHbTlVSW5YWk1wMDRuUk4yNm5NQjRaL1o0RGc1?=
 =?utf-8?B?ei82OUVLZFRrMlFQdTltTFNUaG5xZWhid0thWHZKY2FsRVBsVmgxZ1JUVUNz?=
 =?utf-8?B?dmFQeVdoZkJwQ1JSSEk3YTkwMXFlSStNZ3UvNHA3WWJueEhSN0dQbzhVYzc0?=
 =?utf-8?B?UlhESTFKMUthUFZ5bnZ0KzRUV1hQZWlkczNiNWxUT3VGYmRRVEFRRzJGc2N2?=
 =?utf-8?B?bStUcG1Fc00xa1dqcXIvTllkVU1HalJ6cjVmd1dSakdqNW93TE4vQW42aUNt?=
 =?utf-8?B?NzZGUndjMGo4L0VkVmQ3L1R6cVhwd1RwQWdBdVluaHdZclBWSEd6Y3o2RTFX?=
 =?utf-8?B?WmJzU29aSk9OeHVvTE8vUVVYbUdJamZUYmlDUGlseHROMnFuMk1QNndRMmlV?=
 =?utf-8?B?b1JlZGUwTWZFTllHSWJWa1c0MFNkbHZRMnJ3bGxYZTIxOG9tMUloTlgzUWFW?=
 =?utf-8?B?eC9zdmNsOFJjTFFTa2g0WVZNQ21EWjRYTVRTTVpha1lmTlkrUjFqZ0NaMlBM?=
 =?utf-8?B?dEg2dlVUenhWVGN3Q3dLYlZzajZFQU1pZWRHZWxrZTlybjNlNU0ybXhkOUhM?=
 =?utf-8?B?bUdJSmdOUE9vOGtITnF6MFhFYTNBMmxGbnN6dVJlRnJUODlaanlMT2ttZU0v?=
 =?utf-8?B?b08zM0d1Z1FXNXlicUtxZ1E1SGVnU0hVbXR4a0ZsU29ZTGxCTTE3aGdiTjlR?=
 =?utf-8?B?OHM2ZS94SGNpZmVTWXpiQ2JYY3drcGlwQlN3UHQ4Sko0YmRsTkxYMklYeEFS?=
 =?utf-8?B?M3c9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 549193ab-02c2-48c7-01ae-08db46532dbd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 12:38:47.0699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxbxvPsKtc8kPjJTjx4HttAK4Up0z5Wgm6Mk4V8IKTDq88QlNepmP6Rrv0atuYkqWBUqJYOyPAQ3irpE8gySYoUlfIwJed75EaqL7GW7sCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR02MB9918
X-Proofpoint-ORIG-GUID: Ch474WvZ4C7Ymn9MWi7yC4MQnzZLmTuQ
X-Proofpoint-GUID: Ch474WvZ4C7Ymn9MWi7yC4MQnzZLmTuQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_05,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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


On 26/04/23 5:35 pm, Juan Quintela wrote:
> "manish.mishra" <manish.mishra@nutanix.com> wrote:
>> On 26/04/23 4:35 pm, Juan Quintela wrote:
>>> "manish.mishra" <manish.mishra@nutanix.com> wrote:
>>>> On 26/04/23 3:58 pm, Juan Quintela wrote:
>>> Before:
>>>
>>> while (true) {
>>>       ....
>>>       sem_post(channels_ready)
>>> }
>>>
>>> And you want to add to the initialization a counter equal to the number
>>> of channels.
>>>
>>> Now:
>>>
>>> while (true) {
>>>       sem_post(channels_ready)
>>>       ....
>>> }
>>>
>>> It is semantically the same, but when we setup it ready it means that
>>> when we set it to 1, we now that the channel and thread are ready for
>>> action.
>>>
>>>> May be we can do one thing let the sem_post in while loop at same
>>>> position itself. But we can do another post just before start
>>> I can see how this can make any difference.
>>>
>>>
>>>> of this while loop, as that will be called only once it should do work
>>>> of initialising count equal to multiFD channels?
>>> Yeap.  But I can see what difference do we have here.
>>>
>>> Later, Juan.
>>>
>> Thanks Juan,
>> Just confirming if i misunderstood something :)
>>
>> I meant your approach makes sense, i was just suggesting a small change. To do something like this.
>>
>> qemu_sem_init(&multifd_send_state->channels_ready, 0);
>>
>> static void *multifd_send_thread(void *opaque) {
>>       ...
>>
>>       sem_post(channels_ready); // Post once at start of thread and let one in loop as it is.
>>
>>       while (true) {
>>          ....
>>          sem_post(channels_ready)
>>       }
>> }
>>
>>
>> Something like below has issue that we are marking channel_ready even
>> before channel is actually ready,
> I think it is exactly the same.
>
>> i meant if network is slow it may
>> take some time to update pending_job and hence we can busy loop in
>> send_multifd_page().
> No difference from send_multifd_page() point of view.
> Notice that I mank that the channel is ready before I do any work.
>
> send_multifd_page() does a sem_wait() before doing anything related to
> this channel, so I can't see how it can be a differnce.
>
>> static void *multifd_send_thread(void *opaque) {
>>       ...
>>
>>       while (true) {
>>          sem_post(channels_ready);
>>          ....
>>       }
>> }
>>
>>
>> Not sure if we are already in agreement :) just confirming.
>>       sem_post(channels_ready); // Post once at start of thread and let one in loop as it is.
>>       while (true) {
>>          ...
>>          sem_post(channels_ready)
>>       }
> and
>
>>       while (true) {
>>          sem_post(channels_ready)
>>          ...
>>       }
> When "..." is exactly the same don't make any difference, the only
> difference is that in one case we "write" to semposts, and in the other
> we write just one.
>
> Or I am missing something.
>
> Later, Juan.
>
>
yes sorry, i misunderstood techically it does not make any difference. LGTM

Thanks

Manish Mishra


