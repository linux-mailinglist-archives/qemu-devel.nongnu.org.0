Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5658D5537BA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 18:18:25 +0200 (CEST)
Received: from localhost ([::1]:43728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ga8-00041H-1E
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 12:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1o3gYb-0003Kp-OB
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 12:16:49 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:15916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1o3gYZ-000730-96
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 12:16:49 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LCYbCV004084;
 Tue, 21 Jun 2022 09:16:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=1Q7a2/PwSAX98ZOZSPgkLfbxq1IBoBU4pyFAkt9/M94=;
 b=BObkTleOq8W7ZO5vDocwe17/Uvszlas4lJYNJYR7fv1XMXIYEbDlUdFwWPCuVSjpJaEF
 pmm+UyWmRbyRbKhZOA58cXt7jassYw1ZJQ07/r9FzOX5qncsbhGYk9jjbVSNbidfibGX
 XgFGeUEpfhoJ99gfEkLZ3N/t1pHAGHnuTq1XDIasYTQ/StyGISTFD1uEoDD9LT2Oq1ad
 Cgrs2WWLAjc2IOUMi8g3Dpp4axk8rxtjiP+5jpJQahwI/gzqy06AZ2BJweJV6paOSZKg
 08Wo1Pr/HGAcJjv9VIJE9tWkhDM4ilXjeHotmPFWCmh8tFcn1HiRz7adf8LzlBBbXQr+ NA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3gse8xxahm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 09:16:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxS2siYz8ebDLXO7gZ2A6x/EuvLELwaHoSabNc6Lz/eY0W+gi/7PDk9sxka7c8O2lCMCF7FYj+o+e72rJH6ioyGE9N6jhvDoWbM80mmcelOuaVc+vAzSX/Cmtz5NaPEJjqA5U3k+1H5ZpwzZ6wCXzVBZpmhS1pEt4X2PbeJkwwPCtAG8Vjk4FTbkIdOsx2s/g8Sutdqn+qyFXpA8HjDMMMmsT023Z1dvZD0FzWASFgQqjC6Js91MngckqX/oBAXX4IPGbrVapXtfOFzB7yXD5B+FIdl6wgnXu8K3pVBe/sAFHp/J5xG4aP+DS3pxoBlVNzxk7A3hHwKYJ/iSA2kgnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Q7a2/PwSAX98ZOZSPgkLfbxq1IBoBU4pyFAkt9/M94=;
 b=d0v09CvdgRssRqY0AzZ/J5MPUHJNWI2S23XYSBrm62eFbFTC66eGFTc8gpNVNS4gU7/Oos39+aVZJT/g7wIgWtlDhJKy1e80F/VVmTgagL6ybMMhMJs8Jo+HFqWIXK4sUP1oeL9BG9oXtsTguX6/CBoNUZb0HjuyeY/Th2b1iQJ/7jm0ND4d0Hb85IHEBAOgf/72rL3D+pMMFgt/6LukePxIScFO6iMJeQV2YhXkUQB4BH3sQzc1j8r086cmVJZ61bfLEZQ7rPwbkf3InHK0PvrW1w41YY4Xxb2Zgz1XLW9tgFR1oNtS/WZ2EX/y30Mr0XPRBC6pd1Zvt7TBTt+Rhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by BL0PR02MB4657.namprd02.prod.outlook.com (2603:10b6:208:54::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Tue, 21 Jun
 2022 16:16:41 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::898c:892a:2385:3df6]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::898c:892a:2385:3df6%5]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 16:16:41 +0000
Message-ID: <31929ad5-7cda-3820-4027-2b0b62941762@nutanix.com>
Date: Tue, 21 Jun 2022 21:46:33 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 0/4] Multiple interface support on top of Multi-FD
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Het Gala <het.gala@nutanix.com>, qemu-devel@nongnu.org,
 quintela@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <YqIWDoSJ/xQC8Vvt@redhat.com>
 <7209116d-ef87-ee6f-5126-e23b55121f49@nutanix.com>
 <YqoMMCbF3PBnYSn/@redhat.com> <YqrpVRJazpbMz/HE@redhat.com>
 <YqtRYs1wGEQR4wfo@work-vm>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <YqtRYs1wGEQR4wfo@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:a03:333::20) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c755df1-83cf-4ef1-c28a-08da53a16d68
