Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A264C4EB3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 20:25:29 +0100 (CET)
Received: from localhost ([::1]:58524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNgDY-0006W8-JT
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 14:25:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNg9V-0004of-QJ
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 14:21:19 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:16332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNg9M-0005R3-J0
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 14:21:14 -0500
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21PFbYJc015312;
 Fri, 25 Feb 2022 11:21:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=rCK+bQnTs6TuUWE/XKT2Y8AoQ10j0Ac1eAtIZg3Rq4M=;
 b=CjELTASH02Ub4btr27qVpPiIHNDo2eWGEj4iZkuP/fHQsXEtgWziNvmhMePx2rjtuVkQ
 JoArD/1kbtwDDDlgA/uO39HX1anu/o4TKrXZFlIvYu5XIF+2EuSobk/tBsMjvOjfXRzk
 eRj6UrC0FDqEvYFhoLtS8fkvTtGjAYvGV4Tbybedm0Vqy6N5iWwsOFuZFzCBn5cEJYvK
 g0NSWZkDkmRYV8O2cR6erpcFd/CmA4NHIofL4oMS0T9Ds5hrMvYZ0DYwKuZTD2coXrH4
 GwRu0VYSAtBYgE60hCfBVLNijd4VuRYJ4vGORxM4mqXnsxdV3vH6IiXKGl99DtINbszo AA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3eetkg1dek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 11:21:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KeMyTCSPCpE3VF7wGA8lS5EAk4iKnEKSZ2vJy++H1OP2zz3wUQ8b3p2gIVbBoXU9jFvLXO9YiGorpeEBmRIo1BShGOo5aGADR9B0IeDbkqpeHUn9qKQAcsYZXWt4amJVTNSw6CMyWO1rhCeUrDW3qoNdiPrr9ylpnOdO6n+xBbQRyHrhx7YdteawTa1JZE4UMIlOgf98air70qXWdIPerkmR/0iPQYrozCL3YkYNCOKmnCCnX4xrI3bM57SjIBeEB8Z14Soh1wMB+H1nCv9PnEd/7BIIdOmqbHJFD9qkmtAbDs3hAoogvzrXV473N5Myqz0SaalnUF3YNYiGYLfOWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCK+bQnTs6TuUWE/XKT2Y8AoQ10j0Ac1eAtIZg3Rq4M=;
 b=Iw7J9TqZFVPVWQvZARzFF+qJqE5PDB55FshM7fkmxORaEtRHVfrz8kb5HgpJQMAN0WrejNStuW9jP2ULVqKggfJcXjFQFNOWOggVKRq3R9Uajn7dfXCsDMRpGwdb2ArKAl7adMPX5KhgyrDh6iimxSGz96Z0Ibv/+IIPAoG8lQF2Z5axpJNHxcgTKTL2Ko7eTKLIYYbnaVWI04IVM5kGPo9hTAq3NxglQHDRmET0YX+zTK1lxvBS9sBxCiqdYnQ7T/PrQbpp2Nrng+LHqXhNrUT2dL9WOOnbXjza6nshsbBS34S6X+rQoRVkbhYIFpaYCeMWBnBBgLV5iZspgoU33w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by MN2PR02MB6286.namprd02.prod.outlook.com (2603:10b6:208:1be::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Fri, 25 Feb
 2022 19:20:59 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab%5]) with mapi id 15.20.5017.022; Fri, 25 Feb 2022
 19:20:59 +0000
Message-ID: <bc505c44-da9d-c0f0-d4c3-853ffb78e3b3@nutanix.com>
Date: Sat, 26 Feb 2022 00:50:46 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220225115830.177899-1-kshitij.suri@nutanix.com>
 <YhkqIvI/a5So6g8Y@redhat.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <YhkqIvI/a5So6g8Y@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR0101CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::16) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b34860d4-69cf-47d8-7de2-08d9f893f430
