Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A25FCBB9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 21:57:04 +0200 (CEST)
Received: from localhost ([::1]:33418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oihqh-0006CN-4i
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 15:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oihnl-0004gP-2B
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 15:54:01 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:4794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oihni-0006g6-OY
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 15:54:00 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CG8d0O021610;
 Wed, 12 Oct 2022 12:53:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 to : subject : cc : from : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=Fhw7XFE/ybWR4LcmavQD14dcf1XCmxbM9l/2pt4Srtw=;
 b=A19/Y4DRcFIbmjd6c2G5KzgN8wOJMbBtDfWjzj/nM6ukHdWPwyh+kLyB7zf5AzytfB6C
 yjZxaKvSvMZ9t7bJ2U6htcSXtlpURB9fQldVYKJDX+JSZThZAvGoueznYTsdKJIgPm2s
 OuEeUqZBeeLti9VD9h+lv7bEJ03XKfuftHR2AqlZvFjxWrPaBsplQFFQ1WjgabraSlG8
 AV9NS1MtE5zAWZ9fbps11iyoCFYSYYIVsiHU84zSerkpCZ5ZaIC/O4+aZBSVSGjnTZh6
 BtLs/oBvcRIaX2cfZyHJkq6n1+Y/zbtdr7Muv7YgZTJlQsCsp3fg1psts5a0N0t9wCV9 1g== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3k35htb12k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 12:53:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3w/UiGeeYu/9OPP9kl+xdw3+P9z3RLid4zBupNH2In6AHYPDVqvdFMvLh4T9wbHj+RK9dmzb3TCusn/seLbk/cHgxXC6+1SAabbNsQDbkk7csq3RzGn1qoJljbTX38LjQSpQvqXfIg+GatqolyfIlzihmYk2JpHRu2ZWB7BWh/WHAT/yyT+3YlR0tveoOpKRKdp5zvpqBlX6u6nnYL7gluDLtLyJ/CId5+n62yTKn3BQtrX3Srj7XSk8E+kFqq9HxfFNjF0DDFJjXgN2YGBU44qGt5budAOlU57+vaPTAkIWGhYYkvFNJXtCmNQYU7K/yxvPLKCOVVYG1KQ8sIw/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fhw7XFE/ybWR4LcmavQD14dcf1XCmxbM9l/2pt4Srtw=;
 b=IcX12j1o23P+JKod6Zj5/RxYCPZlfpeUNcnWjXS3EUVGvka5VD22u+Z0ZDqtHWbPz2hnm37JQ7IyCcsgh77fVPT6r0JrubAtrhLoPrquag1UPbbHhXEGWJk3ytYd0IC5j0kCxIiRFGmOe+OufRnFwWeSP1x1+BxFWRubtJYSzgMa8bjOii7kCzt4EDN02K0le0ED4xoaG0Y+wRfEXfdogmwTIxgqlerg5EjAMxTrTnsKIE5kBru1shkPTt4DSzPqOSw09SzZ18F+XM6bsdVav5BoDoJA/SHdpZz28dtaM2u4RV1Gwv2Q2s3FzoaeZPTQPP8pwlt+kecddw394trkUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by MW4PR02MB7316.namprd02.prod.outlook.com (2603:10b6:303:76::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 19:53:50 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::a88:8114:7d28:5834]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::a88:8114:7d28:5834%7]) with mapi id 15.20.5676.038; Wed, 12 Oct 2022
 19:53:50 +0000
