Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79903A352F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 22:55:48 +0200 (CEST)
Received: from localhost ([::1]:56428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrRiN-0000VH-CY
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 16:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1lrRgl-0008BC-Tn
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 16:54:07 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:48982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1lrRgj-0007yS-1T
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 16:54:07 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15AKB1ec056780;
 Thu, 10 Jun 2021 20:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=csGh0pWlzl3GlPJLGY5l1ol2wMqvjkx1iZnRsJ811eo=;
 b=WSnz0XMolaSolhh6APxOSps7tO0riOKVFwigdH3ToHCPriSmTIUEFegneAhzhqFmsdRT
 4TNVr2IkEakOA/I52dfCmlX4eeocpL/bc0U64t6XYh2V40hmGMb+4oYzpXmlvOFDwSwJ
 K0ceDcnIaP+pn0WoZhf3kwzm49lFPR6fZ9QvxQy4KdpmbyaHmWbljPQfiJKRxFvd646E
 qltgTnAtSPoUUVkgHai8g6e+y1hCZdBFe+7Fbh2GeZ5VJXYBdecjJY0ndKaMqMbKeSt2
 UkbsH4lVZdpKhxnV+ezKaLgY+T83AM5NBPs4hUWLalEDkzd3bvCMCcFLiR5laZQTfAwk pw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 3914quujvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 20:53:53 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15AKB9wq062337;
 Thu, 10 Jun 2021 20:53:52 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by userp3020.oracle.com with ESMTP id 390k1t8nxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 20:53:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYehI0XURIOLXUEDbrXDsef0KlNspBpvnIPkgMwm2iqsflMQL0sLSNjT37lIQBtrWWhBvIAxrbclh8EDGTV/OfN+obaa6iFYBQRlqv+n3E/OssaGTpLikcTI/Q+vclmnsHnTMtURPPrvEkZwS8IhvS6C6/BV2Q2pTsf5uSTb1/MCNy5Qs8g6g4fq9Pz6n8htY7hwvIM+V+0WycThqKrctb+axChxWnr1Pb4e+FJPaR/RBYfzMWrZMmiXeRZ3Tjx7JpcB0pI8cWSDUd/9cuWxxzXcmua5WtsXNp+45xTV5uFxwQ4iCj9YCLl0moUO8jXYu7F/hMAge7J6kbGYrHKUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csGh0pWlzl3GlPJLGY5l1ol2wMqvjkx1iZnRsJ811eo=;
 b=hRvz2wIeWCSaVTMaOcb8wwXRduvmyc5npQdUrT7DM87b+t+kh7s6t0ckABHG6LZwLLds7pM+6pssiSw0Oxk1IZHiSaDnbJOmq9Lrd/2AYAmPE0ZA3vAYnlq5CPApkgRa0uYunYUkSpXc1glo6DyzRS+VRRg7x3ultqs7Cmr5z5AhzvY/7HMJdxBLENbkBaUgY35A8+jhxxY9uFeauN8eyBIjQpqt3U1zB3feQW5LSBCfKg8YT1/HriKCXHwnAn+Ab/PtBY0oLiBfX20+ZyqMKkXN/6I4edwk6Rv/ZB4pCSGW7Bf6mAN41OsQ+pjgAxO30dZ+wPBiq4Msap5AEjI01Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csGh0pWlzl3GlPJLGY5l1ol2wMqvjkx1iZnRsJ811eo=;
 b=V9UsoeoKR2MQoXHmjTNU8LgQje+ZX7TMukfhIaeLxApdMROM2Fp0Fj1cbmH9/skiT7Yp+j+cBdJP6m8e87ZqpQvCPrh1TmWd1yi/dmbolAsfa421N57b1bohqR+Jk9vzr+cI34Pa/apr8l4CHV26fbi5n/grBtvbbZ524qIPy04=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by BYAPR10MB2837.namprd10.prod.outlook.com (2603:10b6:a03:81::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 20:53:50 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::572:1b89:6a87:b18a]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::572:1b89:6a87:b18a%5]) with mapi id 15.20.4219.021; Thu, 10 Jun 2021
 20:53:50 +0000
Subject: Re: [PATCH V2 2/2] vhost-vdpa: map virtqueue notification area if
 possible
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210602084106.43186-1-jasowang@redhat.com>
 <20210602084106.43186-3-jasowang@redhat.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