X-MS-TrafficTypeDiagnostic: BL0PR02MB4657:EE_
X-Microsoft-Antispam-PRVS: <BL0PR02MB4657F3A4AA28ED909B0CE273F6B39@BL0PR02MB4657.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8poQLEQjFCRKKVN152i7muTf2BpmzrzBvQTOd1NHNQBT72J8h/yIdsyv9BD6lNq6hIuAvjcxebLJX62uLWT+YOss+NhQh6fJVng86lkjvazR5dLABa6aTKSG0/DIuemA0ycr8kxXigivL7Fq1A8ubKrHOZwJ/FVKdJjATQmoCnAs1/Sm+i4mToWRaKS4BHwRXswMsqIaHU+5n0aZIjkwlBECALEjvznxl585pPeOkdG6GbLGAO7PLLJKQsnZvt/Ix060xmjhDRUhPG2SK+l7uso0TD4BbcW5Njdm9eEk4jNcmEx/C/gCqqQ6aWxacRye/Vjpv0Jgy8l+NStkEVIFHcRtu75r6EOvg3pzy4bBc7kyi+uRDOM9S+0cs0rBKuQTrU/rGtJH2ySE3bwBMPUwSrRdIUlU89KQ1f0+RgQxXAc7//lbul98yprpQ9GpNVVVRyenLh+8otxU7PjSUz4yjZRr73WDOyF90rWRowX1MQjzz1AdQfJgNMOEvdOUT0Bs10+c6MyWRRl1GDgNQNjNWsK8ia2ybKkXFED6jJuzO3g951NRsWWS2KtE22vwKI7uTtpvMbaOcw0cKv7KB+awr1Am/ohVDS4GKvejCPmtUYzs+Nm77oh42OUZt+1IDMmnpi6vZBaXmwAbLjrWYEcS7J7Cdt6z7ST/54xj1i0eJtKH9y8rvasZsy/Wn5OeRzRt/+JfxbO84PVwBnN8urWYKJdP6Vc++DZMw2ZqJSpTIW0iSr6zgmYLoV7pJGJpzaBTXN83/XcqWtL/MjI6s5Qm1XHv2KsP61s8TTIITUxuwrAKXyfHHkJ0chpp4DYZqO3Sx9XhQ76gnIIdKAvL0n3gc4A9QRsvmcviP+rmiegK8i4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(39860400002)(366004)(346002)(396003)(31686004)(6666004)(86362001)(38100700002)(4326008)(26005)(36756003)(66476007)(66556008)(110136005)(316002)(2906002)(66946007)(8676002)(186003)(8936002)(478600001)(83380400001)(6486002)(53546011)(31696002)(6512007)(966005)(41300700001)(55236004)(6506007)(5660300002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnUyVUtLc0xjcUt1SkQrOXJQemV1MENzcGJLL3g4L3RySnZQODV4QXZUZTFo?=
 =?utf-8?B?Y3A5Qmt5d3c0RTdWQTRqaXVtc3F0MDFCSitIN2pvb0JsaTZZMFhUbnNlanJF?=
 =?utf-8?B?WlY1dDd2UWFYaTViWU1OVjlGWVpzRXl0MHZmWlNkOGpqcUFnUjM0aUlHLzRF?=
 =?utf-8?B?eDBHcWc3a2ppQ3V1QUtYMVVDdzVDTFhXN1pFdnhtRDNKWm00RWg1aURUQ0lL?=
 =?utf-8?B?WXNMd0k1a1lEZjBBc3crcDl5QmRxMFhXb0RhVzZLY2hmZThIdkV5YjFTdXd5?=
 =?utf-8?B?Z2dTU1lXckxMZGlIYlVmSncrOWc1cUhqN0dBNUdvWElZcGQ1clgzNWRlYzc0?=
 =?utf-8?B?aUducDVqc21Ib0JSN2tUa3BFcll5bDBvbnQ2eXRXU2pXaEVaR24zeldHYkRV?=
 =?utf-8?B?bmZHRzFhcjN3Z2hpRGJrbGp1QXoxbDJBenhTbnMyVlVHN1Nqa1R5TS9HRmtz?=
 =?utf-8?B?NjlxOUQ2N0J6ZEtLRHdUUXJ0MDkvV2tidHpNZ01QY2JTVDhMdnNMcVZBYVBV?=
 =?utf-8?B?dmxHMVVTTVpOTC9ia2EwMEpMWHBDQ0x2cVM0bDBLWS9IMzNCdnBrMkErRTFZ?=
 =?utf-8?B?RUs4RC9ubk1mVW5vSDRCU1pFK2svc2VxMkxHM0lRajFXRE12b080cmhQMEZD?=
 =?utf-8?B?TVE3V00yTWtIOGpqL2lqaEQ5Y29oaXZsQXJ0aUF3ZEszdzlVL1ZXb0sxWUtY?=
 =?utf-8?B?M2dtK2Nya3RiVTZITXVhdXpob0Ixam1xc3FpaU0rSDhnenVFYVBhSUx0WHRE?=
 =?utf-8?B?UVBRRlpRN3draHFQOHZQa0RrV1lhVGpLSXpza2ZWclVBNHh6Tkh0MGxRcVly?=
 =?utf-8?B?LzlRQUQ1VHFYVmh3SThMbmxrT0tNMU1XSGh3cjZpcXBVTnVWcENuTm9LWXFM?=
 =?utf-8?B?T1plQ1daRmJtems3WGxxTEN6N3BTWHZiMjRYZWJtNFJIUGJVenB4eEhIVlVE?=
 =?utf-8?B?Y1YyN0c2Y1JhSE5BZVY1TWI4a0JIMmZlaU9FY3orOENOanNBWkRkK0hoMkh5?=
 =?utf-8?B?QzU0OTYySEV5K0w3bFJjS2h5aStJNzRwUUdoZjZSbmVpMmVuMUZrN0RxR3RR?=
 =?utf-8?B?SE1vQ084RHMxejRYS2dWRGloQUR4Zmp2T3VWQ0VxVS93NjVqWkFXWi9Jc0Nr?=
 =?utf-8?B?OGFwcit5eHZ2QjdOb294akpCN1J3Z3BSTm5OR01KQmZCSnN0SXJJTDZFTmQ4?=
 =?utf-8?B?OUM5enUrMHhMZGZVMnVHaEJ2aXd0VUdvVWZ4ZWFIWVJwSUxYdUl5Tk1oVHJZ?=
 =?utf-8?B?MlIyemdZd1hrM1A5RFlDeXV0QmsyYWphV01saTBuY01OcFpTdjlCZkUyS3Jl?=
 =?utf-8?B?S09pWW8yVm0zQUk4U2VTZENxZkNRa0p6b05pTFBSQ1FWSDJ5N2tCT1drL3k0?=
 =?utf-8?B?ZWpXL2NCZzNUZjBhd3hDMXFiOVFuaTVZZ1NaR0R3ZWtSVkNQcmgwR29TQy93?=
 =?utf-8?B?TjIzTldmRjZHRXJOaUhveHZHQk5CTi9Bd3JuenFacU03alZJRk5SMU4zVnMy?=
 =?utf-8?B?cTBsMWJtNklmZVFuNDJmMDR6dDROZEt3NXZ6S1JMK2JZV1NtVDl5OCtBNktn?=
 =?utf-8?B?ZWtIOUpYU2lrQUdybXJZSHc1VEp6Yk55T2ErNFZoL2UycjUrT2wwQ3dVMTNm?=
 =?utf-8?B?NklZVks3ODBQTlpaWERBUEIzeWJ5SUVpRjBmcUFZMXRBWWU1Q3p1WVhnQmNJ?=
 =?utf-8?B?RHBnRkRiZVMvUjUxRVpuVFEycjFuSkljd0R4WnJJYW9IbHJjVWM5THUwN3Zs?=
 =?utf-8?B?TUZ1WGh0ZDFQV040a1NwUHFUcE4xcGk1U0pDem5paGxvVmVnOFExZDRKc2c0?=
 =?utf-8?B?RU5FQ0J3MjNRY2ZuTldhcCtkaGxOUi9vV2NKRU9TeWxrR0x0U2tQT09JU0Zv?=
 =?utf-8?B?blpIYTJHem1VUy9HaXl3eG9jSlBlMVI3Qkk5QzZ0VzRXYnZxRUk5Q2hOalc5?=
 =?utf-8?B?REZlaHpsQmZDWGpLQmo4Z0dSbXMyQzhSVFNVMkpDNDA4c2FPQkkzQlVneVRZ?=
 =?utf-8?B?SlF2TXhHaDFVUEphblhyUkV6R0dudW10REpqQ2tYNGh2NCtJUGVQTkF4TlNt?=
 =?utf-8?B?ZlJpQ2FBTDBZS2xMdUMzaDJuVjg3RjNxdWtqTTRLVW5qL2l5YlIvZDJKcC9O?=
 =?utf-8?B?MEpGVU9STm9SNVlBbDM4WktyeXF6aGwraFZIY083cFR2aWVBNVJMc1ZVdEJU?=
 =?utf-8?B?NzQzcngzRXd5d1dmanF2ZzMzbUd6VkdwOGV1c0ltMit6SUkyYUYzWTNnNFFH?=
 =?utf-8?B?eGNaUHV1THQ3SFg0L3RpUFpKUzEweEplMlprWSszaUkrODJ1UHBDaTJRNnZk?=
 =?utf-8?B?TVY0ditSSmk3YU85cjY3K2NPdEtNaU9Mc2NzZDMrYzNXWWZHRStMY3lkYTBt?=
 =?utf-8?Q?o8Fw2lhl/5k0HkJM=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c755df1-83cf-4ef1-c28a-08da53a16d68
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 16:16:41.8018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bx6m44MKv6xczsMeEnOyomJb9ZBrdjwjn2Ed5z0dGdlyMDTv4ZT1NGg/au4NFZX0b/Kdbc7SH9E8vlLpxeX4MYE4QWEhKHaixw9Nzijm8yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4657
X-Proofpoint-ORIG-GUID: Pv8gTbt7ZICzsfO49u5Se3qr0Sm9Nq27
X-Proofpoint-GUID: Pv8gTbt7ZICzsfO49u5Se3qr0Sm9Nq27
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_08,2022-06-21_01,2022-02-23_01
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


