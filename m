Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37956EF23F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:40:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcYh-0006qg-9J; Wed, 26 Apr 2023 06:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1prcYd-0006XL-RY
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:31 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1prcYb-0003LJ-40
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:31 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33Q9C5YX007211; Wed, 26 Apr 2023 03:39:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=Q5c9Bft6oCj8F68Vw6VTPIp02u5ipDSIxSXgEDm9bmI=;
 b=Pdd6PbkFGzoCA4HxuwQybCetFkRw+FoJ2cQBDCx1BPYWbOzcTzlO1TDV6ReivyTKUh/9
 8tBaZHKJ1sc1GbotiCMrANUSfFQB+8z2pZ2uKs3/I5TCTQeXPY2iEAwKqtZOvvDFLfeR
 3CGfVFMp8jg4jQB9x7ri1GYz3P77LwsZYBH4YFNlLipsr/5se1mTyQByPVLyIaelsbyq
 YhjZhO1clDYY8VwXOWG8CPUOptpI8pX29/nxU4EatsSIJjOV7v3HUb05rJohxYr7wzlD
 9XolZJhDM+XOH4gGKRKDlUHRSDNEuQnJfhgHPNDnxz/GFM/AzusnHHlbdb/3Kk64df5B 2w== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3q4enhrr7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 03:39:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9nAbrUzR7DsQl6FeimkzKFXVJ9Amzll1bEJsISopRdOoh/il+1CytGN3JbYVHPBm9YoYEHIMEIBfaTsQ1A1CJ2fAMH9xIxvSLUv5KNmIjQi07U1RdvYMBXURzHo3XFRueOa3FmOwF47+0+C0CfiAoh3TKDOjQeJt35GG+/PlC8ShFbyBt4iKedE0fZYrqXT8qIIgrXNknjAMZn0R4uyolpwxaR4hJ89SiwPd5HcBmsLEnYVIgnw6DEwhmv2liLKUhUH62iORtJL6u0KUE+nCVFYYajeaY3fzbyC9zvugK6qdelS9K6OYOTCqV2XJFcMMzWqxIj34bg+7VI3d/tu1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5c9Bft6oCj8F68Vw6VTPIp02u5ipDSIxSXgEDm9bmI=;
 b=BgxnDEQZaQb1yrm27NI3Luzit/CWTi7cPPAdl1eO/88+nRvzwwrcAoU+1FcaCFvrudXFAqUNDZRZ6FA7Sry9MMv9wo8vk4DSqyiHoQCnjebWxGqBaYpPTHkqJSys/fFebVBAhmFCmT7vpAjmn4BPiLiRLfVQ11v/bEo3TLSDmAC3F4Af6WgmqGvihq/8PjiXt7zRT4slxOIroCm651UbrMoh45Kh13ptkKn3Srl2nVrv3B7c5+QQIqKzyQ6F5QEWlRqs3PVnnDBlepxu8FnZq9SQ9mtPRfVEYwzkTRwBfps93UXqhtYBObnX0nS3LZKuu0gZ3WFebrlvB0H5Nd8Pbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5c9Bft6oCj8F68Vw6VTPIp02u5ipDSIxSXgEDm9bmI=;
 b=ude11jyo1ssfodD3dTbHBrCD0E5+kpZw4F2R0HcWc8vbbGMye8hJnRgbYz03TBPj76BS87B4lmWXXSTa+0qovjeJtmONqVF+iWM/h9IjxAMV/JthSO78/zvSd9WnOqwGQmHA9aJC+cf3l7pWFerDQTA91nxIChXKn9+7TQdQJ7Vi4aZF/xLFTSW7dTHORVVB7e5PbMXPbhfB9IFZWp8iGFne01ZFvk4d4/LVr+VSy8F7nChwZaaSmf4SW+W71U33/+93kIhBWMFlPeOF07AqqWGkgQDh+127g/9eBprbFPDTk5HY4hmp2D8w3+Xq6aVDQsY5zGZ+6hAjm2Dwhow6ng==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by BL3PR02MB7858.namprd02.prod.outlook.com (2603:10b6:208:33d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 10:39:23 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::f2fb:d9ab:6983:b2be]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::f2fb:d9ab:6983:b2be%7]) with mapi id 15.20.6340.020; Wed, 26 Apr 2023
 10:39:23 +0000
