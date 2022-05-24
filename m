Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4492953320B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 21:54:55 +0200 (CEST)
Received: from localhost ([::1]:47580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntacH-0001iv-TO
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 15:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1ntab6-0000ro-NS
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:53:40 -0400
Received: from mail-bn8nam11on2078.outbound.protection.outlook.com
 ([40.107.236.78]:53856 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1ntab3-00083V-Jb
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:53:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lS7y+b/l7sbFv48+46001NKtQzIPI1xl7vjQB8OVyYQRup8UYDp8Y5TO/Gwjbs+uBJcifbOS1mn0zrVjsWetZMjrSa8SPDtJxCO3f5kFAt5nCc3qoWyPxmMXAdmKINFm4NNpH/7LP86Nsy3QIiG/17HKMvyYbjpKC1e+xDNxTnezyhf+U+zheo4FgOI+ZBqiiQ+1L36s2wXP2Fpjp4A/9VSlDNhxDgYHlsPnsX/f314zDBu4NIh7yJKev6wL+dHWgLx+jh9OM2ynHXkvIHFQlv9YBH2ATKv9rg8W9Q3zrtTUsCaPXWN0MFTlJD4oy2xrtM5J8acnokXyXz1uM6iJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPIb4WLWGzz7UJIrIA9a7zKUm9wKglRgZpKb6b/u/rY=;
 b=PE1NxAAHL3fQz3+EhFe0zV5/ILX0Ponv5EafnI0+v+75EhzW1HfAAUeJr9pz0ERLeE1d3tRQ+J8AqCjbWM0H8JBPLvLgDQyNVVQRxQyg2ejDnvXg/sUrbzqvFngPKVAlU5JUbO/zEy7fkxmXOITs0EB2l8rxRl8eVSP/9oJfSErMr2rQ5h2O7xxiaZ5mXSmiZVSIOndHcHFvMjkP/RFcSAxXsGcHX1MWcAxXjCfg7Gt0agZtri/IAf4AIHBRUxMF0LIfRSVbLvfKSpyM6YEtAjMoTM8iRuVtiTZZJYiQWbOGS2shjoDj5SfuDalsCe8CeQteAGPJzq8SB4aEhMRtqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPIb4WLWGzz7UJIrIA9a7zKUm9wKglRgZpKb6b/u/rY=;
 b=OHzpALamGms/TtaQIz4GV4Vn+DY8GdLgMoFw3sBlUGu/+o2+0YfPLjb7EfZk74uPFa1nfh4kJpydnT+9yNfRMa6UVfBaXFJ1+2UW5PzbqzfpWnRwfDh3ajLPkWRwL93H136DHSA3Tdojd7gcfFxRX6D5UOlHSV9fYFYGA1cO6H8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by BYAPR12MB2597.namprd12.prod.outlook.com (2603:10b6:a03:6e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Tue, 24 May
 2022 19:48:31 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d60:1982:13f4:24fa]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d60:1982:13f4:24fa%6]) with mapi id 15.20.5293.013; Tue, 24 May 2022
 19:48:31 +0000
Message-ID: <e4df1ba6-1a11-21e8-e344-f5e24fa49ce8@amd.com>
Date: Tue, 24 May 2022 14:48:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/2] i386: fixup number of logical CPUs when
 host-cache-info=on
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20220524151020.2541698-1-imammedo@redhat.com>
 <20220524171949.47508d9b@redhat.com>
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <20220524171949.47508d9b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0353.namprd03.prod.outlook.com
 (2603:10b6:610:11a::15) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fe0fac6-1602-428a-4e99-08da3dbe6126