On 16/06/22 9:20 pm, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>> On Wed, Jun 15, 2022 at 05:43:28PM +0100, Daniel P. Berrangé wrote:
>>> On Fri, Jun 10, 2022 at 05:58:31PM +0530, manish.mishra wrote:
>>>> On 09/06/22 9:17 pm, Daniel P. Berrangé wrote:
>>>>> On Thu, Jun 09, 2022 at 07:33:01AM +0000, Het Gala wrote:
>>>>>> As of now, the multi-FD feature supports connection over the default network
>>>>>> only. This Patchset series is a Qemu side implementation of providing multiple
>>>>>> interfaces support for multi-FD. This enables us to fully utilize dedicated or
>>>>>> multiple NICs in case bonding of NICs is not possible.
>>>>>>
>>>>>>
>>>>>> Introduction
>>>>>> -------------
>>>>>> Multi-FD Qemu implementation currently supports connection only on the default
>>>>>> network. This forbids us from advantages like:
>>>>>> - Separating VM live migration traffic from the default network.
>>>> Hi Daniel,
>>>>
>>>> I totally understand your concern around this approach increasing compexity inside qemu,
>>>>
>>>> when similar things can be done with NIC teaming. But we thought this approach provides
>>>>
>>>> much more flexibility to user in few cases like.
>>>>
>>>> 1. We checked our customer data, almost all of the host had multiple NIC, but LACP support
>>>>
>>>>      in their setups was very rare. So for those cases this approach can help in utilise multiple
>>>>
>>>>      NICs as teaming is not possible there.
>>> AFAIK,  LACP is not required in order to do link aggregation with Linux.
>>> Traditional Linux bonding has no special NIC hardware or switch requirements,
>>> so LACP is merely a "nice to have" in order to simplify some aspects.
>>>
>>> IOW, migration with traffic spread across multiple NICs is already
>>> possible AFAICT.
>>>
>>> I can understand that some people may not have actually configured
>>> bonding on their hosts, but it is not unreasonable to request that
>>> they do so, if they want to take advantage fo aggrated bandwidth.
>>>
>>> It has the further benefit that it will be fault tolerant. With
>>> this proposal if any single NIC has a problem, the whole migration
>>> will get stuck. With kernel level bonding, if any single NIC haus
>>> a problem, it'll get offlined by the kernel and migration will
>>> continue to  work across remaining active NICs.
>>>
>>>> 2. We have seen requests recently to separate out traffic of storage, VM netwrok, migration
>>>>
>>>>      over different vswitch which can be backed by 1 or more NICs as this give better
>>>>
>>>>      predictability and assurance. So host with multiple ips/vswitches can be very common
>>>>
>>>>      environment. In this kind of enviroment this approach gives per vm or migration level
>>>>
>>>>      flexibilty, like for critical VM we can still use bandwidth from all available vswitch/interface
>>>>
>>>>      but for normal VM they can keep live migration only on dedicated NICs without changing
>>>>
>>>>      complete host network topology.
>>>>
>>>>      At final we want it to be something like this [<ip-pair>, <multiFD-channels>, <bandwidth_control>]
>>>>
>>>>      to provide bandwidth_control per interface.
>>> Again, it is already possible to separate migration traffic from storage
>>> traffic, from other network traffic. The target IP given will influence
>>> which NIC is used based on routing table and I know this is already
>>> done widely with OpenStack deployments.
>> Actually I should clarify this is only practical if the two NICs are
>> using different IP subnets, otherwise routing rules are not viable.
>> So needing to set source IP would be needed to select between a pair
>> of NICs on the same IP subnet.
> Yeh so I think that's one reason that the idea in this series is OK
> (together with the idea for the NUMA stuff) and I suspect there are
> other cases as well.
>
> Dave
>
yes, David multiFD per NUMA seems interesting idea, I was just curious

