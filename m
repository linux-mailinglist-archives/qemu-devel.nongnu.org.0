Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF05630DE1
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 10:41:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owKLu-0003o3-Li; Sat, 19 Nov 2022 04:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1owKLn-0003mX-SD
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 04:41:28 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1owKLh-0008HW-EC
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 04:41:25 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AJ4ebsc016886; Sat, 19 Nov 2022 01:41:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=d12sskZVUxJRzTeH8seICK8opXoYiK069U+YU+Eutlc=;
 b=pQwfIEO31W7VBaC/PgqhVeJEUK6AthYnQ9MBzm77UR5v9qqdNqkxDdpNue9CyBfpsdkV
 r2zZhDfZOMb+8Os+RlsVZw88vuKTD+2EPnOTsne5ruVBQ5L83kpFJuriNe5v59t+FJni
 XdG9AzOMhLo6GjD8gnapcXRsoCpG4VFLVauTpXNEKJgM/ynLeAtQV3ZMd6nnewTG0Vwf
 r0BK0xKVGnGsmlwhNcca0fMmHNLlyUam/Q3MWewbNr/9f2n92UtzGn15+6TLMwW1C8Ll
 nxi3fb2dWXR/DmuPTWRKZTwHQbRUAtnReMwng4jEmiSR7CF7yDsIrKMHolDyz0ph1pQ7 PA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxraw0car-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Nov 2022 01:41:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obV5o9qCOCLP88PJxKilx7LtW125pXRb64JFBTlJfRmNFlbHkTYwpgb7IeROBTP0eHbg1YRIv1VE6Xed2WWlDsweMLBCA7DKC/9rQj9T3LO0hWVtAiqUnWQ+25ZpEjbbfO94EWAqeR+JgXqB2NjP8vW0hlUCRYTxzfNVgxn5tWQueeJn6pKab1DfT1u+WLN4+ghT9hW4uPN5B/t5R4+ipZRGoa8eFCy2Ty0N5+t8tuPrpAjGMI2TvNfBEUENQywTQwk+2KvoHeFNLAK1SPLNB2DC/2fF/3xqvl72+mcjFoZmOoPLSKpZIY7Rf//fmk0WAsybt++EQPF3/oPQt67NWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d12sskZVUxJRzTeH8seICK8opXoYiK069U+YU+Eutlc=;
 b=kD/LEEaNstqMoPS32udpjACq1F8IW/7FsN3lP7xYNb+rXpWx+3Yfs5CQa7D0Ej9eglM9dKDYgCnEv3aVxREXj1qPdT7O3RPAuhcoEX/U5shUkxYO724EoKyMWSO59Fg9RNyWKEvOubrjJcKhDxZEZhH/0Mk1Y5ciP7dxsr8saqJkKEIAmaSOjGAxEOl0M3Q6J9G7IMvvICgjWo1C9Q43BBrT3BejDh/qxJ2y30tCFXkqi1Q2ykwqLUlu6YrMp1ZTKQZRlxeSJ+Yupm+IKEPy5g69yIHczINdyRtp1FltWjVaqSX3XkODrrnuvLLjuOh5R5ri4FeWQqcu/2Y2gVbQpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d12sskZVUxJRzTeH8seICK8opXoYiK069U+YU+Eutlc=;
 b=hnNSnEXjpAeOXa/aVRDPxTsOhw8KF0xHLJS4s3ol127S/BkPkvTUDHEOhE9jBqkSt2FVV8aEwkbq+uXH75IOwFazORLAKVmeEZEynYhZcT5lJH0P38LdRoI+Zo8mvi6bL1KOZ/dbgdNKGEJyksBLW0FE/zZt1DvoqgYAMd/QlKKhdLQkbwW08Su2Hp60z73hs96YpK7ZrsVyKUXHdKd3eObLXWmUknp5C4PHhVfQcve+0hAfALuOpTZN0e+YsrmaETX7DdulKqXPqZ9Oubtx8lSziFPFWj9s386zWiscxb/nzh8oi5cDMhkkVkBcLNpqN0Rk4AvMYTln/gHKmnrXjQ==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by CO6PR02MB7763.namprd02.prod.outlook.com (2603:10b6:303:a2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Sat, 19 Nov
 2022 09:41:06 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5834.009; Sat, 19 Nov 2022
 09:41:06 +0000
Message-ID: <36c26e0c-cd1d-854f-f14d-e1935a84dae7@nutanix.com>
Date: Sat, 19 Nov 2022 15:10:37 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 1/2] io: Add support for MSG_PEEK for socket channel
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
References: <20221119093615.158072-1-manish.mishra@nutanix.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <20221119093615.158072-1-manish.mishra@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0164.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::34) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|CO6PR02MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: f4426d1d-09ea-41e9-5b8f-08daca122e1c
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P/Q+VRmfHuZYlXd885fMzT5TPk/DR8e4IWXGWJ+XKRGgE786qS3JP/TIDZZmEtErfSWNh0NZeNeUTlx1bRaXPHLPs3U6qRxXU4dxxQMYYpATWWEjYpT8f/CUKfhlXc3M9k0OG7xendjbbpZYNh+5suwCRcIFHvAQK2fab27e4ep/MOaSdAihIC0NK2vDvM7TlkuIR93qw7/rBn+dB4jmTy8QZOVnauRKfVEjlFnbsy46EIr1+XEQrbkbyVNNypftjSCDlmoPn/18TngrJUFtU41dzoQbLMVwpM7KkmyNteJqcEfMf/ERu82ac4LbTKgRr0BrSVZ4eFnmRU1zdpKJKykZzIfFWHYHJuAzkUwSjTFse/NA9RQxdWOnyVF42B3C3h6CqxwQOgZqnbjU0knW+lSIb/tWIDhaHYs8eV/Ca8ZptXYsLulwklyZDDhtpjb1kfb+CzMmHht8i+BgG7rQSgkOGQfxfePjCL8gvQpcGSfSynUUDNtI7iJDvNrbbEbpS5eS4LFX5OwvxoVY1C2KU3oLTOYFWTBtfwkksT0ztOaKAPQ2qHgee5JhjonA1IDxCFV98mGaUNwO6LGvl85hIIMARSrQcfATtEAMw1CRKW2awCZ7F8qNKxJKf9uXk4ehyxnxlMa9UCIXbbnSTxueglyTJurD9cqwzvkw87oJz9yMU79rtDY3dThrtcr30jjB9bj6CbPO2s8QwQmnoYYDJ57uE5riLjAtFTVeQ3jLZiI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199015)(6506007)(316002)(6666004)(53546011)(6916009)(6486002)(4326008)(66556008)(66476007)(66946007)(26005)(8676002)(6512007)(478600001)(31686004)(186003)(8936002)(5660300002)(2616005)(83380400001)(2906002)(41300700001)(36756003)(30864003)(31696002)(38100700002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0VUNVY1WjNTNnFCR05VZFFXcjBoaEpPalVyMU5YUDRLSGZ5TDNLT1NRR3BO?=
 =?utf-8?B?dW1ZdVNJMU5TT2tjbmFoZzFNbVJuVHlwL0s0bnJHRGZ2U2tEa0tJZVJ5a1BT?=
 =?utf-8?B?OXhRWUdreE5uQ1UrNTRmY042dzFtL3J0MzFhVlZ5WE1XUjk2Q21NYmU2QTF1?=
 =?utf-8?B?akxpbm1wbVRqSkNBVmc4dTgzcVd3R3FlR25GT09YN1A4NXVITCswWWpBb1E0?=
 =?utf-8?B?R1FseWpNTXN5bWM0cmM1enVsR3Q2dEpXVWoyT3pyNGtrWnd1TEI5VnpEM3JF?=
 =?utf-8?B?UTFlZU9nS2xaaUs0NnVVZHZrdnlnS1lzeDNERkdueXBiTlZOVjBBNUNRTmVQ?=
 =?utf-8?B?TjIxVkI4U0FxV2wwLzZiTXBXV0pDTXBsS3BhNDZQS2krdnVWSndnVW93bmVq?=
 =?utf-8?B?L1hTdVV4bVZ0QkduQ2s5YXlsZitnbkIzSmJ1VWxnYWIzTEF0eFVHSE9mclcr?=
 =?utf-8?B?dWxOMnVEUzZKZEVEd09aRVU0Z3NqbHFXRHIwamRqQlBseG9KVkxYUXVRSTh4?=
 =?utf-8?B?VlZWeGlOcG9TMUt2SFlhc3hHWlB6MklOb21aT0NwWkhtTGkwWFpGbk1HOXBK?=
 =?utf-8?B?NHJhaEU4bUNRTWlMMkF2alltRDNDekdabGNycW45NUczenU1ZkRmaHVIeUlW?=
 =?utf-8?B?K2tVeGRwd1FRYzBFM1FkSnY3VUxyMVAvTFBOOTU2dFJCL0Fyek04bmlYMFB6?=
 =?utf-8?B?Y3k2bENwNkg0UW91YXJSUGk0aWltalY4SHJRbDRTZG1FMkFFU3I3ak01aWY5?=
 =?utf-8?B?V1lsSjVIZDd5RmlPOTR0Yi9CRDRsekFDSDJaYjIrS1Vobmd2eE92Wkdsd3FP?=
 =?utf-8?B?QjdVNjZIZWh3NmhUYXVKNGVDNVZhUU9MZEdoZTZ2UHJ6ZXd2YVdKQ1U1Ujd2?=
 =?utf-8?B?MzNSeE9rQzY1d0hLeUtBNlI5MHBueHpTYkdMRVFnQ2x3aVhOcjUrNU9oTnZS?=
 =?utf-8?B?TW5Gb1V3WENESzZrMlA3WFppbWdsMFF0bzVUQkpjUkRWeWFKNERtOVA2d0dC?=
 =?utf-8?B?S3F5WTVvNVRheEpYc2lieUpLWVZBZ1NPVjJPNWludmE3SlIyVjhyVDRFU2NI?=
 =?utf-8?B?U0xxREZWUEFCWDVqZkhEcGszZmxwSlJmVEYzVTMwSERzN2dTdEVELzRhckV6?=
 =?utf-8?B?R0hyeCtQdjV5MjBQTmVBTFltZ0k2K2RPVHZpVDR2RkhaU0xHTVFFczgyOGsy?=
 =?utf-8?B?MzRIQ2d4dStBcEhGZ29oRjJyY0VMWHRpTjJnTWNSanEvK0VyZG5lWUVtQUlS?=
 =?utf-8?B?UVgxWjRmRnFKS3JHTHcxaDZsUlhrM3dmaVpwNkdaYjJGUGJTYWUxWDdWYklq?=
 =?utf-8?B?dkNsSkRVNXpNVTZYZGlScWUxOUs2WEtEVTZpRkNCQ0NHZzdzNjZoazhGY2xN?=
 =?utf-8?B?eXlDallBU09wSm12QlZUQnM0ZXExWmtpWUJoMUhKY3ZJWG5IVXlZaXpUaEcv?=
 =?utf-8?B?SmUvNVlTK3d5Nm9WSTlqaDdOZWZyVjRxeWMzdGM3WDVlazV0RUxLRFY3SFQ4?=
 =?utf-8?B?QXM0U1dSWm43VVZMRGdFK1VLZTNva1IyNHltMWZMeXRnbGVRc05VbFFjQlZY?=
 =?utf-8?B?UkE5Wm1BeW5jMnQ5TDlCRSttNTAreE1TZ3pyWms1ZUdCT2JwSzRaeFEwS2JC?=
 =?utf-8?B?WGR2RzZRKzlVY2hKclZWb0JBc1FrOWhKNGFmeWo0OFhWdjJ0RU9mOFVQTGFr?=
 =?utf-8?B?TGtBdWxvQnRiQUhndEJ4VkdiN245MWtaZDdiK2pOMTVOQkt0bXJ6YUx1OXRY?=
 =?utf-8?B?TkpjZHhuZ0lBdi83bHlwT1RWNURLUGdMcFBmc0dNdU5hL0pVYWxWY0lrNy9L?=
 =?utf-8?B?ZitIRit1RG05cEUvbldlalhTNDJ4ZlVvMXJYNEdmZ0ZDNWZ1NmYrNm1uZmtN?=
 =?utf-8?B?WURIWXJpZ282YW1JWVkwRDhFQ3U3VVlReEMxQjdVazlLOGNZd1hPQXFqWTB4?=
 =?utf-8?B?NUQxREJEZFJGcHZ4MUFRcjkwd251cDlla0JNdldqSDJQSEd4SlVzUWNOYUln?=
 =?utf-8?B?dmpuVmw1a21sOUF5SUpqTVN3cEpHQTF2ZjlaRWJLZTJzc3FMbDYwYlJkcEhJ?=
 =?utf-8?B?UjlMTjRQeTBUa3U5aG5qM3F5M011V0pzY1NWTUhoK3BiT3YwUWNKQktFSitV?=
 =?utf-8?B?SW5TbldublhzeDcxc1ZHbEcwZDlteTdHdnAzSFFZYTZtQWJteVJ0TzhIYUxm?=
 =?utf-8?B?Smc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4426d1d-09ea-41e9-5b8f-08daca122e1c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2022 09:41:06.1940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TZOrg7e9ofvRYm1oi8HnuRKn1ugkM0Jwkbn2A626Q8yJXo7bUhtrE9WveUBOwSqYPKDFbCZXXx/gv4p3dnHlFe29lMmN2cqkPkE71CUxPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7763
X-Proofpoint-ORIG-GUID: lsZ_H5WriyS5TvQGlEgTgceTPFgXFoF1
X-Proofpoint-GUID: lsZ_H5WriyS5TvQGlEgTgceTPFgXFoF1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_08,2022-11-18_01,2022-06-22_01
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


On 19/11/22 3:06 pm, manish.mishra wrote:
> MSG_PEEK reads from the peek of channel, The data is treated as
> unread and the next read shall still return this data. This
> support is currently added only for socket class. Extra parameter
> 'flags' is added to io_readv calls to pass extra read flags like
> MSG_PEEK.
> ---
>   chardev/char-socket.c               |  4 +-
>   include/io/channel.h                | 83 +++++++++++++++++++++++++++++
>   io/channel-buffer.c                 |  1 +
>   io/channel-command.c                |  1 +
>   io/channel-file.c                   |  1 +
>   io/channel-null.c                   |  1 +
>   io/channel-socket.c                 | 16 +++++-
>   io/channel-tls.c                    |  1 +
>   io/channel-websock.c                |  1 +
>   io/channel.c                        | 73 +++++++++++++++++++++++--
>   migration/channel-block.c           |  1 +
>   scsi/qemu-pr-helper.c               |  2 +-
>   tests/qtest/tpm-emu.c               |  2 +-
>   tests/unit/test-io-channel-socket.c |  1 +
>   util/vhost-user-server.c            |  2 +-
>   15 files changed, 179 insertions(+), 11 deletions(-)
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index 879564aa8a..5afce9a464 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -283,11 +283,11 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
>       if (qio_channel_has_feature(s->ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
>           ret = qio_channel_readv_full(s->ioc, &iov, 1,
>                                        &msgfds, &msgfds_num,
> -                                     NULL);
> +                                     0, NULL);
>       } else {
>           ret = qio_channel_readv_full(s->ioc, &iov, 1,
>                                        NULL, NULL,
> -                                     NULL);
> +                                     0, NULL);
>       }
>   
>       if (msgfds_num) {
> diff --git a/include/io/channel.h b/include/io/channel.h
> index c680ee7480..cbcde4b88f 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -34,6 +34,8 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
>   
>   #define QIO_CHANNEL_WRITE_FLAG_ZERO_COPY 0x1
>   
> +#define QIO_CHANNEL_READ_FLAG_MSG_PEEK 0x1
> +
>   typedef enum QIOChannelFeature QIOChannelFeature;
>   
>   enum QIOChannelFeature {
> @@ -41,6 +43,7 @@ enum QIOChannelFeature {
>       QIO_CHANNEL_FEATURE_SHUTDOWN,
>       QIO_CHANNEL_FEATURE_LISTEN,
>       QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY,
> +    QIO_CHANNEL_FEATURE_READ_MSG_PEEK,
>   };
>   
>   
> @@ -114,6 +117,7 @@ struct QIOChannelClass {
>                           size_t niov,
>                           int **fds,
>                           size_t *nfds,
> +                        int flags,
>                           Error **errp);
>       int (*io_close)(QIOChannel *ioc,
>                       Error **errp);
> @@ -188,6 +192,7 @@ void qio_channel_set_name(QIOChannel *ioc,
>    * @niov: the length of the @iov array
>    * @fds: pointer to an array that will received file handles
>    * @nfds: pointer filled with number of elements in @fds on return
> + * @flags: read flags (QIO_CHANNEL_READ_FLAG_*)
>    * @errp: pointer to a NULL-initialized error object
>    *
>    * Read data from the IO channel, storing it in the
> @@ -224,6 +229,7 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
>                                  size_t niov,
>                                  int **fds,
>                                  size_t *nfds,
> +                               int flags,
>                                  Error **errp);
>   
>   
> @@ -300,6 +306,34 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>                                 size_t niov,
>                                 Error **errp);
>   
> +/**
> + * qio_channel_readv_peek_all_eof:
> + * @ioc: the channel object
> + * @iov: the array of memory regions to read data into
> + * @niov: the length of the @iov array
> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Read data from the peek of IO channel without
> + * actually removing it from channel buffer, storing
> + * it in the memory regions referenced by @iov. Each
> + * element in the @iov will be fully populated with
> + * data before the next one is used. The @niov
> + * parameter specifies the total number of elements
> + * in @iov.
> + *
> + * The function will wait for all requested data
> + * to be read, yielding from the current coroutine
> + * if required.
> + *
> + * Returns: 1 if all bytes were read, 0 if end-of-file
> + *          occurs without data, or -1 on error
> + */
> +int qio_channel_readv_peek_all_eof(QIOChannel *ioc,
> +                                   const struct iovec *iov,
> +                                   size_t niov,
> +                                   Error **errp);
> +
> +
>   /**
>    * qio_channel_readv_all:
>    * @ioc: the channel object
> @@ -328,6 +362,34 @@ int qio_channel_readv_all(QIOChannel *ioc,
>                             Error **errp);
>   
>   
> +/**
> + * qio_channel_readv_peek_all:
> + * @ioc: the channel object
> + * @iov: the array of memory regions to read data into
> + * @niov: the length of the @iov array
> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Read data from the the peek of IO channel without
> + * removing from channel buffer, storing it in the
> + * memory regions referenced by @iov. Each element
> + * in the @iov will be fully populated with data
> + * before the next one is used. The @niov parameter
> + * specifies the total number of elements in @iov.
> + *
> + * The function will wait for all requested data
> + * to be read, yielding from the current coroutine
> + * if required.
> + *
> + * If end-of-file occurs before all requested data
> + * has been read, an error will be reported.
> + *
> + * Returns: 0 if all bytes were read, or -1 on error
> + */
> +int qio_channel_readv_peek_all(QIOChannel *ioc,
> +                               const struct iovec *iov,
> +                               size_t niov,
> +                               Error **errp);
> +
>   /**
>    * qio_channel_writev_all:
>    * @ioc: the channel object
> @@ -456,6 +518,27 @@ int qio_channel_read_all(QIOChannel *ioc,
>                            size_t buflen,
>                            Error **errp);
>   
> +/**
> + * qio_channel_read_peek_all:
> + * @ioc: the channel object
> + * @buf: the memory region to read data into
> + * @buflen: the number of bytes to @buf
> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Reads @buflen bytes from the peek of channel into @buf without
> + * removing it from channel buffer, possibly blocking or (if the
> + * channel is non-blocking) yielding from the current coroutine
> + * multiple times until the entire content is read. If end-of-file
> + * occurs it will return an error rather than a short-read. Otherwise
> + * behaves as qio_channel_read().
> + *
> + * Returns: 0 if all bytes were read, or -1 on error
> + */
> +int qio_channel_read_peek_all(QIOChannel *ioc,
> +                              const char *buf,
> +                              size_t buflen,
> +                              Error **errp);
> +
>   /**
>    * qio_channel_write_all:
>    * @ioc: the channel object
> diff --git a/io/channel-buffer.c b/io/channel-buffer.c
> index bf52011be2..8096180f85 100644
> --- a/io/channel-buffer.c
> +++ b/io/channel-buffer.c
> @@ -54,6 +54,7 @@ static ssize_t qio_channel_buffer_readv(QIOChannel *ioc,
>                                           size_t niov,
>                                           int **fds,
>                                           size_t *nfds,
> +                                        int flags,
>                                           Error **errp)
>   {
>       QIOChannelBuffer *bioc = QIO_CHANNEL_BUFFER(ioc);
> diff --git a/io/channel-command.c b/io/channel-command.c
> index 74516252ba..e7edd091af 100644
> --- a/io/channel-command.c
> +++ b/io/channel-command.c
> @@ -203,6 +203,7 @@ static ssize_t qio_channel_command_readv(QIOChannel *ioc,
>                                            size_t niov,
>                                            int **fds,
>                                            size_t *nfds,
> +                                         int flags,
>                                            Error **errp)
>   {
>       QIOChannelCommand *cioc = QIO_CHANNEL_COMMAND(ioc);
> diff --git a/io/channel-file.c b/io/channel-file.c
> index b67687c2aa..d76663e6ae 100644
> --- a/io/channel-file.c
> +++ b/io/channel-file.c
> @@ -86,6 +86,7 @@ static ssize_t qio_channel_file_readv(QIOChannel *ioc,
>                                         size_t niov,
>                                         int **fds,
>                                         size_t *nfds,
> +                                      int flags,
>                                         Error **errp)
>   {
>       QIOChannelFile *fioc = QIO_CHANNEL_FILE(ioc);
> diff --git a/io/channel-null.c b/io/channel-null.c
> index 75e3781507..4fafdb770d 100644
> --- a/io/channel-null.c
> +++ b/io/channel-null.c
> @@ -60,6 +60,7 @@ qio_channel_null_readv(QIOChannel *ioc,
>                          size_t niov,
>                          int **fds G_GNUC_UNUSED,
>                          size_t *nfds G_GNUC_UNUSED,
> +                       int flags,
>                          Error **errp)
>   {
>       QIOChannelNull *nioc = QIO_CHANNEL_NULL(ioc);
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index b76dca9cc1..a06b24766d 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -406,6 +406,8 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
>       }
>   #endif /* WIN32 */
>   
> +    qio_channel_set_feature(QIO_CHANNEL(cioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
> +
>       trace_qio_channel_socket_accept_complete(ioc, cioc, cioc->fd);
>       return cioc;
>   
> @@ -496,6 +498,7 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
>                                           size_t niov,
>                                           int **fds,
>                                           size_t *nfds,
> +                                        int flags,
>                                           Error **errp)
>   {
>       QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> @@ -517,6 +520,10 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
>   
>       }
>   
> +    if (flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) {
> +        sflags |= MSG_PEEK;
> +    }
> +
>    retry:
>       ret = recvmsg(sioc->fd, &msg, sflags);
>       if (ret < 0) {
> @@ -624,11 +631,17 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
>                                           size_t niov,
>                                           int **fds,
>                                           size_t *nfds,
> +                                        int flags,
>                                           Error **errp)
>   {
>       QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
>       ssize_t done = 0;
>       ssize_t i;
> +    int sflags = 0;
> +
> +    if (flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) {
> +        sflags |= MSG_PEEK;
> +    }
>   
>       for (i = 0; i < niov; i++) {
>           ssize_t ret;
> @@ -636,7 +649,7 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
>           ret = recv(sioc->fd,
>                      iov[i].iov_base,
>                      iov[i].iov_len,
> -                   0);
> +                   sflags);
>           if (ret < 0) {
>               if (errno == EAGAIN) {
>                   if (done) {
> @@ -705,7 +718,6 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>   }
>   #endif /* WIN32 */
>   
> -
>   #ifdef QEMU_MSG_ZEROCOPY
>   static int qio_channel_socket_flush(QIOChannel *ioc,
>                                       Error **errp)
> diff --git a/io/channel-tls.c b/io/channel-tls.c
> index 4ce890a538..c730cb8ec5 100644
> --- a/io/channel-tls.c
> +++ b/io/channel-tls.c
> @@ -260,6 +260,7 @@ static ssize_t qio_channel_tls_readv(QIOChannel *ioc,
>                                        size_t niov,
>                                        int **fds,
>                                        size_t *nfds,
> +                                     int flags,
>                                        Error **errp)
>   {
>       QIOChannelTLS *tioc = QIO_CHANNEL_TLS(ioc);
> diff --git a/io/channel-websock.c b/io/channel-websock.c
> index fb4932ade7..a12acc27cf 100644
> --- a/io/channel-websock.c
> +++ b/io/channel-websock.c
> @@ -1081,6 +1081,7 @@ static ssize_t qio_channel_websock_readv(QIOChannel *ioc,
>                                            size_t niov,
>                                            int **fds,
>                                            size_t *nfds,
> +                                         int flags,
>                                            Error **errp)
>   {
>       QIOChannelWebsock *wioc = QIO_CHANNEL_WEBSOCK(ioc);
> diff --git a/io/channel.c b/io/channel.c
> index 0640941ac5..23c8752918 100644
> --- a/io/channel.c
> +++ b/io/channel.c
> @@ -52,6 +52,7 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
>                                  size_t niov,
>                                  int **fds,
>                                  size_t *nfds,
> +                               int flags,
>                                  Error **errp)
>   {
>       QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> @@ -63,7 +64,14 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
>           return -1;
>       }
>   
> -    return klass->io_readv(ioc, iov, niov, fds, nfds, errp);
> +    if ((flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) &&
> +        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEEK)) {
> +        error_setg_errno(errp, EINVAL,
> +                         "Channel does not support peek read");
> +        return -1;
> +    }
> +
> +    return klass->io_readv(ioc, iov, niov, fds, nfds, flags, errp);
>   }
>   
>   
> @@ -109,6 +117,37 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>       return qio_channel_readv_full_all_eof(ioc, iov, niov, NULL, NULL, errp);
>   }
>   
> +int qio_channel_readv_peek_all_eof(QIOChannel *ioc,
> +                                   const struct iovec *iov,
> +                                   size_t niov,
> +                                   Error **errp)
> +{
> +   ssize_t len = 0;
> +   ssize_t total = iov_size(iov, niov);
> +
> +   while (len < total) {
> +       len = qio_channel_readv_full(ioc, iov, niov, NULL,
> +                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
> +
> +       if (len == QIO_CHANNEL_ERR_BLOCK) {
> +            if (qemu_in_coroutine()) {
> +                qio_channel_yield(ioc, G_IO_IN);
> +            } else {
> +                qio_channel_wait(ioc, G_IO_IN);
> +            }
> +            continue;
> +       }
> +       if (len == 0) {
> +           return 0;
> +       }
> +       if (len < 0) {
> +           return -1;
> +       }
> +   }
> +
> +   return 1;
> +}
> +
>   int qio_channel_readv_all(QIOChannel *ioc,
>                             const struct iovec *iov,
>                             size_t niov,
> @@ -117,6 +156,24 @@ int qio_channel_readv_all(QIOChannel *ioc,
>       return qio_channel_readv_full_all(ioc, iov, niov, NULL, NULL, errp);
>   }
>   
> +int qio_channel_readv_peek_all(QIOChannel *ioc,
> +                               const struct iovec *iov,
> +                               size_t niov,
> +                               Error **errp)
> +{
> +    int ret = qio_channel_readv_peek_all_eof(ioc, iov, niov, errp);
> +
> +    if (ret == 0) {
> +        error_setg(errp, "Unexpected end-of-file before all data were read");
> +        return -1;
> +    }
> +    if (ret == 1) {
> +        return 0;
> +    }
> +
> +    return ret;
> +}
> +
>   int qio_channel_readv_full_all_eof(QIOChannel *ioc,
>                                      const struct iovec *iov,
>                                      size_t niov,
> @@ -146,7 +203,7 @@ int qio_channel_readv_full_all_eof(QIOChannel *ioc,
>       while ((nlocal_iov > 0) || local_fds) {
>           ssize_t len;
>           len = qio_channel_readv_full(ioc, local_iov, nlocal_iov, local_fds,
> -                                     local_nfds, errp);
> +                                     local_nfds, 0, errp);
>           if (len == QIO_CHANNEL_ERR_BLOCK) {
>               if (qemu_in_coroutine()) {
>                   qio_channel_yield(ioc, G_IO_IN);
> @@ -284,7 +341,7 @@ ssize_t qio_channel_readv(QIOChannel *ioc,
>                             size_t niov,
>                             Error **errp)
>   {
> -    return qio_channel_readv_full(ioc, iov, niov, NULL, NULL, errp);
> +    return qio_channel_readv_full(ioc, iov, niov, NULL, NULL, 0, errp);
>   }
>   
>   
> @@ -303,7 +360,7 @@ ssize_t qio_channel_read(QIOChannel *ioc,
>                            Error **errp)
>   {
>       struct iovec iov = { .iov_base = buf, .iov_len = buflen };
> -    return qio_channel_readv_full(ioc, &iov, 1, NULL, NULL, errp);
> +    return qio_channel_readv_full(ioc, &iov, 1, NULL, NULL, 0, errp);
>   }
>   
>   
> @@ -336,6 +393,14 @@ int qio_channel_read_all(QIOChannel *ioc,
>       return qio_channel_readv_all(ioc, &iov, 1, errp);
>   }
>   
> +int qio_channel_read_peek_all(QIOChannel *ioc,
> +                              const char *buf,
> +                              size_t buflen,
> +                              Error **errp)
> +{
> +    struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
> +    return qio_channel_readv_peek_all(ioc, &iov, 1, errp);
> +}
>   
>   int qio_channel_write_all(QIOChannel *ioc,
>                             const char *buf,
> diff --git a/migration/channel-block.c b/migration/channel-block.c
> index c55c8c93ce..0b0deeb919 100644
> --- a/migration/channel-block.c
> +++ b/migration/channel-block.c
> @@ -53,6 +53,7 @@ qio_channel_block_readv(QIOChannel *ioc,
>                           size_t niov,
>                           int **fds,
>                           size_t *nfds,
> +                        int flags,
>                           Error **errp)
>   {
>       QIOChannelBlock *bioc = QIO_CHANNEL_BLOCK(ioc);
> diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
> index 196b78c00d..199227a556 100644
> --- a/scsi/qemu-pr-helper.c
> +++ b/scsi/qemu-pr-helper.c
> @@ -614,7 +614,7 @@ static int coroutine_fn prh_read(PRHelperClient *client, void *buf, int sz,
>           iov.iov_base = buf;
>           iov.iov_len = sz;
>           n_read = qio_channel_readv_full(QIO_CHANNEL(client->ioc), &iov, 1,
> -                                        &fds, &nfds, errp);
> +                                        &fds, &nfds, 0, errp);
>   
>           if (n_read == QIO_CHANNEL_ERR_BLOCK) {
>               qio_channel_yield(QIO_CHANNEL(client->ioc), G_IO_IN);
> diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
> index 2994d1cf42..3cf1acaf7d 100644
> --- a/tests/qtest/tpm-emu.c
> +++ b/tests/qtest/tpm-emu.c
> @@ -106,7 +106,7 @@ void *tpm_emu_ctrl_thread(void *data)
>           int *pfd = NULL;
>           size_t nfd = 0;
>   
> -        qio_channel_readv_full(ioc, &iov, 1, &pfd, &nfd, &error_abort);
> +        qio_channel_readv_full(ioc, &iov, 1, &pfd, &nfd, 0, &error_abort);
>           cmd = be32_to_cpu(cmd);
>           g_assert_cmpint(cmd, ==, CMD_SET_DATAFD);
>           g_assert_cmpint(nfd, ==, 1);
> diff --git a/tests/unit/test-io-channel-socket.c b/tests/unit/test-io-channel-socket.c
> index b36a5d972a..b964bb202d 100644
> --- a/tests/unit/test-io-channel-socket.c
> +++ b/tests/unit/test-io-channel-socket.c
> @@ -460,6 +460,7 @@ static void test_io_channel_unix_fd_pass(void)
>                              G_N_ELEMENTS(iorecv),
>                              &fdrecv,
>                              &nfdrecv,
> +                           0,
>                              &error_abort);
>   
>       g_assert(nfdrecv == G_N_ELEMENTS(fdsend));
> diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
> index 232984ace6..145eb17c08 100644
> --- a/util/vhost-user-server.c
> +++ b/util/vhost-user-server.c
> @@ -116,7 +116,7 @@ vu_message_read(VuDev *vu_dev, int conn_fd, VhostUserMsg *vmsg)
>            * qio_channel_readv_full may have short reads, keeping calling it
>            * until getting VHOST_USER_HDR_SIZE or 0 bytes in total
>            */
> -        rc = qio_channel_readv_full(ioc, &iov, 1, &fds, &nfds, &local_err);
> +        rc = qio_channel_readv_full(ioc, &iov, 1, &fds, &nfds, 0, &local_err);
>           if (rc < 0) {
>               if (rc == QIO_CHANNEL_ERR_BLOCK) {
>                   assert(local_err == NULL);


Sorry ignore this series, sent my mistake, there is another series tagged with V3.