Message-ID: <9f02255a-ceb9-9ca6-2606-b91c5e9e6459@nutanix.com>
Date: Thu, 13 Oct 2022 01:23:40 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
To: qemu-devel <qemu-devel@nongnu.org>
Subject: MultiFD and default channel out of order mapping on receive side.
Cc: Juan Quintela <quintela@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::25) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|MW4PR02MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: 50acb49f-85a5-46ce-5aa3-08daac8b7ba8
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AnLSi4dq8X4AAdSf4N+jxNkUj6OC2zkPS9hXv3AAvmi2FUU2MmrR7PWblfQEbK2UzpsLdkxbRcBgFKSI1fBAGIQjFDB1iL51X+4IihQxQWmzRjcAb2z1vZ0Xm4d+Tns2s8E867QF1Ef+aYkCwfY6Z+PMqd7vjb0w7shsEjrxeqZrJ35h0DLZqX+R4jrPGJjohJ234CX8nCUF2pzDPv1KAc60rJP2jN/1yBosEZGw9dq/LwuTLs38YtBmX3u7vEo/O8wm/uEOiK/NVsDGTg2duyGRAoG3+GoVVcvbIENthG+UL9QBw4cYV9LZiBHEjUyiCQ8gMH4hkUaiQs2/EKMZbU01sTfvth11rtgMPVoRp8jIxiftDBE2de5NdyUdo+twCa8cyVtwdi+ZTjOB7MWtk5wrgdIcAHsCSRyGYqZ7VFSHJFiAaoC+AyR4NfVVS8oBfxp79j8uhIL6NVDyiv41ejZUm/paaoI5hIBkHSxhHDxnSYMXHDkPS7D96OoREyf01mFYV3oVHdZhEmGej+cFu3iief9hzPOhySw7T5/JCjanv/exJPvE27QGFYKEqsJPg07Ba5CGxN40uDPRAG5GiHipMn2MQ8I72/nQleyZVCkwy0Mdqv3bZq6K/F21SOx1STzF7LZheB6wgXxJSww86oHO+bo3RbQM9rWLrMcM1X5RJQN8F044pQiiSZXa+8hMnbzDq3Dypy6pYucxty3DC67v1zNaFz+m/8EkqrVXShWvgfi9So4btor8+DEVFz1tkOwzu5aE/g55/p10AveRZ1yHKBW+fCJfPuUOkUFS3ywktwny+FZKnpvTSYTa1lLj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199015)(36756003)(31686004)(86362001)(31696002)(4744005)(5660300002)(38100700002)(41300700001)(6512007)(186003)(2906002)(26005)(6506007)(6916009)(6486002)(8676002)(6666004)(478600001)(316002)(2616005)(83380400001)(966005)(66946007)(66556008)(66476007)(8936002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmdKZUZCd0taK2VUZUlFUytnQTZPOGJNMHo4OTZzVjQxNTAycE9yNjk2cGFm?=
 =?utf-8?B?Rk5idDB4UTNNTDBHMmpGaElLbE42Nmh4RTJTUWEwRjM0VDdiT1FMMDByUXdX?=
 =?utf-8?B?YW9RMzM2Ymlhb0FUWnNHM21lelRiREZHWG8rTG93ZkFVU2lNV00vcHFvUUpO?=
 =?utf-8?B?SHg5L2k1T283QWxlRDdZQ0puamZ1V2N0T0ZNOFJFeXRteWFsSTl1NkpXeW44?=
 =?utf-8?B?SXFBa0lIaGFrSHJzOEZQc1RPa1ROcVFqbGswVGdwaC9TekVER3JCdzNJMTVU?=
 =?utf-8?B?dG5uUm9CQTE3Tk44UUQ1VytCYTJxRTRoeG1MRVBVWmRJa2FyVEtaYWRUMFpZ?=
 =?utf-8?B?Szg2SGRPZGFTa0dQSjNOdGw2a3JsQWhSMk4rTlZwZjd2YXhVY0U1ZVU3TE5h?=
 =?utf-8?B?SitYWEM5V0s5TTM1dndhUk1mOTNYS2E4VHVOMnF2ejB5UUhsQXlJaFRaeVk5?=
 =?utf-8?B?NXlZUUhIM3R1b1pQV2F0eWRaaGVPQVlvWGtLa2wwL0VZeDl3U056YitDTzdn?=
 =?utf-8?B?VlJ6UVlzM1JNSis5SUs1UWljY1VOUXhNa0dyWEpzaDFwT1g1bnlITW1aOEVD?=
 =?utf-8?B?ZE1oLy9tQ0kxV0pCM1ZSUzhqQkxhbEx3TEN6NG5IeG1lODhyZVphei84dUpP?=
 =?utf-8?B?aHNWa3NJTUlmdFNTTUM1ZEhnLzUzNVF0VnovTWJobENqMnB3R0hjeFRqZk5L?=
 =?utf-8?B?SERhSzR5V3F0bE1SZDZIOEpCQUgyM3pzK29PemMzejhldWhlbEoxdm9tRzZJ?=
 =?utf-8?B?WXNSS3JacTBIQVZZVlg1bXdEcjZFODZod3NvNGdOeXl3bGdvYlJwMkpEMjRK?=
 =?utf-8?B?N3NiRHV3anZRSFdXNVNYc2VFS3llWHhYNk04VVpQa1pxcXJsK0FuUWNpOThO?=
 =?utf-8?B?SjUvWnhzaTFkQzJqY01PcHM1TkRaYjlMd0U4V2Z4WEJQNTZWVXc5ODZNMTk0?=
 =?utf-8?B?dDJHajIrREZCQjI0RzVESTVsamRTd2V2cHh2ay8zNnpuQnlaU2h0eE82ZXp6?=
 =?utf-8?B?ZUVWTmYrL3UrSzdsWWRLUDNnQ2dlb0FPT1lBSWg1TzQvcXlIeFpXbGxTdG15?=
 =?utf-8?B?MkVYbU9RQ3pYWW01MzNYNGF2UUxCRHdYTVdmUFNHb1Y1N1cvaW9KUGJkSHZm?=
 =?utf-8?B?emRoak1PVU5NNU1KaGhXVGhEWFB4Y3RZNkNLbmVVV3FDQWNkU0E4T3dFMUU1?=
 =?utf-8?B?d2pVVm9ubjZBM3RQUTNhRE13NGhNcHRpOThrbW5zR0tJdkNtT2NCbFBtT0p3?=
 =?utf-8?B?UDN5TERpOUtRWVhDZGc2NXBkNDFwejBlN1pSMlFRelE4SGNMYU0wVzU2c3NZ?=
 =?utf-8?B?M0Z3TDlZU285WjVQb1dsTHFvQWJ6cVJ6M3IzK2JNUkx1Tmo5Uk01V2dpdENV?=
 =?utf-8?B?Z2JGUUF1RHVyMHdRc0RRV3Z4Y3pKMEw5VlhhMUdwNGxsRzliczl6cHRST09w?=
 =?utf-8?B?VSt0SUEreTdJT3RYa2psOVhpZFZGcVBNWVN3SE9qS0Q5b2VmRjBmZWlhL3Q3?=
 =?utf-8?B?WkRwdnMzY3padEFXZlI0a3Z2OXM0c29MSWlFQjE3MFdVRk10Q3ZGSnZKN3Ft?=
 =?utf-8?B?SkdRZ3h3N28rdDUvdTNTUnIrYkEzR1VYZXVXeU5VQVhZaCt5MEFhWEhOM1dQ?=
 =?utf-8?B?QUxUZlV0dFZXcnBUREZXUFA4TEZ6clBRaWNxaFp3NzlMcFBsZlFOZUt4NFRn?=
 =?utf-8?B?bVlFcjhlK3hiM2IvYkJLTjdkZGRSWm85MDRLSFdmS1pROGZ0QzZQejZ3Ulc0?=
 =?utf-8?B?ckY5OTBLa0ZmRjh4SVFsN3RSdjBybnZOZy9qN1B0NHU4bXIvU291ZFdLdHlH?=
 =?utf-8?B?d3JlWXY1RDJaZ05ER3NkUUthVHpVZ04zeGRqaEtwb3BLNFdtbkhCbDNyMmE4?=
 =?utf-8?B?NWlZSEpPc1lVUlZnZHA5blpxWjlHa1R4TFM2YTVpelZ5RVQ2YkZ3MTRIWFZq?=
 =?utf-8?B?VllEbGFaaFZXdFQwUWxoZCs0TCs2ckFoZDZyM1BEblJUdEd1M1ppSUdDbVlo?=
 =?utf-8?B?VU9wbDNWMHRNN1VaMmZnOEZnd2VjY2duazFENWxKbkZaeWkybzZFN0dKMFJ3?=
 =?utf-8?B?Q1AwZ3Y5QVBMcWVWMTVQUlp2RTFHRFZqVDBXQnhtOVYzUTU2UWtYdEFLRG40?=
 =?utf-8?B?UUoyNTJuNnN4ZGpvY0Nvd0lQYmRldzRjUzQ3RlY2S1BySkE1WG1SUXBid3Yr?=
 =?utf-8?B?Umc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50acb49f-85a5-46ce-5aa3-08daac8b7ba8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 19:53:50.5002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WjKvNjYZVM0ftiRiq0vmnBFoBhaUwHcFus1IVVNm8cgIU/o8UhVQGGrQz2hE2Sd+rJbjREl7gasSXlWNMipUmKnBmDziO5qMARuRlBTN7q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7316
X-Proofpoint-GUID: jAqkqaiSkBu7R1Rt_oOGUYdgLoPZSoM1
X-Proofpoint-ORIG-GUID: jAqkqaiSkBu7R1Rt_oOGUYdgLoPZSoM1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_09,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Everyone,
Hope everyone is doing great. I have seen some live migration issues with qemu-4.2 when using multiFD. Signature of issue is something like this.
2022-10-01T09:57:53.972864Z qemu-kvm: failed to receive packet via multifd channel 0: multifd: received packet magic 5145564d expected 11223344

Basically default live migration channel packet is received on multiFD channel. I see a older patch explaining potential reason for this behavior.
https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg05920.html
 > [PATCH 3/3] migration/multifd: fix potential wrong acception order of IO.

But i see this patch was not merged. By looking at qemu master code, i could not find any other patch too which can handle this issue. So as per my understanding this is still a potential issue even in qemu master. I mainly wanted to check why this patch was dropped? Sorry if mis-understood something. It will be great if someone can provide some pointers on this.

Thanks
Manish Mishra


