Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401EB65D0F6
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 11:54:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD1Np-00044Q-HF; Wed, 04 Jan 2023 05:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1pD1Nn-000444-8A
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 05:52:31 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1pD1Nk-0003uv-Io
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 05:52:31 -0500
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3044M9O8010633; Wed, 4 Jan 2023 02:52:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=Vcq7Poh6CMCoZW6U40T8LokHGMep+He3H9nA0Lrjvmw=;
 b=Du27D8lOhMsaT9AITslJ21Wse/EIeeJAxgdyT2WQ6OHXBfK+mmwh6/+4VHjy8xNrwvUy
 w80tmILiR8BV8tTz8hlKsbzs9dkbVzw99SBI4yHtJs9c0g0KwYTsJgnAuHQ3jzX1yKWx
 bSavAGoq9scuve7CBLVqOaSpygrCQyirinYHNZhe+uEmmPYyth0feytox1vgk6E+UyPp
 2R/ZxEzlMb8hUsq52tZlTpuFY6WKl6ThyPwR7wIcyeIhqW8Hqj/R/Ye3OXt++Bu+/lgp
 rlTzA6zSnpaIxABS0poTpTlTOl5fdnF1z5qfvYje4TkN3XGqj3kcjSspDpYjS4RTS66j Ww== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3mtm2pwkav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Jan 2023 02:52:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpXdK+RiGXVOYUlcE24TE57PdAPP5gGGucK9XNxqU0ULgk54YoZ/HiGBVo4UEVrpLA5DhVKhfkaA150Ygy7kOUnWjOPODKaQw4VyEC6WajMzu9q2hL2qZCExPqDDlh3SCQgVqyFU7y2fkw/YS+tlUV3ggQUbTP/iTxSdV24Zz8etdnUL6Zp0ridq9JJq2jzNTA6ijZBM3RQJ2PHtg+s0+AVE0JEvgFxgBMUSHZgAnmBql/nhKqwJ6pbKnqJuQnRfTmDejPmQu5Hs2ECm7hR9iISeQIyyc0jvDcmEYOM+2Cw5Czzg6oZQG6fdpTlIqW/UKD6GNZyTysFwTYKZFxMyWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vcq7Poh6CMCoZW6U40T8LokHGMep+He3H9nA0Lrjvmw=;
 b=OzmSEtN9ryh/rBkM483q6AAuYFqLmlUGouD2ZtW/fL4umxVzfrNjG4w1VRbManWKtm+uLrhQj9xA2JvKNR8u2qK2+lX9Gahoukb7qZJNesNrzYP3SqHQKCWq4A6B/3BZ3by7GhQBvtUeKUBRBm0K7KjjorHu4ePWHE/Cnw28U+5prBdrjH5CnV1PddxttOaq3yngTgVZVl1DIQIeibqWhQNaxwuxrJlA6TwfzvZEjpdS2ZtEDjuaLQDSsxfJD+/T4/Mij5dGNu6qe0pATigXbxlFLPcAnPB8q3pWRnONBV7Mz8CxQsaH6p/ec2CYmLOI5yS6LuUcfRJuPvDDYhgM9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vcq7Poh6CMCoZW6U40T8LokHGMep+He3H9nA0Lrjvmw=;
 b=iPuHzcYcW8W6kopsSFiFloHGKMH3M/qmxXIu+eBiULlvnrR6DHgrRqr2rSwbZx4z/UZBInQbzlqj9AezmMwdCBcZs52r+EpaFrPcxdVzMtlV83kMKUtMv93mwGNVPzYVr+nU6vPtWFzFcWeOfjZIJ6kEzd10YJJWGD70PNuLs/Um/xshtVeZWg3oZ/0EKoiuTm0vMS6qJEGgutcwXCisr5pa2LDslYeGpFsc2oi5lJn/XyYPDM4n9KIQU9XMP0aSZLwanYi2fa8Taa6ksmfwnelKMkZLytzdE+hgDU7B/3lKpyrzb7oDU6il3zHY4nIEv4ntGzVFPSl2zovR1h7VOg==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DM8PR02MB7958.namprd02.prod.outlook.com (2603:10b6:8:13::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 10:52:21 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 10:52:21 +0000
Content-Type: multipart/alternative;
 boundary="------------W9kY5vjy1hgnqT9kl55QfaMG"
Message-ID: <f1f1cd0f-a887-57f9-5762-7f7e638941eb@nutanix.com>
Date: Wed, 4 Jan 2023 16:22:10 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 0/2] check magic value for deciding the mapping of
 channels
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
References: <20221220184418.228834-1-manish.mishra@nutanix.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <20221220184418.228834-1-manish.mishra@nutanix.com>
X-ClientProxiedBy: MA0PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::19) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|DM8PR02MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0f4776-249b-40a6-a830-08daee41c172
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CWhl5K2DGgh8AapFcD+xXXlVZaE5iDqDf6duayhoRnyNnGBXLvjGrXXriMdMso8gjz1QVdlCxrjBb8sRHF0m/Dt8KYqdWCsDiiakqJCGhEFviFa0kidfZUjtckCikjKm8vDiZjUvb9GSjz545NcZSah8oQiiwCspV7XSON53nQ4UY+T1BhXjYvIlbV+bNPSHd5oI63eh5srQjzuaa7RH0Ap4YRViFHhjYyTvM+Qqr6yQIWWJ+zKzu6XYOb8nvwOvmcR4epWrIogtTqu4nEgl4GcdpMoYpf3AedKKEmu4qfyIHoSlFZ1WxKvNHFnELS8MkkOEmd+SFSShaOhE0nK1077xgl9Sa8Opeht8DUC+xVHGXYUsZYbTpQAlExAk6oNGO9bJsKHvUKGy4KJQY/MbN9xp7qjTijSfQyFzw8TBhxR7j06XVNAGJQkoSfbV1w/t7X519Mb4jOyH2ASgtnNttXrmyeHle9yd3Ud6wJ6N0vJEkkV0AfPEZKpg+Tp+v2YBzeQzwTw2fb6U3d5XyS61QNXZNG8Qle/G16C6Er30ZvSt8nvipVUZGIyBKfC8zW96QghaG2el5Ynnv+EnLgS7q3cuuracWDov1IWNNswW8ZBZDOcO9YRzkcjLGTw1eHujLT6lSBJZW+L6OT1axMU6NWekr3Rl3hfyWh0r1Z0uJq8v3yT/BPNnwKDSGagODkmL6kEDY/JYG59Nz7amyrk7eI9lmT7CbFO9rupsTKKHkzI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199015)(6512007)(53546011)(26005)(6666004)(186003)(6506007)(2906002)(478600001)(33964004)(6486002)(31686004)(66946007)(66476007)(66556008)(2616005)(4326008)(8676002)(41300700001)(316002)(83380400001)(5660300002)(38100700002)(6916009)(8936002)(36756003)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHpHeXk0ZURFdFUyd3cvbkRXSk1mVEdVdFpvdHdLMTh6MmZEVWR2RHEwRml4?=
 =?utf-8?B?N1dnVThCUWwyK2YxZSs1Zzgxbnd2TDFoc0pzNjJQWEdDRUxnbTJxMmdTQ1NE?=
 =?utf-8?B?cmpxM2FPZmwvYlpwdlFudmQ4cXdINkFXanBvd3ZNS1RmU0FCK1BiMzVhRVpz?=
 =?utf-8?B?VmNONStyVTJJSGJjdThobEdPYkpCa3BSeHZFQ3U1R1hOUmcvK25WeFBZV1lH?=
 =?utf-8?B?RmJoRXVlL1RvdEJQeWFES0lYWWF6d0lUb29lSk1QaGJwdHIrZDBVNWJnMHh4?=
 =?utf-8?B?RU1yTWp6cUFsSzFDTExvejZ6emhaYUlxT0ZidEQzUkxWNEgrbWlZZFJqa25j?=
 =?utf-8?B?RDBxVEVRSVBlODBJTmJCd1Z1ZlVWQlIxeklFL0c2S3ZzdjVST1hHTnUzOWRu?=
 =?utf-8?B?cFo3V1A2VkZwMUZwa20zTGtGckZEM2N5Slc0WVVzZGdNOEJONy9CQ01VZVNV?=
 =?utf-8?B?cllrOWdkWGdQWnJZNnF3TE5yTzhIb01aZ0pyakhXMUNuMDR1ZHBYUUNrcjZu?=
 =?utf-8?B?WWRkaUVZU1c3ajRqVzR2SHJMYldPeW83Q2c5UUIyQVJ4TVM5NVlBU083cGp6?=
 =?utf-8?B?MW1qUjN0c0hyVjBhN3c3VXJ0Rjk4cm1FdWpLVzg1aTZpVFl0L3l6UVRPTjU5?=
 =?utf-8?B?NmszbGUvNXRYWTlwMFJveVhNR0JEb3RpZ0dBTFVLMklRSkZ5Qk94czdQaHNu?=
 =?utf-8?B?MERUY0dpOEhUMXc0b1owYXErZkNLb3FqL3Y3M3lMU3FtNTVCWFQ4UGdXa1Ar?=
 =?utf-8?B?L3Z1QjVlcmtWbWhwMnp5RnE1VkE2UHVXSGp5U01xbkVKU0h2ZFpGbmRvanhi?=
 =?utf-8?B?azVuYm9vTG4yemJNSVRweFp2Vm4vbVgwdm9aemllKzhxcENoRFFWNVNoYlM2?=
 =?utf-8?B?ZlpwQUtFNHUwczlEU3Z3NTM0RnRxSzJGQTF6TnJjQU5tdzdNQVVxU2VZSnlq?=
 =?utf-8?B?YmZYRzVQUGszTnRDWFN1UXJJSllTSTJ4cEJIbVc0N2E1aitCbGpjaU1MRytt?=
 =?utf-8?B?VTY4T3V1WjdJbU9iZUQycVpSTG5Gdzdjc01idG95VU5LUEpNTmFXdW5RVXpY?=
 =?utf-8?B?aUdUUFRGQytQNUtiSnJKK2pydlMxTXFjNkozQUErVytBM0R2Qld3ZlNvcUht?=
 =?utf-8?B?d25STE43dmdha1NrUDVwZ3JGamJWVTFENVcwRGEzMjlLaW9NSllFSHhjemxt?=
 =?utf-8?B?NFZnWG83ZWxsUmxaVTA3QzBYTEtZQzRvUVFTbnkrV0ZrRnpVRThWVlJnOWh5?=
 =?utf-8?B?aisvWkRmbWk0ZS9zTHI2NjFvNDF6THNnQkVTOEpTR3NjUjR1S3RMMnR5TXBw?=
 =?utf-8?B?QzZwMTJWZmtXQ2Q4bk10ajl5THpydnkvT1Z5L3NsQ0xDeWhuRUpRM3UvVXR1?=
 =?utf-8?B?K2hsanRvU0wrQmVZZExOV0FPdXRHMkhCSHhaT2E3NmdxWEhzcDVUWVJOS1pr?=
 =?utf-8?B?ZGFLdUMyYkZjTHk1c0ZtWmdFN01rQ3IvUzREdlZ1RkV1bUZHdWVKYnVmVkpy?=
 =?utf-8?B?NWFHWVRnc003amQvcW1Md2lHRlBYd3g2Z1R2Ujk3WGJyekJxeHkxdDZPTXhC?=
 =?utf-8?B?eC9IbVJYK25kWWpocnYrY3JCaldDdzJNOUorMW5LdVBUbHg3RGtaQkFXK251?=
 =?utf-8?B?cEo3WjVnZVJzTmMwY05qWnhxbUdUK2hSYTNzZVJaQTl5NVBVV1pCZVRSa2Fp?=
 =?utf-8?B?Z1dTQmJFLzdKRnZGb1JQUU9UcWpxcGNxT2NrbExQYVdBNkYvdXdXMUw3TjBu?=
 =?utf-8?B?NlI4MTdIZUR1STJ0dUJvV3dOejJlWjVoYzZGTVMyOHFMQnRPTWVOT256bjhs?=
 =?utf-8?B?eURtV2VXNW9zMUd0RDRIc3Rzb1Z3cGJpcURKWGZCNWFNbThudy9JS0FhV2ZF?=
 =?utf-8?B?Mkd2ZmdJNWJNNm5LQ1g4MmZnSXowMWdBbDM3T1FPekhkSlg3K2lWa294TTZD?=
 =?utf-8?B?TUZPMVVkMUNxWjNCTkplb09YNEVTQ3k2TXJvcDRtZ0YwdGY0UldoeE5ZL3By?=
 =?utf-8?B?cVEwYUUyMGRSYXBMUGZyYXp4dUlmSXoraWozME84Vm5Hb2FjbDN1N2dzUExr?=
 =?utf-8?B?M0lEMEhpN0pxQWRLcDdNdUcxV05PL1lhWEJQN1J5Sk4rbDlOenVwSUp6QWZL?=
 =?utf-8?B?akk3VGY3d1ZpMG16ZmduSWJSclZGbU0xdS9DOGlnUkRJQ3JYSmtWa3FsS0J5?=
 =?utf-8?B?c2c9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0f4776-249b-40a6-a830-08daee41c172
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 10:52:21.5585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIk4VQTKZxQcMWvH5iZE+gZ0/Xa9pHz6m7vNl++q7NF2Avb2ja/krIk8ieslg/CbS0H8GPZkV7FXX+aDNbd11JEOdPGRMvh0wXiqvL5Zt/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB7958
X-Proofpoint-GUID: gpW1yB1JXHcu0Xq336n2bXBLH2DGbUhr
X-Proofpoint-ORIG-GUID: gpW1yB1JXHcu0Xq336n2bXBLH2DGbUhr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_06,2023-01-04_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-3.103, SPF_HELO_NONE=0.001,
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

