Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85084C4EA5
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 20:23:18 +0100 (CET)
Received: from localhost ([::1]:55712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNgBQ-0004aL-U5
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 14:23:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNg6a-00035y-OV
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 14:18:17 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:53738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNg6X-0003R4-1q
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 14:18:15 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21PFO9I4008909;
 Fri, 25 Feb 2022 11:18:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=S168cboxPVOblEA+krgyGspkE6apzLdkU2ZbrxYMXr8=;
 b=wllcwA20lpp/w58FamohyClA3SaWynR10cXkYzyYo+wG8JdzS9M38NVv9zPiV8vvMf8j
 EXb81/zgpUUZ2xc3gsDpGBsn9tKM+Q4Ki8Q73XVqu5OwioWfADJ6HCKwJo0eVDmrV7rC
 KNfgMwbtPPY67IfnnHPib5XE+xM7KayXO7z6UMWIlMEeUuXjPJkEY0Q4O6NkyAYFj1JU
 qwTQQXaXm5A3ppDIwtoyRlInGMCDJXSk478f2OrUOvgCuy4Br37vuIH3jzsIEjgsygCt
 PV4KoceUqK04DcOHSbt96C+TIbxRF0sAAyIVQzofRxnHvZ7wEfB7qpAz7hnUaLaFKLVT ig== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2049.outbound.protection.outlook.com [104.47.73.49])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3eegkttsgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 11:18:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlcGZDzO9sCYl0hAgd681W5MwA8ClUATkT7hhGb4Agys4hMgAzEYOfBOX85rwP+YMWqsrk6IBHOXW3Dn4nOOqud/S9TwwlZCMwT0rgOS6/e8Xc61phkrR69dU3+AEguBZs+ASbY1+Fuuj2pg33rKiKBAyvFtFq7FmSZcorqtNKkURZw/aO23KZeO4IJWfhqsxDINNcyWnqLvQqBdHzsDRij2W8e7WbrpUgLmH3Dzv2O87k5ugqyzHEuW/afzpzqLa52mfyzUdZcaE2+Ek7Om/+BMzGA4UA8O8Ll8zxU9ZNrUdPKTKUSAobAgKIZKnUVR3UZW7ancytDjQ0pwUT0AHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S168cboxPVOblEA+krgyGspkE6apzLdkU2ZbrxYMXr8=;
 b=ZyOxp9s1y1qF9ctcNwb5LkCRfCZY6qS7aU8UhDBk/pRmAwPLvqa/xKvO3U4Zft0XaUXSoeebY3xg2uNWfqSCrTpbsTuH0I/b9t/zdR/WPndWM7OjilTvWWI0aWHHmO/K2tqufTQMim6uaGsfOsuSn+VMWOqPAf31wGdlHX5M1xbpbTq4PVjo/8pYMJoQOy6j2w0tL/0u7K+uZuhNeFfcpjRmHmbO1cS9PhW45xUiPee7lYrhk5tUhuTP343YM01B5Z4p1XjFW4rt0p68abiw7ZMW7f83cMhL0t5Guw7wNQvUdPa3WorJOubG7y5/9TSUjzkvE9bFcYXxnXLKwsoTfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by PH0PR02MB7445.namprd02.prod.outlook.com (2603:10b6:510:15::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 19:18:06 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab%5]) with mapi id 15.20.5017.022; Fri, 25 Feb 2022
 19:18:06 +0000
Message-ID: <1dabf7c5-e408-c357-258f-747e5fe7bd12@nutanix.com>
Date: Sat, 26 Feb 2022 00:47:53 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] Added parameter to take screenshot with screendump as
 PNG
To: Eric Blake <eblake@redhat.com>
References: <20220225115830.177899-1-kshitij.suri@nutanix.com>
 <20220225115830.177899-2-kshitij.suri@nutanix.com>
 <20220225190748.uqcdoutdbwwksous@redhat.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <20220225190748.uqcdoutdbwwksous@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0091.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::31)
 To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 819af9ba-26e0-4887-14fb-08d9f8938d42