X-MS-TrafficTypeDiagnostic: MN2PR02MB6286:EE_
X-Microsoft-Antispam-PRVS: <MN2PR02MB6286695C1033331D2D9FA151993E9@MN2PR02MB6286.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rNqJXIR3MlUEs3ljZM+/cQpnEa0ya/Lt3h9LaqB5DlNwCXTZr0HJbkqpbqoTRbjQNpkQXFEnw/WRRAEyTSzVXI4ZWVY6Xb3lBwrEoOtUcYEe88kugDx28RgKAGEMytXo9YEdVvtIs9tKHCizgh4V/zZ3gQV31EBc9y/cRIMBUQBLcjmGuc39+c5g3MhcfMXu9AiZWNOylTQx0AiiNcOVnxoHNEtN0IaA6P/0aqe7PkXplvoIXVhAdNyMd/jcxA3cGyZ73dFrL6Howzfmvh2+bn/1wcMnVDnnpIvEcasHbXHFOR9iqLpqYpJ1jhQV/Ptl9/3kZbRwgU92GEJ5RmCwnop1t5oX144KQNSln0ev4SR8/cp7Cr0ZrZTF1DJiV7r5cXuDOgY3yt6ONJJK5vM29T6fsZOro7bfLyBEhoRE/EUdSifK+P05EwLj98N8l3SbIZ4mB0wgtl4hLqhSCQJJj8BYo4tBgiQVhiDoI12WYmJo3ua8uCOEhns6N6cqR3S/PLjIIl5AtxV4Fy6tP5IwHGVuf0Z2V1vah66WIcB3/ybuoXKBAzIWnplr+Ag1t0x2RcXDmoF7xnEzYHEDjW1F/kOIXEnAXp/zqEzWp969ySbb1kfuvXu41dEy2vRoYW41y9HZ/Ke5ZB/MvQVeI/14mWge0FMnaxz6dN02RJSsallpM9c6DsqzHoJuf7HrD/8uir0BMETypQbJRDQAbP7BPANb3F4f1o9BH82QZa8xpKoGY/seC6JS8GCst+C5s4loUZtcuSNbV99dIDM3uEjgCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(5660300002)(6512007)(6506007)(31696002)(38100700002)(38350700002)(316002)(36756003)(83380400001)(26005)(6916009)(186003)(31686004)(2616005)(4326008)(8676002)(52116002)(53546011)(86362001)(508600001)(6666004)(8936002)(44832011)(66946007)(66476007)(66556008)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVhHcUVJRGJVU1JlMmhtK1R5eEtEdElSTjFlWjFhdjB4MS9tSUdQVTI4bW5G?=
 =?utf-8?B?cTM3dkZRRlRzMHFhZnoyNDBoczFhV2NpQXJDaWgrbXdZbTYrdEltNlN5VUFa?=
 =?utf-8?B?VFlMZWtVcXRRNkJxdFVzUjI3a3RzZ2hqTnViVG1VMWhtWU45c2twTWlSajVi?=
 =?utf-8?B?anR2eE9rOGwvak40VkFjS1JZa3MwNWEvRGRKWFprY0t2Mko3WldyTXBQZUw0?=
 =?utf-8?B?MXh3K3V1V1phRmdmRkNSSHoyRUE1NzFoa3UvMU1zL1dZUHA4V1VTaXpuR3Nx?=
 =?utf-8?B?MWc2T0gyOWIzVFJDeW53YXRiTnJtV2pIYUxvSGhlUGc5bVBKME9iUlVCcnMv?=
 =?utf-8?B?Yzl6MG80UEI4QTg0Yit2amJGRllUNDU1SUVuTDlpSWMzc2NjdDBhS29yWjNB?=
 =?utf-8?B?aHkxWVlhbmRIeEplY3NIQ2IzOUpkWjRibFJvT1MvNUtDVHRjbUdNZTZLNUNP?=
 =?utf-8?B?TjRkak9wbC9hVDRpOEgrQlBmUmxCTlQ5dWJhT0graWduajJiYTRqUzBMWlpK?=
 =?utf-8?B?Qlg4blVpWC9VaFZWM1A4WDZJTktOTzYrY0FyVVEySS92M3FyRDcvcklXb3ZF?=
 =?utf-8?B?dkUzejFVRHFZTWR4MVpFb2R1OUdHS2hVTlRVOEJReWVPUE9jODRIdmhNNjFl?=
 =?utf-8?B?OVhyb3VUSm8wUnIwWHhkUVJXT2pXZzhZVGd6am1OY3RURXEvU2RkV0Q2cENH?=
 =?utf-8?B?Q3E2elRidGhGTlVJU3Frb2N6SjRKUzRuV1BWNmxLc2tqVkI2S1h5YURtR1Jx?=
 =?utf-8?B?aGhwRFZtVlBMNS9zY0FaWnFGVG85c2hDdHhjUVM0bys2L1ZwUDE3YmlydEJ4?=
 =?utf-8?B?TmthR2JRdWh2UEJTaThaZndCQ2ZqR1BVbU9lcjRJRW16Vktsbnh3TUtsMkY1?=
 =?utf-8?B?R0FTNFd1REpVYXFsemJzUVZvanFoR2ZnbzRudG9rbms4YlBIb1RjQVZPckRX?=
 =?utf-8?B?enVROVJveHc3bG0zdTNWRGE3S05IenN3QzFkK1FTaU93TW9TS1JjZkdSbTV5?=
 =?utf-8?B?SHpmV1JhRmkrSnlZRUVpdmRkWGMzVjFlUjMxRmZ0M255Q2FQaGtYREQ2ZmIw?=
 =?utf-8?B?T09wSGRNdStCc0xKU3BKSFV5NHRGQlJ0ZzBMTlg4ZXZkVmh1a1dGenlvbXRG?=
 =?utf-8?B?RmdkSHQvUG5pN21xTVhmRW5ldjJqQ0pLWFgvSVZuR0VURmgvam5NcGNXdnY1?=
 =?utf-8?B?Nk1Pdi9VK3FudG9paWhGNHF4dWdnK2xWUDRMdWRLRDRaMEM2OHNoNTRPckoy?=
 =?utf-8?B?TzR2NVZrQUpiNUlTUDVMRWhkMGUxeWRMcncrOFVPS2ttWUR4K0dGMTNoclR6?=
 =?utf-8?B?N2hWSTVMRnBzTUE5RzBwNFM3Sm43dmVOdnpRTVMzYnc5MHpCWjkxckMzc24y?=
 =?utf-8?B?QzJSZFZFZ09ZMlcvZU5KbGZ0UERDQU4rRkV2b0l0Ui9HaXdNNzRHTVhSUkpI?=
 =?utf-8?B?ZFdWWHBDMnh0TVQ0ZGFieVhQWlora25OQi9Vc3I3MDllTVdyRUQ0S2xNS1Y3?=
 =?utf-8?B?RlVXTXlieGdFQitCYUprV2RQeHZBVEc4bmlFaFRpeW9jNVk5Uytab0pJcW1X?=
 =?utf-8?B?ZGpyekhDZTNyNXEwbXZGaENVbFVZRWdkcnNmTkJDbnhxMm5tUEFWRUNVU2pQ?=
 =?utf-8?B?RFRUb0t5MGdLRHlxOGFHdERzdmpkMUphekFMLzJTd241SkJsN05tVUVmeVZ5?=
 =?utf-8?B?UCtjK3RRME9VQ3JmdDJxRERySHBJTHRjNmxCSFNlSXZhZUtZTVZWdm9SS2Fj?=
 =?utf-8?B?MXFXZEE3cnYzZkNGMGY1eGtWSHhaeExlQ21CNnBTNHlaRklDOEJCcjNXSlEy?=
 =?utf-8?B?QTVwMnMrTllwK2pXS0N6OFVDQTlkNmtxcVZmQ0hmQm1xWk1LeGltMlcxYW1w?=
 =?utf-8?B?K2hmNXZRcWhROTVjMDFKYVNJZXJtYW9PdFBQeSt4clVlT0ZybEoxQjYrNVdC?=
 =?utf-8?B?cUl1MjlZRXY0d0poYWxnc2x3S0I0NXcwL0t1dDNIRWVoeDBDNXQvMDJMb1R1?=
 =?utf-8?B?M0owVURZU3lJbHFaSDM0ZHA4RUV6WWlsZ2MrN2wwRjZQZHRCUk9WVkY1NE5V?=
 =?utf-8?B?cS9FWjJjVVhLeWJBTStLOCtzbXFBbGV5Y1BDek5ndE9EL1VXellnUE9sYmFl?=
 =?utf-8?B?Z201bDhNZnhwcVFaVG1IS3lFU0tMZk9CeHdCZWlzQ0trOVkwMnhURzB3OTFo?=
 =?utf-8?B?QUJqQU9tRlJXS24yZ0pHV0Y5bVp4QzlXMll5a0dpYW5rT0JTU05LYSs0M3Iy?=
 =?utf-8?Q?Zx+wTHpB1M3YTTQZetqB6S2LYZNCJP+DVZUEhtJKGE=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34860d4-69cf-47d8-7de2-08d9f893f430
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 19:20:59.1897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gV2FGQnCW+F918vn3E68Y1fN/xGR6XpF9h5YbI+nxU7Tw3uwL93RAEU+D0V3cKdXFBE13kqRcGpP7ltcA6tmYkbVABSmInc5wmYgBPGbCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6286
X-Proofpoint-GUID: h_hW8RHyu9y-fMPyUeAP8UwMMQ8E_7-K
X-Proofpoint-ORIG-GUID: h_hW8RHyu9y-fMPyUeAP8UwMMQ8E_7-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_10,2022-02-25_01,2022-02-23_01
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 armbru@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 26/02/22 12:42 am, Daniel P. Berrangé wrote:
> On Fri, Feb 25, 2022 at 11:58:29AM +0000, Kshitij Suri wrote:
>> Libpng is only detected if VNC is enabled currently. This patch adds a
>> generalised png option in the meson build which is aimed to replace use of
>> CONFIG_VNC_PNG with CONFIG_PNG.
>>
>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>> ---
>>   meson.build        | 10 +++++-----
>>   meson_options.txt  |  4 ++--
>>   ui/vnc-enc-tight.c | 18 +++++++++---------
>>   ui/vnc.c           |  4 ++--
>>   ui/vnc.h           |  2 +-
>>   5 files changed, 19 insertions(+), 19 deletions(-)
>
>> diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
>> index cebd35841a..14396e9f83 100644
>> --- a/ui/vnc-enc-tight.c
>> +++ b/ui/vnc-enc-tight.c
>> @@ -32,7 +32,7 @@
>>      INT32 definitions between jmorecfg.h (included by jpeglib.h) and
>>      Win32 basetsd.h (included by windows.h). */
>>   
>> -#ifdef CONFIG_VNC_PNG
>> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
> This (and every repeated instance) can be just
>
>    #ifdef CONFIG_PNG
>
> because the entire file is skipped by the build system
> if CONFIG_VNC isn't defined.

