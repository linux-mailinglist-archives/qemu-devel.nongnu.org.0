Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BFF4D0456
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:42:34 +0100 (CET)
Received: from localhost ([::1]:54202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGRO-00059X-1E
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:42:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nRGQ7-0004F3-Oe
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:41:15 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:15572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nRGQ5-0006pn-EJ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:41:15 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 227GYLZv002824;
 Mon, 7 Mar 2022 08:41:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=CCvufgFBsDO8prz9FM1Tw9ksIhYjoVcgWhHu4xpLzUk=;
 b=M8CzxP1s2JkpJsi0g+xjqtb640fdNjmWjFwd0WuWZyr4l3QK2XIxsmAMVAXmK4wJMhyU
 OOqSQDyaeUUXq+AWD49ifTq+1Wa+15DCbVs7T8KNVfNBD/+uy3Z0xJ10Oe979bQNP6FA
 34rFLkhk+bjI9CNRJOVsMLV1OKsLoN7+zi9VTZEU50EaaiWwiHUWLTZ/A28IbRwsA7xD
 O1w2O/ni/vbHYRnG5wSrkU+cxL1KDThokH0rgD6GZw4B3o+frEu4Y2slopQzPTSV4ygq
 HbOlALkWY9JOXaahpC1LkJk292iui3Z7lGC97d8QgM5DIThL2gcwiXzMCAw5UvKn0/t8 ng== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3em4nb3u7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 08:41:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPAB7s26IY6eQ0iMft9aTMTLaDJRrPc/gOihQ/2gPQiraMYGwLTWMLNsTnhYzIDUjPcv1AUrqWtJ6sqblTXb+bKkvSP9KvWq+OF5k+z3ydWimOwKTxOKZgUMB1EPT2nQVNP0d0S8Kk5pPwapt5qOhG6Fjc6N4IghHI+Q0K0JL3x/2M2shg3rd/+C+OiFwuUK4zmCuV6xW/MUeWa16fBdkqSedG6PwMJHEalaloLbvQ4Ui+Ccn+Jb2R4hOMIYtRzRZf/GIpoDrpm1wk1+Q5S8mJfo/Vr8R+VYizqNWsmcBB6ufEg3EZ1na6c9OK+fzL4zKP0r9WEhZQAMTR6jbiPjxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCvufgFBsDO8prz9FM1Tw9ksIhYjoVcgWhHu4xpLzUk=;
 b=dA/cflpNy+Z1aeHP11oggcRPLYHxY+EWdJpSjxg/YFw5PcKVsr9lhFa5AbE02gRpkEwOybcolGWbHxyRytyssIvOgx33pTunBFmpSyt8Hul7d9izQHETBDOd/CGTENzzCknz1m3t6Fdxsh7B5pQ619HqlUc3FW+tpWreiywr+v6Ts2+6PQb1BIV5rs2gBdEdwwCHaHq2mjAFPrXlXHdPjFBOz40xcyJiVmP/8quh9Y7UykjM/Td6mz2U8XPmy6xKT62obCUra8h1d3LGcQHSlJ4Ni4PFIKnEUPkYlmDDdwnrYBUiht4+rlNBMOEfyLXNlbkwgdY4RfPE0pY06E6qOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by DM6PR02MB4635.namprd02.prod.outlook.com (2603:10b6:5:21::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 16:41:06 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab%5]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 16:41:05 +0000
Message-ID: <1701228c-ffc0-ac19-b713-fde849e18461@nutanix.com>
Date: Mon, 7 Mar 2022 22:10:51 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
To: qemu-devel@nongnu.org
References: <20220301064424.136234-1-kshitij.suri@nutanix.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <20220301064424.136234-1-kshitij.suri@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR0101CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::12) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 816ebc44-19d1-48b6-4e64-08da00594647
X-MS-TrafficTypeDiagnostic: DM6PR02MB4635:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB4635B2A2AAA79FDE2D269B0D99089@DM6PR02MB4635.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s8ZUYX7rI8qS/wcZ361w7XKjYkyyp6M5R+gufyPIREs0AfRiIxNzApyUplOean6JlQkaCxgkYOCNLPEQolk4PZEVBKlwaPD5BFzzmyzeV0oUODrObjOG/bUduv/9pj81tPVa+s5/4nGlwciHYeiAz2hsGYVsx6zFHGPetxsmdrKEsCygdhBzLjAj0scUmiQkm0ACxakWtTqMwITzaUQrF5Uv7Uy2fPf01H6yfCEy+z61+B2IfiKVxUaVZFqwxOOsu9ocmHT5tXVh0qkQKLeLu1EuI73v82d9UIZNLxDApp8fk3ihUUPn6KHmYhrPDqUckktQHSwDHVDqWMEbT/4l795sdWuM7wiWUuqpOAkyYqZ9a4wQVuC4VB28ZpsNy3iPeE+00BwPVLiqi7dopLyJ6+PAuKlkbm6MD9te811QDpaWZxxMKENRwhSHay+kL18MYiWGxhgzNc2e+TprTfzVQKLsc14901TXLKO+ADOzHAdvwlQE0LKUUcwZ5vM5rB0XXpFA7xRRwtAFT/5APhP16GnZVArCJPs4p+5y8ImDSceoj5TxziJAQF5eQa/JXR9xhJZ1aQQlCXY212fUe0FhZKphuRNxBQNSSgo//pFiLWI+jaTeOXVNE3vyBn1QJyhxrIxDz42sUUGQ6V3uDNISYPRH/ZsONdlFdlDwfibT/cnHCjv3OGjW2K0PlFCx5oRFYuKWMZBIWfxkunf17C5D2y5QCR0fjSZdrtz40/FyBPANc4QAvjp4GzDiu6h5e5R31WogQBm4CD7eGfK+pybHbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38350700002)(38100700002)(36756003)(6916009)(83380400001)(31686004)(316002)(2616005)(66946007)(66556008)(6666004)(86362001)(5660300002)(508600001)(6506007)(44832011)(8936002)(53546011)(52116002)(186003)(26005)(6512007)(2906002)(66476007)(31696002)(8676002)(4326008)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1Y0NDhGbU1vVERwT3FDZFhacnNBMHZUS2JEaGd0QXNvUDRHR2JlK1JMM0h2?=
 =?utf-8?B?TklyZ3dPZEMrQTVQZ2lUNHR1NWpQci9aQm5FOEo3dk1EQjNXSDk4N2JvOXVx?=
 =?utf-8?B?TE9qem1QM3B3TXV6VUVHK05CazduVXQxQTNsUGtUV0x3UEthcWVHUUZuemdC?=
 =?utf-8?B?TTgzcURpdytwTTk0S0RkZmtwUzhFOXV3NlZTd1pva2xHb3p6NnUrQ0Q0Sm1t?=
 =?utf-8?B?TVdrOEhYOWd3WEROU1kzOWdkNUM0Y3lzZGVKOVdMcms4ZkxPTjB3SEJIOVZw?=
 =?utf-8?B?aUFsMFp1b054L3ZCY09Lc00xejI3TjhQa3hNMEZQcWRNOFRiK0ZNMWRSeS9V?=
 =?utf-8?B?cXRLNUNQd2pUUzlKYUFKQmpEczB2d0toRThucGtBZ2hKOVdsNGZqNGJabVd5?=
 =?utf-8?B?bUhPU2tvdlRsRTZoWmh5ckl0MTFiSGkzM092LzZTMmV5d3dsckJWMmpRUTRn?=
 =?utf-8?B?WWgyTUVBemcrRFZZODZIR3FQdTRWUGZjMTFJaUI1eDA5b3VOSE41eHVDWjFV?=
 =?utf-8?B?eSs4ckd5Sjc0cXh0UlBTMi9rOE5BNkZ0U3lhQk9QZ2JEbGM5YVdvdmU3UWlv?=
 =?utf-8?B?Q0tMUVJWcEFzR0FnQnlqODhWRmhad1ZBYmlyMFhjK1UyQngvMjBIdTNBMTda?=
 =?utf-8?B?aGZiT0gzOXBqZ2ZtamZRV3owcTZocU5tbStFNWZmUHVMLzA5OGw3M0xDOUFz?=
 =?utf-8?B?SFhFT1Z5UnVKR1Y1VjFMVDFCbThoWGtqUkNLOUpZQys1UFFtTktIQ2R3Z2tv?=
 =?utf-8?B?V2ppc2lmZDUwU0NOR3BkM29IaWY2L2pnaE1aL25SUkVjaHYxQnd2YjZTSndZ?=
 =?utf-8?B?d0ZBc0xaZnM5OWpxOEpzRVNjdHdxTG92ZEZQeWRPSnZjL2RwZ0xuSEF1bm96?=
 =?utf-8?B?TElNVEJJUWlodUR2bGhpVzJRRmh2dHdiZ0FmblZGVjhZU05jRlVTZWxEcTBk?=
 =?utf-8?B?Mm05UkZGaWVkZmhnUGpOaXB0Vko3b3hPZlJyaG1TeVFEMXZDL3dkbEp2ZlZ2?=
 =?utf-8?B?blc5WXpLWUxUa3hPcU13WUp0MGJRRmtxcG1ydFphZzdzNjFKV0F6aEU1eFR0?=
 =?utf-8?B?WTRzbEZQM0ZKR2N2b2hrMFdCQ0RDL0FGM1E0OTA5NHlwalFLeHR6M3hoUFM0?=
 =?utf-8?B?Q2NRU1RxUStlOFY0TzRlRWpTYXp2R05ac2FwUnRZWkdTKzhKOWhkYVN2eU5x?=
 =?utf-8?B?a096bmUrSnN6bnZ1ZjkzbXFUc3duRnhjTmhJSkJDUS9QUHRieFp1WFlKTlJJ?=
 =?utf-8?B?M0l3Mk1XQS94OWdoS2ZWZE56OUluaHJXZlZ5eEpXSzZ4VHU4NGxEMVFUanBw?=
 =?utf-8?B?OHp3MGhyNFVQbjJyZFU2RmQ0L1FtSWRycXFCcmRrUG9zNmpzZ3E4djcya0xC?=
 =?utf-8?B?aWl5T0VSMXZOektiRWY4QzdXSDVqUUlYNHdMS056dkxwbUsxd0E0OGw1RUx4?=
 =?utf-8?B?elNOcWxCc1ZaZ2lRNEhyVjMrQWdlNlhoS2wvQnRwMzVUKzhvNDlIejNnQTVK?=
 =?utf-8?B?QkRBQ0tQY0lSZklMMEJmNFJxSk9iYmtkK0paNVZWOHpwdVNYUlh2eFFlQXRs?=
 =?utf-8?B?aE9uVGRuLzFvTHE5L2ZhR2IrVlBRbWlGZjc2V09yU2ZQd2tOcUJkOEE5NFlC?=
 =?utf-8?B?VzMyU2Y2Y1RVVktMWWZ0cElSU1cwdEowR21NbEZmS2lHTzE0UTA5VWZ1cFRl?=
 =?utf-8?B?djJIZTc4a1luWk1INC9wSHQzcTQzM0tYd3AzZFZ6QkxWdnNTWFAwem5Lb0hW?=
 =?utf-8?B?cGZvb092YUVtWGs0QVB5SU04SzFJdEIxQlp6Tk5PWEJsdXYyMVRNU1Z2ZGdu?=
 =?utf-8?B?OE8zQzRxUzNxZWtZSS9LSjU3aGpyYWZkTkRyVDcrYStWM0JzcDdiZjRCWXFV?=
 =?utf-8?B?S0dDYnd1b2VjdHNqb0Fkd1lYWnJmMUxyR3ZZaktDRzArTUNoTWJWRmtNU0Vr?=
 =?utf-8?B?ZDlPeFJNWUJTemw0ZEFOU0h4eUxQc2NwRVJIOUdKMDV4S1UrM1ZJdTVvQXJ2?=
 =?utf-8?B?K291NVlaMGFhT2tHRm5MaFlOQUpKSDNxOEhEMFFsZCthbG1Ub00yN3NKN0RQ?=
 =?utf-8?B?ODErMEwyNzl3SVFORXVpa1paaytCdElJbFVlRlgrc0U5dXVqRlV3cHdxNVRi?=
 =?utf-8?B?bVdJT1BZYjFYRmxZSFlObVJIcnJEaDcvbi8wdjBtRmtkamNWVjIrSXpLcUhv?=
 =?utf-8?B?UkhoVDh5blRMRWQySktYY3REUEQzRDc5ak82V1dZb25BTEJEK1pSZ01pbFZm?=
 =?utf-8?B?TzhOTFZ3TDRvTHJVQVZlallXakxBPT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816ebc44-19d1-48b6-4e64-08da00594647
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:41:05.8920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZvGuGfwMzoExOxQ7fRi7GgVcK1cJsbdFX3rImpZb2NwmhcD0WjS7l3L2W7tmFTBSOOt5rfcuKK/puWQvgeT42N8/B1wayMc52dWaYJ4cyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4635
X-Proofpoint-GUID: L8R6CRwclA3PXFm_cqxljnYq5bhRgYyc
X-Proofpoint-ORIG-GUID: L8R6CRwclA3PXFm_cqxljnYq5bhRgYyc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_08,2022-03-04_01,2022-02-23_01
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 prerna.saxena@nutanix.com, dgilbert@redhat.com, armbru@redhat.com,
 philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Hope this mail finds you well. I have updated the code as required and 