how much throughput diff we can experience per multiFD channel

with local vs remote NIC?

thanks

Manish Mishra

>> Previous usage I've seen has always setup fully distinct IP subnets
>> for generic vs storage vs migration network traffic.
>>
>> With regards,
>> Daniel
>> -- 
>> |: https://urldefense.proofpoint.com/v2/url?u=https-3A__berrange.com&d=DwIDAw&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=qfclRDP-GXttuWQ3knJS2RHXmg2XjmG7Pju002cBrHugZE8hpO3DRbKdHphItFr-&s=1RKIz6cO82_JwgkJ-QLP3SRWaG2Lo6J8w4O0Z2YVJ4Q&e=       -o-    https://urldefense.proofpoint.com/v2/url?u=https-3A__www.flickr.com_photos_dberrange&d=DwIDAw&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=qfclRDP-GXttuWQ3knJS2RHXmg2XjmG7Pju002cBrHugZE8hpO3DRbKdHphItFr-&s=BkGiCLXloxlYYBJeJ_0XGRUgkUraRPJdIu26ukR6erI&e=  :|
>> |: https://urldefense.proofpoint.com/v2/url?u=https-3A__libvirt.org&d=DwIDAw&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=qfclRDP-GXttuWQ3knJS2RHXmg2XjmG7Pju002cBrHugZE8hpO3DRbKdHphItFr-&s=KOz_zQXuQzFxwhNLINm-FrADPcBgnVjjmULmZ6iZTi4&e=          -o-            https://urldefense.proofpoint.com/v2/url?u=https-3A__fstop138.berrange.com&d=DwIDAw&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=qfclRDP-GXttuWQ3knJS2RHXmg2XjmG7Pju002cBrHugZE8hpO3DRbKdHphItFr-&s=Ez_j93m7dz0aJe9mjyynk8mJ122ZeXre2F-ylFXj2og&e=  :|
>> |: https://urldefense.proofpoint.com/v2/url?u=https-3A__entangle-2Dphoto.org&d=DwIDAw&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=qfclRDP-GXttuWQ3knJS2RHXmg2XjmG7Pju002cBrHugZE8hpO3DRbKdHphItFr-&s=ID9hDsAkt6zO_o85XqDIjhoxLiwrOhyfAhEqJSukAbw&e=     -o-    https://urldefense.proofpoint.com/v2/url?u=https-3A__www.instagram.com_dberrange&d=DwIDAw&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=qfclRDP-GXttuWQ3knJS2RHXmg2XjmG7Pju002cBrHugZE8hpO3DRbKdHphItFr-&s=EK5bGerh1gLCXnMyUV1FlC8EyMN2lWa-r1MVxp6_A_s&e=  :|
>>

