Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EED690A30
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:31:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ70n-0006Xp-7k; Thu, 09 Feb 2023 08:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ70i-0006XB-86
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:30:48 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ70g-0001sV-98
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:30:47 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3198gNbg029603; Thu, 9 Feb 2023 05:30:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=5cLKbVepI1NZEKFjJ3zetzeoAzElCSk5IjUXlANoNbI=;
 b=mbU79A1564u3tBj5vl1fEAy2dXunhNuGdYjz58Doz7bY8h9Mc/3XgbuOJnSN8QanDELj
 pFxMmzYXUwQXx3b5+DAadhvfdeEkZziet6girDQ3a9jUJzW59FtQ5+T4PhpHYV0C+1kj
 rixm3BFuNTNU4KQZVVSqK4jzoeHpvkwa+xJ7piRA3Z4gwDpo2XoflRA0W+/uOrzXSTED
 aCuRhzH984Q3z3FFTCtvXko/VOhG4oRazyah+O8XPn3NDvD9IDIB8/PcwUA2Znnykd6y
 zVIb0lLqjV5FTb7Or2GvPlssICgphkbYzA3tS1gZjC5FNZouDsrJNtQaS4loLHSZv5TQ CA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhm5hyv78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 05:30:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i41J7c7sz8aTKWOrzzZ0t8UxUFetK9N7QGpRLdDcrAYHHgKJL7sc4YPh7KqTGBb/kGgkl8v0+zV7HH33sVxg0mSC7hcGrS3Qzmnr91iuTOBBAkiFDKzX1Tgvz9lLchptsljneKj7gvYAsO9nRN78uLI5JKJgXI8wV7UdCHhguVr5xKwOuw3d6L++vIDvw0sGyke7zKKg5rGvFAWll3Dg0xu4ju9Ur2w2Sexi2mwt/84J9iTkJTakccchu3W6tO6GJUYVPaqbDp8ag/oA+Fawi5zouUVHrixjxyG7UGvrUzdQsH0BTHNoQrSAPSMqmigALtElvU0IXNfEOxs3qkC4Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cLKbVepI1NZEKFjJ3zetzeoAzElCSk5IjUXlANoNbI=;
 b=cQ/o7+hyj+8JJtnJkYLqo3uWjqw1wqREIPHgoIeI8dyvg9l5mIi8E0CiDH9URhswFBsK8BFcqTu6fAadtM1fMBGOxW+hQBt1SlHB8tLd/Sf1YNjmRik9loE2lrgo6OtpwBmwxAvyQwD8F1icPzd8qtEr26d+z9kBZdeRLRrUq4a/dyw9euGo20Mycu0svQ2GQzSYWQUKx2z5QdFbUuPo3BGNpvkxNZwOmDYjJ/+1IFnHcB6uvm60Iy4uvNg4kkchwKw8uRw8G/+3ymOUpHfj6JDT9stU+kZKLm4TI+5cMNfw/Dy056sXF7MJoHGNLZQtnlJW5IoIfm8LNuV2GkE4rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cLKbVepI1NZEKFjJ3zetzeoAzElCSk5IjUXlANoNbI=;
 b=LRVR2nJk3c8JGtZNbDhNgXXOPOkTXFzDQgg13UgFecZ64nMtFnf6ePR96cWv7zRB8gl5PSt6sH3kFun7S0DGFybXPktnJbrfStY03Ubw3XAAK9OMBQSj4CmkC92wABtrly8Zw90cgXQDz6tbpCqfjcpVwUeZUrNqOg//Phhbx6UfnnW8nJs4jDwfLn5QW9fpISt0jY4IzY73VGE+T7q7v308TqOQ3Lpq8+y5dYKanZrO//nRrcA0PGph+cvxhN9woTKOAV5X6zYEHxaSCE5naWZsk0MG+EH9mcUAOPq3HF47l6sxDXqOeY5XLUA68N0oA8WFjyrs3GT6wIIM8BW63Q==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SA0PR02MB7115.namprd02.prod.outlook.com (2603:10b6:806:da::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 13:29:10 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 13:29:10 +0000
