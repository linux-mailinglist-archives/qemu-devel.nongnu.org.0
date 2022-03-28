Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9D64E91F0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 11:52:15 +0200 (CEST)
Received: from localhost ([::1]:59222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYm2o-0006xE-JW
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 05:52:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nYm0d-0005Os-A8
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:49:59 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:59382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nYm0Z-00041o-K4
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:49:57 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22RL0CYU032146;
 Mon, 28 Mar 2022 02:49:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=5LapMQa62ATgh2u3D8P6q+4cu72Tb13nDFB0Hr8/LS0=;
 b=Sg1umWOrmGsElA1o9YUwOQori94RtEY5Pup/NkiorrM7/P6gGAOnilqHj+g4snlqgBLD
 v/IgYygesY4guY1joMiwNwlD6u3+Rs3u2noGBGTDH8o2Gh+BSdkTWrfyuwm7RaS+moTs
 aTmJNnjTg0Jlm39f3/wUDB9rX65KfXM+g8uEgwQsXGs1aHfZ1bqasZM+i7hsLVFeh/qW
 omqoXJLFKxHS3qI9n+LLshJL50zvAzDTBzShJOCaYp/xMOMdtJfV7y7WCIAQ+keVT4Dd
 MN3oI/vQszRXWc8zEKHVrDURwu9GaS8TCWwLwR+KVPDTlZ6OtgVUjlGHBWxy41G0Ueyd sw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3f21wf2ymf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 02:49:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQyWva5xDqOnv57toDidYHhUSqfv47J6DR2GOr/lUlHSuPERoG2/7HeWv0iAGb5xxIzqcJLmEhOYB/LlsdvK2q/GBvnVxqpfRsoQT8h2X002H24zGiQ3mJrpron0O8gsY8n9f6HGEqnjdzVgxG6iN8yKQCpkgKg+lwNwCjzfKBYA74Noo7tK5ODarbxsB+OBIEoeBjlsiThMnpjDmrv6IrdULFfBy/Pz9kge0GistqL8mQs+EBAYy0UYG1RnmtxAE+7snYZhlDkKW0YZcBXw+y0D1QpfSHrDevShDyZrQOBr0IS5/gDYFLTfjy01sQVbQCBjG8TWC5/rdexVif1V1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LapMQa62ATgh2u3D8P6q+4cu72Tb13nDFB0Hr8/LS0=;
 b=VwbbWVAgI5EVuxwuUS1MLHBH7Zmy1CeWWSQyq+k4yHJlyLPsnsgPP6ys9TmQEFedVg+3+men10sam6SpoHk7UjJcoXZS35yIjSSxlNcES2Cjbz9Kxe5i76oIo5GyDSoHLohJJSeY+Amsr3qp7FZW0vZc6/Xmo6vfWf+cMv/it/3baKU9PHVsGcxJ9BcwEr3Oa4qdGUy2LwmRBNbOz8rx+iuManQP7duY7XooTcWyQQonsRG47Vieu7yr0mm5fcXsXcSSazRz3lv4wpBG14CtmGeiXwCldF1cFONcyXyRWWl7cOvfDY3IJLvPrPWQSxb2xFGPimoOujFvGUPRKqERkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by DM5PR02MB3701.namprd02.prod.outlook.com (2603:10b6:4:b0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Mon, 28 Mar
 2022 09:49:48 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 09:49:48 +0000
Message-ID: <39cdb1d6-b598-2d9f-c79a-e6708e71ab5e@nutanix.com>
Date: Mon, 28 Mar 2022 15:19:33 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
To: qemu-devel@nongnu.org
References: <20220322104953.27731-1-kshitij.suri@nutanix.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <20220322104953.27731-1-kshitij.suri@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR0101CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::13) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b28c53c-6758-4a1e-5681-08da10a04b67
X-MS-TrafficTypeDiagnostic: DM5PR02MB3701:EE_
X-Microsoft-Antispam-PRVS: <DM5PR02MB3701F6C23CBDE75D7E7CBCAA991D9@DM5PR02MB3701.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QapvhV4JZJvSdMhdrCuuYuM28a9N7h9AZw0MWsrpHTZHQSlTxe1ELjZnk/SQHEE4ZoAQFIh3SwzeI9s45Bvqs5IT0AqpttTh7vguDaZeW9ZIMI8DXHm9Yrjao/ntFnfUzMA6m38C592ydGI5nSVWxptoIqxtsSlzel7h7d+kYVLmUDkW3SD1HAOeX+WYH3IqJB6g2UZ+zdPNIFNoJwhoWJZNGuIYwSNth7F9xeXF3gKLaJ7Bl9HamnR7CJrmlic/BlOLMOrU6NukDm1cSR1sUxYqBttdNOI/0nZVsbIPBYjm6S73uYJGmp6h3/58hWqBF4ygGxeLN/4Irg2opxddMNx2VyDPPzWozEleg5+ZaLJ7dLk3bZ7+uBQTWCaFC+RQqfhyKJVlclpBsQ57bwb/ceAKg3NhxHRVxm/wn+CRDV/Yly/JazI+WhC7byV77TRj7MB+7RdOpncj0YC7a3jvjQxaoRyDLCAyXBipa0LvNnL5pyjfbKAyVPUlz9cKdJIQHT/nIUtzTpdY16hXaPBrpqy0SnJoRQS6ooB9b6pQJ6g9LpHbULgFdIG5Sp9kM5VWAOV7nnvuDisfHaME7SV3HSNL4AhNqiR2SU7RcKZUoBLV70i6ZA5abMzL9W3sCjfW7iEm33h4dDziLbZPpX8Tb09Oh75e5RXX8uNm/iEj0NqJ/ECmrhW4MZOg3NStXw2g0EIG46GgsRQ5PvVBUZTXKkqmH+Jh1gItXmR6MlS6DaXMRS0wlvzbW7GbUAXql6wBibJXP9Ft47aPlgsakHLBWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(5660300002)(38350700002)(38100700002)(26005)(31686004)(2906002)(8936002)(186003)(36756003)(6666004)(66556008)(4326008)(2616005)(6506007)(52116002)(316002)(66476007)(508600001)(6486002)(44832011)(53546011)(6512007)(31696002)(66946007)(8676002)(86362001)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2hqa3RlSEk4T0VOK0ZVT1lKNzV2UExSWGtlaXFGOHdSaDI1NmQ5NHJSdlVi?=
 =?utf-8?B?Q25maFREb3pWNW5vNHNSRmVUeWFsczF5My9XdDJTM2NoTFZOcmVUTE5FbjlO?=
 =?utf-8?B?OXhJU0kxUlg4Y2M2Yy9yb0xNcW4wcHNZbm5IT0h1b2E2WndTeVp2aksvYVdm?=
 =?utf-8?B?NnZaNGJERitrVkZrem4zUXdVTTRaUkVTMWprVFRDL3ZRRGdwK3lhSnpuN1dl?=
 =?utf-8?B?UVNzYWEwT2wyOE9nblNNRk9mYlJYUE5OK3Y2TlpoYW9ZNGVPOW90R0hLQlNU?=
 =?utf-8?B?czFHNWNxNWh5OFZrWEh3cStjSlVHOUJ4bjhqczNuZDM0eXFqZC9MR0dISitI?=
 =?utf-8?B?T2FGTnlZSlIvdDFXQXJOYVhXZk1yenEzSVFhZ1gxSFlRbm12SGtPMHFzODV5?=
 =?utf-8?B?WmJPK201cUZVSi9zd0MyMHB0ZThJTzF5WHcvblFCbzlqZVRucWhUWks2cVJI?=
 =?utf-8?B?VkU4MUc0NEtneGNML0EwMThWODlCcXhDMlBmcDBrTWFadm5tWU9kVE9qVlVm?=
 =?utf-8?B?ODEyUGFRbTA1bzJpWGNraG5SQVhXNnRpVEpoYmJSVzFvNnZJNHh2UmxmNVdZ?=
 =?utf-8?B?SkVScWlqTEtWdW5TQWtsKzhuQUZ0ZHZubjdYSW9mU2ZTdHVSdng5MFN1bGVR?=
 =?utf-8?B?S3dhTjNiWTZKNUM1eHl3NlhSM2Y3ME9FWWVETndYNGV1czQvK2o5SVc1OFJ2?=
 =?utf-8?B?ZjVXZGtXVXU2RGIvMjQxVnprOTBFMzlxeUJLWGZFVnRrL3V2UzhtWnBZQkl1?=
 =?utf-8?B?L0tmQ2NaUWlOanBYWFRlQVR0YUtSNEJqRXlXYU8vZTYzckIrS1JDU21EczV1?=
 =?utf-8?B?L3dpU0Rkcmc2b2pVNVRQWjhkWFRYTFl6aGwyQ0ZRcXBVZDZNZy81dWJBd2ZX?=
 =?utf-8?B?VWdvL2JubXh2L1owSzJGbWZkWU9Ub2N2TjdIK25JRU9wdjBKbzdMNXdVSm4y?=
 =?utf-8?B?bVZFQzBMYmdIT3FrZXpNVnp2aUZERWJHNmxvUWNRaXRqaFJvbEo4c2l3bU56?=
 =?utf-8?B?cjRqSVhZWkRJeU8xOHVBT0RSdkdWNUl5b0xFYzZXNVE4dFZqMmh3TUdVZ1NZ?=
 =?utf-8?B?Y3pHbHQra1kvL1pvL0RFRjdTckNoQ2M1SjJjbGxzWEphWnUzanF1Y0NzUjVi?=
 =?utf-8?B?dFhWQndqMDQrYllGNWZFSnowNWx3S0xidW9nRkc0Mnd1c1RQZ1pVTmFiQ09h?=
 =?utf-8?B?T2JlV0Z1amNLYkpqTHZvZVUrdmhsdVNxZjdid3AvQkxjclBIQ3JMbFBUWmxy?=
 =?utf-8?B?MndYZmdhaVpOb1kvYzZTRmtkT2M1bEhWQUsyZW9RR2pCb0dRN0JIOG9sdHdO?=
 =?utf-8?B?OWZ4K2RRand2UmpWVXpWTkRrNmNiZFg3bGpNWHVuUXFtdExGUGNNWEV6VnlO?=
 =?utf-8?B?YTVkak54TFBuSjVmYUE4R3Nzb3ZWYllqYTBxMWxDaU5Yc0RUWG9tbjNrU3Fr?=
 =?utf-8?B?SzQ5dnNsNjNrRk56QmV0MGdjeXVLV2pZUEM1eG5CRlYyUUtyZU1jU3I5cVI4?=
 =?utf-8?B?MllyN3BjQnIvem9nc29MMitMTzEzU0hheVoyM0lwZU1XVkh5cy9pVm9mQUtw?=
 =?utf-8?B?S0diVVFSQlRvaTg5Vkx0V1dkdDZUaWYzREY4NDZuWS9aZ0thUmxqcUx5eXla?=
 =?utf-8?B?enZNOFBlakdWMTM3RWVoYTlFYkxrSWNpaDAzVUJzK3ZqUThDd0QzMjFpVXF0?=
 =?utf-8?B?Mk92MmVFRzJXY0JpcnlRWlZBLzFyWU55MzRZV3IwcEM5TzdueXZPbjNzb1dG?=
 =?utf-8?B?L2dDcG5oc2dpM1c4OHRCZTdxZHZiN3NsQmxMVlR1STU2S2wzQk5XVHdnL0h2?=
 =?utf-8?B?NWxwcEdJanhNdzZCZ2o5NjhEUzI3ajVRUXZUZ3ZnK09CWC95WDkzV3Z2OVBi?=
 =?utf-8?B?M0FpRkNxTCtpd1E1a1dwQy92eitaMVZYNHNkYlROTGdpVFl5dVhNU2dVdmFw?=
 =?utf-8?B?T2JuSEp6V0lEQjdxZGloa25TcTBtNTRkZmdHeXhid3NKUU1IK2wyMGNHazE0?=
 =?utf-8?B?bUxJUm1VMzJlZ20ydzRlb3A2UXdKUnlpU21kNWZsM3hFQ0VGU1RTWFgvNWNu?=
 =?utf-8?B?MmtoYTNPaVp2dzFmU3NsYTBVMFJicmFKSThxSGludmRUOGFFSlhYRDdBT1lx?=
 =?utf-8?B?Wjk1SllhdXZaeTQxMnhsS2YxWE54b24yVjZpa0V0V3VKeWtCUmIzbE5OeGU2?=
 =?utf-8?B?eFZwciszQWg2OUJ4ck9vQm8wMkpWb1Bia3ZUbW9EYjJWalAxNkxqdE5LVXgw?=
 =?utf-8?B?QnBGZFFTK2FkNm9uUGtnT1lQNEN4SjVEZWZJOFB4YW90UitjM2svNzJ3eHRE?=
 =?utf-8?B?bldIcnpETE9IUjFZd2ZFWlpPUThlWkxZSUdoNlgrMnZ3MFBOTWtxU0VEM2tz?=
 =?utf-8?Q?bKUHWObUDm5DYPJc=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b28c53c-6758-4a1e-5681-08da10a04b67
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 09:49:47.5659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8rl59Nwp/dR8kaORhd7YPMq7gsxBH9oPLCe+rt9J8fZDhfqroWdxz3GWg0IFhmnUkojoZsms6KHZna5Dswxuuu+5aV76nEY0Rs7iNUyvKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3701
X-Proofpoint-GUID: 4JelwC_GK9SWanIgPYZS524sTmxG1S84
X-Proofpoint-ORIG-GUID: 4JelwC_GK9SWanIgPYZS524sTmxG1S84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_03,2022-03-28_01,2022-02-23_01
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, dgilbert@redhat.com, armbru@redhat.com,
 philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Hope this mail finds you well. I have updated the code as required 
and would be grateful if you could review and suggest changes that are 
needed to be implemented. In case no change is required, please do let 
me know the next steps for the same.

Regards,

Kshitij Suri

On 22/03/22 4:19 pm, Kshitij Suri wrote:
> Libpng is only detected if VNC is enabled currently. This patch adds a
> generalised png option in the meson build which is aimed to replace use of
> CONFIG_VNC_PNG with CONFIG_PNG.
>
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   meson.build        |  9 ++++-----
>   meson_options.txt  |  4 ++--
>   ui/vnc-enc-tight.c | 18 +++++++++---------
>   ui/vnc.c           |  4 ++--
>   ui/vnc.h           |  2 +-
>   5 files changed, 18 insertions(+), 19 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 282e7c4650..ccb6840a49 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1115,14 +1115,13 @@ if gtkx11.found()
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
> @@ -1554,9 +1553,9 @@ config_host_data.set('CONFIG_TPM', have_tpm)
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
> @@ -3638,11 +3637,11 @@ summary_info += {'curses support':    curses}
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
> index 7b86a4713d..e879cca7f5 100644
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
> index 310a873c21..8376291b47 100644
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
> @@ -3256,7 +3256,7 @@ static void vnc_connect(VncDisplay *vd, QIOChannelSocket *sioc,
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

