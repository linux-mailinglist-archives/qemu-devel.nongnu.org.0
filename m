Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB8C52218B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 18:43:51 +0200 (CEST)
Received: from localhost ([::1]:49066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noSxh-0005wb-Lw
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 12:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1noSwe-0005Fq-Im
 for qemu-devel@nongnu.org; Tue, 10 May 2022 12:42:44 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:2390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1noSwb-0004Ks-UN
 for qemu-devel@nongnu.org; Tue, 10 May 2022 12:42:43 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24AAj6xf004823;
 Tue, 10 May 2022 09:42:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=pKLGD42zWiBYnNcu05AFWSlZ7pVs6enDKJhJTQRA4DM=;
 b=lz57FkCcPEJ7889JlZ1RlUI8BT5TnlP5PsY0oTntG+/4ZP7ldsIj73omm/9g/7i7IPAX
 4hrXRxJtcenTM9bV2ud2Hc7QwohWpV5yOiHAZ9Ho/x2tZAfER2GhDBYsoqbkMU54WnFO
 Aajhdr/VWnFeBumw5atbOsZCoSKBVwtm1drrMF9QcZhenOYmMm8Bn0ADERfqPeETzt7G
 Hrz+AG9qAWymGZ8PQlK6wXLAf7wNuFCqhCt22IE7AqUfLgIIxwKctGn4F62YDByIrVaq
 +r+JMbnw9WpRAXIW3lzaKNTQE9C1E6XoaQ1UPMz4IkxL2RFZWvEtdBkE7ycS+dexqw/2 jw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3fxyxm3eqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 09:42:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhwgzTKDIStc6POPiAkdpxPeWJsF7Oqlm+nRchQj1m7hanNjszk37tFQmJVp8jqGkhrIXvHtdYsNSmMhWwZ5i1Nl+q488nWhafiTO7kX4wNu6bZ2vuMdIOIxJFBV2j9JMS5N1+a0H7iFLa6WM8gPWkvHF7XjruZJYPDX+NiudFiT1MAmkUQgz0RH8PUsVvtUYzs4qYT/ajjfybU9VhAyiS4F39/D4VkJ+B/oxiTCcPN/Mj6XaMiOvhxBAIkJXWOPmRtyqsivk9o6mBY73IjMHPU6TdMjY1dG258bmDDYD9ACZT5KM7e13qmKMnQqxKV/AhMQJwHQmZ1Plm4VPdmitQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKLGD42zWiBYnNcu05AFWSlZ7pVs6enDKJhJTQRA4DM=;
 b=BasZ96wNf29ETcj90hXzkpodl/DfXg7ZwiZSxWAo9dwixmXiTNBBkWjbdqMo873X/3sU6XULjGcqPlj3g2D5F53uRaTkQ9TgavJM0EJ9Y+cIDbgKJ6ktYFCkmGLSzV6b6f+DvHQj0L6tDFGgK+50n//8grkPB4o8ojDNmBgbYpWrcavbaxh14rFGkYuFEd5ZyVXuI7Ce+Agae9+Zifa5oR3bdC8LhOhTIUD3qxKJgYxEojXQTt7w+iwwwH1v98twMNy58LHkdsq46KGb/SFx+amMlI/8NepWooA93+zdQOd+GOuCvZ0TJTsy4gCdzz8TzwDuNJTny6NVLXWjQVEeRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by BL3PR02MB8298.namprd02.prod.outlook.com (2603:10b6:208:345::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 16:42:36 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::852a:4c2d:6243:8c37]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::852a:4c2d:6243:8c37%4]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 16:42:36 +0000
Message-ID: <34e338be-94d6-a8b0-2c13-e979e7fdf71a@nutanix.com>
Date: Tue, 10 May 2022 22:12:25 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PULL 3/9] Added parameter to take screenshot with screendump as
 PNG
To: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20220427172952.2986839-1-kraxel@redhat.com>
 <20220427172952.2986839-4-kraxel@redhat.com>
 <CAFEAcA_9+1h2rBKfyvcJ5AHnisW_+WFM8ZK5jCErfvNTBk3OzQ@mail.gmail.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <CAFEAcA_9+1h2rBKfyvcJ5AHnisW_+WFM8ZK5jCErfvNTBk3OzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::10) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15d3fa99-bd1a-42eb-9b66-08da32a4167d
