Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AE449DE60
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:47:27 +0100 (CET)
Received: from localhost ([::1]:51858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1NG-0000wE-9m
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:47:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD1He-0003PP-9z
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:41:38 -0500
Received: from mail-eopbgr70110.outbound.protection.outlook.com
 ([40.107.7.110]:47269 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD1HT-00018M-RR
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:41:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDfZMTjdLXKDFuGD+TbP0RmmiaufNcQUfhKR/dpVGzL10/4Zc8A00rzqJBZCt6CgV82ivHtt56jBavW5QWB2DdwbSVH+6yM5VR4Ld7CPgEFyZc9W6m7oHyPIqHO7D3zIKJrcB58hwxJJRzGOHLyKRuehHZ9NJgMSNj9f2OT9brgu5Va/38UtJsl8muGioZPNKW42sDedjyKj8XUfNV6mDkmuj7vT+BsJTWCKBT4YWmtBxiA783q8aaMZYWVHV7NIQBHdAKEzp5WeqOe6gyS+pruDKRAuP+DZNJEqHMRQpx0+ZGUO9NK7wxrAY0X24yuCc+O60bA4jIlcXw57IgkiGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyX/qFwhHFupcyShf3f/xiVffDDG9M5oXHJUiY/9c60=;
 b=NnIEwfzCg6HRNwTZB+9J41j5vNgvzwM+QNOOpZG1iGhFK/8hOC6tO3ETe0MU0OvxlPBpIuNJl7u5xXBSOsRwHFEXRBMLEx+oySJjrkvvAxRbj411hJxcRB5sb6dOrVH4AexE4eg/iQiTJPbhziPrFLwy79CJFWavtVMJJK0e93+YvREkA+MXT5b3cITWys8ZMMstPJ8uWzH6cvOQIWiPAzIA8F7Pr8HlYn+QKCvf/NvuJsbzLeI0gJCjAt9DAPgtig8I40ihRYTYFkoTvyfAfXT9AQr56dBinz5aXns7TDljdSLUNrXLNSsJ+QAdlzozHb+LDbSf37IkoSDbw49P9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyX/qFwhHFupcyShf3f/xiVffDDG9M5oXHJUiY/9c60=;
 b=vcFaclTs207DrppNbGUwJpgXNsfmWlaXXlAR1tBgdzIq+U1Ndwuat4WO9z/OaD4XVBh/H6svV8yMf/6JsQw004XZlVfHticPvMM4zOmb4WK1mJ1zE+70CfLVy0drG4oLFTFgTcISge7Hn02aYVEZxAAitWMyHEsNsYlVlysmF2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB4382.eurprd08.prod.outlook.com (2603:10a6:803:f5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Thu, 27 Jan
 2022 09:41:21 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 09:41:21 +0000
Message-ID: <7b974340-4f9c-274c-2218-6b379a557d2e@virtuozzo.com>
Date: Thu, 27 Jan 2022 12:41:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 0/7] trace qmp commands
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, michael.roth@amd.com,
 jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
References: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
 <87sft9vdkk.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <87sft9vdkk.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR05CA0001.eurprd05.prod.outlook.com (2603:10a6:205::14)
 To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d017f9f5-c169-4ff8-aaeb-08d9e1792d07
X-MS-TrafficTypeDiagnostic: VI1PR08MB4382:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB43829DBA0066CE7DD4BDB2F3C1219@VI1PR08MB4382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RC72Exb3Zc3EVXg1J07f12C5MWuxflEptRCsx16IfPqH5nRzDuOhsu5Xxw0e6kssxovInk53HtQKu2ngXA/yfmacTzwu8ZawCDAek1GxjYqazRBsArHtNwiSSoOY6+En0DAl4Bt0HJFHz3cEmsvLT1Uj/XgA1JhylUetNF7OsSuyrvZmldKodgi4hOR3dvhPkgDcCfrGp4QtEYM67QY+cRzDJuiif78+5vNSDXhUoCGPR3cxSUVU0g4tVjnx//ikxK1cPFvwbANeWufU8LAgW6gtkWtQvu2mGPilTBP1/5cxgfDhjyN5DPhggO4mg4Qw8ldy4UF0MD8wQ6OSSZqfInEz7vdj3qTemhiPEqjReSCdQrYwL7Gkyj2kIvdS5Y8ZqwLrFz79fp6CDyrmfoHcOnwcuy3nnlHIlyQJR5Zpg88mTJROMhcbGJ7qnS0ryObiZ5vAyrYeUbLH4IXAoi6hl5lumjl75qOIej6yxATGRl0lCuNA1KFFOIHy3ftjzDpiPRfQ7YZM4bjaK+1HrPQC5/yXx3Q32ej5vvqMtRA3z1D4gBQUsOer/cCgWxDJUugMOe25a54VSZ3kEAlQeMsd7PusgC6cKrD3nkT+oRSa1OyJQQrGXW3EOKTtWBOmpv0i955FS5HfYimAT5JPVpe+gIu9vsOOLHjryqyuNl9YUBrx0s0NxyEMqhvrlJAy0Ml93QUJtMw7ZWfAZJtovnRngM/Nukri3ImSvLvTgK7VzlRyd0BZeEFQFXoq25Q9fAN0IKvAMn1IyhEZN0+iM3SvoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(4326008)(6506007)(86362001)(4744005)(316002)(6916009)(36756003)(52116002)(66476007)(38100700002)(66556008)(38350700002)(2906002)(66946007)(5660300002)(6512007)(8936002)(31686004)(8676002)(31696002)(2616005)(6486002)(508600001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkNta1lUSUUzbHAxaEppalcwSzZYdDg3dmFleGNlZUdzV1B1MHBmMnBZb2hU?=
 =?utf-8?B?cXRqU0VQRG5kZW9BUlZpZ2lhZjhtQ1dmMm1SZ2xBeCs2RGVuNXBaQTVYWDBL?=
 =?utf-8?B?d1JvZHVydk90ZzhJcjVkUlM4eTZBNGJTdXFUL0s3OXZTRlEzMkorWDJoWlFl?=
 =?utf-8?B?MTJTVXphcFpvanlNVEZyQm01bVlNdVIyQnBCWkxlM0c1Ni96Q3FqWDVWaEFk?=
 =?utf-8?B?R1k1cTNOOExnalREUHp5ekJBN3Jlbzkzbzh0Z2NiaGRkNTRRRjlqL1UrSTBX?=
 =?utf-8?B?NjhnWExCeFJ6V2JRYjhKZWh5c3dncGhRaFFWVUIvRTdzakJOK01jdHV3U3hQ?=
 =?utf-8?B?a1ZzZ2tBdGx5b2VmR0NPcFdraEZNSW1QYWRlZzE2TFcvdTljMGNmZnFSUWlS?=
 =?utf-8?B?TDc3ZmZwdHN4S2RTeGdVTTBxWDMrVUkzVGo2dFZYaG50bVZiL08wY092cGNL?=
 =?utf-8?B?YzM5b0h1bGk4MnlMRzhHcDcwVWVpRTI4MGNzUVNKcTg2UTJRZ1I0N3VGbDJl?=
 =?utf-8?B?TkxGR2xqMHltNk0vZ3lFNktjMkRZc1IrZ3BFKzhzYjNhVGFzRlZzeWsyaWVa?=
 =?utf-8?B?RzMvRzcwT1Fjd09GeHNmYVlqQkkwdGFqSWdMb0tNTUY1Vmd1STZFaW9uRjEy?=
 =?utf-8?B?SlBvNGxiQ0JySDZaN2NQOTR2aCtyVFZmSy95NVZ4M1FJdWlOQTEzZTMwV21L?=
 =?utf-8?B?Y1JMdTNBMHAySEUvWnNWczU4K0pEMW1oeGFDOTRWM2h6azF0S0dGU1ZlckZK?=
 =?utf-8?B?NiszZEFTTHVtZmpzZkllekpTT3hQU0NTNmRqUVhscm9pLytKUzRSSVZHeDAr?=
 =?utf-8?B?YXcxR0QzaDRaWXB4b1NEanVFMUFEdHhZZ3dUbWdOV2JGb3BFem8wOHMzRncx?=
 =?utf-8?B?SDMvaVNXNGVZOUlyZ1E1TUk0MTg1MUdhKzFQcnYzSTUvOEJ0VjdIUHpkSWEv?=
 =?utf-8?B?QzRyNWZkT2ZUeEoxTDY3VUw1WUk0U0Z0ckcxSDIxdUFPQ0hhejhXVXM4TXdt?=
 =?utf-8?B?dDVLNjJaTW5zVkltL2ZnZ3AraFNNS2c5NFVnTFhXMVB2bUxLT2p0dXBnR2hL?=
 =?utf-8?B?YmY4anFWM3NxU3l6OTJIWFR6dG1xeHF5YjhQQWFBWVU5RDExaFBQdis1bmNF?=
 =?utf-8?B?Tlp6Yy82WXd1bkNjdkVIMm5Od3BURUZUM0k4VTF3WmJnOXVnMWVKVUs1ZjVj?=
 =?utf-8?B?em9kbmFFMW1rY3ZFWCt0SHNkUzVLelVOSmp4ZjEzS0VsV1EyQ2t5UVprM2lu?=
 =?utf-8?B?UDlWdkZuU3NEVjhxL0RraDNQbzM4MFdySjRIbmw1K2ZQVEo4UG1FcDFWMXJE?=
 =?utf-8?B?b1REcVRUcmpaTmVQYVlmS20yMFF3LzdaaS9sWEplR3AvUEpQUERQci9sdzdG?=
 =?utf-8?B?cUZqekgxWUNyUWdWcjM2bktLRXVoZ25wOTg4SjJta3JseXZBME1kTHlOd2J0?=
 =?utf-8?B?aW9QVEhBL0RsMnlUL3ZnVXVudjFNNjVOQzRKajYycWVBT0dlTmFaTitFd3FQ?=
 =?utf-8?B?NTViTW01WVVlZVp1L0lTd2JISmpaT3lZYXBxbjhEQmVmTVY3M1JiVlRpNUlJ?=
 =?utf-8?B?aUZlelU3UlpWQ1krN3grZFB5THZKdjgxc1U3d0Q2bmJLVWxsUVdlL1FSZFhL?=
 =?utf-8?B?WUNqSzNNQkRkVHpRNkJzeDVXc1FML0tCQ1BvcWR0eVJnY3ZhRzczRXFTekZE?=
 =?utf-8?B?dzFjcjAxK0Uxejg0YUFmM0NGUjBMOWlIQVE2TjU1MVBieU5LaW1NMzZlTzA4?=
 =?utf-8?B?WVpIVDRlZWdBQU1kZjZyN0taVFVlSXhqYnNsVXBiaU4vQ3Z2dDRSangzS2Z1?=
 =?utf-8?B?ZHRtYWJkR1cwRXA3UVlnWDQwcS9Fbmg2N25Cc0hkL0hjNmxRVGxqRUlDemx6?=
 =?utf-8?B?Z1FuRHd3bWRKSDBsSUdDcUZiQ004N0xjM0hwVyt5T2dUR2hkVWNadDFVZFA5?=
 =?utf-8?B?OHdUN1JGdzdCT2JpV1FxQWxzT0IrRE52ZldBYVJRSTl4dkp0U2JHWW1USG1F?=
 =?utf-8?B?T3VkS0hkeEpmQ1NjcnFDNTlVeFMwbmxwRXZJa0l0L0IvVXZrQVUyNXZwVG9Q?=
 =?utf-8?B?MUU4VEt6VHFpLzFGRjJDaWc2SVc3aklRRWdQSGFHMFcwSXRZeDhtc1RNNDBx?=
 =?utf-8?B?TWRkK2hKVVYrempNMUZvNnRyTmhadTlodU1WcDhnR1FjVHhmcFoxQVpEZld4?=
 =?utf-8?B?LzQ4NFg2V2FRT2xWa0VITEo4YjJ4VlhOWmpXMjcxc1dHTFJ1TW4waHBLSENY?=
 =?utf-8?Q?Xk95kR2q4TMw8ocfpDWkfznuyzPaeSu2MIy6SgkbrE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d017f9f5-c169-4ff8-aaeb-08d9e1792d07
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:41:21.3967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dzJiFCLU3Q2LK/GVEe2PjuvwjXHsQ9v4E8PKgURkLKOKa3uPFRFNIUn2bI3dE73VWRPtJ+0A7doMIy/ve2tHDLLEsCtnWdlPC7SYAnRzow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4382
Received-SPF: pass client-ip=40.107.7.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

27.01.2022 10:32, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> This series aims to add trace points for each qmp command with help of
>> qapi code generator.
> 
> Logging QMP traffic has worked well enough for me, but I can understand
> why you'd like to use tracing.  Other uses of tracing might come up in
> the future.
> 
> I found a few last nits to pick.  Happy to address them in my tree.

That would be great, thanks a lot!

> 
> Except for PATCH 4

It has "Acked-by: Paolo", so seems we are done.

> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 

Thanks!

-- 
Best regards,
Vladimir

