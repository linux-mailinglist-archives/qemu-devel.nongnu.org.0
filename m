Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C373A528BC9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:18:56 +0200 (CEST)
Received: from localhost ([::1]:45522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqeMx-0004Qc-Sl
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nqeHm-0005CN-J2
 for qemu-devel@nongnu.org; Mon, 16 May 2022 13:13:34 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:48362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nqeHi-0008Q3-5r
 for qemu-devel@nongnu.org; Mon, 16 May 2022 13:13:33 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24GGmeue008370;
 Mon, 16 May 2022 10:13:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=lCRq1cZxCstIAp03WUHRtYP+Lutu0qMXvSCDJxc/Nys=;
 b=WfE3IRVUiR8YxSZSe4iD2vI5PqzV45p01oGzI2ejRDf42DjtZLpI0RZOxsigIj3odAYY
 YceJlNXSCJRHgmaZcNjsvynv3Qgi1SfbaicfbQ2gqYDcpyhR++hlk31z91lD0rGE161E
 neepr+8XpruTc/+/Z/g6u+FHQHpqYi7opKhreWEBhH8OX/wZHplc2PKM16j5K/+Dbjmr
 N+kDPaJc/CKEOGH2SpHKPft9gGefCJU/tDSUCgz3ZjhVCR8mfRYUkBpECt6atoL3YWCM
 2SimwAAe0sYXfFbuHLVBPBx8LqcY0KzCJXgztTwmjZO2tA4a3oGWxrYpARvEC0iYMisD hw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3g2by0ktxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 May 2022 10:13:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZSpwGFQXE4eo8id0t1xiLl0JCDLA7tQK+98T7ghggrWzN8sXd3ZH3rkaetc/QXSHNFQ5S+0LQhw+XbAcZktO71FS9XlJVl6WPpv1YBS5pTGQxhbu7ouR5CL5LvCIsujHK73sCP8eC+Fm6giH9UTq4OSVzl/7kZNXFvu1Cv/Gv1qaEPT9F+BtWtQ2DUdWwCHXbkXxfAaK2jsvcSY9Z7FNjokF3tPeTdLZFvXn32iscCUO90z7eP7eG7+GnBsZ8H0Trio4/+2N59wwEqUe+sQsTrZ2hXGHGaOjqFnnFbXeyAWqOiUGQwt2fgti2vnTjLmvY6aFj9BCW7c7GuSkD2NLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCRq1cZxCstIAp03WUHRtYP+Lutu0qMXvSCDJxc/Nys=;
 b=HHAVGRecuVbaKq5Iyjz0mh7O/1kMTBb/CseNIMJh19GPBZk7unng9wrj7CfnK+02fzbzAqMQB9oEDAVOAom7LiuAh1TfpiFfthVLSkcMRxdwgKIXqI4hHPH41CzHGMZB9LH57YGJrhHqCSOzqaWgQqX7UG0XDv3u5LFsCWPrlPrkrZLoGJDtQskGFdXhBkxb72ivYalV0nFgn2v9nKytbAxL57lge4m3JSEkgB1i6LUQRYB3eFFTnXEfpIkPWuozaVfgLnX7SM7ClRLyIsQNNFWkgcWp/XnOcUb0deSZCXswIK0IXl51axjz1ccO1+UjzB6BPuqr2PmHPcvmzcFDIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DM8PR02MB7912.namprd02.prod.outlook.com (2603:10b6:8:11::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 17:13:16 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 17:13:16 +0000
Content-Type: multipart/alternative;
 boundary="------------TtY0ueVX6xjiCTvuY0pfryTP"
Message-ID: <1e117589-1719-0d11-099f-9f3392e0ba6f@nutanix.com>
Date: Mon, 16 May 2022 22:43:01 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v17 6/8] softmmu/dirtylimit: Implement virtual CPU throttle
To: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <cover.1646243252.git.huangy81@chinatelecom.cn>
 <a650dbf80c9415a9d4054b6e1f936170cbfce9ea.1646243447.git.huangy81@chinatelecom.cn>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <a650dbf80c9415a9d4054b6e1f936170cbfce9ea.1646243447.git.huangy81@chinatelecom.cn>
X-ClientProxiedBy: MAXPR0101CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::18) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 831e91e4-1e9b-4c1f-d383-08da375f5d86
X-MS-TrafficTypeDiagnostic: DM8PR02MB7912:EE_
X-Microsoft-Antispam-PRVS: <DM8PR02MB7912599EA6356C83378DD007F6CF9@DM8PR02MB7912.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MGueleZmNMSxl7cThXMPM6HKc89p+ogvBdbNKX1pqaBQat4aZQ2yxtaEDWAtu7q0jVdfmtHnRRIsrgJqsZBO0j/zCRP7W0B1RejURaqCV8FDD4NidtuUvqHhDZopawtV9KpwxV+vd+4a84h9WQxQ1Z+0tNhlCmm9iAQlR+iMx1uK+kpfpynveY2VowhgVPjK1uJ/BwKXPOliz92c+VYcpgN91w6WB13IYge81y3ZzgbfsbRBKTKz7kILdtIp7jakzMyErTExKONPB15j+67AHk0BqNF7ZRS05WxOSlRid6boiPkDtbL2JdnoZs56r7K/be5L3ZQFBhGFKRrc1uDN+TfGWHUqTfp8SyEPl169hgPif+bU9jg0Yg2fl3FT9qujDwRIV0mXKwSoPh/IYX255hwOq2kCb7wAh1EP0GrybMwEisGBjqWot4U37k3rfF+jk9soY6/hkxYWHjAGA4i4AnIIhpgbUqaFrYv2XHGCpWP4LpB+MrQEaH3ksm+9gYfPCj5LzTAOpemIDx95jttcOTPvm80lpchOnTO4AdM09kpQGnZQgYzujrtcElS8FAsMQxvTpGLXD3g8/BEB8spiJ9LlkzC0nvmC5WY0CCRAE+JCuqhr5ewzja8y16KnfFMQC5AhVDZmCrx07Bm8auuMZXky5ubkVA5gHxmhad6lGXeFYrNYv/bYZUVBmVYj3nnyP78q5DqXWNaD5K8URcn5/0Rw84sMAmflpB1AE0Zmc63aYxHol/PQYIF8RT1uK+LaRTT6zGvtfoqIaT95En7NPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(30864003)(7416002)(8936002)(6486002)(38100700002)(5660300002)(31686004)(83380400001)(6512007)(31696002)(86362001)(2616005)(186003)(54906003)(6916009)(2906002)(33964004)(6506007)(53546011)(6666004)(8676002)(66556008)(66476007)(66946007)(4326008)(36756003)(316002)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dThOV3E4a2kwYkpva1BXTTlhSU1jTElpcjZ2RzFLRWJnYmJYbUlWTGo5Tm9I?=
 =?utf-8?B?aWhSb1ZRUkdtN1dibk9kb0c2WUNoMFRkaDVPZW8vaVUrR0s1d21jZ1pxY1Bw?=
 =?utf-8?B?ak8yTFhQTkFHdU53RUEzcFpLcVF2Z2JCa0lLM0VjV2N1UmNhN1R0WDBxSWJx?=
 =?utf-8?B?T3U5aUZmelZwLy9tTTZPMmQ5ZVFUc1VLOE9UbDYrcjJpNW5IalhoOEFXQ0U3?=
 =?utf-8?B?SGllMGxLdEtRaWd1dnpUNmloekFRbWpHYW8zOWc4NUU3dlYvUng2TEN3LzVk?=
 =?utf-8?B?MmVWUUllZ1FMT0xwQmFzUUpSRld1OUdNb0pJZzlzS3hVaGx4OVBzbnVmYUVn?=
 =?utf-8?B?cGZNODFMOWZuKzlyaHVJY0tqSktvaGdJNDQyZ1RDZGljWGR0a3h4THpqbjVD?=
 =?utf-8?B?T0M1TTJGcWkvY2lWUUNUekhSQmY2VkxVQ2ZsS3BjWmdxN2E1SnluNVBXVHN0?=
 =?utf-8?B?S2NjUDYwZ3dTOWtJM1JHZWVhVnNYcHB3ekhqbWpuTUVTUFVOT2Y2NnZ2ZDNU?=
 =?utf-8?B?cDZVRHZSTGE1b1VTWjNWMTVPc3FNTGs4eXV5N3VYWEo4d0hPVDRPMkNsdUI1?=
 =?utf-8?B?cmkvbFRCRTdKWDF5VGJwNCt5ZHpqUzExZlFNcld6ekR0cngzdzJsNkttZWhU?=
 =?utf-8?B?TlV5Z1pPdmJvRFhZTmtKT2FqdTBubm0xWU5aeE9ZVkVpSFZBQlpSWldNNVdj?=
 =?utf-8?B?RWo5UExJOWNWeWpGZUoxK1JWZ3FpaDNvWWpzODAzVTVqS1R3am1paVhjYVNw?=
 =?utf-8?B?S0dRdXBBOCtQV0hVL3RPemo3UXl1amlValhFS1VwYTRFdVBNMDM3dkNSc0Vh?=
 =?utf-8?B?L1RzVFcvTm1hdUUwb2VtZ2VvN0hoZTY1aEI1dnNoNWNGSDhiZWVZV1I1WHdx?=
 =?utf-8?B?VDZEc3pGZ0l5SjRDWVVEUVdKMnBiTXFTQ3liNXN4SU9WeGlrWmRLWEVBMEps?=
 =?utf-8?B?TWxtRkEzSGhVRmYwT1ZLcWF3N2VLMkRITUkwUS9zd1lJZm04cVlkK082VnEz?=
 =?utf-8?B?V3BjNUlaNGgwRTdpVUdnTCtveUVLSk04S055c25qVkt5b3dDUXoxSERtWC8w?=
 =?utf-8?B?LzNuV1hPeTRuYmJaZk91VVU4WXdmdnBwNDJEdXZxVVlDaWlta1VkaXhLREgy?=
 =?utf-8?B?MEVUNFgzZnZLdUlrakdWbVJRenlWOGgrbzluTlk2MVVUY2ljMWdPM3N5ZEo1?=
 =?utf-8?B?YjJWbERPU1o1U1FwZjV0dGZ4a1J2Yldoa1pLTS93ei9TcTNPYjFEMnhLV1Vk?=
 =?utf-8?B?Ky9OMUptYkdsL20xdG5BN3Rlb1c0WFltcHNpMXpnMDdMVXQ2SGFhOWxCU3dG?=
 =?utf-8?B?aGx5OGh6TnJCdlk3UjRjbytEM3VCSjZZV0ZhSHp1dWw3R2lLNnZhTUxtcUR1?=
 =?utf-8?B?VUdWZzRSckxiUXlpTHhlQkVQdVU5V3BDZFlTcUVIdnBpaHd5ZHpXOGk3eGY1?=
 =?utf-8?B?SkhxYzBNeEZvMm1oV3U3T3haNHU4dUxlU0NxaGNFOEZ2bGgzaEczUno2dVV0?=
 =?utf-8?B?WnJ6OXpycVZQTUIyajRscXIvQTZ5RlhMRFdMaVhLdnByZ0k5OFVIYlZhUUNG?=
 =?utf-8?B?MmlmWVpFbmFneVdodUVKT0ZSV3ZXSHFmSWFtQWl5WXF6aDZqcDFOS2dUM084?=
 =?utf-8?B?QnhrQ3dsVmhJWnNnK2dHTEJTUkRoeGFwRysxZ2Y4OHFQZHBjdUhOclBQVHly?=
 =?utf-8?B?SUZoaGZ0eDRBK0NNYlNya1hwbkpNY1BjelhQeU5XM0tkcmtrcDI4dy9kaXdX?=
 =?utf-8?B?YWhvZW4xRGtDNE04bHhTcjAwR0I2QXZkSDdOZG1zQkFkT3pZUW5qZGxjcVpr?=
 =?utf-8?B?NmM1ZC9RZXBVQTQ3SnZqZWlLVTdoMVFYNnc1MndCVDhiZVdDWWdQZUJmOS83?=
 =?utf-8?B?T01YRmxTSjJvT0dqL01uNGErcEdMU3UzOUlMQmxrQWVqQU00NDdOYlZ4UVNh?=
 =?utf-8?B?UWVFNGdtVDhqRWREUmk1dzdCTml5L0xqWDgvUGRVWXlHUkN4NVgrMkdXcTE2?=
 =?utf-8?B?WmJwV2JBL3FYdmRVb21neVVjcHpCakFyMUEyYmluQ0VSZDZEbnZ6VWZTaFpQ?=
 =?utf-8?B?STFMOG4zcnRaK1hPT3QvS05tbHdOVWpGZzlxSHAzU0M4eXZ0TEo2dGs4TEFq?=
 =?utf-8?B?VU4xYUlQaWF0NWJKcDV5OUlyKzhFWHd3K0hlQnVPQk1NVmJCN3JCRk1JbWdo?=
 =?utf-8?B?Wlg0YllmRTJ6WnhXalFsZGRhRzRHSlF3ckR0TjJ6SkdIRFlWZEZVQ2hnMXg4?=
 =?utf-8?B?OC9HeEdodmZFZGtOemJzYXI4aXQ0YUUyZml6RXJzZTJqcFYvZ3JRdy81allT?=
 =?utf-8?B?Ti9Fdzl5dU82d1N0a0ozWm1EMk1wZTVnSklNN3RMNUlqRzJwM1lkOVRzR1R2?=
 =?utf-8?Q?xSltOiX12r96j/XlAuvYrTnH9tQI4FU3FWzFmukhXn5yb?=
