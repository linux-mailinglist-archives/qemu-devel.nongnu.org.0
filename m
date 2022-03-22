Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109984E3C06
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:55:42 +0100 (CET)
Received: from localhost ([::1]:40596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbEr-0001zb-5c
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:55:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nWbCL-0007bB-Aa
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:53:05 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:29756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nWbCJ-0002wD-3p
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:53:04 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22M67bvf026511;
 Tue, 22 Mar 2022 02:53:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=NnCL8Ditel9thnB97S6mIGBctBhyEFP42QA8Ow0Ptyw=;
 b=sBci6BO9+JLsAZUYG9C7jZWkhm/JnZjRs39HOASkvnP7NPE0Mm9bXScCBMlgY9oLlf9u
 u1b78gSwV5y7GhkC3JYFdnT/HMydtvz9SDaFXpFP9LpOROlU6WMx29tdh2/Uuc03WYQG
 asAAlcgrfftHMciBBsHdGJdKFOHb0rddJBrlmzGTWC82q38WadYdqbFz/Y0Acl20/nO7
 aYmIQ/3wnlINN+nSJMqF7AEhESWoykoamQQNcyLUDZLSMpij6TEe1y+7yB1U6RCQPuaP
 62cGPkB1oNA2qSOAYS3Xovs5lUw6ItkC5EJzqrFCAroPhsk042E2sKz5ormewvUp1Yy6 aA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3ewe8ewf6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 02:53:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKjAkGWHHN962zlPKtfoqdu7eTz4HZtqoupQUTGwb4wO15FHI71+IG90Bz9lq2r6E0qvVBee4hRLwr3AqdkHj9qf7b/pdfDDpPI5xqYBSbgzjb1IuxQPo4RSouY3XMbpbQGsVxkcd0M5d84avgI6II9590napre5GzsiZzvP27Y4m00fblGFunV0Hkre1dDUL1YshxWIgGwhyCblKtCKDoXbWi4IySt4DXxJCl4wI+WC2UuI9qWx3eW6iBmqwLbOGGiYcOfPxlJW1Gk45XgC5GDabf9TPQ/LuNkIGnRtQneY0j5GgEG9FHO9+gGKAMlWMySBEW+MYNd1XjbmTsOhNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnCL8Ditel9thnB97S6mIGBctBhyEFP42QA8Ow0Ptyw=;
 b=d5Jv2kSSdpQwda+xBIvvNAHVTSTaayEoHkxLn60woqwabR+GzggZ5ZFK2fpQYiUAHTJLP6j7i1TRlk4teSffu+yXLz1kRhgVhkmLqEc2rKgcWXUkNmayZu0TQvlpy/a/OzdHJCfnFcE8G4CK1z7W2xUGoWt9waIysDI+O+pNz9+aBxYFW8j6uvF0+VeCyq6YvOnncH9VlYvy8ygobl4VbkN5evFgCzQpAVh2SfUqI9G9fY4aU7K9v9MqYD2frzF5cW+UvP8Q7ZSusNkM56BhWZX6sgPe9SPqXeVMBrYWEUc1b/Hx25xDw6Z2LoRnFyR1AFWFKT6Iehjk2tFXpOuKNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by SN4PR0201MB8774.namprd02.prod.outlook.com (2603:10b6:806:201::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Tue, 22 Mar
 2022 09:52:57 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 09:52:57 +0000
Message-ID: <86e8d586-e14c-d8fa-c378-0566a62603b0@nutanix.com>
Date: Tue, 22 Mar 2022 15:22:44 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220322081845.19680-1-kshitij.suri@nutanix.com>
 <YjmZ+TdhAOAg+H73@redhat.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <YjmZ+TdhAOAg+H73@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::32) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d974479e-cb4d-4144-3e10-08da0be9bdca
X-MS-TrafficTypeDiagnostic: SN4PR0201MB8774:EE_
X-Microsoft-Antispam-PRVS: <SN4PR0201MB87740540ED2435C16999328699179@SN4PR0201MB8774.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bZlB9x1Oz3ITKS01oOhEoiIdnGPt09iBwjeyN7h62ALiryy6ulaZr3S8gK4gIwFLGaDUFbBIY/mryO6lo7PQzgZ/9js39pz2HlZTHLbYlkl6myW01jXfBI1XC1eodNawfJ7VqHwLA+YeJO+F8UmyIBNEqqthYU4fbtwiQXug673iM1xb0MV1j+wOB8gAKVz5kER6RHrWvCbNE6Zx52iPmr246iSiPBBkqMU49uEDeCnyeLJ399kV+8FAbz3A2QXsSFQpTJH/GeBnEOxfj1wu4pQMWURQcUbzPtsJbu3u+SYd62LaggfvB33YwZ9AnNAeJwGN1KpZUle4c3toLXqOO5ADusBzQtotuFpeVdN0Xl+FhGUyIdxSTyJE+eU8dXNLRcW2kghasrB0IGLlmZcyRbAsoN9qC9wXV9cnbB+Xo+F8211SQghgFgJ0oidBgqUPkOhTahilcGK+9GzI5avPKwV0f/5oThshfgN0XsadxOxRrpG5lCVFiIHp92JbBt14uI9CrdnxLwce2NP8MQrFoJhOgyQ3EgZ7qHfFcXs7j8gFrsdaaewp/eBVaiXFuCQngyUAe2Xme0LzUcrn/oSIz6ijpl52jtih56W9/rtupUNg5/GgH6/1eR2osGA/JOTfuQ9XYvOcRd83JhnlhHSIKPh0ix/HEQd23AP5ViGap6+SZofGkT0BVXkhqGAG0jQko8KBojJvb2SuR0QQAOofo5KHIyWS2UlvK8X++68m15TYLypZjYEPqhrrrs07xcwcyX1ycHnja21JAYdcJkwnZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(83380400001)(44832011)(66476007)(8676002)(66946007)(4326008)(66556008)(6486002)(53546011)(52116002)(6506007)(508600001)(6666004)(2906002)(31686004)(2616005)(186003)(26005)(6916009)(8936002)(316002)(5660300002)(38100700002)(38350700002)(36756003)(31696002)(4744005)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDhBSnVPV0hmNzJxOTVXdWdZZTU4alduN05iOHQzQjJ0R0VjeWdLdWdYVkFK?=
 =?utf-8?B?REN5NTg0YU9lK0pKZmFWU2w0NXlIb284NGpHRHBNbVhIK2QrWFA0Mm9KeW9N?=
 =?utf-8?B?MFMwd2tadnJtUEFjRDNkRmdPT1hFNDhNR05lOE5YbHI0aGtlUkg4bVRvb0hH?=
 =?utf-8?B?bkViUThTbnlEbkJxMnh1ZkFUQjFjemNUSXZJSXZpRElYbGoyNVVpUTRQS0FL?=
 =?utf-8?B?YW02Skpyb2xsMW1SczVGMGRTLzBDMHpoWFdFYVpSc2k0OERyVnNyRytkYSty?=
 =?utf-8?B?eEIxK1hHRWJmMnZmcnFYQjBUbmNzUUt5a01mcDc1YUlOekhkaXA4VnJPR0hV?=
 =?utf-8?B?dlNEL3ZPcUE0eDZtZUlQUjdqdHB5NzFxNDNzVmQ3UGozQ1oxQ2dZMDgrQmRX?=
 =?utf-8?B?VWJ6L2NMNFFPcjFUekpJUml0SzJTbzd2U093b1FWai9qZWJCeW9USlZqK1hk?=
 =?utf-8?B?ZE5yL1RDemlnUW9DdWpqQUs2bHl3cTZIdmhLYzltMHJ6bTBqa3NuRnFrdWxw?=
 =?utf-8?B?UTl6ejZNbWsxeDdlMHkza2NPdmpQd3NJb0lFRE5mU0d4RXJMQStWOWxpMzJQ?=
 =?utf-8?B?blBTSmtBbExacXVwYURqM2F0WlMwMW5OK0IvZ2Y3ZFBwbmdNMUtTaUN0eTJX?=
 =?utf-8?B?Qi96aTlQS2VZL3NvcWZtNDU5L2FYUzRnKzhPRm1YVXIzanBvbytLOHowTTBH?=
 =?utf-8?B?NXdWcm9GeFVCUTZMKy9vRDVmWVlJYXFtdG1kMnFYcjRoVlhhQUFlSzBPSFRW?=
 =?utf-8?B?ckQxRDZSTlZ0czArZk9seGZtZWdHL3hGQWJzOXZXQk9EWkJqWGZCL0pPWFpx?=
 =?utf-8?B?QTZrdmNYNnVEa0hyeWR3WnhVVnd5cWhwSnZselJVWTJXZ25MMjRxL0hjREJx?=
 =?utf-8?B?SXpHVzBtN0t3NHlTOC8xemI2VGJtd2dKcWxaZWxITUlmdk1sR3hyTzZFbXNL?=
 =?utf-8?B?djVsbWt1dFFWSnYzYVZTSHRyWlhlSVNzeHBrdVMwZFUvQTlRd01uNGlzWHhr?=
 =?utf-8?B?UUE3SWtzK2JRUHBPWUVmeG1QdEJBRW9tQ0pmMitBY1hCYXVDQVdWNDdHdGRK?=
 =?utf-8?B?c2FncW1XSk02WHdRWHliZm8xV1BjZzA3UVMwWmpVeTdCVEU2R2t4Q0V3ekNs?=
 =?utf-8?B?TTV0YXpndWIxMlpkNFV0eFphUTlLMlZLaXdIL0Q3azI0UDJQR2RsZDhOaSt6?=
 =?utf-8?B?QlNkV29walZhZ01uZlhFYm1IWGxEUFk2a21BVk5PYTVQNnRHYjFHdGJIbUtW?=
 =?utf-8?B?ZjczcDFmYVdJKzJ6VEVxZ3Y5QXNzMmVJMG1tWWJna3Q2RUN0aUlkUk9GY1Rn?=
 =?utf-8?B?NEJvOGZFVGM3TDRqcWNxNFZ1UVJFSjRjdy9XK1BhR2ZrTkUwb3FxSXo2OXVI?=
 =?utf-8?B?OGN0c1J1aEtmMllrM0ZLZkcxUkFsVThNS3lmNnR2MXdHZnV1OWRKUXBrd1p0?=
 =?utf-8?B?U1ArN0xHSm0weDhlSlk1d1k1czF1MEFQaEhQcWx0WU9QV09XYlpJZFpkSmpT?=
 =?utf-8?B?SkZXWXpyT0kySm9KMmtEUFNjRWttOXgyNmIzTHdocGFzNFVra09WZjJ1dmtW?=
 =?utf-8?B?Z2M5NDF6T05pOGdKK0M0NGZxdmMvT2xhWXl6bzNqNUw4SW5aTzFrV2l4TWNW?=
 =?utf-8?B?V214TFdrTGsxZTYvanZ4QVlONnBXSjVzSVZTcHhsTUcxRWRCTzNyNk05cWRj?=
 =?utf-8?B?a09rQVZRamxtVmMyN2pXSXNjQUlGeUdZUkRob0NUa0Z0VitnUlhjc2ZMN0J3?=
 =?utf-8?B?cUVIZGh2QlE3VlA3cWt2UGJCSVY3N3NneVFUbnFxMGwxM3VmaHFTelp0b3dQ?=
 =?utf-8?B?a0lMUUxIRWhwRGl0ZjIzQlRMTUVkYVFZTDk1NTVjZTJyOFJhbWgwemE3MDZO?=
 =?utf-8?B?dUt4OFdUMFVDYWJuSzExdSs5L29kUGFyQTFXT3k5T0RYMDY2K2dxN1JKaS9o?=
 =?utf-8?B?QVgycDREdVo3ckFxZHdFWXFVc2lpV2dwQjYyRXp3WFp4eWtMVTJ6NGhqNCtm?=
 =?utf-8?B?UkFaT1ZlUTVRPT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d974479e-cb4d-4144-3e10-08da0be9bdca
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 09:52:56.9373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMn2klpHp8KIip+qFlioW9uc26Clcv4Le0Eo+8XTIm/AsjICI8kC1sOuQgPwHnGAaGySTxjU+UIlpccMx99l1XXLQCDscIiGVjJ4wwDbJFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8774
X-Proofpoint-ORIG-GUID: dXfhQzzXsXpqMWmQga7fR4U5jOH8U8a0
X-Proofpoint-GUID: dXfhQzzXsXpqMWmQga7fR4U5jOH8U8a0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_03,2022-03-21_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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
 armbru@redhat.com, qemu-devel@nongnu.org, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 22/03/22 3:12 pm, Daniel P. Berrangé wrote:
> On Tue, Mar 22, 2022 at 08:18:44AM +0000, Kshitij Suri wrote:
>> Libpng is only detected if VNC is enabled currently. This patch adds a
>> generalised png option in the meson build which is aimed to replace use of
>> CONFIG_VNC_PNG with CONFIG_PNG.
>>
>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>> ---
>>   meson.build        |  9 ++++-----
>>   meson_options.txt  |  4 ++--
>>   ui/vnc-enc-tight.c | 18 +++++++++---------
>>   ui/vnc.c           |  4 ++--
>>   ui/vnc.h           |  2 +-
>>   5 files changed, 18 insertions(+), 19 deletions(-)
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>
>
> With regards,
> Daniel

Thank you for this!


Regards,

Kshitij Suri