Apologies missed that. Will remove the vnc flag conjunction in the 
updated patch. Thank you!

>>   /* The following define is needed by pngconf.h. Otherwise it won't compile,
>>      because setjmp.h was already included by qemu-common.h. */
>>   #define PNG_SKIP_SETJMP_CHECK
>> @@ -95,7 +95,7 @@ static const struct {
>>   };
>>   #endif
>>   
>> -#ifdef CONFIG_VNC_PNG
>> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>>   static const struct {
>>       int png_zlib_level, png_filters;
>>   } tight_png_conf[] = {
>> @@ -919,7 +919,7 @@ static int send_full_color_rect(VncState *vs, int x, int y, int w, int h)
>>       int stream = 0;
>>       ssize_t bytes;
>>   
>> -#ifdef CONFIG_VNC_PNG
>> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>>       if (tight_can_send_png_rect(vs, w, h)) {
>>           return send_png_rect(vs, x, y, w, h, NULL);
>>       }
>> @@ -966,7 +966,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
>>       int stream = 1;
>>       int level = tight_conf[vs->tight->compression].mono_zlib_level;
>>   
>> -#ifdef CONFIG_VNC_PNG
>> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>>       if (tight_can_send_png_rect(vs, w, h)) {
>>           int ret;
>>           int bpp = vs->client_pf.bytes_per_pixel * 8;
>> @@ -1020,7 +1020,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
>>   struct palette_cb_priv {
>>       VncState *vs;
>>       uint8_t *header;
>> -#ifdef CONFIG_VNC_PNG
>> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>>       png_colorp png_palette;
>>   #endif
>>   };
>> @@ -1082,7 +1082,7 @@ static int send_palette_rect(VncState *vs, int x, int y,
>>       int colors;
>>       ssize_t bytes;
>>   
>> -#ifdef CONFIG_VNC_PNG
>> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>>       if (tight_can_send_png_rect(vs, w, h)) {
>>           return send_png_rect(vs, x, y, w, h, palette);
>>       }
>> @@ -1233,7 +1233,7 @@ static int send_jpeg_rect(VncState *vs, int x, int y, int w, int h, int quality)
>>   /*
>>    * PNG compression stuff.
>>    */
>> -#ifdef CONFIG_VNC_PNG
>> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>>   static void write_png_palette(int idx, uint32_t pix, void *opaque)
>>   {
>>       struct palette_cb_priv *priv = opaque;
>> @@ -1379,7 +1379,7 @@ static int send_png_rect(VncState *vs, int x, int y, int w, int h,
>>       buffer_reset(&vs->tight->png);
>>       return 1;
>>   }
>> -#endif /* CONFIG_VNC_PNG */
>> +#endif /*(CONFIG_VNC && CONFIG_PNG) */
>>   
>>   static void vnc_tight_start(VncState *vs)
>>   {
>> @@ -1706,7 +1706,7 @@ void vnc_tight_clear(VncState *vs)
>>   #ifdef CONFIG_VNC_JPEG
>>       buffer_free(&vs->tight->jpeg);
>>   #endif
>> -#ifdef CONFIG_VNC_PNG
>> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>>       buffer_free(&vs->tight->png);
>>   #endif
>>   }
>> diff --git a/ui/vnc.c b/ui/vnc.c
>> index 3ccd33dedc..1bf3790997 100644
>> --- a/ui/vnc.c
>> +++ b/ui/vnc.c
>> @@ -2165,7 +2165,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
>>               vs->features |= VNC_FEATURE_TIGHT_MASK;
>>               vs->vnc_encoding = enc;
>>               break;
>> -#ifdef CONFIG_VNC_PNG
>> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>>           case VNC_ENCODING_TIGHT_PNG:
>>               vs->features |= VNC_FEATURE_TIGHT_PNG_MASK;
>>               vs->vnc_encoding = enc;
>> @@ -3248,7 +3248,7 @@ static void vnc_connect(VncDisplay *vd, QIOChannelSocket *sioc,
>>   #ifdef CONFIG_VNC_JPEG
>>       buffer_init(&vs->tight->jpeg,     "vnc-tight-jpeg/%p", sioc);
>>   #endif
>> -#ifdef CONFIG_VNC_PNG
>> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>>       buffer_init(&vs->tight->png,      "vnc-tight-png/%p", sioc);
>>   #endif
>>       buffer_init(&vs->zlib.zlib,      "vnc-zlib/%p", sioc);
>> diff --git a/ui/vnc.h b/ui/vnc.h
>> index a7149831f9..0cabcc2654 100644
>> --- a/ui/vnc.h
>> +++ b/ui/vnc.h
>> @@ -201,7 +201,7 @@ typedef struct VncTight {
>>   #ifdef CONFIG_VNC_JPEG
>>       Buffer jpeg;
>>   #endif
>> -#ifdef CONFIG_VNC_PNG
>> +#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
>>       Buffer png;
>>   #endif
>>       int levels[4];
>> -- 
>> 2.22.3
>>
>>
> Regards,
> Daniel

Regards,

Kshitij


