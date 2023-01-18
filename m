Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B0167130A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 06:15:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI0mG-0002W5-1u; Wed, 18 Jan 2023 00:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pI0m4-0002Rr-6c
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 00:14:12 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pI0m0-0003eR-Eq
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 00:14:11 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30I0JA5G020876; Tue, 17 Jan 2023 21:14:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=1cGAqqr1SdBSC2p41jl6AqMYlHjvCjk4gUPRl7vz7YA=;
 b=ibxgzVtnuP1n9S86G+qw5KcAModZw6mylnYkj/A+B7D6tBs4c/W3ffjNif6dCcruePof
 pduJjdVjnlcpIsOj6C3tnV1E3b0lqcxkby8KzWWSPKQKnnTX7LBzYzkEPcX8dCk9ip+v
 2duPK4NKPJNje5QxjdP0IskS+Dp2q72aFFldQg+DR+SGCEu1zn81QZY0Eqe6Os1fXwfO
 QkwCuE28spEFKhJpjREwIJIwzmt9ARZ+xQlazDqhXZraYvcLesenveUHEuz4pfHIRoK8
 tvkCfKuqmP8B0EW0K0TXfH4/J8HJUfJ2MQ7RY/AxJjG2E8IK1pbLaqrzSZogi5vYQ9VR WA== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3n3vbt16sf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 21:14:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVn9X6Wl8UfPWa9GWYhgWUVhIgzwMf1pud0eBfUzBo+bH7HMQpfeaRQrKQFzNwoqZKaqXjQYSj46e4KhS75B4eatGcxNcvQdRrkBTmtBGZ9g3bWB+O5YxhaubxyO3U2UnQPv7xExVgQKlCorBQJx7gkV9YzTs8Hk9jOyziEbr9ZBRNiSIeYDA8jfzam0PPCevy9JfvzjtOOMe5P231Tn0QbZTSDK3YYm9wEJ+daWQhYQpTjbJd/5SeYNZDYCP74Hy8VJEgOkbx+md9I43MlVWQbYhLANlneSEZg0TxdlLhcezUAPeJVHMSHyJGGmJdHV9gWXeVbY8gurZ9aoyG80nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cGAqqr1SdBSC2p41jl6AqMYlHjvCjk4gUPRl7vz7YA=;
 b=TAE8yC+B7KW/3/0GgouwwxHHKc98bT2jZV7Jz7M0mAQ04EDHTiTqXLikqMUTbRQWWsOcG0zya7Lt6gxknXW3N6ZubaHGsre4OJE6nZVqvNDom/tegFrfj+oSWndsvrbsufAFdH24fEMHA7yeBvx/PfWOT0sUuNci5/XYM3MmBFmRi1ATd8s+dOQAfD4G91nsTzuoKpDGC0pawTDsy2SGhTfT3jPiPSJgcjKym5k++CR05cVt9jIxQ7ciRnbR20UBA3SE5iJbNi/vGYlRgCMv9y0X/zx6IAhmfn2G2sbWbJLp61dGQKcnLRix5Xmj8WTsMV1W4ICXhiDH3bydcWnozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cGAqqr1SdBSC2p41jl6AqMYlHjvCjk4gUPRl7vz7YA=;
 b=cyLAKAlDPcj0z6PrQcDMfadObkUhkkz1fvZnt+ehjs46maptnQ+byCVG9/9moTmWEQ+B26DlEMC+mUFbRusGOBu9fcG6YYKPwrGYy1jsdKftZCSrjTny2ahrR0G+w6zxdA993umpsMOSLcB2bWOotxWv/TiEVBlZef5eGjjbh6Sg7LuBSgs9Mj8/Ed6eGvSrW4VfmKCi/YRXMVaaIbah7as5hBWAYYij4ML6RcTdWbJC6jfPJc6kqEpqZPYVboc467oFhBvZ2NCwSi82cz0Ue7PHDWjmWvMx6cVQD7l4ZgOQe3wBwvLLhOmtkFfxEvQytwhIWZQQIF++dAhzrmM+ug==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM8PR02MB8008.namprd02.prod.outlook.com (2603:10b6:8:19::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Wed, 18 Jan 2023 05:14:00 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%7]) with mapi id 15.20.5986.018; Wed, 18 Jan 2023
 05:14:00 +0000
Message-ID: <3ade3136-d6dc-f078-d065-e7f6d5f4266f@nutanix.com>
Date: Wed, 18 Jan 2023 10:43:45 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/5] migration: Updated QAPI format for 'migrate' qemu
 monitor command
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 Manish Mishra <manish.mishra@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
References: <20221226053329.157905-1-het.gala@nutanix.com>
 <20221226053329.157905-2-het.gala@nutanix.com> <Y7wfoGpM6iwzy8L1@redhat.com>
 <Y8Z7zoQVJGLf+uOm@work-vm>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y8Z7zoQVJGLf+uOm@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::11) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|DM8PR02MB8008:EE_