Message-ID: <c0235df2-cc1c-a522-3792-192b8cc68dba@nutanix.com>
Date: Thu, 9 Feb 2023 18:58:59 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/6] migration: moved hmp_split_at_commma() helper func
 to qapi-util.c file
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-2-het.gala@nutanix.com> <87y1p73v6u.fsf@pond.sub.org>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <87y1p73v6u.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::18) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SA0PR02MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bdfe9f3-b076-44a5-d7aa-08db0aa1a02c
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aZtfpvGbRNzrx72G7xiezyuWV217mz4GXwFBqnYmwz53kbGYOQTDgi/IJYLmYPz3ocshSiY9l/d9sb2L5HBlXkUiNsSc2aomw18oq3Y1PzqAdSRgCka218GEEO2Q6qpjVUV5u3arFfX1M7d6u7VZOwIhVdTtLkPIVSS6b1OHpaBV7xXIkMxkmqe5RaC+3K9Qni+w3ERZ2OF/bcEAclPucrTHbYicHS34dMn/pgtgqv9tdjBtYC+agoi8EVocNTja0jlCGd1VXy6k3RzCXGedEfcqsJCYgChgqSYpzS5fDqtURO2ActcgwSv94W69oZlZYWs8PaSEhCye/kKqVIj5GbcoG+rm2TCPMijD1boXwfbZe69veUK/3hZ7c53EgW4FizZYkKBqrpU5X/qPQi5FX9cCKY/Kk1ev9s4XXwCpKHR33HJAjmyW6f6tmr4HJTBYBfoOkjCkvRx7jaNGdabEGSV9eYxeSxojciHpw3wtpFmXBvz4DKuZnzHn52G4qKV8wXK41if+M85qtsj5zkiVJfY5+CS+DDxWywifIQGqDkt1hbHz2n/gkykOgDaw0+BHr/G4W0BhWVzyqGbtqy9aPfbiRPUBgMZeebqy0xJG9XI1FySf4nIUcC9r3To9fAfnUGw9GJqNmYVIVCEudeYg3D1Vx6r7oxK39MPTKXGWZ2RCWiuw6KS6OL0Ho00BzXJ30Ak0GcnHxyw2Gi2PgElmTVpnzL6EqXj6Vcb0TK+nD4+W9uFX7ONCuOU5NcWZrB3YNyZveKoKnlZ1NeXa0qkGog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199018)(5660300002)(6666004)(8676002)(83380400001)(66899018)(107886003)(8936002)(44832011)(31686004)(41300700001)(66946007)(6916009)(66476007)(4326008)(2906002)(66556008)(316002)(38100700002)(26005)(6512007)(6506007)(966005)(53546011)(6486002)(478600001)(36756003)(86362001)(186003)(31696002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFA3WmkwSUFtSythUVJaMjVMM3JiMEVNc0c2NnNJZUJJQ09xYWlCdXRXK1pF?=
 =?utf-8?B?N2oxNGJYT1plUWduY2xEYnhDbGJ5RUh5SWE0UGR1RnhTYTZIRnoyUVVBWHA4?=
 =?utf-8?B?V3lFSTlsYU54YVlEYWpiWW9tVDhZNWRiYXRTYWkxZGVFbHNOdWhYblJpWWZ5?=
 =?utf-8?B?THMvSGhqOHhQb1Z6eS9wRVZBSDFOeU1MVVpQYkdvNnMwTHFrbm1JcTJEeE14?=
 =?utf-8?B?YUd2Ym42WlNJcTJTM1ZzYXBCY3lFQllCMXZsYUpCK3FpMlZtbWFsUGZ4S2Nk?=
 =?utf-8?B?WWp3amFoS2RhUUk0bkhiUWliU0hXaVJNOFdxaTJNLzRkcUJMUkZSUTdKME9o?=
 =?utf-8?B?KzRYL3VGN0hHczIyeGtXYWwyMG1WNEszSks1cGpGREF6dkQrenJlNlFxeEJh?=
 =?utf-8?B?VTJVV29QNTM1anFzajN0UmR3TFMyeEVyeGhQQkwva29hK29SektyYW1ZSkRG?=
 =?utf-8?B?UjhIZlJwN0tNbWxNTEw2L3NsdnhTWXc3OENPQTBTMSt5THkyTnFBeEMwSCtQ?=
 =?utf-8?B?Y0dROUNUWjVYRytJSXpIWnhDbjlGSWxzb3F2aWpZeEVzcktXYXRmcU9zNUJ2?=
 =?utf-8?B?bjJDcDVOSStCaUVPUFloOFpjRTBSSkVSYk5pamhNMlNZSllsNHVsaC9wREdY?=
 =?utf-8?B?NlVyOE1WRDdtb0VtZktnVTVNdE5sdU9oVDRUOEtoWGF0Tk5kUTJ2K2UxSmlu?=
 =?utf-8?B?RzByYytMTEtrdHFkUUsvcml3REozNDl0ejNTME80Z04zMGV5eG1RTVppUmx5?=
 =?utf-8?B?YTBSUHBrWmVaN2FQNmp2NnEzL05qM0lJaC9GNnhIc3ZzUjd5QUZJalhnV2ta?=
 =?utf-8?B?ZEVZMHNaZnlwZ2pYeVAzSEFVNjI5M09sUkJVbFZCRnhrOVdwa2tRRDdCdlhS?=
 =?utf-8?B?YkFpR0xEVnFwYnhLSXNvZTVoVHloTVhsWDA2dS9xK1JZSDZjS01PcWFPRFhu?=
 =?utf-8?B?cGtxVCtjOFlZcy9nejRyeE9ZOEU1R3d5dDliOWJ0d3VSRlU5QU9iY2pIeG5w?=
 =?utf-8?B?TUkwcXlpQ1pEUklWOG9NNmdodUw0d3R0SGl3QUZvMk81azdBSGFTR2JPNmhw?=
 =?utf-8?B?QUNRQzhZM3BEb0gyQytRS0c1SXlUL0JPWXVQZXdzQnB0eGU0alF5TTVYOVFo?=
 =?utf-8?B?eTFNYXZoVVRDOHR5eWVLNm93bWhSUlQveERhQWl1ejB2T0xkdHRHNUdxZk16?=
 =?utf-8?B?S1FsdjRyZ1hPVjJzUXRiUXVLa1FjYjZQMEM5QWRuc3FSYllxQUlxRndoSlh6?=
 =?utf-8?B?enlCSS82OG9zQlZvcDUwR2VhQSt3WHFQK1VWTUZjU2pvVFg5OXp0Tk1XdVBI?=
 =?utf-8?B?QkFhc0kwU3Q0c1hBN0g1TXF1QU42Y1NKU3h4d2xCWEdNeDJnbCt5OEkyR25P?=
 =?utf-8?B?aVZUR1FldUZTSWRBcmpUcTJIQUFnVG10UkNNTi9yY0NRMHJONnU2WU9HL3Qy?=
 =?utf-8?B?ZWlZN3lmV1hZS2RiNGkvclh4UXMrVVQ5MmkvTUZlbjJhRXlwZUJ6bkZDcmJO?=
 =?utf-8?B?RTdlRmhVT1EyVXB0TUtkK0ZJWVk0RUdWdE1tMDRSWHkvejdBUEdVZWRvVFc1?=
 =?utf-8?B?bkp6RFNJdlZPRnhqSVR0dE1EUGpIM0tmaUF4MkM1blNBK1N6WVlXeTJjTS9r?=
 =?utf-8?B?SExQaFVvbDVzWlgzL3RYMnY3WUVZcXE3VVpHTitKbERHQlBEVW80TGVwMytw?=
 =?utf-8?B?L1FlU3Y5dGtybkFQSC84TGxnSlhQc0cyUnZWUUxCQWxLMG40dGE1TGZVL2N5?=
 =?utf-8?B?eEwvcjV3d0pKZzMxN3k3YkVDTCtYZmRTNFUwTEdYR0ttTWpjSUdaTko4Ty9O?=
 =?utf-8?B?RW1TMDRCRms3MXBHKzBkajdCeGo1ODZWVm1SZnlmYWY5bHJ0aDg1RC9SR2Rr?=
 =?utf-8?B?SVp6dm4xb2Z3T0N5TW9QMEhKTVQvcUZJTmRvcjNCcnNIN1M2M3JvKzNDaTlU?=
 =?utf-8?B?ZnhSQmJ6Z3Y4NXdxbk5IQUlXeGZUVFlUUVdLMlEzMzNlWmYzcWVNcnFJME82?=
 =?utf-8?B?ZGlJek43Q2s4bnJ6SnY2Ylg1bWwrSVZFVWRsNkllRGZHYlZTN0Y2c1ZuVHN0?=
 =?utf-8?B?alNlbVVZRk44Z3JkTkxVVEJ1ajB5ZHJyeEl3U3JjaWxQd0VUZUU0Y3JobzdT?=
 =?utf-8?B?VmlPbDZjODNsVk5zSlI5NlBpS3I3dkpzdUUyMlRGZlE2d2VucVp3blBIZkhq?=
 =?utf-8?B?Z2c9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdfe9f3-b076-44a5-d7aa-08db0aa1a02c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 13:29:10.0268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGt8NQf+P+EeWZZeD4V1g2Pb7C0RSnXdt+X+FjqCef2Fk6VDR4O0m1urI3DQa3xaKFQfC4gbk/LDLF5/6yH1Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7115
X-Proofpoint-GUID: ZWtBLvaNQJcGceumDk1kYRuyshfUs7Es
X-Proofpoint-ORIG-GUID: ZWtBLvaNQJcGceumDk1kYRuyshfUs7Es
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_10,2023-02-09_03,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, SPF_HELO_NONE=0.001,
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


On 09/02/23 5:30 pm, Markus Armbruster wrote:
> Het Gala <het.gala@nutanix.com> writes:
>
>> renamed hmp_split_at_comma() --> str_split_at_comma()
>> Shifted helper function to qapi-util.c file.
> Not an appropriate home.
>
> If we have to split up a string in QAPI/QMP, we screwed up.  Let me
> explain.
>
> In QAPI/QMP, data is not to be encoded in strings, it is to be
> represented directly in JSON.  Thus, ["a", "b", "c"], *not* "a,b,c".
>
> When you find yourself parsing QAPI/QMP string values, you're dealing
> with a case where we violated this interface design principle.  Happens,
> but the proper home for code helping to deal with this is *not* qapi/.
> Simply because QAPI is not about parsing strings.

Yes Markus, I agree with you. But we are also supporting 'uri':'str' 
right now for backward compatibility. So splitting of string might have 
needed. But I misunderstood a crucial part of exec string, and hence had 
to introduce this patch in the first place. Daniel made my understanding 
clear now in the 4th patch.

Now, there is no need to introduce this patch. In the upcoming patchset 
version, this patch will be dropped.

>>                                               Give external linkage, as
>> this function will be handy in coming commit for migration.
> It already has external linkage.
>
>> Minor correction:
>> g_strsplit(str ?: "", ",", -1) --> g_strsplit(str ? str : "", ",", -1)
> This is not actually a correction :)
>
> Omitting the second operand of a conditional expression like x ?: y is
> equivalent to x ? x : y, except it evaluates x only once.
>
> https://urldefense.proofpoint.com/v2/url?u=https-3A__gcc.gnu.org_onlinedocs_gcc_Conditionals.html&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=-qwZZzrw4EKSsq0BK7MBd3wW1WEpXmJeng3ZUT5uBCg&m=gAsWrkiPm3MCpqkWQzGYo9-M2_2bkxfDAGmW8lgXmOAnW2YoDs5AhxGPt-Sc5xI3&s=Onmed5Fm0PImk6PD44bAvu8yQDrGuYU44yRYAw3Abjs&e=
Ack. Thankyou for getting it into my knowledge. Will take care from next 
time
> Besides, please don't mix code motion with code changes.
Yes sure Markus. I apologise for not knowing it earlier and introducing 
such a patch, but lesson learned :)
> [...]
Regards,
Het Gala