X-MS-TrafficTypeDiagnostic: BL3PR02MB8298:EE_
X-Microsoft-Antispam-PRVS: <BL3PR02MB82981A444ABC3100B9889D8699C99@BL3PR02MB8298.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: byBYdDnxmO5SAIPcYbOxy7dP4tU0j+Mf8dbbKiEIfGjMqqeagGLi8sbiGgWIqWr+mBsY7/uRy27t99oEXzTrZQa5+uavr++bMTg2BmSIwic1lVUZAD8CUWLyZ1wrQkmpZvt5DCGn4mZ+/89Wku7HipLJGNPOY7Ck7Qarz5nCj2b4Ixx2ZoTJeN1BSQh2CD4s4wUBsilXr8pvsYEEMHx+pzXynSmACXIHAkItp6CEmO26IgO5Nx6dKIOqpQw4yjNhR1RpTJhxY+p0UIM/F5SY5hKZ6B90/JA/exZ5onfRfzC4TCojUd+rjiWc3buehJmRE4+aaPfXSMEMBy+mN6G2u8vgtC4k8NcN20UmDAPCWkFAz/EFKSu/I2y/oHe8qnl1XYai4E6eiCPDAUpBUpRri4tvLJ4NzfHeK/FKjrLRVUvstWFDH/eQLEJWJdRss15eXBAc+DqWPXQZwTTlhIDnvyeORY+XjiYgATMlnCryNL49wAZM2pZFR6dc65UTGxi1ZWKgJXPIN8RoEMDaqL0R4DS6pFHQKB7o7yYcFnKXAAt4y/5ciPmFVhHJBGNESQDms1cM3/1eQni4fBQmCdAcWTjDzrb649BcEoYchEoPfB7UtBKV1FHTjtuSzD4ALz1u7cf2E+h1QOb17QfVSocWgqvmlQZ4KnVtEJsZ+1QD6Y1a24qXTgfvKJYGJ2ikpJgUTPjAMe9n6F20Hd4bfi74mGh1qAcEkT+1hmJ58zlkl33yV2I4FFmE1Xd9E15nMWgkmP7PJwJHltmVYxd98laoJdjcRfIszqCAdMjXalXzTj0opvSQvSCjAVYa+EFqLudlCb/VHF7c59MC3vf0R+9n8ZHKy3ufBHAAN4pSuArc2wCD5uqSZp3YqylJf7T8MG7o8+zrbyEk4H6iv79RnRlZSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(54906003)(86362001)(316002)(66556008)(2616005)(110136005)(8936002)(966005)(4326008)(6486002)(6506007)(53546011)(6666004)(66476007)(6512007)(26005)(52116002)(38350700002)(38100700002)(44832011)(8676002)(508600001)(31696002)(2906002)(31686004)(83380400001)(5660300002)(36756003)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekE5U05tN281NWxoNS9XTXNOZW9jcHNYSHk0ZjV5MEMzUUFNNXhLTWI1clE1?=
 =?utf-8?B?R0RIbUYzSVBvc1pBNVExYllVYzcyMzQ0YjUydE95YTg3Zi9HbHdQRFJBZFZK?=
 =?utf-8?B?Z1dJMk9Wdk9POUVMVkFqU2VJdXYydThnbTNjcjIyNTFuejJLWU8xSk9mWHAz?=
 =?utf-8?B?dCt5MWl1OXdtU21ka0ZyV1JSOThSVUVnZjRiRCt1MXdyRVY1VTAwQ2wxdjY4?=
 =?utf-8?B?Y2UwemJsOVkrY3JTWnlINXdqZnZ1bVhPTUVZV2NJR2I0YnQyT1RTSE1wSWlY?=
 =?utf-8?B?WEd2R1h0cStRc2FRVzBpK1l3ZWx3eG1ud01iUE5OMHpPVkRYM0E3NktONmVI?=
 =?utf-8?B?ZjY5ZnUzL2h5bWNJV1FqTU9PQlNaS0lxaE9xSXJSWnVPdmloL1AxT3FXMExw?=
 =?utf-8?B?MzdNcjcxZDhyaWU1eGNLUmNYb1dyR3R1Z0t1eVpEYzRaSDdBOE5MYURCdCt2?=
 =?utf-8?B?WHdsemIxcGxqWS9zVmVxTkl2RDQvRUJyVGk5azZIVCtJdnFlQ3ArWVZ4NE9V?=
 =?utf-8?B?ZHFnSldrTWtHM1UwcEpybEFuMzc0eW1tZXRCc1J6UWh3cGhrQ0lKOU1XTkpq?=
 =?utf-8?B?ZzJuZ0ZucjFIeE9MRkVlZUg4N0E5V3NZZDEvcjl0dEFPYXZsWjQ0NGdsTVZW?=
 =?utf-8?B?TWFCa1hBUjVDUktVWE5IYlRnVFRRMDlYcDBaVVB3cXk3TUFCMnVzYVdVZzVG?=
 =?utf-8?B?NUV1WVppL0Q0NkRod1pYeUU2OThwV1hDM1JFZDRLdVpXSWJ3MVNCaE0wYkZT?=
 =?utf-8?B?NjhPdnBORk0ydW1GWEszVDRsRTdYSmp3ci9icmhUWHB6NmUwRGdNZkl4S0k0?=
 =?utf-8?B?QXRwd0g5UTQwWHJpVGRENnhHZUNYNzl4T0xQd2NhdU1lRGZLVWRtNDY5Z2x3?=
 =?utf-8?B?WmNIUDNiWXNob0pmZ2RzR2RWZnkvd3ZabGlXK2cveUVjK3E2c3dnNXRkdGUw?=
 =?utf-8?B?bnBJbHU1dlljd3NGRUlLdlhmakZvWWFIMUgyNVVqeVN6aDFwemFoOWNkb0o4?=
 =?utf-8?B?dFBZK1dPZ2NHY21mOEM2YmxzTnFVSjRQTnZ4d2s3NzF5QUowOHRvbVNHb3JD?=
 =?utf-8?B?cmhEQk9BbHJSc1NqZkZTdG44czVXd0hiVHJNbDgyaHdKM2EwNFJJUHFUQ3Bq?=
 =?utf-8?B?RTg5bEpVM2o0dGkrbERaRzUzc2U4NWdta29acTJDVERNakMwRE1hUlRxcXNT?=
 =?utf-8?B?VzdoYUVNU01qVTNiVEljWkRRNjhNSlNQNjluOWFlTVI5OTJ5MmZkVmNFNFBV?=
 =?utf-8?B?bDd6VW84Z2RPMXZXbUxUT1ZRQ3d0ODZPVFBXVUR3M3JvaXk2aDhvVjJMU3RR?=
 =?utf-8?B?Y1RIWEZDNDlvN3h4cTg5MWhLb2ZPVG5RT05MMnJYVXdqaERLZmwrM2JkelV0?=
 =?utf-8?B?dWlYTmdVRE5uVElpWmZYQ1BhOUtLYUsxUGNUMzVkM0pTbEpiZnQzbnFzcUlr?=
 =?utf-8?B?USsrTmJ4cmw3Vm9DdDQyU2FTR25Kb1VvM2pOcmNuclVMZHRYcnZUek03SnFT?=
 =?utf-8?B?VjE1aWQ1SmpQOW50SXZNUFVwWHJKbHlIRFh1OENybG1ocE9rTy96eFAzK25I?=
 =?utf-8?B?QXVOM2hHcWZFc2l0Z0h5YnZoUVROY2kyNzNJRDhUR05pNEdCcXBQOUE1Zkkv?=
 =?utf-8?B?ZDkwWVFYb3NvdHNHUmZONGgrK1o0elpOSWd4OWVNbWR3UFRQVGdyZEIwbXBH?=
 =?utf-8?B?d2IrSkplWWN6TzFyVUUrVm4wR3ovdHJPTUJhMklNZGI2VDdGWE5pUDhRdnRx?=
 =?utf-8?B?OWlrbHJCcWdlK0dnZXdrdnc5bjRmeGZURW5CZHJRYkJZd0cvbzErdVhJMm9z?=
 =?utf-8?B?dWNnV2JuYkJwblFFQkFFWkJtcWtIb0ZTRUZxYlpsYWZ4dWIxOG5YN1dYaWtt?=
 =?utf-8?B?aEppWkdCTmpweGVhYzBTd1Q2M2pKbWhYMm5qMzRLZ2xLeDhvbHk5ZmVzcHg2?=
 =?utf-8?B?RW5hTktjMzk3M1paZUd3YzlGalBZZ0o3RXFMOWNlUmtqTW1yWDYxb0xVQlNO?=
 =?utf-8?B?UFpzK1VyUTZsTnJoRzBZWXdJeWpZQmdUWTh4OUVhUFVDYnRDTGdJY3pvbklL?=
 =?utf-8?B?bzUrWm5yalB3WTUyWHh2UXk1cVM0Mm83Mnhad0pPa0VqZnU3MmFjV0RHally?=
 =?utf-8?B?TUhaYVIwbXZmNllsYTFreTNYd0paK0ZGcUdPV2JUY2YrbDFMVDhsamxIYTJ0?=
 =?utf-8?B?SjZpTndydGVWUEUrVFA1My80bUIrQUJEUlAwSS9Nbm95UXhIcDB3cUZFem1s?=
 =?utf-8?B?eDdYRVdqU2dWZHFWeWRSQVl3a2x6QVhFM0R2L2hxWFdBa3pGQ0Z3UjlGY3li?=
 =?utf-8?B?TnJyWVBuRnVmMldhSCt5aDI5MUN4WTE3Yk1HL0w1ZFZ6SDRCTGx5dUJxcWc0?=
 =?utf-8?Q?3guewDvbtpRjFu3Q=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d3fa99-bd1a-42eb-9b66-08da32a4167d
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 16:42:36.2827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkPjam0sidtcosVjE3SX9RhZB65attIQveBXU9R3AUfHOqI7BbBwV+ehgmVGtuo318uTESW8HCerMUCHc5zuvj7gv1pee3a4NgXBCeJyHvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8298
X-Proofpoint-GUID: i1tmy1xtzBaZakqHQbSZu974Oa1EjXsv
X-Proofpoint-ORIG-GUID: i1tmy1xtzBaZakqHQbSZu974Oa1EjXsv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_04,2022-05-10_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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