X-MS-TrafficTypeDiagnostic: PH0PR02MB7445:EE_
X-Microsoft-Antispam-PRVS: <PH0PR02MB74458D820EFC4484DEF1AE7A993E9@PH0PR02MB7445.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lx7TVOJUQeEECubtE+9Khk69a42UTKV2gJcro3pRUcBqbr+gEwYEy/qwXGzAjM4No3R0XmaogTEO5k9wvK06qif3IyjpXc1xcaMW1BeqE02PvlU6sr234cuoIbEVLVSfnkjaPkZ3ZezdtNnvSMWy2FSBIIIKfZn2MvF1cHLdk1ymJAscVAfli5+lrS81/hNL6ho0S9FdJuSxdQbyRh/ee4Ux3ap083AwhQyAXSC5V6fvFfB/ybfv+CJoPx/+WjzfldsJhXCXdXpMxQuJDsLcBBjkyPuR4RsfBu89MtguCd2nxhTrxCOHJxi6eBsldzP9ovcS27LAZ9DPDDn5y4kn2pzSHvjP0bLjC8RWNuTnQMNZWpD2zU3OxsVM9s66HsBc/WGNnzdXA3xcMBbWrAlhkIlitHMNKOnmj3d1jZDVY0Dm670FIfi6ViYsKG/1TQf3qDKjFV/hc1bBi5aV27jcKV0OYdoHXJFrBCy0qCFsJRcMOf/JAjUVz5zT60IcmsA0XG0lqt2/nfATBdSz3IyArHCtwVdU/arN9lOoqX5X4oXZ30Hw45KK89L1d1mMAEckHq1ytIlJhWasRCSWjSi62Q1H1EZa3yG1ND7hNGRUzNRsgnYCGSrzjCYSmxWkoCGrjwONIXtlKOSf5rBR5m5d5nqwysmUgQJe/PHzi4VhpVMgu1RPaQDeZTanOf8jrXaGK+otiZtQrhTBEahqVh/KpvtN4peq/hMkJE4pcWIOnGAkGQj7nNrQaB/0MC0qLv70dhHcrtWenWkSK34VZogsLeyrp7WABIPP/z+XKCsnDkgKzIzQ1SS/BDWpdauiPug5xMk7111D3Px7SHueRng8r5OwqRGlELl5na2h2dl4RsU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38350700002)(508600001)(38100700002)(53546011)(52116002)(6506007)(6512007)(6666004)(316002)(8676002)(86362001)(4326008)(31696002)(66556008)(66946007)(8936002)(966005)(6486002)(6916009)(66476007)(44832011)(31686004)(186003)(2616005)(5660300002)(83380400001)(66574015)(36756003)(26005)(2906002)(107886003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnNveVNkeWgyNVB3MWFWU0RVcU1lS3ZBUVZrYnVhdVpJWkpVblNTL2doWnho?=
 =?utf-8?B?UERRdVZ6WjhNdnpVUHV5SVlTNWVPY2dseGhWNElpVnNrRDAvejZ2a1B3Y2hU?=
 =?utf-8?B?a2kyTHJwV0c1UERvd1NBSW0xTStuc2YyaWpYd1ZRZmwvVDRuRkpkUi9Kdjhp?=
 =?utf-8?B?aWRMQ2wxdXF2a0lTTnZ1OWJ6UDJadzVraE1pYVF0SGV5b1JZeVgreTUvUWha?=
 =?utf-8?B?enNqUG1PWWVQQ1lZaGJrZHY5VENFN1ZaMVowdGl2VkhJSTY1TWNQS3JaOWpy?=
 =?utf-8?B?SHRIYUF3dU5hYVM5RkViMVNIWmVKdmRwcmdYbG5wVURld3JVRFNZVVY0SXNK?=
 =?utf-8?B?UllGZWZFSTlmN1FDSitMQm45QVdzdnFUOUc5SzZPdFo4R2QxUnQ5NWphQ1dM?=
 =?utf-8?B?MGdjaS9nR2ZkTUhPcnNuZ3pJTmlzVVltODhDekZWdGpmcGpEWi9yUSswVzdB?=
 =?utf-8?B?T2pUQVBVTXd3cm4xNUJqUUwrT3czeEtOVlExbWRhb2NjSUJvYjlhUWh1V0ZH?=
 =?utf-8?B?RWJkVDZ6K1VjNExGb3ZQaFBCOXQxdnBtNUdRS0pjTnkwYVlJTlFWc2JGNkxo?=
 =?utf-8?B?cldBV2NJeFV2d1VOMC95VGc0L3pGTjBmVjY1M0N1and1YnFMTjV4L1pMSEtr?=
 =?utf-8?B?R0hza2JIYSttZ1FwYVBLWWtOT254MXVzNlEyb1lRbnJ2Q2xDVUdZTVVPV0VG?=
 =?utf-8?B?TVFFNUxyeC9oZlNQZWh6amwxbXVNbFA5WVgwTzNjQzB0VkFCWTFacjVyTjcy?=
 =?utf-8?B?dUlIMzBZQStmaHhXcHd4TEgzUXJDUTlHNUZ1TCs0bFdRR3dRcUpZalcwYW9p?=
 =?utf-8?B?QnhmS2RFOC9QbVdsSnJaWmRhUmNOQnhCMUNqY2tncm1lVXhDbWYrTEtuNFhj?=
 =?utf-8?B?cHVJb2ExTUZIVzNrRjVFTlFqUmlXakZZc2RhMndNVzc5dUllZjF0Q1V4VHM2?=
 =?utf-8?B?OXRVNjdqT3hqcEtPcXdxelVnQUR5N1BWUGxUcExHNFlFWFRieGx5eGhYbFZL?=
 =?utf-8?B?b3pqYUNJQVpBeS9YOWdvUC85SUlVVnBUKzZWUW5xYVpEWitQaE85T0FIaTVN?=
 =?utf-8?B?UEhhekRlN3B5ODRRUXo1MmZHWkszeThUSVdwMFMvS0FGWTRMaDhpQVhDTTYy?=
 =?utf-8?B?R1Y3ajY2NzZJT3pmSXlmeGgzaTk0eDgvby9tcUMxWkc3cVRYczVQMUxWSUhG?=
 =?utf-8?B?Y0tGd0tGM3VmdGtqQWptMnFoOS82WUJRb1VHcUNQWVplZi9VN0dVMnp2SCsz?=
 =?utf-8?B?c1lNOUlaUTRqOGw2QzQ4L2N2aTZtdzczNzQ2YWpqMFNDbUJnck41VkFMSjNH?=
 =?utf-8?B?MjcyUngreEN5M3pFd3FRTGdmd3ZMeW81QlNSMnVEY3R6anZmMCtrOXcxVGpU?=
 =?utf-8?B?ZXBNVHY5MEZVZjZSQk1Bc1BueFZERWlkTHN4UnoxeVpGWUpzclRYeDFQb3la?=
 =?utf-8?B?Zzc4Q1oyT1BsdGVFUlNWZWdpcG04UVZ3Tko1K1lzeDhSVjN6RHFadkM1c3V4?=
 =?utf-8?B?a0dYZnpaaytQNHJwLzltdXY4WU43bG9LWW15NGc1ZHdQeWtEZmhlOE00NnRs?=
 =?utf-8?B?ZDlkQ2UrajE4MlFPa1d5SVZqcVlSbndCMjRiNzdQZzBnVk0rWVZteGxENE9W?=
 =?utf-8?B?SEFlMjM5a3JGQUtrcWZORWFZaVIxVWFkbGYzMVc5d2JEVkdmZCtxUEs4MkNq?=
 =?utf-8?B?RTR2ekNYaEdNUCtLSTBVS1VoNHVVTFlWeDBoZGwwc2hiRTNuSjhLSFFwM0FM?=
 =?utf-8?B?ZHZsbThEbldEZGtDRjUzaTlVK0c0OWcvNDlwc1ZpL2RlRjdFUWJNMjk5Slow?=
 =?utf-8?B?aXhHbXlhQzczQ050STg2VCswOVFmTU9NVjVVRUczblVvU3ZqZFVVUytmc1Uy?=
 =?utf-8?B?VnNVaU5EelJvRDlmTUM5QjFhVXVTdlcyN1BPeE5zcFZrRTNTTk1MaVJJYnIy?=
 =?utf-8?B?S3cvQ3NLNWo0OTV0b3hMYWpLUDV5MHFyelNlMURKelBqMWNES2k3cVQ3Umgr?=
 =?utf-8?B?WkJOWUJkQThIR2c3L0x3ejNMV012TTZCeWVFM0tmeXlhcWpRSWxoOEljSVpq?=
 =?utf-8?B?MmpnTmV2S25sRk9KYlBhTTZQbEg0UlJhNzZoZVpqQUEyV0pROHd6MHhXdU13?=
 =?utf-8?B?V1ZRRy9DN29YK0toZjludjluTTczT3I4SDB1ZEFLcVV3SWRpZlNxNVpUYVpL?=
 =?utf-8?B?WXUvQVlhUG55MVc3Nmtyck1SS2JIL1pKdlQ0c3VVdFJpSE4zdVdPT1FQM3dJ?=
 =?utf-8?Q?L/O0ZKPc9coNbnYQKqTCMvQLuH8lpFAnB/7660fe7E=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 819af9ba-26e0-4887-14fb-08d9f8938d42
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 19:18:06.6559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppN3hgoo3fI/3By+SLnj+1luNAoyDQPeI+yOtDaWBN/N3/vHiMEmorW/+HFY1VUNPIIiKHX5uFjk8WIGLKpaaHZ65C3SEssTgmcfCpXg0qQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7445
X-Proofpoint-GUID: r0p65hOSigtBBzf1Xj0V6DXOc7EuvqPp
X-Proofpoint-ORIG-GUID: r0p65hOSigtBBzf1Xj0V6DXOc7EuvqPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_10,2022-02-25_01,2022-02-23_01
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
 armbru@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 26/02/22 12:37 am, Eric Blake wrote:
> On Fri, Feb 25, 2022 at 11:58:30AM +0000, Kshitij Suri wrote:
>> Currently screendump only supports PPM format, which is un-compressed and not
>> standard. Added a "format" parameter to qemu monitor screendump capabilites
>> to support PNG image capture using libpng. The param was added in QAPI schema
>> of screendump present in ui.json along with png_save() function which converts
>> pixman_image to PNG. HMP command equivalent was also modified to support the
>> feature.
>>
>> Example usage:
>> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
>> "format":"png" } }
>>
>> Resolves: https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=N58ni_R8AQHe3XV2MX9aeKN2mCiEkpdyiqhV71sHDUEIuIk3P1HcXc-QfepnNaIE&s=CM400Sor3Oiio6iq3V_F9jFMCrn8UdbeKKXDnIh2QRw&e=
>>
>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>> ---
>> +        .args_type  = "filename:F,device:s?,head:i?,format:f?",
>> +        .params     = "filename [device [head]] [format]",
>> +        .help       = "save screen from head 'head' of display device 'device'"
>> +                      "in specified format 'format' as image 'filename'."
>> +                      "Currently only 'png' and 'ppm' formats are supported.",
>>           .cmd        = hmp_screendump,
>>           .coroutine  = true,
>>       },
>>   
>>   SRST
>>   ``screendump`` *filename*
>> -  Save screen into PPM image *filename*.
>> +  Save screen as an image *filename*.
> Maybe:
>
> as an image *filename*, with default format of PPM.
>
>>   ERST
>>   
>>       {
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 8c384dc1b2..c300545f34 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1677,9 +1677,15 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>>       const char *filename = qdict_get_str(qdict, "filename");
>>       const char *id = qdict_get_try_str(qdict, "device");
>>       int64_t head = qdict_get_try_int(qdict, "head", 0);
>> +    const char *input_format  = qdict_get_str(qdict, "format");
>>       Error *err = NULL;
>> +    ImageFormat format = IMAGE_FORMAT_PPM;
>> +    if (input_format != NULL && strcmp(input_format, "png") == 0) {
>> +        format = IMAGE_FORMAT_PNG;
>> +    }
> Instead of open-coding the string-to-enum translation (which will be
> hard to located if we expand to a third format down the road), you
> should use qapi_enum_parse(&ImageFormat_lookup, ...).
>
>> +++ b/ui/console.c
>> @@ -37,6 +37,9 @@
>>   #include "exec/memory.h"
>>   #include "io/channel-file.h"
>>   #include "qom/object.h"
>> +#ifdef CONFIG_PNG
>> +#include <png.h>
>> +#endif
>>   
>>   #define DEFAULT_BACKSCROLL 512
>>   #define CONSOLE_CURSOR_PERIOD 500
>> @@ -289,6 +292,87 @@ void graphic_hw_invalidate(QemuConsole *con)
>>       }
>>   }
>>   
>> +#ifdef CONFIG_PNG
>> +/**
>> + * png_save: Take a screenshot as PNG
>> + *
>> + * Saves screendump as a PNG file
>> + *
>> + * Returns true for success or false for error.
>> + *
>> + * @fd: File descriptor for PNG file.
>> + * @image: Image data in pixman format.
>> + * @errp: Pointer to an error.
>> + */
>> +static bool png_save(int fd, pixman_image_t *image, Error **errp)
>> +{
>> +    int width = pixman_image_get_width(image);
>> +    int height = pixman_image_get_height(image);
>> +    g_autofree png_struct *png_ptr = NULL;
>> +    g_autofree png_info *info_ptr = NULL;
>> +    g_autoptr(pixman_image_t) linebuf =
>> +                            qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, width);
>> +    uint8_t *buf = (uint8_t *)pixman_image_get_data(linebuf);
>> +    FILE *f = fdopen(fd, "wb");
>> +    int y;
>> +    if (!f) {
>> +        error_setg(errp, "Failed to create file from file descriptor");
> error_setg_errno() might be nicer to use here, since fdopen() failure sets errno.
>
>> +        return false;
>> +    }
>> +
>> +    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
>> +                                           NULL, NULL);
> Indentation looks off.
>
>> +    if (!png_ptr) {
>> +        error_setg(errp, "PNG creation failed. Unable to write struct");
>> +        free(f);
> free() is the wrong function to call on FILE*.  You meant fclose().
Apologies for this, will be replaced in the upcoming patch.
>
>> +        return false;
>> +    }
>> +
>> +    info_ptr = png_create_info_struct(png_ptr);
>> +
>> +    if (!info_ptr) {
>> +        error_setg(errp, "PNG creation failed. Unable to write info");
>> +        free(f);
> and again
>
>> +        png_destroy_write_struct(&png_ptr, &info_ptr);
>> +        return false;
>> +    }
>> +
>> +    png_init_io(png_ptr, f);
>> +
>> +    png_set_IHDR(png_ptr, info_ptr, width, height, 8,
>> +                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
>> +                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
>> +
>> +    png_write_info(png_ptr, info_ptr);
>> +
>> +    for (y = 0; y < height; ++y) {
>> +        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
>> +        png_write_row(png_ptr, buf);
>> +    }
>> +    qemu_pixman_image_unref(linebuf);
>> +
>> +    png_write_end(png_ptr, NULL);
>> +
>> +    png_destroy_write_struct(&png_ptr, &info_ptr);
>> +
>> +    if (fclose(f) != 0) {
>> +        error_setg(errp, "PNG creation failed. Unable to close file");
> Another spot for error_setg_errno

Thank you for your response! Will send the updated patch out soon.


Regards,

Kshitij

>