--------------W9kY5vjy1hgnqT9kl55QfaMG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Everyone,

I was just checking if it was not missed in holidays and was received. :)

Thanks

Manish Mishra

On 21/12/22 12:14 am, manish.mishra wrote:
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
> v2:
>    TLS does not support MSG_PEEK, so V1 was broken for tls live
>    migrations. For tls live migration, while initializing main channel
>    tls handshake is done before we can create other channels, so this
>    issue is not possible for tls live migrations. In V2 added a check
>    to avoid checking magic number for tls live migration and fallback
>    to older method to decide mapping of channels on destination side.
>
> v3:
>    1. Split change in two patches, io patch for read_peek routines,
>       migration patch for migration related changes.
>    2. Add flags to io_readv calls to get extra read flags like
>       MSG_PEEK.
>    3. Some other minor fixes.
>
> v4:
>    1. Removed common *all_eof routines for read peek and added one
>       specific to live migration.
>    2. Updated to use qemu_co_sleep_ns instead of qio_channel_yield.
>    3. Some other minor fixes.
>
> v5:
>    1. Handle busy-wait in migration_channel_read_peek due partial reads.
>
> v6:
>    With earlier patch, multifd_load_setup was done only in
>    migration_incoming_setup but if multifd channel is received before
>    default channel, multifd channels will be uninitialized. Moved
>    multifd_load_setup to migration_ioc_process_incoming.
>    
>
> manish.mishra (2):
>    io: Add support for MSG_PEEK for socket channel
>    migration: check magic value for deciding the mapping of channels
>
>   chardev/char-socket.c               |  4 +--
>   include/io/channel.h                |  6 ++++
>   io/channel-buffer.c                 |  1 +
>   io/channel-command.c                |  1 +
>   io/channel-file.c                   |  1 +
>   io/channel-null.c                   |  1 +
>   io/channel-socket.c                 | 17 ++++++++-
>   io/channel-tls.c                    |  1 +
>   io/channel-websock.c                |  1 +
>   io/channel.c                        | 16 ++++++---
>   migration/channel-block.c           |  1 +
>   migration/channel.c                 | 45 ++++++++++++++++++++++++
>   migration/channel.h                 |  5 +++
>   migration/migration.c               | 54 ++++++++++++++++++++---------
>   migration/multifd.c                 | 19 +++++-----
>   migration/multifd.h                 |  2 +-
>   migration/postcopy-ram.c            |  5 +--
>   migration/postcopy-ram.h            |  2 +-
>   scsi/qemu-pr-helper.c               |  2 +-
>   tests/qtest/tpm-emu.c               |  2 +-
>   tests/unit/test-io-channel-socket.c |  1 +
>   util/vhost-user-server.c            |  2 +-
>   22 files changed, 148 insertions(+), 41 deletions(-)
>
--------------W9kY5vjy1hgnqT9kl55QfaMG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font size="2">Hi Everyone,</font></p>
    <p><font size="2">I was just checking if it was not missed in
        holidays and was received. :)</font></p>
    <p><font size="2">Thanks</font></p>
    <p><font size="2">Manish Mishra</font><br>
    </p>
    <div class="moz-cite-prefix">On 21/12/22 12:14 am, manish.mishra
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20221220184418.228834-1-manish.mishra@nutanix.com">
      <pre class="moz-quote-pre" wrap="">Current logic assumes that channel connections on the destination side are