X-MS-Exchange-AntiSpam-MessageData-1: LOkZmwktmbNw8Z+yK2PRV7mlLb+ovdqUCR0=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831e91e4-1e9b-4c1f-d383-08da375f5d86
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 17:13:16.3601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPaLn6wtE9tTxr0BwIzSLiRqkJDxOfknVk9UklT8jnwNP7q8TCR62azWc3BKV/9I2AQvDwgD4kZn6NZO4CzK5RURcZXTGLWzbwWadnDvp1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB7912
X-Proofpoint-ORIG-GUID: TWkbzkqxyEigFR7kS9n52LGrUwiTRhUC
X-Proofpoint-GUID: TWkbzkqxyEigFR7kS9n52LGrUwiTRhUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_15,2022-05-16_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--------------TtY0ueVX6xjiCTvuY0pfryTP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Hyman Huang,

I had few doubts regarding this patch series.

1. Why we choose for dirty rate limit per vcpu. I mean it becomes very hard for user to decide per

     vcpu dirty rate limit. For e.g. we have 1Gbps network and 10 vcpu vm. Now if someone wants to

     keep criteria for convergence as total dirty rate of VM should be lesser than half of available

     bandwidth. For this case to ensure convergence user has to give dirty rate limit per vcpu

     as 1Gbps/ 2 / 10 = 50Mbps. But assume then that VM has only 1 thread which is actively

     dirtying memory, in that case so much of available quota will be wasted. So would not it be

     better to use dirty rate limit control per VM instead of vcpu?

