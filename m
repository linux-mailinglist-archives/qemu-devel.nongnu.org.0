Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD062620E64
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 12:16:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osMZq-0007Tz-JJ; Tue, 08 Nov 2022 06:15:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1osMZp-0007Tn-5T
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:15:33 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1osMZl-0003qm-MG
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:15:32 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A87GuZg003776; Tue, 8 Nov 2022 03:15:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=FoOE5F0OSTGtEBxXMkrtkJz3FjlQfnEautdNsUv8sUs=;
 b=LruWfMpy3XEJ54xkQFAc+Gwy/2DnEuY7eFMlEffMKr4u8Pc3g3R1rOXXzsZOPqpUOThp
 6rlYWDqTFyINiRAC8pWUrib8PFUv2DvuLwQnMsMMXd+O6M1qq0UPZ8R5jtor2YNUCVfR
 Nhrhm2+PbJiac3ytsk60WkX/HrGZwO/C+xuhopWeDEiky061AaLC3HoVPZxNBaguhndn
 5DARU7fFamdfxTiFF7Bjh5Z1t5wwZ6b9mz41SRoMca7wU6sqpG3zm4bmuZC4GUaoUOtc
 7JRMBMC6NKmJX5Vceb56dGRt9pLLJF6q87HDJy2hY4T5cTS1bszfp2zY5O/FzGgJgXDm RQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kqah9sasm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Nov 2022 03:15:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVqKgFufI2pa/dTZhfZDgptZr2AOsZe+X5cYjYHeYvsj0mCFyirY8KeC4cYpN27Y/Bs5o8IZ6gc1+VlvplOz59cz0w9Q0vntmvcCFTTn6b7o++rrvlGsLbGyFKV8SCnNwrH1vbN2WP1fN3DfNbqUcVhymsjc1wg2O98aVs66slC08f6xcw841st6idvLrg1TXNu+o7TWfEx49CSC7tNE/6XZpv1yl3JGdgovV4GzV+QbWC2fhN2p3W6k0tjLK82h+V/DyXJ6Dbutd8QrdN8d4TKUynjwAlLCT19bT77OU3J8mX0Du/gSOv0rd7KDzkMp6oRBNn3fvDiyBPY/xASRtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoOE5F0OSTGtEBxXMkrtkJz3FjlQfnEautdNsUv8sUs=;
 b=NyAy+PrqbwBLmafGgbs9f9O676lyBP0IHTxiqBFzm2cibJUzC9do727leXJYPeqWcU1zBckCfs35menAV+LGt00ue1u8I4+CUTn/XnKsy0veLlqLudh3jBAkF5KgwK+OCPD/xtOm1l05KGWd2ujp5tLFU8/PVMO6wvrNJdWRkQYZBO3XV2GR0LsJDzgz8IdRWaKmjwuBuZW5gv+VEF1mKfdeCOD8FZwAZ/ei15zhiyhbt/smaIPFdw1sb3e8DmusP9Uhq745BUw8ZGuJEMCdmv9Rw4s4WTRYr67kb5Nfn4Smt7kUE5JQ/xunfafXtzumOgeR8BHsRA4PHbAjlWZr2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoOE5F0OSTGtEBxXMkrtkJz3FjlQfnEautdNsUv8sUs=;
 b=68x1GQSymNvH2xeE5OkO9wEVZeP3GfErFZhvr98Fu54o2A8YqadJNbC3b6TpzmsHvf546VEqOdTKtIlhoAIskPkom/cUNmYjSL2TSiiAqh1KoD/e3Dy4E6FeRTSxIrRMrLM0uAhi93NprVwux1E1OY1tarZ49sjHx/j8SUZgJQpKRJWu2MW4hShBaxIyVJTZHCpd6e+dtOoZdXE4awK4vzPJ7yhmjWQd2QIzPFuMHutOJnQEEjSZl2a03U11W0k/MGrXEztTa2GB0SkCufVKZIpZfhlnLAA6ee7m4iFZTvSTIhXl0MbLuRGQC5bK2zDFXl2MlIxGJV9UKP54PCwOKg==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by PH0PR02MB7224.namprd02.prod.outlook.com (2603:10b6:510:17::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 11:15:22 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::6900:90d6:f4c2:8509]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::6900:90d6:f4c2:8509%7]) with mapi id 15.20.5791.027; Tue, 8 Nov 2022
 11:15:22 +0000