always established in the same order as the source and the first one will
always be the main channel followed by the multifid or post-copy
preemption channel. This may not be always true, as even if a channel has a
connection established on the source side it can be in the pending state on
the destination side and a newer connection can be established first.
Basically causing out of order mapping of channels on the destination side.
Currently, all channels except post-copy preempt send a magic number, this
patch uses that magic number to decide the type of channel. This logic is
applicable only for precopy(multifd) live migration, as mentioned, the
post-copy preempt channel does not send any magic number. Also, tls live
migrations already does tls handshake before creating other channels, so
this issue is not possible with tls, hence this logic is avoided for tls
live migrations. This patch uses MSG_PEEK to check the magic number of
channels so that current data/control stream management remains
un-effected.

v2:
  TLS does not support MSG_PEEK, so V1 was broken for tls live
  migrations. For tls live migration, while initializing main channel
  tls handshake is done before we can create other channels, so this
  issue is not possible for tls live migrations. In V2 added a check
  to avoid checking magic number for tls live migration and fallback
  to older method to decide mapping of channels on destination side.

v3:
  1. Split change in two patches, io patch for read_peek routines,
     migration patch for migration related changes.
  2. Add flags to io_readv calls to get extra read flags like
     MSG_PEEK.
  3. Some other minor fixes.