2. Also Here we are adaptively trying to adjust sleep time based on current obsered dirty rate and

     dirty rate limit. Can it be more forceful like. Assume we have dirty rate limit of 10pages

     per sec and auto-converge/ dirty rate limit was triggered at time 0. Now at any point of time assume

     at time 10 sec if number of pages dirtyed are more than 100pages we sleep for interpolated amount

     of time. Basically at every dirty ring exit we can check if current number of pages dirtied are more than

     what should be allowed by this time?

thanks

Manish Mishra

On 02/03/22 11:25 pm, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇)<huangy81@chinatelecom.cn>
>
> Setup a negative feedback system when vCPU thread
> handling KVM_EXIT_DIRTY_RING_FULL exit by introducing
> throttle_us_per_full field in struct CPUState. Sleep
> throttle_us_per_full microseconds to throttle vCPU
> if dirtylimit is in service.
>
> Signed-off-by: Hyman Huang(黄勇)<huangy81@chinatelecom.cn>
> Reviewed-by: Peter Xu<peterx@redhat.com>
> ---
>   accel/kvm/kvm-all.c         |  19 ++-
>   include/hw/core/cpu.h       |   6 +
>   include/sysemu/dirtylimit.h |  15 +++
>   softmmu/dirtylimit.c        | 291 ++++++++++++++++++++++++++++++++++++++++++++
>   softmmu/trace-events        |   7 ++
>   5 files changed, 337 insertions(+), 1 deletion(-)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 8821d80..98e43e6 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -45,6 +45,7 @@
>   #include "qemu/guest-random.h"
>   #include "sysemu/hw_accel.h"
>   #include "kvm-cpus.h"
> +#include "sysemu/dirtylimit.h"
>   
>   #include "hw/boards.h"
>   
> @@ -476,6 +477,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
>       cpu->kvm_state = s;
>       cpu->vcpu_dirty = true;
>       cpu->dirty_pages = 0;
> +    cpu->throttle_us_per_full = 0;
>   
>       mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
>       if (mmap_size < 0) {
> @@ -1469,6 +1471,11 @@ static void *kvm_dirty_ring_reaper_thread(void *data)
>            */
>           sleep(1);
>   
> +        /* keep sleeping so that dirtylimit not be interfered by reaper */
> +        if (dirtylimit_in_service()) {
> +            continue;
> +        }
> +
>           trace_kvm_dirty_ring_reaper("wakeup");
>           r->reaper_state = KVM_DIRTY_RING_REAPER_REAPING;
>   
> @@ -2964,8 +2971,18 @@ int kvm_cpu_exec(CPUState *cpu)
>                */
>               trace_kvm_dirty_ring_full(cpu->cpu_index);
>               qemu_mutex_lock_iothread();
> -            kvm_dirty_ring_reap(kvm_state, NULL);
> +            /* We throttle vCPU by making it sleep once it exit from kernel
> +             * due to dirty ring full. In the dirtylimit scenario, reaping
> +             * all vCPUs after a single vCPU dirty ring get full result in
> +             * the miss of sleep, so just reap the ring-fulled vCPU.
> +             */
> +            if (dirtylimit_in_service()) {
> +                kvm_dirty_ring_reap(kvm_state, cpu);
> +            } else {
> +                kvm_dirty_ring_reap(kvm_state, NULL);
> +            }
>               qemu_mutex_unlock_iothread();
> +            dirtylimit_vcpu_execute(cpu);
>               ret = 0;
>               break;
>           case KVM_EXIT_SYSTEM_EVENT:
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 76ab3b8..dbeb31a 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -411,6 +411,12 @@ struct CPUState {
>        */
>       bool throttle_thread_scheduled;
>   
> +    /*
> +     * Sleep throttle_us_per_full microseconds once dirty ring is full
> +     * if dirty page rate limit is enabled.
> +     */
> +    int64_t throttle_us_per_full;
> +
>       bool ignore_memory_transaction_failures;
>   
>       /* Used for user-only emulation of prctl(PR_SET_UNALIGN). */
> diff --git a/include/sysemu/dirtylimit.h b/include/sysemu/dirtylimit.h
> index da459f0..8d2c1f3 100644
> --- a/include/sysemu/dirtylimit.h
> +++ b/include/sysemu/dirtylimit.h
> @@ -19,4 +19,19 @@ void vcpu_dirty_rate_stat_start(void);
>   void vcpu_dirty_rate_stat_stop(void);
>   void vcpu_dirty_rate_stat_initialize(void);
>   void vcpu_dirty_rate_stat_finalize(void);
> +
> +void dirtylimit_state_lock(void);
> +void dirtylimit_state_unlock(void);
> +void dirtylimit_state_initialize(void);
> +void dirtylimit_state_finalize(void);
> +bool dirtylimit_in_service(void);
> +bool dirtylimit_vcpu_index_valid(int cpu_index);
> +void dirtylimit_process(void);
> +void dirtylimit_change(bool start);
> +void dirtylimit_set_vcpu(int cpu_index,
> +                         uint64_t quota,
> +                         bool enable);
> +void dirtylimit_set_all(uint64_t quota,
> +                        bool enable);
> +void dirtylimit_vcpu_execute(CPUState *cpu);
>   #endif
> diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
> index 6102e8c..76d0b44 100644
> --- a/softmmu/dirtylimit.c
> +++ b/softmmu/dirtylimit.c
> @@ -18,6 +18,26 @@
>   #include "sysemu/dirtylimit.h"
>   #include "exec/memory.h"
>   #include "hw/boards.h"
> +#include "sysemu/kvm.h"
> +#include "trace.h"
> +
> +/*
> + * Dirtylimit stop working if dirty page rate error
> + * value less than DIRTYLIMIT_TOLERANCE_RANGE
> + */
> +#define DIRTYLIMIT_TOLERANCE_RANGE  25  /* MB/s */
> +/*
> + * Plus or minus vcpu sleep time linearly if dirty
> + * page rate error value percentage over
> + * DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT.
> + * Otherwise, plus or minus a fixed vcpu sleep time.
> + */
> +#define DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT     50
> +/*
> + * Max vcpu sleep time percentage during a cycle
> + * composed of dirty ring full and sleep time.
> + */
> +#define DIRTYLIMIT_THROTTLE_PCT_MAX 99
>   
>   struct {
>       VcpuStat stat;
> @@ -25,6 +45,30 @@ struct {
>       QemuThread thread;
>   } *vcpu_dirty_rate_stat;
>   
> +typedef struct VcpuDirtyLimitState {
> +    int cpu_index;
> +    bool enabled;
> +    /*
> +     * Quota dirty page rate, unit is MB/s
> +     * zero if not enabled.
> +     */
> +    uint64_t quota;
> +} VcpuDirtyLimitState;
> +
> +struct {
> +    VcpuDirtyLimitState *states;
> +    /* Max cpus number configured by user */
> +    int max_cpus;
> +    /* Number of vcpu under dirtylimit */
> +    int limited_nvcpu;
> +} *dirtylimit_state;
> +
> +/* protect dirtylimit_state */
> +static QemuMutex dirtylimit_mutex;
> +
> +/* dirtylimit thread quit if dirtylimit_quit is true */
> +static bool dirtylimit_quit;
> +
>   static void vcpu_dirty_rate_stat_collect(void)
>   {
>       VcpuStat stat;
> @@ -54,6 +98,9 @@ static void *vcpu_dirty_rate_stat_thread(void *opaque)
>   
>       while (qatomic_read(&vcpu_dirty_rate_stat->running)) {
>           vcpu_dirty_rate_stat_collect();
> +        if (dirtylimit_in_service()) {
> +            dirtylimit_process();
> +        }
>       }
>   
>       /* stop log sync */
> @@ -86,9 +133,11 @@ void vcpu_dirty_rate_stat_start(void)
>   void vcpu_dirty_rate_stat_stop(void)
>   {
>       qatomic_set(&vcpu_dirty_rate_stat->running, 0);
> +    dirtylimit_state_unlock();
>       qemu_mutex_unlock_iothread();
>       qemu_thread_join(&vcpu_dirty_rate_stat->thread);
>       qemu_mutex_lock_iothread();
> +    dirtylimit_state_lock();
>   }
>   
>   void vcpu_dirty_rate_stat_initialize(void)
> @@ -114,3 +163,245 @@ void vcpu_dirty_rate_stat_finalize(void)
>       free(vcpu_dirty_rate_stat);
>       vcpu_dirty_rate_stat = NULL;
>   }
> +
> +void dirtylimit_state_lock(void)
> +{
> +    qemu_mutex_lock(&dirtylimit_mutex);
> +}
> +
> +void dirtylimit_state_unlock(void)
> +{
> +    qemu_mutex_unlock(&dirtylimit_mutex);
> +}
> +
> +static void
> +__attribute__((__constructor__)) dirtylimit_mutex_init(void)
> +{
> +    qemu_mutex_init(&dirtylimit_mutex);
> +}
> +
> +static inline VcpuDirtyLimitState *dirtylimit_vcpu_get_state(int cpu_index)
> +{
> +    return &dirtylimit_state->states[cpu_index];
> +}
> +
> +void dirtylimit_state_initialize(void)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    int max_cpus = ms->smp.max_cpus;
> +    int i;
> +
> +    dirtylimit_state = g_malloc0(sizeof(*dirtylimit_state));
> +
> +    dirtylimit_state->states =
> +            g_malloc0(sizeof(VcpuDirtyLimitState) * max_cpus);
> +
> +    for (i = 0; i < max_cpus; i++) {
> +        dirtylimit_state->states[i].cpu_index = i;
> +    }
> +
> +    dirtylimit_state->max_cpus = max_cpus;
> +    trace_dirtylimit_state_initialize(max_cpus);
> +}
> +
> +void dirtylimit_state_finalize(void)
> +{
> +    free(dirtylimit_state->states);
> +    dirtylimit_state->states = NULL;
> +
> +    free(dirtylimit_state);
> +    dirtylimit_state = NULL;
> +
> +    trace_dirtylimit_state_finalize();
> +}
> +
> +bool dirtylimit_in_service(void)
> +{
> +    return !!dirtylimit_state;
> +}
> +
> +bool dirtylimit_vcpu_index_valid(int cpu_index)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +
> +    return !(cpu_index < 0 ||
> +             cpu_index >= ms->smp.max_cpus);
> +}
> +
> +static inline int64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate)
> +{
> +    static uint64_t max_dirtyrate;
> +    uint32_t dirty_ring_size = kvm_dirty_ring_size();
> +    uint64_t dirty_ring_size_meory_MB =
> +        dirty_ring_size * TARGET_PAGE_SIZE >> 20;
> +
> +    if (max_dirtyrate < dirtyrate) {
> +        max_dirtyrate = dirtyrate;
> +    }
> +
> +    return dirty_ring_size_meory_MB * 1000000 / max_dirtyrate;
> +}
> +
> +static inline bool dirtylimit_done(uint64_t quota,
> +                                   uint64_t current)
> +{
> +    uint64_t min, max;
> +
> +    min = MIN(quota, current);
> +    max = MAX(quota, current);
> +
> +    return ((max - min) <= DIRTYLIMIT_TOLERANCE_RANGE) ? true : false;
> +}
> +
> +static inline bool
> +dirtylimit_need_linear_adjustment(uint64_t quota,
> +                                  uint64_t current)
> +{
> +    uint64_t min, max;
> +
> +    min = MIN(quota, current);
> +    max = MAX(quota, current);
> +
> +    return ((max - min) * 100 / max) > DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT;
> +}
> +
> +static void dirtylimit_set_throttle(CPUState *cpu,
> +                                    uint64_t quota,
> +                                    uint64_t current)
> +{
> +    int64_t ring_full_time_us = 0;
> +    uint64_t sleep_pct = 0;
> +    uint64_t throttle_us = 0;
> +
> +    if (current == 0) {
> +        cpu->throttle_us_per_full = 0;
> +        return;
> +    }
> +
> +    ring_full_time_us = dirtylimit_dirty_ring_full_time(current);
> +
> +    if (dirtylimit_need_linear_adjustment(quota, current)) {
> +        if (quota < current) {
> +            sleep_pct = (current - quota) * 100 / current;
> +            throttle_us =
> +                ring_full_time_us * sleep_pct / (double)(100 - sleep_pct);
> +            cpu->throttle_us_per_full += throttle_us;
> +        } else {
> +            sleep_pct = (quota - current) * 100 / quota;
> +            throttle_us =
> +                ring_full_time_us * sleep_pct / (double)(100 - sleep_pct);
> +            cpu->throttle_us_per_full -= throttle_us;
> +        }
> +
> +        trace_dirtylimit_throttle_pct(cpu->cpu_index,
> +                                      sleep_pct,
> +                                      throttle_us);
> +    } else {
> +        if (quota < current) {
> +            cpu->throttle_us_per_full += ring_full_time_us / 10;
> +        } else {
> +            cpu->throttle_us_per_full -= ring_full_time_us / 10;
> +        }
> +    }
> +
> +    /*
> +     * TODO: in the big kvm_dirty_ring_size case (eg: 65536, or other scenario),
> +     *       current dirty page rate may never reach the quota, we should stop
> +     *       increasing sleep time?
> +     */
> +    cpu->throttle_us_per_full = MIN(cpu->throttle_us_per_full,
> +        ring_full_time_us * DIRTYLIMIT_THROTTLE_PCT_MAX);
> +
> +    cpu->throttle_us_per_full = MAX(cpu->throttle_us_per_full, 0);
> +}
> +
> +static void dirtylimit_adjust_throttle(CPUState *cpu)
> +{
> +    uint64_t quota = 0;
> +    uint64_t current = 0;
> +    int cpu_index = cpu->cpu_index;
> +
> +    quota = dirtylimit_vcpu_get_state(cpu_index)->quota;
> +    current = vcpu_dirty_rate_get(cpu_index);
> +
> +    if (!dirtylimit_done(quota, current)) {
> +        dirtylimit_set_throttle(cpu, quota, current);
> +    }
> +
> +    return;
> +}
> +
> +void dirtylimit_process(void)
> +{
> +    CPUState *cpu;
> +
> +    if (!qatomic_read(&dirtylimit_quit)) {
> +        dirtylimit_state_lock();
> +
> +        if (!dirtylimit_in_service()) {
> +            dirtylimit_state_unlock();
> +            return;
> +        }
> +
> +        CPU_FOREACH(cpu) {
> +            if (!dirtylimit_vcpu_get_state(cpu->cpu_index)->enabled) {
> +                continue;
> +            }
> +            dirtylimit_adjust_throttle(cpu);
> +        }
> +        dirtylimit_state_unlock();
> +    }
> +}
> +
> +void dirtylimit_change(bool start)
> +{
> +    if (start) {
> +        qatomic_set(&dirtylimit_quit, 0);
> +    } else {
> +        qatomic_set(&dirtylimit_quit, 1);
> +    }
> +}
> +
> +void dirtylimit_set_vcpu(int cpu_index,
> +                         uint64_t quota,
> +                         bool enable)
> +{
> +    trace_dirtylimit_set_vcpu(cpu_index, quota);
> +
> +    if (enable) {
> +        dirtylimit_state->states[cpu_index].quota = quota;
> +        if (!dirtylimit_vcpu_get_state(cpu_index)->enabled) {
> +            dirtylimit_state->limited_nvcpu++;
> +        }
> +    } else {
> +        dirtylimit_state->states[cpu_index].quota = 0;
> +        if (dirtylimit_state->states[cpu_index].enabled) {
> +            dirtylimit_state->limited_nvcpu--;
> +        }
> +    }
> +
> +    dirtylimit_state->states[cpu_index].enabled = enable;
> +}
> +
> +void dirtylimit_set_all(uint64_t quota,
> +                        bool enable)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    int max_cpus = ms->smp.max_cpus;
> +    int i;
> +
> +    for (i = 0; i < max_cpus; i++) {
> +        dirtylimit_set_vcpu(i, quota, enable);
> +    }
> +}
> +
> +void dirtylimit_vcpu_execute(CPUState *cpu)
> +{
> +    if (dirtylimit_in_service() &&
> +        dirtylimit_vcpu_get_state(cpu->cpu_index)->enabled &&
> +        cpu->throttle_us_per_full) {
> +        trace_dirtylimit_vcpu_execute(cpu->cpu_index,
> +                cpu->throttle_us_per_full);
> +        usleep(cpu->throttle_us_per_full);
> +    }
> +}
> diff --git a/softmmu/trace-events b/softmmu/trace-events
> index 9c88887..22606dc 100644
> --- a/softmmu/trace-events
> +++ b/softmmu/trace-events
> @@ -31,3 +31,10 @@ runstate_set(int current_state, const char *current_state_str, int new_state, co
>   system_wakeup_request(int reason) "reason=%d"
>   qemu_system_shutdown_request(int reason) "reason=%d"
>   qemu_system_powerdown_request(void) ""
> +
> +#dirtylimit.c
> +dirtylimit_state_initialize(int max_cpus) "dirtylimit state initialize: max cpus %d"
> +dirtylimit_state_finalize(void)
> +dirtylimit_throttle_pct(int cpu_index, uint64_t pct, int64_t time_us) "CPU[%d] throttle percent: %" PRIu64 ", throttle adjust time %"PRIi64 " us"
> +dirtylimit_set_vcpu(int cpu_index, uint64_t quota) "CPU[%d] set dirty page rate limit %"PRIu64
> +dirtylimit_vcpu_execute(int cpu_index, int64_t sleep_time_us) "CPU[%d] sleep %"PRIi64 " us"
--------------TtY0ueVX6xjiCTvuY0pfryTP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font size="2">Hi Hyman Huang,</font></p>
    <p><font size="2">I had few doubts regarding this patch series.</font></p>
    <p><font size="2">1. Why we choose for dirty rate limit per vcpu. I
        mean it becomes very hard for user to decide per</font></p>
    <p><font size="2">&nbsp;&nbsp;&nbsp; vcpu dirty rate limit. For e.g. we have 1Gbps
        network and 10 vcpu vm. Now if someone wants to</font></p>
    <p><font size="2">&nbsp;&nbsp;&nbsp; keep criteria for convergence as total dirty
        rate of VM should be lesser than half of available <br>
      </font></p>
    <p><font size="2">&nbsp;&nbsp;&nbsp; bandwidth. For this case to ensure convergence
        user has to give dirty rate limit per vcpu</font></p>
    <p><font size="2">&nbsp;&nbsp;&nbsp; as 1Gbps/ 2 / 10 = 50Mbps. But assume then
        that VM has only 1 thread which is actively</font></p>
    <p><font size="2">&nbsp;&nbsp;&nbsp; dirtying memory, in that case so much of
        available quota will be wasted. So would not it be <br>
      </font></p>
    <p><font size="2">&nbsp;&nbsp;&nbsp; better to use dirty rate limit control per VM
        instead of vcpu?</font></p>
    <p><font size="2">2. Also Here we are adaptively trying to adjust
        sleep time based on current obsered dirty rate and</font></p>
    <p><font size="2">&nbsp;&nbsp;&nbsp; dirty rate limit. Can it be more forceful
        like. Assume we have dirty rate limit of 10pages</font></p>
    <p><font size="2">&nbsp;&nbsp;&nbsp; per sec and auto-converge/ dirty rate limit
        was triggered at time 0. Now at any point of time assume</font></p>
    <p><font size="2">&nbsp;&nbsp;&nbsp; at time 10 sec if number of pages dirtyed are
        more than 100pages we sleep for interpolated amount</font></p>
    <p><font size="2">&nbsp;&nbsp;&nbsp; of time. Basically at every dirty ring exit we
        can check if current number of pages dirtied are more than</font></p>
    <p><font size="2">&nbsp;&nbsp;&nbsp; what should be allowed by this time?</font></p>
    <p><font size="2">thanks</font></p>
    <p><font size="2">Manish Mishra</font><br>
    </p>
    <div class="moz-cite-prefix">On 02/03/22 11:25 pm,
      <a class="moz-txt-link-abbreviated" href="mailto:huangy81@chinatelecom.cn">huangy81@chinatelecom.cn</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:a650dbf80c9415a9d4054b6e1f936170cbfce9ea.1646243447.git.huangy81@chinatelecom.cn">
      <pre class="moz-quote-pre" wrap="">From: Hyman Huang(黄勇) <a class="moz-txt-link-rfc2396E" href="mailto:huangy81@chinatelecom.cn">&lt;huangy81@chinatelecom.cn&gt;</a>

Setup a negative feedback system when vCPU thread
handling KVM_EXIT_DIRTY_RING_FULL exit by introducing
throttle_us_per_full field in struct CPUState. Sleep
throttle_us_per_full microseconds to throttle vCPU
if dirtylimit is in service.

Signed-off-by: Hyman Huang(黄勇) <a class="moz-txt-link-rfc2396E" href="mailto:huangy81@chinatelecom.cn">&lt;huangy81@chinatelecom.cn&gt;</a>
Reviewed-by: Peter Xu <a class="moz-txt-link-rfc2396E" href="mailto:peterx@redhat.com">&lt;peterx@redhat.com&gt;</a>
---
 accel/kvm/kvm-all.c         |  19 ++-
 include/hw/core/cpu.h       |   6 +
 include/sysemu/dirtylimit.h |  15 +++
 softmmu/dirtylimit.c        | 291 ++++++++++++++++++++++++++++++++++++++++++++
 softmmu/trace-events        |   7 ++
 5 files changed, 337 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 8821d80..98e43e6 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -45,6 +45,7 @@
 #include &quot;qemu/guest-random.h&quot;
 #include &quot;sysemu/hw_accel.h&quot;
 #include &quot;kvm-cpus.h&quot;
+#include &quot;sysemu/dirtylimit.h&quot;
 
 #include &quot;hw/boards.h&quot;
 
@@ -476,6 +477,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
     cpu-&gt;kvm_state = s;
     cpu-&gt;vcpu_dirty = true;
     cpu-&gt;dirty_pages = 0;
+    cpu-&gt;throttle_us_per_full = 0;
 
     mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
     if (mmap_size &lt; 0) {
@@ -1469,6 +1471,11 @@ static void *kvm_dirty_ring_reaper_thread(void *data)
          */
         sleep(1);
 
+        /* keep sleeping so that dirtylimit not be interfered by reaper */
+        if (dirtylimit_in_service()) {
+            continue;
+        }
+
         trace_kvm_dirty_ring_reaper(&quot;wakeup&quot;);
         r-&gt;reaper_state = KVM_DIRTY_RING_REAPER_REAPING;
 
@@ -2964,8 +2971,18 @@ int kvm_cpu_exec(CPUState *cpu)
              */
             trace_kvm_dirty_ring_full(cpu-&gt;cpu_index);
             qemu_mutex_lock_iothread();
-            kvm_dirty_ring_reap(kvm_state, NULL);
+            /* We throttle vCPU by making it sleep once it exit from kernel
+             * due to dirty ring full. In the dirtylimit scenario, reaping
+             * all vCPUs after a single vCPU dirty ring get full result in
+             * the miss of sleep, so just reap the ring-fulled vCPU.
+             */
+            if (dirtylimit_in_service()) {
+                kvm_dirty_ring_reap(kvm_state, cpu);
+            } else {
+                kvm_dirty_ring_reap(kvm_state, NULL);
+            }
             qemu_mutex_unlock_iothread();
+            dirtylimit_vcpu_execute(cpu);
             ret = 0;
             break;
         case KVM_EXIT_SYSTEM_EVENT:
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 76ab3b8..dbeb31a 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -411,6 +411,12 @@ struct CPUState {
      */
     bool throttle_thread_scheduled;
 
+    /*
+     * Sleep throttle_us_per_full microseconds once dirty ring is full
+     * if dirty page rate limit is enabled.
+     */
+    int64_t throttle_us_per_full;
+
     bool ignore_memory_transaction_failures;
 
     /* Used for user-only emulation of prctl(PR_SET_UNALIGN). */
diff --git a/include/sysemu/dirtylimit.h b/include/sysemu/dirtylimit.h
index da459f0..8d2c1f3 100644
--- a/include/sysemu/dirtylimit.h
+++ b/include/sysemu/dirtylimit.h
@@ -19,4 +19,19 @@ void vcpu_dirty_rate_stat_start(void);
 void vcpu_dirty_rate_stat_stop(void);
 void vcpu_dirty_rate_stat_initialize(void);
 void vcpu_dirty_rate_stat_finalize(void);
+
+void dirtylimit_state_lock(void);
+void dirtylimit_state_unlock(void);
+void dirtylimit_state_initialize(void);
+void dirtylimit_state_finalize(void);
+bool dirtylimit_in_service(void);
+bool dirtylimit_vcpu_index_valid(int cpu_index);
+void dirtylimit_process(void);
+void dirtylimit_change(bool start);
+void dirtylimit_set_vcpu(int cpu_index,
+                         uint64_t quota,
+                         bool enable);
+void dirtylimit_set_all(uint64_t quota,
+                        bool enable);
+void dirtylimit_vcpu_execute(CPUState *cpu);
 #endif
diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index 6102e8c..76d0b44 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -18,6 +18,26 @@
 #include &quot;sysemu/dirtylimit.h&quot;
 #include &quot;exec/memory.h&quot;
 #include &quot;hw/boards.h&quot;
+#include &quot;sysemu/kvm.h&quot;
+#include &quot;trace.h&quot;
+
+/*
+ * Dirtylimit stop working if dirty page rate error
+ * value less than DIRTYLIMIT_TOLERANCE_RANGE
+ */
+#define DIRTYLIMIT_TOLERANCE_RANGE  25  /* MB/s */
+/*
+ * Plus or minus vcpu sleep time linearly if dirty
+ * page rate error value percentage over
+ * DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT.
+ * Otherwise, plus or minus a fixed vcpu sleep time.
+ */
+#define DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT     50
+/*
+ * Max vcpu sleep time percentage during a cycle
+ * composed of dirty ring full and sleep time.
+ */
+#define DIRTYLIMIT_THROTTLE_PCT_MAX 99
 
 struct {
     VcpuStat stat;
@@ -25,6 +45,30 @@ struct {
     QemuThread thread;
 } *vcpu_dirty_rate_stat;
 
+typedef struct VcpuDirtyLimitState {
+    int cpu_index;
+    bool enabled;
+    /*
+     * Quota dirty page rate, unit is MB/s
+     * zero if not enabled.
+     */
+    uint64_t quota;
+} VcpuDirtyLimitState;
+
+struct {
+    VcpuDirtyLimitState *states;
+    /* Max cpus number configured by user */
+    int max_cpus;
+    /* Number of vcpu under dirtylimit */
+    int limited_nvcpu;
+} *dirtylimit_state;
+
+/* protect dirtylimit_state */
+static QemuMutex dirtylimit_mutex;
+
+/* dirtylimit thread quit if dirtylimit_quit is true */
+static bool dirtylimit_quit;
+
 static void vcpu_dirty_rate_stat_collect(void)
 {
     VcpuStat stat;
@@ -54,6 +98,9 @@ static void *vcpu_dirty_rate_stat_thread(void *opaque)
 
     while (qatomic_read(&amp;vcpu_dirty_rate_stat-&gt;running)) {
         vcpu_dirty_rate_stat_collect();
+        if (dirtylimit_in_service()) {
+            dirtylimit_process();
+        }
     }
 
     /* stop log sync */
@@ -86,9 +133,11 @@ void vcpu_dirty_rate_stat_start(void)
 void vcpu_dirty_rate_stat_stop(void)
 {
     qatomic_set(&amp;vcpu_dirty_rate_stat-&gt;running, 0);
+    dirtylimit_state_unlock();
     qemu_mutex_unlock_iothread();
     qemu_thread_join(&amp;vcpu_dirty_rate_stat-&gt;thread);
     qemu_mutex_lock_iothread();
+    dirtylimit_state_lock();
 }
 
 void vcpu_dirty_rate_stat_initialize(void)
@@ -114,3 +163,245 @@ void vcpu_dirty_rate_stat_finalize(void)
     free(vcpu_dirty_rate_stat);
     vcpu_dirty_rate_stat = NULL;
 }
+
+void dirtylimit_state_lock(void)
+{
+    qemu_mutex_lock(&amp;dirtylimit_mutex);
+}
+
+void dirtylimit_state_unlock(void)
+{
+    qemu_mutex_unlock(&amp;dirtylimit_mutex);
+}
+
+static void
+__attribute__((__constructor__)) dirtylimit_mutex_init(void)
+{
+    qemu_mutex_init(&amp;dirtylimit_mutex);
+}
+
+static inline VcpuDirtyLimitState *dirtylimit_vcpu_get_state(int cpu_index)
+{
+    return &amp;dirtylimit_state-&gt;states[cpu_index];
+}
+
+void dirtylimit_state_initialize(void)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    int max_cpus = ms-&gt;smp.max_cpus;
+    int i;
+
+    dirtylimit_state = g_malloc0(sizeof(*dirtylimit_state));
+
+    dirtylimit_state-&gt;states =
+            g_malloc0(sizeof(VcpuDirtyLimitState) * max_cpus);
+
+    for (i = 0; i &lt; max_cpus; i++) {
+        dirtylimit_state-&gt;states[i].cpu_index = i;
+    }
+
+    dirtylimit_state-&gt;max_cpus = max_cpus;
+    trace_dirtylimit_state_initialize(max_cpus);
+}
+
+void dirtylimit_state_finalize(void)
+{
+    free(dirtylimit_state-&gt;states);
+    dirtylimit_state-&gt;states = NULL;
+
+    free(dirtylimit_state);
+    dirtylimit_state = NULL;
+
+    trace_dirtylimit_state_finalize();
+}
+
+bool dirtylimit_in_service(void)
+{
+    return !!dirtylimit_state;
+}
+
+bool dirtylimit_vcpu_index_valid(int cpu_index)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    return !(cpu_index &lt; 0 ||
+             cpu_index &gt;= ms-&gt;smp.max_cpus);
+}
+
+static inline int64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate)
+{
+    static uint64_t max_dirtyrate;
+    uint32_t dirty_ring_size = kvm_dirty_ring_size();
+    uint64_t dirty_ring_size_meory_MB =
+        dirty_ring_size * TARGET_PAGE_SIZE &gt;&gt; 20;
+
+    if (max_dirtyrate &lt; dirtyrate) {
+        max_dirtyrate = dirtyrate;
+    }
+
+    return dirty_ring_size_meory_MB * 1000000 / max_dirtyrate;
+}
+
+static inline bool dirtylimit_done(uint64_t quota,
+                                   uint64_t current)
+{
+    uint64_t min, max;
+
+    min = MIN(quota, current);
+    max = MAX(quota, current);
+
+    return ((max - min) &lt;= DIRTYLIMIT_TOLERANCE_RANGE) ? true : false;
+}
+
+static inline bool
+dirtylimit_need_linear_adjustment(uint64_t quota,
+                                  uint64_t current)
+{
+    uint64_t min, max;
+
+    min = MIN(quota, current);
+    max = MAX(quota, current);
+
+    return ((max - min) * 100 / max) &gt; DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT;
+}
+
+static void dirtylimit_set_throttle(CPUState *cpu,
+                                    uint64_t quota,
+                                    uint64_t current)
+{
+    int64_t ring_full_time_us = 0;
+    uint64_t sleep_pct = 0;
+    uint64_t throttle_us = 0;
+
+    if (current == 0) {
+        cpu-&gt;throttle_us_per_full = 0;
+        return;
+    }
+
+    ring_full_time_us = dirtylimit_dirty_ring_full_time(current);
+
+    if (dirtylimit_need_linear_adjustment(quota, current)) {
+        if (quota &lt; current) {
+            sleep_pct = (current - quota) * 100 / current;
+            throttle_us =
+                ring_full_time_us * sleep_pct / (double)(100 - sleep_pct);
+            cpu-&gt;throttle_us_per_full += throttle_us;
+        } else {
+            sleep_pct = (quota - current) * 100 / quota;
+            throttle_us =
+                ring_full_time_us * sleep_pct / (double)(100 - sleep_pct);
+            cpu-&gt;throttle_us_per_full -= throttle_us;
+        }
+
+        trace_dirtylimit_throttle_pct(cpu-&gt;cpu_index,
+                                      sleep_pct,
+                                      throttle_us);
+    } else {
+        if (quota &lt; current) {
+            cpu-&gt;throttle_us_per_full += ring_full_time_us / 10;
+        } else {
+            cpu-&gt;throttle_us_per_full -= ring_full_time_us / 10;
+        }
+    }
+
+    /*
+     * TODO: in the big kvm_dirty_ring_size case (eg: 65536, or other scenario),
+     *       current dirty page rate may never reach the quota, we should stop
+     *       increasing sleep time?
+     */
+    cpu-&gt;throttle_us_per_full = MIN(cpu-&gt;throttle_us_per_full,
+        ring_full_time_us * DIRTYLIMIT_THROTTLE_PCT_MAX);
+
+    cpu-&gt;throttle_us_per_full = MAX(cpu-&gt;throttle_us_per_full, 0);
+}
+
+static void dirtylimit_adjust_throttle(CPUState *cpu)
+{
+    uint64_t quota = 0;
+    uint64_t current = 0;
+    int cpu_index = cpu-&gt;cpu_index;
+
+    quota = dirtylimit_vcpu_get_state(cpu_index)-&gt;quota;
+    current = vcpu_dirty_rate_get(cpu_index);
+
+    if (!dirtylimit_done(quota, current)) {
+        dirtylimit_set_throttle(cpu, quota, current);
+    }
+
+    return;
+}
+
+void dirtylimit_process(void)
+{
+    CPUState *cpu;
+
+    if (!qatomic_read(&amp;dirtylimit_quit)) {
+        dirtylimit_state_lock();
+
+        if (!dirtylimit_in_service()) {
+            dirtylimit_state_unlock();
+            return;
+        }
+
+        CPU_FOREACH(cpu) {
+            if (!dirtylimit_vcpu_get_state(cpu-&gt;cpu_index)-&gt;enabled) {
+                continue;
+            }
+            dirtylimit_adjust_throttle(cpu);
+        }
+        dirtylimit_state_unlock();
+    }
+}
+
+void dirtylimit_change(bool start)
+{
+    if (start) {
+        qatomic_set(&amp;dirtylimit_quit, 0);
+    } else {
+        qatomic_set(&amp;dirtylimit_quit, 1);
+    }
+}
+
+void dirtylimit_set_vcpu(int cpu_index,
+                         uint64_t quota,
+                         bool enable)
+{
+    trace_dirtylimit_set_vcpu(cpu_index, quota);
+
+    if (enable) {
+        dirtylimit_state-&gt;states[cpu_index].quota = quota;
+        if (!dirtylimit_vcpu_get_state(cpu_index)-&gt;enabled) {
+            dirtylimit_state-&gt;limited_nvcpu++;
+        }
+    } else {
+        dirtylimit_state-&gt;states[cpu_index].quota = 0;
+        if (dirtylimit_state-&gt;states[cpu_index].enabled) {
+            dirtylimit_state-&gt;limited_nvcpu--;
+        }
+    }
+
+    dirtylimit_state-&gt;states[cpu_index].enabled = enable;
+}
+
+void dirtylimit_set_all(uint64_t quota,
+                        bool enable)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    int max_cpus = ms-&gt;smp.max_cpus;
+    int i;
+
+    for (i = 0; i &lt; max_cpus; i++) {
+        dirtylimit_set_vcpu(i, quota, enable);
+    }
+}
+
+void dirtylimit_vcpu_execute(CPUState *cpu)
+{
+    if (dirtylimit_in_service() &amp;&amp;
+        dirtylimit_vcpu_get_state(cpu-&gt;cpu_index)-&gt;enabled &amp;&amp;
+        cpu-&gt;throttle_us_per_full) {
+        trace_dirtylimit_vcpu_execute(cpu-&gt;cpu_index,
+                cpu-&gt;throttle_us_per_full);
+        usleep(cpu-&gt;throttle_us_per_full);
+    }
+}
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 9c88887..22606dc 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -31,3 +31,10 @@ runstate_set(int current_state, const char *current_state_str, int new_state, co
 system_wakeup_request(int reason) &quot;reason=%d&quot;
 qemu_system_shutdown_request(int reason) &quot;reason=%d&quot;
 qemu_system_powerdown_request(void) &quot;&quot;
+
+#dirtylimit.c
+dirtylimit_state_initialize(int max_cpus) &quot;dirtylimit state initialize: max cpus %d&quot;
+dirtylimit_state_finalize(void)
+dirtylimit_throttle_pct(int cpu_index, uint64_t pct, int64_t time_us) &quot;CPU[%d] throttle percent: %&quot; PRIu64 &quot;, throttle adjust time %&quot;PRIi64 &quot; us&quot;
+dirtylimit_set_vcpu(int cpu_index, uint64_t quota) &quot;CPU[%d] set dirty page rate limit %&quot;PRIu64
+dirtylimit_vcpu_execute(int cpu_index, int64_t sleep_time_us) &quot;CPU[%d] sleep %&quot;PRIi64 &quot; us&quot;
</pre>
    </blockquote>
  </body>
</html>

--------------TtY0ueVX6xjiCTvuY0pfryTP--