X-MS-Office365-Filtering-Correlation-Id: fc016e8a-be49-4f02-a8f3-08daf912ceab
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ATUXSfC/J4ofrc1ji79HUcvwBJw8WMnXeKbISEJkY2XswPRVZMMG+ojIQGucaW5Fa0U28aISGoD1oBGoBrb5yI/qtU74WsDZNDqXtnfy6dL0o0oUUig9kW0Xmq1Kg7VQFQ6SbSOZZNIbX7d2fXLOHLGcYDKL39l0k9gfLRtXfdH6VRwXHMZh/PSJLHi8gS+6+ksUV0D8LXQPwJuMRzJ14iU0SawsmJgEEcrbrgK7mFnzFG6PUkS5TlIl/B9dD54wpC0inPKHXQJO/eTt4el5jFTMaIccWb5x329pUD9srcS+GRY9C6xa7GR43j4oSQy2CIuPW2IbtKtbZgrDBpYEH4m9dGaJeMngXgBO749SV81vyGRYHuu/7NKqkTaYutw7SXwUXC6vA1kBPDMZ1dJJN2nqhi6rkUg/2JJ3NwTfb6rwY+keZOQPVJsfDfiRSnKWisfso0j3P5fFNNaK9Jvh9wWUa+Iu25QPA4EZtq8RpA4XnORaxqFCUihNmNCgA+0Q+nwma+Lb9iq1VQIdCVCeCpOLrwDfmFfdNeO4OPLCDVrdxWEiHTHBz9mLQ3ehONjtcL87kD2Q4yCGfi0eIusWLc0A/L020F+NOKlqGH4/y5NyFpFJFWIgZgJRVi+OHpkinUoLiyAnUBv1HlwFNdkrcRijgp/phA/vF1CwteeYVI7FEwsIIOQ6q7Dr3a6mUAlSl/CQp8SD33MH3bv8Y0epy5+0N2LZbqwuu+2gOmAGv2d9pVuRZZRmboN9edLOcvq6A5p6yQVMiUzz7Id0UhS+/06IpfgySpGsdjCvCOR52c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199015)(31686004)(86362001)(2906002)(44832011)(66946007)(66556008)(66476007)(5660300002)(8936002)(31696002)(38100700002)(38350700002)(316002)(54906003)(110136005)(107886003)(6666004)(52116002)(53546011)(966005)(6486002)(6506007)(478600001)(36756003)(41300700001)(8676002)(4326008)(26005)(186003)(6512007)(83380400001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFVncS90RWtkWXhxRE9TS1ZEWXBSM0Exb1NlTGlMc1oyNUlzVytUWmVleWt6?=
 =?utf-8?B?b2xVZkVjS1l2YWVCTXVad3dFRStmR0dsQUdPckZ0d1ZZak90Qk1XSWF6Tm13?=
 =?utf-8?B?OVdPNDE5cE14VVhHdFprQVNwTjMwb2pJL2FReU1oVDRRVnZMQktKSHlMZ09k?=
 =?utf-8?B?RVQzN3VHWGZXY0dMWHZNQXYrd2FjTUdMOEZCbkJPWjJTQk54eENYaGZ1Ly82?=
 =?utf-8?B?aWU4Y2NCVkxTZi8vZlJPdy9WQ3JaK2c2d29NWFlFZmFvOTFReVpFdTdIQ0E2?=
 =?utf-8?B?ZGJTRkY1UDl6TTJJVGtlV3E0Q1BIdVVtdnZ2OEs0NlRSeHU2VlRQNGxlbkox?=
 =?utf-8?B?dEVIM3RvZEh1dC9zVktmdjVPV1RWZkFBK3VwbWFhUTZ5ckdkbGZNdmcvOHpn?=
 =?utf-8?B?cDJJaE5PWmhJVUZYdlpVS0dmTTgyY0pndDRmZzUxTkkyTEpBaVo4UEZEVU1O?=
 =?utf-8?B?WVFrN2RRYTI5Rld2TXNaNW9qMmtrYW5jTklHMDB5NytjOTVPNjQ2WFhqcDFW?=
 =?utf-8?B?dTkraWtubFlFazlVdHg0bWNFbEdrY050Nm1XQ2t3S2dHeGRvdG81UzVvK1l6?=
 =?utf-8?B?b2VrOC9uSUh6SzMzTzJyYlB3dXZJdVZjVzF3YnlQY3pYV0Z3bk1ZMERTcU13?=
 =?utf-8?B?S3JqOTdHMm5mWWVDMS9NekJYMldWTy9HNlBCcG5oYW43RHFwYUxvNVltcjVp?=
 =?utf-8?B?TFJOSis1RFg3NVhzNFBmOTEzMkFqZ2RJL1BVMnZQU1ZZSlh0Wk5STDNFMFFV?=
 =?utf-8?B?MkVCckp3MDNkYnJMci8xMFNoaUg1dEZkb3JOUWd3MG82TEQzS1NWUG1wb3lJ?=
 =?utf-8?B?bWRlenhDUmhGbko4OGVVZ2RLQ3dTOVVmMERrUkhRZkZQRG40Y2JKNytKVURT?=
 =?utf-8?B?WCszcnFaZW82MnNlbnVxTFhjcTl0VGxQMHI1cW5NMWxETU1LOTRtQnNxUXJ1?=
 =?utf-8?B?RnBBeVJhWDdHVVdXWDRNS1g4elVsQ1JqdURTZVc3MGN1MlhEQjVIZUx0Ni9h?=
 =?utf-8?B?UjMyVjBLcUlsVkZqaEw0OTVEUmZZZTFMK3Fxb0w0SFBMdTdEaU5SOUVMdzhB?=
 =?utf-8?B?Tm9HUHpMdFVmZnBRUHVYZFEwbDlSWm1YZTlzNTBmY3dqb3IzQnVGMDRyNURD?=
 =?utf-8?B?dzcwb1pzbmNPQmpITzFuVlZkMjJrUTZNbWMybDJ0WTkwRnVSM1pmSzRNeVFq?=
 =?utf-8?B?UUl6YnBhL3gyTVFJYTZRN1YzcG5IYzc2bjBkSlRBTWM5dlZITXF3SXd1VUdX?=
 =?utf-8?B?YnBEU0liN08vZW5OVlNtcWFVRHlWOGxBM1c3ZUFTV2JOMjNTVmNUYTA0OXMy?=
 =?utf-8?B?cGxnbnNnbHJuMEdxdDgzS3prTVJjcGQ3L1MwR3k1aTIvNis0YlFRNDYyL1Qw?=
 =?utf-8?B?WnA2SmNBamczZnFZaUZZTVp5Z1k0QUZYSVA3bGpFc0N0RUR0elhVWG1wdEV2?=
 =?utf-8?B?eG0wNG1RdW1wMjFUWkJUQzZuTG5DdzlaZWFuSG5ROGNGdWtwdHJoWFdaZnRl?=
 =?utf-8?B?bERXYkxxOHp2dDVnb3ZvQlRKbTFmYUxUWFVIeHc1UElvT0N0VDdpQ1J2Ukwz?=
 =?utf-8?B?R3FaNVIybGxsQWt2elJvSXUzMDFkbCtsaFVzcnZYL1FCejB6OS93WldPTm05?=
 =?utf-8?B?dkdPbm51Rmt1ZzA1bVc4ajJuZ1hsOWE1UGRzYlRGbnRlR05QQjB1TFlNemox?=
 =?utf-8?B?V29zbUF3d1habGRpMVR2Yk5aK29tMXhUbzZwc3MxYmF6NXhWa0NXMTlQMWdr?=
 =?utf-8?B?YnRCMFF2bndVcWZCSktXYU1xaHliczBURVBBQ3NLNUFMQ1pRL1RiWUpYTjln?=
 =?utf-8?B?anY4LytDMkdBQW9BdkIybThvcmhVL1lGQUFiZG4vYVJDTE9iUTY0YWx0bEpz?=
 =?utf-8?B?Y1l2cUtiTWFTa3RPalUrMm52cTFWeVlLbi96R29oQi93Zk0vUTRjVHI3NUw5?=
 =?utf-8?B?NWRKRmxCYnB3dDFsVjNiL1NlV3FWWkNzT3psZGUwUDNBUVZtNTRNSjA1eThN?=
 =?utf-8?B?UDA5THlGWHZ3MmpJVVdlOGh0MFk0UEFsa244dUwzaExnVEkzSVA2WGkxbk1J?=
 =?utf-8?B?WjU4dW13WkpOZ2JmS0IwZjUzYjJ2RFNPR2hpRElabTRNZitUS1dZN1BERDJy?=
 =?utf-8?Q?jSUYm/QRrXcCACg4nS/uhUa0O?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc016e8a-be49-4f02-a8f3-08daf912ceab
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 05:14:00.3117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PFkr5yEtaqLCC/83UvBsChTMZQrex44EQOyh9+810NXSCugtXf23fyubhT+Xgivk+rmWEjxcfGJyhJradFlCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8008
X-Proofpoint-GUID: K46cvCfGHCUeu_iaDXltwCO1YZbsg_xt
X-Proofpoint-ORIG-GUID: K46cvCfGHCUeu_iaDXltwCO1YZbsg_xt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_01,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 17/01/23 4:13 pm, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>> On Mon, Dec 26, 2022 at 05:33:25AM +0000, Het Gala wrote:
>>> From: Author Het Gala <het.gala@nutanix.com>
>>>
>>> Existing 'migrate' QAPI design enforces transport mechanism, ip address
>>> of destination interface and corresponding port number in the form
>>> of a unified string 'uri' parameter. This scheme does seem to have an issue
>>> in it, i.e. double-level encoding of URIs.
>>>
>>> The current patch maps existing QAPI design into a well-defined data
>>> structure - 'MigrateChannel' only from the design perspective. Please note that
>>> the existing 'uri' parameter is kept untouched for backward compatibility.
>>>
>>> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>>> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
>>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>> Currently for 'exec:cmdstr' the 'cmdstr' part is a shell command
>> that is passed
>>
>>    const char *argv[] = { "/bin/sh", "-c", command, NULL };
>>
>> I have a strong preference for making it possible to avoid use
>> of shell when spawning commands, since much of thue time it is
>> not required and has the potential to open up vulnerabilities.
>> It would be nice to be able to just take the full argv directly
>> IOW
>>
>>   { 'struct': 'MigrateExecAddr',
>>      'data' : {'argv': ['str'] } }
>>
>> If the caller wants to keep life safe and simple now they can
>> use
>>     ["/bin/nc", "-U", "/some/sock"]
>>
>> but if they still want to send it via shell, they can also do
>> so
>>
>>     ["/bin/sh", "-c", "...arbitrary shell script code...."]
>>
>>> +
>>> +##
>>> +# @MigrateRdmaAddr:
>>> +#
>>> +# Since 8.0
>>> +##
>>> +{ 'struct': 'MigrateRdmaAddr',
>>> +   'data' : {'rdma-str': 'str' } }
>> Loooking at the RDMA code it takes the str, and treats it
>> as an IPv4 address:
>>
>>
>>          addr = g_new(InetSocketAddress, 1);
>>          if (!inet_parse(addr, host_port, NULL)) {
>>              rdma->port = atoi(addr->port);
>>              rdma->host = g_strdup(addr->host);
>>              rdma->host_port = g_strdup(host_port);
>>          }
>>
>> so we really ought to accept an InetSocketAddress struct
>> directly
>>
>>   { 'struct': 'MigrateRdmaAddr',
>>      'data' : {'rdma-str': 'InetSocketAddress' } }
> I think that's probably the right thing to do; there is a native RDMA
> addressing scheme that people occasionally (once a decade or so)
> ask about but I don't think we've ever supported it.
>
> Dave
Yes Dave. I will be implementing Rdma in form of InetSocketAddress only 
in the upcoming patch.
>>> +
>>> +##
>>> +# @MigrateAddress:
>>> +#
>>> +# The options available for communication transport mechanisms for migration
>>> +#
>>> +# Since 8.0
>>> +##
>>> +{ 'union' : 'MigrateAddress',
>>> +  'base' : { 'transport' : 'MigrateTransport'},
>>> +  'discriminator' : 'transport',
>>> +  'data' : {
>>> +    'socket' : 'MigrateSocketAddr',
>>> +    'exec' : 'MigrateExecAddr',
>>> +    'rdma': 'MigrateRdmaAddr' } }
>>> +
>> With regards,
>> Daniel
>> -- 
>> |: https://urldefense.proofpoint.com/v2/url?u=https-3A__berrange.com&d=DwIDAw&c=s883GpUCOChKOHiocYtGcg&r=-qwZZzrw4EKSsq0BK7MBd3wW1WEpXmJeng3ZUT5uBCg&m=p8peRp4ioaDxoipqUtW15yQdVtCPnDBQv-1wk3r3y41SXWuI5JUUPMATMyMNDI4q&s=hukETUEPKU_01AyhkaMiQFWSRE1kUv84DdpSGvVjr1Q&e=       -o-    https://urldefense.proofpoint.com/v2/url?u=https-3A__www.flickr.com_photos_dberrange&d=DwIDAw&c=s883GpUCOChKOHiocYtGcg&r=-qwZZzrw4EKSsq0BK7MBd3wW1WEpXmJeng3ZUT5uBCg&m=p8peRp4ioaDxoipqUtW15yQdVtCPnDBQv-
>>
Regards,
Het Gala