request you to review and suggest changes that are needed to be 
implemented. In case no change is required, please do let me know the 
next steps for the same.

Regards,

Kshitij Suri

On 01/03/22 12:14 pm, Kshitij Suri wrote:
> Libpng is only detected if VNC is enabled currently. This patch adds a
> generalised png option in the meson build which is aimed to replace use of
> CONFIG_VNC_PNG with CONFIG_PNG.
>
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
> ---
>   meson.build        |  9 ++++-----
>   meson_options.txt  |  4 ++--
>   ui/vnc-enc-tight.c | 18 +++++++++---------
>   ui/vnc.c           |  4 ++--
>   ui/vnc.h           |  2 +-
>   5 files changed, 18 insertions(+), 19 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 8df40bfac4..3b67f83a2c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1112,14 +1112,13 @@ if gtkx11.found()
>     x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
>                      kwargs: static_kwargs)
>   endif
> +png = dependency('libpng', required: get_option('png'),
> +                 method: 'pkg-config', kwargs: static_kwargs)
>   vnc = not_found
> -png = not_found
>   jpeg = not_found
>   sasl = not_found
>   if get_option('vnc').allowed() and have_system
>     vnc = declare_dependency() # dummy dependency
> -  png = dependency('libpng', required: get_option('vnc_png'),
> -                   method: 'pkg-config', kwargs: static_kwargs)
>     jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
>                       method: 'pkg-config', kwargs: static_kwargs)
>     sasl = cc.find_library('sasl2', has_headers: ['sasl/sasl.h'],
> @@ -1537,9 +1536,9 @@ config_host_data.set('CONFIG_TPM', have_tpm)
>   config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
>   config_host_data.set('CONFIG_VDE', vde.found())
>   config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
> +config_host_data.set('CONFIG_PNG', png.found())
>   config_host_data.set('CONFIG_VNC', vnc.found())
>   config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
> -config_host_data.set('CONFIG_VNC_PNG', png.found())
>   config_host_data.set('CONFIG_VNC_SASL', sasl.found())
>   config_host_data.set('CONFIG_VIRTFS', have_virtfs)
>   config_host_data.set('CONFIG_VTE', vte.found())
> @@ -3579,11 +3578,11 @@ summary_info += {'curses support':    curses}
>   summary_info += {'virgl support':     virgl}
>   summary_info += {'curl support':      curl}
>   summary_info += {'Multipath support': mpathpersist}
> +summary_info += {'PNG support':       png}
>   summary_info += {'VNC support':       vnc}
>   if vnc.found()
>     summary_info += {'VNC SASL support':  sasl}
>     summary_info += {'VNC JPEG support':  jpeg}
> -  summary_info += {'VNC PNG support':   png}
>   endif
>   if targetos not in ['darwin', 'haiku', 'windows']
>     summary_info += {'OSS support':     oss}
> diff --git a/meson_options.txt b/meson_options.txt
> index 52b11cead4..d85734f8e6 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -177,12 +177,12 @@ option('vde', type : 'feature', value : 'auto',
>          description: 'vde network backend support')
>   option('virglrenderer', type : 'feature', value : 'auto',
>          description: 'virgl rendering support')
> +option('png', type : 'feature', value : 'auto',
> +       description: 'PNG support with libpng')
>   option('vnc', type : 'feature', value : 'auto',
>          description: 'VNC server')
>   option('vnc_jpeg', type : 'feature', value : 'auto',
>          description: 'JPEG lossy compression for VNC server')
> -option('vnc_png', type : 'feature', value : 'auto',
> -       description: 'PNG compression for VNC server')
>   option('vnc_sasl', type : 'feature', value : 'auto',
>          description: 'SASL authentication for VNC server')
>   option('vte', type : 'feature', value : 'auto',
> diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
> index cebd35841a..a23ad712eb 100644
> --- a/ui/vnc-enc-tight.c
> +++ b/ui/vnc-enc-tight.c
> @@ -32,7 +32,7 @@
>      INT32 definitions between jmorecfg.h (included by jpeglib.h) and
>      Win32 basetsd.h (included by windows.h). */
>   
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>   /* The following define is needed by pngconf.h. Otherwise it won't compile,
>      because setjmp.h was already included by qemu-common.h. */
>   #define PNG_SKIP_SETJMP_CHECK
> @@ -95,7 +95,7 @@ static const struct {
>   };
>   #endif
>   
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>   static const struct {
>       int png_zlib_level, png_filters;
>   } tight_png_conf[] = {
> @@ -919,7 +919,7 @@ static int send_full_color_rect(VncState *vs, int x, int y, int w, int h)
>       int stream = 0;
>       ssize_t bytes;
>   
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>       if (tight_can_send_png_rect(vs, w, h)) {
>           return send_png_rect(vs, x, y, w, h, NULL);
>       }
> @@ -966,7 +966,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
>       int stream = 1;
>       int level = tight_conf[vs->tight->compression].mono_zlib_level;
>   
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>       if (tight_can_send_png_rect(vs, w, h)) {
>           int ret;
>           int bpp = vs->client_pf.bytes_per_pixel * 8;
> @@ -1020,7 +1020,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
>   struct palette_cb_priv {
>       VncState *vs;
>       uint8_t *header;
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>       png_colorp png_palette;
>   #endif
>   };
> @@ -1082,7 +1082,7 @@ static int send_palette_rect(VncState *vs, int x, int y,
>       int colors;
>       ssize_t bytes;
>   
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>       if (tight_can_send_png_rect(vs, w, h)) {
>           return send_png_rect(vs, x, y, w, h, palette);
>       }
> @@ -1233,7 +1233,7 @@ static int send_jpeg_rect(VncState *vs, int x, int y, int w, int h, int quality)
>   /*
>    * PNG compression stuff.
>    */
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>   static void write_png_palette(int idx, uint32_t pix, void *opaque)
>   {
>       struct palette_cb_priv *priv = opaque;
> @@ -1379,7 +1379,7 @@ static int send_png_rect(VncState *vs, int x, int y, int w, int h,
>       buffer_reset(&vs->tight->png);
>       return 1;
>   }
> -#endif /* CONFIG_VNC_PNG */
> +#endif /* CONFIG_PNG */
>   
>   static void vnc_tight_start(VncState *vs)
>   {
> @@ -1706,7 +1706,7 @@ void vnc_tight_clear(VncState *vs)
>   #ifdef CONFIG_VNC_JPEG
>       buffer_free(&vs->tight->jpeg);
>   #endif
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>       buffer_free(&vs->tight->png);
>   #endif
>   }
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 3ccd33dedc..a588ddff1c 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -2165,7 +2165,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
>               vs->features |= VNC_FEATURE_TIGHT_MASK;
>               vs->vnc_encoding = enc;
>               break;
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>           case VNC_ENCODING_TIGHT_PNG:
>               vs->features |= VNC_FEATURE_TIGHT_PNG_MASK;
>               vs->vnc_encoding = enc;
> @@ -3248,7 +3248,7 @@ static void vnc_connect(VncDisplay *vd, QIOChannelSocket *sioc,
>   #ifdef CONFIG_VNC_JPEG
>       buffer_init(&vs->tight->jpeg,     "vnc-tight-jpeg/%p", sioc);
>   #endif
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>       buffer_init(&vs->tight->png,      "vnc-tight-png/%p", sioc);
>   #endif
>       buffer_init(&vs->zlib.zlib,      "vnc-zlib/%p", sioc);
> diff --git a/ui/vnc.h b/ui/vnc.h
> index a7149831f9..a60fb13115 100644
> --- a/ui/vnc.h
> +++ b/ui/vnc.h
> @@ -201,7 +201,7 @@ typedef struct VncTight {
>   #ifdef CONFIG_VNC_JPEG
>       Buffer jpeg;
>   #endif
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>       Buffer png;
>   #endif
>       int levels[4];