v4:
  1. Removed common *all_eof routines for read peek and added one
     specific to live migration.
  2. Updated to use qemu_co_sleep_ns instead of qio_channel_yield.
  3. Some other minor fixes.

v5:
  1. Handle busy-wait in migration_channel_read_peek due partial reads.

v6:
  With earlier patch, multifd_load_setup was done only in
  migration_incoming_setup but if multifd channel is received before
  default channel, multifd channels will be uninitialized. Moved
  multifd_load_setup to migration_ioc_process_incoming.
  

manish.mishra (2):
  io: Add support for MSG_PEEK for socket channel
  migration: check magic value for deciding the mapping of channels

 chardev/char-socket.c               |  4 +--
 include/io/channel.h                |  6 ++++
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-null.c                   |  1 +
 io/channel-socket.c                 | 17 ++++++++-
 io/channel-tls.c                    |  1 +
 io/channel-websock.c                |  1 +
 io/channel.c                        | 16 ++++++---
 migration/channel-block.c           |  1 +
 migration/channel.c                 | 45 ++++++++++++++++++++++++
 migration/channel.h                 |  5 +++
 migration/migration.c               | 54 ++++++++++++++++++++---------
 migration/multifd.c                 | 19 +++++-----
 migration/multifd.h                 |  2 +-
 migration/postcopy-ram.c            |  5 +--
 migration/postcopy-ram.h            |  2 +-
 scsi/qemu-pr-helper.c               |  2 +-
 tests/qtest/tpm-emu.c               |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 util/vhost-user-server.c            |  2 +-
 22 files changed, 148 insertions(+), 41 deletions(-)

</pre>
    </blockquote>
  </body>
</html>

--------------W9kY5vjy1hgnqT9kl55QfaMG--