Message-ID: <b1b4dbfa-1227-d34d-9183-a19d0a1e7efd@oracle.com>
Date: Thu, 10 Jun 2021 13:53:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210602084106.43186-3-jasowang@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [73.231.200.235]
X-ClientProxiedBy: BYAPR08CA0061.namprd08.prod.outlook.com
 (2603:10b6:a03:117::38) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (73.231.200.235) by
 BYAPR08CA0061.namprd08.prod.outlook.com (2603:10b6:a03:117::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Thu, 10 Jun 2021 20:53:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 824706e9-b5af-4a0a-f509-08d92c51d95b
X-MS-TrafficTypeDiagnostic: BYAPR10MB2837:
X-Microsoft-Antispam-PRVS: <BYAPR10MB2837C618F8FA1AB90EBB7463B1359@BYAPR10MB2837.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hHUpKoEA1iOQ+L9RetCeNybxnz9sWyqrWco1jY6+LWYqoLwlXtcO/uLpYfkqsnaNiFnyLxbWj7SCk/pE3+QUkNhkQ79GC4Ktqo7U07QZV/V1d4MFqG/PX8L1arDLUpXH/R4WuZb2NIhKmSbLKWjHhx+uzw+YBniJE9ROa5VSXE5OdrKAJN1G0lwcdwTNgFtPSp7yc7IhLuNG6sCOTYqKbxatO/reineQM2Lj6YqCJOrHQgmZ0xIkEgIp5SNmg8ujZDDDGjQUL4yO1jPXT3bXHUF4qbLf0hgSNauaDhU1J3SAxX1aEzaNT3TKxAUrj2tk9Jzc5hvtjq7QjoFOUoEhVKL8W+wSpMu9S8BpKBZ+DQeaewO2gW2EZsFytPnQbhKKrcCT26sD9y6yXzZ3qtNC4zPuVQ1NErBzdJtXlyPMkduOch3wPNRwKcuUVU2ewCLBicKmvxMhSPCObWG9ClkUS7tKHz9e1G1iyeBTvbQ/fJ0Hs2GSODS9JJj+0tIu66Gmiz+BMX24dwwf+ZDYW1OF2gjBHJKC/+g5m8lRniYxgA+3akz00KiaBluKjAbj+cI+odHvAXR/+3pMAbqwM5uo2/Rkg7g4lfGtxLIupZ63HXjoVsb7ZbMtKH4S3KUxGYPuGvRnYEC64gEIhNvIXcxt0RADwjNbF4wNQBjfjNn+qAmX2Dey02XL9U99eQ2TwvjM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(366004)(39860400002)(136003)(36916002)(66946007)(83380400001)(36756003)(8936002)(16526019)(186003)(8676002)(26005)(38100700002)(16576012)(316002)(6486002)(66556008)(66476007)(5660300002)(956004)(53546011)(31686004)(478600001)(2906002)(15650500001)(4326008)(31696002)(2616005)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXQrOFhmWUoxRmNLWTZJdWlYNytJUCtpKzdXRXhpRzVYVk5nU053OGgwNnV5?=
 =?utf-8?B?ZmJqV3ZkNXVEREZCN0NROWRMdGZXTjB4RC9DUFZ4WkQ3ZDNZNVkrNkpEY2JP?=
 =?utf-8?B?d0pISzJJd2I4TVFaL013U3Jnd0xhWlY0MlVxQWg1NnQ4TTAvOWZRVFZlREhs?=
 =?utf-8?B?dHY0MkFYeE52OVowNW8zRi9VMDNuQ2JETktCSnBLakYyWFEzZklyeVpmT1Rl?=
 =?utf-8?B?djI0R09sSGRydTRqUXVjaTYwR2dPeTVUbjRoYUJWRnVvWFdSV3dvSXdqcFVw?=
 =?utf-8?B?dncxbElCOGZ2SXlNK3V4UWFFWmhmbTQwODBrZnZDb0JrSGcvS3l4UjZqQ1V5?=
 =?utf-8?B?cUt6VVpmU2lyeVI5dTg2Q2ZoZG9oaVUxdTRWTFZ6WXdTbmRzWGlyS3JObTZ6?=
 =?utf-8?B?WEgxQmJkQW4xNmJwcmc4UmFtK3NlQ1A5Z3dmSFZjZkRwTU5yY0x2ZVlhRXZ4?=
 =?utf-8?B?OGdmVjRKK2RHNjlvMDRZTEpveUhyT3lZY2lZUDl1b2JPeS9BRU1MYUJZbTJw?=
 =?utf-8?B?MmdEdE9nTnpKVjkzMHVtL0FYbitvNUN3K3dnZmljUGRIR1hHbFFXdlpmeHQ5?=
 =?utf-8?B?b0dDNElqdlBhSWxPcENUajJTejR5WHBkeXpvTjJLbUN5YUpkSzBlaFpxbWNs?=
 =?utf-8?B?M3N1engwZWYxRm9Gc3NLVFJaSkczNHVWTjNmRFJhc21CdWJ4S2hTTXpxWXhs?=
 =?utf-8?B?TUpVMWhlTkFDRWcydllkTHVLeG0xUktNT1hIeitpeDFZdTBsUjJraktkbHUv?=
 =?utf-8?B?dldpTVlxOGdWN0ZONlozdndBbmo1QitFM0pBbG82RGJrcnpNczd4T0s4bjNN?=
 =?utf-8?B?dnI5YXJyOEhHUzFBMy9yWU52cHRLbFJSYlZLRDU2c2lHRTZBN3lQM0Ira1ZJ?=
 =?utf-8?B?MXVUQlkwSUNrcE0vNFArNUNOcnNsZFlISmcyOFRrY0VldkpqRnJpVVB2K3BE?=
 =?utf-8?B?L2VOeFlRNTI2OUZkdUh2cVNDSDFwa3AxQ1Q3N2drZ1F4OU92ZXRvS3VZSlRa?=
 =?utf-8?B?M2VEdGs1L00vbGd4RWYraVNZTVFjdkVPYU5vTTI2RWhZQW0yRC9kanpvUEZp?=
 =?utf-8?B?WnJ2Zkg2SXUrVmloK2dMMVN2Y0JvaEh0K1puSnhPbkxDdENab1ZnS2xrZ1Ay?=
 =?utf-8?B?TEMzNllHb0NyM0h6TUpMaXRFbTd1TzlmZFlqa3hZRFU5RzNTQ3NkbEVlM3JL?=
 =?utf-8?B?b3dmRVZwb1MwV3NFZW5UL3FqdXQ3cG5pWFg1bjlIWkNzNkdRSlFTZXhKbUJz?=
 =?utf-8?B?Q2M2cWk4bUhlUFNmSWtOclNvQjRjbTN6d0czL0xEemgyY3pSTHMzdytvdEk5?=
 =?utf-8?B?aUVhMHhQNFpLV2V3aFQ4Z3Y2RUVJVE9BUG41WWpvOEJ6S05oelVPdWphaHpO?=
 =?utf-8?B?YWNSNy9MekVxc3M0MGUwM09lNFZ5UnNRTlZVQWZaMFozSFlTNDIvbVVyczJL?=
 =?utf-8?B?c3JhZEFORTFYQlhTcTJVdHVtYzB0NjNpa3d6UzlLZUN2ZDNYZ1FtR2NHUnJq?=
 =?utf-8?B?ajZOV2tSVGc1VTZVcHdpNnJWUnl2ZUFMbjJJbUdXUThrNE1heXhpbXlMZjhp?=
 =?utf-8?B?Q3lRNEdDMUxhRHNvNWw5YXYyTUx4OUdFTGxFUFIyZS9Zc0huUlBCakVkL3Nn?=
 =?utf-8?B?NkhuR2s4T25Jb2p4bk9jeVIxeGthMmFxTHpKelprb24zZmJxaXROM3c4V0Vl?=
 =?utf-8?B?L05USGF6ZnJLeVd4UnB3dkxZWGNIWTE3akpKeVBpODdhTzV6Y0lkVUVVWXln?=
 =?utf-8?Q?y93hdsScPp1aM6Yad17tuqml9/0OGqh/KfjvnI5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824706e9-b5af-4a0a-f509-08d92c51d95b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 20:53:50.1830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNMpp3sJJGI6kmIcYZZhGn8EsfC/8Vc4IfiJ15fXev6EUZJt1aPeBTobC4+ZqE+2V76V5bHB6Z319spybiDxcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2837
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10011
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106100130
X-Proofpoint-ORIG-GUID: UupqjAzcqh7AdtGReDNgUy-RU8_MRdSh
X-Proofpoint-GUID: UupqjAzcqh7AdtGReDNgUy-RU8_MRdSh
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10011
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 phishscore=0
 spamscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100130
Received-SPF: pass client-ip=156.151.31.85; envelope-from=si-wei.liu@oracle.com;
 helo=userp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: elic@nvidia.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Looks good.

On 6/2/2021 1:41 AM, Jason Wang wrote:
> This patch implements the vq notification mapping support for
> vhost-vDPA. This is simply done by using mmap()/munmap() for the
> vhost-vDPA fd during device start/stop. For the device without
> notification mapping support, we fall back to eventfd based
> notification gracefully.
>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Si-Wei Liu <si-wei.liu@oracle.com>

> ---
> Changes since v1:
> - use dev->vq_index to calculate the virtqueue index
> - remove the unused host_notifier_set
> ---
>   hw/virtio/vhost-vdpa.c         | 85 ++++++++++++++++++++++++++++++++++
>   include/hw/virtio/vhost-vdpa.h |  6 +++
>   2 files changed, 91 insertions(+)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index dd4321bac2..f9a86afe64 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -285,12 +285,95 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)
>       return 0;
>   }
>   
> +static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
> +                                            int queue_index)
> +{
> +    size_t page_size = qemu_real_host_page_size;
> +    struct vhost_vdpa *v = dev->opaque;
> +    VirtIODevice *vdev = dev->vdev;
> +    VhostVDPAHostNotifier *n;
> +
> +    n = &v->notifier[queue_index];
> +
> +    if (n->addr) {
> +        virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, false);
> +        object_unparent(OBJECT(&n->mr));
> +        munmap(n->addr, page_size);
> +        n->addr = NULL;
> +    }
> +}
> +
> +static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
> +{
> +    int i;
> +
> +    for (i = 0; i < n; i++) {
> +        vhost_vdpa_host_notifier_uninit(dev, i);
> +    }
> +}
> +
> +static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int queue_index)
> +{
> +    size_t page_size = qemu_real_host_page_size;
> +    struct vhost_vdpa *v = dev->opaque;
> +    VirtIODevice *vdev = dev->vdev;
> +    VhostVDPAHostNotifier *n;
> +    int fd = v->device_fd;
> +    void *addr;
> +    char *name;
> +
> +    vhost_vdpa_host_notifier_uninit(dev, queue_index);
> +
> +    n = &v->notifier[queue_index];
> +
> +    addr = mmap(NULL, page_size, PROT_WRITE, MAP_SHARED, fd,
> +                queue_index * page_size);
> +    if (addr == MAP_FAILED) {
> +        goto err;
> +    }
> +
> +    name = g_strdup_printf("vhost-vdpa/host-notifier@%p mmaps[%d]",
> +                           v, queue_index);
> +    memory_region_init_ram_device_ptr(&n->mr, OBJECT(vdev), name,
> +                                      page_size, addr);
> +    g_free(name);
> +
> +    if (virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, true)) {
> +        munmap(addr, page_size);
> +        goto err;
> +    }
> +    n->addr = addr;
> +
> +    return 0;
> +
> +err:
> +    return -1;
> +}
> +
> +static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
> +{
> +    int i;
> +
> +    for (i = dev->vq_index; i < dev->vq_index + dev->nvqs; i++) {
> +        if (vhost_vdpa_host_notifier_init(dev, i)) {
> +            goto err;
> +        }
> +    }
> +
> +    return;
> +
> +err:
> +    vhost_vdpa_host_notifiers_uninit(dev, i);
> +    return;
> +}
> +
>   static int vhost_vdpa_cleanup(struct vhost_dev *dev)
>   {
>       struct vhost_vdpa *v;
>       assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
>       v = dev->opaque;
>       trace_vhost_vdpa_cleanup(dev, v);
> +    vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>       memory_listener_unregister(&v->listener);
>   
>       dev->opaque = NULL;
> @@ -467,6 +550,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>       if (started) {
>           uint8_t status = 0;
>           memory_listener_register(&v->listener, &address_space_memory);
> +        vhost_vdpa_host_notifiers_init(dev);
>           vhost_vdpa_set_vring_ready(dev);
>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>           vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
> @@ -476,6 +560,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>           vhost_vdpa_reset_device(dev);
>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>                                      VIRTIO_CONFIG_S_DRIVER);
> +        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>           memory_listener_unregister(&v->listener);
>   
>           return 0;
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index 9b81a409da..56bef30ec2 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -14,11 +14,17 @@
>   
>   #include "hw/virtio/virtio.h"
>   
> +typedef struct VhostVDPAHostNotifier {
> +    MemoryRegion mr;
> +    void *addr;
> +} VhostVDPAHostNotifier;
> +
>   typedef struct vhost_vdpa {
>       int device_fd;
>       uint32_t msg_type;
>       MemoryListener listener;
>       struct vhost_dev *dev;
> +    VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>   } VhostVDPA;
>   
>   extern AddressSpace address_space_memory;