X-MS-TrafficTypeDiagnostic: BYAPR12MB2597:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB25971D68E93B807412542B2B95D79@BYAPR12MB2597.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /RWtmG1wa/tlYYc08C1BpV0Lyk9z44YUFND6FA3hnCEeI1dWx6+r2kwGZLT1ZksUYSXhV8M3uGEn0gbfQhSg4nAH9JrzDPXq5vwSj2T/k4PVUjc1juMMMUKiJQBVkyxyvel/KvF/RME8AEy8A0FS6knZm5R+k7IpjUP4bqed54d0WQXSlB+Avhg5emMMoouoZA67W7JR2g1t2pBNBodqPFT9yAZIqY5WYXrmC6v06q5YR7PiOPkqoCgg8RS6BYi51GSPDDlhQi5DInsh+nV7zVQ6K6KOjz+RHMo3Vc3b/o+Agig1XnYCUzsg6l6mtDC545+Nt6GLX5IMfq5Cpyhl9+MLqVgrOCTweSp6JRZbRJ+9j81Ib8WKttJa7LDX2CipsdEoJ0JQqzjvi/UXDvBW0mS5qGBZIEkkkteeSCAio4pSJQMNZ9xfFq6EGa4/OrGH8JbUNyYc2D9veQctoCmUjgVK6JnLsr+BAbICN33b62E2eipF2yaH79+BueaZdGqqcVu/rrdBGmz92M10cjF8pe2xoxIdUeTyqhA0Eqmn7VDTlitp3wqQI7W25H9jrAbQXYjMra4+0pTUmH4cfMF1VEl470uRr3pJgrVvR2v/NDdxljk5YLPDqOcxNGoR7haZ8cGi7hK8E+v2RM0KdfuyMRQDufMS97b58QiZEQ4qr77DF3fL7b2IyRqrhHiD+5o5tOuKjo2ucUgcicUruINTTIa4/kz2VprnWGVReOrSmJ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(186003)(83380400001)(316002)(66946007)(66476007)(8676002)(66556008)(6512007)(26005)(5660300002)(8936002)(6506007)(6486002)(508600001)(53546011)(31696002)(86362001)(38100700002)(2906002)(31686004)(36756003)(3450700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlVWanU5RzUrSFRaTWtORVB3QTgzWEp0MFFSSHljMVVwcVlsWjdDaCtVMXJO?=
 =?utf-8?B?VzNuckRyUnJJMER3dGhlUk9wS2lZMXE5ZHd2Qm5Ybkpsc2cvdnZJUmNkQ2hq?=
 =?utf-8?B?WTFnVE1SMHB2RjJPSHprRWVxeHh6YUM4Nkt4TXkzelQ0dXZ0TVhka2w5RWly?=
 =?utf-8?B?QnRsZEJZSHhCYzZJK0VmQVFlOE4xSUpuZVpSbHBReVRVUlNqbzV5RkttZlJY?=
 =?utf-8?B?UnlTNklyT0p6YVZFOFp1MnlZVGZwbHdNdVk3Y1c5V0tWdTNoU0VZQm9UdDNF?=
 =?utf-8?B?MnlUQ2IrUHVxWllXZVkwbWtTV2dreGVrbHJUZDF1dUZ1a3RxUmxFWXdYN0FD?=
 =?utf-8?B?dEFaS1FUVmpYcmtNTVBOaHlwYnZsRUJBK1JYNkpBQ3FRQ1F1cllHWUw3QXdD?=
 =?utf-8?B?ekFEWHBIODNpOEZOeHVaOHIwS2lDTmlFZFBGNjVEcmovbHpwNGRnTzhSSzBy?=
 =?utf-8?B?WkZZZkxsMWFoRklPR0tYNWh2WEdRcmh0bzYyeE5wY3NadXFLNm1nUEF4YU56?=
 =?utf-8?B?aUE4T0w5OU9hVndBajZPRkJidEE2NmNvOHF1a0FWTG44cHZVbnkvbUV4aTQ4?=
 =?utf-8?B?cE9BcmVhU1cxcFZreW45TU5xWjNpVDkvek5vUDlMeWl2SEZVK3FudG1nS0xP?=
 =?utf-8?B?WXhxdFdyWEdxeW1YaC94dlI4dW94Tkt5dTRaUkUyMWs2V3BxVjI5OVVzWU5a?=
 =?utf-8?B?NEZZSkU4dWJGS3prRkUyYkE5TUJEK01VcGpUMUN6cFk3QVpuQkxmNk9FSUp5?=
 =?utf-8?B?YjZkMUtIMTAwUTBpOEVRZ1VSSUVOYlVSWTVNaWh0U1gyK1JEMklBTmpjK1RR?=
 =?utf-8?B?VHhHcDVQK1A2emlkTGU5V1M1VC9FZ1A4c1FOdyt5RXJNWGJyd2VEODNrN2x0?=
 =?utf-8?B?N25NQTFwMEcvMCt2MDZuRGJrNTBhSWV1OUdEUmpESER6V3ozMnlFWUx1STA1?=
 =?utf-8?B?VGFUUFphMVJMTFhvdDRmRlFCQm5EOFJ4VFh5MjJ5K0hRL09iUnlxb3E2MkRx?=
 =?utf-8?B?ZmY0Z25yb3BxZ3dLU3diU01zWE1xNHZVVXRMQzFpTzVOcjNNUG1YUVB1TThH?=
 =?utf-8?B?a0hDMlFPdVZCWTIwTFRTeWYvSUlRRFFxK3RwdmE2ZzdRZWluckRTZjB1MUxL?=
 =?utf-8?B?elJkUDF4V3FzeStDTDJxNEhyUFVkMjZLUFhpVHN2K2o4M1pjRmlmYXowUk5Q?=
 =?utf-8?B?STJMdmgzbzd4NGJNMmUwdEhXRk1kNmIvWnU4NUNjcGs2OTZZTTdYL0dFaGp1?=
 =?utf-8?B?eG5JbWFCSWN3NVNUN2Qzak5IRVhiVEowSlpRYmYzNzB5S0pFUVlGTEF2K0xz?=
 =?utf-8?B?OUh4VmJ4dEErN2hUamxYN292QWRWZ2xTOEJ1U3gvenMxL3lWUUhtTTVJMlI0?=
 =?utf-8?B?cXR5WkhPRjFSREFwTXhaOFhYd3RwcWV2UnJQS1NuVE55YVlYTHZEdUZXbUJh?=
 =?utf-8?B?QWN5TkdtSVBEWE9Jdlp5a0hTajNodUdReVJWenRCU3hZbzZrTy9xK2RZL3hm?=
 =?utf-8?B?cFdaZ1BBSnZIemxPdkRXYSt0YzVIaUhDYWhSelUvYk1IV3YvbFArUmxZbjdx?=
 =?utf-8?B?RzRPRndReUVrRllMRGk0ZjU2V0lMM2Y0YW1wOHZ2TVl3akt5WGRzYmU3SXB4?=
 =?utf-8?B?c1ZhejF5R1M3dVVuMk9ZU29GTlIzY2JwN0tFNktMT1VCazc1cVpvbmR0VzJD?=
 =?utf-8?B?cGU3SkNUOENWTlQxelJsb1o4NXVEWTRzZjhSU2FlQXJZUVJKNVFFME5BWG56?=
 =?utf-8?B?aDdUQm0vZm9ENUhwblZqZlYxMUJhUmFFWm5pZlFBWlViVjNheWc3K01WdVZO?=
 =?utf-8?B?SkRHdHNCczgzbGFtd3RIQWlIaU90alpPOUp1UXdnWXJ5aElvZEsxVVBnR0dK?=
 =?utf-8?B?N0NTOHRsRzV4SW1HWEpLaUNzSVg3bUtGV1VCTjRuR3prSHRidjZkUkZRVTh3?=
 =?utf-8?B?TUhHd2wybisxaWsxM1Z4azBEdWhxbUlwM01hcDFpNUgwaWg1eUhuV1dZT2VI?=
 =?utf-8?B?bUFzcXZOT0gxM0hCS2NYYnBIY3M5aDkyMzJRazRwcnBoak5LbkRsUlR0R3Q3?=
 =?utf-8?B?d1MwOUphaHpXQkFQbDk4T2RDL3BWVktSMWtQMTlHWWZtYmRFTFhrRXpnY0Qv?=
 =?utf-8?B?TEEyYVdySXQyYjhBSWlaZWFCSml6dEQxQnlFVW1kRno5MWdQdEpTK0w1MExT?=
 =?utf-8?B?blhkUjVGelFwQ0tDY1FtN3pjWWdaWWxYT3hYc1FGQXJqZG9EZmFVRXRpa2M5?=
 =?utf-8?B?MG16TlNwMzlveTU3NFdEdVNDZ0Y0S1FwMmozZ3pJQjFYN1BrcGJIUUZkdDN3?=
 =?utf-8?Q?3zxgREAYsCadtWGtbA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe0fac6-1602-428a-4e99-08da3dbe6126
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 19:48:31.2139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFOMHNqkVUMsQVy/6Gkz9Oj/2qvfxmDHWYCZrjRG6qyz8FglNl3DPCC2nA4JqGDS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2597
Received-SPF: softfail client-ip=40.107.236.78;
 envelope-from=Babu.Moger@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: babu.moger@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 5/24/22 10:19, Igor Mammedov wrote:
> On Tue, 24 May 2022 11:10:18 -0400
> Igor Mammedov <imammedo@redhat.com> wrote:
>
> CCing AMD folks as that might be of interest to them

I am trying to recreate the bug on my AMD system here.. Seeing this message..

qemu-system-x86_64: -numa node,nodeid=0,memdev=ram-node0: memdev=ram-node0
is ambiguous

Here is my command line..

#qemu-system-x86_64 -name rhel8 -m 4096 -hda vdisk.qcow2 -enable-kvm -net
nic  -nographic -machine q35,accel=kvm -cpu
host,host-cache-info=on,l3-cache=off -smp
20,sockets=2,dies=1,cores=10,threads=1 -numa
node,nodeid=0,memdev=ram-node0 -numa node,nodeid=1,memdev=ram-node1 -numa
cpu,socket-id=0,node-id=0 -numa cpu,socket-id=1,node-id=1

Am I missing something?


>
>> Igor Mammedov (2):
>>   x86: cpu: make sure number of addressable IDs for processor cores
>>     meets the spec
>>   x86: cpu: fixup number of addressable IDs for logical processors
>>     sharing cache
>>
>>  target/i386/cpu.c | 20 ++++++++++++++++----
>>  1 file changed, 16 insertions(+), 4 deletions(-)
>>
-- 
Thanks
Babu Moger