Message-ID: <674d2d8a-2471-4b33-f316-1f3ef811dbfb@nutanix.com>
Date: Tue, 8 Nov 2022 16:45:10 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v2] migration: check magic value for deciding the mapping
 of channels
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com
References: <20221107165159.49534-1-manish.mishra@nutanix.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <20221107165159.49534-1-manish.mishra@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|PH0PR02MB7224:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b15d4f8-8ac7-40f6-c95d-08dac17a86bf
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0gu581Bwi0DJXUnQoJ+QzcpxIKiQUyDXJvkmv7EacXiOgBb9wQ56OfAXeChT3kJhMGhCcYYQ2NcU4mEgfT5zYb34zGVJ8G46cSWHLlbHviwHlsOJOLkVaCVQuHCPEZpm+cu41E9ElMS+ZgOUJ2c9r0j42+rulgDQG/jYAUwf+zUMceBnrxsvb9FC6jJ8BAU1TuoHrbblgjQIcQTX/eSZcoWw7sAOAr5xLWam1Y8B4rS+NeicNfjc9vjSNzYdMmKq7+VvQcUy5822b8xAHP0/uBD28ps9YpKUy0lKFxGIVQLxdgFD70I5yfDn3OfSwzZ6OBQUO8tCNB/FnJS+fiNrOSEoCZqFgxH4vl8qNl8P2+jiM5CECUZbHivAo/1BOMOmc0pf0bwpldE4jAYs65qzfIuPXOvTPHY2/K/2hOmq23OVsBYtrSdVzdakjZmAgTDIXXrdjo7ZjgnHpYMiuOviGzfNMg3iiozV8Ga3/lgyx1GJCykfKGuEoxsSYfYwSZfCm9Lr1/IaRYSMdIj6MUn4Em7eQv5JHoBOoqG1aL81v8W4dkq4Bc1hpL87m+TZIavxkww28bmeftftYs7HGw+PByQJQVAHEkFCf8G4odYSQNfRaBTe9E6C1XR26uB1s5ZvBn0Eb6hGRDvcgFDeQLNmPAfq2j5/t8lmdUbxcCKb1Mqc/ShmNzJ9DTJoI/g/GvMebH8/mDqN4K95zCm+65szTKdQAQyIgdtxIvpvRcYC2edTy+TgI2c/egmlczPt65sdVoixXhawfM6fD6DyCCFp37Qtn5xd1GjvZyIvFvfqjlY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199015)(31696002)(38100700002)(36756003)(2906002)(30864003)(478600001)(6486002)(53546011)(8676002)(55236004)(6506007)(6666004)(4326008)(8936002)(6916009)(66946007)(66476007)(41300700001)(5660300002)(316002)(6512007)(86362001)(2616005)(66556008)(186003)(83380400001)(26005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGh0ZWhLK3R2N043ZXFhVUJLNzR3cGVJdXFSbVRtZWN2ejRaQmRsK00yNlRn?=
 =?utf-8?B?eHpwNkpUbFkxSUFQeUlVcEV6aVo1RUtaaGhkb045Sis4Qmlibzl2VXFvOXlo?=
 =?utf-8?B?SGJyQUprOXU4T1FBcytyazF6YWZCYmhyWDEvWS83NUFqdUY1eklwbEhtWTNw?=
 =?utf-8?B?a2RrOTFROWtjdGZaWmFYaDAyWjVnM25kSUFCdHR5THo3ejluSnl4cTNWRHVa?=
 =?utf-8?B?TFczNzNMcjh4WWUzdHhLbkdDN0xUZlV4cnpQVTJzYUNrTHlJYk5YZ0ZTY2Jj?=
 =?utf-8?B?bjZmeDZWSSszdEV2T3ZUOFl4VkRSeFNDbS9QcFc5bXJsOEV1WXVLL1VQSGxp?=
 =?utf-8?B?QUJJWlNaWnhrTXRvMFgvd0Exckl5Tnh3bHZxNkJlWVlETlR5YkY3NEl4S0hn?=
 =?utf-8?B?NVZKT0gxTzZlcWlIb2VLd0w5TjZqWW1mT1NFdHBWcERZS1p3aWMzTDluMEhj?=
 =?utf-8?B?dU16b0l4Z0ZteWgxV1piejhraFpPTmY1djNBMXhvZG5tWGI1RTczYVZlb05y?=
 =?utf-8?B?V2laL2hZcTlFd2pQRWtsam90SmZzdGJySWlCZmJ5Y1NTaDg4QnV0MnQrcWhw?=
 =?utf-8?B?K1JhUk81YldsNldRRUFyeUpiSTJuVFhINlZvenVmbGw4S05DVlA3dDhwQ0ZI?=
 =?utf-8?B?L2EyWE1ESERVZW1YWkNoWjBWQzd3dFIxTGIwV2R1YzM2NmN0alRhVkIrTnhD?=
 =?utf-8?B?dTBjRkRIdVVyVFdib1RsYWU0WFF5L3cySXFBNWViSWJKNDEyd3BmNDdkVlhx?=
 =?utf-8?B?MmUyZFJ0bXh1bHkrUHFyaGo4YXU2Z0gxbTJKc3NPa2IrSUk4VzFvN3J2NkJs?=
 =?utf-8?B?N29BOFdmRXV1dDlwVm84T3BnN3dGY0hidCs4UVBxaFZCZzQzZXIyMkR5ODRZ?=
 =?utf-8?B?YVlLNnczeS9NdGQ5QjBMb2NaYkZldzlmMTdhdUtRRTlLMXczOWNOc3NaL1Qv?=
 =?utf-8?B?ODBGazN0ZVJGeEZkN3ZMazB4cUZXTHFZZVQ2MnM3NXBRZHMwZzV0U2VEelJz?=
 =?utf-8?B?UTk3MExQWGVVQVJISDY4MEdNUTd3WVN2ditzL1hGcHlvamJYMEVhZ1YyWERO?=
 =?utf-8?B?RWhzcmpmT1JJTzdWeVBLejNJRHBhZ0hRWmIwb251OFpwNE9IN2RyL0Z1Z00x?=
 =?utf-8?B?YVEyOW1qRzVsZGxuTUFLMVc4Z05HcmJMbjVxMkdvU2lPOFJEOUZWbkozWG0r?=
 =?utf-8?B?OWtIcndpS29ENFBjNU5veGt4T1BDckt4RHhPcXJlRDdaWUJOcVNnSjF6Q1B6?=
 =?utf-8?B?QXhqOHRIMEpGYXFYK0Uybi83SHpnelAvckNXM1B6OFlmYlYvR0pPRmlmMmNY?=
 =?utf-8?B?ZldjZ0dWUGJOL3NHSFFvMWFiYi9SOEZURkV2TGdQOVVDT3pWSHdvVVRibnNT?=
 =?utf-8?B?U1VPYytUYmIrY2xkaGdhc25UQ2hQR0lIY3Z1Wm5CR1cxeEhBcFgwa2pmRHZ3?=
 =?utf-8?B?bVVaVFk1UnRDUURBUnNKOExtalVKR1VpakVqMWV2RWtVeDVNaC9vRHQrb3Rv?=
 =?utf-8?B?OEM3VVROaGEyZWU1K1J6RzF0bGEvaS92M3g2cytXQ3Noak4yeFVkejZudE42?=
 =?utf-8?B?QW9pTUQyTG1uUlFVWllpRjhEWEJNbnpJaEFuVXNNQjJ2ZlRoaCs2aTJObG4x?=
 =?utf-8?B?SWpmK1NoVUpkZm5HbXY5STYrQUx4RmdsSFE0TFdjakhwYkt2empINGhnVFU3?=
 =?utf-8?B?TkdpbnhXdWs0Yysyd2QrY050emlVSUxNeU1YRnlDRlhqUitnZmxWSlppUENH?=
 =?utf-8?B?TXhJYzBOcCtLdjF0bDFXYWRCL2l4RDVCdlcvWWxhOUFRSFpOblVGVlhNUm9J?=
 =?utf-8?B?Q25kUEJmUElxaTJkbzlUR1ZXMXN2SmpjTGpzQ0ppTStEWGNiTDRTVW5sRDlW?=
 =?utf-8?B?UjI3eFFqTGZWMnE4RFpreis1N255Y3FvdTRJa3p6NTlVRzZpanUzMjc0SXZt?=
 =?utf-8?B?Q3ZHdHNVa29NY3BRQU1iN3h2SHdBYnRreVYvRDR4Q3p2MG5qclQ3eCtDazd3?=
 =?utf-8?B?aGxWdVJWMWFLV3d2OEtCYjlJeVJvZ3ZaS1VlQSsxSjR5eDRWNTdxS09NbmU4?=
 =?utf-8?B?c21JUW5jUFZTWFo2YzgvQzBPWkRncE9RYjcyV25sVW9DWlVGa1lYdVZkNFQ0?=
 =?utf-8?B?c3U4NWlJYklib3pkd1BvUW92aUFleW9McGl6enVNNVZ0c2pSUVVzSlhWWkdF?=
 =?utf-8?B?UkE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b15d4f8-8ac7-40f6-c95d-08dac17a86bf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 11:15:22.1138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IluxnFMJg4UgKuwQKgaChpSdL2aOzuhpXZVtsxRzmI/ub/QdIlwo9Wzoxt9LZk37pyfB/q1y/QE0RiweSTxM9F5CVv8fxoZ2L0uVhTgZA+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7224
X-Proofpoint-GUID: 3Zm9IkR8DHzhsxVmwefjCLuYntFIfKmS
X-Proofpoint-ORIG-GUID: 3Zm9IkR8DHzhsxVmwefjCLuYntFIfKmS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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


On 07/11/22 10:21 pm, manish.mishra wrote:
> Current logic assumes that channel connections on the destination side are
> always established in the same order as the source and the first one will
> always be the main channel followed by the multifid or post-copy
> preemption channel. This may not be always true, as even if a channel has a
> connection established on the source side it can be in the pending state on
> the destination side and a newer connection can be established first.
> Basically causing out of order mapping of channels on the destination side.
> Currently, all channels except post-copy preempt send a magic number, this
> patch uses that magic number to decide the type of channel. This logic is
> applicable only for precopy(multifd) live migration, as mentioned, the
> post-copy preempt channel does not send any magic number. Also, tls live
> migrations already does tls handshake before creating other channels, so
> this issue is not possible with tls, hence this logic is avoided for tls
> live migrations. This patch uses MSG_PEEK to check the magic number of
> channels so that current data/control stream management remains
> un-effected.
>
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
>
> v2:
>    TLS does not support MSG_PEEK, so V1 was broken for tls live
>    migrations. For tls live migration, while initializing main channel
>    tls handshake is done before we can create other channels, so this
>    issue is not possible for tls live migrations. In V2 added a check
>    to avoid checking magic number for tls live migration and fallback
>    to older method to decide mapping of channels on destination side.

Hi Daniel, This is what i concluded from discussion on V1, if this is not what you expected, please let me know, we can continue discussion on V1 thread.

Thanks

Manish Mishra


> ---
>   include/io/channel.h     | 25 +++++++++++++++++++++++
>   io/channel-socket.c      | 27 ++++++++++++++++++++++++
>   io/channel.c             | 39 +++++++++++++++++++++++++++++++++++
>   migration/migration.c    | 44 +++++++++++++++++++++++++++++-----------
>   migration/multifd.c      | 12 ++++-------
>   migration/multifd.h      |  2 +-
>   migration/postcopy-ram.c |  5 +----
>   migration/postcopy-ram.h |  2 +-
>   8 files changed, 130 insertions(+), 26 deletions(-)
>
> diff --git a/include/io/channel.h b/include/io/channel.h
> index c680ee7480..74177aeeea 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -115,6 +115,10 @@ struct QIOChannelClass {
>                           int **fds,
>                           size_t *nfds,
>                           Error **errp);
> +    ssize_t (*io_read_peek)(QIOChannel *ioc,
> +                            void *buf,
> +                            size_t nbytes,
> +                            Error **errp);
>       int (*io_close)(QIOChannel *ioc,
>                       Error **errp);
>       GSource * (*io_create_watch)(QIOChannel *ioc,
> @@ -475,6 +479,27 @@ int qio_channel_write_all(QIOChannel *ioc,
>                             size_t buflen,
>                             Error **errp);
>   
> +/**
> + * qio_channel_read_peek_all:
> + * @ioc: the channel object
> + * @buf: the memory region to read in data
> + * @nbytes: the number of bytes to read
> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Read given @nbytes data from peek of channel into
> + * memory region @buf.
> + *
> + * The function will be blocked until read size is
> + * equal to requested size.
> + *
> + * Returns: 1 if all bytes were read, 0 if end-of-file
> + *          occurs without data, or -1 on error
> + */
> +int qio_channel_read_peek_all(QIOChannel *ioc,
> +                              void* buf,
> +                              size_t nbytes,
> +                              Error **errp);
> +
>   /**
>    * qio_channel_set_blocking:
>    * @ioc: the channel object
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index b76dca9cc1..b99f5dfda6 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -705,6 +705,32 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>   }
>   #endif /* WIN32 */
>   
> +static ssize_t qio_channel_socket_read_peek(QIOChannel *ioc,
> +                                            void *buf,
> +                                            size_t nbytes,
> +                                            Error **errp)
> +{
> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> +    ssize_t bytes = 0;
> +
> +retry:
> +    bytes = recv(sioc->fd, buf, nbytes, MSG_PEEK);
> +
> +    if (bytes < 0) {
> +        if (errno == EINTR) {
> +            goto retry;
> +        }
> +        if (errno == EAGAIN) {
> +            return QIO_CHANNEL_ERR_BLOCK;
> +        }
> +
> +        error_setg_errno(errp, errno,
> +                         "Unable to read from peek of socket");
> +        return -1;
> +    }
> +
> +    return bytes;
> +}
>   
>   #ifdef QEMU_MSG_ZEROCOPY
>   static int qio_channel_socket_flush(QIOChannel *ioc,
> @@ -902,6 +928,7 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
>   
>       ioc_klass->io_writev = qio_channel_socket_writev;
>       ioc_klass->io_readv = qio_channel_socket_readv;
> +    ioc_klass->io_read_peek = qio_channel_socket_read_peek;
>       ioc_klass->io_set_blocking = qio_channel_socket_set_blocking;
>       ioc_klass->io_close = qio_channel_socket_close;
>       ioc_klass->io_shutdown = qio_channel_socket_shutdown;
> diff --git a/io/channel.c b/io/channel.c
> index 0640941ac5..a2d9b96f3f 100644
> --- a/io/channel.c
> +++ b/io/channel.c
> @@ -346,6 +346,45 @@ int qio_channel_write_all(QIOChannel *ioc,
>       return qio_channel_writev_all(ioc, &iov, 1, errp);
>   }
>   
> +int qio_channel_read_peek_all(QIOChannel *ioc,
> +                              void* buf,
> +                              size_t nbytes,
> +                              Error **errp)
> +{
> +   QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> +   ssize_t bytes = 0;
> +
> +   if (!klass->io_read_peek) {
> +       error_setg(errp, "Channel does not support read peek");
> +       return -1;
> +   }
> +
> +   while (bytes < nbytes) {
> +       bytes = klass->io_read_peek(ioc,
> +                                   buf,
> +                                   nbytes,
> +                                   errp);
> +
> +       if (bytes == QIO_CHANNEL_ERR_BLOCK) {
> +            if (qemu_in_coroutine()) {
> +                qio_channel_yield(ioc, G_IO_OUT);
> +            } else {
> +                qio_channel_wait(ioc, G_IO_OUT);
> +            }
> +            continue;
> +       }
> +       if (bytes == 0) {
> +           error_setg(errp,
> +                      "Unexpected end-of-file on channel");
> +           return 0;
> +       }
> +       if (bytes < 0) {
> +           return -1;
> +       }
> +   }
> +
> +   return 1;
> +}
>   
>   int qio_channel_set_blocking(QIOChannel *ioc,
>                                 bool enabled,
> diff --git a/migration/migration.c b/migration/migration.c
> index 739bb683f3..406a9e2f72 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -733,31 +733,51 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>   {
>       MigrationIncomingState *mis = migration_incoming_get_current();
>       Error *local_err = NULL;
> -    bool start_migration;
>       QEMUFile *f;
> +    bool default_channel = true;
> +    uint32_t channel_magic = 0;
> +    int ret = 0;
>   
> -    if (!mis->from_src_file) {
> -        /* The first connection (multifd may have multiple) */
> +    if (migrate_use_multifd() && !migration_in_postcopy() &&
> +        !migrate_use_tls()) {
> +        /*
> +         * With multiple channels, it is possible that we receive channels
> +         * out of order on destination side, causing incorrect mapping of
> +         * source channels on destination side. Check channel MAGIC to
> +         * decide type of channel. Please note this is best effort, postcopy
> +         * preempt channel does not send any magic number so avoid it for
> +         * postcopy live migration. Also tls live migration already does
> +         * tls handshake while initializing main channel so with tls this
> +         * issue is not possible.
> +         */
> +        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
> +                                        sizeof(channel_magic), &local_err);
> +
> +        if (ret != 1) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +
> +        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
> +    } else {
> +        default_channel = !mis->from_src_file;
> +    }
> +
> +    if (default_channel) {
>           f = qemu_file_new_input(ioc);
>   
>           if (!migration_incoming_setup(f, errp)) {
>               return;
>           }
> -
> -        /*
> -         * Common migration only needs one channel, so we can start
> -         * right now.  Some features need more than one channel, we wait.
> -         */
> -        start_migration = !migration_needs_multiple_sockets();
>       } else {
>           /* Multiple connections */
>           assert(migration_needs_multiple_sockets());
>           if (migrate_use_multifd()) {
> -            start_migration = multifd_recv_new_channel(ioc, &local_err);
> +            multifd_recv_new_channel(ioc, &local_err);
>           } else {
>               assert(migrate_postcopy_preempt());
>               f = qemu_file_new_input(ioc);
> -            start_migration = postcopy_preempt_new_channel(mis, f);
> +            postcopy_preempt_new_channel(mis, f);
>           }
>           if (local_err) {
>               error_propagate(errp, local_err);
> @@ -765,7 +785,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>           }
>       }
>   
> -    if (start_migration) {
> +    if (migration_has_all_channels()) {
>           /* If it's a recovery, we're done */
>           if (postcopy_try_recover()) {
>               return;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 586ddc9d65..be86a4d07f 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -1220,11 +1220,9 @@ bool multifd_recv_all_channels_created(void)
>   
>   /*
>    * Try to receive all multifd channels to get ready for the migration.
> - * - Return true and do not set @errp when correctly receiving all channels;
> - * - Return false and do not set @errp when correctly receiving the current one;
> - * - Return false and set @errp when failing to receive the current channel.
> + * Sets @errp when failing to receive the current channel.
>    */
> -bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
> +void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>   {
>       MultiFDRecvParams *p;
>       Error *local_err = NULL;
> @@ -1237,7 +1235,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>                                   "failed to receive packet"
>                                   " via multifd channel %d: ",
>                                   qatomic_read(&multifd_recv_state->count));
> -        return false;
> +        return;
>       }
>       trace_multifd_recv_new_channel(id);
>   
> @@ -1247,7 +1245,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>                      id);
>           multifd_recv_terminate_threads(local_err);
>           error_propagate(errp, local_err);
> -        return false;
> +        return;
>       }
>       p->c = ioc;
>       object_ref(OBJECT(ioc));
> @@ -1258,6 +1256,4 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>       qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
>                          QEMU_THREAD_JOINABLE);
>       qatomic_inc(&multifd_recv_state->count);
> -    return qatomic_read(&multifd_recv_state->count) ==
> -           migrate_multifd_channels();
>   }
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 519f498643..913e4ba274 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -18,7 +18,7 @@ void multifd_save_cleanup(void);
>   int multifd_load_setup(Error **errp);
>   int multifd_load_cleanup(Error **errp);
>   bool multifd_recv_all_channels_created(void);
> -bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
> +void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
>   void multifd_recv_sync_main(void);
>   int multifd_send_sync_main(QEMUFile *f);
>   int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index b9a37ef255..f84f783ab4 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -1539,7 +1539,7 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
>       }
>   }
>   
> -bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
> +void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
>   {
>       /*
>        * The new loading channel has its own threads, so it needs to be
> @@ -1548,9 +1548,6 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
>       qemu_file_set_blocking(file, true);
>       mis->postcopy_qemufile_dst = file;
>       trace_postcopy_preempt_new_channel();
> -
> -    /* Start the migration immediately */
> -    return true;
>   }
>   
>   /*
> diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
> index 6147bf7d1d..25881c4127 100644
> --- a/migration/postcopy-ram.h
> +++ b/migration/postcopy-ram.h
> @@ -190,7 +190,7 @@ enum PostcopyChannels {
>       RAM_CHANNEL_MAX,
>   };
>   
> -bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
> +void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
>   int postcopy_preempt_setup(MigrationState *s, Error **errp);
>   int postcopy_preempt_wait_channel(MigrationState *s);
>   