Message-ID: <b87ce3c6-6426-eab1-95ef-d02eb83ab9ff@nutanix.com>
Date: Wed, 26 Apr 2023 16:09:07 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] multifd: Avoid busy-wait in multifd_send_pages()
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, berrange@redhat.com, peterx@redhat.com,
 dgilbert@redhat.com, lsoaresp@redhat.com
References: <20230425160555.67373-1-manish.mishra@nutanix.com>
 <87v8hjey3b.fsf@secure.mitica>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <87v8hjey3b.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::20) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|BL3PR02MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 701e5f62-b536-41eb-c086-08db46427fa2
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UoiPn8ce7ZHJqtJjSE6gefYjTcvexngFwo6udbri6mjUygoSVM/4PV+kDWXNkfNwjp91J79Q8q7KLMRLP+tBRog65hxwR55SHZmzX2nvlgqmLOhHtRXbCFVHAH0KHPI4/5dGQBZBbAtFsKgH5IU33s/iWwkZtI2On6yAtYYMq8QrGasd6bYKRhUihZYw+jx10Ook6339TwPWdvIUFkVKVuWiY8Znu0EOzmkqzWYHbu+whHiZwuKhKu/YtmfQjTwdFKv8zu9Kb3TuQiGq3A956vDHu5ArnsfHdxsGsYxrbYSQgPaedcynlShDwfyN/wvKwsxkFyXoGBv7B3FRnXPU+X5+7I2ZWBdJezdXXFBymRu+R2Hybwz+YAyW3pj5j6WZxDXoVsD/3hFlV3QjID+ywomgqUmuWmpLvfDBabJYfh1ApQMlOgz7NgCYjW72S6MbfEMzM5LTg5B8E3jjW11OiwR16vmZE2dHtOT5ZTeSUw3cIEybeyyfphuLKFLeQ1hgoBy6jsS/gSq8DP7dfTihpFEaWYfvYuYO0hJP3jvkUr1MdtaRu3zY4kQFfi60TRefsUEjwetOk7p2RCR/Ks5JjTIAY+3Kr0Ol13dgA06p9AXu4CZJUejy1E46uuRfcUDH2JrNUWGzBoPrKhlGvx9T9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199021)(41300700001)(2616005)(26005)(6512007)(53546011)(6506007)(55236004)(5660300002)(8676002)(8936002)(31686004)(83380400001)(38100700002)(2906002)(4326008)(316002)(6916009)(66946007)(66556008)(66476007)(36756003)(31696002)(478600001)(86362001)(186003)(6666004)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUFjS3dHSmJkUXFyS3ZFNzNFTi9kY0szZkFHNUpyNFJxb28rMlhSa2JpQnpp?=
 =?utf-8?B?VHR1Y2NPR2V3NTVjazFoM2JOV2JLcS90MVZWUlc3MXNXV3Q3enhtNStzdmhE?=
 =?utf-8?B?TU5oZENqYS93RDBBVkJCNTJZTHlBQ05wNnF5WVJUanhTdVZPLzhhNHJDblVZ?=
 =?utf-8?B?TG1WbnlxbEVFbGhpYVhTUDNGakh5S1RQQmpMMi9Vb0lkTmhidTNFMVREcFo1?=
 =?utf-8?B?citPQzU0WTdyZEN1K3p3MnNGN3gxZnEvWThMZS8zTXZZY1BhaUdjY1NLekVo?=
 =?utf-8?B?WlhNdnMxRWI5ZUNBR0REaDE2cUNnM2svK055eTVTTW9YeGdVWlo4M3hLRHhq?=
 =?utf-8?B?SEQ0RnYybWpoN08zd2hOcUc5d0xkU1lxNGttakoyMlhjUzRlVmdnRUtrMDY1?=
 =?utf-8?B?TkhxNUlKbEljekc2YktrdVA0K0tZTWVZdE9Ua3B1MEFsR3VqWUE0YndvVWxK?=
 =?utf-8?B?TXExY3UxUVpoaWFQS3duOE5PTm5IMFh5bHpjbG03aC9vRm9CcTFVQ1IvdTAw?=
 =?utf-8?B?N29uejFDQjQ2MytGRzdIcE4wNGxZVkRKeG9BMThPMTZYUFhWNkRCRTBkVDR1?=
 =?utf-8?B?OEM4QzFoS1FoclVHbXBhbzRtZEZpUHFlb3JGS2EwVlhFMFJWMmkzNWE1cFAy?=
 =?utf-8?B?dDJWeFlsR2VodmxTT0daTW94eUhreU51WnJFRXg4OEwvRnRXdllIQllnNnlF?=
 =?utf-8?B?WkFMd0t1U0l0UWhJRGx4dnFjb1RTRGRFZlJwR2s4TjM2ZmF1NEE5TUpMeHgw?=
 =?utf-8?B?ck1nNFJDY255SmdnZGdIY3dFVmgybWZiWmF3UUY5bGsyMWNUTFZFOU1jSlV5?=
 =?utf-8?B?eVljS1BYVU0yTXlkRUlVaDR3NU9WWUdsbDJxWXJJOE9KR1RzRmJrTVJIdll4?=
 =?utf-8?B?N0V5dTQ1QXBVdFlIY2FlbzNVM0VSMDQ5L0pBOW9wZ1ErRG9kejlaS240U25v?=
 =?utf-8?B?T1FXSGNuZnhySGQrYXcrNnVoTmczNG1WcS9sZmZ3dGFWc0NIYnFMcndmNjly?=
 =?utf-8?B?SUFTRnJYeitNUzRNNnhSR1E1bkpIaS84bTdaRmp2UnEyL3crM3ZJaC9zRDdR?=
 =?utf-8?B?cFh0Wkt5WjlHZHhyczVISXhQSDZQSFFua1EwTnN3WUNIQzJtLy93N2lqL01Y?=
 =?utf-8?B?bE1NeEVsbVZlckpRSkZvN2hrOUVBYy9wUkR6dk5tbGNjaWp4MFloeksyMEVZ?=
 =?utf-8?B?RzREQmhkK1JTM3BYKy9ZVW85d3lNa3dad3ZkUFk1S3ZialhodGtoVFJPZjA3?=
 =?utf-8?B?SjcrUEFvNmR2WUNvb001L2xYQ2dUbGlFQ20zRUVjSjJBU0psR3YwMC9sZW9i?=
 =?utf-8?B?ajZZSFRzbkI5VDF5T0JUeXNHN2NXQm9uVTQ0bHI0TktsTWNqNXRGM3ZRaHJV?=
 =?utf-8?B?cnFGQTZhSisxSEhGTk5SZUo4S0NTV2x5NHJFRVVxWDkzTFlLZEFjb2ZydkFH?=
 =?utf-8?B?R0NES0FHYUN0RmZGYW50TVlXQnZGMGFHNnFQWW1LV1F4RGZ3dnJWOHd4VldM?=
 =?utf-8?B?MGh0ZXVFU0lPdldPaisvcVRFSHA1aUZiRWcyQWY4QVRobFIwWkhtdzRQOGxS?=
 =?utf-8?B?WE1CTTJya2lYSDhqc25xd01Yd0xpMDJaVXI0ekt0cmxwcHQxY1lVc3poVzNV?=
 =?utf-8?B?dkhTb1ZWV1pFTVdNSVBCVEtvOG9zYjl2ZVg0Qk1vZXd4QU1MZFkrSHBwejlH?=
 =?utf-8?B?T3V4d3d5Ykhvait4ZUc0YURHTEMreVo2N1lxYXU1bFZxOCtScy9xb3JjVXUw?=
 =?utf-8?B?ZGxzeG9kL1c0cmU1T0dwdTViNXFIN1FtQ2IrTFpFbDc1cy9rTkVqVUxDRmpi?=
 =?utf-8?B?NFFWdjRqTTRlT3Ura2c5NEtqeXlJVjNkUWMwNXU1RVVUc2c2R2tyVGk2bjR4?=
 =?utf-8?B?VXNYUnUydkZkSjNzUVdjRWpLVWVZSHdxWWpkMC85OEtud2p1UUs4M3phRHo3?=
 =?utf-8?B?U2lOSUdvVk1INVljaVhtbmpvT2JoSHY5UVAvREQxaXRjQ1F2Umd2ekhnUTFm?=
 =?utf-8?B?RWNFbVRMQVZqTWMwclBYbW4zdHNGeVl2MitZbmJ3Z2VEU0JkeEJmMnVlWVM5?=
 =?utf-8?B?VElSWGYyUnlLNlhkN2NJSmpFUzFsUEFkQVJDQWVtRzdTZnNyWjVBU1JkMnZT?=
 =?utf-8?B?Wmx3dWc1dThzQ1d6MkhSNWsvaUVJVE8wK0Y1WTZVMjVET1FpVk9pL0dBL094?=
 =?utf-8?B?Q2c9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 701e5f62-b536-41eb-c086-08db46427fa2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 10:39:22.9846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvX495FnoMAIHcX3uPBo7w9xkG9XUHvMCudIqzxU3YlUxL4BqbMDQzL0nNwwj2S6R426K/wqovQF1GHWslNV3r+TQDG+dp7NFhohOb989Iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB7858