Hi,

I have sent the fix out at 
https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg01980.html.
Would be grateful for your review.

Regards,

Kshitij Suri

On 06/05/22 7:07 pm, Peter Maydell wrote:
> On Wed, 27 Apr 2022 at 18:33, Gerd Hoffmann <kraxel@redhat.com> wrote:
>> From: Kshitij Suri <kshitij.suri@nutanix.com>
>>
>> Currently screendump only supports PPM format, which is un-compressed. Added
>> a "format" parameter to QMP and HMP screendump command to support PNG image
>> capture using libpng.
>>
>> QMP example usage:
>> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
>> "format":"png" } }
>>
>> HMP example usage:
>> screendump /tmp/image -f png
>>
>> Resolves: https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIFaQ&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=0pq2lv0SrogWXtqObS7lzBUp-Bbw4WYpJvheEOrvaMJrptl2ORkHDcDVKGuyG95V&s=T8YakRJNie_5nF8LIdJvsiSogf9iS7Ytlc205JIcaYQ&e=
>>
>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> Acked-by: Markus Armbruster <armbru@redhat.com>
>> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Message-Id: <20220408071336.99839-3-kshitij.suri@nutanix.com>
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> This change seems to have broken building the system emulator
> with --disable-vnc unless I also add --disable-png. Specifically:
>
>> diff --git a/ui/console.c b/ui/console.c
>> index 1752f2ec8897..15d0f6affd4c 100644
>> --- a/ui/console.c
>> +++ b/ui/console.c
>> +    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
>> +                                      NULL, NULL);
> ui/console.c now makes calls to functions from libpng, but
> the commit didn't do anything in ui/meson.build to tell
> the build system that this object file must now be linked
> with libpng. Because vnc *does* correctly state its dependency
> on libpng, builds that happen to include vnc will link OK
> by accident, but builds without vnc will fail:
>
> $ mkdir build/tst
> $ (cd build/tst && ../../configure --target-list=i386-softmmu
> --disable-tools --disable-vnc --enable-debug)
> $ make -C build/tst -j8
> [...]
> /usr/bin/ld: libcommon.fa.p/ui_console.c.o: undefined reference to
> symbol 'png_init_io@@PNG16_0'
> /usr/bin/ld: /usr/lib/x86_64-linux-gnu/libpng16.so.16: error adding
> symbols: DSO missing from command line
> collect2: error: ld returned 1 exit status
>
> thanks
> -- PMM