X-Proofpoint-GUID: QhYEqh-WTSTeEWvtCGYvLo_pXP1yYMEq
X-Proofpoint-ORIG-GUID: QhYEqh-WTSTeEWvtCGYvLo_pXP1yYMEq
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


On 26/04/23 3:58 pm, Juan Quintela wrote:
> "manish.mishra" <manish.mishra@nutanix.com> wrote:
>> multifd_send_sync_main() posts request on the multifd channel
>> but does not call sem_wait() on channels_ready semaphore, making
>> the channels_ready semaphore count keep increasing.
>> As a result, sem_wait() on channels_ready in multifd_send_pages()
>> is always non-blocking hence multifd_send_pages() keeps searching
>> for a free channel in a busy loop until a channel is freed.
>>
>> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
>> ---
>>   migration/multifd.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index cce3ad6988..43d26e7012 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -615,6 +615,7 @@ int multifd_send_sync_main(QEMUFile *f)
>>   
>>           trace_multifd_send_sync_main_signal(p->id);
>>   
>> +        qemu_sem_wait(&multifd_send_state->channels_ready);
>>           qemu_mutex_lock(&p->mutex);
>>   
>>           if (p->quit) {
> We need this, but I think it is better to put it on the second loop.
>
>> @@ -919,7 +920,7 @@ int multifd_save_setup(Error **errp)
>>       multifd_send_state = g_malloc0(sizeof(*multifd_send_state));
>>       multifd_send_state->params = g_new0(MultiFDSendParams, thread_count);
>>       multifd_send_state->pages = multifd_pages_init(page_count);
>> -    qemu_sem_init(&multifd_send_state->channels_ready, 0);
>> +    qemu_sem_init(&multifd_send_state->channels_ready, thread_count);
>>       qatomic_set(&multifd_send_state->exiting, 0);
>>       multifd_send_state->ops = multifd_ops[migrate_multifd_compression()];
> I think this bit is wrong.
> We should not set the channels ready until the thread is ready and
> channel is created.
>
> What do you think about this patch:
>
>  From bcb0ef9b97b858458c403d2e4dc9e0dbd96721b3 Mon Sep 17 00:00:00 2001
> From: Juan Quintela <quintela@redhat.com>
> Date: Wed, 26 Apr 2023 12:20:36 +0200
> Subject: [PATCH] multifd: Fix the number of channels ready
>
> We don't wait in the sem when we are doing a sync_main.  Make it wait
> there.  To make things clearer, we mark the channel ready at the
> begining of the thread loop.
>
> This causes a busy loop in multifd_send_page().
> Found-by: manish.mishra <manish.mishra@nutanix.com>
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   migration/multifd.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 903df2117b..e625e8725e 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -635,6 +635,7 @@ int multifd_send_sync_main(QEMUFile *f)
>       for (i = 0; i < migrate_multifd_channels(); i++) {
>           MultiFDSendParams *p = &multifd_send_state->params[i];
>   
> +        qemu_sem_wait(&multifd_send_state->channels_ready);
>           trace_multifd_send_sync_main_wait(p->id);
>           qemu_sem_wait(&p->sem_sync);
>   
> @@ -668,6 +669,7 @@ static void *multifd_send_thread(void *opaque)
>       p->num_packets = 1;
>   
>       while (true) {
> +        qemu_sem_post(&multifd_send_state->channels_ready);


This has one issue though, if we mark channel_ready here itself, channel is actually not ready so we can still busy loop?

May be we can do one thing let the sem_post in while loop at same position itself. But we can do another post just before start

of this while loop, as that will be called only once it should do work of initialising count equal to multiFD channels?


>           qemu_sem_wait(&p->sem);
>   
>           if (qatomic_read(&multifd_send_state->exiting)) {
> @@ -736,7 +738,6 @@ static void *multifd_send_thread(void *opaque)
>               if (flags & MULTIFD_FLAG_SYNC) {
>                   qemu_sem_post(&p->sem_sync);
>               }
> -            qemu_sem_post(&multifd_send_state->channels_ready);
>           } else if (p->quit) {
>               qemu_mutex_unlock(&p->mutex);
>               break;

